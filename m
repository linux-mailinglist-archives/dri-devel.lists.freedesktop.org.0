Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACE1E31E3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 14:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574E76E32A;
	Thu, 24 Oct 2019 12:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6586C6E32B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 12:10:52 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q130so2184457wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 05:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=qm6MaFFOd7IZ24s/NUot8Yx+kOI9nuPZ71b2RZgYWvE=;
 b=SDfYKccOrYVJp4Nmeg+ieB9cWwAbG0jwH2l5QK7o8wErIYKAAClycJdJfvU8zKaV4d
 6hZbN4PMSuvzGNB2RRi/ZGR83Dmuv7ai7fPUwX54gW4x7R3V09fNJwk+skPYVdCI+9Eq
 mgCg6C2X+y2KAN9jhlnVDdK1d+NfEQr86W2oabfElbzALiRzmqeQ88/zXAwcDulbvHXX
 aq087jh/fBjIdkZz7sMOVM+u1t7C1KW3Ms99Kh8HA2YboqKVpng9bATUo283OBd1+5GH
 ZhNcubel7Vop0sL9DSjrKmeePNykwMkxXaaMAHwAjQIWJM9V2RK3ikQWSwA1gyuphpZC
 fgkw==
X-Gm-Message-State: APjAAAVRRe6x/cKmTmqNGR0IIju233q/f0oqw1z9xz2gCZdFPY1BYDpN
 Tar3DlbJlAb5ixpQuxgGsY/JgQ==
X-Google-Smtp-Source: APXvYqx2HhqaEtBXDkosGKPp83lO/Dzy4wDFshtgtjUqtmLu8R8iP5OaqPpWe4HU8GQp+iPG7ZFDtQ==
X-Received: by 2002:a1c:ed04:: with SMTP id l4mr4878676wmh.116.1571919050910; 
 Thu, 24 Oct 2019 05:10:50 -0700 (PDT)
Received: from dell ([95.149.164.99])
 by smtp.gmail.com with ESMTPSA id l6sm2395212wmg.2.2019.10.24.05.10.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Oct 2019 05:10:49 -0700 (PDT)
Date: Thu, 24 Oct 2019 13:10:47 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v7 0/9] backlight: gpio: simplify the driver
Message-ID: <20191024121047.GM15843@dell>
References: <20191022083630.28175-1-brgl@bgdev.pl>
 <CAMRc=MeyrDZgmHJ+2SMipP7y9NggxiVfkAh4kCLePFWvUku9aQ@mail.gmail.com>
 <20191023155941.q563d3cfizre4zvt@holly.lan>
 <20191024064726.GB15843@dell>
 <20191024071703.6keoebzlfnn2qmyd@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024071703.6keoebzlfnn2qmyd@uno.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=qm6MaFFOd7IZ24s/NUot8Yx+kOI9nuPZ71b2RZgYWvE=;
 b=DPS127uU+ChceB17ZJLKDaQE07GYeDdDlytghRl6kNeHX32NLBx3xYIg9wQLCbzuNC
 Mi/+REdC49GFr4gcHVCDBKKU80/ZswNznpFOwZbAmTjcGo2gBbXY4beaepmwpNvY9ZXb
 /w4+/6+sumngs4e+C9YnRYkXs8lxEhqkPkgn35bX43WzmxTbvAtsh/XU0jbciulqHf6X
 gB6oeEC4HGaRLc6h5pmoVQWjvXqyzq2rPaRx9Ksl0WslbkiGzHBZ9XCuK6me0zAreoeB
 Pubu5eH//tvBTIc6z8zQ7qL5oUAlAfF06KxgMetKE8cDfZe5eMG9X7zruZZrKY56baqs
 Vw6g==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNCBPY3QgMjAxOSwgSmFjb3BvIE1vbmRpIHdyb3RlOgo+IE9uIFRodSwgT2N0IDI0
LCAyMDE5IGF0IDA3OjQ3OjI2QU0gKzAxMDAsIExlZSBKb25lcyB3cm90ZToKPiA+IE9uIFdlZCwg
MjMgT2N0IDIwMTksIERhbmllbCBUaG9tcHNvbiB3cm90ZToKClsuLi5dCgo+ID4gPiA+IEphY29w
byBpcyB0cmF2ZWxsaW5nIHVudGlsIE5vdmVtYmVyIDFzdCBhbmQgd29uJ3QgYmUgYWJsZSB0byB0
ZXN0IHRoaXMKPiA+ID4gPiBhZ2FpbiBiZWZvcmUgdGhpcyBkYXRlLiBEbyB5b3UgdGhpbmsgeW91
IGNhbiBwaWNrIGl0IHVwIGFuZCBpbiBjYXNlCj4gPiA+ID4gYW55dGhpbmcncyBicm9rZW4gb24g
U0gsIHdlIGNhbiBmaXggaXQgYWZ0ZXIgdjUuNS1yYzEsIHNvIHRoYXQgaXQKPiA+ID4gPiBkb2Vz
bid0IG1pc3MgYW5vdGhlciBtZXJnZSB3aW5kb3c/Cj4gPgo+ID4gTm92ZW1iZXIgMXN0ICgtcmM2
KSB3aWxsIGJlIGZpbmUuCj4gPgo+ID4gSSdkIHJhdGhlciBhcHBseSBpdCBsYXRlLXRlc3RlZCB0
aGFuIGVhcmx5LW5vbi10ZXN0ZWQuCj4gPgo+ID4gSG9wZWZ1bGx5IEphY29wbyBjYW4gcHJpb3Jp
dGlzZSB0ZXN0aW5nIHRoaXMgb24gVGh1cnNkYXkgb3IgRnJpZGF5LAo+ID4gc2luY2UgTW9uZGF5
IHdpbGwgYmUgLXJjNyB3aGljaCBpcyByZWFsbHkgY3V0dGluZyBpdCBmaW5lLgo+IAo+IEknbGwg
ZG8gbXkgYmVzdCwgSSdsbCBnZXQgaG9tZSBGcmlkYXkgbGF0ZSBhZnRlcm5vb24gOikKClRoYW5r
cy4gV2UnZCBhbGwgcmVhbGx5IGFwcHJlY2lhdGUgaXQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzm
lq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNv
dXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0
dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FEC5CC76
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 11:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694BD88905;
	Tue,  2 Jul 2019 09:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F1889A35
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 09:14:14 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n9so16924856wru.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 02:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6nWtimC5vfxHX2tOLxULF1wu4CgPYNHaQ1h3AGat0sA=;
 b=CLCEKEqz09OKysD0F3XRN4mSWun7hy6vRzONVWkA33p9vWYwOAORgs2oB4V4NAwhNL
 cO6mxm/euOgtL1Gu8fhs0AZDgBWaMpuo38JWNPcMPtG+mWXPYzDBRz0nW2lGt50YATi/
 70BWoP2WN42mi8DfBI7Q7igde3wj1u9owK31Qu6BfOfVrjUJ+PM0tglP986pBymASVEx
 IbGxmgvku79Jvk07yPq3tJwfJvyQmUAhpSZkcVJYiQIKdcdd3xLom4EqRJ8+bIMWO12G
 rBDrbUDNMoNO3yDWvSDxsL5nDqSWz0/m3f3p9P/9weEGh8BC7hmuSjhtUU9jiOR4l4wq
 OhsQ==
X-Gm-Message-State: APjAAAXJVfdeuwZVctULkFL9PvcacqSMfFexh0Ee6C0Y+xy+8Bke0hpv
 DdAYHGpl0wTfrwjUCzE9fBKXc4MGzv8SLw==
X-Google-Smtp-Source: APXvYqznZQBIjc1cAANXlkANOuREA/yPD5X3rI575uAvrvEEMizzCcfvwLbK+9SYuOOWnUAgxECFCA==
X-Received: by 2002:adf:f581:: with SMTP id f1mr23425665wro.179.1562058853606; 
 Tue, 02 Jul 2019 02:14:13 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id p11sm12254821wrm.53.2019.07.02.02.14.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 02:14:13 -0700 (PDT)
Date: Tue, 2 Jul 2019 10:14:11 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFT 0/4] backlight: gpio: simplify the driver
Message-ID: <20190702091411.vk3q5zhqh6xh7uyd@holly.lan>
References: <20190628100253.8385-1-brgl@bgdev.pl>
 <CACRpkdZqsgXoZcHv9z+7oVrf=i9WPSHG=93qhfA=0SkR0Mdfxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZqsgXoZcHv9z+7oVrf=i9WPSHG=93qhfA=0SkR0Mdfxg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6nWtimC5vfxHX2tOLxULF1wu4CgPYNHaQ1h3AGat0sA=;
 b=v6R8xmxsb/AndlwuFoQmzCOZYeIpaKKWUPcKbfKDsWt30n4UhwuycxTefwW+hlDUo6
 mrmd+B/LOMTuu17R32eKM003sgTx2mfbJHrA4+H+JmCHvJZfo6XCj+VQRi+RvyaYZbYW
 2yqCao4iTsKNLNehd6zbTv5zBKMK5SUesgiWlBlM/3l3v3GcSApzIxhkWfMjPCC87gY9
 aKbEqrt4KolHKumR1H6Dfqz0BtJgxgSezBquF0s6Fl6HmOa6RDYJ5W7ks2vodJrltPKZ
 2BzCzKoAv9oWyGT4Kc/yqszCMboD0W4jiaC9IJJucx8ogkgCcji60W2+xYSlrbBZsrsm
 5N/g==
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-sh@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTE6MTU6MTBBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBGcmksIEp1biAyOCwgMjAxOSBhdCAxMTowMyBBTSBCYXJ0b3N6IEdvbGFzemV3
c2tpIDxicmdsQGJnZGV2LnBsPiB3cm90ZToKPiAKPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdz
a2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4gPgo+ID4gV2hpbGUgd29ya2luZyBvbiBt
eSBvdGhlciBzZXJpZXMgcmVsYXRlZCB0byBncGlvLWJhY2tsaWdodFsxXSBJIG5vdGljZWQKPiA+
IHRoYXQgd2UgY291bGQgc2ltcGxpZnkgdGhlIGRyaXZlciBpZiB3ZSBtYWRlIHRoZSBvbmx5IHVz
ZXIgb2YgcGxhdGZvcm0KPiA+IGRhdGEgdXNlIEdQSU8gbG9va3VwcyBhbmQgZGV2aWNlIHByb3Bl
cnRpZXMuIFRoaXMgc2VyaWVzIHRyaWVzIHRvIGRvCj4gPiB0aGF0Lgo+ID4KPiA+IFRoZSBmaXJz
dCBwYXRjaCBzZXRzIHVwIGFsbCB0aGUgcmVxdWlyZWQgc3RydWN0dXJlcyBpbiB0aGUgYm9hcmQg
ZmlsZSwKPiA+IHRoZSBzZWNvbmQgbW9kaWZpZXMgdGhlIGJhY2tsaWdodCBkcml2ZXIsIHRoZSB0
aGlyZCBhbmQgZm91cnRoIHJlbW92ZQo+ID4gdGhlIGxlZnRvdmVycy4KPiA+Cj4gPiBUaGlzIHNl
cmllcyBkZXBlbmRzIG9uIHRoZSB0aHJlZSBmaXJzdCBwYXRjaGVzIGZyb20gWzFdLgo+ID4KPiA+
IEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gdGhpcyBIVyBidXQgaG9wZWZ1bGx5IHRoaXMgd29ya3Mu
IE9ubHkgY29tcGlsZQo+ID4gdGVzdGVkLgo+IAo+IFRoaXMgc2VyaWVzOgo+IFJldmlld2VkLWJ5
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gCj4gRXhjZWxsZW50
IHdvcmshCgpEaXR0byEKCkhvcGUgdG8gc2VlIHRoaXMgY29tZSBhcm91bmQgYWdhaW4gYWxvbmdz
aWRlIHRoZSBvdGhlciBHUElPIGNsZWFuIHVwcy4KCgpEYW5pZWwuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

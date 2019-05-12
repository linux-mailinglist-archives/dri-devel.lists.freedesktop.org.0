Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 906A31ADC5
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 20:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AD389725;
	Sun, 12 May 2019 18:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073A489725
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 18:28:30 +0000 (UTC)
Received: by mail-it1-x142.google.com with SMTP id m141so15592369ita.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 11:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EF52YdVgI4AjVz2rWbfCjQjxB4bBcpwr8gdCDmEvRMM=;
 b=NJ1Up81V0pMYiD9u0GbgYPvoXMSZCXKnrzvug8AmhPMKFjJhXpW7Xpi3yUG5R86tdN
 d8WNvhA6p6DjjaFYld0O0XfcNrqowSXRi8m210odR8gbULDX6VTGrkUKiVMhKjcSUXHp
 bCjNmwt8K+GuPoP5woF0QlVzV5ojmjBuyuOZX/ZYj0k2xw8fvzHaginVIS9+Iixr7/lx
 549J/F9u9RhyOR23hngjwKunpmzjoXAvi33UXznpyXRTNpfxTcHoIxIPKPWo4W1HPRi0
 TodOneJZhOIvZduzftg3MpWcBCxRUyUdR0ndBcMwSX4lSmKK/XBUDOGgHwYAMMeHPBPY
 QAcQ==
X-Gm-Message-State: APjAAAX8MEm+aw3cUj0HieEWQQwdBpuwrUHT98suq9WDHHqgY4pRQkhw
 tZvcckAeivD/pKQKgT9CRtso7EwGJE6wLwN/p4WgWw==
X-Google-Smtp-Source: APXvYqxoZZ31n7p7DsRANkjUnS0uU4dF/+jejuqvVJfngZh1kMotrcwI/r2k8KpaBCLAP7sHgdKNC9IhCZC1L1ITf7I=
X-Received: by 2002:a02:b89:: with SMTP id 131mr16589728jad.58.1557685709583; 
 Sun, 12 May 2019 11:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190512174608.10083-1-peron.clem@gmail.com>
 <20190512174608.10083-6-peron.clem@gmail.com>
In-Reply-To: <20190512174608.10083-6-peron.clem@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 12 May 2019 23:58:18 +0530
Message-ID: <CAMty3ZBTO9+9HLikR8=KgWZQBp+1yVgxQ_rD-E8WeJ8VvpuAcA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v4 5/8] arm64: dts: allwinner: Add mali GPU
 supply for Pine H64
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EF52YdVgI4AjVz2rWbfCjQjxB4bBcpwr8gdCDmEvRMM=;
 b=JIVmAKslIaptP97sT+JLAAOKjiRud4rjax0VdpRuD7V6Y+T+njTxkM2Kyk89m1aDN4
 9pt2Xr85DesiZ48jZ6afjb57cspF2aD2Jhfk4b+7bbwEZF5ZpT9feCYOcEo2RLvOwclA
 8QwJWBBOK3SSmNqzmn5XYwf9P/7y5m/k7TQ6I=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXkgMTIsIDIwMTkgYXQgMTE6MTYgUE0gPHBlcm9uLmNsZW1AZ21haWwuY29tPiB3
cm90ZToKPgo+IEZyb206IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Cj4K
PiBFbmFibGUgYW5kIGFkZCBzdXBwbHkgdG8gdGhlIE1hbGkgR1BVIG5vZGUgb24gdGhlCj4gUGlu
ZSBINjQgYm9hcmQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNs
ZW1AZ21haWwuY29tPgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41
MGktaDYtcGluZS1oNjQuZHRzIHwgNSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3Vu
NTBpLWg2LXBpbmUtaDY0LmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUw
aS1oNi1waW5lLWg2NC5kdHMKPiBpbmRleCA0ODAyOTAyZTEyOGYuLmUxNmE4YzY3MzhmOSAxMDA2
NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtcGluZS1o
NjQuZHRzCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LXBp
bmUtaDY0LmR0cwo+IEBAIC04NSw2ICs4NSwxMSBAQAo+ICAgICAgICAgc3RhdHVzID0gIm9rYXki
Owo+ICB9Owo+Cj4gKyZncHUgewo+ICsgICAgICAgbWFsaS1zdXBwbHkgPSA8JnJlZ19kY2RjYz47
Cj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gK307CgpJIHRoaW5rIHdlIGNhbiBzcXVhc2gg
YWxsIHRoZXNlIGJvYXJkIGR0cyBjaGFuZ2VzIGludG8gc2luZ2xlIHBhdGNoLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

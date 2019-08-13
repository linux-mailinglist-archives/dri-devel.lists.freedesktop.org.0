Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3168B202
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 10:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0016E088;
	Tue, 13 Aug 2019 08:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6625D6E088
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 08:09:01 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id x4so7476668qts.5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 01:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3QYn8xVPbDnU8yCH5QG2DkGvPPJ9yAG+CBaSbT63l5s=;
 b=NiCWoJGYWIFRxxu7EWoOeIi5sMSoELpfb6aD1piakz6Zt88h11rfvCR32BwRam7Z8f
 ge+M5Ix2khrUTgu5y24vST7fc0CYaX6/GUaPSD6w35n/ShQ4u8cykxTpF9+u40+ZG71k
 po2kQLXAjURi7wRLzyKBfMGt2BrFEFQV4DMRgGzCbZRmOoT7NdSSwfwZOlYO18xmuaH9
 OlCQAEfocwJ8JlXu5eih8iBQlgqq2wF0G8D4fMml00yxcFG58RuBbTxPzT51iSgvFhXk
 UNKapXVsRPDLjel6KG7gcNPQydnHXUvclIARpnABQ4UkXxYzL8SbbQj7/bYSRzX1rCtG
 mRKg==
X-Gm-Message-State: APjAAAX8P7mjr8Kybf5FwLWpdzLU9GajpiWMFr+hZa4PcvbS2BhTwJva
 HUXxuntZa3d+0Yl3egAE/gYMM1OkIFrLe68pKcU=
X-Google-Smtp-Source: APXvYqzQY3jw5cidojWGquR6Ywd0UV4rVnIr4Q175ebPJlWm5I+ETbY/lAleI6WDMLSOu84QmW6hk+yfSbxvjbk+0xI=
X-Received: by 2002:ac8:117:: with SMTP id e23mr17771674qtg.18.1565683740433; 
 Tue, 13 Aug 2019 01:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565367567.git.agx@sigxcpu.org>
 <e0562d8bb4098dc4cdb4023b41fb75b312be22a5.1565367567.git.agx@sigxcpu.org>
In-Reply-To: <e0562d8bb4098dc4cdb4023b41fb75b312be22a5.1565367567.git.agx@sigxcpu.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 13 Aug 2019 10:08:44 +0200
Message-ID: <CAK8P3a3Vrd+sttJrQwD-jA9p_egG4x-hc41eGK8H-_aVm-uoYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: imx8mq: add imx8mq iomux-gpr field defines
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>,
 Lee Jones <lee.jones@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgOSwgMjAxOSBhdCA2OjI0IFBNIEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNw
dS5vcmc+IHdyb3RlOgo+Cj4gVGhpcyBhZGRzIGFsbCB0aGUgZ3ByIHJlZ2lzdGVycyBhbmQgdGhl
IGRlZmluZSBuZWVkZWQgZm9yIHNlbGVjdGluZwo+IHRoZSBpbnB1dCBzb3VyY2UgaW4gdGhlIGlt
eC1ud2wgZHJtIGJyaWRnZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hA
c2lneGNwdS5vcmc+Cj4gKwo+ICsjZGVmaW5lIElPTVVYQ19HUFIwICAgIDB4MDAKPiArI2RlZmlu
ZSBJT01VWENfR1BSMSAgICAweDA0Cj4gKyNkZWZpbmUgSU9NVVhDX0dQUjIgICAgMHgwOAo+ICsj
ZGVmaW5lIElPTVVYQ19HUFIzICAgIDB4MGMKPiArI2RlZmluZSBJT01VWENfR1BSNCAgICAweDEw
Cj4gKyNkZWZpbmUgSU9NVVhDX0dQUjUgICAgMHgxNAo+ICsjZGVmaW5lIElPTVVYQ19HUFI2ICAg
IDB4MTgKPiArI2RlZmluZSBJT01VWENfR1BSNyAgICAweDFjCihtb3JlIG9mIHRoZSBzYW1lKQoK
aHVoPwoKPiArLyogaS5NWDhNcSBpb211eCBncHIgcmVnaXN0ZXIgZmllbGQgZGVmaW5lcyAqLwo+
ICsjZGVmaW5lIElNWDhNUV9HUFIxM19NSVBJX01VWF9TRUwgICAgICAgICAgICAgIEJJVCgyKQoK
SSB0aGluayB0aGlzIGRlZmluZSBzaG91bGQgcHJvYmFibHkgYmUgbG9jYWwgdG8gdGhlIHBpbmN0
cmwgZHJpdmVyLCB0bwplbnN1cmUgdGhhdCBubyBvdGhlciBkcml2ZXJzIGZpZGRsZSB3aXRoIHRo
ZSByZWdpc3RlcnMgbWFudWFsbHkuCgogICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs

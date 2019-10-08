Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489D8CFA09
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 14:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9258F6E1D8;
	Tue,  8 Oct 2019 12:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACE36E1D8
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 12:38:27 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DE302190F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 12:38:27 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id e15so10135795qtr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 05:38:27 -0700 (PDT)
X-Gm-Message-State: APjAAAW6qrwr8Ei/dvug7hZPfd8R1DvFbaOfhbxxUU9BFBTQCHf4j8C2
 1eOjfDfg6W4d5YIVKiFEn4ZbgyDt2awGSapHGA==
X-Google-Smtp-Source: APXvYqzxC6rl6FMV1ScqL2fgXOVZv3hYhSzySpUPq3nsKaUzT0TVTrLa+50ZC/gUauiPJFRY9Nd2MNSIBGFt1IYYeV8=
X-Received: by 2002:ac8:6982:: with SMTP id o2mr35571093qtq.143.1570538306332; 
 Tue, 08 Oct 2019 05:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191004151414.8458-1-krzk@kernel.org>
In-Reply-To: <20191004151414.8458-1-krzk@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 8 Oct 2019 07:38:14 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJDTcHu5oXG6zszGHCBhTE6EW94AANUjyMV78SkKcn5yA@mail.gmail.com>
Message-ID: <CAL_JsqJDTcHu5oXG6zszGHCBhTE6EW94AANUjyMV78SkKcn5yA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: samsung: Force clkoutN names to be
 unique in PMU
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570538307;
 bh=0172FbZMwE+uHkpHQaDTjmrpy7r6UVMZViKRxp2jAkE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Fj0cjOYfJqhfG7IwXrmsg43ZvERQ73aD0HiD62uK8K0QAnuFy4VbETrnvYSymrBqN
 xM7+aR53XRnXLF/IMVEBQZral9XGk3sgp1dp0oYVgvM71fmByrgK0ow2kcUo6seEJK
 WtzTvf6j2ztu57+zCR9T41ITyxFFnOHtYtMF77Dg=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Maciej Falkowski <m.falkowski@samsung.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCAxMDoxNCBBTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlIGNsa291dE4gbmFtZXMgb2YgY2xvY2tzIG11c3Qg
YmUgdW5pcXVlIGJlY2F1c2UgdGhleSByZXByZXNlbnQKPiB1bmlxdWUgaW5wdXRzIG9mIGNsb2Nr
IG11bHRpcGxleGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL3NhbXN1bmcvcG11LnlhbWwgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc2Ftc3VuZy9wbXUueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc2Ftc3VuZy9wbXUueWFtbAo+IGluZGV4IDczYjU2ZmM1
YmY1OC4uZDhlMDM3MTZmNWQyIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vc2Ftc3VuZy9wbXUueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vc2Ftc3VuZy9wbXUueWFtbAo+IEBAIC01Myw4ICs1MywxMCBA
QCBwcm9wZXJ0aWVzOgo+ICAgICAgICBMaXN0IG9mIGNsb2NrIG5hbWVzIGZvciBwYXJ0aWN1bGFy
IENMS09VVCBtdXggaW5wdXRzCj4gICAgICBtaW5JdGVtczogMQo+ICAgICAgbWF4SXRlbXM6IDMy
Cj4gLSAgICBpdGVtczoKPiAtICAgICAgcGF0dGVybjogJ15jbGtvdXQoWzAtOV18WzEyXVswLTld
fDNbMC0xXSkkJwo+ICsgICAgYWxsT2Y6Cj4gKyAgICAgIC0gaXRlbXM6Cj4gKyAgICAgICAgICBw
YXR0ZXJuOiAnXmNsa291dChbMC05XXxbMTJdWzAtOV18M1swLTFdKSQnCj4gKyAgICAgIC0gdW5p
cXVlSXRlbXM6IHRydWUKCllvdSBzaG91bGRuJ3QgbmVlZCB0aGUgJ2FsbE9mJywganVzdCBhZGQg
dW5pcXVlSXRlbXMgYXQgdGhlIHNhbWUgbGV2ZWwgYXMgaXRlbXMuCgpSb2IKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2929D3105
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 20:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7516E3CB;
	Thu, 10 Oct 2019 18:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06506E3CB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 18:58:42 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1400421920
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 18:58:42 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id j31so10245281qta.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 11:58:42 -0700 (PDT)
X-Gm-Message-State: APjAAAV8HFjm3SBwIcuiECtwc4N6/eZB6UMmYejpb5eULQpSM7h+ZvDm
 EhQWc6oE0cCtQh4bvPTfm974RDi4MBlx8iepgg==
X-Google-Smtp-Source: APXvYqzB5TzRKwoOcFcNVQukkGMmMU2iFIhyKCekwRBNJHWn3GTHP/CmHznLTqw+AnmCr8x0PiE1VBXV/9mGgldc2YU=
X-Received: by 2002:ad4:5044:: with SMTP id m4mr12009044qvq.85.1570733921147; 
 Thu, 10 Oct 2019 11:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191002164047.14499-1-krzk@kernel.org>
 <20191002164047.14499-2-krzk@kernel.org>
In-Reply-To: <20191002164047.14499-2-krzk@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 10 Oct 2019 13:58:30 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Fa1+epSvDpSx4NdzOUohoJR+qR3-xyMTTw4LaOK7AbQ@mail.gmail.com>
Message-ID: <CAL_Jsq+Fa1+epSvDpSx4NdzOUohoJR+qR3-xyMTTw4LaOK7AbQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: pwm: Convert Samsung PWM bindings to
 json-schema
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570733922;
 bh=C3qJQMyjD9A/GMvJ52P6U8GDKE7BNVgB4aq0nJUK3Tc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=x9hnp5Xo4bB1M1JWF8/BAZab4UX1ziPUvnFgk/cPG/ZALiC2ezbfWSIK9WfrWnqxU
 Be8N6AeS7oihMOahkrPHOI0whlDuASFXutW+vuKo6b1R/NAzZ/WsV5JfutdIEk6dPX
 j9KYoQjQg6HQBC03nBIRN41NzOebPx9rSvB/Ja9M=
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
 Linux PWM List <linux-pwm@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-clk <linux-clk@vger.kernel.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCAxMTo0MSBBTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gQ29udmVydCBTYW1zdW5nIFBXTSAoUzNDLCBTNVAgYW5k
IEV4eW5vcyBTb0NzKSBiaW5kaW5ncyB0byBEVCBzY2hlbWEKPiBmb3JtYXQgdXNpbmcganNvbi1z
Y2hlbWEuCj4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5l
bC5vcmc+Cj4KPiAtLS0KPgo+IENoYW5nZXMgc2luY2UgdjI6Cj4gMS4gQWRkIGFkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZS4KPgo+IENoYW5nZXMgc2luY2UgdjE6Cj4gMS4gSW5kZW50IGV4YW1w
bGUgd2l0aCBmb3VyIHNwYWNlcyAobW9yZSByZWFkYWJsZSksCj4gMi4gRml4IHNhbXN1bmcscHdt
LW91dHB1dHMgYWZ0ZXIgcmV2aWV3LAo+IDMuIFJlbW92ZSBkb3VibGUtcXVvdGVzIGZyb20gY2xv
Y2sgbmFtZXMuCj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tc2Ftc3Vu
Zy50eHQgICB8ICA1MSAtLS0tLS0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdt
LXNhbXN1bmcueWFtbCAgfCAxMDkgKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTA5IGluc2VydGlvbnMoKyksIDUxIGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tc2Ftc3VuZy50eHQK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
d20vcHdtLXNhbXN1bmcueWFtbAoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE904A3B3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 16:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C2C6E1D7;
	Tue, 18 Jun 2019 14:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440956E1D7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 14:18:45 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 00F7A21530
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 14:18:45 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id i34so10198329qta.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:18:44 -0700 (PDT)
X-Gm-Message-State: APjAAAUVRKdoANiauXWrTRKM0jW0F9YG5w3hE6HHuUTbQmqLi6Unl6cm
 Fm2LYtaaHEqLvV0qEFYxicT0rTH3iEdH9KA0bQ==
X-Google-Smtp-Source: APXvYqxqXrhBkfwz+CkmpI6Dnza5Sqa7IVWFgp1FgSWrNioXxep7UkwWRLPmku5uTgQa9FsH0l163BNzQrHu5CpPAQs=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr35442573qtf.110.1560867524199; 
 Tue, 18 Jun 2019 07:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-2-joseph.kogut@gmail.com>
 <20190614235719.8134-1-joseph.kogut@gmail.com>
 <CAJKOXPc-Xztou+xyibb8YZtfz20q3kzr_gTBoE=R3q_CSk9kzQ@mail.gmail.com>
In-Reply-To: <CAJKOXPc-Xztou+xyibb8YZtfz20q3kzr_gTBoE=R3q_CSk9kzQ@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 18 Jun 2019 08:18:32 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+8s3iNUy5ZCtWW5k-0sa51CR0xdv3Gh_sR=jsVtLmTdQ@mail.gmail.com>
Message-ID: <CAL_Jsq+8s3iNUy5ZCtWW5k-0sa51CR0xdv3Gh_sR=jsVtLmTdQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560867525;
 bh=fmH1HS1i21FXBrdGVVcYis11lRtY96O6Nq7hw7xpuXc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JoDrQk3MgbRvSeO+7rtnkhiCNb09N7doFTHOV7WnAsndUpzx+LxFKG5zn2RpjsgeQ
 E8wiAS1v58NskYQsv3sgTFHkFapWDgDYH7WE/SoMd4gryGJpNbrOGyIeLHGGkAnMwt
 FEOhMsVWLZ4cKFsLpkBHVVq21MDiyEMW+ocxBnLQ=
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
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Kukjin Kim <kgene@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMzoyNyBBTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCAxNSBKdW4gMjAxOSBhdCAwMTo1NywgSm9z
ZXBoIEtvZ3V0IDxqb3NlcGgua29ndXRAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBBZGQgZGV2
aWNlIHRyZWUgbm9kZSBmb3IgbWFsaSBncHUgb24gT2Ryb2lkIFhVMyBTb0NzLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEpvc2VwaCBLb2d1dCA8am9zZXBoLmtvZ3V0QGdtYWlsLmNvbT4KPiA+IC0t
LQo+ID4KPiA+IENoYW5nZXMgdjEgLT4gdjI6Cj4gPiAtIFVzZSBpbnRlcnJ1cHQgbmFtZSBvcmRl
cmluZyBmcm9tIGJpbmRpbmcgZG9jCj4gPiAtIFNwZWNpZnkgYSBzaW5nbGUgY2xvY2sgZm9yIEdQ
VSBub2RlCj4gPiAtIEFkZCBncHUgb3BwIHRhYmxlCj4gPiAtIEZpeCB3YXJuaW5ncyBmcm9tIElS
UV9UWVBFX05PTkUKPiA+Cj4gPiAgLi4uL2Jvb3QvZHRzL2V4eW5vczU0MjItb2Ryb2lkeHUzLWNv
bW1vbi5kdHNpIHwgMjYgKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAy
NiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4
eW5vczU0MjItb2Ryb2lkeHUzLWNvbW1vbi5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9z
NTQyMi1vZHJvaWR4dTMtY29tbW9uLmR0c2kKPiA+IGluZGV4IDkzYTQ4ZjJkZGE0OS4uYjhhNDI0
NmUzYjM3IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMi1vZHJv
aWR4dTMtY29tbW9uLmR0c2kKPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0MjIt
b2Ryb2lkeHUzLWNvbW1vbi5kdHNpCj4gPiBAQCAtNDgsNiArNDgsMzIgQEAKPiA+ICAgICAgICAg
ICAgICAgICBjb29saW5nLWxldmVscyA9IDwwIDEzMCAxNzAgMjMwPjsKPiA+ICAgICAgICAgfTsK
PiA+Cj4gPiArICAgICAgIGdwdTogZ3B1QDExODAwMDAwIHsKPiA+ICsgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gInNhbXN1bmcsZXh5bm9zLW1hbGkiLCAiYXJtLG1hbGktdDYyOCI7Cj4gPiAr
ICAgICAgICAgICAgICAgcmVnID0gPDB4MTE4MDAwMDAgMHg1MDAwPjsKPiA+ICsgICAgICAgICAg
ICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjE5IElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSA3NCAgSVJRX1RZUEVfTEVWRUxf
SElHSD4sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDExNyBJUlFf
VFlQRV9MRVZFTF9ISUdIPjsKPiA+ICsgICAgICAgICAgICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAi
am9iIiwgIm1tdSIsICJncHUiOwo+ID4gKyAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xvY2sg
Q0xLX0czRD47Cj4gPiArICAgICAgICAgICAgICAgbWFsaS1zdXBwbHkgPSA8JmJ1Y2s0X3JlZz47
Cj4gPiArICAgICAgICAgICAgICAgb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmZ3B1X29wcF90YWJs
ZT47Cj4gPiArICAgICAgIH07Cj4gPiArCj4gPiArICAgICAgIGdwdV9vcHBfdGFibGU6IGdwdS1v
cHAtdGFibGUgewo+Cj4gT25lIG1vcmUgdGhpbmcgLSB1c2UgIm9wcF90YWJsZSIgYXMgbm9kZSBu
YW1lIChnZW5lcmljIGNsYXNzIG9mIG5vZGUsCj4gbWF0Y2hlcyBzdHlsZSB3aXRoIG90aGVyIHRh
YmxlcykuCgonb3BwLXRhYmxlJyBhcyBjb252ZW50aW9uIGlzIHVzaW5nICctJyByYXRoZXIgdGhh
biAnXycuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

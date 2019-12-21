Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46010128B64
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 21:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A6B6E4AE;
	Sat, 21 Dec 2019 20:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC806E4AE
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 20:09:32 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0719C206D3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 20:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576958972;
 bh=JJfFCLhlkopmo4wVR32TZkulzHo1NE33kZtKC+jRwX8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qIoWyU9Fr2+SEGmnrTBoC8KenLJzObYZSJcO0wijT6vlmTRBYEiO5dzZQRjl+VHd5
 VRpM6L82ePrlJkeAMd4p4LCyf3cD/yK+x0aK4lJBStBzSZmb8AIdOCgykLIAMNGoqD
 fEsyPDsdBqn//ywd0oa6eArN22WlwhgAMi0cv+xU=
Received: by mail-lj1-f179.google.com with SMTP id h23so13592655ljc.8
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 12:09:31 -0800 (PST)
X-Gm-Message-State: APjAAAUeC2ddGsK6LDdZYJWLPyBvcahWyrV6XLzBN1zVbNHhenEGPhUK
 F1iCjQWNXTLnN4TiUpC6Uw+PHFkK6WZ1pqwL9zk=
X-Google-Smtp-Source: APXvYqz+9TaYpA9qazzKenl6SyuSjXpHqSa8zOU8/cwyY5DW/ALCHnPENo9DzSPsoKOg/6lqqFIb2RMTFQtQMDJRhJ0=
X-Received: by 2002:a2e:a361:: with SMTP id i1mr13043160ljn.29.1576958970281; 
 Sat, 21 Dec 2019 12:09:30 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191220120146eucas1p25dada01c315215d18bb8a15e3173b52c@eucas1p2.samsung.com>
 <20191220115653.6487-1-a.swigon@samsung.com>
 <20191220115653.6487-7-a.swigon@samsung.com>
In-Reply-To: <20191220115653.6487-7-a.swigon@samsung.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sun, 22 Dec 2019 05:08:53 +0900
X-Gmail-Original-Message-ID: <CAGTfZH0QC5ZgVcSvXAy5tkyprZxfnwtWRa5NkRVfNP6HLMimew@mail.gmail.com>
Message-ID: <CAGTfZH0QC5ZgVcSvXAy5tkyprZxfnwtWRa5NkRVfNP6HLMimew@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/7] arm: dts: exynos: Add interconnects to
 Exynos4412 mixer
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIERlYyAyMCwgMjAxOSBhdCA5OjAyIFBNIEFydHVyIMWad2lnb8WEIDxhLnN3
aWdvbkBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGFkZHMgYW4gJ2ludGVyY29u
bmVjdHMnIHByb3BlcnR5IHRvIEV4eW5vczQ0MTIgRFRTIGluIG9yZGVyIHRvCj4gZGVjbGFyZSB0
aGUgaW50ZXJjb25uZWN0IHBhdGggdXNlZCBieSB0aGUgbWl4ZXIuIFBsZWFzZSBub3RlIHRoYXQg
dGhlCj4gJ2ludGVyY29ubmVjdC1uYW1lcycgcHJvcGVydHkgaXMgbm90IG5lZWRlZCB3aGVuIHRo
ZXJlIGlzIG9ubHkgb25lIHBhdGggaW4KPiAnaW50ZXJjb25uZWN0cycsIGluIHdoaWNoIGNhc2Ug
Y2FsbGluZyBvZl9pY2NfZ2V0KCkgd2l0aCBhIE5VTEwgbmFtZSBzaW1wbHkKPiByZXR1cm5zIHRo
ZSByaWdodCBwYXRoLgo+Cj4gU2lnbmVkLW9mZi1ieTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29u
QHNhbXN1bmcuY29tPgo+IC0tLQo+ICBhcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kg
fCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5
bm9zNDQxMi5kdHNpCj4gaW5kZXggNDg4Njg5NDczNzNlLi4xM2E2NzlhOWExMDcgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpCj4gKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpCj4gQEAgLTc3MSw2ICs3NzEsNyBAQAo+ICAgICAgICAg
Y2xvY2stbmFtZXMgPSAibWl4ZXIiLCAiaGRtaSIsICJzY2xrX2hkbWkiLCAidnAiOwo+ICAgICAg
ICAgY2xvY2tzID0gPCZjbG9jayBDTEtfTUlYRVI+LCA8JmNsb2NrIENMS19IRE1JPiwKPiAgICAg
ICAgICAgICAgICAgIDwmY2xvY2sgQ0xLX1NDTEtfSERNST4sIDwmY2xvY2sgQ0xLX1ZQPjsKPiAr
ICAgICAgIGludGVyY29ubmVjdHMgPSA8JmJ1c19kaXNwbGF5ICZidXNfZG1jPjsKPiAgfTsKPgo+
ICAmcG11IHsKPiAtLQo+IDIuMTcuMQo+CgpSZXZpZXdlZC1ieTogQ2hhbndvbyBDaG9pIDxjdzAw
LmNob2lAc2Ftc3VuZy5jb20+CgotLSAKQmVzdCBSZWdhcmRzLApDaGFud29vIENob2kKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

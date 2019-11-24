Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 046D81089C4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C9D89F6D;
	Mon, 25 Nov 2019 08:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2307F89CC9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 12:57:40 +0000 (UTC)
Date: Sun, 24 Nov 2019 13:57:26 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 8/8] MIPS: DTS: jz4780: add sgx gpu node
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <1574600246.3.0@crapouillou.net>
In-Reply-To: <c73e2cee4f818654f264b0b7b5458bfaa0ac6a7a.1574595627.git.hns@goldelico.com>
References: <cover.1574595627.git.hns@goldelico.com>
 <c73e2cee4f818654f264b0b7b5458bfaa0ac6a7a.1574595627.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1574600256; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eB/LD07EzRmsuGpIzh39d3UMiNMxk6mHLnDiEe/ssLc=;
 b=RTmLlG47A3S6kbPnIBIe7NBB8tBfySmc8DFNLpb3oBf3DRfID7C9iXEZT7Iv3pi6Z4Fqo7
 7tzP6M2RV59ImZiSVFCCpJ+3ZIDKEeCKP13KxThOdg3Gtz+ujaaTSI2L/4VyI86+Sb2x4p
 92iUAkNIHsPORo95QlVgtT+scNtBMjU=
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
 letux-kernel@openphoenux.org, Paul Burton <paulburton@kernel.org>,
 David Airlie <airlied@linux.ie>, James Hogan <jhogan@kernel.org>,
 openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Paul Boddie <paul@boddie.org.uk>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 =?iso-8859-1?q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmlrb2xhdXMsCgoKTGUgZGltLiwgbm92LiAyNCwgMjAxOSBhdCAxMjo0MCwgSC4gTmlrb2xh
dXMgU2NoYWxsZXIgCjxobnNAZ29sZGVsaWNvLmNvbT4gYSDDqWNyaXQgOgo+IGFuZCBhZGQgaW50
ZXJydXB0IGFuZCBjbG9ja3MuCj4gCj4gVGVzdGVkIHRvIGJ1aWxkIGZvciBDSTIwIGJvYXJkIGFu
ZCBsb2FkIGEgKG5vbi13b3JraW5nKSBkcml2ZXIuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBQYXVsIEJv
ZGRpZSA8cGF1bEBib2RkaWUub3JnLnVrPgo+IFNpZ25lZC1vZmYtYnk6IEguIE5pa29sYXVzIFNj
aGFsbGVyIDxobnNAZ29sZGVsaWNvLmNvbT4KPiAtLS0KPiAgYXJjaC9taXBzL2Jvb3QvZHRzL2lu
Z2VuaWMvano0NzgwLmR0c2kgfCAxMSArKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTEg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL21pcHMvYm9vdC9kdHMvaW5nZW5p
Yy9qejQ3ODAuZHRzaSAKPiBiL2FyY2gvbWlwcy9ib290L2R0cy9pbmdlbmljL2p6NDc4MC5kdHNp
Cj4gaW5kZXggYzU0YmQ3Y2ZlYzU1Li4yMWVhNWY0YTQwNWIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9t
aXBzL2Jvb3QvZHRzL2luZ2VuaWMvano0NzgwLmR0c2kKPiArKysgYi9hcmNoL21pcHMvYm9vdC9k
dHMvaW5nZW5pYy9qejQ3ODAuZHRzaQo+IEBAIC00Niw2ICs0NiwxNyBAQAo+ICAJCSNjbG9jay1j
ZWxscyA9IDwxPjsKPiAgCX07Cj4gCj4gKwlncHU6IGdwdUAxMzA0MDAwMCB7CgpXZSB0cnkgdG8g
a2VlcCB0aGUgbm9kZXMgb3JkZXJlZCBieSBhZGRyZXNzLCBjb3VsZCB5b3UgbW92ZSB0aGlzIG5v
ZGUgCndoZXJlIGl0IGJlbG9uZ3M/CgpUaGFua3MsCi1QYXVsCgoKPiArCQljb21wYXRpYmxlID0g
ImluZ2VuaWMsano0NzgwLXNneDU0MC0xMjAiLCAiaW1nLHNneDU0MC0xMjAiLCAKPiAiaW1nLHNn
eDU0MCIsICJpbWcsc2d4NSI7Cj4gKwkJcmVnID0gPDB4MTMwNDAwMDAgMHg0MDAwPjsKPiArCj4g
KwkJY2xvY2tzID0gPCZjZ3UgSlo0NzgwX0NMS19HUFU+Owo+ICsJCWNsb2NrLW5hbWVzID0gImdw
dSI7Cj4gKwo+ICsJCWludGVycnVwdC1wYXJlbnQgPSA8JmludGM+Owo+ICsJCWludGVycnVwdHMg
PSA8NjM+Owo+ICsJfTsKPiArCj4gIAl0Y3U6IHRpbWVyQDEwMDAyMDAwIHsKPiAgCQljb21wYXRp
YmxlID0gImluZ2VuaWMsano0NzgwLXRjdSIsCj4gIAkJCSAgICAgImluZ2VuaWMsano0NzcwLXRj
dSIsCj4gLS0KPiAyLjIzLjAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=

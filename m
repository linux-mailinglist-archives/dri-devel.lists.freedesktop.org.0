Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A5CB29A83
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 09:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9A010E3CE;
	Mon, 18 Aug 2025 07:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="HObhQdZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7532810E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 07:08:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755500919; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=F0/jkPyUckKeliSSvKuXqvDbQXp28q1CS3WKE6XZzY7MyTGQMIPQdoIIT7gih20Q7ig/257SzUyHNJV5Vmd43cGPopyTRFLjZlA4sDUxvj/d6Gtk1AE2PmsDRYiRGS0Ong8xVBO5/B+sTUVZ+aGDqoEpmYa8UZooWBzVpmnv2H4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755500919;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Sgmd+CuKqOWfoT7raFLnBvXLcCnzbWKYqkcBawmnT5c=; 
 b=BT3pNsMP7r+lSiYYRvUdaHQRlV69MtOhaBZk4mFY2EHoL7i0Ud2/0MaVCb4tHyq+mxhqZmZuVDFJzgaN1Pmy/LpIHvuZYtzkwl4QQM/d+BW5g2zQ7i340k6McMdx/ivh6uOd+l9xiAWrRDhFHbPdfz0+nJKsEAoUXNDfwYJART8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755500919; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=Sgmd+CuKqOWfoT7raFLnBvXLcCnzbWKYqkcBawmnT5c=;
 b=HObhQdZJMOogk/S2wgghy95vnYx5oo8Cuw1Uws7KLIZAgHxPZJs8y3s+FGYGRtbO
 JmImlDi7X4yRrEYnG4XXEiB04yxSiMH7ZKBlgcvbEkHYMb/98clmi7PbJ0o387PM92v
 haKNCeDVgJLiVo+/oqqCSOVimcSgJ76Oel52cdXOftBsCrbP8M6BWseZbD1ZkUNmZ46
 R9dzwo4bMBBTznewGAU983ClkWc9myPqlVaY2YZ9n3GQejF6G/9qXA7SciRRf4b/Piw
 uYgiZTpe1MaufvxaqqIdUnx1gEoZOdFWF+ZxIY1ZF8xRkBdQXOG9SghqkGW31ehR1ma
 gjJH72E1tg==
Received: by mx.zohomail.com with SMTPS id 1755500915570507.0743823766354;
 Mon, 18 Aug 2025 00:08:35 -0700 (PDT)
Message-ID: <bc7e7476abd4777759d02e7ae6d857d160451e7b.camel@icenowy.me>
Subject: Re: [RFC PATCH 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
 <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal
 Wilczynski <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, Yao
 Zi <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Mon, 18 Aug 2025 15:08:23 +0800
In-Reply-To: <aKIh+MLEO2aM/vO7@x1>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-4-uwu@icenowy.me> <aKIh+MLEO2aM/vO7@x1>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

5ZyoIDIwMjUtMDgtMTfmmJ/mnJ/ml6XnmoQgMTE6MzkgLTA3MDDvvIxEcmV3IEZ1c3Rpbmnlhpnp
gZPvvJoKPiBPbiBGcmksIEF1ZyAxNSwgMjAyNSBhdCAxMjo0MDo0M0FNICswODAwLCBJY2Vub3d5
IFpoZW5nIHdyb3RlOgo+ID4gVGhpcyBpcyBhIGZyb20tc2NyYXRjaCBkcml2ZXIgdGFyZ2V0aW5n
IFZlcmlzaWxpY29uIERDLXNlcmllcwo+ID4gZGlzcGxheQo+ID4gY29udHJvbGxlcnMsIHdoaWNo
IGZlYXR1cmUgc2VsZi1pZGVudGlmaWNhdGlvbiBmdW5jdGlvbmFsaXR5IGxpa2UKPiA+IHRoZWly
Cj4gPiBHQy1zZXJpZXMgR1BVcy4KPiA+IAo+ID4gT25seSBEQzgyMDAgaXMgYmVpbmcgc3VwcG9y
dGVkIG5vdywgYW5kIG9ubHkgdGhlIG1haW4gZnJhbWVidWZmZXIKPiA+IGlzIHNldAo+ID4gdXAg
KGFzIHRoZSBEUk0gcHJpbWFyeSBwbGFuZSkuIFN1cHBvcnQgZm9yIG1vcmUgREMgbW9kZWxzIGFu
ZCBtb3JlCj4gPiBmZWF0dXJlcyBpcyBteSBmdXJ0aGVyIHRhcmdldHMuCj4gPiAKPiA+IEFzIHRo
ZSBkaXNwbGF5IGNvbnRyb2xsZXIgaXMgZGVsaXZlcmVkIHRvIFNvQyB2ZW5kb3JzIGFzIGEgd2hv
bGUKPiA+IHBhcnQsCj4gPiB0aGlzIGRyaXZlciBkb2VzIG5vdCB1c2UgY29tcG9uZW50IGZyYW1l
d29yayBhbmQgZXh0cmEgYnJpZGdlcwo+ID4gaW5zaWRlIGEKPiA+IFNvQyBpcyBleHBlY3RlZCB0
byBiZSBpbXBsZW1lbnRlZCBhcyBkZWRpY2F0ZWQgYnJpZGdlcyAodGhpcyBkcml2ZXIKPiA+IHBy
b3Blcmx5IHN1cHBvcnRzIGJyaWRnZSBjaGFpbmluZykuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+IAo+IFRoYW5rcyBmb3Igd29ya2luZyBv
biB0aGlzIQo+IAo+IFtzbmlwXQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92ZXJp
c2lsaWNvbi92c19wcmltYXJ5X3BsYW5lLmMKPiA+IGIvZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxp
Y29uL3ZzX3ByaW1hcnlfcGxhbmUuYwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4
IDAwMDAwMDAwMDAwMDAuLjI1ZDZlMDFjYzhiNzEKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19wcmltYXJ5X3BsYW5lLmMKPiBbc25pcF0K
PiA+ICtzdGF0aWMgdm9pZCB2c19wcmltYXJ5X3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0IGRy
bV9wbGFuZQo+ID4gKnBsYW5lLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IGRybV9hdG9taWNfc3RhdGUKPiA+ICphdG9taWNfc3RhdGUpCj4gPiArewo+ID4gK8KgwqDCoMKg
wqDCoMKgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUgPQo+ID4gZHJtX2F0b21pY19nZXRf
bmV3X3BsYW5lX3N0YXRlKGF0b21pY19zdGF0ZSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+
IMKgwqDCoCBwbGFuZSk7Cj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVy
ICpmYiA9IHN0YXRlLT5mYjsKPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1fY3J0YyAqY3J0
YyA9IHN0YXRlLT5jcnRjOwo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9nZW1fZG1hX29i
amVjdCAqZ2VtOwo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHZzX2RjICpkYzsKPiA+ICvCoMKg
wqDCoMKgwqDCoHN0cnVjdCB2c19jcnRjICp2Y3J0YzsKPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVj
dCB2c19mb3JtYXQgZm10Owo+ID4gK8KgwqDCoMKgwqDCoMKgdW5zaWduZWQgaW50IG91dHB1dCwg
YnBwOwo+ID4gK8KgwqDCoMKgwqDCoMKgZG1hX2FkZHJfdCBkbWFfYWRkcjsKPiA+ICsKPiA+ICvC
oMKgwqDCoMKgwqDCoGlmICghY3J0YykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXR1cm47Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBEUk1fREVCVUdfRFJJVkVSKCJVcGRh
dGluZyBvdXRwdXQgJWQgcHJpbWFyeSBwbGFuZVxuIiwKPiA+IG91dHB1dCk7Cj4gCj4gY2xhbmcg
ZmxhZ2dlZCB0aGlzIHdoZW4gYnVpbGRpbmcuIEkgdGhpbmsgdGhpcyBuZWVkcyB0byBiZSBhZnRl
ciB0aGUKPiBsaW5lIGJlbG93IHRoYXQgYXNzaWducyB2Y3J0Yy0+aWQgdG8gb3V0cHV0LgoKT29w
cyBnb3Qgc2lsbHkgaGVyZS4uLgoKPiAKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHZjcnRjID0g
ZHJtX2NydGNfdG9fdnNfY3J0YyhjcnRjKTsKPiA+ICvCoMKgwqDCoMKgwqDCoG91dHB1dCA9IHZj
cnRjLT5pZDsKPiAKPiBUaGFua3MsCj4gRHJldwoK


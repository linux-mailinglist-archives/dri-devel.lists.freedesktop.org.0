Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60EEBE710
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 23:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A36B7A43D;
	Wed, 25 Sep 2019 21:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2877A440
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 21:26:40 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PLQTJJ089587;
 Wed, 25 Sep 2019 16:26:29 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PLQTGV030025;
 Wed, 25 Sep 2019 16:26:29 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 25
 Sep 2019 16:26:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 25 Sep 2019 16:26:22 -0500
Received: from [10.250.197.29] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PLQRXj125159;
 Wed, 25 Sep 2019 16:26:28 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Adam Ford <aford173@gmail.com>,
 <linux-omap@vger.kernel.org>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <93c141c6-6519-4855-2424-f7b348b5df25@ti.com>
Date: Wed, 25 Sep 2019 14:26:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <af325707-3e42-493d-e858-77878ef06138@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569446789;
 bh=L31cUsQNSVbjLWHHKpLMzPbfxz4gfU8gEYEWZo7VRD4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=p2r1071HZ9y8EGc8xiGpOsXeJy2yAEfOjLCL17cM0ykGWc8amevRRcsEDHaD7tfOI
 oU33SWp5+ZQOxSUIiJD3iBh2zdw1XS5il1t2emezEn4wE+FuZS7E7VR5IjnQbT6+7L
 L3VWeUcY49QtSuA7Qe3S7H6av7k/UR5+rG+P/TxQ=
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, adam.ford@logicpd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yOC8xOSA0OjExIEFNLCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPiBIaSwKPiAKPiBPbiAx
MC8wNS8yMDE5IDIyOjQyLCBBZGFtIEZvcmQgd3JvdGU6Cj4+IEN1cnJlbnRseSB0aGUgc291cmNl
IGNvZGUgaXMgY29tcGlsZWQgdXNpbmcgaGFyZC1jb2RlZCB2YWx1ZXMKPj4gZnJvbSBDT05GSUdf
T01BUDJfRFNTX01JTl9GQ0tfUEVSX1BDSy7CoCBUaGlzIHBhdGNoIGFsbG93cyB0aGlzCj4+IGNs
b2NrIGRpdmlkZXIgdmFsdWUgdG8gYmUgbW92ZWQgdG8gdGhlIGRldmljZSB0cmVlIGFuZCBiZSBj
aGFuZ2VkCj4+IHdpdGhvdXQgaGF2aW5nIHRvIHJlY29tcGlsZSB0aGUga2VybmVsLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KPiAKPiBJIHVuZGVy
c3RhbmQgd2h5IHlvdSB3YW50IHRvIGRvIHRoaXMsIGJ1dCBJJ20gbm90IHN1cmUgaXQncyBhIGdv
b2QgaWRlYS4KPiBJdCdzIHJlYWxseSBzb21ldGhpbmcgdGhlIGRyaXZlciBzaG91bGQgZmlndXJl
IG91dCwgYW5kIGlmIHdlIGFkZCBpdCB0bwo+IHRoZSBEVCwgaXQgZWZmZWN0aXZlbHkgYmVjb21l
cyBhbiBBQkkuCj4gCj4gVGhhdCBzYWlkLi4uIEknbSBub3Qgc3VyZSBob3cgZ29vZCBvZiBhIGpv
YiB0aGUgZHJpdmVyIGNvdWxkIGV2ZXIgZG8sIGFzCj4gaXQgY2FuJ3Qga25vdyB0aGUgZnV0dXJl
IHNjYWxpbmcgbmVlZHMgb2YgdGhlIHVzZXJzcGFjZSBhdCB0aGUgdGltZSBpdAo+IGlzIGNvbmZp
Z3VyaW5nIHRoZSBjbG9jay4gQW5kIHNvLCBJJ20gbm90IG5hY2tpbmcgdGhpcyBwYXRjaCwgYnV0
IEkKPiBkb24ndCBmZWVsIHZlcnkgZ29vZCBhYm91dCB0aGlzIHBhdGNoLi4uCj4gCj4gVGhlIHNl
dHRpbmcgYWxzbyBhZmZlY3RzIGFsbCBvdXRwdXRzIChleGx1ZGluZyB2ZW5jKSwgd2hpY2ggbWF5
IG5vdCBiZQo+IHdoYXQgdGhlIHVzZXIgd2FudHMuIFRoZW4gYWdhaW4sIEkgdGhpbmsgdGhpcyBz
ZXR0aW5nIGlzIHJlYWxseSBvbmx5Cj4gbmVlZGVkIG9uIE9NQVAyICYgMywgd2hpY2ggaGF2ZSBv
bmx5IGEgc2luZ2xlIG91dHB1dC4gQnV0IHRoYXQncyB0aGUKPiBzYW1lIHdpdGggdGhlIGN1cnJl
bnQga2NvbmZpZyBvcHRpb24sIG9mIGNvdXJzZS4KPiAKPiBTbywgdGhlIGN1cnJlbnQgQ09ORklH
X09NQVAyX0RTU19NSU5fRkNLX1BFUl9QQ0sgaXMgYW4gdWdseSBoYWNrLCBpbiBteQo+IG9waW5p
b24sIGFuZCBtb3ZpbmcgaXQgdG8gRFQgbWFrZXMgaXQgYSB3b3JzZSBoYWNrID0pLiBCdXQgSSBk
b24ndCBoYXZlCj4gYW55IGdvb2Qgc3VnZ2VzdGlvbnMgZWl0aGVyLgo+IAoKCk1vZHVsZSBwYXJh
bT8KCkFuZHJldwoKCj4gwqBUb21pCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7561005CA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 13:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BE86E4FF;
	Mon, 18 Nov 2019 12:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35726E4FF;
 Mon, 18 Nov 2019 12:44:26 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAICiNam002165;
 Mon, 18 Nov 2019 06:44:23 -0600
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAICiNmV051514
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 18 Nov 2019 06:44:23 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 18
 Nov 2019 06:44:22 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 18 Nov 2019 06:44:22 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAICiKQv052912;
 Mon, 18 Nov 2019 06:44:20 -0600
Subject: Re: [PATCH 07/15] drm/omapdrm: Drop dma_buf->k(un)map
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>, "Anna, Suman" <s-anna@ti.com>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-8-daniel.vetter@ffwll.ch>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a9432582-7de6-fc81-d4e6-caf4b3297046@ti.com>
Date: Mon, 18 Nov 2019 14:44:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118103536.17675-8-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574081063;
 bh=2IhF4fI2/RR/FidxJfGucuKRGhL2wsb4IeH8JU66YQg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=nko1s9w3dr5fbokldTcyWVTr0CyPD3g+LhTHg9nXhZLcuL4UtNbyN4jq16k2BVKfB
 Oc25iraMH/mcpjeY2GjxWfzUFevkkr1MYwKBSZhRCtUX6JQLPHQi+GZIxWy5g5B+fH
 K6WXgqpwW83/8+i19ICWCtXsECL6/8sf4VpomUC4=
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTgvMTEvMjAxOSAxMjozNSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBObyBpbi10cmVlIHVz
ZXJzIGxlZnQuCj4gCj4gTm90ZSB0aGF0IHRoaXMgaXMgb25lIG9mIHRoZSBmZXcgKGlmIG9ubHkp
IGltcGxlbWVudGF0aW9ucyBvZiBkbWEtYnVmCj4gdGhhdCBwcm92aWRlZCBhIGttYXAsIGJ1dCBu
b3QgYSB2bWFwIGltcGxlbWVuYXRpb24uIEdpdmVuIHRoYXQgdGhlCj4gb25seSByZWFsIHVzZXIg
KGluLXRyZWUgYXQgbGVhc3QpIG9mIGttYXAgd2FzIHRlZ3JhLCBhbmQgaXQncwo+IGltcG9zc2li
bGUgdG8gYnV5IGEgY2hpcCB3aXRoIHRlZ3JhIGhvc3QxeCBhbmQgb21wYWRybSBvbiB0aGUgc2Ft
ZQo+IFNvQywgdGhlcmUncyBubyBwcm9ibGVtIGhlcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IFRvbWkgVmFsa2VpbmVu
IDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9vbWFwX2dlbV9kbWFidWYuYyB8IDIxIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIxIGRlbGV0aW9ucygtKQoKV2UncmUgdXNpbmcgZG1hX2J1Zl9rbWFwIGluIFRJ
IGtlcm5lbCwgaW4gc29tZSBycG1zZyBjb2RlOgoKaHR0cHM6Ly9naXQudGkuY29tL2NnaXQvdGkt
bGludXgta2VybmVsL3RpLWxpbnV4LWtlcm5lbC90cmVlL2RyaXZlcnMvcnBtc2cvcnBtc2dfcnBj
X2RtYWJ1Zi5jP2g9dGktbGludXgtNC4xOS55CgpJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhlIGNv
ZGUsIENjJ2luZyBTdW1hbi4KCkluIGFueSBjYXNlLCBpZiBubyBvbmUgZWxzZSBuZWVkcyBkbWFi
dWYga21hcCwgSSB3b3VsZCBndWVzcyB0aGF0IFRJIGRvZXNuJ3QgbmVlZCBpdCBlaXRoZXIuLi4g
UHJlc3VtaW5nIHRoYXQncyB0aGUgY2FzZSwgZm9yIHRoZSBvbWFwZHJtIHBhcnQ6CgpBY2tlZC1i
eTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCkFsc28sIGRvbid0IGRv
d25wbGF5IHRoZSAzMmJpdCBrZXJuZWxzLCB0aGVyZSBhcmUgc3RpbGwgcGxlbnR5IG9mIHVzZXJz
IGZvciBhcm0zMiwgYW5kIHdpbGwgYmUgZm9yIGEgbG9uZyB0aW1lID0pCgogVG9taQoKLS0gClRl
eGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNp
bmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxl
OiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

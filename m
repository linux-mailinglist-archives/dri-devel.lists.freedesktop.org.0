Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32930477CB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 03:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EAC89166;
	Mon, 17 Jun 2019 01:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 521B689166;
 Mon, 17 Jun 2019 01:52:02 +0000 (UTC)
X-UUID: 0ceb2669b10e464bb3027785eaa4af56-20190617
X-UUID: 0ceb2669b10e464bb3027785eaa4af56-20190617
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1578614491; Mon, 17 Jun 2019 09:51:59 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Jun 2019 09:51:58 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 17 Jun 2019 09:51:58 +0800
Message-ID: <1560736318.23549.1.camel@mtksdaap41>
Subject: Re: [PATCH 19/59] drm/mtk: Drop drm_gem_prime_export/import
From: CK Hu <ck.hu@mediatek.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 17 Jun 2019 09:51:58 +0800
In-Reply-To: <20190614203615.12639-20-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-20-daniel.vetter@ffwll.ch>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERhbmllbDoKCk9uIEZyaSwgMjAxOS0wNi0xNCBhdCAyMjozNSArMDIwMCwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiBUaGV5J3JlIHRoZSBkZWZhdWx0Lgo+IAo+IEFzaWRlOiBXb3VsZCBiZSBy
ZWFsbHkgbmljZSB0byBzd2l0Y2ggdGhlIG90aGVycyBvdmVyIHRvCj4gZHJtX2dlbV9vYmplY3Rf
ZnVuY3MuCgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KCj4gCj4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6
IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxA
cGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFp
bC5jb20+Cj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBs
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgMiAtLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+IGluZGV4
IDFmOGI4OTQzYjBjNi4uZGQ4ZGFiNTYyNTAwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmMKPiBAQCAtMzI5LDggKzMyOSw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2Ry
aXZlciBtdGtfZHJtX2RyaXZlciA9IHsKPiAgCj4gIAkucHJpbWVfaGFuZGxlX3RvX2ZkID0gZHJt
X2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCj4gIAkucHJpbWVfZmRfdG9faGFuZGxlID0gZHJtX2dl
bV9wcmltZV9mZF90b19oYW5kbGUsCj4gLQkuZ2VtX3ByaW1lX2V4cG9ydCA9IGRybV9nZW1fcHJp
bWVfZXhwb3J0LAo+IC0JLmdlbV9wcmltZV9pbXBvcnQgPSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwK
PiAgCS5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlID0gbXRrX2dlbV9wcmltZV9nZXRfc2dfdGFibGUs
Cj4gIAkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSA9IG10a19nZW1fcHJpbWVfaW1wb3J0X3Nn
X3RhYmxlLAo+ICAJLmdlbV9wcmltZV9tbWFwID0gbXRrX2RybV9nZW1fbW1hcF9idWYsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

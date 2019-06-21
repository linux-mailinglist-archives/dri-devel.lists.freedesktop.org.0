Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ECD4E6B0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 13:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1AA6E865;
	Fri, 21 Jun 2019 11:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540126E865
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 11:05:27 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A569320026;
 Fri, 21 Jun 2019 13:05:24 +0200 (CEST)
Date: Fri, 21 Jun 2019 13:05:18 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH v2 1/1] drm/exynos: drop drmP.h usage
Message-ID: <20190621110518.GA6772@ravnborg.org>
References: <20190608083508.6809-1-sam@ravnborg.org>
 <20190608083508.6809-2-sam@ravnborg.org>
 <CAAQKjZMt4FOss298fLrjxfRBm8tGypQHi9efQk21g74Xu0L9CQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAQKjZMt4FOss298fLrjxfRBm8tGypQHi9efQk21g74Xu0L9CQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=0BGECb2xW3pOX_YOaBsA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSW5raS4KPiAtLS0gc25pcCAtLS0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZzJkLmMKPiA+IGluZGV4IGMyMGIzYTc1OTM3MC4uZmY5MzQyNzM3YTUxIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2cyZC5jCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMKPiA+IEBAIC03LDIxICs3LDIx
IEBACj4gPiAgICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb25yCj4g
PiAgICovCj4gPgo+ID4gLSNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiA+ICAjaW5jbHVkZSA8
bGludXgvY2xrLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2NvbXBvbmVudC5oPgo+ID4gKyNpbmNs
dWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KPiA+
ICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+
Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZi5o
Pgo+ID4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+ICAjaW5jbHVkZSA8
bGludXgvcG1fcnVudGltZS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L3dvcmtxdWV1ZS5oPgo+ID4gLSNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGlu
Zy5oPgo+ID4gLSNpbmNsdWRlIDxsaW51eC9vZi5oPgo+ID4KPiA+IC0jaW5jbHVkZSA8ZHJtL2Ry
bVAuaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2V4eW5vc19kcm0uaD4KPiA+ICsKPiAKPiBXaXRoIHRo
aXMgcGF0Y2gsIG1hbnkgYnVpbGQgZXJyb3JzIGhhcHBlbi4KPiAKPiBTZWVtcyB5b3UgbWlzc2Vk
IHRvIGluY2x1ZGUgYmVsb3cgaGVhZGVyIGZpbGVzLAo+IDxsaW51eC91YWNjZXNzLmg+Cj4gPGxp
bnV4L2RlbGF5Lmg+Cj4gPGRybS9kcm1fZmlsZS5oPgpUaGFua3MgZm9yIHRlc3RpbmcsIGdsYWQg
dGhpcyB3YXMgY2F0Y2hlZCBiZWZvcmUgaXQgaGl0IGRybS1taXNjLgpJIHdpbGwgdHJ5IHRvIHJl
cHJvZHVjZSBhbmQgZ2V0IGJhY2sgaWYgSSBmYWlscyB0byBkbyBzby4KClNtZWxscyBsaWtlIEkg
ZmFpbGVkIHRvIGFwcGx5IHNvbWUgbG9jYWwgY2hhbmdlcyBvciBzb21ldGhpbmcuCgoJU2FtCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

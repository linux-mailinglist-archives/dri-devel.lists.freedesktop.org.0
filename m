Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F9D285124
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 19:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192DE6E135;
	Tue,  6 Oct 2020 17:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DE26E135;
 Tue,  6 Oct 2020 17:46:54 +0000 (UTC)
IronPort-SDR: 8wE7IEVrsxuZ1vhqjRfl6M29UjJJcIBI0ycOEtoYkTbDQwxgMCzv5RvllAB8i7V/u9VskwmXFK
 MOHSXufBgSJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="226197937"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="226197937"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 10:46:46 -0700
IronPort-SDR: PekJ/I/CYi2utSxnD70JWdu0aVCNSQFM7b3R22v+oAfo8KijM8P0NjkgcKzg5ScUffjf+iZyjL
 0VlA9d9NGUIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="342406022"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 06 Oct 2020 10:46:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Oct 2020 10:46:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Oct 2020 10:46:45 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.1713.004;
 Tue, 6 Oct 2020 10:46:45 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Ausmus, James" <james.ausmus@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Pandey, Hariom"
 <hariom.pandey@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "K, SrinivasX" <srinivasx.k@intel.com>,
 "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Index: AQHWm/Fk90H9Qy56XkSH4h+5RqsAv6mLT7oA
Date: Tue, 6 Oct 2020 17:46:45 +0000
Message-ID: <2f7809798dd0b59246d67c5044dafb1e518fc4c5.camel@intel.com>
References: <20201006145632.117291-1-srinivasx.k@intel.com>
In-Reply-To: <20201006145632.117291-1-srinivasx.k@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-ID: <DF42D4F738564F45A500C43017F5FEFE@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

K1JvZHJpZ28gYW5kIEphbmkNCg0KT24gVHVlLCAyMDIwLTEwLTA2IGF0IDE0OjU2ICswMDAwLCBL
YW1hdGkgU3Jpbml2YXMgd3JvdGU6DQo+IFJlbW92aW5nIGZvcmNlIHByb2JlIHByb3RlY3Rpb24g
ZnJvbSBFSEwgcGxhdGZvcm0uIERpZA0KPiBub3Qgb2JzZXJ2ZSB3YXJuaW5ncywgZXJyb3JzLCBm
bGlja2VyaW5nIG9yIGFueSB2aXN1YWwNCj4gZGVmZWN0cyB3aGlsZSBkb2luZyBvcmRpbmFyeSB0
YXNrcyBsaWtlIGJyb3dzaW5nIGFuZA0KPiBlZGl0aW5nIGRvY3VtZW50cyBpbiBhIHR3byBtb25p
dG9yIHNldHVwLg0KDQpPbmUgb2YgdGhlIHJlcXVpcmVtZW50cyB3YXMgYWxzbyB0byBoYXZlIENJ
IEJBVCBhbGwgZ3JlZW4gYW5kIHNoYXJkcyBhcyBncmVlbiBpcyBwb3NzaWJsZSBidXQgRUhMIGRv
bid0IHNob3cgdXAgaW4gQ0kgcmVzdWx0cywgd2UgYWN0dWFsbHkgaGF2ZSBvbmUNCnNpbmdsZSBF
SEwgbWFjaGluZSBpbiBDSSBidXQgSSBndWVzcyBpdCBpcyBub3QgYWJsZSB0byBydW4gYWxsIHRl
c3RzIHRoYXQgc2hhcmRzIGRvOg0KaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJt
LXRpcC9DSV9EUk1fOTA5Ny9maWxlbGlzdC5odG1sDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEth
bWF0aSBTcmluaXZhcyA8c3Jpbml2YXN4LmtAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X3BjaS5jIHwgMSAtDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgZGVs
ZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3Bj
aS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wY2kuYw0KPiBpbmRleCAzNjZkZGZjOGRm
NmIuLmFhOWMxN2E2ODUxYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9wY2kuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BjaS5jDQo+IEBAIC04
NDEsNyArODQxLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5mbyBpY2xf
aW5mbyA9IHsNCj4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZvIGVobF9p
bmZvID0gew0KPiDCoAlHRU4xMV9GRUFUVVJFUywNCj4gwqAJUExBVEZPUk0oSU5URUxfRUxLSEFS
VExBS0UpLA0KPiAtCS5yZXF1aXJlX2ZvcmNlX3Byb2JlID0gMSwNCj4gwqAJLnBsYXRmb3JtX2Vu
Z2luZV9tYXNrID0gQklUKFJDUzApIHwgQklUKEJDUzApIHwgQklUKFZDUzApIHwgQklUKFZFQ1Mw
KSwNCj4gwqAJLnBwZ3R0X3NpemUgPSAzNiwNCj4gwqB9Ow0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

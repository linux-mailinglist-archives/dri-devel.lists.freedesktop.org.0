Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFAD369525
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 16:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951F16EBFF;
	Fri, 23 Apr 2021 14:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDA76EBFF;
 Fri, 23 Apr 2021 14:53:01 +0000 (UTC)
IronPort-SDR: SVTOpe4OcQqG3IZxm+I0aokvqoxtU3zbCmPHQKZUTp1OtrHvr13zPvAgT1+NJkuXhg849aDZle
 RY4mjbwzSwIQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9963"; a="260032896"
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; d="scan'208";a="260032896"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 07:53:00 -0700
IronPort-SDR: LT/J6N2cTghpriBcWu4GrBPmWVxk3sfpBPryEmyxSTi9R0nzsYaeDEkOCB7+AITCPFYDiICBxu
 kVT3NeBnV9DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; d="scan'208";a="535562454"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by orsmga004.jf.intel.com with ESMTP; 23 Apr 2021 07:53:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 23 Apr 2021 15:52:58 +0100
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2106.013;
 Fri, 23 Apr 2021 07:52:57 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm: Rename DP_PSR_SELECTIVE_UPDATE to
 better mach eDP spec
Thread-Topic: [Intel-gfx] [PATCH 1/2] drm: Rename DP_PSR_SELECTIVE_UPDATE to
 better mach eDP spec
Thread-Index: AQHXNvmmpjWMa55GkUu3ydAfC62rdKrA1K4AgAGItgCAAEt5gA==
Date: Fri, 23 Apr 2021 14:52:57 +0000
Message-ID: <a63b7ab5a0d507d61eab5da7663b5e0bad72f3f4.camel@intel.com>
References: <20210421220224.200729-1-jose.souza@intel.com>
 <c59186be4be98826c8fe5e88e0032cdf6a16025b.camel@intel.com>
 <b250e029-2b10-baa6-5822-42df586c6477@linux.intel.com>
In-Reply-To: <b250e029-2b10-baa6-5822-42df586c6477@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-ID: <EE7199A416B1FD4695B52D8A033840BF@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTA0LTIzIGF0IDEyOjI1ICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gT3AgMjItMDQtMjAyMSBvbSAxMzowMCBzY2hyZWVmIE11biwgR3dhbi1neWVvbmc6DQo+
ID4gVGhlIGNoYW5nZWQgbmFtZSBsb29rcyBtb3JlIGFjY3VyYXRlIHRvIHRoZSBlZHAgMS40YiBz
cGVjLg0KPiA+IExvb2tzIGdvb2QgdG8gbWUuDQo+ID4gDQo+ID4gUmV2aWV3ZWQtYnk6IEd3YW4t
Z3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4NCj4gPiANCj4gPiBPbiBXZWQs
IDIwMjEtMDQtMjEgYXQgMTU6MDIgLTA3MDAsIEpvc8OpIFJvYmVydG8gZGUgU291emEgd3JvdGU6
DQo+ID4gPiBEUF9QU1JfRU5fQ0ZHIGJpdCA1IGFrYSAiU2VsZWN0aXZlIFVwZGF0ZSBSZWdpb24g
U2NhbiBMaW5lIENhcHR1cmUNCj4gPiA+IEluZGljYXRpb24iIGluIGVEUCBzcGVjIGhhcyBhIGFt
YmlndW91cyBuYW1lLCBzbyByZW5hbWluZyB0byBiZXR0ZXINCj4gPiA+IG1hdGNoIHNwZWNpZmlj
YXRpb24uDQo+ID4gPiANCj4gPiA+IFdoaWxlIGF0IGl0LCByZXBsYWNpbmcgYml0IHNoaXQgYnkg
QklUKCkgbWFjcm8gYW5kIGFkZGluZyB0aGUgdmVyc2lvbg0KPiA+ID4gc29tZSByZWdpc3RlcnMg
d2VyZSBhZGRlZCB0byBlRFAgc3BlY2lmaWNhdGlvbi4NCj4gPiA+IA0KPiA+ID4gQ2M6IDxkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPg0KPiA+ID4gQ2M6IFJvZHJpZ28gVml2aSA8cm9k
cmlnby52aXZpQGludGVsLmNvbT4NCj4gPiA+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFA
aW50ZWwuY29tPg0KPiA+ID4gQ2M6IEd3YW4tZ3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGlu
dGVsLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpv
c2Uuc291emFAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiDCoGluY2x1ZGUvZHJtL2RybV9k
cF9oZWxwZXIuaCB8IDE2ICsrKysrKysrLS0tLS0tLS0NCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxw
ZXIuaA0KPiA+ID4gaW5kZXggMWU4NWMyMDIxZjJmLi5kNmY2YTA4NGExOTAgMTAwNjQ0DQo+ID4g
PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgNCj4gPiA+ICsrKyBiL2luY2x1ZGUv
ZHJtL2RybV9kcF9oZWxwZXIuaA0KPiA+ID4gQEAgLTY4NywxNCArNjg3LDE0IEBAIHN0cnVjdCBk
cm1fZGV2aWNlOw0KPiA+ID4gwqAjZGVmaW5lIERQX0RTQ19FTkFCTEXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDE2MMKgwqAgLyogRFAgMS40ICovDQo+ID4g
PiDCoCMgZGVmaW5lIERQX0RFQ09NUFJFU1NJT05fRU7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKDEgPDwgMCkNCj4gPiA+IMKgDQo+ID4gPiAtI2RlZmluZSBEUF9QU1JfRU5fQ0ZHwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTcwwqDCoCAvKiBYWFgg
MS4yPyAqLw0KPiA+ID4gLSMgZGVmaW5lIERQX1BTUl9FTkFCTEXCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICgxIDw8IDApDQo+ID4gPiAtIyBkZWZpbmUgRFBfUFNSX01B
SU5fTElOS19BQ1RJVkXCoMKgwqDCoMKgwqDCoMKgwqDCoCAoMSA8PCAxKQ0KPiA+ID4gLSMgZGVm
aW5lIERQX1BTUl9DUkNfVkVSSUZJQ0FUSU9OwqDCoMKgwqDCoMKgwqDCoMKgwqAgKDEgPDwgMikN
Cj4gPiA+IC0jIGRlZmluZSBEUF9QU1JfRlJBTUVfQ0FQVFVSRcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICgxIDw8IDMpDQo+ID4gPiAtIyBkZWZpbmUgRFBfUFNSX1NFTEVDVElWRV9VUERBVEXC
oMKgwqDCoMKgwqDCoMKgwqDCoCAoMSA8PCA0KQ0KPiA+ID4gLSMgZGVmaW5lIERQX1BTUl9JUlFf
SFBEX1dJVEhfQ1JDX0VSUk9SU8KgwqDCoMKgICgxIDw8IDUpDQo+ID4gPiAtIyBkZWZpbmUgRFBf
UFNSX0VOQUJMRV9QU1IywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgxIDw8IDYpIC8q
IGVEUCAxLjRhICovDQo+ID4gPiArI2RlZmluZSBEUF9QU1JfRU5fQ0ZHwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4MTcwwqDCoCAvKiBYWFggMS4y
PyAqLw0KPiA+ID4gKyMgZGVmaW5lIERQX1BTUl9FTkFCTEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEJJVCgwKQ0KPiA+ID4gKyMgZGVmaW5lIERQX1BT
Ul9NQUlOX0xJTktfQUNUSVZFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgQklUKDEpDQo+
ID4gPiArIyBkZWZpbmUgRFBfUFNSX0NSQ19WRVJJRklDQVRJT07CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBCSVQoMikNCj4gPiA+ICsjIGRlZmluZSBEUF9QU1JfRlJBTUVfQ0FQVFVSRcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEJJVCgzKQ0KPiA+ID4gKyMgZGVmaW5l
IERQX1BTUl9TVV9SRUdJT05fU0NBTkxJTkVfQ0FQVFVSRcKgwqDCoMKgwqBCSVQoNCkgLyogZURQ
IDEuNGEgKi8NCj4gPiA+ICsjIGRlZmluZSBEUF9QU1JfSVJRX0hQRF9XSVRIX0NSQ19FUlJPUlPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEJJVCg1KSAvKiBlRFANCj4gPiA+IDEuNGEg
Ki8NCj4gPiA+ICsjIGRlZmluZSBEUF9QU1JfRU5BQkxFX1BTUjLCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgQklUKDYpIC8qIGVEUCAxLjRhICovDQo+ID4gPiDCoA0KPiA+
ID4gwqAjZGVmaW5lIERQX0FEQVBURVJfQ1RSTMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDFhMA0KPiA+ID4gwqAjIGRlZmluZSBEUF9BREFQ
VEVSX0NUUkxfRk9SQ0VfTE9BRF9TRU5TRcKgwqAgKDEgPDwgMCkNCj4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IEludGVsLWdmeCBtYWlsaW5n
IGxpc3QNCj4gPiBJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngNCj4gDQo+IFRo
aXMgc2hvdWxkIHByb2JhYmx5IGdvIHRocm91aCBkcm0tbWlzYy1uZXh0LCBJIGRvbid0IHNlZSB0
aGUgbmV4dCBwYXRjaCBkZXBlbmRpbmcgb24gdGhpcz8NCg0KVGhlIHBhdGNoIGRlcGVuZGluZyBv
biB0aGlzIGNoYW5nZSB3aWxsIGJlIHNlbnQgcmlnaHQgYWZ0ZXIgdGhpcyBvbmUgaXMgbWVyZ2Vk
Lg0KDQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

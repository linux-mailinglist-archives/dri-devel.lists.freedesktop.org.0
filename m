Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4968035CEF4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 18:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D934889BDB;
	Mon, 12 Apr 2021 16:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9DB89B49;
 Mon, 12 Apr 2021 16:57:21 +0000 (UTC)
IronPort-SDR: vopJR4zk04NAyLq7oyH6WpNlHI8iZJc0JqjbWmNdV9sa6XvrSN20bWwYsjnUwSvb/T7XFd5xco
 yoJiE7vqqecA==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="193797248"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="193797248"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 09:57:20 -0700
IronPort-SDR: xouNd4Vz+AyyhF1Gtu5Bd5wUL9pC0e315UKBEzk17+/XcKixurdTmhRrLxi2klYyLWTPq/yFJU
 I8I8KBMPBfKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="531949953"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by orsmga004.jf.intel.com with ESMTP; 12 Apr 2021 09:57:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 12 Apr 2021 17:57:17 +0100
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2106.013;
 Mon, 12 Apr 2021 09:57:16 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH 15/19] drm/i915: WA for zero memory channel
Thread-Topic: [PATCH 15/19] drm/i915: WA for zero memory channel
Thread-Index: AQHXL3uUfoLb8HUp/U6Xy2nEeUEJJ6qxkOYA
Date: Mon, 12 Apr 2021 16:57:16 +0000
Message-ID: <a7a6176fa4fdceec288cfe842349b06e1180a773.camel@intel.com>
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-16-matthew.auld@intel.com>
In-Reply-To: <20210412090526.30547-16-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-ID: <7A18931D590F5A4A88675FD1B16F2AA1@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIxLTA0LTEyIGF0IDEwOjA1ICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IEZyb206IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiAN
Cj4gQ29tbWl0IGM0NTdkOWNmMjU2ZSAoImRybS9pOTE1OiBNYWtlIHN1cmUgd2UgaGF2ZSBlbm91
Z2ggbWVtb3J5DQo+IGJhbmR3aWR0aCBvbiBJQ0wiKSBhc3N1bWVzIHRoYXQgd2UgYWx3YXlzIGhh
dmUgYSBub24temVybw0KPiBkcmFtX2luZm8tPmNoYW5uZWxzIGFuZCB1c2VzIGl0IGFzIGEgZGl2
aXNvci4gV2UgbmVlZCBudW0gbWVtb3J5DQo+IGNoYW5uZWxzIHRvIGJlIGF0IGxlYXN0IDEgZm9y
IHNhbmUgYncgbGltaXRzIGNoZWNraW5nLCBldmVuIHdoZW4gUENvZGUNCj4gcmV0dXJucyAwLCBz
byBsZXRzIGZvcmNlIGl0IHRvIDEgaW4gdGhpcyBjYXNlLg0KDQpNaXNzaW5nIG15IHNvYi4NCg0K
PiANCj4gQ2M6IFN0YW5pc2xhdiBMaXNvdnNraXkgPHN0YW5pc2xhdi5saXNvdnNraXlAaW50ZWwu
Y29tPg0KPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiBDYzog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGlu
dGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNo
aUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfYncuYyB8IDEgKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYncuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYncuYw0KPiBpbmRleCA1ODRhYjVjZTQx
MDYuLmM1ZjcwZjNlOTMwZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9idy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfYncuYw0KPiBAQCAtMTc1LDYgKzE3NSw3IEBAIHN0YXRpYyBpbnQgaWNsX2dldF9id19pbmZv
KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwgY29uc3Qgc3RydWN0IGludGVsDQo+
IMKgCQkJICAgICJGYWlsZWQgdG8gZ2V0IG1lbW9yeSBzdWJzeXN0ZW0gaW5mb3JtYXRpb24sIGln
bm9yaW5nIGJhbmR3aWR0aCBsaW1pdHMiKTsNCj4gwqAJCXJldHVybiByZXQ7DQo+IMKgCX0NCj4g
KwludW1fY2hhbm5lbHMgPSBtYXhfdCh1OCwgMSwgbnVtX2NoYW5uZWxzKTsNCj4gwqANCj4gDQo+
IA0KPiANCj4gwqAJZGVpbnRlcmxlYXZlID0gRElWX1JPVU5EX1VQKG51bV9jaGFubmVscywgaXNf
eV90aWxlID8gNCA6IDIpOw0KPiDCoAlkY2xrX21heCA9IGljbF9zYWd2X21heF9kY2xrKCZxaSk7
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

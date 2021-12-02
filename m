Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D23466ADA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 21:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8279F6EC18;
	Thu,  2 Dec 2021 20:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26906EB95;
 Thu,  2 Dec 2021 20:21:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="300203148"
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; d="scan'208";a="300203148"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 12:21:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; d="scan'208";a="561278742"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2021 12:21:41 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 2 Dec 2021 12:21:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 2 Dec 2021 12:21:40 -0800
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2308.020;
 Thu, 2 Dec 2021 12:21:40 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: replace X86_FEATURE_PAT with
 pat_enabled()
Thread-Topic: [Intel-gfx] [PATCH] drm/i915: replace X86_FEATURE_PAT with
 pat_enabled()
Thread-Index: AQHX5xPVu1jJB31nAkyMfbys7mLHMawgLJ+A
Date: Thu, 2 Dec 2021 20:21:40 +0000
Message-ID: <60cf8c1526ab304b2c77f9a9a959e40dc1c4e614.camel@intel.com>
References: <20211202003048.1015511-1-lucas.demarchi@intel.com>
In-Reply-To: <20211202003048.1015511-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5C51EB4D09ED542BA9C1972F9DD5E5C@intel.com>
Content-Transfer-Encoding: base64
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTEyLTAxIGF0IDE2OjMwIC0wODAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IFBBVCBjYW4gYmUgZGlzYWJsZWQgb24gYm9vdCB3aXRoICJub3BhdCIgaW4gdGhlIGNvbW1h
bmQgbGluZS4gUmVwbGFjZQ0KPiBvbmUgeDg2LWlzbSB3aXRoIGFub3RoZXIsIHdoaWNoIGlzIHNs
aWdodGx5IG1vcmUgY29ycmVjdCB0byBwcmVwYXJlIGZvcg0KPiBzdXBwb3J0aW5nIG90aGVyIGFy
Y2hpdGVjdHVyZXMuDQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3Nl
LnNvdXphQGludGVsLmNvbT4NCg0KPiANCj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3Bl
ckBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVt
YXJjaGlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbV9tbWFuLmMgIHwgOCArKysrLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX3BhZ2VzLmMgfCAzICstLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL2k5MTVfZ2VtX21tYW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dl
bV9tbWFuLmMNCj4gaW5kZXggNjVmYzZmZjVmNTlkLi5jMGM1MDllNWMwYWUgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9tbWFuLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX21tYW4uYw0KPiBAQCAtNzIsNyArNzIsNyBA
QCBpOTE1X2dlbV9tbWFwX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEs
DQo+ICAJaWYgKGFyZ3MtPmZsYWdzICYgfihJOTE1X01NQVBfV0MpKQ0KPiAgCQlyZXR1cm4gLUVJ
TlZBTDsNCj4gIA0KPiAtCWlmIChhcmdzLT5mbGFncyAmIEk5MTVfTU1BUF9XQyAmJiAhYm9vdF9j
cHVfaGFzKFg4Nl9GRUFUVVJFX1BBVCkpDQo+ICsJaWYgKGFyZ3MtPmZsYWdzICYgSTkxNV9NTUFQ
X1dDICYmICFwYXRfZW5hYmxlZCgpKQ0KPiAgCQlyZXR1cm4gLUVOT0RFVjsNCj4gIA0KPiAgCW9i
aiA9IGk5MTVfZ2VtX29iamVjdF9sb29rdXAoZmlsZSwgYXJncy0+aGFuZGxlKTsNCj4gQEAgLTcz
Niw3ICs3MzYsNyBAQCBpOTE1X2dlbV9kdW1iX21tYXBfb2Zmc2V0KHN0cnVjdCBkcm1fZmlsZSAq
ZmlsZSwNCj4gIA0KPiAgCWlmIChIQVNfTE1FTSh0b19pOTE1KGRldikpKQ0KPiAgCQltbWFwX3R5
cGUgPSBJOTE1X01NQVBfVFlQRV9GSVhFRDsNCj4gLQllbHNlIGlmIChib290X2NwdV9oYXMoWDg2
X0ZFQVRVUkVfUEFUKSkNCj4gKwllbHNlIGlmIChwYXRfZW5hYmxlZCgpKQ0KPiAgCQltbWFwX3R5
cGUgPSBJOTE1X01NQVBfVFlQRV9XQzsNCj4gIAllbHNlIGlmICghaTkxNV9nZ3R0X2hhc19hcGVy
dHVyZSgmdG9faTkxNShkZXYpLT5nZ3R0KSkNCj4gIAkJcmV0dXJuIC1FTk9ERVY7DQo+IEBAIC03
OTIsNyArNzkyLDcgQEAgaTkxNV9nZW1fbW1hcF9vZmZzZXRfaW9jdGwoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gIAkJYnJlYWs7DQo+ICANCj4gIAljYXNlIEk5MTVfTU1B
UF9PRkZTRVRfV0M6DQo+IC0JCWlmICghYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1BBVCkpDQo+
ICsJCWlmICghcGF0X2VuYWJsZWQoKSkNCj4gIAkJCXJldHVybiAtRU5PREVWOw0KPiAgCQl0eXBl
ID0gSTkxNV9NTUFQX1RZUEVfV0M7DQo+ICAJCWJyZWFrOw0KPiBAQCAtODAyLDcgKzgwMiw3IEBA
IGk5MTVfZ2VtX21tYXBfb2Zmc2V0X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQg
KmRhdGEsDQo+ICAJCWJyZWFrOw0KPiAgDQo+ICAJY2FzZSBJOTE1X01NQVBfT0ZGU0VUX1VDOg0K
PiAtCQlpZiAoIWJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9QQVQpKQ0KPiArCQlpZiAoIXBhdF9l
bmFibGVkKCkpDQo+ICAJCQlyZXR1cm4gLUVOT0RFVjsNCj4gIAkJdHlwZSA9IEk5MTVfTU1BUF9U
WVBFX1VDOw0KPiAgCQlicmVhazsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV9wYWdlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X3BhZ2VzLmMNCj4gaW5kZXggNDljNmU1NWM2OGNlLi44OWI3MGY1Y2RlN2EgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9wYWdlcy5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9wYWdlcy5jDQo+IEBAIC00MjQsOCArNDI0
LDcgQEAgdm9pZCAqaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXAoc3RydWN0IGRybV9pOTE1X2dlbV9v
YmplY3QgKm9iaiwNCj4gIAkJCWdvdG8gZXJyX3VucGluOw0KPiAgCQl9DQo+ICANCj4gLQkJaWYg
KEdFTV9XQVJOX09OKHR5cGUgPT0gSTkxNV9NQVBfV0MgJiYNCj4gLQkJCQkhc3RhdGljX2NwdV9o
YXMoWDg2X0ZFQVRVUkVfUEFUKSkpDQo+ICsJCWlmIChHRU1fV0FSTl9PTih0eXBlID09IEk5MTVf
TUFQX1dDICYmICFwYXRfZW5hYmxlZCgpKSkNCj4gIAkJCXB0ciA9IEVSUl9QVFIoLUVOT0RFVik7
DQo+ICAJCWVsc2UgaWYgKGk5MTVfZ2VtX29iamVjdF9oYXNfc3RydWN0X3BhZ2Uob2JqKSkNCj4g
IAkJCXB0ciA9IGk5MTVfZ2VtX29iamVjdF9tYXBfcGFnZShvYmosIHR5cGUpOw0KDQo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF64457328
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 17:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D1C6E17C;
	Fri, 19 Nov 2021 16:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270CB6E06B;
 Fri, 19 Nov 2021 16:36:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="234274406"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="234274406"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 08:36:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="455836540"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 19 Nov 2021 08:36:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 19 Nov 2021 08:36:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 19 Nov 2021 08:36:56 -0800
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2242.012;
 Fri, 19 Nov 2021 08:36:56 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/5] drm/i915/dg2: extend Wa_1409120013 to DG2
Thread-Topic: [PATCH v3 5/5] drm/i915/dg2: extend Wa_1409120013 to DG2
Thread-Index: AQHX2xIqj+cfS646BEGaQFoRxfUA2awLl3iA
Date: Fri, 19 Nov 2021 16:36:56 +0000
Message-ID: <8be6ba7e22774dd2ca42518f0a9af3cf5dd19d1f.camel@intel.com>
References: <20211116174818.2128062-1-matthew.d.roper@intel.com>
 <20211116174818.2128062-6-matthew.d.roper@intel.com>
In-Reply-To: <20211116174818.2128062-6-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C187FB38690CB240A74038A22FEC776F@intel.com>
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
Cc: "Atwood, Matthew S" <matthew.s.atwood@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIxLTExLTE2IGF0IDA5OjQ4IC0wODAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBG
cm9tOiBNYXR0IEF0d29vZCA8bWF0dGhldy5zLmF0d29vZEBpbnRlbC5jb20+DQo+IA0KPiBFeHRl
bmQgZXhpc3Rpbmcgd29ya2Fyb3VuZCAxNDA5MTIwMDEzIHRvIERHMi4NCj4gDQo+IENjOiBKb3PD
qSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogTWF0dCBBdHdvb2QgPG1hdHRoZXcucy5hdHdvb2RAaW50ZWwuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X3BtLmMNCj4gaW5kZXggODlkYzdmNjliYWYzLi5lNzIxYzQyMWNjNTggMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaW50ZWxfcG0uYw0KPiBAQCAtNzQ0NCw5ICs3NDQ0LDkgQEAgc3RhdGljIHZvaWQgaWNs
X2luaXRfY2xvY2tfZ2F0aW5nKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikNCj4g
IA0KPiAgc3RhdGljIHZvaWQgZ2VuMTJscF9pbml0X2Nsb2NrX2dhdGluZyhzdHJ1Y3QgZHJtX2k5
MTVfcHJpdmF0ZSAqZGV2X3ByaXYpDQo+ICB7DQo+IC0JLyogV2FfMTQwOTEyMDAxMzp0Z2wscmts
LGFkbC1zLGRnMSAqLw0KPiArCS8qIFdhXzE0MDkxMjAwMTM6dGdsLHJrbCxhZGwtcyxkZzEsZGcy
ICovDQoNCkknbSBub3QgZmluZGluZyB0aGlzIHdvcmthcm91bmQgaW4gdGhlIERHMiBXQSBzcGVj
IHBhZ2UsIG1heWJlIGl0IHdhcyByZW1vdmVkIGJlY2F1c2UgaXQgaXMgbm90IG5lY2Vzc2FyeSBh
bnltb3JlPw0KDQo+ICAJaWYgKElTX1RJR0VSTEFLRShkZXZfcHJpdikgfHwgSVNfUk9DS0VUTEFL
RShkZXZfcHJpdikgfHwNCj4gLQkgICAgSVNfQUxERVJMQUtFX1MoZGV2X3ByaXYpIHx8IElTX0RH
MShkZXZfcHJpdikpDQo+ICsJICAgIElTX0FMREVSTEFLRV9TKGRldl9wcml2KSB8fCBJU19ERzEo
ZGV2X3ByaXYpIHx8IElTX0RHMihkZXZfcHJpdikpDQo+ICAJCWludGVsX3VuY29yZV93cml0ZSgm
ZGV2X3ByaXYtPnVuY29yZSwgSUxLX0RQRkNfQ0hJQ0tFTiwNCj4gIAkJCQkgICBEUEZDX0NISUNL
RU5fQ09NUF9EVU1NWV9QSVhFTCk7DQo+ICANCg0K

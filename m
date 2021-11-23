Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C994045ACA1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 20:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A4C6E221;
	Tue, 23 Nov 2021 19:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0406A6E221;
 Tue, 23 Nov 2021 19:37:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="258990952"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="258990952"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 11:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="740749591"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 23 Nov 2021 11:37:13 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 23 Nov 2021 11:37:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 23 Nov 2021 11:37:12 -0800
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2242.012;
 Tue, 23 Nov 2021 11:37:12 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Manna, Animesh" <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/5] drm/i915/panelreplay: dpcd register definition for
 panelreplay
Thread-Topic: [PATCH v3 1/5] drm/i915/panelreplay: dpcd register definition
 for panelreplay
Thread-Index: AQHXvdMbU+LIe5afkkGIhVCDLK7ZfqwSTa0A
Date: Tue, 23 Nov 2021 19:37:12 +0000
Message-ID: <5b91f3f1f0397401ea6bbc408940027448494259.camel@intel.com>
References: <20211010121039.14725-1-animesh.manna@intel.com>
 <20211010121039.14725-2-animesh.manna@intel.com>
In-Reply-To: <20211010121039.14725-2-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <76507B065478F340BCB02A169E95511F@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Navare,
 Manasi D" <manasi.d.navare@intel.com>, "Kahola, Mika" <mika.kahola@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyMDIxLTEwLTEwIGF0IDE3OjQwICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBEUENEIHJlZ2lzdGVyIGRlZmluaXRpb24gYWRkZWQgdG8gY2hlY2sgYW5kIGVuYWJsZSBwYW5l
bCByZXBsYXkNCj4gY2FwYWJpbGl0eSBvZiB0aGUgc2luay4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGluY2x1
ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCB8IDYgKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBl
ci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oDQo+IGluZGV4IGI1MmRmNGRiM2U4Zi4u
OGEyYjkyOWMzZjg4IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgN
Cj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oDQo+IEBAIC01NDEsNiArNTQxLDkg
QEAgc3RydWN0IGRybV9wYW5lbDsNCj4gIC8qIERGUCBDYXBhYmlsaXR5IEV4dGVuc2lvbiAqLw0K
PiAgI2RlZmluZSBEUF9ERlBfQ0FQQUJJTElUWV9FWFRFTlNJT05fU1VQUE9SVAkweDBhMwkvKiAy
LjAgKi8NCj4gIA0KPiArI2RlZmluZSBEUF9QQU5FTF9SRVBMQVlfQ0FQICAgICAgICAgICAgICAg
ICAweDBiMA0KPiArIyBkZWZpbmUgUEFORUxfUkVQTEFZX1NVUFBPUlQgICAgICAgICAgICAgICAo
MSA8PCAwKQ0KDQpNaXNzaW5nIGJpdCAxLCB0aGF0IGlzIHZlcnkgaW1wb3J0YW50IHdoZW4gcGFu
ZWwgZG8gbm90IHN1cHBvcnQgc2VsZWN0aXZlIHVwZGF0ZSBwYW5lbCByZXBsYXkgbmVlZHMgdG8g
YWN0IGxpa2UgUFNSMSB3aGVuIGl0IGlzIHNldHMgaXQgbmVlZHMgdG8gYWN0DQpsaWtlIFBTUjIu
DQoNCj4gKw0KPiAgLyogTGluayBDb25maWd1cmF0aW9uICovDQo+ICAjZGVmaW5lCURQX0xJTktf
QldfU0VUCQkgICAgICAgICAgICAweDEwMA0KPiAgIyBkZWZpbmUgRFBfTElOS19SQVRFX1RBQkxF
CQkgICAgMHgwMCAgICAvKiBlRFAgMS40ICovDQo+IEBAIC03MDksNiArNzEyLDkgQEAgc3RydWN0
IGRybV9wYW5lbDsNCj4gICNkZWZpbmUgRFBfQlJBTkNIX0RFVklDRV9DVFJMCQkgICAgMHgxYTEN
Cj4gICMgZGVmaW5lIERQX0JSQU5DSF9ERVZJQ0VfSVJRX0hQRAkgICAgKDEgPDwgMCkNCj4gIA0K
PiArI2RlZmluZSBQQU5FTF9SRVBMQVlfQ09ORklHICAgICAgICAgICAgICAgICAweDFiMA0KPiAr
IyBkZWZpbmUgUEFORUxfUkVQTEFZX0VOQUJMRSAgICAgICAgICAgICAgICAoMSA8PCAwKQ0KDQpB
bGwgb3RoZXIgYml0cyBhcmUgYWxzbyBpbXBvcnRhbnQsIGZvciB0aGUgZXJyb3JzIG9uZXMgd2Ug
aGF2ZSBQU1IgY291bnRlciBwYXJ0cyBhbmQgeW91ciBhcmUgbWlzc2luZyB0aGUgZXJyb3Igc3Rh
dHVzIHJlZ2lzdGVyLg0KDQo+ICsNCj4gICNkZWZpbmUgRFBfUEFZTE9BRF9BTExPQ0FURV9TRVQJ
CSAgICAweDFjMA0KPiAgI2RlZmluZSBEUF9QQVlMT0FEX0FMTE9DQVRFX1NUQVJUX1RJTUVfU0xP
VCAweDFjMQ0KPiAgI2RlZmluZSBEUF9QQVlMT0FEX0FMTE9DQVRFX1RJTUVfU0xPVF9DT1VOVCAw
eDFjMg0KDQo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB6B9FCBC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846938982D;
	Wed, 28 Aug 2019 08:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892D58982D;
 Wed, 28 Aug 2019 08:19:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 01:19:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; d="scan'208";a="183052686"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga003.jf.intel.com with ESMTP; 28 Aug 2019 01:19:02 -0700
Received: from fmsmsx123.amr.corp.intel.com (10.18.125.38) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 28 Aug 2019 01:18:56 -0700
Received: from HASMSX109.ger.corp.intel.com (10.184.198.21) by
 fmsmsx123.amr.corp.intel.com (10.18.125.38) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 28 Aug 2019 01:18:55 -0700
Received: from hasmsx108.ger.corp.intel.com ([169.254.9.203]) by
 hasmsx109.ger.corp.intel.com ([169.254.3.38]) with mapi id 14.03.0439.000;
 Wed, 28 Aug 2019 11:18:53 +0300
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "C, Ramalingam" <ramalingam.c@intel.com>
Subject: RE: [PATCH v11 3/6] drm: Extend I915 mei interface for transcoder info
Thread-Topic: [PATCH v11 3/6] drm: Extend I915 mei interface for transcoder
 info
Thread-Index: AQHVXXJWh+Xm2TWwf0O+zdcnfB1leacQMY6g///TO4CAADK2EA==
Date: Wed, 28 Aug 2019 08:18:52 +0000
Message-ID: <5B8DA87D05A7694D9FA63FD143655C1B9DCA5EEF@hasmsx108.ger.corp.intel.com>
References: <20190828072823.4832-1-ramalingam.c@intel.com>
 <20190828072823.4832-4-ramalingam.c@intel.com>
 <5B8DA87D05A7694D9FA63FD143655C1B9DCA5EAE@hasmsx108.ger.corp.intel.com>
 <20190828081709.GC20745@intel.com>
In-Reply-To: <20190828081709.GC20745@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjA2NGE5YTYtZTg0OS00NjIwLWJhN2EtZjU0ZWU5YzdkYTA3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNnFLVTR4RjVhdXVPMTlyQnlnNXdqdkp2VnREWWtUVXQ1ZDQrMDdUZndBeUFPY1VZOEc3c25tUndIUlJLeTFPWiJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.184.70.11]
MIME-Version: 1.0
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gDQo+IE9uIDIwMTktMDgtMjggYXQgMTM6Mjg6MDYgKzA1MzAsIFdpbmtsZXIsIFRvbWFz
IHdyb3RlOg0KPiA+ID4gSTkxNSBuZWVkcyB0byBzZW5kIHRoZSBpbmRleCBvZiB0aGUgdHJhbnNj
b2RlciBhcyBwZXIgTUUgRlcuDQo+ID4gPg0KPiA+ID4gVG8gc3VwcG9ydCB0aGlzLCBkZWZpbmUg
ZW51bSBtZWlfZndfdGMgYW5kIGFkZCBhcyBhIG1lbWJlciBpbnRvIHRoZQ0KPiA+ID4gc3RydWN0
IGhkY3BfcG9ydF9kYXRhLg0KPiA+ID4NCj4gPiA+IHYyOg0KPiA+ID4gICBUeXBvIGluIGNvbW1p
dCBtc2cgaXMgZml4ZWQgW1NoYXNoYW5rXQ0KPiA+ID4gdjM6DQo+ID4gPiAgIGtkb2MgaXMgYWRk
ZWQgZm9yIG1laV9md190YyBbVG9tYXNdDQo+ID4gPiAgIHMvTUVJX1RDX3gvTUVJX1RSQU5TQ09E
RVJfeA0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJhbWFsaW5nYW0gQyA8cmFtYWxpbmdh
bS5jQGludGVsLmNvbT4NCj4gPiA+IEFja2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFA
aW50ZWwuY29tPg0KPiA+DQo+ID4gTEdUTSwganVzdCBuZWVkIHRvIHVwZGF0ZWQgdGhlIGNvcHly
aWdodCB5ZWFyLg0KPiBUb21hcywNCj4gDQo+IENvcHlyaWdodCB5ZWFyIGZvciB0aGlzIGk5MTVf
bWVpX2hkY3BfaW50ZXJmYWNlLmggaXMgdXBkYXRlZCBpbiB0aGUgMXN0IHBhdGNoDQo+IGl0c2Vs
Zi4NCg0KT2theS4NCj4gDQo+IC1SYW0NCj4gPg0KPiA+ID4gLS0tDQo+ID4gPiAgaW5jbHVkZS9k
cm0vaTkxNV9tZWlfaGRjcF9pbnRlcmZhY2UuaCB8IDI0DQo+ICsrKysrKysrKysrKysrKysrKysr
KysrKw0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspDQo+ID4gPg0KPiA+
ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmgNCj4g
PiA+IGIvaW5jbHVkZS9kcm0vaTkxNV9tZWlfaGRjcF9pbnRlcmZhY2UuaA0KPiA+ID4gaW5kZXgg
MDg2NzBhYTY1MGQ0Li40ZDQ4ZGU4ODkwY2EgMTAwNjQ0DQo+ID4gPiAtLS0gYS9pbmNsdWRlL2Ry
bS9pOTE1X21laV9oZGNwX2ludGVyZmFjZS5oDQo+ID4gPiArKysgYi9pbmNsdWRlL2RybS9pOTE1
X21laV9oZGNwX2ludGVyZmFjZS5oDQo+ID4gPiBAQCAtNTQsOSArNTQsMzIgQEAgZW51bSBtZWlf
ZndfZGRpIHsNCj4gPiA+ICAJTUVJX0RESV9SQU5HRV9FTkQgPSBNRUlfRERJX0EsDQo+ID4gPiAg
fTsNCj4gPiA+DQo+ID4gPiArLyoqDQo+ID4gPiArICogZW51bSBtZWlfZndfdGMgLSBNRSBGaXJt
d2FyZSBkZWZpbmVkIGluZGV4IGZvciB0cmFuc2NvZGVycw0KPiA+ID4gKyAqIEBNRUlfSU5WQUxJ
RF9UUkFOU0NPREVSOiBJbmRleCBmb3IgSW52YWxpZCB0cmFuc2NvZGVyDQo+ID4gPiArICogQE1F
SV9UUkFOU0NPREVSX0VEUDogSW5kZXggZm9yIEVEUCBUcmFuc2NvZGVyDQo+ID4gPiArICogQE1F
SV9UUkFOU0NPREVSX0RTSTA6IEluZGV4IGZvciBEU0kwIFRyYW5zY29kZXINCj4gPiA+ICsgKiBA
TUVJX1RSQU5TQ09ERVJfRFNJMTogSW5kZXggZm9yIERTSTEgVHJhbnNjb2Rlcg0KPiA+ID4gKyAq
IEBNRUlfVFJBTlNDT0RFUl9BOiBJbmRleCBmb3IgVHJhbnNjb2RlciBBDQo+ID4gPiArICogQE1F
SV9UUkFOU0NPREVSX0I6IEluZGV4IGZvciBUcmFuc2NvZGVyIEINCj4gPiA+ICsgKiBATUVJX1RS
QU5TQ09ERVJfQzogSW5kZXggZm9yIFRyYW5zY29kZXIgQw0KPiA+ID4gKyAqIEBNRUlfVFJBTlND
T0RFUl9EOiBJbmRleCBmb3IgVHJhbnNjb2RlciBEICAqLyBlbnVtIG1laV9md190YyB7DQo+ID4g
PiArCU1FSV9JTlZBTElEX1RSQU5TQ09ERVIgPSAweDAwLA0KPiA+ID4gKwlNRUlfVFJBTlNDT0RF
Ul9FRFAsDQo+ID4gPiArCU1FSV9UUkFOU0NPREVSX0RTSTAsDQo+ID4gPiArCU1FSV9UUkFOU0NP
REVSX0RTSTEsDQo+ID4gPiArCU1FSV9UUkFOU0NPREVSX0EgPSAweDEwLA0KPiA+ID4gKwlNRUlf
VFJBTlNDT0RFUl9CLA0KPiA+ID4gKwlNRUlfVFJBTlNDT0RFUl9DLA0KPiA+ID4gKwlNRUlfVFJB
TlNDT0RFUl9EDQo+ID4gPiArfTsNCj4gPiA+ICsNCj4gPiA+ICAvKioNCj4gPiA+ICAgKiBzdHJ1
Y3QgaGRjcF9wb3J0X2RhdGEgLSBpbnRlbCBzcGVjaWZpYyBIRENQIHBvcnQgZGF0YQ0KPiA+ID4g
ICAqIEBmd19kZGk6IGRkaSBpbmRleCBhcyBwZXIgTUUgRlcNCj4gPiA+ICsgKiBAZndfdGM6IHRy
YW5zY29kZXIgaW5kZXggYXMgcGVyIE1FIEZXDQo+ID4gPiAgICogQHBvcnRfdHlwZTogSERDUCBw
b3J0IHR5cGUgYXMgcGVyIE1FIEZXIGNsYXNzaWZpY2F0aW9uDQo+ID4gPiAgICogQHByb3RvY29s
OiBIRENQIGFkYXB0YXRpb24gYXMgcGVyIE1FIEZXDQo+ID4gPiAgICogQGs6IE5vIG9mIHN0cmVh
bXMgdHJhbnNtaXR0ZWQgb24gYSBwb3J0LiBPbmx5IG9uIERQIE1TVCB0aGlzIGlzDQo+ID4gPiAh
PSAxIEBAIC0NCj4gPiA+IDY5LDYgKzkyLDcgQEAgZW51bSBtZWlfZndfZGRpIHsNCj4gPiA+ICAg
Ki8NCj4gPiA+ICBzdHJ1Y3QgaGRjcF9wb3J0X2RhdGEgew0KPiA+ID4gIAllbnVtIG1laV9md19k
ZGkgZndfZGRpOw0KPiA+ID4gKwllbnVtIG1laV9md190YyBmd190YzsNCj4gPiA+ICAJdTggcG9y
dF90eXBlOw0KPiA+ID4gIAl1OCBwcm90b2NvbDsNCj4gPiA+ICAJdTE2IGs7DQo+ID4gPiAtLQ0K
PiA+ID4gMi4yMC4xDQo+ID4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==

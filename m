Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE6F44DC27
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 20:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B705C6E1E0;
	Thu, 11 Nov 2021 19:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426096E1E0;
 Thu, 11 Nov 2021 19:26:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="319200256"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="319200256"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 11:26:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="590109891"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2021 11:26:26 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 11:26:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 11:26:25 -0800
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2242.012;
 Thu, 11 Nov 2021 11:26:25 -0800
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/rpm: Enable runtime pm
 autosuspend by default
Thread-Topic: [Intel-gfx] [PATCH 1/1] drm/i915/rpm: Enable runtime pm
 autosuspend by default
Thread-Index: AQHX1fPxelaTPmb35kKm4iLHqMv4M6v9K3sAgACyJACAAO+sgIAAcPGA
Date: Thu, 11 Nov 2021 19:26:25 +0000
Message-ID: <93b5a7b1d4c1c4505e3669cbc32306e1b0b0c41b.camel@intel.com>
References: <20211110052926.2881092-1-tilak.tangudu@intel.com>
 <20211110052926.2881092-2-tilak.tangudu@intel.com>
 <YYuxJs0dAYvZAL3+@intel.com> <YYxGljFixGqaO3Ti@intel.com>
 <YY0Po9k9biW6mR3Q@intel.com>
In-Reply-To: <YY0Po9k9biW6mR3Q@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <38DF47C4E9D61B448DEF8E7965CCA35B@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Tangudu, Tilak" <tilak.tangudu@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIxLTExLTExIGF0IDE0OjQyICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFdlZCwgTm92IDEwLCAyMDIxIGF0IDA1OjI0OjIyUE0gLTA1MDAsIFJvZHJpZ28gVml2
aSB3cm90ZToNCj4gPiBPbiBXZWQsIE5vdiAxMCwgMjAyMSBhdCAwMTo0Njo0NlBNICswMjAwLCBW
aWxsZSBTeXJqw6Rsw6Qgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIE5vdiAxMCwgMjAyMSBhdCAxMDo1
OToyNkFNICswNTMwLCBUaWxhayBUYW5ndWR1IHdyb3RlOg0KPiA+ID4gPiBFbmFibGUgcnVudGlt
ZSBwbSBhdXRvc3VzcGVuZCBieSBkZWZhdWx0IGZvciBnZW4xMiBhbmQNCj4gPiA+ID4gbGF0ZXIg
dmVyc2lvbnMuDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUaWxhayBUYW5ndWR1
IDx0aWxhay50YW5ndWR1QGludGVsLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IMKgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaW50ZWxfcnVudGltZV9wbS5jIHwgNCArKysrDQo+ID4gPiA+IMKgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRpbWVfcG0uYw0KPiA+ID4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRpbWVfcG0uYw0KPiA+ID4gPiBpbmRleCBlYWY3
Njg4ZjUxN2QuLmVmNzVmMjQyODhlZiAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaW50ZWxfcnVudGltZV9wbS5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2ludGVsX3J1bnRpbWVfcG0uYw0KPiA+ID4gPiBAQCAtNjAwLDYgKzYwMCwxMCBAQCB2
b2lkIGludGVsX3J1bnRpbWVfcG1fZW5hYmxlKHN0cnVjdA0KPiA+ID4gPiBpbnRlbF9ydW50aW1l
X3BtICpycG0pDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcG1fcnVu
dGltZV91c2VfYXV0b3N1c3BlbmQoa2Rldik7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqB9DQo+
ID4gPiA+IMKgDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoC8qIFhYWDogRW5hYmxlIGJ5IGRlZmF1
bHQgb25seSBmb3IgbmV3ZXIgcGxhdGZvcm1zIGZvcg0KPiA+ID4gPiBub3cgKi8NCj4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgaWYgKEdSQVBISUNTX1ZFUihpOTE1KSA+PSAxMikNCj4gPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBtX3J1bnRpbWVfYWxsb3coa2Rldik7DQo+ID4g
PiANCj4gPiA+IElmIHdlIGNoYW5nZSBzb21lIGRlZmF1bHQgdGhlbiB3ZSBzaG91bGQganVzdCBk
byBpdCBhY3Jvc3MgdGhlDQo+ID4gPiBib2FyZC4NCj4gPiA+IFRoZXJlIGlzIG5vdGhpbmcgc3Bl
Y2lhbCBhYm91dCB0Z2wrLg0KPiA+IA0KPiA+IE5vdGhpbmcgc3BlY2lhbCB3aXRoIHRnbCBhbmQg
bmV3ZXIgcGxhdGZvcm1zIGluZGVlZC4gVGhpcyBpcyB3aHkgd2UNCj4gPiBoYXZlIHRoZSBYWFgg
bWVzc2FnZSBoZXJlLg0KPiA+IA0KPiA+IFRoZSBwcm9ibGVtIGluIHRoZSBsYXN0IGF0dGVtcHQg
d2FzIHdpdGggdGhlIGdlbjkgcGxhdGZvcm1zLg0KPiANCj4gV2hhdCBwcm9ibGVtIHdhcyB0aGF0
Pw0KDQp1bmZvcnR1bmF0ZWx5IGl0IGxvb2tzIGxpa2UgdGhlIGxvZ3MgYXJlIG5vdCBhdmFpbGFi
bGUgYW55bW9yZS4gOigNCg0KVGlsYWssIGNvdWxkIHlvdSBwbGVhc2Ugc2VuZCB0aGlzIHBhdGNo
IHdpdGhvdXQgdGhlIGlmPw0KDQpzbyB3ZSBjYW4gYXQNCmxlYXN0IG1ha2Ugc3VyZSB3ZSBzcG90
IHRoZSBkaWZmZXJlbmNlcyBhbmQgc2VlIGlmIHRoZXJlJ3Mgc29tZXRoaW5nDQpxdWljayB0aGF0
IHdlIGNhbiBkbyBhYm91dCB0aGUgZ2VuOSBvciBpZiB3ZSBzaG91bGQgdGFrZSB0aGlzIHBhdGgg
b2YNCmdlbjEyLCB0aGVuIGZpeCBnZW45ICwgdGhlbiBlbmFibGUgZXZleXdoZXJlLi4uLg0KDQo+
IA0KPiA+IEFwcGFyZW50bHkgc29tZSBzcGVjaWFsIHRoZXJlLCBhbmQgSSBkaWRuJ3Qgd2FudCB0
byBibG9jayB0aGUNCj4gPiBwcm9ncmVzcyB3aGlsZSB3ZSBjYW5ub3QgZ2V0IHRvIHRoZSBnZW45
IGJ1Z3MuDQo+ID4gDQo+ID4gPiANCj4gPiA+ID4gKw0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
LyoNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCAqIFRoZSBjb3JlIGNhbGxzIHRoZSBkcml2ZXIg
bG9hZCBoYW5kbGVyIHdpdGggYW4gUlBNDQo+ID4gPiA+IHJlZmVyZW5jZSBoZWxkLg0KPiA+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgICogV2UgZHJvcCB0aGF0IGhlcmUgYW5kIHdpbGwgcmVhY3F1aXJl
IGl0IGR1cmluZw0KPiA+ID4gPiB1bmxvYWRpbmcgaW4NCj4gPiA+ID4gLS0gDQo+ID4gPiA+IDIu
MjUuMQ0KPiA+ID4gDQo+ID4gPiAtLSANCj4gPiA+IFZpbGxlIFN5cmrDpGzDpA0KPiA+ID4gSW50
ZWwNCj4gDQoNCg==

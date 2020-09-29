Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48EB27D848
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 22:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC5089A60;
	Tue, 29 Sep 2020 20:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2CB8997A;
 Tue, 29 Sep 2020 20:34:23 +0000 (UTC)
IronPort-SDR: LLsrxxsh+KZimydAcBwKdPvij+8Y9vtZ1Xv9DlmhXStIttBWJ/s1pFn/ZygVDIf/J+ruVTI87g
 gpjIKdF2bYvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="223882935"
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; d="scan'208";a="223882935"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 13:34:21 -0700
IronPort-SDR: NhLStUaT5xLi+BTBOr1qPwQ31wKMhkXugY5lllQ4Z0wrPvBPdLtmxuC/bzPUZK3QmVknUSHbW5
 J4IDyUgBy5Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; d="scan'208";a="350403239"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Sep 2020 13:34:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Sep 2020 13:34:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Sep 2020 13:34:20 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.1713.004;
 Tue, 29 Sep 2020 13:34:20 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/edp/jsl: Update vswing table for HBR and HBR2
Thread-Topic: [PATCH v2] drm/i915/edp/jsl: Update vswing table for HBR and HBR2
Thread-Index: AQHWllrGdTtP8/4hEUmPXk76f06tQqmAeHQAgAAG+ICAAAYNAIAAAd8AgAACCAA=
Date: Tue, 29 Sep 2020 20:34:19 +0000
Message-ID: <6880cd26db1ded393d2a0d90dba4e7c4961f0a4a.camel@intel.com>
References: <20200929121127.254086-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <d235e6f34182e327d8bb46383f6c3ef518b5fc23.camel@intel.com>
 <20200929200201.GH6112@intel.com>
 <a4a075597c7d3e65b25598ab696a59eccbd2a069.camel@intel.com>
 <20200929203022.GI6112@intel.com>
In-Reply-To: <20200929203022.GI6112@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-ID: <F616FCE7E6FB5E4DB8CB0765CA5C6BAC@intel.com>
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
Cc: "Pandey, Hariom" <hariom.pandey@intel.com>, "Ausmus,
 James" <james.ausmus@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTA5LTI5IGF0IDIzOjMwICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFR1ZSwgU2VwIDI5LCAyMDIwIGF0IDA4OjIwOjIyUE0gKzAwMDAsIFNvdXphLCBKb3Nl
IHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAyMC0wOS0yOSBhdCAyMzowMiArMDMwMCwgVmlsbGUgU3ly
asOkbMOkIHdyb3RlOg0KPiA+ID4gT24gVHVlLCBTZXAgMjksIDIwMjAgYXQgMDc6MzM6NDVQTSAr
MDAwMCwgU291emEsIEpvc2Ugd3JvdGU6DQo+ID4gPiA+IE9uIFR1ZSwgMjAyMC0wOS0yOSBhdCAx
Nzo0MSArMDUzMCwgVGVqYXMgVXBhZGh5YXkgd3JvdGU6DQo+ID4gPiA+ID4gSlNMIGhhcyB1cGRh
dGUgaW4gdnN3aW5nIHRhYmxlIGZvciBlRFANCj4gPiA+ID4gDQo+ID4gPiA+IFdvdWxkIGJlIG5p
Y2UgdG8gbWVudGlvbiBpbiB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIHdoeSBQQ0ggaXMgYmVpbmcg
dXNlZCwgdGhhdCB3b3VsZCBhdm9pZCBWaWxsZSdzIHF1ZXN0aW9uLg0KPiA+ID4gDQo+ID4gPiBJ
ZiB0aGUgdGhpbmcgaGFzIG5vdGhpbmcgdG8gZG8gUENIIHRoZW4gaXQgc2hvdWxkIG5vdCB1c2Ug
dGhlIFBDSCB0eXBlDQo+ID4gPiBmb3IgdGhlIHRoZSBjaGVjay4gSW5zdGVhZCB3ZSBzaG91bGQg
anVzdCBkbyB0aGUgRUhML0pTTCBzcGxpdC4NCj4gPiANCj4gPiBJbiB0aGUgZmlyc3QgdmVyc2lv
biBNYXR0IFJvcGVyIHN1Z2dlc3RlZCB0byB1c2UgUENIIHRvIGRpZmZlcmVudGlhdGUgYmV0d2Vl
biBFSEwgYW5kIEpTTCwgSmFuaSBhbHNvIGFncmVlZCB3aXRoIHRoaXMgc29sdXRpb24uVGhpcyAy
IFBDSHMgY2FuIG9ubHkgYmUNCj4gPiBhc3NvY2lhdGUgd2l0aCBFSEwgYW5kIEpTTCByZXNwZWN0
aXZlbHksIHNvIG5vIGRvd25zaWRlcyBoZXJlLg0KPiANCj4gVGhlIGRvd25zaWRlIGlzIHRoYXQg
dGhlIGNvZGUgbWFrZXMgbm8gc2Vuc2Ugb24gdGhlIGZpcnN0IGdsYW5jZS4NCj4gSXQncyBnb2lu
ZyB0byBnZW5lcmF0ZSBhICJ3dGY/IiBleGNlcHRpb24gaW4gdGhlIGJyYWluIGFuZCByZXF1aXJl
DQo+IG1lIHRvIHRha2UgYSBzZWNvbmQgbG9vayB0byBmaWd1cmUgd2hhdCBpcyBnb2luZyBvbi4g
RXhjZXB0aW9uDQo+IGhhbmRsaW5nIGlzIGV4cGVuc2l2ZSBhbmQgc2hvdWxkbid0IGJlIG5lZWRl
ZCBpbiBjYXNlcyB3aGVyZSBpdCdzDQo+IHRyaXZpYWwgdG8gbWFrZSB0aGUgY29kZSAxMDAlIG9i
dmlvdXMuDQo+IA0KDQpBZGRpbmcgYSBjb21tZW50IG9uIHRoZSB0b3Agb2YganNsX2dldF9jb21i
b19idWZfdHJhbnMoKSB3b3VsZCBoZWxwPw0KT3RoZXJ3aXNlIFRlamFzIHlvdSB3aWxsIG5lZWQg
dG8gcmV3b3JrIHRoaXMgdGhlbi4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=

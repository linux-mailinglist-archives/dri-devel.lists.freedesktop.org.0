Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D349484534
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 16:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8378210E443;
	Tue,  4 Jan 2022 15:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECF910E442;
 Tue,  4 Jan 2022 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641311465; x=1672847465;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cJ6bYeTARlKqNZPdYRwhfWbK05XB+pWGCWJLtyg+p6U=;
 b=VQ5yJzVjtAKhcHZy1zmVBcSgM1yQor/3l5yL8s7EVt1lXV7jhvDLPtQ1
 bVGYOsakHwQu7aHXzSydMVUZ2qvcwjPBo/sKDyQNpohhFwrSfsA8PNsFy
 uEeP9nGBq4KkDyLQkYtlsTHIhi8mZyM3mR8HHAWuxvnxEhdTXo2oACnOr
 VHv2dQt7+h5bp7pQBQjsPirE+5q3bz5g+//yZ9T9+s74u62N8xh1xXUE7
 SDrfZXfsdXBaH0yFJS82WaSKNyuufviohcQzdCh1hw1ISD7zLcoZCz4fj
 KpDgUjtJnYW+d7judqujFRwYEHce575LLlAAdNWMB5ECigq5nNee1jLXl Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="229063335"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="229063335"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 07:51:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="526091824"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 04 Jan 2022 07:51:05 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 07:51:04 -0800
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 07:51:03 -0800
Received: from bgsmsx606.gar.corp.intel.com ([10.67.234.8]) by
 BGSMSX606.gar.corp.intel.com ([10.67.234.8]) with mapi id 15.01.2308.020;
 Tue, 4 Jan 2022 21:21:00 +0530
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v3 1/5] drm/i915/panelreplay: dpcd register definition for
 panelreplay
Thread-Topic: [PATCH v3 1/5] drm/i915/panelreplay: dpcd register definition
 for panelreplay
Thread-Index: AQHXvdMcBVzf3PoQIEaUyCwSX7POvqwRaysAgEIekcA=
Date: Tue, 4 Jan 2022 15:51:00 +0000
Message-ID: <def0e0c3d24e4a83b8af55ef0c24f082@intel.com>
References: <20211010121039.14725-1-animesh.manna@intel.com>
 <20211010121039.14725-2-animesh.manna@intel.com>
 <5b91f3f1f0397401ea6bbc408940027448494259.camel@intel.com>
In-Reply-To: <5b91f3f1f0397401ea6bbc408940027448494259.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="utf-8"
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU291emEsIEpvc2UgPGpv
c2Uuc291emFAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDI0LCAyMDIx
IDE6MDcgQU0NCj4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IE1hbm5hLCBB
bmltZXNoDQo+IDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT47IGludGVsLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gQ2M6IE11biwgR3dhbi1neWVvbmcgPGd3YW4tZ3llb25nLm11bkBpbnRl
bC5jb20+OyBOaWt1bGEsIEphbmkNCj4gPGphbmkubmlrdWxhQGludGVsLmNvbT47IEthaG9sYSwg
TWlrYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPjsgTmF2YXJlLA0KPiBNYW5hc2kgRCA8bWFuYXNp
LmQubmF2YXJlQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzVdIGRybS9p
OTE1L3BhbmVscmVwbGF5OiBkcGNkIHJlZ2lzdGVyIGRlZmluaXRpb24gZm9yDQo+IHBhbmVscmVw
bGF5DQo+IA0KPiBPbiBTdW4sIDIwMjEtMTAtMTAgYXQgMTc6NDAgKzA1MzAsIEFuaW1lc2ggTWFu
bmEgd3JvdGU6DQo+ID4gRFBDRCByZWdpc3RlciBkZWZpbml0aW9uIGFkZGVkIHRvIGNoZWNrIGFu
ZCBlbmFibGUgcGFuZWwgcmVwbGF5DQo+ID4gY2FwYWJpbGl0eSBvZiB0aGUgc2luay4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggfCA2ICsrKysrKw0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBl
ci5oDQo+ID4gaW5kZXggYjUyZGY0ZGIzZThmLi44YTJiOTI5YzNmODggMTAwNjQ0DQo+ID4gLS0t
IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oDQo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJt
X2RwX2hlbHBlci5oDQo+ID4gQEAgLTU0MSw2ICs1NDEsOSBAQCBzdHJ1Y3QgZHJtX3BhbmVsOw0K
PiA+ICAvKiBERlAgQ2FwYWJpbGl0eSBFeHRlbnNpb24gKi8NCj4gPiAgI2RlZmluZSBEUF9ERlBf
Q0FQQUJJTElUWV9FWFRFTlNJT05fU1VQUE9SVAkweDBhMwkvKiAyLjAgKi8NCj4gPg0KPiA+ICsj
ZGVmaW5lIERQX1BBTkVMX1JFUExBWV9DQVAgICAgICAgICAgICAgICAgIDB4MGIwDQo+ID4gKyMg
ZGVmaW5lIFBBTkVMX1JFUExBWV9TVVBQT1JUICAgICAgICAgICAgICAgKDEgPDwgMCkNCj4gDQo+
IE1pc3NpbmcgYml0IDEsIHRoYXQgaXMgdmVyeSBpbXBvcnRhbnQgd2hlbiBwYW5lbCBkbyBub3Qg
c3VwcG9ydCBzZWxlY3RpdmUgdXBkYXRlDQo+IHBhbmVsIHJlcGxheSBuZWVkcyB0byBhY3QgbGlr
ZSBQU1IxIHdoZW4gaXQgaXMgc2V0cyBpdCBuZWVkcyB0byBhY3QgbGlrZSBQU1IyLg0KPiANCj4g
PiArDQo+ID4gIC8qIExpbmsgQ29uZmlndXJhdGlvbiAqLw0KPiA+ICAjZGVmaW5lCURQX0xJTktf
QldfU0VUCQkgICAgICAgICAgICAweDEwMA0KPiA+ICAjIGRlZmluZSBEUF9MSU5LX1JBVEVfVEFC
TEUJCSAgICAweDAwICAgIC8qIGVEUCAxLjQgKi8NCj4gPiBAQCAtNzA5LDYgKzcxMiw5IEBAIHN0
cnVjdCBkcm1fcGFuZWw7DQo+ID4gICNkZWZpbmUgRFBfQlJBTkNIX0RFVklDRV9DVFJMCQkgICAg
MHgxYTENCj4gPiAgIyBkZWZpbmUgRFBfQlJBTkNIX0RFVklDRV9JUlFfSFBECSAgICAoMSA8PCAw
KQ0KPiA+DQo+ID4gKyNkZWZpbmUgUEFORUxfUkVQTEFZX0NPTkZJRyAgICAgICAgICAgICAgICAg
MHgxYjANCj4gPiArIyBkZWZpbmUgUEFORUxfUkVQTEFZX0VOQUJMRSAgICAgICAgICAgICAgICAo
MSA8PCAwKQ0KPiANCj4gQWxsIG90aGVyIGJpdHMgYXJlIGFsc28gaW1wb3J0YW50LCBmb3IgdGhl
IGVycm9ycyBvbmVzIHdlIGhhdmUgUFNSIGNvdW50ZXIgcGFydHMNCj4gYW5kIHlvdXIgYXJlIG1p
c3NpbmcgdGhlIGVycm9yIHN0YXR1cyByZWdpc3Rlci4NCg0KVGhhbmtzIGZvciByZXZpZXcuDQpB
ZGRlZCB0aGUgc3VnZ2VzdGVkIGNoYW5nZXMgaW4gY3VycmVudCB2ZXJzaW9uLg0KIA0KUmVnYXJk
cywNCkFuaW1lc2gNCj4gDQo+ID4gKw0KPiA+ICAjZGVmaW5lIERQX1BBWUxPQURfQUxMT0NBVEVf
U0VUCQkgICAgMHgxYzANCj4gPiAgI2RlZmluZSBEUF9QQVlMT0FEX0FMTE9DQVRFX1NUQVJUX1RJ
TUVfU0xPVCAweDFjMSAgI2RlZmluZQ0KPiA+IERQX1BBWUxPQURfQUxMT0NBVEVfVElNRV9TTE9U
X0NPVU5UIDB4MWMyDQoNCg==

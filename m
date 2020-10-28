Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ED229CFD3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 12:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B3C6EC94;
	Wed, 28 Oct 2020 11:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70936EC93;
 Wed, 28 Oct 2020 11:53:31 +0000 (UTC)
IronPort-SDR: cw0CglvhaIZkrE/xKjJG0ixwMpE2zIHXY7z1JCT9OCd4KvjZ/6PI+ZLYs5yoqqQSzyKwExOxdb
 yg3HkG6Sw3mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="155213407"
X-IronPort-AV: E=Sophos;i="5.77,426,1596524400"; d="scan'208";a="155213407"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 04:53:31 -0700
IronPort-SDR: WcDnvR/07PlmS0Wc08tWu2IVj8DUyIuT8Da0gbirhB3C31/xj34JwYqTCA/C6jirr2T0aH+CBU
 OAjxBXiA6fnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,426,1596524400"; d="scan'208";a="355872294"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga002.fm.intel.com with ESMTP; 28 Oct 2020 04:53:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Oct 2020 04:53:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Oct 2020 04:53:30 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Wed, 28 Oct 2020 04:53:30 -0700
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Pandey, Hariom" <hariom.pandey@intel.com>, "Szwichtenberg, Radoslaw"
 <radoslaw.szwichtenberg@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Index: AQHWm/FceboB2e8wtEe68XkD/d20damLTsaAgAAAfICAAAIFgIAAAfkAgAQXZwCAAFXKgIAAS2oAgAjPkQCABu2iAIAAARkAgAFmvoCAC/mmAIAAVNAA
Date: Wed, 28 Oct 2020 11:53:30 +0000
Message-ID: <D7AA9562-983D-4F83-BFD7-6E66801FA273@intel.com>
References: <20201006145632.117291-1-srinivasx.k@intel.com>
 <2f7809798dd0b59246d67c5044dafb1e518fc4c5.camel@intel.com>
 <160200650945.2919.11750150118902885340@build.alporthouse.com>
 <3CDB63EE-D1CD-43E4-A977-4E966CD19313@intel.com>
 <c88bc0fbc4956395324674ca202b395326208888.camel@intel.com>
 <BYAPR11MB3014087624B8206C05362830F9080@BYAPR11MB3014.namprd11.prod.outlook.com>
 <B6C174E8-161A-43BD-AFDA-21C94F6D56E3@intel.com>
 <BY5PR11MB44341733BF4A7CCB79861322F6080@BY5PR11MB4434.namprd11.prod.outlook.com>
 <BYAPR11MB30149153D9229142DD2CF96BF9020@BYAPR11MB3014.namprd11.prod.outlook.com>
 <20201019182936.GA3149316@intel.com>
 <160313241261.4425.3184593266306110227@build.alporthouse.com>
 <CO1PR11MB50750A169A14FCC84C70C936F61F0@CO1PR11MB5075.namprd11.prod.outlook.com>
 <CO1PR11MB5075AAFA3500F4A3A610FC52F6170@CO1PR11MB5075.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB5075AAFA3500F4A3A610FC52F6170@CO1PR11MB5075.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-originating-ip: [10.22.254.132]
Content-ID: <2713191CB3F86E4488B4CF5046231C1F@intel.com>
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
Cc: "Ausmus, James" <james.ausmus@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "K,
 SrinivasX" <srinivasx.k@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, "Souza, 
 Jose" <jose.souza@intel.com>, "Meena, Mahesh" <mahesh.meena@intel.com>,
 "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gT2N0IDI3LCAyMDIwLCBhdCAxMTo0OSBQTSwgUGFuZGV5LCBIYXJpb20gPGhhcmlv
bS5wYW5kZXlAaW50ZWwuY29tPiB3cm90ZToNCj4gDQo+IEhpIENocmlzLA0KPiAgDQo+IEF3YWl0
aW5nIHlvdXIga2luZCByZXNwb25zZSBoZXJl4oCmDQoNCmh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAx
Lm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzkyMDgvZmktZWhsLTEvaWd0QGk5MTVfc2VsZnRlc3RA
bGl2ZUBndF9wbS5odG1sDQoiRGlkIG5vdCBlbnRlciBSQzYhIg0KDQpDaHJpcyBhbHJlYWR5IHRv
bGQgdGhhdCB3ZSBuZWVkIHRvIGdldCBSQzYgd29ya2luZyBvbiBDSS4NCklmIHdlIG5lZWQgQklP
UyB1cGRhdGUgb3IgbWFjaGluZSByZXBsYWNlbWVudCB0aGVyZSB3ZSBuZWVkIHRvIHdvcmsgd2l0
aCBDSSB0ZWFtIHRvIG1ha2UgdGhhdCBoYXBwZW4uDQoNCj4gIA0KPiBUaGFua3MNCj4gSGFyaW9t
IFBhbmRleQ0KPiAgDQo+IEZyb206IFBhbmRleSwgSGFyaW9tIA0KPiBTZW50OiBUdWVzZGF5LCBP
Y3RvYmVyIDIwLCAyMDIwIDk6MjggUE0NCj4gVG86IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPg0KPiBDYzogQXVzbXVzLCBKYW1lcyA8amFtZXMuYXVzbXVzQGludGVsLmNv
bT47IE5pa3VsYSwgSmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgaW50ZWwtZ2Z4QCA8bGlz
dHMuZnJlZWRlc2t0b3Aub3JnIGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBTb3V6
YSwgSm9zZSA8am9zZS5zb3V6YUBpbnRlbC5jb20+OyBkcmktZGV2ZWxAIDxsaXN0cy5mcmVlZGVz
a3RvcC5vcmcgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IFN1cmVuZHJha3VtYXIg
VXBhZGh5YXksIFRlamFza3VtYXJYIDx0ZWphc2t1bWFyeC5zdXJlbmRyYWt1bWFyLnVwYWRoeWF5
QGludGVsLmNvbT47IEssIFNyaW5pdmFzWCA8c3Jpbml2YXN4LmtAaW50ZWwuY29tPjsgVml2aSwg
Um9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IE1lZW5hLCBNYWhlc2ggPE1haGVzaC5N
ZWVuYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbSW50ZWwtZ2Z4XSBbUEFUQ0hdIGRybS9p
OTE1L2VobDogUmVtb3ZlIHJlcXVpcmVfZm9yY2VfcHJvYmUgcHJvdGVjdGlvbg0KPiAgDQo+IEhp
IENocmlzLA0KPiAgDQo+IFdlIGhhdmUgcnVuIFJDNiB0ZXN0IGNhc2VzIGFzIHJlY2VudGx5IGFz
IDQgZGF5cyBhZ28gb24gRUhMIGFuZCB0aGV5IGhhdmUgcGFzc2VkLiBCZWxvdyBhcmUgdGhlIHBh
c3MgbG9nIGxpbmtzICYgYXR0YWNoZWQgZW1haWwgaGFzIHRoZSBEUk0vSUdUIHRhZyB3aGVyZSB0
aGV5IGhhdmUgcGFzc2VkLiBXZSBhcmUgZmluZGluZyB0aGF0IHRoZSDigJxFSEwgQkFUIHNldHVw
4oCdIGlzIG5vdCB1cHRvIGRhdGUgaW4gdGVybXMgb2YgU2lsaWNvbiAmIEJJT1Mgd2hpY2ggd2Ug
YXJlIHdvcmtpbmcgdG8gdXBncmFkZS4gQnV0IGp1c3QgZm9yIHRoYXQsIHNob3VsZCB3ZSBibG9j
ayB0aGlzIHBhdGNoPyBKdXN0IHRyeWluZyB0byB1bmRlcnN0YW5kIGFzIHRoZXJlIGlzIG5vIGlu
aGVyZW50IG9yIGxhdGVudCBSQzYgaXNzdWUgYW55bW9yZS4NCj4gIA0KPiAJ4oCiIGlndEBpOTE1
X3BtX3JjNl9yZXNpZGVuY3lAcmM2LWFjY3VyYWN5IC0tLSBQQVNTIC0gTG9nDQo+IAnigKIgaWd0
QGk5MTVfcG1fcmM2X3Jlc2lkZW5jeUByYzYtZmVuY2UgLS0tIFBBU1Mg4oCTIExvZw0KPiAJ4oCi
IGlndEBpOTE1X3BtX3JjNl9yZXNpZGVuY3lAcmM2LWlkbGUgLS0tIFBBU1MgLSBMb2cNCj4gCeKA
oiBpZ3RAcGVyZkByYzYtZGlzYWJsZSAtLS0gUEFTUyAtIExvZw0KPiAJ4oCiIGlndEBwZXJmX3Bt
dUByYzYgLS0tIFBBU1MgLSBMb2cNCj4gCeKAoiBpZ3RAcGVyZl9wbXVAcmM2LXJ1bnRpbWUtcG0g
LS0tIFBBU1MgLSBMb2cNCj4gCeKAoiBpZ3RAcGVyZl9wbXVAcmM2LXJ1bnRpbWUtcG0tbG9uZyAt
LS0gUEFTUyDigJMgTG9nDQo+ICANCj4gIA0KPiBUaGFua3MNCj4gSGFyaW9tIFBhbmRleQ0KPiAg
DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4NCj4gPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDIw
LCAyMDIwIDEyOjA0IEFNDQo+ID4gVG86IEssIFNyaW5pdmFzWCA8c3Jpbml2YXN4LmtAaW50ZWwu
Y29tPjsgVml2aSwgUm9kcmlnbw0KPiA+IDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+IENj
OiBQYW5kZXksIEhhcmlvbSA8aGFyaW9tLnBhbmRleUBpbnRlbC5jb20+OyBBdXNtdXMsIEphbWVz
DQo+ID4gPGphbWVzLmF1c211c0BpbnRlbC5jb20+OyBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxh
QGludGVsLmNvbT47IGludGVsLWdmeEANCj4gPiA8bGlzdHMuZnJlZWRlc2t0b3Aub3JnIGludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBTb3V6YSwgSm9zZQ0KPiA+IDxqb3NlLnNvdXph
QGludGVsLmNvbT47IGRyaS1kZXZlbEAgPGxpc3RzLmZyZWVkZXNrdG9wLm9yZyBkcmktDQo+ID4g
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgU3VyZW5kcmFrdW1hciBVcGFkaHlheSwgVGVq
YXNrdW1hclgNCj4gPiA8dGVqYXNrdW1hcnguc3VyZW5kcmFrdW1hci51cGFkaHlheUBpbnRlbC5j
b20+DQo+ID4gU3ViamVjdDogUmU6IFtJbnRlbC1nZnhdIFtQQVRDSF0gZHJtL2k5MTUvZWhsOiBS
ZW1vdmUgcmVxdWlyZV9mb3JjZV9wcm9iZQ0KPiA+IHByb3RlY3Rpb24NCj4gPiANCj4gPiBRdW90
aW5nIFJvZHJpZ28gVml2aSAoMjAyMC0xMC0xOSAxOToyOTozNikNCj4gPiA+DQo+ID4gPiBJIGp1
c3QgY2hlY2tlZCB0aGUgQ0kgcGljdHVyZSBhbmQgaXQgbG9va3MgbXVjaCBiZXR0ZXIgaW5kZWVk
Lg0KPiA+ID4NCj4gPiA+IE9ubHkgYmFkIGNhc2UgYmVpbmcgdGhlIGd0X3BtLCB3aGljaCBpcyBh
bHNvIGZhaWxpbmcgb24gb3RoZXIgcGxhdGZvcm1zLg0KPiA+IA0KPiA+IE5vdCBuZWFybHkgaW4g
dGhlIHNhbWUgbWFubmVyLiBDSSBpcyBpbmRpY2F0aW5nIHRoYXQgdGhlcmUgaXMgbm8gUkM2IGVu
dHJ5IGFuZA0KPiA+IG5vIHBvd2VyIHNhdmluZyBhdCBhbGw7IG5laXRoZXIgaW4gdGhlIHNlbGZ0
ZXN0cyBub3IgdmlzaWJsZSBmcm9tIHVzZXJzcGFjZS4NCj4gPiBUaGF0IGlzIGEgY3JpdGljYWwg
YmF0dGVyeSBlYXRpbmcgYnVnLg0KPiA+IA0KPiA+IElmIHRoZXJlJ3MgYSBwYXRjaCB0byBmaXgg
aXQgZm9yIGVobCBhbmQganNsLCBzZW5kIGl0IHRvIENJIGZvciBwcm92aW5nLg0KPiA+IC1DaHJp
cw0KPiA8TWFpbCBBdHRhY2htZW50LmVtbD4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==

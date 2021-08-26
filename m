Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAF33F86A6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 13:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D11B6E7EC;
	Thu, 26 Aug 2021 11:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7706E7EA;
 Thu, 26 Aug 2021 11:43:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="217443371"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="217443371"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 04:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="643836778"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 26 Aug 2021 04:43:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 26 Aug 2021 04:43:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 26 Aug 2021 04:43:28 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2242.010;
 Thu, 26 Aug 2021 04:43:28 -0700
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "maxime@cerno.tech" <maxime@cerno.tech>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "hdegoede@redhat.com"
 <hdegoede@redhat.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [GIT PULL] drm-misc + drm-intel: Add support for out-of-band
 hotplug notification
Thread-Topic: [GIT PULL] drm-misc + drm-intel: Add support for out-of-band
 hotplug notification
Thread-Index: AQHXlevZ8/CGe2hsYE6qwz5msr+Zn6uC0lEAgACHDoCAAYWtgIABEeKAgAA3vwA=
Date: Thu, 26 Aug 2021 11:43:28 +0000
Message-ID: <aee6d8d5cad5cb989208a6e5533c59c7828ec69b.camel@intel.com>
References: <34f13e21-9b1a-5f54-7e03-9705a6b51428@redhat.com>
 <871r6jgrin.fsf@intel.com>
 <15400f71-dfe6-3142-d191-596ef9af7e7a@redhat.com>
 <b24d3733d0b0c79fa6fce4f4e696b0c3a338469a.camel@intel.com>
 <20210826082357.xttccb5thrv2eo2e@gilmour>
In-Reply-To: <20210826082357.xttccb5thrv2eo2e@gilmour>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.3 (3.40.3-1.fc34) 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F01F3023A106C14CA59363780489B467@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIxLTA4LTI2IGF0IDEwOjIzICswMjAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOg0K
PiBPbiBXZWQsIEF1ZyAyNSwgMjAyMSBhdCAwNDowMzo0M1BNICswMDAwLCBWaXZpLCBSb2RyaWdv
IHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAyMS0wOC0yNCBhdCAxODo0OCArMDIwMCwgSGFucyBkZSBH
b2VkZSB3cm90ZToNCj4gPiA+IEhpLA0KPiA+ID4gDQo+ID4gPiBPbiA4LzI0LzIxIDEwOjQ1IEFN
LCBKYW5pIE5pa3VsYSB3cm90ZToNCj4gPiA+ID4gT24gRnJpLCAyMCBBdWcgMjAyMSwgSGFucyBk
ZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gSGVsbG8gZHJt
LW1pc2MgYW5kIGRybS1pbnRlbCBtYWludGFpbmVycywNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBN
eSAiQWRkIHN1cHBvcnQgZm9yIG91dC1vZi1iYW5kIGhvdHBsdWcgbm90aWZpY2F0aW9uIg0KPiA+
ID4gPiA+IHBhdGNoc2V0Og0KPiA+ID4gPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvOTM3NjMvDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gSXMgcmVhZHkgZm9yIG1l
cmdpbmcgbm93LCBhcyBkaXNjdXNzZWQgb24gSVJDIEkgYmFzZWQgdGhpcw0KPiA+ID4gPiA+IHNl
cmllcw0KPiA+ID4gPiA+IG9uIHRvcCBkcm0tdGlwIGFuZCB3aGVuIHRyeWluZyB0byBhcHBseSB0
aGUgaTkxNSBwYXJ0cyBvbiB0b3ANCj4gPiA+ID4gPiBvZiBkcm0tbWlzYyB0aGlzIGZhaWxzIGR1
ZSB0byBjb25mbGljdC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBTbyBhcyBKYW5pIHN1Z2dlc3Rl
ZCBoZXJlIGlzIGEgcHVsbC1yZXEgZm9yIGEgdG9waWMtYnJhbmNoDQo+ID4gPiA+ID4gd2l0aA0K
PiA+ID4gPiA+IHRoZQ0KPiA+ID4gPiA+IGVudGlyZSBzZXQsIG1pbnVzIHRoZSB0cm91Ymxlc29t
ZSBpOTE1IGJpdHMuIE9uY2UgdGhpcyBoYXMNCj4gPiA+ID4gPiBiZWVuDQo+ID4gPiA+ID4gbWVy
Z2VkDQo+ID4gPiA+ID4gaW50byBib3RoIGRybS1taXNjLW5leHQgYW5kIGRybS1pbnRlbC1uZXh0
IEkgY2FuIHB1c2ggdGhlIDINCj4gPiA+ID4gPiBpOTE1DQo+ID4gPiA+ID4gcGF0Y2ggZG8gZHJt
LWludGVsLW5leHQgb24gdG9wIG9mIHRoZSBtZXJnZS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBO
b3RlIHRoZXJlIGFyZSBhbHNvIDIgZHJpdmVycy91c2IvdHlwZWMgcGF0Y2hlcyBpbiBoZXJlIHRo
ZXNlDQo+ID4gPiA+ID4gaGF2ZSBHcmVnIEtIJ3MgUmV2aWV3ZWQtYnkgZm9yIG1lcmdpbmcgdGhy
b3VnaCB0aGUgZHJtIHRyZWUsDQo+ID4gPiA+ID4gU2luY2UgdGhpcyBVU0IgY29kZSBkb2VzIG5v
dCBjaGFuZ2UgYWxsIHRoYXQgbXVjaC4gSSBhbHNvDQo+ID4gPiA+ID4gY2hlY2tlZA0KPiA+ID4g
PiA+IGFuZCB0aGUgZHJtLW1pc2MtbmV4dC0yMDIxLTA4LTEyIGJhc2Ugb2YgdGhpcyB0cmVlIGNv
bnRhaW5zDQo+ID4gPiA+ID4gdGhlDQo+ID4gPiA+ID4gc2FtZSBsYXN0IGNvbW1pdCB0byB0aGUg
bW9kaWZpZWQgZmlsZSBhcyB1c2ItbmV4dC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBEYW5pZWwg
VmV0dGVyIG1lbnRpb25lZCBvbiBJUkMgdGhhdCBpdCBtaWdodCBiZSBiZXR0ZXIgZm9yDQo+ID4g
PiA+ID4geW91IHRvDQo+ID4gPiA+ID4gc2ltcGx5DQo+ID4gPiA+ID4gcGljay11cCB0aGUgc2Vy
aWVzIGRpcmVjdGx5IGZyb20gcGF0Y2h3b3JrLCB0aGF0IGlzIGZpbmUgdG9vDQo+ID4gPiA+ID4g
aW4NCj4gPiA+ID4gPiB0aGF0DQo+ID4gPiA+ID4gY2FzZSBkb24ndCBmb3JnZXQgdG8gYWRkOg0K
PiA+ID4gPiA+IA0KPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFRvIHRoZSBlbnRpcmUgc2VyaWVzIChnaXZl
biBpbiBhIHJlcGx5IHRvIHRoZSBjb3Zlci1sZXR0ZXIpDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
QW5kOg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRt
YW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFRv
IHRoZSB1c2IvdHlwZWMgcGF0Y2hlcyAocGF0Y2ggNy84KSwgdGhpcyB3YXMgZ2l2ZW4gaW4gcmVw
bHkNCj4gPiA+ID4gPiB0byBhIHByZXZpb3VzIHBvc3Rpbmcgb2YgdGhlIHNlcmllcyBhbmQgSSBm
b3Jnb3QgdG8gYWRkIHRoaXMNCj4gPiA+ID4gPiBpbiB0aGUgcmVzZW5kLg0KPiA+ID4gPiANCj4g
PiA+ID4gU2luY2UgdGhpcyBpcyBtb3N0bHkgdG91Y2hpbmcgZHJtIGNvcmUsIEkgdGhpbmsgaXQg
c2hvdWxkIGJlDQo+ID4gPiA+IG1lcmdlZA0KPiA+ID4gPiB0bw0KPiA+ID4gPiBkcm0tbWlzYy1u
ZXh0IGZpcnN0LCBhbmQgZHJtLWludGVsLW5leHQgYWZ0ZXIuIFBsZWFzZSBsZXQgdXMNCj4gPiA+
ID4ga25vdy4NCj4gPiA+IA0KPiA+ID4gSSBhZ3JlZSB0aGlzIHNob3VsZCBnbyB0byBkcm0tbWlz
Yy1uZXh0IGZpcnN0Lg0KPiA+ID4gDQo+ID4gPiAoSSB3YXMgcGxhbm5pbmcgb24gcHVzaGluZyB0
aGlzIHRvIGRybS1taXNjLW5leHQgbXlzZWxmLA0KPiA+ID4gYnV0IHRoZW4gZW5kZWQgdXAgZ29p
bmcgd2l0aCB0aGUgdG9waWMgYnJhbmNoIGJlY2F1c2Ugb2YgdGhlDQo+ID4gPiBjb25mbGljdCBp
biB0aGUgaTkxNSBiaXRzLikNCj4gPiANCj4gPiBKdXN0IHRvIGJlIGNsZWFyIGFuZCBhdm9pZCBj
b25mdXNpb246IFRoaXMgcHVsbCByZXF1ZXN0IGRvZXMgYXBwbHkNCj4gPiBjbGVhbmx5IG9uIGRy
bS1taXNjLW5leHQgbmQgZHJtLWludGVsLW5leHQgcmlnaHQgbm93Lg0KPiA+IA0KPiA+IEknbSBq
dXN0IHdhaXRpbmcgZm9yIGRybS1taXNjLW5leHQgbWFpbnRhaW5lcnMgdG8gcHVsbCB0aGlzIHRv
IGRybS0NCj4gPiBtaXNjLW5leHQgc28gSSBjYW4gcHVsbCBpdCB0byBkcm0taW50ZWwtbmV4dC4N
Cj4gPiANCj4gPiBNYXhpbWUsIGlzIHRoYXQgeW91ciByb3VuZCBub3c/DQo+ID4gb3IgVGhvbWFz
Pw0KPiANCj4gVGhhdCdzIG1lLCBJIGp1c3QgcHVzaGVkIGl0IHRvIGRybS1taXNjLW5leHQNCg0K
VGhhbmsgeW91IQ0KSSBhbHNvIHB1c2hlZCB0byBkcm0taW50ZWwtbmV4dC4NCg0KPiANCj4gVGhh
bmtzIQ0KPiBNYXhpbWUNCg0K

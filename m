Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3258C3F79C2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 18:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9780E6E3A0;
	Wed, 25 Aug 2021 16:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36676E3A0;
 Wed, 25 Aug 2021 16:04:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="217272599"
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="217272599"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 09:04:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="473883660"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 25 Aug 2021 09:04:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 09:03:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 09:03:43 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2242.010;
 Wed, 25 Aug 2021 09:03:43 -0700
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [GIT PULL] drm-misc + drm-intel: Add support for out-of-band
 hotplug notification
Thread-Topic: [GIT PULL] drm-misc + drm-intel: Add support for out-of-band
 hotplug notification
Thread-Index: AQHXlevZ8/CGe2hsYE6qwz5msr+Zn6uC0lEAgACHDoCAAYWtgA==
Date: Wed, 25 Aug 2021 16:03:43 +0000
Message-ID: <b24d3733d0b0c79fa6fce4f4e696b0c3a338469a.camel@intel.com>
References: <34f13e21-9b1a-5f54-7e03-9705a6b51428@redhat.com>
 <871r6jgrin.fsf@intel.com>
 <15400f71-dfe6-3142-d191-596ef9af7e7a@redhat.com>
In-Reply-To: <15400f71-dfe6-3142-d191-596ef9af7e7a@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.3 (3.40.3-1.fc34) 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE74AF63DA47A545A6182BDD26BB558C@intel.com>
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

T24gVHVlLCAyMDIxLTA4LTI0IGF0IDE4OjQ4ICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOg0K
PiBIaSwNCj4gDQo+IE9uIDgvMjQvMjEgMTA6NDUgQU0sIEphbmkgTmlrdWxhIHdyb3RlOg0KPiA+
IE9uIEZyaSwgMjAgQXVnIDIwMjEsIEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+
IHdyb3RlOg0KPiA+ID4gSGVsbG8gZHJtLW1pc2MgYW5kIGRybS1pbnRlbCBtYWludGFpbmVycywN
Cj4gPiA+IA0KPiA+ID4gTXkgIkFkZCBzdXBwb3J0IGZvciBvdXQtb2YtYmFuZCBob3RwbHVnIG5v
dGlmaWNhdGlvbiIgcGF0Y2hzZXQ6DQo+ID4gPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvc2VyaWVzLzkzNzYzLw0KPiA+ID4gDQo+ID4gPiBJcyByZWFkeSBmb3IgbWVyZ2luZyBu
b3csIGFzIGRpc2N1c3NlZCBvbiBJUkMgSSBiYXNlZCB0aGlzIHNlcmllcw0KPiA+ID4gb24gdG9w
IGRybS10aXAgYW5kIHdoZW4gdHJ5aW5nIHRvIGFwcGx5IHRoZSBpOTE1IHBhcnRzIG9uIHRvcA0K
PiA+ID4gb2YgZHJtLW1pc2MgdGhpcyBmYWlscyBkdWUgdG8gY29uZmxpY3QuDQo+ID4gPiANCj4g
PiA+IFNvIGFzIEphbmkgc3VnZ2VzdGVkIGhlcmUgaXMgYSBwdWxsLXJlcSBmb3IgYSB0b3BpYy1i
cmFuY2ggd2l0aA0KPiA+ID4gdGhlDQo+ID4gPiBlbnRpcmUgc2V0LCBtaW51cyB0aGUgdHJvdWJs
ZXNvbWUgaTkxNSBiaXRzLiBPbmNlIHRoaXMgaGFzIGJlZW4NCj4gPiA+IG1lcmdlZA0KPiA+ID4g
aW50byBib3RoIGRybS1taXNjLW5leHQgYW5kIGRybS1pbnRlbC1uZXh0IEkgY2FuIHB1c2ggdGhl
IDIgaTkxNQ0KPiA+ID4gcGF0Y2ggZG8gZHJtLWludGVsLW5leHQgb24gdG9wIG9mIHRoZSBtZXJn
ZS4NCj4gPiA+IA0KPiA+ID4gTm90ZSB0aGVyZSBhcmUgYWxzbyAyIGRyaXZlcnMvdXNiL3R5cGVj
IHBhdGNoZXMgaW4gaGVyZSB0aGVzZQ0KPiA+ID4gaGF2ZSBHcmVnIEtIJ3MgUmV2aWV3ZWQtYnkg
Zm9yIG1lcmdpbmcgdGhyb3VnaCB0aGUgZHJtIHRyZWUsDQo+ID4gPiBTaW5jZSB0aGlzIFVTQiBj
b2RlIGRvZXMgbm90IGNoYW5nZSBhbGwgdGhhdCBtdWNoLiBJIGFsc28gY2hlY2tlZA0KPiA+ID4g
YW5kIHRoZSBkcm0tbWlzYy1uZXh0LTIwMjEtMDgtMTIgYmFzZSBvZiB0aGlzIHRyZWUgY29udGFp
bnMgdGhlDQo+ID4gPiBzYW1lIGxhc3QgY29tbWl0IHRvIHRoZSBtb2RpZmllZCBmaWxlIGFzIHVz
Yi1uZXh0Lg0KPiA+ID4gDQo+ID4gPiBEYW5pZWwgVmV0dGVyIG1lbnRpb25lZCBvbiBJUkMgdGhh
dCBpdCBtaWdodCBiZSBiZXR0ZXIgZm9yIHlvdSB0bw0KPiA+ID4gc2ltcGx5DQo+ID4gPiBwaWNr
LXVwIHRoZSBzZXJpZXMgZGlyZWN0bHkgZnJvbSBwYXRjaHdvcmssIHRoYXQgaXMgZmluZSB0b28g
aW4NCj4gPiA+IHRoYXQNCj4gPiA+IGNhc2UgZG9uJ3QgZm9yZ2V0IHRvIGFkZDoNCj4gPiA+IA0K
PiA+ID4gUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+DQo+ID4gPiAN
Cj4gPiA+IFRvIHRoZSBlbnRpcmUgc2VyaWVzIChnaXZlbiBpbiBhIHJlcGx5IHRvIHRoZSBjb3Zl
ci1sZXR0ZXIpDQo+ID4gPiANCj4gPiA+IEFuZDoNCj4gPiA+IA0KPiA+ID4gUmV2aWV3ZWQtYnk6
IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+ID4gPiAN
Cj4gPiA+IFRvIHRoZSB1c2IvdHlwZWMgcGF0Y2hlcyAocGF0Y2ggNy84KSwgdGhpcyB3YXMgZ2l2
ZW4gaW4gcmVwbHkNCj4gPiA+IHRvIGEgcHJldmlvdXMgcG9zdGluZyBvZiB0aGUgc2VyaWVzIGFu
ZCBJIGZvcmdvdCB0byBhZGQgdGhpcw0KPiA+ID4gaW4gdGhlIHJlc2VuZC4NCj4gPiANCj4gPiBT
aW5jZSB0aGlzIGlzIG1vc3RseSB0b3VjaGluZyBkcm0gY29yZSwgSSB0aGluayBpdCBzaG91bGQg
YmUgbWVyZ2VkDQo+ID4gdG8NCj4gPiBkcm0tbWlzYy1uZXh0IGZpcnN0LCBhbmQgZHJtLWludGVs
LW5leHQgYWZ0ZXIuIFBsZWFzZSBsZXQgdXMga25vdy4NCj4gDQo+IEkgYWdyZWUgdGhpcyBzaG91
bGQgZ28gdG8gZHJtLW1pc2MtbmV4dCBmaXJzdC4NCj4gDQo+IChJIHdhcyBwbGFubmluZyBvbiBw
dXNoaW5nIHRoaXMgdG8gZHJtLW1pc2MtbmV4dCBteXNlbGYsDQo+IGJ1dCB0aGVuIGVuZGVkIHVw
IGdvaW5nIHdpdGggdGhlIHRvcGljIGJyYW5jaCBiZWNhdXNlIG9mIHRoZQ0KPiBjb25mbGljdCBp
biB0aGUgaTkxNSBiaXRzLikNCg0KSnVzdCB0byBiZSBjbGVhciBhbmQgYXZvaWQgY29uZnVzaW9u
OiBUaGlzIHB1bGwgcmVxdWVzdCBkb2VzIGFwcGx5DQpjbGVhbmx5IG9uIGRybS1taXNjLW5leHQg
bmQgZHJtLWludGVsLW5leHQgcmlnaHQgbm93Lg0KDQpJJ20ganVzdCB3YWl0aW5nIGZvciBkcm0t
bWlzYy1uZXh0IG1haW50YWluZXJzIHRvIHB1bGwgdGhpcyB0byBkcm0tDQptaXNjLW5leHQgc28g
SSBjYW4gcHVsbCBpdCB0byBkcm0taW50ZWwtbmV4dC4NCg0KTWF4aW1lLCBpcyB0aGF0IHlvdXIg
cm91bmQgbm93Pw0Kb3IgVGhvbWFzPw0KDQpUaGFua3MsDQpSb2RyaWdvLg0KDQo+IA0KPiBSZWdh
cmRzLA0KPiANCj4gSGFucw0KPiANCj4gDQo+IA0KPiA+ID4gVGhlIGZvbGxvd2luZyBjaGFuZ2Vz
IHNpbmNlIGNvbW1pdA0KPiA+ID4gYzc3ODI0NDNhODg5MjZhNGY5MzhmMDE5MzA0MTYxNjMyOGNm
MmRiMjoNCj4gPiA+IA0KPiA+ID4gwqAgZHJtL2JyaWRnZTogdGktc242NWRzaTg2OiBBdm9pZCBj
cmVhdGluZyBtdWx0aXBsZSBjb25uZWN0b3JzDQo+ID4gPiAoMjAyMS0wOC0xMiAwOTo1NjowOSAt
MDcwMCkNCj4gPiA+IA0KPiA+ID4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkg
YXQ6DQo+ID4gPiANCj4gPiA+IMKgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9oYW5zZy9saW51eC5naXQNCj4gPiA+IGRybS1taXNjLWludGVsLW9vYi1ob3Rw
bHVnLXYxDQo+ID4gPiANCj4gPiA+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0bw0KPiA+
ID4gN2Y4MTEzOTQ4Nzg1MzVlZDlhNjg0OTcxN2RlOGMyOTU5YWUzODg5OToNCj4gPiA+IA0KPiA+
ID4gwqAgdXNiOiB0eXBlYzogYWx0bW9kZXMvZGlzcGxheXBvcnQ6IE5vdGlmeSBkcm0gc3Vic3lz
IG9mIGhvdHBsdWcNCj4gPiA+IGV2ZW50cyAoMjAyMS0wOC0yMCAxMjozNTo1OSArMDIwMCkNCj4g
PiA+IA0KPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ID4gVG9waWMgYnJhbmNoIGZvciBkcm0tbWlzYyAvIGRy
bS1pbnRlbCBmb3IgT09CIGhvdHBsdWcgc3VwcG9ydCBmb3INCj4gPiA+IFR5cGUtQyBjb25uZWN0
b3JzDQo+ID4gPiANCj4gPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+IEhhbnMgZGUgR29lZGUgKDYpOg0KPiA+
ID4gwqDCoMKgwqDCoCBkcm0vY29ubmVjdG9yOiBHaXZlIGNvbm5lY3RvciBzeXNmcyBkZXZpY2Vz
IHRoZXJlIG93bg0KPiA+ID4gZGV2aWNlX3R5cGUNCj4gPiA+IMKgwqDCoMKgwqAgZHJtL2Nvbm5l
Y3RvcjogQWRkIGEgZndub2RlIHBvaW50ZXIgdG8gZHJtX2Nvbm5lY3RvciBhbmQNCj4gPiA+IHJl
Z2lzdGVyIHdpdGggQUNQSSAodjIpDQo+ID4gPiDCoMKgwqDCoMKgIGRybS9jb25uZWN0b3I6IEFk
ZCBkcm1fY29ubmVjdG9yX2ZpbmRfYnlfZndub2RlKCkgZnVuY3Rpb24NCj4gPiA+ICh2MykNCj4g
PiA+IMKgwqDCoMKgwqAgZHJtL2Nvbm5lY3RvcjogQWRkIHN1cHBvcnQgZm9yIG91dC1vZi1iYW5k
IGhvdHBsdWcNCj4gPiA+IG5vdGlmaWNhdGlvbiAodjMpDQo+ID4gPiDCoMKgwqDCoMKgIHVzYjog
dHlwZWM6IGFsdG1vZGVzL2Rpc3BsYXlwb3J0OiBNYWtlIGRwX2FsdG1vZGVfbm90aWZ5KCkNCj4g
PiA+IG1vcmUgZ2VuZXJpYw0KPiA+ID4gwqDCoMKgwqDCoCB1c2I6IHR5cGVjOiBhbHRtb2Rlcy9k
aXNwbGF5cG9ydDogTm90aWZ5IGRybSBzdWJzeXMgb2YNCj4gPiA+IGhvdHBsdWcgZXZlbnRzDQo+
ID4gPiANCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuY8KgwqDCoMKgwqDC
oMKgwqDCoCB8IDc5DQo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4g
wqBkcml2ZXJzL2dwdS9kcm0vZHJtX2NydGNfaW50ZXJuYWwuaMKgwqDCoMKgwqAgfMKgIDIgKw0K
PiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDg3DQo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiA+ID4g
wqBkcml2ZXJzL3VzYi90eXBlYy9hbHRtb2Rlcy9LY29uZmlnwqDCoMKgwqDCoMKgIHzCoCAxICsN
Cj4gPiA+IMKgZHJpdmVycy91c2IvdHlwZWMvYWx0bW9kZXMvZGlzcGxheXBvcnQuYyB8IDU4ICsr
KysrKysrKysrKystLS0tLQ0KPiA+ID4gLS0tDQo+ID4gPiDCoGluY2x1ZGUvZHJtL2RybV9jb25u
ZWN0b3IuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMjUgKysrKysrKysrDQo+ID4gPiDC
oDYgZmlsZXMgY2hhbmdlZCwgMjE3IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQ0KPiA+
ID4gDQo+ID4gDQo+IA0KDQo=

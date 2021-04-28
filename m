Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6742536DE84
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 19:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30A26EC11;
	Wed, 28 Apr 2021 17:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0706EC0D;
 Wed, 28 Apr 2021 17:40:04 +0000 (UTC)
IronPort-SDR: VoLuvgQ/S1zlvhb28MBdczDwyh2znOecYskmEg0tuY8sh7F68KzpeUrhwLAV85czZFnE8n5UkE
 a5I5SQ1w3ocw==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="193615766"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="193615766"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 10:39:49 -0700
IronPort-SDR: cbmD8qvKwYuK14f9M6oC+5W9aal5NuUGQP8csKI/D3Bmsa1VeSpjuSaXHj9Qsv6mHJ+sex61PO
 R5pnLQDbmo/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="466004097"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga001.jf.intel.com with ESMTP; 28 Apr 2021 10:39:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 28 Apr 2021 10:39:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 28 Apr 2021 10:39:47 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2106.013;
 Wed, 28 Apr 2021 10:39:47 -0700
From: "Bloomfield, Jon" <jon.bloomfield@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/9] drm/doc/rfc: i915 DG1 uAPI
Thread-Topic: [PATCH 1/9] drm/doc/rfc: i915 DG1 uAPI
Thread-Index: AQHXOoCGj3ZA5/WOnk606ffbmRXRk6rKNETg
Date: Wed, 28 Apr 2021 17:39:25 +0000
Deferred-Delivery: Wed, 28 Apr 2021 17:39:17 +0000
Message-ID: <d84d525b3f844a5198004b321cdbe4cb@intel.com>
References: <20210426093901.28937-1-matthew.auld@intel.com>
In-Reply-To: <20210426093901.28937-1-matthew.auld@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.22.254.132]
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>, "Justen,
 Jordan L" <jordan.l.justen@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, Kenneth Graunke <kenneth@whitecape.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>, "Vetter,
 Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBdWxkLCBNYXR0aGV3IDxtYXR0
aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIEFwcmlsIDI2LCAyMDIxIDI6Mzkg
QU0NCj4gVG86IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEpvb25hcyBM
YWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT47IFRob21hcyBIZWxsc3Ry
w7ZtDQo+IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT47IENlcmFvbG8gU3B1cmlv
LCBEYW5pZWxlDQo+IDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPjsgTGlvbmVsIExh
bmR3ZXJsaW4NCj4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AbGludXguaW50ZWwuY29tPjsgQmxvb21m
aWVsZCwgSm9uDQo+IDxqb24uYmxvb21maWVsZEBpbnRlbC5jb20+OyBKdXN0ZW4sIEpvcmRhbiBM
IDxqb3JkYW4ubC5qdXN0ZW5AaW50ZWwuY29tPjsNCj4gVmV0dGVyLCBEYW5pZWwgPGRhbmllbC52
ZXR0ZXJAaW50ZWwuY29tPjsgS2VubmV0aCBHcmF1bmtlDQo+IDxrZW5uZXRoQHdoaXRlY2FwZS5v
cmc+OyBKYXNvbiBFa3N0cmFuZCA8amFzb25Aamxla3N0cmFuZC5uZXQ+OyBEYXZlDQo+IEFpcmxp
ZSA8YWlybGllZEBnbWFpbC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBt
ZXNhLQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPjsgRGF2ZQ0KPiBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4NCj4g
U3ViamVjdDogW1BBVENIIDEvOV0gZHJtL2RvYy9yZmM6IGk5MTUgREcxIHVBUEkNCj4gDQo+IEFk
ZCBhbiBlbnRyeSBmb3IgdGhlIG5ldyB1QVBJIG5lZWRlZCBmb3IgREcxLiBBbHNvIGFkZCB0aGUg
b3ZlcmFsbA0KPiB1cHN0cmVhbSBwbGFuLCBpbmNsdWRpbmcgc29tZSBub3RlcyBmb3IgdGhlIFRU
TSBjb252ZXJzaW9uLg0KPiANCj4gdjIoRGFuaWVsKToNCj4gICAtIGluY2x1ZGUgdGhlIG92ZXJh
bGwgdXBzdHJlYW1pbmcgcGxhbg0KPiAgIC0gYWRkIGEgbm90ZSBmb3IgbW1hcCwgdGhlcmUgYXJl
IGRpZmZlcmVuY2VzIGhlcmUgZm9yIFRUTSB2cyBpOTE1DQo+ICAgLSBidW5jaCBvZiBvdGhlciBz
dWdnZXN0aW9ucyBmcm9tIERhbmllbA0KPiB2MzoNCj4gIChEYW5pZWwpDQo+ICAgLSBhZGQgYSBu
b3RlIGZvciBzZXQvZ2V0IGNhY2hpbmcgc3R1ZmYNCj4gICAtIGFkZCBzb21lIG1vcmUgZG9jcyBm
b3IgZXhpc3RpbmcgcXVlcnkgYW5kIGV4dGVuc2lvbnMgc3R1ZmYNCj4gICAtIGFkZCBhbiBhY3R1
YWwgY29kZSBleGFtcGxlIGZvciByZWdpb25zIHF1ZXJ5DQo+ICAgLSBidW5jaCBvZiBvdGhlciBz
dHVmZg0KPiAgKEphc29uKQ0KPiAgIC0gdUFQSSBjaGFuZ2UoISk6DQo+IAktIHRyeSBhIHNpbXBs
ZXIgZGVzaWduIHdpdGggdGhlIHBsYWNlbWVudHMgZXh0ZW5zaW9uDQo+IAktIHJhdGhlciB0aGFu
IGhhdmUgYSBnZW5lcmljIHNldHBhcmFtIHdoaWNoIGNhbiBjb3ZlciBtdWx0aXBsZQ0KPiAJICB1
c2UgY2FzZXMsIGhhdmUgZWFjaCBleHRlbnNpb24gYmUgcmVzcG9uc2libGUgZm9yIG9uZSB0aGlu
Zw0KPiAJICBvbmx5DQo+IHY0Og0KPiAgKERhbmllbCkNCj4gICAtIGFkZCBzb21lIG1vcmUgbm90
ZXMgZm9yIHR0bSBjb252ZXJzaW9uDQo+ICAgLSBidW5jaCBvZiBvdGhlciBzdHVmZg0KPiAgKEph
c29uKQ0KPiAgIC0gdUFQSSBjaGFuZ2UoISk6DQo+IAktIGRyb3AgYWxsIHRoZSBleHRyYSByc3Zk
IG1lbWJlcnMgZm9yIHRoZSByZWdpb25fcXVlcnkgYW5kDQo+IAkgIHJlZ2lvbl9pbmZvLCBqdXN0
IGtlZXAgdGhlIGJhcmUgbWluaW11bSBuZWVkZWQgZm9yIHBhZGRpbmcNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gQ2M6IEpvb25h
cyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IFRob21h
cyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IERh
bmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+
IENjOiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBsaW51eC5pbnRlbC5j
b20+DQo+IENjOiBKb24gQmxvb21maWVsZCA8am9uLmJsb29tZmllbGRAaW50ZWwuY29tPg0KPiBD
YzogSm9yZGFuIEp1c3RlbiA8am9yZGFuLmwuanVzdGVuQGludGVsLmNvbT4NCj4gQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPiBDYzogS2VubmV0aCBHcmF1bmtl
IDxrZW5uZXRoQHdoaXRlY2FwZS5vcmc+DQo+IENjOiBKYXNvbiBFa3N0cmFuZCA8amFzb25Aamxl
a3N0cmFuZC5uZXQ+DQo+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+DQo+IENj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBtZXNhLWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+DQo+IEFja2VkLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPg0K
PiAtLS0NCg0KQWNrZWQtYnk6IEpvbiBCbG9vbWZpZWxkIDxqb24uYmxvb21maWVsZEBpbnRlbC5j
b20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

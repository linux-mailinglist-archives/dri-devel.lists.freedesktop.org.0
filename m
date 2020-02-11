Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF654158D7D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 12:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC636EE27;
	Tue, 11 Feb 2020 11:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060636EE27;
 Tue, 11 Feb 2020 11:23:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 03:23:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="226477309"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
 by orsmga008.jf.intel.com with ESMTP; 11 Feb 2020 03:23:19 -0800
Received: from irsmsx604.ger.corp.intel.com (163.33.146.137) by
 IRSMSX153.ger.corp.intel.com (163.33.192.75) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 11 Feb 2020 11:23:18 +0000
Received: from irsmsx604.ger.corp.intel.com (163.33.146.137) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 11 Feb 2020 11:23:18 +0000
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137]) by
 IRSMSX604.ger.corp.intel.com ([163.33.146.137]) with mapi id 15.01.1713.004;
 Tue, 11 Feb 2020 11:23:18 +0000
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>
Subject: Re: [PATCH 4/4] drm/i915/display: Set TRANS_DDI_MODE_SELECT to
 default value when disabling TRANS_DDI
Thread-Topic: [PATCH 4/4] drm/i915/display: Set TRANS_DDI_MODE_SELECT to
 default value when disabling TRANS_DDI
Thread-Index: AQHVzNmssi9Yyhiy30ih9iyG6MZfu6gWALWA
Date: Tue, 11 Feb 2020 11:23:18 +0000
Message-ID: <bb5c6aee30df288ecf9f48de3382c62584c4493f.camel@intel.com>
References: <20200117015837.402239-1-jose.souza@intel.com>
 <20200117015837.402239-4-jose.souza@intel.com>
In-Reply-To: <20200117015837.402239-4-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.163]
Content-ID: <C0B956D69F892A40AB74ABA1A6B8439E@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIwLTAxLTE2IGF0IDE3OjU4IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBUR0wgdGltZW91dHMgd2hlbiBkaXNhYmxpbmcgTVNUIHRyYW5zY29kZXIgYW5k
IGZpZm8gdW5kZXJydW5zIG92ZXINCj4gTVNUDQo+IHRyYW5zY29kZXJzIGFyZSBmaXhlZCB3aGVu
IHNldHRpbmcgVFJBTlNfRERJX01PREVfU0VMRUNUIHRvIDAoSERNSQ0KPiBtb2RlKSBkdXJpbmcg
dGhlIGRpc2FibGUgc2VxdWVuY2UuDQo+IA0KPiBBbHRob3VnaCBCU3BlYyBkaXNhYmxlIHNlcXVl
bmNlIGRvbid0IHJlcXVpcmUgdGhpcyBzdGVwIGl0IGlzIGENCj4gaGFybWxlc3MgY2hhbmdlIGFu
ZCBpdCBpcyBhbHNvIGRvbmUgYnkgV2luZG93cyBkcml2ZXIuDQo+IEFueWhvdyBIVyB0ZWFtIHdh
cyBub3RpZmllZCBhYm91dCB0aGF0IGJ1dCBpdCBjYW4gdGFrZSBzb21lIHRpbWUgdG8NCj4gZG9j
dW1lbnRhdGlvbiB0byBiZSB1cGRhdGVkLg0KPiANCj4gQSBjYXNlIHRoYXQgYWx3YXlzIGxlYWQg
dG8gdGhvc2UgaXNzdWVzIGlzOg0KPiAtIGRvIGEgbW9kZXNldCBlbmFibGluZyBwaXBlIEEgYW5k
IHBpcGUgQiBpbiB0aGUgc2FtZSBNU1Qgc3RyZWFtDQo+IGxlYXZpbmcgQSBhcyBtYXN0ZXINCj4g
LSBkaXNhYmxlIHBpcGUgQSwgcHJvbW90ZSBCIGFzIG1hc3RlciBkb2luZyBhIGZ1bGwgbW9kZXNl
dCBpbiBBDQo+IC0gZW5hYmxlIHBpcGUgQSwgY2hhbmdpbmcgdGhlIG1hc3RlciB0cmFuc2NvZGVy
IGJhY2sgdG8gQShkb2luZyBhDQo+IGZ1bGwgbW9kZXNldCBpbiBCKQ0KPiAtIFBvdzogdW5kZXJy
dW5zIGFuZCB0aW1lb3V0cw0KPiANCj4gVGhlIHRyYW5zY29kZXJzIGludm9sdmVkIHdpbGwgb25s
eSB3b3JrIGFnYWluIHdoZW4gY29tcGxldGUgZGlzYWJsZWQNCj4gYW5kIHRoZWlyIHBvd2VyIHdl
bGxzIHR1cm5lZCBvZmYgY2F1c2luZyBhIHJlc2V0IGluIHRoZWlyIHJlZ2lzdGVycy4NCj4gDQo+
IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBD
YzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+IC0tLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyB8IDEgKw0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCkJBVC9JR1QgYXJlIGZpbmUsIHNvIGlmIHRo
aXMgaW1wcm92ZXMgc29tZSBNU1QgYmVoYXZpb3JzIGRvbid0IHNlZQ0KYW55IHBvaW50IGluIGhv
bGRpbmcgdGhpcyBwYXRjaCBmcm9tIGJlaW5nIG1lcmdlZC4gDQpGb3IgTVNULCB3ZSBhcmUgYW55
d2F5IGZhY2luZyBNU1QgcmVncmVzc2lvbnMgYWxtb3N0IG9uIHdlZWtseSBiYXNpcy4NClVudGls
IHdlIGhhdmUgc29tZSBtZWFuaW5nZnVsIHRlc3RzIGluIENJIGZvciBNU1QsIGl0IGFueXdheQ0K
d291bGQgYmUgY29uc3RhbnRseSBpbiAiYmFkIiBzaGFwZS4NCg0KUmV2aWV3ZWQtYnk6IFN0YW5p
c2xhdiBMaXNvdnNraXkgPHN0YW5pc2xhdi5saXNvdnNraXlAaW50ZWwuY29tPg0KDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMNCj4gaW5kZXggMzJlYTNj
N2U4YjYyLi44MmU5MGYyNzE5NzQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGRpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kZGkuYw0KPiBAQCAtMTk5Nyw2ICsxOTk3LDcgQEAgdm9pZCBpbnRlbF9kZGlfZGlz
YWJsZV90cmFuc2NvZGVyX2Z1bmMoY29uc3QNCj4gc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNy
dGNfc3RhdGUNCj4gIA0KPiAgCXZhbCA9IEk5MTVfUkVBRChUUkFOU19ERElfRlVOQ19DVEwoY3B1
X3RyYW5zY29kZXIpKTsNCj4gIAl2YWwgJj0gflRSQU5TX0RESV9GVU5DX0VOQUJMRTsNCj4gKwl2
YWwgJj0gflRSQU5TX0RESV9NT0RFX1NFTEVDVF9NQVNLOw0KPiAgDQo+ICAJaWYgKElOVEVMX0dF
TihkZXZfcHJpdikgPj0gMTIpIHsNCj4gIAkJaWYgKCFpbnRlbF9kcF9tc3RfaXNfbWFzdGVyX3Ry
YW5zKGNydGNfc3RhdGUpKQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==

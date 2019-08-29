Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E40A1542
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 11:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0B36E090;
	Thu, 29 Aug 2019 09:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6286E090;
 Thu, 29 Aug 2019 09:58:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 02:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; d="scan'208";a="180831283"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga008.fm.intel.com with ESMTP; 29 Aug 2019 02:58:40 -0700
Received: from fmsmsx121.amr.corp.intel.com (10.18.125.36) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 29 Aug 2019 02:58:40 -0700
Received: from lcsmsx152.ger.corp.intel.com (10.186.165.231) by
 fmsmsx121.amr.corp.intel.com (10.18.125.36) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 29 Aug 2019 02:58:39 -0700
Received: from hasmsx108.ger.corp.intel.com ([169.254.9.203]) by
 LCSMSX152.ger.corp.intel.com ([169.254.4.206]) with mapi id 14.03.0439.000;
 Thu, 29 Aug 2019 12:58:37 +0300
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "C, Ramalingam" <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v12 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Thread-Topic: [PATCH v12 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Thread-Index: AQHVXb+mVwQeCalHh06pWjoKp5abGacQkvuAgAFSAtA=
Date: Thu, 29 Aug 2019 09:58:35 +0000
Message-ID: <5B8DA87D05A7694D9FA63FD143655C1B9DCA7EAC@hasmsx108.ger.corp.intel.com>
References: <20190828164216.405-1-ramalingam.c@intel.com>
 <20190828164814.GA25367@intel.com>
In-Reply-To: <20190828164814.GA25367@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGIzZDVhYTAtNDJmMS00ODA0LWI1YTgtYzA0MDg0MmEzYWVmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiY3ZRRCswbUc5NVl5WllRU3R3cUR4NUVxc2RcL3MzOFdKWllrSGtXamFkXC9qb1wvZFdWNlJYRTRzanNHQzlQZ1E0dyJ9
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBPbiAyMDE5LTA4LTI4IGF0IDIyOjEyOjEwICswNTMwLCBSYW1hbGluZ2FtIEMgd3JvdGU6DQo+
ID4gRW5hYmxpbmcgdGhlIEhEQ1AxLjQgYW5kIDIuMiBvbiBUR0wgYnkgc3VwcG9ydGluZyB0aGUg
SFcgYmxvY2sNCj4gPiBtb3ZlbWVudCBmcm9tIERESSBpbnRvIHRyYW5zY29kZXIuDQo+ID4NCj4g
PiB2MTI6DQo+ID4gICByLWIgYW5kIGFjayBhcmUgY29sbGVjdGVkLg0KPiA+ICAgZmV3IHJldmll
dyBjb21tZW50cyBhcmUgYWRkcmVzc2VkLg0KPiANCj4gVG9tYXMsDQo+IA0KPiBUaGFua3MgZm9y
IHJldmlld2luZyB0aGUgcGF0Y2hlcyBhbmQgcHJvdmlkaW5nIHRoZSBBY2svUi1iZXMuDQo+IEFz
IHdlIGRpc2N1c3NlZCBvZmZsaW5lLCB3ZSBuZWVkIHlvdXIgQUNLIGZvciBzdWJtaXR0aW5nIG1l
aV9oZGNwIHBhdGNoZXMNCj4gdGhyb3VnaCBkaW5xKGRybS1pbnRlbC1uZXh0LXF1ZXVlZCkuIFBs
ZWFzZSBwcm92aWRlIHRoZSBzYW1lLiANCg0KDQpBQ0sgDQoNCj4gDQo+IC1SYW0NCj4gPg0KPiA+
IFJhbWFsaW5nYW0gQyAoNik6DQo+ID4gICBkcm0vaTkxNTogbWVpX2hkY3A6IEk5MTUgc2VuZHMg
ZGRpIGluZGV4IGFzIHBlciBNRSBGVw0KPiA+ICAgZHJtOiBNb3ZlIHBvcnQgZGVmaW5pdGlvbiBi
YWNrIHRvIGk5MTUgaGVhZGVyDQo+ID4gICBkcm06IEV4dGVuZCBJOTE1IG1laSBpbnRlcmZhY2Ug
Zm9yIHRyYW5zY29kZXIgaW5mbw0KPiA+ICAgbWlzYy9tZWkvaGRjcDogRmlsbCB0cmFuc2NvZGVy
IGluZGV4IGluIHBvcnQgaW5mbw0KPiA+ICAgZHJtL2k5MTUvaGRjcDogdXBkYXRlIGN1cnJlbnQg
dHJhbnNjb2RlciBpbnRvIGludGVsX2hkY3ANCj4gPiAgIGRybS9pOTE1L2hkY3A6IEVuYWJsZSBI
RENQIDEuNCBhbmQgMi4yIG9uIEdlbjEyKw0KPiA+DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfYmlvcy5oICAgICB8ICAgMyArLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuaCAgfCAgMjAgKy0NCj4gPiAgLi4uL2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oICAgIHwgICA3ICsNCj4gPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jICAgICAgIHwgICAzICsNCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5oICAgICAgIHwgICAxICsNCj4gPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZGNwLmMgICAgIHwgMjE0ICsrKysrKysr
KysrKystLS0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkY3Au
aCAgICAgfCAgIDQgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hk
bWkuYyAgICAgfCAgMTMgKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9oZG1pLmggICAgIHwgICAxICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9ob3RwbHVnLmggIHwgICAxICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9zZHZvLmggICAgIHwgICAxICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9yZWcuaCAgICAgICAgICAgICAgIHwgMTI0ICsrKysrKysrKy0NCj4gPiAgZHJpdmVycy9taXNj
L21laS9oZGNwL21laV9oZGNwLmMgICAgICAgICAgICAgIHwgIDQ1ICsrLS0NCj4gPiAgZHJpdmVy
cy9taXNjL21laS9oZGNwL21laV9oZGNwLmggICAgICAgICAgICAgIHwgIDE3ICstDQo+ID4gIGlu
Y2x1ZGUvZHJtL2k5MTVfZHJtLmggICAgICAgICAgICAgICAgICAgICAgICB8ICAxOCAtLQ0KPiA+
ICBpbmNsdWRlL2RybS9pOTE1X21laV9oZGNwX2ludGVyZmFjZS5oICAgICAgICAgfCAgNDIgKysr
LQ0KPiA+ICAxNiBmaWxlcyBjaGFuZ2VkLCAzODkgaW5zZXJ0aW9ucygrKSwgMTI1IGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gLS0NCj4gPiAyLjIwLjENCj4gPg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

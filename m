Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B91021D505C
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 16:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341496ECBF;
	Fri, 15 May 2020 14:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B8C89AE6;
 Fri, 15 May 2020 14:25:44 +0000 (UTC)
IronPort-SDR: DYgzVP+vEdF7/HCvA88FdNWZegqMn09SMzuRd/j5nDfGxNfK9g0wVteOKwyYGgafb4oVBxSK2a
 9hxyBIIkIiCA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 07:25:44 -0700
IronPort-SDR: TgY3fOINZ9NscYQBtERM0IiWO+ovfwODOV2sLs4GwF5EPykqPM4V6GHnmNzZuY0rrekNJda0Ld
 bJVEaON1keuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="281232214"
Received: from irsmsx152.ger.corp.intel.com ([163.33.192.66])
 by orsmga002.jf.intel.com with ESMTP; 15 May 2020 07:25:42 -0700
Received: from irsmsx606.ger.corp.intel.com (163.33.146.139) by
 IRSMSX152.ger.corp.intel.com (163.33.192.66) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 15 May 2020 15:25:41 +0100
Received: from irsmsx603.ger.corp.intel.com (163.33.146.9) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 May 2020 15:25:41 +0100
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9]) by
 irsmsx603.ger.corp.intel.com ([163.33.146.9]) with mapi id 15.01.1713.004;
 Fri, 15 May 2020 15:25:41 +0100
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH v12 00/14] In order to readout DP SDPs,
 refactors the handling of DP SDPs
Thread-Topic: [Intel-gfx] [PATCH v12 00/14] In order to readout DP SDPs,
 refactors the handling of DP SDPs
Thread-Index: AQHWKbYA9S5hlcm0nEW0iS76EfXfTainXtqAgAGwLQCAAAH8AIAAJMTA
Date: Fri, 15 May 2020 14:25:41 +0000
Message-ID: <e82f172de7a04c0589f4f7c551475535@intel.com>
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
 <87eerm4vd0.fsf@intel.com> <20200515130612.GI6112@intel.com>
 <87zha92vf5.fsf@intel.com>
In-Reply-To: <87zha92vf5.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
x-originating-ip: [163.33.253.164]
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxp
bnRlbC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBKYW5p
IE5pa3VsYQ0KPiBTZW50OiBwZXJqYW50YWkgMTUuIHRvdWtva3V1dGEgMjAyMCAxNi4xMw0KPiBU
bzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6
IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZzsgZGFuaWVsLnZldHRlckBmZndsbC5jaDsgaW50
ZWwtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7DQo+IGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbQ0KPiBTdWJqZWN0
OiBSZTogW0ludGVsLWdmeF0gW1BBVENIIHYxMiAwMC8xNF0gSW4gb3JkZXIgdG8gcmVhZG91dCBE
UCBTRFBzLCByZWZhY3RvcnMgdGhlDQo+IGhhbmRsaW5nIG9mIERQIFNEUHMNCj4gDQo+IE9uIEZy
aSwgMTUgTWF5IDIwMjAsIFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+IHdyb3RlOg0KPiA+IE9uIFRodSwgTWF5IDE0LCAyMDIwIGF0IDAyOjE5OjIzUE0gKzAz
MDAsIEphbmkgTmlrdWxhIHdyb3RlOg0KPiA+PiBPbiBUaHUsIDE0IE1heSAyMDIwLCBHd2FuLWd5
ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+DQo+IHdyb3RlOg0KPiA+PiA+IElu
IG9yZGVyIHRvIHJlYWRvdXQgRFAgU0RQcyAoU2Vjb25kYXJ5IERhdGEgUGFja2V0OiBEUCBIRFIg
TWV0YWRhdGENCj4gPj4gPiBJbmZvZnJhbWUgU0RQLCBEUCBWU0MgU0RQKSwgaXQgcmVmYWN0b3Jz
IGhhbmRsaW5nIERQIFNEUHMgY29kZXMuDQo+ID4+ID4gSXQgYWRkcyBuZXcgY29tcHV0ZSByb3V0
aW5lcyBmb3IgRFAgSERSIE1ldGFkYXRhIEluZm9mcmFtZSBTRFAgYW5kDQo+ID4+ID4gRFAgVlND
IFNEUC4NCj4gPj4gPiBBbmQgbmV3IHdyaXRpbmcgcm91dGluZXMgb2YgRFAgU0RQcyAoU2Vjb25k
YXJ5IERhdGEgUGFja2V0KSB0aGF0DQo+ID4+ID4gdXNlcyBjb21wdXRlZCBjb25maWdzLg0KPiA+
PiA+IE5ldyByZWFkaW5nIHJvdXRpbmVzIG9mIERQIFNEUHMgYXJlIGFkZGVkIGZvciByZWFkb3V0
Lg0KPiA+PiA+IEl0IGFkZHMgYSBsb2dnaW5nIGZ1bmN0aW9uIGZvciBEUCBWU0MgU0RQLg0KPiA+
PiA+IFdoZW4gcmVjZWl2aW5nIHZpZGVvIGl0IGlzIHZlcnkgdXNlZnVsIHRvIGJlIGFibGUgdG8g
bG9nIERQIFZTQyBTRFAuDQo+ID4+ID4gVGhpcyBncmVhdGx5IHNpbXBsaWZpZXMgZGVidWdnaW5n
Lg0KPiA+PiA+IEluIG9yZGVyIHRvIHVzZSBhIGNvbW1vbiBWU0MgU0RQIENvbG9yaW1ldHJ5IGNh
bGN1bGF0aW5nIGNvZGUgb24NCj4gPj4gPiBQU1IsIGl0IHVzZXMgYSBuZXcgcHNyIHZzYyBzZHAg
Y29tcHV0ZSByb3V0aW5lLg0KPiA+Pg0KPiA+PiBQdXNoZWQgdGhlIHNlcmllcyB0byBkcm0taW50
ZWwtbmV4dC1xdWV1ZWQgd2l0aCBEYW5pZWwncyBpcmMgYWNrIGZvcg0KPiA+PiBtZXJnaW5nIHRo
ZSB0d28gbm9uLWk5MTUgcGF0Y2hlcyB0aGF0IHJvdXRlIHRvby4NCj4gPg0KPiA+IGZpLWhzdy00
NzcwIG5vdyBvb3BzZXMgYXQgYm9vdDoNCj4gDQo+IC9vXA0KPiANCj4gV2hhdCBkaWQgSSBtaXNz
PyBXaGF0IHBhcnQgYWJvdXQgdGhlIENJIHJlcG9ydCBkaWQgSSBvdmVybG9vaz8NCkRhbW4sIGlu
ZGVlZDoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNzI4NTMvDQpD
aSByZXN1bHRzIGlzIHN1Y2Nlc3MgYnV0IGl0IGhhczoNCktub3duIGlzc3Vlcw0KLS0tLS0tLS0t
LS0tDQoNCiAgSGVyZSBhcmUgdGhlIGNoYW5nZXMgZm91bmQgaW4gUGF0Y2h3b3JrXzE3NjU0IHRo
YXQgY29tZSBmcm9tIGtub3duIGlzc3VlczoNCg0KIyMjIENJIGNoYW5nZXMgIyMjDQoNCiMjIyMg
SXNzdWVzIGhpdCAjIyMjDQoNCiAgKiBib290Og0KICAgIC0gZmktaHN3LTQ3NzA6ICAgICAgICBb
UEFTU11bMV0gLT4gW0ZBSUxdWzJdIChbQ0kjODBdKQ0KICAgWzFdOiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV84NDgxL2ZpLWhzdy00NzcwL2Jvb3QuaHRt
bA0KICAgWzJdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL1BhdGNo
d29ya18xNzY1NC9maS1oc3ctNDc3MC9ib290Lmh0bWwNCg0KPiANCj4gQlIsDQo+IEphbmkuDQo+
IA0KPiANCj4gPg0KPiA+IDwxPlsgICAgMy43MzY5MDNdIEJVRzoga2VybmVsIE5VTEwgcG9pbnRl
ciBkZXJlZmVyZW5jZSwgYWRkcmVzczoNCj4gMDAwMDAwMDAwMDAwMDAwMA0KPiA+IDwxPlsgICAg
My43MzY5MTZdICNQRjogc3VwZXJ2aXNvciByZWFkIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQ0KPiA+
IDwxPlsgICAgMy43MzY5MTZdICNQRjogZXJyb3JfY29kZSgweDAwMDApIC0gbm90LXByZXNlbnQg
cGFnZQ0KPiA+IDw2PlsgICAgMy43MzY5MTddIFBHRCAwIFA0RCAwDQo+ID4gPDQ+WyAgICAzLjcz
NjkxOV0gT29wczogMDAwMCBbIzFdIFBSRUVNUFQgU01QIFBUSQ0KPiA+IDw0PlsgICAgMy43MzY5
MjFdIENQVTogMCBQSUQ6IDM2MyBDb21tOiBzeXN0ZW1kLXVkZXZkIE5vdCB0YWludGVkIDUuNy4w
LXJjNS1DSS0NCj4gQ0lfRFJNXzg0ODUrICMxDQo+ID4gPDQ+WyAgICAzLjczNjkyMl0gSGFyZHdh
cmUgbmFtZTogTEVOT1ZPIDEwQUdTMDA2MDEvU0hBUktCQVksIEJJT1MNCj4gRkJLVDM0QVVTIDA0
LzI0LzIwMTMNCj4gPiA8ND5bICAgIDMuNzM2OTg2XSBSSVA6IDAwMTA6aW50ZWxfcHNyX2VuYWJs
ZWQrMHg4LzB4NzAgW2k5MTVdDQo+ID4gPDQ+WyAgICAzLjczNjk4OF0gQ29kZTogMTggNDggYzcg
YzYgNDAgMDkgNzkgYTAgZTggZTMgZTIgMDQgZTEgMGYgYjYgNDQgMjQgMDMgZTkgZjQNCj4gZmQg
ZmYgZmYgOTAgNjYgMmUgMGYgMWYgODQgMDAgMDAgMDAgMDAgMDAgNDEgNTQgNTUgNTMgNDggODMg
ZWMgMDggPDQ4PiA4YiA5ZiBkOCBmZSBmZiBmZg0KPiBmNiA4MyA1ZSAwZCAwMCAwMCAyMCA3NCAw
OSA4MCBiYiA2YyBiNiAwMCAwMA0KPiA+IDw0PlsgICAgMy43MzcwMzZdIFJTUDogMDAxODpmZmZm
YzkwMDAwNDdmOGEwIEVGTEFHUzogMDAwMTAyODYNCj4gPiA8ND5bICAgIDMuNzM3MDQyXSBSQVg6
IDAwMDAwMDAwMDAwMDAwMDIgUkJYOiBmZmZmODg4M2ZmZDA0MDAwIFJDWDoNCj4gMDAwMDAwMDAw
MDAwMDAwMQ0KPiA+IDw0PlsgICAgMy43MzcwNDhdIFJEWDogMDAwMDAwMDAwMDAwMDAwNyBSU0k6
IGZmZmY4ODgzZmZkMDQwMDAgUkRJOg0KPiAwMDAwMDAwMDAwMDAwMTI4DQo+ID4gPDQ+WyAgICAz
LjczNzA1NV0gUkJQOiBmZmZmODg4NDA2YWZlMjAwIFIwODogMDAwMDAwMDAwMDAwMDAwZiBSMDk6
DQo+IDAwMDAwMDAwMDAwMDAwMDENCj4gPiA8ND5bICAgIDMuNzM3MDYxXSBSMTA6IDAwMDAwMDAw
MDAwMDAwMDAgUjExOiAwMDAwMDAwMDAwMDAwMDAwIFIxMjoNCj4gMDAwMDAwMDAwMDAwMDAwMA0K
PiA+IDw0PlsgICAgMy43MzcwNjhdIFIxMzogZmZmZjg4ODNmNzVkMDAwMCBSMTQ6IGZmZmY4ODg0
MDZhZmUyMDAgUjE1Og0KPiBmZmZmODg4M2Y3NWQwODcwDQo+ID4gPDQ+WyAgICAzLjczNzA3NV0g
RlM6ICAwMDAwN2Y3MTYxOGY5NjgwKDAwMDApIEdTOmZmZmY4ODg0MGVjMDAwMDAoMDAwMCkNCj4g
a25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPiA+IDw0PlsgICAgMy43MzcwODJdIENTOiAgMDAxMCBE
UzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMNCj4gPiA8ND5bICAgIDMuNzM3
MDg4XSBDUjI6IDAwMDAwMDAwMDAwMDAwMDAgQ1IzOiAwMDAwMDAwNDAyNTEwMDAyIENSNDoNCj4g
MDAwMDAwMDAwMDE2MDZmMA0KPiA+IDw0PlsgICAgMy43MzcwOTRdIERSMDogMDAwMDAwMDAwMDAw
MDAwMCBEUjE6IDAwMDAwMDAwMDAwMDAwMDAgRFIyOg0KPiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4g
PDQ+WyAgICAzLjczNzEwMV0gRFIzOiAwMDAwMDAwMDAwMDAwMDAwIERSNjogMDAwMDAwMDBmZmZl
MGZmMCBEUjc6DQo+IDAwMDAwMDAwMDAwMDA0MDANCj4gPiA8ND5bICAgIDMuNzM3MTA3XSBDYWxs
IFRyYWNlOg0KPiA+IDw0PlsgICAgMy43MzcxNzVdICBpbnRlbF9yZWFkX2RwX3NkcCsweDFhNC8w
eDM4MCBbaTkxNV0NCj4gPiA8ND5bICAgIDMuNzM3MjQ2XSAgaHN3X2NydF9nZXRfY29uZmlnKzB4
MTIvMHg0MCBbaTkxNV0NCj4gPiA8ND5bICAgIDMuNzM3MzE3XSAgaW50ZWxfbW9kZXNldF9zZXR1
cF9od19zdGF0ZSsweDNiMy8weDE2YTAgW2k5MTVdDQo+ID4gLi4uDQo+IA0KPiAtLQ0KPiBKYW5p
IE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyDQo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IEludGVsLWdmeCBtYWlsaW5n
IGxpc3QNCj4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040831D5792
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 19:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC516ED09;
	Fri, 15 May 2020 17:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11676ED09;
 Fri, 15 May 2020 17:22:47 +0000 (UTC)
IronPort-SDR: nSm0kO+0z+7ocpcX4ZzQEW/wLH7fpbzKuv4Vi05NWbGC5bMcvcZxU5IiiTHJ5mQEv9RhokmLqx
 XwGIsyqG4VxA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 10:22:47 -0700
IronPort-SDR: 6+t5nB6pw/R2COsxj7hF+fmiDO2dB9jv4udPEwK4XJbNjsI5IeP5TVx/HkWQWFyacVoL/apkwN
 VR1Cc+z2Q5Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,396,1583222400"; d="scan'208";a="438384258"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
 by orsmga005.jf.intel.com with ESMTP; 15 May 2020 10:22:44 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 15 May 2020 18:22:43 +0100
Received: from irsmsx605.ger.corp.intel.com (163.33.146.138) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 May 2020 18:22:43 +0100
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138]) by
 IRSMSX605.ger.corp.intel.com ([163.33.146.138]) with mapi id 15.01.1713.004;
 Fri, 15 May 2020 18:22:43 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v12 00/14] In order to readout DP SDPs, refactors the
 handling of DP SDPs
Thread-Topic: [PATCH v12 00/14] In order to readout DP SDPs, refactors the
 handling of DP SDPs
Thread-Index: AQHWKeGJb6E7K9KVgUC8KKYXcyaCcqipDrAAgAAB/ACAABEUAIAANJoA
Date: Fri, 15 May 2020 17:22:43 +0000
Message-ID: <e2cf963c6db302d94195f4af643d8fbad3ece5dc.camel@intel.com>
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
 <87eerm4vd0.fsf@intel.com> <20200515130612.GI6112@intel.com>
 <87zha92vf5.fsf@intel.com> <20200515141426.GI206103@phenom.ffwll.local>
In-Reply-To: <20200515141426.GI206103@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.20.205]
Content-ID: <1D39322AF3464E49BDC12C15E7949135@intel.com>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUsDQpUaGFuayB5b3UgZm9yIG5vdGlmeWluZyBtZSB0aGF0LiBJIGRlZmluaXRlbHkg
bWlzc2VkIHRoZSBjcmFzaC4NClNvcnJ5IGZvciB0aGF0Lg0KRGFuaWFsIGFuZCBKYW5pLCBJJyB1
bmRlciBkZWJ1Z2dpbmcgdGhlIGNyYXNoIGNhc2UuDQpJZiB5b3UgYXJlIGF2YWlsYWJlIHBsZWFz
ZSBkbyBub3QgbWVyZ2UgY3VycmVudCB2ZXJzaW9uLg0KDQpCciwNCg0KRy5HLg0KDQo+IA0KT24g
RnJpLCAyMDIwLTA1LTE1IGF0IDE2OjE0ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPiBP
biBGcmksIE1heSAxNSwgMjAyMCBhdCAwNDoxMzoxOFBNICswMzAwLCBKYW5pIE5pa3VsYSB3cm90
ZToNCj4gPiBPbiBGcmksIDE1IE1heSAyMDIwLCBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPg0KPiA+IHdyb3RlOg0KPiA+ID4gT24gVGh1LCBNYXkgMTQsIDIw
MjAgYXQgMDI6MTk6MjNQTSArMDMwMCwgSmFuaSBOaWt1bGEgd3JvdGU6DQo+ID4gPiA+IE9uIFRo
dSwgMTQgTWF5IDIwMjAsIEd3YW4tZ3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNv
bQ0KPiA+ID4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+IEluIG9yZGVyIHRvIHJlYWRvdXQgRFAgU0RQ
cyAoU2Vjb25kYXJ5IERhdGEgUGFja2V0OiBEUCBIRFINCj4gPiA+ID4gPiBNZXRhZGF0YQ0KPiA+
ID4gPiA+IEluZm9mcmFtZSBTRFAsIERQIFZTQyBTRFApLCBpdCByZWZhY3RvcnMgaGFuZGxpbmcg
RFAgU0RQcw0KPiA+ID4gPiA+IGNvZGVzLg0KPiA+ID4gPiA+IEl0IGFkZHMgbmV3IGNvbXB1dGUg
cm91dGluZXMgZm9yIERQIEhEUiBNZXRhZGF0YSBJbmZvZnJhbWUNCj4gPiA+ID4gPiBTRFANCj4g
PiA+ID4gPiBhbmQgRFAgVlNDIFNEUC4gDQo+ID4gPiA+ID4gQW5kIG5ldyB3cml0aW5nIHJvdXRp
bmVzIG9mIERQIFNEUHMgKFNlY29uZGFyeSBEYXRhIFBhY2tldCkNCj4gPiA+ID4gPiB0aGF0IHVz
ZXMNCj4gPiA+ID4gPiBjb21wdXRlZCBjb25maWdzLg0KPiA+ID4gPiA+IE5ldyByZWFkaW5nIHJv
dXRpbmVzIG9mIERQIFNEUHMgYXJlIGFkZGVkIGZvciByZWFkb3V0Lg0KPiA+ID4gPiA+IEl0IGFk
ZHMgYSBsb2dnaW5nIGZ1bmN0aW9uIGZvciBEUCBWU0MgU0RQLg0KPiA+ID4gPiA+IFdoZW4gcmVj
ZWl2aW5nIHZpZGVvIGl0IGlzIHZlcnkgdXNlZnVsIHRvIGJlIGFibGUgdG8gbG9nIERQDQo+ID4g
PiA+ID4gVlNDIFNEUC4NCj4gPiA+ID4gPiBUaGlzIGdyZWF0bHkgc2ltcGxpZmllcyBkZWJ1Z2dp
bmcuDQo+ID4gPiA+ID4gSW4gb3JkZXIgdG8gdXNlIGEgY29tbW9uIFZTQyBTRFAgQ29sb3JpbWV0
cnkgY2FsY3VsYXRpbmcgY29kZQ0KPiA+ID4gPiA+IG9uIFBTUiwNCj4gPiA+ID4gPiBpdCB1c2Vz
IGEgbmV3IHBzciB2c2Mgc2RwIGNvbXB1dGUgcm91dGluZS4NCj4gPiA+ID4gDQo+ID4gPiA+IFB1
c2hlZCB0aGUgc2VyaWVzIHRvIGRybS1pbnRlbC1uZXh0LXF1ZXVlZCB3aXRoIERhbmllbCdzIGly
Yw0KPiA+ID4gPiBhY2sgZm9yDQo+ID4gPiA+IG1lcmdpbmcgdGhlIHR3byBub24taTkxNSBwYXRj
aGVzIHRoYXQgcm91dGUgdG9vLg0KPiA+ID4gDQo+ID4gPiBmaS1oc3ctNDc3MCBub3cgb29wc2Vz
IGF0IGJvb3Q6DQo+ID4gDQo+ID4gL29cDQo+ID4gDQo+ID4gV2hhdCBkaWQgSSBtaXNzPyBXaGF0
IHBhcnQgYWJvdXQgdGhlIENJIHJlcG9ydCBkaWQgSSBvdmVybG9vaz8NCj4gDQo+IFBhcnRpY2lw
YXRpbmcgaG9zdHMgKDQ4IC0+IDQ1KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gDQo+ICAgQWRkaXRpb25hbCAoMSk6IGZpLWtibC03NTYwdSANCj4gICBNaXNzaW5nICAgICg0
KTogZmktYnl0LWNsYXBwZXIgZmktYnl0LXNxdWF3a3MgZmktYnN3LWN5YW4gZmktaHN3LQ0KPiA0
MjAwdQ0KPiANCj4gDQo+IFlvdSBraWxsIG1hY2hpbmVzIGF0IGJvb3QsIENJIHdvbid0IHRlbGwg
eW91Lg0KPiANCj4gVGhpcyBpcyAob3IgYXQgbGVhc3Qgd2FzKSBiZWNhdXNlIHRoZSBuZXR3b3Jr
IGlzIHNoaXR0eSBlbm91Z2ggdGhhdA0KPiB3ZQ0KPiBoYXZlIG1vcmUgc3B1cmlvdXMgZmFpbHVy
ZXMgYmVjYXVzZSB0aGUgZXRoZXJuZXQgd2VudCBpbnRvIHRoZSBldGhlcg0KPiB0aGFuDQo+IGJl
Y2F1c2Ugb2YgcGVvcGxlIGhhdmluZyBraWxsZWQgdGhlIG1hY2hpbmUgd2l0aCB0aGVpciBwYXRj
aGVzIGZvcg0KPiByZWFsLg0KPiBBbHNvIGl0J3MgaGFyZCB0byBncmFiIGxvZ3MgaWYgdGhlIHRo
aW5nIGRvZXNuJ3Qgd29yayBhdCBhbGwsIHNvIGNhbnQNCj4gZ2l2ZQ0KPiB5b3UgYW55IG1vcmUg
ZGF0YSB0aGFuIHRoZSBhYm92ZS4NCj4gDQo+IFllcyB0aGlzIHN1Y2tzIDotLw0KPiANCj4gQ2hl
ZXJzLCBEYW5pZWwNCj4gDQo+ID4gQlIsDQo+ID4gSmFuaS4NCj4gPiANCj4gPiANCj4gPiA+IDwx
PlsgICAgMy43MzY5MDNdIEJVRzoga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRk
cmVzczoNCj4gPiA+IDAwMDAwMDAwMDAwMDAwMDANCj4gPiA+IDwxPlsgICAgMy43MzY5MTZdICNQ
Rjogc3VwZXJ2aXNvciByZWFkIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQ0KPiA+ID4gPDE+WyAgICAz
LjczNjkxNl0gI1BGOiBlcnJvcl9jb2RlKDB4MDAwMCkgLSBub3QtcHJlc2VudCBwYWdlDQo+ID4g
PiA8Nj5bICAgIDMuNzM2OTE3XSBQR0QgMCBQNEQgMCANCj4gPiA+IDw0PlsgICAgMy43MzY5MTld
IE9vcHM6IDAwMDAgWyMxXSBQUkVFTVBUIFNNUCBQVEkNCj4gPiA+IDw0PlsgICAgMy43MzY5MjFd
IENQVTogMCBQSUQ6IDM2MyBDb21tOiBzeXN0ZW1kLXVkZXZkIE5vdCB0YWludGVkDQo+ID4gPiA1
LjcuMC1yYzUtQ0ktQ0lfRFJNXzg0ODUrICMxDQo+ID4gPiA8ND5bICAgIDMuNzM2OTIyXSBIYXJk
d2FyZSBuYW1lOiBMRU5PVk8gMTBBR1MwMDYwMS9TSEFSS0JBWSwgQklPUw0KPiA+ID4gRkJLVDM0
QVVTIDA0LzI0LzIwMTMNCj4gPiA+IDw0PlsgICAgMy43MzY5ODZdIFJJUDogMDAxMDppbnRlbF9w
c3JfZW5hYmxlZCsweDgvMHg3MCBbaTkxNV0NCj4gPiA+IDw0PlsgICAgMy43MzY5ODhdIENvZGU6
IDE4IDQ4IGM3IGM2IDQwIDA5IDc5IGEwIGU4IGUzIGUyIDA0IGUxIDBmDQo+ID4gPiBiNiA0NCAy
NCAwMyBlOSBmNCBmZCBmZiBmZiA5MCA2NiAyZSAwZiAxZiA4NCAwMCAwMCAwMCAwMCAwMCA0MSA1
NA0KPiA+ID4gNTUgNTMgNDggODMgZWMgMDggPDQ4PiA4YiA5ZiBkOCBmZSBmZiBmZiBmNiA4MyA1
ZSAwZCAwMCAwMCAyMCA3NA0KPiA+ID4gMDkgODAgYmIgNmMgYjYgMDAgMDANCj4gPiA+IDw0Plsg
ICAgMy43MzcwMzZdIFJTUDogMDAxODpmZmZmYzkwMDAwNDdmOGEwIEVGTEFHUzogMDAwMTAyODYN
Cj4gPiA+IDw0PlsgICAgMy43MzcwNDJdIFJBWDogMDAwMDAwMDAwMDAwMDAwMiBSQlg6IGZmZmY4
ODgzZmZkMDQwMDANCj4gPiA+IFJDWDogMDAwMDAwMDAwMDAwMDAwMQ0KPiA+ID4gPDQ+WyAgICAz
LjczNzA0OF0gUkRYOiAwMDAwMDAwMDAwMDAwMDA3IFJTSTogZmZmZjg4ODNmZmQwNDAwMA0KPiA+
ID4gUkRJOiAwMDAwMDAwMDAwMDAwMTI4DQo+ID4gPiA8ND5bICAgIDMuNzM3MDU1XSBSQlA6IGZm
ZmY4ODg0MDZhZmUyMDAgUjA4OiAwMDAwMDAwMDAwMDAwMDBmDQo+ID4gPiBSMDk6IDAwMDAwMDAw
MDAwMDAwMDENCj4gPiA+IDw0PlsgICAgMy43MzcwNjFdIFIxMDogMDAwMDAwMDAwMDAwMDAwMCBS
MTE6IDAwMDAwMDAwMDAwMDAwMDANCj4gPiA+IFIxMjogMDAwMDAwMDAwMDAwMDAwMA0KPiA+ID4g
PDQ+WyAgICAzLjczNzA2OF0gUjEzOiBmZmZmODg4M2Y3NWQwMDAwIFIxNDogZmZmZjg4ODQwNmFm
ZTIwMA0KPiA+ID4gUjE1OiBmZmZmODg4M2Y3NWQwODcwDQo+ID4gPiA8ND5bICAgIDMuNzM3MDc1
XSBGUzogIDAwMDA3ZjcxNjE4Zjk2ODAoMDAwMCkNCj4gPiA+IEdTOmZmZmY4ODg0MGVjMDAwMDAo
MDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPiA+ID4gPDQ+WyAgICAzLjczNzA4Ml0gQ1M6
ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDoNCj4gPiA+IDAwMDAwMDAwODAwNTAwMzMNCj4g
PiA+IDw0PlsgICAgMy43MzcwODhdIENSMjogMDAwMDAwMDAwMDAwMDAwMCBDUjM6IDAwMDAwMDA0
MDI1MTAwMDINCj4gPiA+IENSNDogMDAwMDAwMDAwMDE2MDZmMA0KPiA+ID4gPDQ+WyAgICAzLjcz
NzA5NF0gRFIwOiAwMDAwMDAwMDAwMDAwMDAwIERSMTogMDAwMDAwMDAwMDAwMDAwMA0KPiA+ID4g
RFIyOiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gPiA8ND5bICAgIDMuNzM3MTAxXSBEUjM6IDAwMDAw
MDAwMDAwMDAwMDAgRFI2OiAwMDAwMDAwMGZmZmUwZmYwDQo+ID4gPiBEUjc6IDAwMDAwMDAwMDAw
MDA0MDANCj4gPiA+IDw0PlsgICAgMy43MzcxMDddIENhbGwgVHJhY2U6DQo+ID4gPiA8ND5bICAg
IDMuNzM3MTc1XSAgaW50ZWxfcmVhZF9kcF9zZHArMHgxYTQvMHgzODAgW2k5MTVdDQo+ID4gPiA8
ND5bICAgIDMuNzM3MjQ2XSAgaHN3X2NydF9nZXRfY29uZmlnKzB4MTIvMHg0MCBbaTkxNV0NCj4g
PiA+IDw0PlsgICAgMy43MzczMTddICBpbnRlbF9tb2Rlc2V0X3NldHVwX2h3X3N0YXRlKzB4M2Iz
LzB4MTZhMA0KPiA+ID4gW2k5MTVdDQo+ID4gPiAuLi4NCj4gPiANCj4gPiAtLSANCj4gPiBKYW5p
IE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

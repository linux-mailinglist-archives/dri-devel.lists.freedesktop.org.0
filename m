Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDEC105E08
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 02:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39D889330;
	Fri, 22 Nov 2019 01:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B196EEB7;
 Fri, 22 Nov 2019 01:07:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 17:07:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,227,1571727600"; d="scan'208";a="210105377"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by orsmga003.jf.intel.com with ESMTP; 21 Nov 2019 17:07:25 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.67]) by
 ORSMSX103.amr.corp.intel.com ([169.254.5.179]) with mapi id 14.03.0439.000;
 Thu, 21 Nov 2019 17:07:25 -0800
From: "Li, Juston" <juston.li@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "tjaalton@ubuntu.com"
 <tjaalton@ubuntu.com>
Subject: Re: [RESEND PATCH v2] drm: Add getfb2 ioctl
Thread-Topic: [RESEND PATCH v2] drm: Add getfb2 ioctl
Thread-Index: AQHVehjqnnUR69HL40SydOa1JuEI7qdS89EAgEMo2ICAABF1AIABBjIA
Date: Fri, 22 Nov 2019 01:07:24 +0000
Message-ID: <00aada61ac0b2de179787a65fba587426deaa6a1.camel@intel.com>
References: <20191003183125.4520-1-juston.li@intel.com>
 <20191009155054.GM16989@phenom.ffwll.local>
 <14d291d3-774b-faec-370d-0d0164f33447@ubuntu.com>
 <CAKMK7uHM=z5gbjmd6aTxJ6tnxM81hMYndNav85i55-nCSQi+4w@mail.gmail.com>
In-Reply-To: <CAKMK7uHM=z5gbjmd6aTxJ6tnxM81hMYndNav85i55-nCSQi+4w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.198.153]
Content-ID: <48757033E870304EABCA9E50FB31E78A@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "daniels@collabora.com" <daniels@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTExLTIxIGF0IDEwOjI4ICswMTAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCA5OjI2IEFNIFRpbW8gQWFsdG9uZW4gPHRqYWFsdG9u
QHVidW50dS5jb20+DQo+IHdyb3RlOg0KPiA+IE9uIDkuMTAuMjAxOSAxOC41MCwgRGFuaWVsIFZl
dHRlciB3cm90ZToNCj4gPiA+IE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDExOjMxOjI1QU0gLTA3
MDAsIEp1c3RvbiBMaSB3cm90ZToNCj4gPiA+ID4gRnJvbTogRGFuaWVsIFN0b25lIDxkYW5pZWxz
QGNvbGxhYm9yYS5jb20+DQo+ID4gPiA+IA0KPiA+ID4gPiBnZXRmYjIgYWxsb3dzIHVzIHRvIHBh
c3MgbXVsdGlwbGUgcGxhbmVzIGFuZCBtb2RpZmllcnMsIGp1c3QNCj4gPiA+ID4gbGlrZSBhZGRm
YjINCj4gPiA+ID4gb3ZlciBhZGRmYi4NCj4gPiA+ID4gDQo+ID4gPiA+IENoYW5nZXMgc2luY2Ug
djE6DQo+ID4gPiA+ICAtIHVudXNlZCBtb2RpZmllcnMgc2V0IHRvIDAgaW5zdGVhZCBvZiBEUk1f
Rk9STUFUX01PRF9JTlZBTElEDQo+ID4gPiA+ICAtIHVwZGF0ZSBpb2N0bCBudW1iZXINCj4gPiA+
ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBTdG9uZSA8ZGFuaWVsc0Bjb2xsYWJv
cmEuY29tPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRl
bC5jb20+DQo+ID4gPiANCj4gPiA+IExvb2tzIGFsbCBnb29kIGZyb20gYSB2ZXJ5IHF1aWNrIGds
YW5jZSAoa2VybmVsLCBsaWJkcm0sIGlndCksDQo+ID4gPiBidXQgd2hlcmUncw0KPiA+ID4gdGhl
IHVzZXJzcGFjZT8gTGluayB0byB3ZXN0b24vZHJtX2h3Yy93aGF0ZXZlciBNUiBnb29kIGVub3Vn
aC4NCj4gPiA+IC1EYW5pZWwNCj4gPiANCj4gPiB4c2VydmVyIHRvbw0KPiA+IA0KPiA+IGh0dHBz
Oi8vbGlzdHMueC5vcmcvYXJjaGl2ZXMveG9yZy1kZXZlbC8yMDE4LU1hcmNoLzA1NjM2My5odG1s
DQo+ID4gDQo+ID4gdG8gZml4DQo+ID4gDQo+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL3hvcmcveHNlcnZlci9pc3N1ZXMvMzMNCj4gPiANCj4gPiB3aGljaCBmb3JjZXMgVWJ1bnR1
IHRvIGRpc2FibGUgQ0NTIGNvbXByZXNzaW9uLCBhbmQgSSdkIGxpa2UgdG8gZ2V0DQo+ID4gcmlk
DQo+ID4gb2YgdGhhdCBwYXRjaC4NCj4gPiANCj4gPiBUaGFua3MgSnVzdG9uIGZvciBwdXNoaW5n
IHRoaXMhDQo+IA0KPiBBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZnds
bC5jaD4NCj4gDQo+IC4uLiBidXQgc29tZW9uZSBuZWVkcyB0byByZXZpZXcgYWxsIHRoZSBwYXRj
aGVzIGFuZCBtYWtlIHN1cmUga2VybmVsDQo+IHBhdGNoICsgaWd0IHdvcmsgYW5kIHBhc3MgaW50
ZWwgQ0kgYW5kIHRoZW4gcHVzaCBpdCBhbGwsIGFuZCBnaXZlbg0KPiB0aGUNCj4gcGlsZSBvZiBj
b21taXR0ZXJzIHdlIGhhdmUgdGhhdCdzIG5vdCBtZSBJIHRoaW5rLiBKdXN0IGluIGNhc2UgcGVv
cGxlDQo+IGV4cGVjdCBtZSB0byBwdXNoIHRoaXMgZm9yd2FyZCwgSSBvbmx5IGp1bXBlZCBpbiBo
ZXJlIHRvIG1ha2Ugc3VyZQ0KPiBuZXcNCj4gdWFwaSBpcyBkb25lIGJ5IHRoZSBib29rIGFuZCBj
aGVja3MgYWxsIHRoZSBib3hlcy4NCj4gLURhbmllbA0KDQpUaGFua3MgZm9yIGNsYXJpZnlpbmcg
RGFuaWVsLCBJJ2xsIHRyeSB0byBmaW5kIHNvbWVvbmUgdG8gcmV2aWV3Lg0KDQpKdXN0b24NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

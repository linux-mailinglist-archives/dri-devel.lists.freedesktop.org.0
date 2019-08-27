Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3535E9E973
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 15:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B7689AB6;
	Tue, 27 Aug 2019 13:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410AE89AB5;
 Tue, 27 Aug 2019 13:33:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 06:33:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="180229315"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga008.fm.intel.com with ESMTP; 27 Aug 2019 06:33:01 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 27 Aug 2019 06:33:01 -0700
Received: from hasmsx113.ger.corp.intel.com (10.184.198.64) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 27 Aug 2019 06:33:00 -0700
Received: from hasmsx108.ger.corp.intel.com ([169.254.9.203]) by
 HASMSX113.ger.corp.intel.com ([169.254.13.63]) with mapi id 14.03.0439.000;
 Tue, 27 Aug 2019 16:32:58 +0300
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "C, Ramalingam" <ramalingam.c@intel.com>
Subject: RE: [PATCH v10 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Thread-Topic: [PATCH v10 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Thread-Index: AQHVXMVRSsOGlv6880mVspSOZAq5YKcO9YPw///Tn4CAADRcAA==
Date: Tue, 27 Aug 2019 13:32:57 +0000
Message-ID: <5B8DA87D05A7694D9FA63FD143655C1B9DCA4F39@hasmsx108.ger.corp.intel.com>
References: <20190827105014.14181-1-ramalingam.c@intel.com>
 <5B8DA87D05A7694D9FA63FD143655C1B9DCA4E9E@hasmsx108.ger.corp.intel.com>
 <20190827132233.GA5040@intel.com>
In-Reply-To: <20190827132233.GA5040@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTEyN2MzNzctNjcwOC00N2JjLWI1YmQtNTExM2IzMzIwN2IxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZXltY05vdjJQUnFDNVBDVktTU0FFU2tYdnJXS1cxNFpUZXRwcDY0dW40dmRsekhVU2x0K0NUaGowYTJFUUswYyJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.184.70.10]
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25seSBmaWxlcyBhcmUgdGhhdCBhcmUgbW9kaWZpZWQgaW4gdGhpcyB5ZWFyIHNob3VsZCBiZSB1
cGRhdGVkLiANCkZvciBleGFtcGxlLiANCmluY2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJm
YWNlLmgNCg0KLSAqIENvcHlyaWdodCDCqSAyMDE3LTIwMTggSW50ZWwgQ29ycG9yYXRpb24NCisg
KiBDb3B5cmlnaHQgwqkgMjAxNy0yMDE5IEludGVsIENvcnBvcmF0aW9uDQoNCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDLCBSYW1hbGluZ2FtDQo+IFNlbnQ6IFR1ZXNk
YXksIEF1Z3VzdCAyNywgMjAxOSAxNjoyMw0KPiBUbzogV2lua2xlciwgVG9tYXMgPHRvbWFzLndp
bmtsZXJAaW50ZWwuY29tPg0KPiBDYzogaW50ZWwtZ2Z4IDxpbnRlbC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPjsgZHJpLWRldmVsIDxkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zz47IFNoYXJtYSwgU2hhc2hhbmsNCj4gPHNoYXNoYW5rLnNoYXJtYUBpbnRlbC5jb20+OyBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBOaWt1bGEsIEphbmkNCj4gPGphbmkubmlrdWxh
QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTAgMC82XSBkcm0vaTkxNTogRW5h
YmxlIEhEQ1AgMS40IGFuZCAyLjIgb24gR2VuMTIrDQo+IA0KPiBPbiAyMDE5LTA4LTI3IGF0IDE4
OjMyOjEzICswNTMwLCBXaW5rbGVyLCBUb21hcyB3cm90ZToNCj4gPg0KPiA+ID4gRW5hYmxpbmcg
dGhlIEhEQ1AxLjQgYW5kIDIuMiBvbiBUR0wgYnkgc3VwcG9ydGluZyB0aGUgSFcgYmxvY2sNCj4g
PiA+IG1vdmVtZW50IGZyb20gRERJIGludG8gdHJhbnNjb2Rlci4NCj4gPg0KPiA+IEluIHNvbWUg
ZmlsZXMgbmVlZHMgdG8gYnVtcCB0aGUgY29weXJpZ2h0IHRvIDIwMTkuDQo+IFRvbWFzLA0KPiAN
Cj4gSSBhbSBub3QgYXdhcmUgd2hlbiBhIGNvcHlyaWdodCB5ZWFyIG5lZWRzIHRvIGJlICBidW1w
ZWQsIGFzIGNvcHlyaWdodCB5ZWFyDQo+IGZvciBtYW55IEk5MTUgZmlsZXMgYXJlIG5vdCBsYXRl
c3QuDQo+IA0KPiBBbnkgZ3VpZGVsaW5lcyBoZXJlIHdvdWxkIGhlbHAgbWUgdG8gdW5kZXJzdGFu
ZC4NCj4gDQo+IFRoYW5rcywNCj4gLVJhbS4NCj4gPg0KPiA+ID4NCj4gPiA+IHYxMDoNCj4gPiA+
ICAgUmV2aWV3IGNvbW1lbnRzIGZyb20gc2hhc2hhbmsgYWRkcmVzc2VkDQo+ID4gPg0KPiA+ID4g
UmFtYWxpbmdhbSBDICg2KToNCj4gPiA+ICAgZHJtL2k5MTU6IG1laV9oZGNwOiBJOTE1IHNlbmRz
IGRkaSBpbmRleCBhcyBwZXIgTUUgRlcNCj4gPiA+ICAgZHJtOiBNb3ZlIHBvcnQgZGVmaW5pdGlv
biBiYWNrIHRvIGk5MTUgaGVhZGVyDQo+ID4gPiAgIGRybTogRXh0ZW5kIEk5MTUgbWVpIGludGVy
ZmFjZSBmb3IgdHJhbnNjb2RlciBpbmZvDQo+ID4gPiAgIG1pc2MvbWVpL2hkY3A6IEZpbGwgdHJh
bnNjb2RlciBpbmRleCBpbiBwb3J0IGluZm8NCj4gPiA+ICAgZHJtL2k5MTUvaGRjcDogdXBkYXRl
IGN1cnJlbnQgdHJhbnNjb2RlciBpbnRvIGludGVsX2hkY3ANCj4gPiA+ICAgZHJtL2k5MTUvaGRj
cDogRW5hYmxlIEhEQ1AgMS40IGFuZCAyLjIgb24gR2VuMTIrDQo+ID4gPg0KPiA+ID4gIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5oICAgICB8ICAgMSArDQo+ID4gPiAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmggIHwgIDE4ICsrDQo+
ID4gPiAgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oICAgIHwgICA3
ICsNCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgICAg
fCAgIDMgKw0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuaCAg
ICAgICB8ICAgMSArDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9o
ZGNwLmMgICAgIHwgMjEyICsrKysrKysrKysrKystLS0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5oICAgICB8ICAgNCArDQo+ID4gPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgICAgIHwgIDEzICstDQo+ID4gPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmggICAgIHwgICAxICsNCj4gPiA+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hvdHBsdWcuaCAgfCAgIDEgKw0K
PiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc2R2by5oICAgICB8ICAg
MSArDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCAgICAgICAgICAgICAg
IHwgMTI0ICsrKysrKysrKy0NCj4gPiA+ICBkcml2ZXJzL21pc2MvbWVpL2hkY3AvbWVpX2hkY3Au
YyAgICAgICAgICAgICAgfCAgNDUgKystLQ0KPiA+ID4gIGRyaXZlcnMvbWlzYy9tZWkvaGRjcC9t
ZWlfaGRjcC5oICAgICAgICAgICAgICB8ICAxNiArLQ0KPiA+ID4gIGluY2x1ZGUvZHJtL2k5MTVf
ZHJtLmggICAgICAgICAgICAgICAgICAgICAgICB8ICAxOCAtLQ0KPiA+ID4gIGluY2x1ZGUvZHJt
L2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmggICAgICAgICB8ICAyOSArKy0NCj4gPiA+ICAxNiBm
aWxlcyBjaGFuZ2VkLCAzNzIgaW5zZXJ0aW9ucygrKSwgMTIyIGRlbGV0aW9ucygtKQ0KPiA+ID4N
Cj4gPiA+IC0tDQo+ID4gPiAyLjIwLjENCj4gPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs

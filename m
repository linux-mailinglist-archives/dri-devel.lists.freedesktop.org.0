Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5321FA156B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 12:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21E56E094;
	Thu, 29 Aug 2019 10:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DA76E094;
 Thu, 29 Aug 2019 10:07:55 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 03:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; d="scan'208";a="205669099"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga004.fm.intel.com with ESMTP; 29 Aug 2019 03:07:52 -0700
Date: Thu, 29 Aug 2019 15:37:19 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: Re: [PATCH v12 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Message-ID: <20190829100719.GA10415@intel.com>
References: <20190828164216.405-1-ramalingam.c@intel.com>
 <20190828164814.GA25367@intel.com>
 <5B8DA87D05A7694D9FA63FD143655C1B9DCA7EAC@hasmsx108.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5B8DA87D05A7694D9FA63FD143655C1B9DCA7EAC@hasmsx108.ger.corp.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

T24gMjAxOS0wOC0yOSBhdCAxNToyODozNSArMDUzMCwgV2lua2xlciwgVG9tYXMgd3JvdGU6Cj4g
PiBPbiAyMDE5LTA4LTI4IGF0IDIyOjEyOjEwICswNTMwLCBSYW1hbGluZ2FtIEMgd3JvdGU6Cj4g
PiA+IEVuYWJsaW5nIHRoZSBIRENQMS40IGFuZCAyLjIgb24gVEdMIGJ5IHN1cHBvcnRpbmcgdGhl
IEhXIGJsb2NrCj4gPiA+IG1vdmVtZW50IGZyb20gRERJIGludG8gdHJhbnNjb2Rlci4KPiA+ID4K
PiA+ID4gdjEyOgo+ID4gPiAgIHItYiBhbmQgYWNrIGFyZSBjb2xsZWN0ZWQuCj4gPiA+ICAgZmV3
IHJldmlldyBjb21tZW50cyBhcmUgYWRkcmVzc2VkLgo+ID4gCj4gPiBUb21hcywKPiA+IAo+ID4g
VGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIHBhdGNoZXMgYW5kIHByb3ZpZGluZyB0aGUgQWNrL1It
YmVzLgo+ID4gQXMgd2UgZGlzY3Vzc2VkIG9mZmxpbmUsIHdlIG5lZWQgeW91ciBBQ0sgZm9yIHN1
Ym1pdHRpbmcgbWVpX2hkY3AgcGF0Y2hlcwo+ID4gdGhyb3VnaCBkaW5xKGRybS1pbnRlbC1uZXh0
LXF1ZXVlZCkuIFBsZWFzZSBwcm92aWRlIHRoZSBzYW1lLiAKPiAKPiAKPiBBQ0sgCk9uY2UgYWdh
aW4gdGhhbmtzIFRvbWFzIGZvciByZXZpZXcuCgotUmFtCj4gCj4gPiAKPiA+IC1SYW0KPiA+ID4K
PiA+ID4gUmFtYWxpbmdhbSBDICg2KToKPiA+ID4gICBkcm0vaTkxNTogbWVpX2hkY3A6IEk5MTUg
c2VuZHMgZGRpIGluZGV4IGFzIHBlciBNRSBGVwo+ID4gPiAgIGRybTogTW92ZSBwb3J0IGRlZmlu
aXRpb24gYmFjayB0byBpOTE1IGhlYWRlcgo+ID4gPiAgIGRybTogRXh0ZW5kIEk5MTUgbWVpIGlu
dGVyZmFjZSBmb3IgdHJhbnNjb2RlciBpbmZvCj4gPiA+ICAgbWlzYy9tZWkvaGRjcDogRmlsbCB0
cmFuc2NvZGVyIGluZGV4IGluIHBvcnQgaW5mbwo+ID4gPiAgIGRybS9pOTE1L2hkY3A6IHVwZGF0
ZSBjdXJyZW50IHRyYW5zY29kZXIgaW50byBpbnRlbF9oZGNwCj4gPiA+ICAgZHJtL2k5MTUvaGRj
cDogRW5hYmxlIEhEQ1AgMS40IGFuZCAyLjIgb24gR2VuMTIrCj4gPiA+Cj4gPiA+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Jpb3MuaCAgICAgfCAgIDMgKy0KPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5oICB8ICAyMCArLQo+ID4g
PiAgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oICAgIHwgICA3ICsK
PiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyAgICAgICB8ICAg
MyArCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmggICAgICAg
fCAgIDEgKwo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZGNwLmMg
ICAgIHwgMjE0ICsrKysrKysrKysrKystLS0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9oZGNwLmggICAgIHwgICA0ICsKPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jICAgICB8ICAxMyArLQo+ID4gPiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmggICAgIHwgICAxICsKPiA+ID4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaG90cGx1Zy5oICB8ICAgMSArCj4gPiA+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nkdm8uaCAgICAgfCAgIDEgKwo+ID4gPiAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCAgICAgICAgICAgICAgIHwgMTI0ICsrKysr
KysrKy0KPiA+ID4gIGRyaXZlcnMvbWlzYy9tZWkvaGRjcC9tZWlfaGRjcC5jICAgICAgICAgICAg
ICB8ICA0NSArKy0tCj4gPiA+ICBkcml2ZXJzL21pc2MvbWVpL2hkY3AvbWVpX2hkY3AuaCAgICAg
ICAgICAgICAgfCAgMTcgKy0KPiA+ID4gIGluY2x1ZGUvZHJtL2k5MTVfZHJtLmggICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxOCAtLQo+ID4gPiAgaW5jbHVkZS9kcm0vaTkxNV9tZWlfaGRjcF9p
bnRlcmZhY2UuaCAgICAgICAgIHwgIDQyICsrKy0KPiA+ID4gIDE2IGZpbGVzIGNoYW5nZWQsIDM4
OSBpbnNlcnRpb25zKCspLCAxMjUgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IC0tCj4gPiA+IDIu
MjAuMQo+ID4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

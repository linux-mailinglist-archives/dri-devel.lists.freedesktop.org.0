Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174449FCB6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1237589709;
	Wed, 28 Aug 2019 08:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB5E89709;
 Wed, 28 Aug 2019 08:17:57 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 01:17:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; d="scan'208";a="183052340"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by orsmga003.jf.intel.com with ESMTP; 28 Aug 2019 01:17:42 -0700
Date: Wed, 28 Aug 2019 13:47:09 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: Re: [PATCH v11 3/6] drm: Extend I915 mei interface for transcoder info
Message-ID: <20190828081709.GC20745@intel.com>
References: <20190828072823.4832-1-ramalingam.c@intel.com>
 <20190828072823.4832-4-ramalingam.c@intel.com>
 <5B8DA87D05A7694D9FA63FD143655C1B9DCA5EAE@hasmsx108.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5B8DA87D05A7694D9FA63FD143655C1B9DCA5EAE@hasmsx108.ger.corp.intel.com>
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

T24gMjAxOS0wOC0yOCBhdCAxMzoyODowNiArMDUzMCwgV2lua2xlciwgVG9tYXMgd3JvdGU6Cj4g
PiBJOTE1IG5lZWRzIHRvIHNlbmQgdGhlIGluZGV4IG9mIHRoZSB0cmFuc2NvZGVyIGFzIHBlciBN
RSBGVy4KPiA+IAo+ID4gVG8gc3VwcG9ydCB0aGlzLCBkZWZpbmUgZW51bSBtZWlfZndfdGMgYW5k
IGFkZCBhcyBhIG1lbWJlciBpbnRvIHRoZSBzdHJ1Y3QKPiA+IGhkY3BfcG9ydF9kYXRhLgo+ID4g
Cj4gPiB2MjoKPiA+ICAgVHlwbyBpbiBjb21taXQgbXNnIGlzIGZpeGVkIFtTaGFzaGFua10KPiA+
IHYzOgo+ID4gICBrZG9jIGlzIGFkZGVkIGZvciBtZWlfZndfdGMgW1RvbWFzXQo+ID4gICBzL01F
SV9UQ194L01FSV9UUkFOU0NPREVSX3gKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUmFtYWxpbmdh
bSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPgo+ID4gQWNrZWQtYnk6IEphbmkgTmlrdWxhIDxq
YW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4gCj4gTEdUTSwganVzdCBuZWVkIHRvIHVwZGF0ZWQgdGhl
IGNvcHlyaWdodCB5ZWFyLgpUb21hcywKCkNvcHlyaWdodCB5ZWFyIGZvciB0aGlzIGk5MTVfbWVp
X2hkY3BfaW50ZXJmYWNlLmggaXMgdXBkYXRlZCBpbiB0aGUgMXN0IHBhdGNoIGl0c2VsZi4KCi1S
YW0KPiAKPiA+IC0tLQo+ID4gIGluY2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmgg
fCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5z
ZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vaTkxNV9tZWlfaGRj
cF9pbnRlcmZhY2UuaAo+ID4gYi9pbmNsdWRlL2RybS9pOTE1X21laV9oZGNwX2ludGVyZmFjZS5o
Cj4gPiBpbmRleCAwODY3MGFhNjUwZDQuLjRkNDhkZTg4OTBjYSAxMDA2NDQKPiA+IC0tLSBhL2lu
Y2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmgKPiA+ICsrKyBiL2luY2x1ZGUvZHJt
L2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmgKPiA+IEBAIC01NCw5ICs1NCwzMiBAQCBlbnVtIG1l
aV9md19kZGkgewo+ID4gIAlNRUlfRERJX1JBTkdFX0VORCA9IE1FSV9ERElfQSwKPiA+ICB9Owo+
ID4gCj4gPiArLyoqCj4gPiArICogZW51bSBtZWlfZndfdGMgLSBNRSBGaXJtd2FyZSBkZWZpbmVk
IGluZGV4IGZvciB0cmFuc2NvZGVycwo+ID4gKyAqIEBNRUlfSU5WQUxJRF9UUkFOU0NPREVSOiBJ
bmRleCBmb3IgSW52YWxpZCB0cmFuc2NvZGVyCj4gPiArICogQE1FSV9UUkFOU0NPREVSX0VEUDog
SW5kZXggZm9yIEVEUCBUcmFuc2NvZGVyCj4gPiArICogQE1FSV9UUkFOU0NPREVSX0RTSTA6IElu
ZGV4IGZvciBEU0kwIFRyYW5zY29kZXIKPiA+ICsgKiBATUVJX1RSQU5TQ09ERVJfRFNJMTogSW5k
ZXggZm9yIERTSTEgVHJhbnNjb2Rlcgo+ID4gKyAqIEBNRUlfVFJBTlNDT0RFUl9BOiBJbmRleCBm
b3IgVHJhbnNjb2RlciBBCj4gPiArICogQE1FSV9UUkFOU0NPREVSX0I6IEluZGV4IGZvciBUcmFu
c2NvZGVyIEIKPiA+ICsgKiBATUVJX1RSQU5TQ09ERVJfQzogSW5kZXggZm9yIFRyYW5zY29kZXIg
Qwo+ID4gKyAqIEBNRUlfVFJBTlNDT0RFUl9EOiBJbmRleCBmb3IgVHJhbnNjb2RlciBEICAqLyBl
bnVtIG1laV9md190YyB7Cj4gPiArCU1FSV9JTlZBTElEX1RSQU5TQ09ERVIgPSAweDAwLAo+ID4g
KwlNRUlfVFJBTlNDT0RFUl9FRFAsCj4gPiArCU1FSV9UUkFOU0NPREVSX0RTSTAsCj4gPiArCU1F
SV9UUkFOU0NPREVSX0RTSTEsCj4gPiArCU1FSV9UUkFOU0NPREVSX0EgPSAweDEwLAo+ID4gKwlN
RUlfVFJBTlNDT0RFUl9CLAo+ID4gKwlNRUlfVFJBTlNDT0RFUl9DLAo+ID4gKwlNRUlfVFJBTlND
T0RFUl9ECj4gPiArfTsKPiA+ICsKPiA+ICAvKioKPiA+ICAgKiBzdHJ1Y3QgaGRjcF9wb3J0X2Rh
dGEgLSBpbnRlbCBzcGVjaWZpYyBIRENQIHBvcnQgZGF0YQo+ID4gICAqIEBmd19kZGk6IGRkaSBp
bmRleCBhcyBwZXIgTUUgRlcKPiA+ICsgKiBAZndfdGM6IHRyYW5zY29kZXIgaW5kZXggYXMgcGVy
IE1FIEZXCj4gPiAgICogQHBvcnRfdHlwZTogSERDUCBwb3J0IHR5cGUgYXMgcGVyIE1FIEZXIGNs
YXNzaWZpY2F0aW9uCj4gPiAgICogQHByb3RvY29sOiBIRENQIGFkYXB0YXRpb24gYXMgcGVyIE1F
IEZXCj4gPiAgICogQGs6IE5vIG9mIHN0cmVhbXMgdHJhbnNtaXR0ZWQgb24gYSBwb3J0LiBPbmx5
IG9uIERQIE1TVCB0aGlzIGlzICE9IDEgQEAgLQo+ID4gNjksNiArOTIsNyBAQCBlbnVtIG1laV9m
d19kZGkgewo+ID4gICAqLwo+ID4gIHN0cnVjdCBoZGNwX3BvcnRfZGF0YSB7Cj4gPiAgCWVudW0g
bWVpX2Z3X2RkaSBmd19kZGk7Cj4gPiArCWVudW0gbWVpX2Z3X3RjIGZ3X3RjOwo+ID4gIAl1OCBw
b3J0X3R5cGU7Cj4gPiAgCXU4IHByb3RvY29sOwo+ID4gIAl1MTYgazsKPiA+IC0tCj4gPiAyLjIw
LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

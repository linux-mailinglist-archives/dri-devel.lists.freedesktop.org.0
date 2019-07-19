Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A6B6E24D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 10:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDA46E5BC;
	Fri, 19 Jul 2019 08:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494766E5BC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 08:13:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 01:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,281,1559545200"; d="scan'208";a="173438724"
Received: from mchmiel-mobl.ger.corp.intel.com (HELO [10.252.50.54])
 ([10.252.50.54])
 by orsmga006.jf.intel.com with ESMTP; 19 Jul 2019 01:13:04 -0700
Subject: Re: [PATCH] drm/syncobj: return meaningful value to user space
To: Chunming Zhou <zhoucm1@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20190718111339.25126-1-david1.zhou@amd.com>
 <3bef64d0-97be-6aed-aa10-7a4592e7fb54@intel.com>
 <d7085a57-b9fc-c5d8-bea2-10cabb80f0f8@amd.com>
 <36d29516-42e7-6ce5-88fc-a005ed4432d6@intel.com>
 <30bdbec2-4ae1-943b-86a2-2424655fedf5@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <67cece6c-8629-9870-79d2-6e276e6fc08e@intel.com>
Date: Fri, 19 Jul 2019 11:13:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <30bdbec2-4ae1-943b-86a2-2424655fedf5@amd.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTgvMDcvMjAxOSAxNzozMywgQ2h1bm1pbmcgWmhvdSB3cm90ZToKPiDlnKggMjAxOS83LzE4
IDIyOjA4LCBMaW9uZWwgTGFuZHdlcmxpbiDlhpnpgZM6Cj4+IE9uIDE4LzA3LzIwMTkgMTY6MDIs
IENodW5taW5nIFpob3Ugd3JvdGU6Cj4+PiDlnKggMjAxOS83LzE4IDE5OjMxLCBMaW9uZWwgTGFu
ZHdlcmxpbiDlhpnpgZM6Cj4+Pj4gT24gMTgvMDcvMjAxOSAxNDoxMywgQ2h1bm1pbmcgWmhvdSB3
cm90ZToKPj4+Pj4gaWYgV0FJVF9GT1JfU1VCTUlUIGlzbid0IHNldCBhbmQgaW4gdGhlIG1lYW53
aGlsZSBubyB1bmRlcmx5aW5nIGZlbmNlCj4+Pj4+IG9uIHN5bmNvYmosCj4+Pj4+IHRoZW4gcmV0
dXJuIG5vbi1ibG9jayBlcnJvciBjb2RlIHRvIHVzZXIgc2FwY2UuCj4+Pj4+Cj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5jb20+Cj4+Pj4+IC0tLQo+
Pj4+PiAgwqDCoCBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyB8IDQgKystLQo+Pj4+PiAg
wqDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+
Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPj4+Pj4g
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+Pj4+PiBpbmRleCAzNjFhMDFhMDhjMTgu
LjkyOWY3YzY0ZjlhMiAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5j
b2JqLmMKPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPj4+Pj4gQEAg
LTI1Miw3ICsyNTIsNyBAQCBpbnQgZHJtX3N5bmNvYmpfZmluZF9mZW5jZShzdHJ1Y3QgZHJtX2Zp
bGUKPj4+Pj4gKmZpbGVfcHJpdmF0ZSwKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIDA7Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KCpm
ZW5jZSk7Cj4+Pj4+ICDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKg
IHJldCA9IC1FSU5WQUw7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSAtRU5PVEJMSzsKPj4+
Pj4gIMKgwqDCoMKgwqDCoCB9Cj4+Pj4+ICDCoMKgIMKgwqDCoMKgwqAgaWYgKCEoZmxhZ3MgJiBE
Uk1fU1lOQ09CSl9XQUlUX0ZMQUdTX1dBSVRfRk9SX1NVQk1JVCkpCj4+Pj4+IEBAIC04MzIsNyAr
ODMyLDcgQEAgc3RhdGljIHNpZ25lZCBsb25nCj4+Pj4+IGRybV9zeW5jb2JqX2FycmF5X3dhaXRf
dGltZW91dChzdHJ1Y3QgZHJtX3N5bmNvYmogKipzeW5jb2JqcywKPj4+Pj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgKGZsYWdzICYgRFJNX1NZTkNPQkpfV0FJVF9GTEFHU19XQUlU
X0ZPUl9TVUJNSVQpIHsKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb250aW51ZTsKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsK
Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aW1lb3V0ID0gLUVJTlZBTDsK
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aW1lb3V0ID0gLUVOT1RCTEs7
Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBjbGVhbnVw
X2VudHJpZXM7Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+PiBUaGlzIHdvdWxkIGJyZWFrIGV4aXN0aW5nIHRlc3Rz
IGZvciBiaW5hcnkgc3luY29ianMuCj4+PiBIb3cgZG9lcyB0aGlzIGJyZWFrcyBiaW5hcnkgc3lu
Y29iaj8KPj4KPj4gVGhpcyBpcyB1c2VkIGluIHRoZSBzdWJtaXNzaW9uIHBhdGggb2Ygc2V2ZXJh
bCBkcml2ZXJzLgo+Pgo+PiBDaGFuZ2luZyB0aGUgZXJyb3IgY29kZSB3aWxsIGNoYW5nZSB3aGF0
IHRoZSBkcml2ZXJzIGFyZSByZXBvcnRpbmcgdG8KPj4gdXNlcnNwYWNlIGFuZCBjb3VsZCBicmVh
ayB0ZXN0cy4KPj4KPj4KPj4gaTkxNSBkb2Vzbid0IHVzZSB0aGF0IGZ1bmN0aW9uIHNvIGl0J3Mg
bm90IGFmZmVjdGVkIGJ1dAo+PiBsaW1hL3BhbmZyb3N0L3ZjNCBzZWVtIHRvIGJlLgo+Cj4gYW55
b25lIGZyb20gdmM0IGNhbiBjb25maXJtIHRoaXM/IFRoZXJlIGFyZSBtYW55IHBsYWNlIGluIHdh
aXRfaW9jdGwKPiBiZWluZyBhYmxlIHRvIHJldHVybiBwcmV2aW91cyBFSU5WQUwsIG5vdCBzdXJl
IHdoYXQgdGhleSB1c2UgdG8uCj4KPgo+Pgo+Pj4KPj4+PiBJcyB0aGlzIHJlYWxseSB3aGF0IHdl
IHdhbnQ/Cj4+PiBJIHdhbnQgdG8gdXNlIHRoaXMgbWVhbmluZ2Z1bCByZXR1cm4gdmFsdWUgdG8g
anVkZ2UgaWYgV2FpdEJlZm9yZVNpZ25hbAo+Pj4gaGFwcGVucy4KPj4+Cj4+PiBJIHRoaW5rIHRo
aXMgaXMgdGhlIGNoZWFwZXN0IGNoYW5nZSBmb3IgdGhhdC4KPj4KPj4gSSB0aG91Z2h0IHRoZSBw
bGFuIHdhcyB0byBhZGQgYSBuZXcgaW9jdGwgdG8gcXVlcnkgdGhlIGxhc3Qgc3VibWl0dGVkCj4+
IHZhbHVlLgo+IFllcywgdGhhdCBpcyBvcHRpb25hbCB3YXkgdG9vLsKgIEkganVzdCB0aG91Z2h0
IGNoYW5naW5nIHJldHVybiB2YWx1ZSBpcwo+IHZlcnkgY2hlYXAsIGlzbid0IGl0Pwo+Cj4KPiAt
RGF2aWQKCgpJIGNvdWxkIGJlIG1pc2d1aWRlZCBidXQgSSB0aG91Z2h0IHRoZSBrZXJuZWwgcG9s
aWN5IHdhcyB0byBuZXZlciBicmVhayAKdXNlcnNwYWNlLgoKSSdtIG5vdCBzdXJlIHdoZXJlIHRo
aXMgc2l0cyA6LwoKCi1MaW9uZWwKCgo+Cj4+IERpZCBJIG1pc3VuZGVyc3RhbmQ/Cj4+Cj4+Cj4+
IFRoYW5rcywKPj4KPj4KPj4gLUxpb25lbAo+Pgo+Pgo+Pj4gLURhdmlkCj4+Pgo+Pj4KPj4+PiAt
TGlvbmVsCj4+Pj4KPj4+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs

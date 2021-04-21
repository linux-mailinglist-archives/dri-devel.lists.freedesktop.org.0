Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C586366857
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 11:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB726E96C;
	Wed, 21 Apr 2021 09:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541626E96C;
 Wed, 21 Apr 2021 09:48:23 +0000 (UTC)
IronPort-SDR: 8E6/C6MDo5D3qv4+VQGMo2/Ih6jrm2uAi12emWPQZut7cgc5GKD/Herlj7hllnonajie/RpYxE
 EJc93nGSbjOg==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="281000556"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="281000556"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 02:48:22 -0700
IronPort-SDR: ukgF+S5I29bsMzF+UXC+g87NBVfOXMY75AXl7fgbfGQWCa4u0Q/qOdBvQvbVUteqxH24hxT7hm
 64coiHOCftog==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="534832347"
Received: from ddacost1-mobl1.ger.corp.intel.com (HELO [10.252.9.23])
 ([10.252.9.23])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 02:48:21 -0700
Subject: Re: [PATCH 4/5] drm/i915/stolen: pass the allocation flags
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210420131842.164163-1-matthew.auld@intel.com>
 <20210420131842.164163-4-matthew.auld@intel.com>
 <8559c955-3882-aec4-f87c-afbe82052e5b@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <5e105279-a3ae-d79c-8042-321cf5849f35@intel.com>
Date: Wed, 21 Apr 2021 10:48:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8559c955-3882-aec4-f87c-afbe82052e5b@linux.intel.com>
Content-Language: en-GB
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
Cc: CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAvMDQvMjAyMSAxNzoxNCwgVHZydGtvIFVyc3VsaW4gd3JvdGU6Cj4gCj4gT24gMjAvMDQv
MjAyMSAxNDoxOCwgTWF0dGhldyBBdWxkIHdyb3RlOgo+PiBGcm9tOiBDUSBUYW5nIDxjcS50YW5n
QGludGVsLmNvbT4KPj4KPj4gU3RvbGVuIG1lbW9yeSBpcyBhbHdheXMgYWxsb2NhdGVkIGFzIHBo
eXNpY2FsbHkgY29udGlndW91cyBwYWdlcywgbWFyawo+PiB0aGUgb2JqZWN0IGZsYWdzIGFzIHN1
Y2guCj4+Cj4+IHYyOiBtb3ZlIHNldHRpbmcgSTkxNV9CT19BTExPQ19DT05USUdVT1VTIGludG8g
Y3JlYXRlX3N0b2xlbgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDUSBUYW5nIDxjcS50YW5nQGludGVs
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwu
Y29tPgo+PiBDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNv
bT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zdG9sZW4u
YyB8IDE3ICsrKysrKysrKysrKy0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dl
bS9pOTE1X2dlbV9zdG9sZW4uYwo+PiBpbmRleCA0ZjlmZTVhY2EzN2UuLjQ2Zjc5YjI0MGRmNyAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5j
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zdG9sZW4uYwo+PiBA
QCAtNjMzLDE0ICs2MzMsMjEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faTkxNV9nZW1fb2Jq
ZWN0X29wcyAKPj4gaTkxNV9nZW1fb2JqZWN0X3N0b2xlbl9vcHMgPSB7Cj4+IMKgIHN0YXRpYyBp
bnQgX19pOTE1X2dlbV9vYmplY3RfY3JlYXRlX3N0b2xlbihzdHJ1Y3QgCj4+IGludGVsX21lbW9y
eV9yZWdpb24gKm1lbSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmosCj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX21tX25vZGUgKnN0
b2xlbikKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBkcm1fbW1fbm9kZSAqc3RvbGVuLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGZsYWdzKQo+PiDCoCB7Cj4+IMKgwqDCoMKg
wqAgc3RhdGljIHN0cnVjdCBsb2NrX2NsYXNzX2tleSBsb2NrX2NsYXNzOwo+PiDCoMKgwqDCoMKg
IHVuc2lnbmVkIGludCBjYWNoZV9sZXZlbDsKPj4gwqDCoMKgwqDCoCBpbnQgZXJyOwo+PiArwqDC
oMKgIC8qCj4+ICvCoMKgwqDCoCAqIFN0b2xlbiBvYmplY3RzIGFyZSBhbHdheXMgcGh5c2ljYWxs
eSBjb250aWd1b3VzIHNpbmNlIHdlIGp1c3QKPj4gK8KgwqDCoMKgICogYWxsb2NhdGUgb25lIGJp
ZyBibG9jayB1bmRlcm5lYXRoIHVzaW5nIHRoZSBkcm1fbW0gcmFuZ2UgCj4+IGFsbG9jYXRvci4K
Pj4gK8KgwqDCoMKgICovCj4+ICvCoMKgwqAgZmxhZ3MgfD0gSTkxNV9CT19BTExPQ19DT05USUdV
T1VTOwo+PiArCj4+IMKgwqDCoMKgwqAgZHJtX2dlbV9wcml2YXRlX29iamVjdF9pbml0KCZtZW0t
Pmk5MTUtPmRybSwgJm9iai0+YmFzZSwgCj4+IHN0b2xlbi0+c2l6ZSk7Cj4+IC3CoMKgwqAgaTkx
NV9nZW1fb2JqZWN0X2luaXQob2JqLCAmaTkxNV9nZW1fb2JqZWN0X3N0b2xlbl9vcHMsIAo+PiAm
bG9ja19jbGFzcywgMCk7Cj4+ICvCoMKgwqAgaTkxNV9nZW1fb2JqZWN0X2luaXQob2JqLCAmaTkx
NV9nZW1fb2JqZWN0X3N0b2xlbl9vcHMsIAo+PiAmbG9ja19jbGFzcywgZmxhZ3MpOwo+PiDCoMKg
wqDCoMKgIG9iai0+c3RvbGVuID0gc3RvbGVuOwo+PiDCoMKgwqDCoMKgIG9iai0+cmVhZF9kb21h
aW5zID0gSTkxNV9HRU1fRE9NQUlOX0NQVSB8IEk5MTVfR0VNX0RPTUFJTl9HVFQ7Cj4+IEBAIC02
ODIsNyArNjg5LDcgQEAgc3RhdGljIGludCBfaTkxNV9nZW1fb2JqZWN0X3N0b2xlbl9pbml0KHN0
cnVjdCAKPj4gaW50ZWxfbWVtb3J5X3JlZ2lvbiAqbWVtLAo+PiDCoMKgwqDCoMKgIGlmIChyZXQp
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9mcmVlOwo+PiAtwqDCoMKgIHJldCA9IF9f
aTkxNV9nZW1fb2JqZWN0X2NyZWF0ZV9zdG9sZW4obWVtLCBvYmosIHN0b2xlbik7Cj4+ICvCoMKg
wqAgcmV0ID0gX19pOTE1X2dlbV9vYmplY3RfY3JlYXRlX3N0b2xlbihtZW0sIG9iaiwgc3RvbGVu
LCBmbGFncyk7Cj4gCj4gSG0gb2RkIHRoYXQgcHJldmlvdXNseSB0aGUgZmxhZ3Mgd2VyZSBpZ25v
cmVkIGluIGhlcmUuIEkgZ3Vlc3Mgbm8gCj4gY2FsbGVycyB3ZXJlIHBhc3NpbmcgYW55IHdoZW4g
Y3JlYXRpbmcgc3RvbGVuIG9iamVjdHMuIElmIG5vbmUgYXJlIAo+IHN1cHBvcnRlZCBzaG91bGQg
d2UgYWRkIGEgR0VNX0JVR19PTiB0byBjaGVjayBmb3IgdGhhdD8KCkkgdGhpbmsgdGhpcyBpdCdz
IGlzIHN0aWxsIHJlYWNoYWJsZSBmb3IgdmlhIG9iamVjdF9jcmVhdGVfcmVnaW9uKCksIGJ1dCAK
eWVhaCBtYXliZSBqdXN0IGxlYXZlIGZvciBsYXRlciwgaWYgd2UgZG8gcmVhbGx5IG5lZWQgaXQu
Cgo+IAo+IFJlZ2FyZHMsCj4gCj4gVHZydGtvCj4gCj4+IMKgwqDCoMKgwqAgaWYgKHJldCkKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX3JlbW92ZTsKPj4gQEAgLTcwMCw3ICs3MDcsNyBA
QCBpOTE1X2dlbV9vYmplY3RfY3JlYXRlX3N0b2xlbihzdHJ1Y3QgCj4+IGRybV9pOTE1X3ByaXZh
dGUgKmk5MTUsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc291
cmNlX3NpemVfdCBzaXplKQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgcmV0dXJuIGk5MTVfZ2VtX29i
amVjdF9jcmVhdGVfcmVnaW9uKGk5MTUtPm1tLnN0b2xlbl9yZWdpb24sCj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZSwgSTkxNV9CT19BTExP
Q19DT05USUdVT1VTKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzaXplLCAwKTsKPj4gwqAgfQo+PiDCoCBzdGF0aWMgaW50IGluaXRfc3RvbGVu
X3NtZW0oc3RydWN0IGludGVsX21lbW9yeV9yZWdpb24gKm1lbSkKPj4gQEAgLTg2Niw3ICs4NzMs
NyBAQCAKPj4gaTkxNV9nZW1fb2JqZWN0X2NyZWF0ZV9zdG9sZW5fZm9yX3ByZWFsbG9jYXRlZChz
dHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAKPj4gKmk5MTUsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIGVycl9zdG9sZW47Cj4+IMKgwqDCoMKgwqAgfQo+PiAtwqDCoMKgIHJldCA9IF9faTkxNV9n
ZW1fb2JqZWN0X2NyZWF0ZV9zdG9sZW4obWVtLCBvYmosIHN0b2xlbik7Cj4+ICvCoMKgwqAgcmV0
ID0gX19pOTE1X2dlbV9vYmplY3RfY3JlYXRlX3N0b2xlbihtZW0sIG9iaiwgc3RvbGVuLCAwKTsK
Pj4gwqDCoMKgwqDCoCBpZiAocmV0KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfb2Jq
ZWN0X2ZyZWU7Cj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=

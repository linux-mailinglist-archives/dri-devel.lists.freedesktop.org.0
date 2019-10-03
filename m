Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A06C99E4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 10:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045D489580;
	Thu,  3 Oct 2019 08:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5539B89452;
 Thu,  3 Oct 2019 08:29:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 01:29:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,251,1566889200"; d="scan'208";a="216733992"
Received: from sharmash-mobl3.gar.corp.intel.com (HELO [10.66.119.82])
 ([10.66.119.82])
 by fmsmga004.fm.intel.com with ESMTP; 03 Oct 2019 01:29:43 -0700
Subject: Re: [PATCH v3 3/4] drm/edid: Throw away the dummy VIC 0 cea mode
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20190925135502.24055-1-ville.syrjala@linux.intel.com>
 <20190925135502.24055-4-ville.syrjala@linux.intel.com>
From: "Sharma, Shashank" <shashank.sharma@intel.com>
Message-ID: <3cad3f33-e402-1e44-6221-9de6a8324f3e@intel.com>
Date: Thu, 3 Oct 2019 13:59:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190925135502.24055-4-ville.syrjala@linux.intel.com>
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
Cc: Hans Verkuil <hansverk@cisco.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvMjUvMjAxOSA3OjI1IFBNLCBWaWxsZSBTeXJqYWxhIHdyb3RlOgo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4KPiBOb3cgdGhhdCB0
aGUgY2VhIG1vZGUgaGFuZGxpbmcgaXMgbm90IDEwMCUgdGllZCB0byB0aGUgc2luZ2xlCj4gYXJy
YXkgdGhlIGR1bW15IFZJQyAwIG1vZGUgaXMgcHJldHR5IG11Y2ggcG9pbnRsZXMuIFRocm93IGl0
Cj4gb3V0Lgo+Cj4gQ2M6IEhhbnMgVmVya3VpbCA8aGFuc3ZlcmtAY2lzY28uY29tPgo+IENjOiBT
aGFzaGFuayBTaGFybWEgPHNoYXNoYW5rLnNoYXJtYUBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAtLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgMTQgKysrKystLS0tLS0tLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYwo+IGluZGV4IDlmNjk5NjMyM2VmYS4uMDAwNzAwNGQzMjIxIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlk
LmMKPiBAQCAtNzA5LDExICs3MDksOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1pbmltb2RlIGV4
dHJhX21vZGVzW10gPSB7Cj4gICAvKgo+ICAgICogRnJvbSBDRUEvQ1RBLTg2MSBzcGVjLgo+ICAg
ICoKPiAtICogSW5kZXggd2l0aCBWSUMuCj4gKyAqIEluZGV4IHdpdGggVklDLTEuCgpEbyB3ZSB3
YW50IHRvIHJlYWxseSBkbyB0aGlzID8gVGlsbCBub3csIGR1ZSB0byBkdW1teSBWSUMsIGluZGV4
aW5nIHdhcyAKcHJldHR5IGRpcmVjdCBhcyBwZXIgVklDLCB3aGljaCB3YXMgbWFraW5nIHRoZSBj
b2RlIGVhc3kgdG8gcmVhZCBhbmQgCnVuZGVyc3RhbmQuIEkgd291bGQgc3RpbGwgdGhpbmsgdGhh
dCBrZWVwaW5nIHRoZSBkdW1teSBWSUMgYW5kIGFkanVzdGluZyAKdGhlIHNpemUgb2YgY2VhX21v
ZGVzXzBbXSBpbiB0aGUgc2l6ZSBmdW5jdGlvbiwgd291bGQgYmUgc29tZXRoaW5nIApuZWF0ZXIg
dG8gZG8sIGRvIHlvdSB0aGluayBzbyA/CgotIFNoYXNoYW5rCgo+ICAgICovCj4gLXN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBlZGlkX2NlYV9tb2Rlc18wW10gPSB7Cj4gLQkv
KiAwIC0gZHVtbXksIFZJQ3Mgc3RhcnQgYXQgMSAqLwo+IC0JeyB9LAo+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgZWRpZF9jZWFfbW9kZXNfMVtdID0gewo+ICAgCS8qIDEg
LSA2NDB4NDgwQDYwSHogNDozICovCj4gICAJeyBEUk1fTU9ERSgiNjQweDQ4MCIsIERSTV9NT0RF
X1RZUEVfRFJJVkVSLCAyNTE3NSwgNjQwLCA2NTYsCj4gICAJCSAgIDc1MiwgODAwLCAwLCA0ODAs
IDQ5MCwgNDkyLCA1MjUsIDAsCj4gQEAgLTMyMTEsMTAgKzMyMDksOCBAQCBzdGF0aWMgdTggKmRy
bV9maW5kX2NlYV9leHRlbnNpb24oY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQpCj4gICAKPiAgIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqY2VhX21vZGVfZm9yX3ZpYyh1OCB2
aWMpCj4gICB7Cj4gLQlpZiAoIXZpYykKPiAtCQlyZXR1cm4gTlVMTDsKPiAtCWlmICh2aWMgPCBB
UlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzApKQo+IC0JCXJldHVybiAmZWRpZF9jZWFfbW9kZXNf
MFt2aWNdOwo+ICsJaWYgKHZpYyA+PSAxICYmIHZpYyA8IDEgKyBBUlJBWV9TSVpFKGVkaWRfY2Vh
X21vZGVzXzEpKQo+ICsJCXJldHVybiAmZWRpZF9jZWFfbW9kZXNfMVt2aWMgLSAxXTsKPiAgIAlp
ZiAodmljID49IDE5MyAmJiB2aWMgPCAxOTMgKyBBUlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzE5
MykpCj4gICAJCXJldHVybiAmZWRpZF9jZWFfbW9kZXNfMTkzW3ZpYyAtIDE5M107Cj4gICAJcmV0
dXJuIE5VTEw7Cj4gQEAgLTMyMjcsNyArMzIyMyw3IEBAIHN0YXRpYyB1OCBjZWFfbnVtX3ZpY3Mo
dm9pZCkKPiAgIAo+ICAgc3RhdGljIHU4IGNlYV9uZXh0X3ZpYyh1OCB2aWMpCj4gICB7Cj4gLQlp
ZiAoKyt2aWMgPT0gQVJSQVlfU0laRShlZGlkX2NlYV9tb2Rlc18wKSkKPiArCWlmICgrK3ZpYyA9
PSAxICsgQVJSQVlfU0laRShlZGlkX2NlYV9tb2Rlc18xKSkKPiAgIAkJdmljID0gMTkzOwo+ICAg
CXJldHVybiB2aWM7Cj4gICB9Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==

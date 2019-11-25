Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B40A109535
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 22:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D59A89DBF;
	Mon, 25 Nov 2019 21:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9746C89F8E;
 Mon, 25 Nov 2019 21:40:27 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Nov 2019 13:40:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,242,1571727600"; d="scan'208";a="220417285"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga002.jf.intel.com with ESMTP; 25 Nov 2019 13:40:26 -0800
Date: Mon, 25 Nov 2019 13:29:02 -0800
From: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Message-ID: <20191125212902.GI14488@nvishwa1-DESK.sc.intel.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-7-niranjana.vishwanathapura@intel.com>
 <20191122233308.GA7481@mellanox.com>
 <20191125163327.GA5516@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125163327.GA5516@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
 "sanjay.k.kumar@intel.com" <sanjay.k.kumar@intel.com>,
 "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMTE6MzM6MjdBTSAtMDUwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPk9uIEZyaSwgTm92IDIyLCAyMDE5IGF0IDExOjMzOjEyUE0gKzAwMDAsIEphc29uIEd1
bnRob3JwZSB3cm90ZToKPj4gT24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTI6NTc6MjdQTSAtMDgw
MCwgTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYSB3cm90ZToKPgo+Wy4uLl0KPgo+PiA+ICtzdGF0
aWMgaW50Cj4+ID4gK2k5MTVfcmFuZ2VfZmF1bHQoc3RydWN0IGk5MTVfc3ZtICpzdm0sIHN0cnVj
dCBobW1fcmFuZ2UgKnJhbmdlKQo+PiA+ICt7Cj4+ID4gKwlsb25nIHJldDsKPj4gPiArCj4+ID4g
KwlyYW5nZS0+ZGVmYXVsdF9mbGFncyA9IDA7Cj4+ID4gKwlyYW5nZS0+cGZuX2ZsYWdzX21hc2sg
PSAtMVVMOwo+PiA+ICsKPj4gPiArCXJldCA9IGhtbV9yYW5nZV9yZWdpc3RlcihyYW5nZSwgJnN2
bS0+bWlycm9yKTsKPj4gPiArCWlmIChyZXQpIHsKPj4gPiArCQl1cF9yZWFkKCZzdm0tPm1tLT5t
bWFwX3NlbSk7Cj4+ID4gKwkJcmV0dXJuIChpbnQpcmV0Owo+PiA+ICsJfQo+Pgo+Pgo+PiBVc2lu
ZyBhIHRlbXBvcmFyeSByYW5nZSBpcyB0aGUgcGF0dGVybiBmcm9tIG5vdXZlYXUsIGlzIGl0IHJl
YWxseQo+PiBuZWNlc3NhcnkgaW4gdGhpcyBkcml2ZXI/Cj4KPkp1c3QgdG8gY29tbWVudCBvbiB0
aGlzLCBmb3IgR1BVIHRoZSB1c2FnZSBtb2RlbCBpcyBub3QgYXBwbGljYXRpb24KPnJlZ2lzdGVy
IHJhbmdlIG9mIHZpcnR1YWwgYWRkcmVzcyBpdCB3YW50cyB0byB1c2UuIEl0IGlzIEdQVSBjYW4K
PmFjY2VzcyBfYW55XyBDUFUgdmFsaWQgYWRkcmVzcyBqdXN0IGxpa2UgdGhlIENQVSB3b3VsZCAo
bW9kdWxvIG1tYXAKPm9mIGRldmljZSBmaWxlKS4KPgo+VGhpcyBpcyBiZWNhdXNlIHRoZSBBUEkg
eW91IHdhbnQgaW4gdXNlcnNwYWNlIGlzIGFwcGxpY2F0aW9uIHBhc3NpbmcKPnJhbmRvbSBwb2lu
dGVyIHRvIHRoZSBHUFUgYW5kIEdQVSBiZWluZyBhYmxlIHRvIGNoYXNlIGRvd24gYW55IGtpbmQK
Pm9mIHJhbmRvbSBwb2ludGVyIGNoYWluIChhc3N1bWluZyBhbGwgdmFsaWQgaWUgcG9pbnRpbmcg
dG8gdmFsaWQKPnZpcnR1YWwgYWRkcmVzcyBmb3IgdGhlIHByb2Nlc3MpLgo+Cj5UaGlzIGlzIHVu
bGlrZSB0aGUgUkRNQSBjYXNlLgo+Cj4KPlRoYXQgYmVpbmcgc2FpZCwgZm9yIGJlc3QgcGVyZm9y
bWFuY2Ugd2Ugc3RpbGwgZXhwZWN0IHdlbGwgYmVoYXZpbmcKPmFwcGxpY2F0aW9uIHRvIHByb3Zp
ZGUgaGludCB0byBrZXJuZWwgc28gdGhhdCB3ZSBrbm93IGlmIGEgcmFuZ2Ugb2YKPnZpcnR1YWwg
YWRkcmVzcyBpcyBsaWtlbHkgdG8gYmUgdXNlIGJ5IHRoZSBHUFUgb3Igbm90LiBCdXQgdGhpcyBp
cwo+bm90LCBhbmQgc2hvdWxkIG5vdCBiZSBhIHJlcXVpcmVtZW50Lgo+Cj4KPkkgcG9zdGVkIHBh
dGNoc2V0IGFuZCBnaXZlbiB0YWxrcyBhYm91dCB0aGlzLCBidXQgbG9uZyB0ZXJtIGkgYmVsaWV2
ZQo+d2Ugd2FudCBhIGNvbW1vbiBBUEkgdG8gbWFuYWdlIGhpbnQgcHJvdmlkZWQgYnkgdXNlcnNw
YWNlIChzZWUgbXkKPnRhbGsgYXQgTFBDIHRoaXMgeWVhciBhYm91dCBuZXcgc3lzY2FsbCB0byBi
aW5kIG1lbW9yeSB0byBkZXZpY2UpLgo+V2l0aCBzdWNoIHRoaW5nIGluIHBsYWNlIHdlIGNvdWxk
IGhhbmcgbW11IG5vdGlmaWVyIHJhbmdlIHRvIGl0LiBCdXQKPnRoZSBkcml2ZXIgd2lsbCBzdGls
bCBuZWVkIHRvIGJlIGFibGUgdG8gaGFuZGxlIHRoZSBjYXNlIHdoZXJlIHRoZXJlCj5pcyBubyBo
aW50IHByb3ZpZGVkIGJ5IHVzZXJzcGFjZSBhbmQgdGh1cyBubyBiZWZvcmUga25vd2xlZGdlIG9m
IHdoYXQKPlZBIG1pZ2h0IGJlIGFjY2Vzc2VkLgo+CgpUaGFua3MgSmVyb21lIGZvciB0aGUgZXhw
bGFuYXRpb24uIFdpbGwgY2hlY2tvdXQgeW91ciBMUEMgdGFsay4KWWVzIEkgYWdyZWUuIFdoZW4g
R1BVIGZhdWx0aW5nIHN1cHBvcnQgaXMgYXZhaWxhYmxlLCBkcml2ZXIgd2lsbCBoYW5kbGUgdGhl
IGZhdWx0LAptaWdyYXRlIHBhZ2UgaWYgbmVlZGVkIGFuZCBiaW5kIHRoZSBwYWdlIHVzaW5nIEhN
TS4KVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBwcmVmZXRjaCBhbmQgYmluZCBo
aW50cyAodmlhIGV4cGxpY2l0IGlvY3RscykuCkFsc28sIHBhdGNoIDEyIG9mIHRoZSBzZXJpZXMg
cHJvdmlkZXMgdGhlIGFiaWxpdHkgdG8gZW5hYmxlL2Rpc2FibGUgU1ZNIG9uIGEgcGVyClZNIGJh
c2lzIGZvciB1c2VyLCBhbmQgYnkgZGVmYXVsdCBTVk0gaXMgZGlzYWJsZWQuCgpOaXJhbmphbmEK
Cj5DaGVlcnMsCj5Kw6lyw7RtZQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB072109211
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 17:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40D089E38;
	Mon, 25 Nov 2019 16:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB2D89E38;
 Mon, 25 Nov 2019 16:44:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Nov 2019 08:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,242,1571727600"; d="scan'208";a="211080147"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga003.jf.intel.com with ESMTP; 25 Nov 2019 08:44:21 -0800
Date: Mon, 25 Nov 2019 08:32:58 -0800
From: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Message-ID: <20191125163256.GG14488@nvishwa1-DESK.sc.intel.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-7-niranjana.vishwanathapura@intel.com>
 <20191122233308.GA7481@mellanox.com>
 <20191123044417.GE14488@nvishwa1-DESK.sc.intel.com>
 <20191123235348.GD7481@mellanox.com>
 <20191124211247.GF14488@nvishwa1-DESK.sc.intel.com>
 <20191125132414.GQ7481@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125132414.GQ7481@mellanox.com>
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
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDE6MjQ6MThQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+T24gU3VuLCBOb3YgMjQsIDIwMTkgYXQgMDE6MTI6NDdQTSAtMDgwMCwgTmlyYW5q
YW4gVmlzaHdhbmF0aGFwdXJhIHdyb3RlOgo+Cj4+ID4gPiA+IFVzaW5nIGEgdGVtcG9yYXJ5IHJh
bmdlIGlzIHRoZSBwYXR0ZXJuIGZyb20gbm91dmVhdSwgaXMgaXQgcmVhbGx5Cj4+ID4gPiA+IG5l
Y2Vzc2FyeSBpbiB0aGlzIGRyaXZlcj8KPj4gPiA+Cj4+ID4gPiBZYWgsIG5vdCByZXF1aXJlZC4g
SW4gbXkgbG9jYWwgYnVpbGQgSSB0cmllZCB3aXRoIHByb3BlciBkZWZhdWx0X2ZsYWdzCj4+ID4g
PiBhbmQgc2V0IHBmbl9mbGFnc19tYXNrIHRvIDAgYW5kIGl0IGlzIHdvcmtpbmcgZmluZS4KPj4g
Pgo+PiA+IFNvcnJ5LCBJIG1lbnQgY2FsbGluZyBobW1fcmFuZ2VfcmVnaXN0ZXIgZHVyaW5nIGZh
dWx0IHByb2Nlc3NpbmcuCj4+ID4KPj4gPiBJZiB5b3VyIGRyaXZlciB3b3JrcyBhcm91bmQgdXNl
ciBzcGFjZSBvYmplY3RzIHRoYXQgY292ZXIgYSBWQSB0aGVuCj4+ID4gdGhlIHJhbmdlIHNob3Vs
ZCBiZSBjcmVhdGVkIHdoZW4gdGhlIG9iamVjdCBpcyBjcmVhdGVkLgo+PiA+Cj4+Cj4+IE9oIG9r
LiBObywgdGhlcmUgaXMgbm8gdXNlciBzcGFjZSBvYmplY3QgaGVyZS4KPj4gQmluZGluZyB0aGUg
dXNlciBzcGFjZSBvYmplY3QgdG8gZGV2aWNlIHBhZ2UgdGFibGUgaXMgaGFuZGxlZCBpbgo+PiBw
YXRjaCAwMyBvZiB0aGlzIHNlcmllcyAobm8gSE1NIHRoZXJlKS4KPj4gVGhpcyBpcyBmb3IgYmlu
ZGluZyBhIHN5c3RlbSBhbGxvY2F0ZWQgKG1hbGxvYykgbWVtb3J5LiBVc2VyIGNhbGxzCj4+IHRo
ZSBiaW5kIGlvY3RsIHdpdGggdGhlIFZBIHJhbmdlLgo+Pgo+PiA+ID4gPiA+ICsJLyoKPj4gPiA+
ID4gPiArCSAqIE5vIG5lZWRkIHRvIGRtYSBtYXAgdGhlIGhvc3QgcGFnZXMgYW5kIGxhdGVyIHVu
bWFwIGl0LCBhcwo+PiA+ID4gPiA+ICsJICogR1BVIGlzIG5vdCBhbGxvd2VkIHRvIGFjY2VzcyBp
dCB3aXRoIFNWTS4gSGVuY2UsIG5vIG5lZWQKPj4gPiA+ID4gPiArCSAqIG9mIGFueSBpbnRlcm1l
ZGlhdGUgZGF0YSBzdHJ1Y3V0cmUgdG8gaG9sZCB0aGUgbWFwcGluZ3MuCj4+ID4gPiA+ID4gKwkg
Ki8KPj4gPiA+ID4gPiArCWZvciAoaSA9IDA7IGkgPCBucGFnZXM7IGkrKykgewo+PiA+ID4gPiA+
ICsJCXU2NCBhZGRyID0gcmFuZ2UtPnBmbnNbaV0gJiB+KCgxVUwgPDwgcmFuZ2UtPnBmbl9zaGlm
dCkgLSAxKTsKPj4gPiA+ID4gPiArCj4+ID4gPiA+ID4gKwkJaWYgKHNnICYmIChhZGRyID09IChz
Z19kbWFfYWRkcmVzcyhzZykgKyBzZy0+bGVuZ3RoKSkpIHsKPj4gPiA+ID4gPiArCQkJc2ctPmxl
bmd0aCArPSBQQUdFX1NJWkU7Cj4+ID4gPiA+ID4gKwkJCXNnX2RtYV9sZW4oc2cpICs9IFBBR0Vf
U0laRTsKPj4gPiA+ID4gPiArCQkJY29udGludWU7Cj4+ID4gPiA+ID4gKwkJfQo+PiA+ID4gPiA+
ICsKPj4gPiA+ID4gPiArCQlpZiAoc2cpCj4+ID4gPiA+ID4gKwkJCXNnX3BhZ2Vfc2l6ZXMgfD0g
c2ctPmxlbmd0aDsKPj4gPiA+ID4gPiArCj4+ID4gPiA+ID4gKwkJc2cgPSAgc2cgPyBfX3NnX25l
eHQoc2cpIDogc3QtPnNnbDsKPj4gPiA+ID4gPiArCQlzZ19kbWFfYWRkcmVzcyhzZykgPSBhZGRy
Owo+PiA+ID4gPiA+ICsJCXNnX2RtYV9sZW4oc2cpID0gUEFHRV9TSVpFOwo+PiA+ID4gPiA+ICsJ
CXNnLT5sZW5ndGggPSBQQUdFX1NJWkU7Cj4+ID4gPiA+ID4gKwkJc3QtPm5lbnRzKys7Cj4+ID4g
PiA+Cj4+ID4gPiA+IEl0IGlzIG9kZCB0byBidWlsZCB0aGUgcmFuZ2UgaW50byBhIHNnbC4KPj4g
PiA+ID4KPj4gPiA+ID4gSU1ITyBpdCBpcyBub3QgYSBnb29kIGlkZWEgdG8gdXNlIHRoZSBzZ19k
bWFfYWRkcmVzcyBsaWtlIHRoaXMsIHRoYXQKPj4gPiA+ID4gc2hvdWxkIG9ubHkgYmUgZmlsbGVk
IGluIGJ5IGEgZG1hIG1hcC4gV2hlcmUgZG9lcyBpdCBlbmQgdXAgYmVpbmcKPj4gPiA+ID4gdXNl
ZD8KPj4gPiA+Cj4+ID4gPiBUaGUgc2dsIGlzIHVzZWQgdG8gcGx1ZyBpbnRvIHRoZSBwYWdlIHRh
YmxlIHVwZGF0ZSBmdW5jdGlvbiBpbiBpOTE1Lgo+PiA+ID4KPj4gPiA+IEZvciB0aGUgZGV2aWNl
IG1lbW9yeSBpbiBkaXNjcmV0ZSBjYXJkLCB3ZSBkb24ndCBuZWVkIGRtYSBtYXAgd2hpY2gKPj4g
PiA+IGlzIHRoZSBjYXNlIGhlcmUuCj4+ID4KPj4gPiBIb3cgZGlkIHdlIGdldCB0byBkZXZpY2Ug
bWVtb3J5IG9uIGEgY2FyZD8gSXNuJ3QgcmFuZ2UtPnBmbnMgYSBDUFUgUEZOCj4+ID4gYXQgdGhp
cyBwb2ludD8KPj4gPgo+PiA+IEknbSBjb25mdXNlZC4KPj4KPj4gRGV2aWNlIG1lbW9yeSBwbHVn
aW4gaXMgZG9uZSB0aHJvdWdoIGRldm1fbWVtcmVtYXBfcGFnZXMoKSBpbiBwYXRjaCAwNyBvZgo+
PiB0aGlzIHNlcmllcy4gSW4gdGhhdCBwYXRjaCwgd2UgY29udmVydCB0aGUgQ1BVIFBGTiB0byBk
ZXZpY2UgUEZOIGJlZm9yZQo+PiBidWlsZGluZyB0aGUgc2dsICh0aGlzIGlzIHNpbWlsYXIgdG8g
dGhlIG5vdXZlYXUgZHJpdmVyKS4KPgo+QnV0IGVhcmxpZXIganVzdCBjYWxsZWQgaG1tX3Jhbmdl
X2ZhdWx0KCksIGl0IGNhbiByZXR1cm4gYWxsIGtpbmRzIG9mCj5wYWdlcy4gSWYgdGhlc2UgYXJl
IG9ubHkgYWxsb3dlZCB0byBiZSBkZXZpY2UgcGFnZXMgaGVyZSB0aGVuIHRoYXQKPm11c3QgYmUg
Y2hlY2tlZCAodW5kZXIgbG9jaykKPgoKWWFoLCBsZXQgbWUgYWRkIHRoZSBjaGVjay4KKEkga2Vw
dCBpcyB1bmNoZWNrZWQgZm9yIGRlYnVnIHB1cnBvc2UsIGZvcmdvdCB0byBhZGQgdGhlIGNoZWNr
IGJlZm9yZSBzZW5kaW5nCnRoZSBwYXRjaGVzLikKCj5BbmQgcHV0dGluZyB0aGUgY3B1IFBGTiBv
ZiBhIFpPTkVfREVWSUNFIGRldmljZSBwYWdlIGludG8KPnNnX2RtYV9hZGRyZXNzIHN0aWxsIGxv
b2tzIHZlcnkgd3JvbmcgdG8gbWUKPgoKVGhlIGJlbG93IGNhbGwgaW4gcGF0Y2ggNyBkb2VzIGNv
bnZlcnQgYW55IGNwdSBQRk4gdG8gZGV2aWNlIGFkZHJlc3MuClNvLCBpdCB3b24ndCBiZSBDUFUg
UEZOLgppOTE1X2RtZW1fY29udmVydF9wZm4odm0tPmk5MTUsICZyYW5nZSk7CgpBbHNvLCBvbmx5
IHJlYXNvbiB0byB1c2Ugc2dsIGxpc3QgaXMgYmVjYXVzZSBpOTE1IGRyaXZlciBwYWdlIHRhYmxl
IHVwZGF0ZQpmdW5jdGlvbnMgdGFrZXMgYW4gc2dsLCBvdGhlcndpc2Ugd2UgY2FuIGRpcmVjdGx5
IGRlYWwgd2l0aCByYW5nZS5wZm5zIGFycmF5LgoKTmlyYW5qYW5hCgo+SmFzb24KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

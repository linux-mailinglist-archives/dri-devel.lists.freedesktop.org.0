Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40EF11051E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 20:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E736EB12;
	Tue,  3 Dec 2019 19:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C746EB10;
 Tue,  3 Dec 2019 19:31:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 11:31:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,274,1571727600"; d="scan'208";a="208601858"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by fmsmga007.fm.intel.com with ESMTP; 03 Dec 2019 11:31:01 -0800
Date: Tue, 3 Dec 2019 11:19:43 -0800
From: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Message-ID: <20191203191943.GQ14488@nvishwa1-DESK.sc.intel.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-7-niranjana.vishwanathapura@intel.com>
 <20191122233308.GA7481@mellanox.com>
 <20191125163327.GA5516@redhat.com>
 <20191126183247.GM7481@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126183247.GM7481@mellanox.com>
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
 Jerome Glisse <jglisse@redhat.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDY6MzI6NTJQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMTE6MzM6MjdBTSAtMDUwMCwgSmVyb21l
IEdsaXNzZSB3cm90ZToKPj4gT24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTE6MzM6MTJQTSArMDAw
MCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+PiA+IE9uIEZyaSwgTm92IDIyLCAyMDE5IGF0IDEy
OjU3OjI3UE0gLTA4MDAsIE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEgd3JvdGU6Cj4+Cj4+IFsu
Li5dCj4+Cj4+ID4gPiArc3RhdGljIGludAo+PiA+ID4gK2k5MTVfcmFuZ2VfZmF1bHQoc3RydWN0
IGk5MTVfc3ZtICpzdm0sIHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQo+PiA+ID4gK3sKPj4gPiA+
ICsJbG9uZyByZXQ7Cj4+ID4gPiArCj4+ID4gPiArCXJhbmdlLT5kZWZhdWx0X2ZsYWdzID0gMDsK
Pj4gPiA+ICsJcmFuZ2UtPnBmbl9mbGFnc19tYXNrID0gLTFVTDsKPj4gPiA+ICsKPj4gPiA+ICsJ
cmV0ID0gaG1tX3JhbmdlX3JlZ2lzdGVyKHJhbmdlLCAmc3ZtLT5taXJyb3IpOwo+PiA+ID4gKwlp
ZiAocmV0KSB7Cj4+ID4gPiArCQl1cF9yZWFkKCZzdm0tPm1tLT5tbWFwX3NlbSk7Cj4+ID4gPiAr
CQlyZXR1cm4gKGludClyZXQ7Cj4+ID4gPiArCX0KPj4gPgo+PiA+Cj4+ID4gVXNpbmcgYSB0ZW1w
b3JhcnkgcmFuZ2UgaXMgdGhlIHBhdHRlcm4gZnJvbSBub3V2ZWF1LCBpcyBpdCByZWFsbHkKPj4g
PiBuZWNlc3NhcnkgaW4gdGhpcyBkcml2ZXI/Cj4+Cj4+IEp1c3QgdG8gY29tbWVudCBvbiB0aGlz
LCBmb3IgR1BVIHRoZSB1c2FnZSBtb2RlbCBpcyBub3QgYXBwbGljYXRpb24KPj4gcmVnaXN0ZXIg
cmFuZ2Ugb2YgdmlydHVhbCBhZGRyZXNzIGl0IHdhbnRzIHRvIHVzZS4gSXQgaXMgR1BVIGNhbgo+
PiBhY2Nlc3MgX2FueV8gQ1BVIHZhbGlkIGFkZHJlc3MganVzdCBsaWtlIHRoZSBDUFUgd291bGQg
KG1vZHVsbyBtbWFwCj4+IG9mIGRldmljZSBmaWxlKS4KPj4KPj4gVGhpcyBpcyBiZWNhdXNlIHRo
ZSBBUEkgeW91IHdhbnQgaW4gdXNlcnNwYWNlIGlzIGFwcGxpY2F0aW9uIHBhc3NpbmcKPj4gcmFu
ZG9tIHBvaW50ZXIgdG8gdGhlIEdQVSBhbmQgR1BVIGJlaW5nIGFibGUgdG8gY2hhc2UgZG93biBh
bnkga2luZAo+PiBvZiByYW5kb20gcG9pbnRlciBjaGFpbiAoYXNzdW1pbmcgYWxsIHZhbGlkIGll
IHBvaW50aW5nIHRvIHZhbGlkCj4+IHZpcnR1YWwgYWRkcmVzcyBmb3IgdGhlIHByb2Nlc3MpLgo+
Pgo+PiBUaGlzIGlzIHVubGlrZSB0aGUgUkRNQSBjYXNlLgo+Cj5ObywgUkRNQSBoYXMgdGhlIGZ1
bGwgYWRkcmVzcyBzcGFjZSBvcHRpb24gYXMgd2VsbCwgaXQgaXMgY2FsbGVkCj4naW1wbGljaXQg
T0RQJwo+Cj5UaGlzIGlzIGltcGxlbWVudGVkIGJ5IHJlZ2lzdGVyaW5nIHJhbmdlcyBhdCBhIGxl
dmVsIGluIG91ciBwYWdlCj50YWJsZSAoY3VycmVudGx5IDUxMkcpIHdoZW5ldmVyIHRoYXQgbGV2
ZWwgaGFzIHBvcHVsYXRlZCBwYWdlcyBiZWxvdwo+aXQuCj4KPkkgdGhpbmsgaXMgYSBiZXR0ZXIg
c3RyYXRlZ3kgdGhhbiB0ZW1wb3JhcnkgcmFuZ2VzLgo+Cj5CdXQgb3RoZXIgR1BVIGRyaXZlcnMg
bGlrZSBBTUQgYXJlIHVzaW5nIEJPIGFuZCBUVE0gb2JqZWN0cyB3aXRoIGZpeGVkCj5WQSByYW5n
ZXMgYW5kIHRoZSByYW5nZSBpcyB0aWVkIHRvIHRoZSBCTy9UVE0uCj4KPkknbSBub3Qgc3VyZSBp
ZiB0aGlzIGk5MTUgdXNhZ2UgaXMgY2xvc2VyIHRvIEFNRCBvciBjbG9zZXIgdG8gbm91dmVhdS4K
PgoKSSBkb24ndCBrbm93IHRoZSBmdWxsIGRldGFpbHMgb2YgdGhlIEhNTSB1c2VjYXNlcyBpbiBh
bWQgYW5kIG5vdXZlYXUuCkFNRCBzZWVtcyB0byBiZSB1c2luZyBpdCBmb3IgdXNycHRyIG9iamVj
dHMgd2hpY2ggaXMgdGllZCB0byBhIEJPLgpJIGFtIG5vdCBzdXJlIGlmIG5vdXZlYXUgaGFzIGFu
eSBCTyB0aWVkIHRvIHRoZXNlIGFkZHJlc3MgcmFuZ2VzLgoKTmlyYW5qYW5hCgo+SmFzb24KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

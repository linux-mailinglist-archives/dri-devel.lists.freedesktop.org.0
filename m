Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A769ED8A82
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 10:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F7B6E8DA;
	Wed, 16 Oct 2019 08:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6990E6E8DA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:07:57 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2019 01:07:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,303,1566889200"; d="scan'208";a="370730010"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga005.jf.intel.com with ESMTP; 16 Oct 2019 01:07:55 -0700
Received: from andy by smile with local (Exim 4.92.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1iKeLa-0006c0-8B; Wed, 16 Oct 2019 11:07:54 +0300
Date: Wed, 16 Oct 2019 11:07:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 05/11] drm/tinydrm: Remove
 tinydrm_spi_max_transfer_size()
Message-ID: <20191016080754.GS32742@smile.fi.intel.com>
References: <20190719155916.62465-1-noralf@tronnes.org>
 <20190719155916.62465-6-noralf@tronnes.org>
 <20191015143236.GA5363@smile.fi.intel.com>
 <253aec49-e51c-b35b-4e7d-53a8a948655d@tronnes.org>
 <20191015155911.GM32742@smile.fi.intel.com>
 <CAKMK7uEW83M0G8TuSMsVysGLc6eK27sGgUvYq=kr8mBgNuAoSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEW83M0G8TuSMsVysGLc6eK27sGgUvYq=kr8mBgNuAoSg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Sam Ravnborg <sam@ravnborg.org>, David Lechner <david@lechnology.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDY6MDU6MTZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE9jdCAxNSwgMjAxOSBhdCA1OjU5IFBNIEFuZHkgU2hldmNoZW5rbwo+
IDxhbmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+IHdyb3RlOgo+ID4gT24gVHVlLCBPY3QgMTUs
IDIwMTkgYXQgMDU6NDE6NTNQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+ID4gPiBE
ZW4gMTUuMTAuMjAxOSAxNi4zMiwgc2tyZXYgQW5keSBTaGV2Y2hlbmtvOgo+ID4gPiA+IE9uIEZy
aSwgSnVsIDE5LCAyMDE5IGF0IDA1OjU5OjEwUE0gKzAyMDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90
ZToKPiA+ID4gPj4gc3BpLWJjbTI4MzUgY2FuIGhhbmRsZSA+NjRrQiBidWZmZXJzIG5vdyBzbyB0
aGVyZSBpcyBubyBuZWVkIHRvIGNoZWNrCj4gPiA+ID4+IC0+bWF4X2RtYV9sZW4uIFRoZSB0aW55
ZHJtX3NwaV9tYXhfdHJhbnNmZXJfc2l6ZSgpIG1heF9sZW4gYXJndW1lbnQgaXMKPiA+ID4gPj4g
bm90IHVzZWQgYnkgYW55IGNhbGxlcnMsIHNvIG5vdCBuZWVkZWQuCj4gPiA+ID4+Cj4gPiA+ID4+
IFRoZW4gd2UgaGF2ZSB0aGUgc3BpX21heCBtb2R1bGUgcGFyYW1ldGVyLiBJdCB3YXMgYWRkZWQg
YmVjYXVzZQo+ID4gPiA+PiBzdGFnaW5nL2ZidGZ0IGhhcyBzdXBwb3J0IGZvciBpdCBhbmQgdGhl
cmUgd2FzIGEgcmVwb3J0IHRoYXQgc29tZW9uZSB1c2VkCj4gPiA+ID4+IGl0IHRvIHNldCBhIHNt
YWxsIGJ1ZmZlciBzaXplIHRvIGF2b2lkIHBvcHBpbmcgb24gYSBVU0Igc291bmRjYXJkIG9uIGEK
PiA+ID4gPj4gUmFzcGJlcnJ5IFBpLiBJbiBoaW5kc2lnaHQgaXQgc2hvdWxkbid0IGhhdmUgYmVl
biBhZGRlZCwgSSBzaG91bGQgaGF2ZQo+ID4gPiA+PiB3YWl0ZWQgZm9yIGl0IHRvIGJlY29tZSBh
IHByb2JsZW0gZmlyc3QuIEkgZG9uJ3Qga25vdyBpdCBhbnlvbmUgaXMKPiA+ID4gPj4gYWN0dWFs
bHkgdXNpbmcgaXQsIGJ1dCBzaW5jZSB0aW55ZHJtX3NwaV90cmFuc2ZlcigpIGlzIGJlaW5nIG1v
dmVkIHRvCj4gPiA+ID4+IG1pcGktZGJpLCBJJ20gdGFraW5nIHRoZSBvcHBvcnR1bml0eSB0byBy
ZW1vdmUgaXQuIEknbGwgYWRkIGl0IGJhY2sgdG8KPiA+ID4gPj4gbWlwaS1kYmkgaWYgc29tZW9u
ZSBjb21wbGFpbnMuCj4gPiA+ID4+Cj4gPiA+ID4+IFdpdGggdGhhdCBvdXQgb2YgdGhlIHdheSwg
c3BpX21heF90cmFuc2Zlcl9zaXplKCkgY2FuIGJlIHVzZWQgaW5zdGVhZC4KPiA+ID4gPj4KPiA+
ID4gPj4gVGhlIGNob3NlbiAxNmtCIGJ1ZmZlciBzaXplIGZvciBUeXBlIEMgT3B0aW9uIDEgKDkt
Yml0KSBpbnRlcmZhY2UgaXMKPiA+ID4gPj4gc29tZXdoYXQgYXJiaXRyYXJ5LCBidXQgYSBiaWdn
ZXIgYnVmZmVyIHdpbGwgaGF2ZSBhIG1pbmlzY3VsZSBpbXBhY3Qgb24KPiA+ID4gPj4gdHJhbnNm
ZXIgc3BlZWQsIHNvIGl0J3MgcHJvYmFibHkgZmluZS4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgYnJl
YWtzIHRoZSBTUEkgUFhBMnh4IGNhc2UgSSdtIHVzaW5nLiBUaGUgd29ybGQgaXMgbm90IGEgUGk6
ZS4KPiA+ID4gPgo+ID4gPiA+IFsgIDM4OC40NDU3NTJdIG1pMDI4M3F0IHNwaS1QUlAwMDAxOjAx
OiBETUEgZGlzYWJsZWQgZm9yIHRyYW5zZmVyIGxlbmd0aCAxNTM2MDAgZ3JlYXRlciB0aGFuIDY1
NTM2Cj4gPiA+ID4gWyAgMzg4LjYzNDQzN10gbWkwMjgzcXQgc3BpLVBSUDAwMDE6MDE6IERNQSBk
aXNhYmxlZCBmb3IgdHJhbnNmZXIgbGVuZ3RoIDE1MzYwMCBncmVhdGVyIHRoYW4gNjU1MzYKPiA+
ID4gPiBbICAzODguODIyOTMzXSBtaTAyODNxdCBzcGktUFJQMDAwMTowMTogRE1BIGRpc2FibGVk
IGZvciB0cmFuc2ZlciBsZW5ndGggMTUzNjAwIGdyZWF0ZXIgdGhhbiA2NTUzNgo+ID4gPiA+Cj4g
PiA+ID4gVGhlIGNydWNpYWwgdGhpbmcgaXMgdG8gY2hlY2sgdGhlIHRyYW5zZmVyIHNpemUgYWdh
aW5zdCBtYXhpbXVtIERNQSBsZW5ndGgKPiA+ID4gPiBvZiB0aGUgbWFzdGVyLgo+ID4gPiA+Cj4g
PiA+Cj4gPiA+IElzbid0IHRoaXMgYSBzcGkgY29udHJvbGxlciBkcml2ZXIgcHJvYmxlbT8KPiA+
Cj4gPiBJdCBkb2Vzbid0IG1hdHRlci4gVGhpcyBwYXRjaCBtYWRlIGEgcmVncmVzc2lvbi4gQmVm
b3JlIGl0IHdvcmtlZCwKPiA+IG5vdyBpdCBkb2Vzbid0Lgo+IAo+IFllcyB0aGlzIGlzIGNsZWFy
Lgo+IAo+ID4gPiBzcGlfbWF4X3RyYW5zZmVyX3NpemUoKSB0ZWxscyB0aGUgY2xpZW50IHdoYXQg
dGhlIG1heGltdW0gdHJhbnNmZXIKPiA+ID4gbGVuZ3RoIGlzLiBUaGUgY29udHJvbGxlciBkcml2
ZXIgY2FuIHVzZSBjdGxyLT5tYXhfdHJhbnNmZXJfc2l6ZSBpZiBpdAo+ID4gPiBoYXMgcmVzdHJp
Y3Rpb25zLgo+ID4KPiA+IEl0IG1pZ2h0IGJlIGEgcHJvYmxlbSBvZiB0aGUgU1BJIGNvcmUuCj4g
Pgo+ID4gPiBBRkFJVUkgbWF4X2RtYV9sZW4gaXMgdXNlZCB3aGVuIHNwbGl0dGluZyB1cCB0aGUg
YnVmZmVyIGZvciB0aGUgc2cgdGFibGUKPiA+ID4gaW4gc3BpX21hcF9idWYoKS4KPiA+Cj4gPiA+
ID4gUGxlYXNlLCBmaXguCj4gPgo+ID4gU2hvdWxkIEkgc2VuZCB0aGUgcmV2ZXJ0Pwo+IAo+IENh
biB3ZSBwbGVhc2Ugbm90IHJvbGwgaW4gd2l0aCB0aGUgY2F2YWxyeSBiZWZvcmUgZXZlcnlvbmUg
aGFkIGEKPiBjaGFuY2UgdG8gd2FrZSB1cCBhbmQgbG9vayBhdCB0aGlzIHByb3Blcmx5PyBJdCdz
IGxlc3MgdGhhbiAxaCBzaW5jZQo+IHlvdXIgaW5pdGlhbCBidWcgcmVwb3J0LgoKSXQgd2FzIGEg
c2ltcGxlIHF1ZXN0aW9uIHRvIHRoZSAxc3QgbGV2ZWwgbWFpbnRhaW5lciBvZiB0aGUgc3Vic3lz
dGVtLAp3aG8gYWxyZWFkeSByZWFkIHRoZSByZXBvcnQgYW5kIGFuc3dlcmVkIHRvIGl0LgoKPiBB
bHNvLCB5b3UgX2RvXyBoYXZlIGEgdGVzdCBwYXRjaCBpbiB5b3VyIGluYm94IC4uLgoKWWVzLCB0
aGFua3MgZm9yIGl0LCBJJ20gZ29pbmcgdG8gdGVzdCByaWdodCBub3cuCgotLSAKV2l0aCBCZXN0
IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==

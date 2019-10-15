Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D71D7AAC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 17:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3726E83F;
	Tue, 15 Oct 2019 15:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994446E83F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 15:59:13 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 08:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,300,1566889200"; d="scan'208";a="194554528"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga008.fm.intel.com with ESMTP; 15 Oct 2019 08:59:12 -0700
Received: from andy by smile with local (Exim 4.92.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1iKPE7-00031V-9w; Tue, 15 Oct 2019 18:59:11 +0300
Date: Tue, 15 Oct 2019 18:59:11 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 05/11] drm/tinydrm: Remove
 tinydrm_spi_max_transfer_size()
Message-ID: <20191015155911.GM32742@smile.fi.intel.com>
References: <20190719155916.62465-1-noralf@tronnes.org>
 <20190719155916.62465-6-noralf@tronnes.org>
 <20191015143236.GA5363@smile.fi.intel.com>
 <253aec49-e51c-b35b-4e7d-53a8a948655d@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <253aec49-e51c-b35b-4e7d-53a8a948655d@tronnes.org>
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
Cc: sam@ravnborg.org, david@lechnology.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDU6NDE6NTNQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IERlbiAxNS4xMC4yMDE5IDE2LjMyLCBza3JldiBBbmR5IFNoZXZjaGVua286Cj4g
PiBPbiBGcmksIEp1bCAxOSwgMjAxOSBhdCAwNTo1OToxMFBNICswMjAwLCBOb3JhbGYgVHLDuG5u
ZXMgd3JvdGU6Cj4gPj4gc3BpLWJjbTI4MzUgY2FuIGhhbmRsZSA+NjRrQiBidWZmZXJzIG5vdyBz
byB0aGVyZSBpcyBubyBuZWVkIHRvIGNoZWNrCj4gPj4gLT5tYXhfZG1hX2xlbi4gVGhlIHRpbnlk
cm1fc3BpX21heF90cmFuc2Zlcl9zaXplKCkgbWF4X2xlbiBhcmd1bWVudCBpcwo+ID4+IG5vdCB1
c2VkIGJ5IGFueSBjYWxsZXJzLCBzbyBub3QgbmVlZGVkLgo+ID4+Cj4gPj4gVGhlbiB3ZSBoYXZl
IHRoZSBzcGlfbWF4IG1vZHVsZSBwYXJhbWV0ZXIuIEl0IHdhcyBhZGRlZCBiZWNhdXNlCj4gPj4g
c3RhZ2luZy9mYnRmdCBoYXMgc3VwcG9ydCBmb3IgaXQgYW5kIHRoZXJlIHdhcyBhIHJlcG9ydCB0
aGF0IHNvbWVvbmUgdXNlZAo+ID4+IGl0IHRvIHNldCBhIHNtYWxsIGJ1ZmZlciBzaXplIHRvIGF2
b2lkIHBvcHBpbmcgb24gYSBVU0Igc291bmRjYXJkIG9uIGEKPiA+PiBSYXNwYmVycnkgUGkuIElu
IGhpbmRzaWdodCBpdCBzaG91bGRuJ3QgaGF2ZSBiZWVuIGFkZGVkLCBJIHNob3VsZCBoYXZlCj4g
Pj4gd2FpdGVkIGZvciBpdCB0byBiZWNvbWUgYSBwcm9ibGVtIGZpcnN0LiBJIGRvbid0IGtub3cg
aXQgYW55b25lIGlzCj4gPj4gYWN0dWFsbHkgdXNpbmcgaXQsIGJ1dCBzaW5jZSB0aW55ZHJtX3Nw
aV90cmFuc2ZlcigpIGlzIGJlaW5nIG1vdmVkIHRvCj4gPj4gbWlwaS1kYmksIEknbSB0YWtpbmcg
dGhlIG9wcG9ydHVuaXR5IHRvIHJlbW92ZSBpdC4gSSdsbCBhZGQgaXQgYmFjayB0bwo+ID4+IG1p
cGktZGJpIGlmIHNvbWVvbmUgY29tcGxhaW5zLgo+ID4+Cj4gPj4gV2l0aCB0aGF0IG91dCBvZiB0
aGUgd2F5LCBzcGlfbWF4X3RyYW5zZmVyX3NpemUoKSBjYW4gYmUgdXNlZCBpbnN0ZWFkLgo+ID4+
Cj4gPj4gVGhlIGNob3NlbiAxNmtCIGJ1ZmZlciBzaXplIGZvciBUeXBlIEMgT3B0aW9uIDEgKDkt
Yml0KSBpbnRlcmZhY2UgaXMKPiA+PiBzb21ld2hhdCBhcmJpdHJhcnksIGJ1dCBhIGJpZ2dlciBi
dWZmZXIgd2lsbCBoYXZlIGEgbWluaXNjdWxlIGltcGFjdCBvbgo+ID4+IHRyYW5zZmVyIHNwZWVk
LCBzbyBpdCdzIHByb2JhYmx5IGZpbmUuCj4gPiAKPiA+IFRoaXMgYnJlYWtzIHRoZSBTUEkgUFhB
Mnh4IGNhc2UgSSdtIHVzaW5nLiBUaGUgd29ybGQgaXMgbm90IGEgUGk6ZS4KPiA+IAo+ID4gWyAg
Mzg4LjQ0NTc1Ml0gbWkwMjgzcXQgc3BpLVBSUDAwMDE6MDE6IERNQSBkaXNhYmxlZCBmb3IgdHJh
bnNmZXIgbGVuZ3RoIDE1MzYwMCBncmVhdGVyIHRoYW4gNjU1MzYKPiA+IFsgIDM4OC42MzQ0Mzdd
IG1pMDI4M3F0IHNwaS1QUlAwMDAxOjAxOiBETUEgZGlzYWJsZWQgZm9yIHRyYW5zZmVyIGxlbmd0
aCAxNTM2MDAgZ3JlYXRlciB0aGFuIDY1NTM2Cj4gPiBbICAzODguODIyOTMzXSBtaTAyODNxdCBz
cGktUFJQMDAwMTowMTogRE1BIGRpc2FibGVkIGZvciB0cmFuc2ZlciBsZW5ndGggMTUzNjAwIGdy
ZWF0ZXIgdGhhbiA2NTUzNgo+ID4gCj4gPiBUaGUgY3J1Y2lhbCB0aGluZyBpcyB0byBjaGVjayB0
aGUgdHJhbnNmZXIgc2l6ZSBhZ2FpbnN0IG1heGltdW0gRE1BIGxlbmd0aAo+ID4gb2YgdGhlIG1h
c3Rlci4KPiA+IAo+IAo+IElzbid0IHRoaXMgYSBzcGkgY29udHJvbGxlciBkcml2ZXIgcHJvYmxl
bT8KCkl0IGRvZXNuJ3QgbWF0dGVyLiBUaGlzIHBhdGNoIG1hZGUgYSByZWdyZXNzaW9uLiBCZWZv
cmUgaXQgd29ya2VkLApub3cgaXQgZG9lc24ndC4KCj4gc3BpX21heF90cmFuc2Zlcl9zaXplKCkg
dGVsbHMgdGhlIGNsaWVudCB3aGF0IHRoZSBtYXhpbXVtIHRyYW5zZmVyCj4gbGVuZ3RoIGlzLiBU
aGUgY29udHJvbGxlciBkcml2ZXIgY2FuIHVzZSBjdGxyLT5tYXhfdHJhbnNmZXJfc2l6ZSBpZiBp
dAo+IGhhcyByZXN0cmljdGlvbnMuCgpJdCBtaWdodCBiZSBhIHByb2JsZW0gb2YgdGhlIFNQSSBj
b3JlLgoKPiBBRkFJVUkgbWF4X2RtYV9sZW4gaXMgdXNlZCB3aGVuIHNwbGl0dGluZyB1cCB0aGUg
YnVmZmVyIGZvciB0aGUgc2cgdGFibGUKPiBpbiBzcGlfbWFwX2J1ZigpLgoKPiA+IFBsZWFzZSwg
Zml4LgoKU2hvdWxkIEkgc2VuZCB0aGUgcmV2ZXJ0PwoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApB
bmR5IFNoZXZjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=

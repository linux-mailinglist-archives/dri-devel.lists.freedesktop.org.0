Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE698D795D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 17:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E56D6E03F;
	Tue, 15 Oct 2019 15:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF356E03F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 15:03:00 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 08:02:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,300,1566889200"; d="scan'208";a="347101505"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004.jf.intel.com with ESMTP; 15 Oct 2019 08:02:57 -0700
Received: from andy by smile with local (Exim 4.92.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1iKOLh-00024M-7X; Tue, 15 Oct 2019 18:02:57 +0300
Date: Tue, 15 Oct 2019 18:02:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 05/11] drm/tinydrm: Remove
 tinydrm_spi_max_transfer_size()
Message-ID: <20191015150257.GK32742@smile.fi.intel.com>
References: <20190719155916.62465-1-noralf@tronnes.org>
 <20190719155916.62465-6-noralf@tronnes.org>
 <20191015143236.GA5363@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015143236.GA5363@smile.fi.intel.com>
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

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDU6MzI6MzZQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIEZyaSwgSnVsIDE5LCAyMDE5IGF0IDA1OjU5OjEwUE0gKzAyMDAsIE5vcmFs
ZiBUcsO4bm5lcyB3cm90ZToKPiA+IHNwaS1iY20yODM1IGNhbiBoYW5kbGUgPjY0a0IgYnVmZmVy
cyBub3cgc28gdGhlcmUgaXMgbm8gbmVlZCB0byBjaGVjawo+ID4gLT5tYXhfZG1hX2xlbi4gVGhl
IHRpbnlkcm1fc3BpX21heF90cmFuc2Zlcl9zaXplKCkgbWF4X2xlbiBhcmd1bWVudCBpcwo+ID4g
bm90IHVzZWQgYnkgYW55IGNhbGxlcnMsIHNvIG5vdCBuZWVkZWQuCj4gPiAKPiA+IFRoZW4gd2Ug
aGF2ZSB0aGUgc3BpX21heCBtb2R1bGUgcGFyYW1ldGVyLiBJdCB3YXMgYWRkZWQgYmVjYXVzZQo+
ID4gc3RhZ2luZy9mYnRmdCBoYXMgc3VwcG9ydCBmb3IgaXQgYW5kIHRoZXJlIHdhcyBhIHJlcG9y
dCB0aGF0IHNvbWVvbmUgdXNlZAo+ID4gaXQgdG8gc2V0IGEgc21hbGwgYnVmZmVyIHNpemUgdG8g
YXZvaWQgcG9wcGluZyBvbiBhIFVTQiBzb3VuZGNhcmQgb24gYQo+ID4gUmFzcGJlcnJ5IFBpLiBJ
biBoaW5kc2lnaHQgaXQgc2hvdWxkbid0IGhhdmUgYmVlbiBhZGRlZCwgSSBzaG91bGQgaGF2ZQo+
ID4gd2FpdGVkIGZvciBpdCB0byBiZWNvbWUgYSBwcm9ibGVtIGZpcnN0LiBJIGRvbid0IGtub3cg
aXQgYW55b25lIGlzCj4gPiBhY3R1YWxseSB1c2luZyBpdCwgYnV0IHNpbmNlIHRpbnlkcm1fc3Bp
X3RyYW5zZmVyKCkgaXMgYmVpbmcgbW92ZWQgdG8KPiA+IG1pcGktZGJpLCBJJ20gdGFraW5nIHRo
ZSBvcHBvcnR1bml0eSB0byByZW1vdmUgaXQuIEknbGwgYWRkIGl0IGJhY2sgdG8KPiA+IG1pcGkt
ZGJpIGlmIHNvbWVvbmUgY29tcGxhaW5zLgo+ID4gCj4gPiBXaXRoIHRoYXQgb3V0IG9mIHRoZSB3
YXksIHNwaV9tYXhfdHJhbnNmZXJfc2l6ZSgpIGNhbiBiZSB1c2VkIGluc3RlYWQuCj4gPiAKPiA+
IFRoZSBjaG9zZW4gMTZrQiBidWZmZXIgc2l6ZSBmb3IgVHlwZSBDIE9wdGlvbiAxICg5LWJpdCkg
aW50ZXJmYWNlIGlzCj4gPiBzb21ld2hhdCBhcmJpdHJhcnksIGJ1dCBhIGJpZ2dlciBidWZmZXIg
d2lsbCBoYXZlIGEgbWluaXNjdWxlIGltcGFjdCBvbgo+ID4gdHJhbnNmZXIgc3BlZWQsIHNvIGl0
J3MgcHJvYmFibHkgZmluZS4KPiAKPiBUaGlzIGJyZWFrcyB0aGUgU1BJIFBYQTJ4eCBjYXNlIEkn
bSB1c2luZy4gVGhlIHdvcmxkIGlzIG5vdCBhIFBpOmUuCj4gCj4gWyAgMzg4LjQ0NTc1Ml0gbWkw
MjgzcXQgc3BpLVBSUDAwMDE6MDE6IERNQSBkaXNhYmxlZCBmb3IgdHJhbnNmZXIgbGVuZ3RoIDE1
MzYwMCBncmVhdGVyIHRoYW4gNjU1MzYKPiBbICAzODguNjM0NDM3XSBtaTAyODNxdCBzcGktUFJQ
MDAwMTowMTogRE1BIGRpc2FibGVkIGZvciB0cmFuc2ZlciBsZW5ndGggMTUzNjAwIGdyZWF0ZXIg
dGhhbiA2NTUzNgo+IFsgIDM4OC44MjI5MzNdIG1pMDI4M3F0IHNwaS1QUlAwMDAxOjAxOiBETUEg
ZGlzYWJsZWQgZm9yIHRyYW5zZmVyIGxlbmd0aCAxNTM2MDAgZ3JlYXRlciB0aGFuIDY1NTM2Cj4g
Cj4gVGhlIGNydWNpYWwgdGhpbmcgaXMgdG8gY2hlY2sgdGhlIHRyYW5zZmVyIHNpemUgYWdhaW5z
dCBtYXhpbXVtIERNQSBsZW5ndGgKPiBvZiB0aGUgbWFzdGVyLgo+IAo+IFBsZWFzZSwgZml4LgoK
UGFydGlhbCByZXZlcnQgZml4ZXMgdGhlIGlzc3VlLCB0aG91Z2ggSSdtIG5vdCBzdXJlIGl0J3Mg
dGhlIGJlc3QgYXBwcm9hY2guCgotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jCkBAIC0xMTQ3LDcgKzExNDcsNyBA
QCBFWFBPUlRfU1lNQk9MKG1pcGlfZGJpX3NwaV9pbml0KTsKIGludCBtaXBpX2RiaV9zcGlfdHJh
bnNmZXIoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSwgdTMyIHNwZWVkX2h6LAogCQkJICB1OCBicHcs
IGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbikKewotCXNpemVfdCBtYXhfY2h1bmsgPSBzcGlf
bWF4X3RyYW5zZmVyX3NpemUoc3BpKTsKKwlzaXplX3QgbWF4X2NodW5rID0gbWluKHNwaV9tYXhf
dHJhbnNmZXJfc2l6ZShzcGkpLCBzcGktPm1hc3Rlci0+bWF4X2RtYV9sZW4pOwogCXN0cnVjdCBz
cGlfdHJhbnNmZXIgdHIgPSB7CiAJCS5iaXRzX3Blcl93b3JkID0gYnB3LAogCQkuc3BlZWRfaHog
PSBzcGVlZF9oeiwKCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DCAD96B4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 18:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EA06E179;
	Wed, 16 Oct 2019 16:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3217D6E179
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 16:13:04 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2019 09:13:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,304,1566889200"; d="scan'208";a="186196071"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga007.jf.intel.com with ESMTP; 16 Oct 2019 09:13:01 -0700
Received: from andy by smile with local (Exim 4.92.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1iKlv2-0005Q2-48; Wed, 16 Oct 2019 19:13:00 +0300
Date: Wed, 16 Oct 2019 19:13:00 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 05/11] drm/tinydrm: Remove
 tinydrm_spi_max_transfer_size()
Message-ID: <20191016161300.GW32742@smile.fi.intel.com>
References: <20190719155916.62465-1-noralf@tronnes.org>
 <20190719155916.62465-6-noralf@tronnes.org>
 <20191015143236.GA5363@smile.fi.intel.com>
 <253aec49-e51c-b35b-4e7d-53a8a948655d@tronnes.org>
 <20191015155720.GQ11828@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015155720.GQ11828@phenom.ffwll.local>
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
Cc: david@lechnology.com, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDU6NTc6MjBQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE9jdCAxNSwgMjAxOSBhdCAwNTo0MTo1M1BNICswMjAwLCBOb3JhbGYg
VHLDuG5uZXMgd3JvdGU6Cj4gPiBEZW4gMTUuMTAuMjAxOSAxNi4zMiwgc2tyZXYgQW5keSBTaGV2
Y2hlbmtvOgo+ID4gPiBPbiBGcmksIEp1bCAxOSwgMjAxOSBhdCAwNTo1OToxMFBNICswMjAwLCBO
b3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gPiA+PiBzcGktYmNtMjgzNSBjYW4gaGFuZGxlID42NGtC
IGJ1ZmZlcnMgbm93IHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gY2hlY2sKPiA+ID4+IC0+bWF4X2Rt
YV9sZW4uIFRoZSB0aW55ZHJtX3NwaV9tYXhfdHJhbnNmZXJfc2l6ZSgpIG1heF9sZW4gYXJndW1l
bnQgaXMKPiA+ID4+IG5vdCB1c2VkIGJ5IGFueSBjYWxsZXJzLCBzbyBub3QgbmVlZGVkLgo+ID4g
Pj4KPiA+ID4+IFRoZW4gd2UgaGF2ZSB0aGUgc3BpX21heCBtb2R1bGUgcGFyYW1ldGVyLiBJdCB3
YXMgYWRkZWQgYmVjYXVzZQo+ID4gPj4gc3RhZ2luZy9mYnRmdCBoYXMgc3VwcG9ydCBmb3IgaXQg
YW5kIHRoZXJlIHdhcyBhIHJlcG9ydCB0aGF0IHNvbWVvbmUgdXNlZAo+ID4gPj4gaXQgdG8gc2V0
IGEgc21hbGwgYnVmZmVyIHNpemUgdG8gYXZvaWQgcG9wcGluZyBvbiBhIFVTQiBzb3VuZGNhcmQg
b24gYQo+ID4gPj4gUmFzcGJlcnJ5IFBpLiBJbiBoaW5kc2lnaHQgaXQgc2hvdWxkbid0IGhhdmUg
YmVlbiBhZGRlZCwgSSBzaG91bGQgaGF2ZQo+ID4gPj4gd2FpdGVkIGZvciBpdCB0byBiZWNvbWUg
YSBwcm9ibGVtIGZpcnN0LiBJIGRvbid0IGtub3cgaXQgYW55b25lIGlzCj4gPiA+PiBhY3R1YWxs
eSB1c2luZyBpdCwgYnV0IHNpbmNlIHRpbnlkcm1fc3BpX3RyYW5zZmVyKCkgaXMgYmVpbmcgbW92
ZWQgdG8KPiA+ID4+IG1pcGktZGJpLCBJJ20gdGFraW5nIHRoZSBvcHBvcnR1bml0eSB0byByZW1v
dmUgaXQuIEknbGwgYWRkIGl0IGJhY2sgdG8KPiA+ID4+IG1pcGktZGJpIGlmIHNvbWVvbmUgY29t
cGxhaW5zLgo+ID4gPj4KPiA+ID4+IFdpdGggdGhhdCBvdXQgb2YgdGhlIHdheSwgc3BpX21heF90
cmFuc2Zlcl9zaXplKCkgY2FuIGJlIHVzZWQgaW5zdGVhZC4KPiA+ID4+Cj4gPiA+PiBUaGUgY2hv
c2VuIDE2a0IgYnVmZmVyIHNpemUgZm9yIFR5cGUgQyBPcHRpb24gMSAoOS1iaXQpIGludGVyZmFj
ZSBpcwo+ID4gPj4gc29tZXdoYXQgYXJiaXRyYXJ5LCBidXQgYSBiaWdnZXIgYnVmZmVyIHdpbGwg
aGF2ZSBhIG1pbmlzY3VsZSBpbXBhY3Qgb24KPiA+ID4+IHRyYW5zZmVyIHNwZWVkLCBzbyBpdCdz
IHByb2JhYmx5IGZpbmUuCj4gPiA+IAo+ID4gPiBUaGlzIGJyZWFrcyB0aGUgU1BJIFBYQTJ4eCBj
YXNlIEknbSB1c2luZy4gVGhlIHdvcmxkIGlzIG5vdCBhIFBpOmUuCj4gPiA+IAo+ID4gPiBbICAz
ODguNDQ1NzUyXSBtaTAyODNxdCBzcGktUFJQMDAwMTowMTogRE1BIGRpc2FibGVkIGZvciB0cmFu
c2ZlciBsZW5ndGggMTUzNjAwIGdyZWF0ZXIgdGhhbiA2NTUzNgo+ID4gPiBbICAzODguNjM0NDM3
XSBtaTAyODNxdCBzcGktUFJQMDAwMTowMTogRE1BIGRpc2FibGVkIGZvciB0cmFuc2ZlciBsZW5n
dGggMTUzNjAwIGdyZWF0ZXIgdGhhbiA2NTUzNgo+ID4gPiBbICAzODguODIyOTMzXSBtaTAyODNx
dCBzcGktUFJQMDAwMTowMTogRE1BIGRpc2FibGVkIGZvciB0cmFuc2ZlciBsZW5ndGggMTUzNjAw
IGdyZWF0ZXIgdGhhbiA2NTUzNgo+ID4gPiAKPiA+ID4gVGhlIGNydWNpYWwgdGhpbmcgaXMgdG8g
Y2hlY2sgdGhlIHRyYW5zZmVyIHNpemUgYWdhaW5zdCBtYXhpbXVtIERNQSBsZW5ndGgKPiA+ID4g
b2YgdGhlIG1hc3Rlci4KPiA+ID4gCj4gPiAKPiA+IElzbid0IHRoaXMgYSBzcGkgY29udHJvbGxl
ciBkcml2ZXIgcHJvYmxlbT8KPiA+IHNwaV9tYXhfdHJhbnNmZXJfc2l6ZSgpIHRlbGxzIHRoZSBj
bGllbnQgd2hhdCB0aGUgbWF4aW11bSB0cmFuc2Zlcgo+ID4gbGVuZ3RoIGlzLiBUaGUgY29udHJv
bGxlciBkcml2ZXIgY2FuIHVzZSBjdGxyLT5tYXhfdHJhbnNmZXJfc2l6ZSBpZiBpdAo+ID4gaGFz
IHJlc3RyaWN0aW9ucy4KPiA+IEFGQUlVSSBtYXhfZG1hX2xlbiBpcyB1c2VkIHdoZW4gc3BsaXR0
aW5nIHVwIHRoZSBidWZmZXIgZm9yIHRoZSBzZyB0YWJsZQo+ID4gaW4gc3BpX21hcF9idWYoKS4K
PiAKPiBTb21ldGhpbmcgbGlrZSB0aGlzLCBhcyBhIHRlc3QgcGF0Y2guCgptYXhfdHJhbnNmZXJf
c2l6ZSBzaG91bGQgYmUgYSBmdW5jdGlvbi4gSW4gdGhhdCBjYXNlIGl0IHdvcmtzLgpIb3dldmVy
IEknbSBub3Qgc3VyZSBpdCdzIHRoZSBiZXN0IGFwcHJvYWNoLCB0aHVzLCBDYyB0byBTUEkgUFhB
IHBlb3BsZS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1weGEyeHguYyBiL2RyaXZl
cnMvc3BpL3NwaS1weGEyeHguYwo+IGluZGV4IGJiNmExNGQxYWIwZi4uZjc3MjAxOTE1MDMzIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1weGEyeHguYwo+ICsrKyBiL2RyaXZlcnMvc3Bp
L3NwaS1weGEyeHguYwo+IEBAIC0xNzA3LDYgKzE3MDcsNyBAQCBzdGF0aWMgaW50IHB4YTJ4eF9z
cGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQl9IGVsc2Ugewo+ICAJ
CQljb250cm9sbGVyLT5jYW5fZG1hID0gcHhhMnh4X3NwaV9jYW5fZG1hOwo+ICAJCQljb250cm9s
bGVyLT5tYXhfZG1hX2xlbiA9IE1BWF9ETUFfTEVOOwo+ICsJCQljb250cm9sbGVyLT5tYXhfdHJh
bnNmZXJfc2l6ZSA9IE1BWF9ETUFfTEVOOwo+ICAJCX0KPiAgCX0KPiAgCgotLSAKV2l0aCBCZXN0
IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==

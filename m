Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B5F15D6D9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 12:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D506E5C1;
	Fri, 14 Feb 2020 11:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B7D6E5C1;
 Fri, 14 Feb 2020 11:49:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2020 03:49:38 -0800
X-IronPort-AV: E=Sophos;i="5.70,440,1574150400"; d="scan'208";a="227578838"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2020 03:49:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915: Cast remain to unsigned long in eb_relocate_vma
In-Reply-To: <158166913989.4660.10674824117292988120@skylake-alporthouse-com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200214054706.33870-1-natechancellor@gmail.com>
 <87v9o965gg.fsf@intel.com>
 <158166913989.4660.10674824117292988120@skylake-alporthouse-com>
Date: Fri, 14 Feb 2020 13:49:31 +0200
Message-ID: <87o8u1wfqs.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNCBGZWIgMjAyMCwgQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+IHdyb3RlOgo+IFF1b3RpbmcgSmFuaSBOaWt1bGEgKDIwMjAtMDItMTQgMDY6MzY6MTUpCj4+
IE9uIFRodSwgMTMgRmViIDIwMjAsIE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBn
bWFpbC5jb20+IHdyb3RlOgo+PiA+IEEgcmVjZW50IGNvbW1pdCBpbiBjbGFuZyBhZGRlZCAtV3Rh
dXRvbG9naWNhbC1jb21wYXJlIHRvIC1XYWxsLCB3aGljaCBpcwo+PiA+IGVuYWJsZWQgZm9yIGk5
MTUgYWZ0ZXIgLVd0YXV0b2xvZ2ljYWwtY29tcGFyZSBpcyBkaXNhYmxlZCBmb3IgdGhlIHJlc3QK
Pj4gPiBvZiB0aGUga2VybmVsIHNvIHdlIHNlZSB0aGUgZm9sbG93aW5nIHdhcm5pbmcgb24geDg2
XzY0Ogo+PiA+Cj4+ID4gIC4uL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVj
YnVmZmVyLmM6MTQzMzoyMjogd2FybmluZzoKPj4gPiAgcmVzdWx0IG9mIGNvbXBhcmlzb24gb2Yg
Y29uc3RhbnQgNTc2NDYwNzUyMzAzNDIzNDg3IHdpdGggZXhwcmVzc2lvbiBvZgo+PiA+ICB0eXBl
ICd1bnNpZ25lZCBpbnQnIGlzIGFsd2F5cyBmYWxzZQo+PiA+ICBbLVd0YXV0b2xvZ2ljYWwtY29u
c3RhbnQtb3V0LW9mLXJhbmdlLWNvbXBhcmVdCj4+ID4gICAgICAgICAgaWYgKHVubGlrZWx5KHJl
bWFpbiA+IE5fUkVMT0MoVUxPTkdfTUFYKSkpCj4+ID4gICAgICAgICAgICAgfn5+fn5+fn5+fn5+
fn5+fl5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+PiA+ICAuLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVy
Lmg6Nzg6NDI6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ3VubGlrZWx5Jwo+PiA+ICAjIGRl
ZmluZSB1bmxpa2VseSh4KSAgICBfX2J1aWx0aW5fZXhwZWN0KCEhKHgpLCAwKQo+PiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+PiA+ICAxIHdhcm5pbmcg
Z2VuZXJhdGVkLgo+PiA+Cj4+ID4gSXQgaXMgbm90IHdyb25nIGluIHRoZSBjYXNlIHdoZXJlIFVM
T05HX01BWCA+IFVJTlRfTUFYIGJ1dCBpdCBkb2VzIG5vdAo+PiA+IGFjY291bnQgZm9yIHRoZSBj
YXNlIHdoZXJlIHRoaXMgZmlsZSBpcyBidWlsdCBmb3IgMzItYml0IHg4Niwgd2hlcmUKPj4gPiBV
TE9OR19NQVggPT0gVUlOVF9NQVggYW5kIHRoaXMgY2hlY2sgaXMgc3RpbGwgcmVsZXZhbnQuCj4+
ID4KPj4gPiBDYXN0IHJlbWFpbiB0byB1bnNpZ25lZCBsb25nLCB3aGljaCBrZWVwcyB0aGUgZ2Vu
ZXJhdGVkIGNvZGUgdGhlIHNhbWUKPj4gPiAodmVyaWZpZWQgd2l0aCBjbGFuZy0xMSBvbiB4ODZf
NjQgYW5kIEdDQyA5LjIuMCBvbiB4ODYgYW5kIHg4Nl82NCkgYW5kCj4+ID4gdGhlIHdhcm5pbmcg
aXMgc2lsZW5jZWQgc28gd2UgY2FuIGNhdGNoIG1vcmUgcG90ZW50aWFsIGlzc3VlcyBpbiB0aGUK
Pj4gPiBmdXR1cmUuCj4+ID4KPj4gPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWls
dExpbnV4L2xpbnV4L2lzc3Vlcy83NzgKPj4gPiBTdWdnZXN0ZWQtYnk6IE1pY2hlbCBEw6RuemVy
IDxtaWNoZWxAZGFlbnplci5uZXQ+Cj4+ID4gU2lnbmVkLW9mZi1ieTogTmF0aGFuIENoYW5jZWxs
b3IgPG5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4KPj4gCj4+IFdvcmtzIGZvciBtZSBhcyBhIHdv
cmthcm91bmQsCj4KPiBCdXQgdGhlIHdob2xlIHBvaW50IHdhcyB0aGF0IHRoZSBjb21waWxlciBj
b3VsZCBzZWUgdGhhdCBpdCB3YXMKPiBpbXBvc3NpYmxlIGFuZCBub3QgZW1pdCB0aGUgY29kZS4g
RG9lc24ndCB0aGlzIGJyZWFrIHRoYXQ/CgpJdCBzZWVtcyB0aGF0IGdvYWwgYW5kIHRoZSB3YXJu
aW5nIGFyZSBmdW5kYW1lbnRhbGx5IGluY29tcGF0aWJsZS4KCkJhY2sgdG8gdGhlIG9yaWdpbmFs
IHBhdGNoPwoKQlIsCkphbmkuCgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBH
cmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==

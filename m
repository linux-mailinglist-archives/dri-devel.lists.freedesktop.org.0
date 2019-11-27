Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FE710ADD3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 11:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233966E507;
	Wed, 27 Nov 2019 10:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198216E504;
 Wed, 27 Nov 2019 10:38:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 02:38:26 -0800
X-IronPort-AV: E=Sophos;i="5.69,249,1571727600"; d="scan'208";a="203034349"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 02:38:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, Adam Jackson <ajax@redhat.com>,
 "20191004215851.31446-1-shawn.c.lee\@intel.com"
 <20191004215851.31446-1-shawn.c.lee@intel.com>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: customize DPCD brightness control
 for specific panel
In-Reply-To: <ef19849f04e05f239c5459bc05a541412792fb58.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191004215851.31446-1-shawn.c.lee@intel.com>
 <33dcaf669eae3acfc3b716e68b69c0fe76dd2dbc.camel@redhat.com>
 <87d0fce4mh.fsf@intel.com>
 <D42A2A322A1FCA4089E30E9A9BA36AC65D6A9C66@PGSMSX111.gar.corp.intel.com>
 <877e5gj52f.fsf@intel.com>
 <75105bb4d3c4ea37aaf53144be5d644f998f3626.camel@redhat.com>
 <87pnj7h9wk.fsf@intel.com>
 <ef19849f04e05f239c5459bc05a541412792fb58.camel@redhat.com>
Date: Wed, 27 Nov 2019 12:38:20 +0200
Message-ID: <87muchob8j.fsf@intel.com>
MIME-Version: 1.0
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
Cc: "Chiou, Cooper" <cooper.chiou@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyNiBOb3YgMjAxOSwgTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4gd3JvdGU6
Cj4gSSdtIGFib3V0IHRvIHBvc3Qgc29tZSBtb3JlIHJldmlldyBjb21tZW50cyBmb3IgdGhlIHYy
IHZlcnNpb24gb2YgdGhpcywgYnV0Cj4gc29tZSBjb21tZW50cyBkb3duIGJlbG93Li4uCj4KPiBP
biBUdWUsIDIwMTktMTAtMDggYXQgMTI6MTkgKzAzMDAsIEphbmkgTmlrdWxhIHdyb3RlOgo+PiBP
biBNb24sIDA3IE9jdCAyMDE5LCBBZGFtIEphY2tzb24gPGFqYXhAcmVkaGF0LmNvbT4gd3JvdGU6
Cj4+ID4gT24gTW9uLCAyMDE5LTEwLTA3IGF0IDEyOjA4ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90
ZToKPj4gPiAKPj4gPiA+IFRoZSBwcm9ibGVtIHdpdGggdGhlIEVESUQgcXVpcmtzIGlzIHRoYXQg
ZXhwb3NpbmcgdGhlIHF1aXJrcyBzdGlja3Mgb3V0Cj4+ID4gPiBsaWtlIGEgc29yZSB0aHVtYi4g
VGh1cyBmYXIgYWxsIG9mIGl0IGhhcyBiZWVuIGNvbnRhaW5lZCBpbiBkcm1fZWRpZC5jCj4+ID4g
PiBhbmQgdGhleSBhZmZlY3QgaG93IHRoZSBFRElEIGdldHMgcGFyc2VkLCBmb3IgYWxsIGRyaXZl
cnMuIE9idmlvdXNseQo+PiA+ID4gdGhpcyBjb3VsZCBiZSBjaGFuZ2VkLCBidXQgaXMgaXQgdGhl
IHJpZ2h0IHRoaW5nIHRvIGRvPwo+PiA+ID4gCj4+ID4gPiBXaGF0IEkgc3VnZ2VzdGVkIHdhcywg
Y2hlY2sgdGhlIE9VSSBvbmx5LCBhbmQgaWYgaXQgbWF0Y2hlcywgZG8KPj4gPiA+IG1vcmUuIFBl
cmhhcHMgdGhlcmUncyBzb21ldGhpbmcgaW4gdGhlIDB4MzAwIHJhbmdlIG9mIERQQ0Qgb2Zmc2V0
cyB0aGF0Cj4+ID4gPiB5b3UgY2FuIHJlYWQ/IE9yIHBlcmhhcHMgeW91IG5lZWQgdG8gd3JpdGUg
dGhlIHNvdXJjZSBPVUkgZmlyc3QsIGFuZAo+PiA+ID4gdGhlbiBkbyB0aGF0Lgo+PiA+IAo+PiA+
IE15IGlzc3VlIGlzbid0IHJlYWxseSB3aXRoIGlkZW50aWZ5aW5nIHRoZSBwYW5lbCBmcm9tIEVE
SUQgcmF0aGVyIHRoYW4KPj4gPiBEUENELCB3aGljaGV2ZXIgaWRlbnRpZmllciBpcyBtb3N0IHNw
ZWNpZmljIGlzIHByb2JhYmx5IHRoZSBiZXN0IHRoaW5nCj4+ID4gdG8gdXNlLiBJdCdzIG1vcmUg
dGhhdCB0aGlzIHF1aXJrIGlzIGlkZW50aWZpZWQgaW4gY29tbW9uIGNvZGUgYnV0IG9ubHkKPj4g
PiBhcHBsaWVkIGluIG9uZSBkcml2ZXIuIElmIHRoaXMgcGFuZWwgd2VyZSBldmVyIHRvIGJlIGF0
dGFjaGVkIHRvIHNvbWUKPj4gPiBvdGhlciBzb3VyY2UsIHRoZXkgbWlnaHQgd2VsbCB3YW50IHRv
IGFwcGx5IHRoZSBzYW1lIGtpbmQgb2YgZml4LiBNeQo+PiA+IChhZG1pdHRlZGx5IG5hw692ZSkg
cmVhZGluZyBvZiB0aGUgT1VJIGhhbmRzaGFrZSBwcm9jZXNzIGlzIHRoYXQgd2hlbgo+PiA+IHRo
ZSBzb3VyY2UgZGV2aWNlIHdyaXRlcyBhbiBPVUkgdG8gRFBfU09VUkNFX09VSSBpdCBpcyB0ZWxs
aW5nIHRoZSBzaW5rCj4+ID4gIkknbSBhYm91dCB0byBpc3N1ZSBjb21tYW5kcyB0aGF0IGNvbmZv
cm0gdG8gX3RoaXNfIHZlbmRvcidzIG93bgo+PiA+IGNvbnZlbnRpb25zIi4gSWYgdGhhdCBjb252
ZW50aW9uIGNvbW11bmljYXRlcyBpbmZvcm1hdGlvbiB0aGF0IGlzCj4+ID4gZW50aXJlbHkgY29u
dGFpbmVkIHdpdGhpbiBBVVhDSCB0cmFuc2FjdGlvbnMgKGFuZCBkb2Vzbid0LCBmb3IgZXhhbXBs
ZSwKPj4gPiByZXF1aXJlIGxvb2tpbmcgYXQgc29tZSBvdGhlciBzdHJhcHBpbmcgcGluIG9yIGV4
dGVybmFsIGRldmljZSkgdGhlbiBpbgo+PiA+IHByaW5jaXBsZSBpdCBkb2Vzbid0IG1hdHRlciBp
ZiB0aGUgc291cmNlIGRldmljZSAibWF0Y2hlcyIgdGhhdCBPVUk7IGl0Cj4+ID4gd291bGQgYmUg
bGVnYWwgZm9yIGFuIEFNRCBHUFUgdG8gd3JpdGUgdGhlIHNhbWUgc2VxdWVuY2UgYW5kIGV4cGVj
dCB0aGUKPj4gPiBzYW1lIHJlYWN0aW9uLCBzaG91bGQgdGhhdCBwYW5lbCBiZSBhdHRhY2hlZCB0
byBhbiBBTUQgR1BVLgo+PiA+IAo+PiA+IFNvLCBpdCB3b3VsZCBiZSBuaWNlIHRvIGtub3cgZXhh
Y3RseSB3aGF0IHRoYXQgcHJvdG9jb2wgaXMgbWVhbnQgdG8gZG8sCj4+ID4gaWYgaXQgYXBwbGll
cyBvbmx5IHRvIHRoaXMgc3BlY2lmaWMgcGFuZWwgb3IgYW55dGhpbmcgZWxzZSB3aXRoIHRoZQo+
PiA+IHNhbWUgVENPTiwgaG93IG9uZSB3b3VsZCBpZGVudGlmeSBzdWNoIFRDT05zIGluIHRoZSB3
aWxkIG90aGVyIHRoYW4KPj4gPiBFRElELCBpZiBpdCByZWxpZXMgb24gYW4gZXh0ZXJuYWwgUFdN
IG9yIHNvbWV0aGluZywgZXRjLiBBbmQgaXQgbWlnaHQKPj4gPiBtYWtlIHNlbnNlIGZvciBub3cg
dG8gbWFrZSB0aGlzIGEgKHNodWRkZXIpIGRyaXZlci1zcGVjaWZpYyBFRElEIHF1aXJrCj4+ID4g
cmF0aGVyIHRoYW4gbWF0Y2ggYnkgRFBDRCwgYXQgbGVhc3QgdW50aWwgd2Uga25vdyBpZiB0aGUg
cGFuZWwgaXMgZXZlcgo+PiA+IHNlZW4gYXR0YWNoZWQgdG8gb3RoZXIgc291cmNlIGRldmljZXMg
YW5kIGlmIHRoZSBPVUkgY29udmVudGlvbiBpcwo+PiA+IHNlbGYtY29udGFpbmVkLgo+PiAKPj4g
VGhhbmtzIGZvciBjbGFyaWZ5aW5nLiBQcmV0dHkgbXVjaCBhZ3JlZWQsIHVuZm9ydHVuYXRlbHkg
YWxzbyBvbiB0aGUKPj4gIndvdWxkIGJlIG5pY2UgdG8ga25vdyBtb3JlIiBwYXJ0Li4uCj4+IAo+
PiBJZiB0aGlzIHdlcmUgdG8gYmUgYW4gRURJRCBxdWlyayBhZnRlciBhbGwsIEkgd29uZGVyIGlm
IGl0IHdvdWxkIGJlCj4+IGJldHRlciB0byBzdG9yZSB0aGUgcGFyc2VkIHF1aXJrcyB0bywgc2F5
LCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfaW5mbywgYW5kCj4+IGhhdmUgYSBkcm1fY29ubmVjdG9yX2hh
c19xdWlyaygpIGZ1bmN0aW9uIHNpbWlsYXIgdG8gZHJtX2RwX2hhc19xdWlyaygpLgo+PiAKPj4g
VGhpcyB3b3VsZCBhbHNvIGFsbG93IHVzIHRvIG5vdCByZXR1cm4gcXVpcmtzIGZyb20KPj4gZHJt
X2FkZF9kaXNwbGF5X2luZm8oKSwgd2hpY2ggd291bGQgYXJndWFibHkgY2xlYW4gdXAgdGhlIGlu
dGVyZmFjZS4KPgo+IERpZCBhbnlvbmUgY2hlY2sgaWYgdGhpcyBpcyBzcGVjaWZpZWQgaW4gdGhl
IHZiaW9zPyBUaGVyZSBhcHBlYXJzIHRvIGJlIGEKPiBmaWVsZCBkZWZpbmVkIGZvciB0aGlzIHJp
Z2h0Li4uCj4KPiBlbnVtIGludGVsX2JhY2tsaWdodF90eXBlIHsKPiAJSU5URUxfQkFDS0xJR0hU
X1BNSUMsCj4gCUlOVEVMX0JBQ0tMSUdIVF9MUFNTLAo+IAlJTlRFTF9CQUNLTElHSFRfRElTUExB
WV9EREksCj4gCUlOVEVMX0JBQ0tMSUdIVF9EU0lfRENTLAo+IAlJTlRFTF9CQUNLTElHSFRfUEFO
RUxfRFJJVkVSX0lOVEVSRkFDRSwgLyogPC0gLi4uIG92ZXIgaGVyZSAqLwo+IAlJTlRFTF9CQUNL
TElHSFRfVkVTQV9FRFBfQVVYX0lOVEVSRkFDRSwKPiB9OwoKV291bGQganVzdCBuZWVkIC9zeXMv
a2VybmVsL2RlYnVnL2RyaS8wL2k5MTVfdmJ0IG9uIHRoZSBhZmZlY3RlZCBtYWNoaW5lCnRvIGNo
ZWNrLgoKQlIsCkphbmkuCgo+Cj4+IAo+PiBCUiwKPj4gSmFuaS4KPj4gCj4+IAoKLS0gCkphbmkg
TmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

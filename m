Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31D13415E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 10:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3C8893A2;
	Tue,  4 Jun 2019 08:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679F1893A2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 08:15:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 01:15:00 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2019 01:14:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
Subject: Re: DRM/AST regression (likely 4.14 -> 4.19+),
 providing EDID manually fails
In-Reply-To: <20190604061511.GA22758@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <alpine.DEB.2.20.1905262211270.24390@whs-18.cs.helsinki.fi>
 <878surn919.wl-ashutosh.dixit@intel.com> <87sgsz593p.fsf@intel.com>
 <alpine.DEB.2.20.1905291127350.24401@whs-18.cs.helsinki.fi>
 <878sup5zmh.fsf@intel.com> <20190604061511.GA22758@intel.com>
Date: Tue, 04 Jun 2019 11:18:06 +0300
Message-ID: <874l554vcx.fsf@intel.com>
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, Dave Airlie <airlied@redhat.com>,
 Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwMyBKdW4gMjAxOSwgSGFyaXNoIENoZWdvbmRpIDxoYXJpc2guY2hlZ29uZGlAaW50
ZWwuY29tPiB3cm90ZToKPiBPbiBXZWQsIE1heSAyOSwgMjAxOSBhdCAwMToyMjozMFBNICswMzAw
LCBKYW5pIE5pa3VsYSB3cm90ZToKPj4gT24gV2VkLCAyOSBNYXkgMjAxOSwgSWxwbyBKw6Rydmlu
ZW4gPGlscG8uamFydmluZW5AY3MuaGVsc2lua2kuZmk+IHdyb3RlOgo+PiA+IE9uIFR1ZSwgMjgg
TWF5IDIwMTksIEphbmkgTmlrdWxhIHdyb3RlOgo+PiA+Cj4+ID4+IE9uIE1vbiwgMjcgTWF5IDIw
MTksIEFzaHV0b3NoIERpeGl0IDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+IHdyb3RlOgo+PiA+
PiA+IE9uIFN1biwgMjYgTWF5IDIwMTkgMTI6NTA6NTEgLTA3MDAsIElscG8gSsOkcnZpbmVuIHdy
b3RlOgo+PiA+PiA+Pgo+PiA+PiA+PiBIaSBhbGwsCj4+ID4+ID4+Cj4+ID4+ID4+IEkndmUgYSB3
b3Jrc3RhdGlvbiB3aGljaCBoYXMgaW50ZXJuYWwgVkdBIHRoYXQgaXMgZGV0ZWN0ZWQgYXMgQVNU
IDI0MDAgYW5kCj4+ID4+ID4+IHdpdGggaXQgRURJRCBoYXMgYmVlbiBhbHdheXMgcXVpdGUgZmxh
a3kgKGV4Y2VwdCBmb3Igc29tZSB0aW1lIGl0IHdvcmtlZAo+PiA+PiA+PiB3aXRoIDQuMTQgbG9u
ZyBlbm91Z2ggdGhhdCBJIHRob3VnaHQgdGhlIHByb2JsZW1zIHdvdWxkIGJlIHBhc3QgdW50aWwg
dGhlCj4+ID4+ID4+IHByb2JsZW1zIHJlYXBwZWFyZWQgYWxzbyB3aXRoIDQuMTQpLiBUaHVzLCBJ
J3ZlIHByb3ZpZGVkIG1hbnVhbGx5IHRoZSBFRElECj4+ID4+ID4+IHRoYXQgSSBleHRyYWN0ZWQg
ZnJvbSB0aGUgbW9uaXRvciB1c2luZyBvdGhlciBjb21wdXRlciAodGhlIG1vbml0b3IgaXRzZWxm
Cj4+ID4+ID4+IHdvcmtlZCBqdXN0IGZpbmUgb24gdGhlIGVhcmxpZXIgY29tcHV0ZXIgc28gaXQg
aXMgbGlrZWx5IGZpbmUpLgo+PiA+PiA+Pgo+PiA+PiA+PiBJIHNldHVwIHRoZSBtYW51YWwgRURJ
RCB1c2luZyBkcm1fa21zX2hlbHBlci5lZGlkX2Zpcm13YXJlLCBob3dldmVyLAo+PiA+PiA+PiBh
ZnRlciB1cGdyYWRpbmcgdG8gNC4xOS40NSBpdCBzdG9wcGVkIHdvcmtpbmcgKG5vICJHb3QgZXh0
ZXJuYWwgRURJRCBiYXNlCj4+ID4+ID4+IGJsb2NrIiBhcHBlYXJzIGluIGRtZXNnLCB0aGUgdGV4
dCBtb2RlIGlzIGtlcHQgaW4gdGhlIGxvd2VyIHJlcyBtb2RlLCBhbmQKPj4gPj4gPj4gWG9yZyBs
b2dzIG5vIGxvbmdlciBkdW1wcyB0aGUgRURJRCBpbmZvIGxpa2UgaXQgZGlkIHdpdGggNC4xNCku
IFNvIEkgZ3Vlc3MKPj4gPj4gPj4gdGhlIEVESUQgSSBwcm92aWRlZCBtYW51YWxseSBvbiB0aGUg
Y29tbWFuZCBsaW5lIGlzIG5vdCBjb3JyZWN0bHkgcHV0IGludG8KPj4gPj4gPj4gdXNlIHdpdGgg
NC4xOSsga2VybmVscy4KPj4gPj4gPj4KPj4gPj4gPj4gVGhlIDQuMTkgZG1lc2cgaW5kaWNhdGVk
IHRoYXQgZHJtX2ttc19oZWxwZXIuZWRpZF9maXJtd2FyZSBpcyBkZXByZWNhdGVkCj4+ID4+ID4+
IHNvIEkgYWxzbyB0ZXN0ZWQgd2l0aCBkcm0uZWRpZF9maXJtd2FyZSBpdCBzdWdnZXN0ZWQgYXMg
dGhlIHJlcGxhY2VtZW50Cj4+ID4+ID4+IGJ1dCB3aXRoIG5vIGx1Y2sgKGJ1dCBJIGJlbGlldmUg
YWxzbyB0aGUgZHJtX2ttc19oZWxwZXIgb25lIHNob3VsZCBoYXZlCj4+ID4+ID4+IHdvcmtlZCBh
cyBpdCB3YXMgb25seSAiZGVwcmVjYXRlZCIpLgo+PiA+PiA+Pgo+PiA+PiA+PiBJIGFsc28gdHJp
ZWQgNS4xLjIgYnV0IGl0IGRpZCBub3Qgd29yayBhbnkgYmV0dGVyIChhbmQgd2l0aCBpdCBhbHNv
IHRyaWVkCj4+ID4+ID4+IHJlbW92aW5nIGFsbCB0aGUgbWFudWFsICouZWRpZF9maXJtd2FyZSBm
cm9tIHRoZSBjb21tYW5kIGxpbmUgc28gSSBzdGlsbAo+PiA+PiA+PiBuZWVkIHRvIHByb3ZpZGUg
b25lIG1hbnVhbGx5IHRvIGhhdmUgaXQgcmVsaWFibGUgd29ya2luZyBpdCBzZWVtcykuCj4+ID4+
ID4KPj4gPj4gPiBJIGJlbGlldmUgdGhlcmUgaXMgYSBidWcgYWxyZWFkeSB0cmFja2luZyB0aGlz
LCBoZXJlOgo+PiA+PiA+Cj4+ID4+ID4gaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93
X2J1Zy5jZ2k/aWQ9MTA3NTgzCj4+ID4+IAo+PiA+PiBJbHBvLCBkb2VzIHZpZGVvPVZHQS0xOmUg
Y29tbWFuZC1saW5lIG9wdGlvbiB3b3JrIGFyb3VuZCB0aGUgcHJvYmxlbSBmb3IKPj4gPj4geW91
Pwo+PiA+Cj4+ID4gWWVzIGl0IGRvZXM7IHRvZ2V0aGVyIHdpdGggdGhlIG1vZGVsaW5lIHN0dWZm
IGZvciBYb3JnIChhZnRlciByZWFkaW5nIHRoZSAKPj4gPiByZWZlcmVuY2VkIGJ1ZyByZXBvcnQg
SSByZWFsaXplZCBJIGNhbiBmaXggdGhlIFggc2lkZSB3aXRoIGl0KS4gU28gSSBub3cgCj4+ID4g
aGF2ZSB0aGUgZGVzaXJlZCBtb2Rlcy9yZXNvbHV0aW9ucyBpbiB1c2UuIFRoYW5rIHlvdSBhbGwh
Cj4+IAo+PiBHcmVhdCEgSXQgc2hvdWxkIGJlIGVub3VnaCB0byBqdXN0IGhhdmUgdGhlIHJlcGxh
Y2VtZW50IGZpcm13YXJlIEVESUQKPj4gZm9yIHRoZSBtb2RlcywgYXMgbG9uZyBhcyB5b3UgaGF2
ZSBhbiBFRElEIHRoYXQgcmVwcmVzZW50cyB0aGUKPj4gY2FwYWJpbGl0aWVzIG9mIHRoZSBkaXNw
bGF5LiBUaGUgbW9kZWxpbmVzIGZvciBYb3JnIHNob3VsZCBub3QgYmUKPj4gbmVlZGVkLgo+PiAK
Pj4gQlIsCj4+IEphbmkuCj4+IAo+Cj4gSWxwbywKPgo+IEkgaGF2ZSBhIHBhdGNoIHdoaWNoIEkg
dGhpbmsgd2lsbCBmaXggdGhpcyBwcm9ibGVtIHdpdGhvdXQgbmVlZGluZwo+IHRoZSB2aWRlbz1W
R0EtMTplIGNvbW1hbmQtbGluZSBvcHRpb24gd29yayBhcm91bmQuIFdpbGwgeW91IGJlIGFibGUg
dG8KPiBoZWxwIG1lIHdpdGggdGVzdGluZyBpdCBvbiB5b3VyIHN5c3RlbT8KCkFsYXMgdGhlIHBh
dGNoIHlvdSBwcm92aWRlZCBpbiB0aGUgcmVmZXJlbmNlZCBidWd6aWxsYSB3aWxsIHJlZ3Jlc3Mg
aW4Kb3RoZXIgd2F5czsgc3BlY2lmaWNhbGx5IGxvc2luZyB0aGUgYWJpbGl0eSB0byB1c2UgRERD
IHByb2JlIGZvcgpkZXRlY3RpbmcgZGlzcGxheXMuIFRoaXMgaXMgdmVyeSBvbGQgaGFwcHkgZGF5
IHNjZW5hcmlvIGZ1bmN0aW9uYWxpdHkKdGhhdCBzaG91bGQgbm90IGJlIG1lc3NlZCB3aXRoLgoK
QlIsCkphbmkuCgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBD
ZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

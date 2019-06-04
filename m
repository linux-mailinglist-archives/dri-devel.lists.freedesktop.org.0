Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6D033EDD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 08:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84510895A8;
	Tue,  4 Jun 2019 06:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FAE895A8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 06:15:12 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 23:15:11 -0700
X-ExtLoop1: 1
Received: from hchegond-ivm.ra.intel.com (HELO intel.com) ([10.54.134.59])
 by fmsmga008.fm.intel.com with ESMTP; 03 Jun 2019 23:15:11 -0700
Date: Mon, 3 Jun 2019 23:15:11 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: DRM/AST regression (likely 4.14 -> 4.19+), providing EDID
 manually fails
Message-ID: <20190604061511.GA22758@intel.com>
References: <alpine.DEB.2.20.1905262211270.24390@whs-18.cs.helsinki.fi>
 <878surn919.wl-ashutosh.dixit@intel.com> <87sgsz593p.fsf@intel.com>
 <alpine.DEB.2.20.1905291127350.24401@whs-18.cs.helsinki.fi>
 <878sup5zmh.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878sup5zmh.fsf@intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@cs.helsinki.fi>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMDE6MjI6MzBQTSArMDMwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gV2VkLCAyOSBNYXkgMjAxOSwgSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5A
Y3MuaGVsc2lua2kuZmk+IHdyb3RlOgo+ID4gT24gVHVlLCAyOCBNYXkgMjAxOSwgSmFuaSBOaWt1
bGEgd3JvdGU6Cj4gPgo+ID4+IE9uIE1vbiwgMjcgTWF5IDIwMTksIEFzaHV0b3NoIERpeGl0IDxh
c2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+IHdyb3RlOgo+ID4+ID4gT24gU3VuLCAyNiBNYXkgMjAx
OSAxMjo1MDo1MSAtMDcwMCwgSWxwbyBKw6RydmluZW4gd3JvdGU6Cj4gPj4gPj4KPiA+PiA+PiBI
aSBhbGwsCj4gPj4gPj4KPiA+PiA+PiBJJ3ZlIGEgd29ya3N0YXRpb24gd2hpY2ggaGFzIGludGVy
bmFsIFZHQSB0aGF0IGlzIGRldGVjdGVkIGFzIEFTVCAyNDAwIGFuZAo+ID4+ID4+IHdpdGggaXQg
RURJRCBoYXMgYmVlbiBhbHdheXMgcXVpdGUgZmxha3kgKGV4Y2VwdCBmb3Igc29tZSB0aW1lIGl0
IHdvcmtlZAo+ID4+ID4+IHdpdGggNC4xNCBsb25nIGVub3VnaCB0aGF0IEkgdGhvdWdodCB0aGUg
cHJvYmxlbXMgd291bGQgYmUgcGFzdCB1bnRpbCB0aGUKPiA+PiA+PiBwcm9ibGVtcyByZWFwcGVh
cmVkIGFsc28gd2l0aCA0LjE0KS4gVGh1cywgSSd2ZSBwcm92aWRlZCBtYW51YWxseSB0aGUgRURJ
RAo+ID4+ID4+IHRoYXQgSSBleHRyYWN0ZWQgZnJvbSB0aGUgbW9uaXRvciB1c2luZyBvdGhlciBj
b21wdXRlciAodGhlIG1vbml0b3IgaXRzZWxmCj4gPj4gPj4gd29ya2VkIGp1c3QgZmluZSBvbiB0
aGUgZWFybGllciBjb21wdXRlciBzbyBpdCBpcyBsaWtlbHkgZmluZSkuCj4gPj4gPj4KPiA+PiA+
PiBJIHNldHVwIHRoZSBtYW51YWwgRURJRCB1c2luZyBkcm1fa21zX2hlbHBlci5lZGlkX2Zpcm13
YXJlLCBob3dldmVyLAo+ID4+ID4+IGFmdGVyIHVwZ3JhZGluZyB0byA0LjE5LjQ1IGl0IHN0b3Bw
ZWQgd29ya2luZyAobm8gIkdvdCBleHRlcm5hbCBFRElEIGJhc2UKPiA+PiA+PiBibG9jayIgYXBw
ZWFycyBpbiBkbWVzZywgdGhlIHRleHQgbW9kZSBpcyBrZXB0IGluIHRoZSBsb3dlciByZXMgbW9k
ZSwgYW5kCj4gPj4gPj4gWG9yZyBsb2dzIG5vIGxvbmdlciBkdW1wcyB0aGUgRURJRCBpbmZvIGxp
a2UgaXQgZGlkIHdpdGggNC4xNCkuIFNvIEkgZ3Vlc3MKPiA+PiA+PiB0aGUgRURJRCBJIHByb3Zp
ZGVkIG1hbnVhbGx5IG9uIHRoZSBjb21tYW5kIGxpbmUgaXMgbm90IGNvcnJlY3RseSBwdXQgaW50
bwo+ID4+ID4+IHVzZSB3aXRoIDQuMTkrIGtlcm5lbHMuCj4gPj4gPj4KPiA+PiA+PiBUaGUgNC4x
OSBkbWVzZyBpbmRpY2F0ZWQgdGhhdCBkcm1fa21zX2hlbHBlci5lZGlkX2Zpcm13YXJlIGlzIGRl
cHJlY2F0ZWQKPiA+PiA+PiBzbyBJIGFsc28gdGVzdGVkIHdpdGggZHJtLmVkaWRfZmlybXdhcmUg
aXQgc3VnZ2VzdGVkIGFzIHRoZSByZXBsYWNlbWVudAo+ID4+ID4+IGJ1dCB3aXRoIG5vIGx1Y2sg
KGJ1dCBJIGJlbGlldmUgYWxzbyB0aGUgZHJtX2ttc19oZWxwZXIgb25lIHNob3VsZCBoYXZlCj4g
Pj4gPj4gd29ya2VkIGFzIGl0IHdhcyBvbmx5ICJkZXByZWNhdGVkIikuCj4gPj4gPj4KPiA+PiA+
PiBJIGFsc28gdHJpZWQgNS4xLjIgYnV0IGl0IGRpZCBub3Qgd29yayBhbnkgYmV0dGVyIChhbmQg
d2l0aCBpdCBhbHNvIHRyaWVkCj4gPj4gPj4gcmVtb3ZpbmcgYWxsIHRoZSBtYW51YWwgKi5lZGlk
X2Zpcm13YXJlIGZyb20gdGhlIGNvbW1hbmQgbGluZSBzbyBJIHN0aWxsCj4gPj4gPj4gbmVlZCB0
byBwcm92aWRlIG9uZSBtYW51YWxseSB0byBoYXZlIGl0IHJlbGlhYmxlIHdvcmtpbmcgaXQgc2Vl
bXMpLgo+ID4+ID4KPiA+PiA+IEkgYmVsaWV2ZSB0aGVyZSBpcyBhIGJ1ZyBhbHJlYWR5IHRyYWNr
aW5nIHRoaXMsIGhlcmU6Cj4gPj4gPgo+ID4+ID4gaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9MTA3NTgzCj4gPj4gCj4gPj4gSWxwbywgZG9lcyB2aWRlbz1WR0Et
MTplIGNvbW1hbmQtbGluZSBvcHRpb24gd29yayBhcm91bmQgdGhlIHByb2JsZW0gZm9yCj4gPj4g
eW91Pwo+ID4KPiA+IFllcyBpdCBkb2VzOyB0b2dldGhlciB3aXRoIHRoZSBtb2RlbGluZSBzdHVm
ZiBmb3IgWG9yZyAoYWZ0ZXIgcmVhZGluZyB0aGUgCj4gPiByZWZlcmVuY2VkIGJ1ZyByZXBvcnQg
SSByZWFsaXplZCBJIGNhbiBmaXggdGhlIFggc2lkZSB3aXRoIGl0KS4gU28gSSBub3cgCj4gPiBo
YXZlIHRoZSBkZXNpcmVkIG1vZGVzL3Jlc29sdXRpb25zIGluIHVzZS4gVGhhbmsgeW91IGFsbCEK
PiAKPiBHcmVhdCEgSXQgc2hvdWxkIGJlIGVub3VnaCB0byBqdXN0IGhhdmUgdGhlIHJlcGxhY2Vt
ZW50IGZpcm13YXJlIEVESUQKPiBmb3IgdGhlIG1vZGVzLCBhcyBsb25nIGFzIHlvdSBoYXZlIGFu
IEVESUQgdGhhdCByZXByZXNlbnRzIHRoZQo+IGNhcGFiaWxpdGllcyBvZiB0aGUgZGlzcGxheS4g
VGhlIG1vZGVsaW5lcyBmb3IgWG9yZyBzaG91bGQgbm90IGJlCj4gbmVlZGVkLgo+IAo+IEJSLAo+
IEphbmkuCj4gCgpJbHBvLAoKSSBoYXZlIGEgcGF0Y2ggd2hpY2ggSSB0aGluayB3aWxsIGZpeCB0
aGlzIHByb2JsZW0gd2l0aG91dCBuZWVkaW5nCnRoZSB2aWRlbz1WR0EtMTplIGNvbW1hbmQtbGlu
ZSBvcHRpb24gd29yayBhcm91bmQuIFdpbGwgeW91IGJlIGFibGUgdG8KaGVscCBtZSB3aXRoIHRl
c3RpbmcgaXQgb24geW91ciBzeXN0ZW0/CgpUaGFuayBZb3UhCkhhcmlzaC4KCj4gCj4gLS0gCj4g
SmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl77+9WwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

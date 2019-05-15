Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4C21F70B
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 17:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21525891DD;
	Wed, 15 May 2019 15:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B874589308;
 Wed, 15 May 2019 15:01:39 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A43BA80570;
 Wed, 15 May 2019 17:01:37 +0200 (CEST)
Date: Wed, 15 May 2019 17:01:36 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v5 05/11] drm/fb-helper: Remove drm_fb_helper_crtc
Message-ID: <20190515150136.GA2282@ravnborg.org>
References: <20190506180139.6913-1-noralf@tronnes.org>
 <20190506180139.6913-6-noralf@tronnes.org>
 <20190515090432.GA31712@ravnborg.org>
 <fd69d05d-0634-15cc-18e6-8c81c82aafef@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd69d05d-0634-15cc-18e6-8c81c82aafef@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10
 a=9TprxE-lugoLI0hNTqkA:9 a=wPNLvfGTeEIA:10
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLgoKT24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDQ6NTE6MDRQTSArMDIwMCwgTm9y
YWxmIFRyw7hubmVzIHdyb3RlOgo+IEhpIFNhbSwKPiAKPiBbbG9va3MgbGlrZSBUaHVuZGViaXJk
IGRlY2lkZWQgdG8gdGhyb3cgYXdheSBteSByZXBseSwgc28gSSdsbCB0cnkgYWdhaW5dCkkgZ3Vl
c3MgaXQgYXdhaXRzIG1vZGVyYXRvciBhcHByb3ZhbCBhcyB0aGUgZnJvbSBhZGRyZXNzIHdhcyBk
aWZmZXJlbnQKZnJvbSB3aGF0IHlvdSBvdGhlcndpc2UgdXNlZCAtIEkgZ290IGJvdGggbWFpbHMu
Cgo+IAo+IERlbiAxNS4wNS4yMDE5IDExLjA0LCBza3JldiBTYW0gUmF2bmJvcmc6Cj4gPiBIaSBO
b3JhbGYuCj4gPiAKPiA+IEkgaGF2ZSByZWFkIHRocm91Z2ggdGhlIGNhaG5lcyBhIGNvcHVwbGUg
b2YgdGltZXMgbm90IGFuZCBmZWVsIGNvbmZpZGVudAo+ID4gdG8gYWRkIG15IHItYiBpZiB0aGUg
Y29tbWVudHMgYXJlIGNvbnNpZGVyZWQuCj4gPiAKPiA+IE9uIE1vbiwgTWF5IDA2LCAyMDE5IGF0
IDA4OjAxOjMzUE0gKzAyMDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPiA+PiBJdCBub3cgb25s
eSBjb250YWlucyB0aGUgbW9kZXNldCBzbyB1c2UgdGhhdCBkaXJlY3RseSBpbnN0ZWFkIGFuZCBh
dHRhY2gKPiA+PiBhIG1vZGVzZXQgYXJyYXkgdG8gZHJtX2NsaWVudF9kZXYuIGRybV9mYl9oZWxw
ZXIgd2lsbCB1c2UgdGhpcyBhcnJheS4KPiA+PiBDb2RlIHdpbGwgbGF0ZXIgYmUgbW92ZWQgdG8g
ZHJtX2NsaWVudCwgc28gYWRkIGNvZGUgdGhlcmUgaW4gYSBuZXcgZmlsZQo+ID4+IGRybV9jbGll
bnRfbW9kZXNldC5jIHdpdGggTUlUIGxpY2Vuc2UgdG8gbWF0Y2ggZHJtX2ZiX2hlbHBlci5jLgo+
ID4gCj4gPiBUaGUgZmlyc3QgcGFydCBvZiB0aGlzIGNvbW1pdCBsb2cgY291bGQgdXNlIHNvbWUg
cmUtcGhhcnNpbmcuCj4gPiBXaGF0IGlzICJJdCIgZXRjLgo+ID4gCj4gCj4gSSBjb3VsZCBkbyB0
aGlzOgo+IAo+IHN0cnVjdCBkcm1fZmJfaGVscGVyX2NydGMgaXMgbm93IGp1c3QgYSB3cmFwcGVy
IGFyb3VuZCBkcm1fbW9kZV9zZXQgc28KPiB1c2UgdGhhdCBkaXJlY3RseSBpbnN0ZWFkIGFuZCBh
dHRhY2ggaXQgYXMgYSBtb2Rlc2V0IGFycmF5IG9udG8KPiBkcm1fY2xpZW50X2Rldi4gZHJtX2Zi
X2hlbHBlciB3aWxsIHVzZSB0aGlzIGFycmF5IHRvIHN0b3JlIGl0cyBtb2Rlc2V0cwo+IHdoaWNo
IG1lYW5zIGl0IHdpbGwgYWx3YXlzIGluaXRpYWxpemUgYSBkcm1fY2xpZW50LCBidXQgaXQgd2ls
bCBub3QKPiByZWdpc3RlciB0aGUgY2xpZW50IChjYWxsYmFja3MpIHVubGVzcyBpdCdzIHRoZSBn
ZW5lcmljIGZiZGV2IGVtdWxhdGlvbi4KVGhpcyBpcyBtdWNoIGJldHRlciAtIHRoYW5rcy4KCj4g
Cj4gPj4gQEAgLTUzMiw4ICs1MzUsNyBAQCBzdGF0aWMgaW50IHJlc3RvcmVfZmJkZXZfbW9kZV9s
ZWdhY3koc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlcikKPiA+PiAgCQkJCQkJICAgIERS
TV9NT0RFX1JPVEFURV8wKTsKPiA+PiAgCX0KPiA+PiAgCj4gPj4gLQlmb3IgKGkgPSAwOyBpIDwg
ZmJfaGVscGVyLT5jcnRjX2NvdW50OyBpKyspIHsKPiA+PiAtCQlzdHJ1Y3QgZHJtX21vZGVfc2V0
ICptb2RlX3NldCA9ICZmYl9oZWxwZXItPmNydGNfaW5mb1tpXS5tb2RlX3NldDsKPiA+PiArCWRy
bV9jbGllbnRfZm9yX2VhY2hfbW9kZXNldChtb2RlX3NldCwgY2xpZW50KSB7Cj4gPj4gIAkJc3Ry
dWN0IGRybV9jcnRjICpjcnRjID0gbW9kZV9zZXQtPmNydGM7Cj4gPj4gIAo+ID4+ICAJCWlmIChj
cnRjLT5mdW5jcy0+Y3Vyc29yX3NldDIpIHsKPiA+IFRoaXMgZnVuY3Rpb24gcmVxdWlyZXMgbW9k
ZXNldF9tdXRleCB0byBiZSBoZWxkLiBNYXliZSBhZGQgY29tbWVudD8KPiA+IAo+IAo+IGRybV9j
bGllbnRfZm9yX2VhY2hfbW9kZXNldCgpIGhhcyBhIGxvY2tkZXAgd2FybiAoY291cnRlc3kgb2Yg
RGFuaWVsCj4gVmV0dGVyKToKPiAKPiAjZGVmaW5lIGRybV9jbGllbnRfZm9yX2VhY2hfbW9kZXNl
dChtb2Rlc2V0LCBjbGllbnQpIFwKPiAJZm9yICgoeyBsb2NrZGVwX2Fzc2VydF9oZWxkKCYoY2xp
ZW50KS0+bW9kZXNldF9tdXRleCk7IH0pLCBcCj4gCSAgICAgbW9kZXNldCA9IChjbGllbnQpLT5t
b2Rlc2V0czsgbW9kZXNldC0+Y3J0YzsgbW9kZXNldCsrKQo+IAo+ID4+IEBAIC0xODQyLDcgKzE4
MDUsNyBAQCBzdGF0aWMgaW50IHBhbl9kaXNwbGF5X2F0b21pYyhzdHJ1Y3QgZmJfdmFyX3NjcmVl
bmluZm8gKnZhciwKPiA+PiAgCj4gPj4gIAlwYW5fc2V0KGZiX2hlbHBlciwgdmFyLT54b2Zmc2V0
LCB2YXItPnlvZmZzZXQpOwo+ID4+ICAKPiA+PiAtCXJldCA9IHJlc3RvcmVfZmJkZXZfbW9kZV9h
dG9taWMoZmJfaGVscGVyLCB0cnVlKTsKPiA+PiArCXJldCA9IHJlc3RvcmVfZmJkZXZfbW9kZV9m
b3JjZShmYl9oZWxwZXIpOwo+ID4gVGhpcyBjaGFuZ2UgbG9va3MgYWxpZW4gY29tcGFyZWQgdG8g
b3RoZXIgY2hhbmdlcy4KPiA+IERvZXMgaXQgYmVsb25nIHRvIHRoaXMgcGF0Y2hzZXQ/Cj4gPiAK
PiAKPiBJdCdzIG1lbnRpb25lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2U6Cj4gCj4gSW4gcGFuX2Rp
c3BsYXlfYXRvbWljKCkgcmVzdG9yZV9mYmRldl9tb2RlX2ZvcmNlKCkgaXMgdXNlZCBpbnN0ZWFk
IG9mCj4gcmVzdG9yZV9mYmRldl9tb2RlX2F0b21pYygpIGJlY2F1c2UgdGhhdCBvbmUgd2lsbCBs
YXRlciBiZWNvbWUgaW50ZXJuYWwKPiB0byBkcm1fY2xpZW50X21vZGVzZXQuClJpZ2h0LCBJIGZv
cmdvdCBhYm91dCB0aGlzIGRldGFpbCBmcm9tIHRoZSBjb21taXQgbG9nLgoKCVNhbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

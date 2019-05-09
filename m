Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4501B189C6
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 14:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EC589B66;
	Thu,  9 May 2019 12:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEE689B66;
 Thu,  9 May 2019 12:31:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2019 05:31:09 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 09 May 2019 05:31:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Drake <drake@endlessm.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH] i915: disable framebuffer compression on GeminiLake
In-Reply-To: <CAD8Lp462rLGnnTLCSOoMWwU37bxCk1cznsw8==Z8AgumeqHXkQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190423092810.28359-1-jian-hong@endlessm.com>
 <155613593248.25205.769591454199358982@skylake-alporthouse-com>
 <15be67b19d898ab74c9ae6d9d9080ef339772e00.camel@intel.com>
 <CAD8Lp462rLGnnTLCSOoMWwU37bxCk1cznsw8==Z8AgumeqHXkQ@mail.gmail.com>
Date: Thu, 09 May 2019 15:33:12 +0300
Message-ID: <87ftpnlsdz.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jian-Hong Pan <jian-hong@endlessm.com>,
 Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAwOSBNYXkgMjAxOSwgRGFuaWVsIERyYWtlIDxkcmFrZUBlbmRsZXNzbS5jb20+IHdy
b3RlOgo+IEhpLAo+Cj4KPiBPbiBUaHUsIEFwciAyNSwgMjAxOSBhdCA0OjI3IEFNIFBhdWxvIFph
bm9uaSA8cGF1bG8uci56YW5vbmlAaW50ZWwuY29tPiB3cm90ZToKPj4KPj4gRW0gcXVhLCAyMDE5
LTA0LTI0IMOgcyAyMDo1OCArMDEwMCwgQ2hyaXMgV2lsc29uIGVzY3JldmV1Ogo+PiA+IFF1b3Rp
bmcgSmlhbi1Ib25nIFBhbiAoMjAxOS0wNC0yMyAxMDoyODoxMCkKPj4gPiA+IEZyb206IERhbmll
bCBEcmFrZSA8ZHJha2VAZW5kbGVzc20uY29tPgo+PiA+ID4KPj4gPiA+IE9uIG1hbnkgKGFsbD8p
IHRoZSBHZW1pbmkgTGFrZSBzeXN0ZW1zIHdlIHdvcmsgd2l0aCwgdGhlcmUgaXMgZnJlcXVlbnQK
Pj4gPiA+IG1vbWVudGFyeSBncmFwaGljYWwgY29ycnVwdGlvbiBhdCB0aGUgdG9wIG9mIHRoZSBz
Y3JlZW4sIGFuZCBpdCBzZWVtcwo+PiA+ID4gdGhhdCBkaXNhYmxpbmcgZnJhbWVidWZmZXIgY29t
cHJlc3Npb24gY2FuIGF2b2lkIHRoaXMuCj4+ID4gPgo+PiA+ID4gVGhlIHRpY2tldCB3YXMgcmVw
b3J0ZWQgNiBtb250aHMgYWdvIGFuZCBoYXMgYWxyZWFkeSBhZmZlY3RlZCBhCj4+ID4gPiBtdWx0
aXR1ZGUgb2YgdXNlcnMsIHdpdGhvdXQgYW55IHJlYWwgcHJvZ3Jlc3MgYmVpbmcgbWFkZS4gU28s
IGxldHMKPj4gPiA+IGRpc2FibGUgZnJhbWVidWZmZXIgY29tcHJlc3Npb24gb24gR2VtaW5pTGFr
ZSB1bnRpbCBhIHNvbHV0aW9uIGlzIGZvdW5kLgo+PiA+ID4KPj4gPiA+IEJ1Z2xpbms6IGh0dHBz
Oi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwODA4NQo+PiA+ID4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIERyYWtlIDxkcmFrZUBlbmRsZXNzbS5jb20+Cj4+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKaWFuLUhvbmcgUGFuIDxqaWFuLWhvbmdAZW5kbGVzc20uY29tPgo+PiA+Cj4+
ID4gRml4ZXM6IGZkN2Q2YzVjOGYzZSAoImRybS9pOTE1OiBlbmFibGUgRkJDIG9uIGdlbjkrIHRv
byIpID8KPj4gPiBDYzogUGF1bG8gWmFub25pIDxwYXVsby5yLnphbm9uaUBpbnRlbC5jb20+Cj4+
ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4+ID4gQ2M6IEph
bmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+Cj4+ID4gQ2M6IDxzdGFibGVA
dmdlci5rZXJuZWwub3JnPiAjIHY0LjExKwo+PiA+Cj4+ID4gZ2xrIGxhbmRlZCAxIG1vbnRoIGJl
Zm9yZSwgc28gdGhhdCBzZWVtcyB0aGUgZWFybGllc3QgYnJva2VuIHBvaW50Lgo+PiA+Cj4+Cj4+
IFRoZSBidWcgaXMgd2VsbCByZXBvcnRlZCwgdGhlIGJ1ZyBhdXRob3IgaXMgaGVscGZ1bCBhbmQg
aXQgZXZlbiBoYXMgYQo+PiBkZXNjcmlwdGlvbiBvZiAic3RlcHMgdG8gcmVwcm9kdWNlIiB0aGF0
IGxvb2tzIHZlcnkgZWFzeSAoYWx0aG91Z2ggSQo+PiBkaWRuJ3QgdHJ5IGl0KS4gRXZlcnl0aGlu
ZyBzdWdnZXN0cyB0aGlzIGlzIGEgYnVnIHRoZSBkaXNwbGF5IHRlYW0KPj4gY291bGQgYWN0dWFs
bHkgc29sdmUgd2l0aCBub3Qtc28tbWFueSBob3VycyBvZiBkZWJ1Z2dpbmcuCj4+Cj4+IEluIHRo
ZSBtZWFudGltZSwgdW5icmVhayB0aGUgc3lzdGVtczoKPj4gUmV2aWV3ZWQtYnk6IFBhdWxvIFph
bm9uaSA8cGF1bG8uci56YW5vbmlAaW50ZWwuY29tPgo+Cj4gUXVpY2sgcGluZyBoZXJlLiBBbnkg
ZnVydGhlciBjb21tZW50cyBvbiB0aGlzIHBhdGNoPyBDYW4gaXQgYmUgYXBwbGllZD8KClB1c2hl
ZCBub3csIHRoYW5rcy4gTmVlZGVkIHRvIGdldCBhIGNsZWFuIENJIHJlc3VsdCwgYW5kIEkgZHJv
cHBlZCB0aGUKYmFsbCBhIGJpdCB0aGVyZSwgc29ycnkuCgpCUiwKSmFuaS4KCi0tIApKYW5pIE5p
a3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

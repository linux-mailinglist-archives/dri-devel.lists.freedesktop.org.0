Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1746EAE0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 20:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B39F6E84B;
	Fri, 19 Jul 2019 18:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA876E84B;
 Fri, 19 Jul 2019 18:56:46 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 11:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,283,1559545200"; d="scan'208";a="168633222"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 19 Jul 2019 11:56:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 19 Jul 2019 21:56:42 +0300
Date: Fri, 19 Jul 2019 21:56:42 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/vblank: Document and fix vblank
 count barrier semantics
Message-ID: <20190719185642.GU5942@intel.com>
References: <20190719152314.7706-1-daniel.vetter@ffwll.ch>
 <20190719170654.GQ5942@intel.com>
 <CAKMK7uFmF7sMoJj=1C+70nyd5rMoan20hAGb2gtY4o0D8Y4cOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFmF7sMoJj=1C+70nyd5rMoan20hAGb2gtY4o0D8Y4cOQ@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDg6MzM6NDlQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIEp1bCAxOSwgMjAxOSBhdCA3OjA2IFBNIFZpbGxlIFN5cmrDpGzDpAo+
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBK
dWwgMTksIDIwMTkgYXQgMDU6MjM6MTJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+
ID4gTm90aWNlZCB3aGlsZSByZXZpZXdpbmcgY29kZS4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhp
cyBtaWdodCBvciBtaWdodAo+ID4gPiBub3QgZXhwbGFpbiBzb21lIG9mIHRoZSBtaXNzZWQgdmJs
YW5rIGhpbGFyaXR5IHdlJ3ZlIGJlZW4gc2VlaW5nLiBJCj4gPiA+IHRoaW5rIHRob3NlIGFsbCBn
byB0aHJvdWdoIHRoZSB2YmxhbmsgY29tcGxldGlvbiBldmVudCwgd2hpY2ggaGFzCj4gPiA+IHVu
Y29uZGl0aW9uYWwgYmFycmllcnMgLSBpdCBhbHdheXMgdGFrZXMgdGhlIHNwaW5sb2NrLiBUaGVy
ZWZvcmUgbm8KPiA+ID4gY2Mgc3RhYmxlLgo+ID4gPgo+ID4gPiB2MjoKPiA+ID4gLSBCYXJycmll
cnMgYXJlIGhhcmQsIHB1dCB0aGVtIGluIGluIHRoZSByaWdodCBvcmRlciAoQ2hyaXMpLgo+ID4g
PiAtIEltcHJvdmUgdGhlIGNvbW1lbnRzIGEgYml0Lgo+ID4gPgo+ID4gPiBDYzogUm9kcmlnbyBT
aXF1ZWlyYSA8cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFpbC5jb20+Cj4gPiA+IENjOiBDaHJpcyBX
aWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJp
dmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQo+ID4gPiAgaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oICAgICB8IDEzICsrKysr
KysrKysrLQo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92Ymxh
bmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiA+ID4gaW5kZXggNjAzYWIxMDUx
MjVkLi5lYjJhODMwNDUzNmMgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
dmJsYW5rLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+ID4gPiBA
QCAtMjk1LDExICsyOTUsMjMgQEAgc3RhdGljIHZvaWQgZHJtX3VwZGF0ZV92YmxhbmtfY291bnQo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBpcGUsCj4gPiA+ICBzdGF0aWMg
dTY0IGRybV92YmxhbmtfY291bnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50
IHBpcGUpCj4gPiA+ICB7Cj4gPiA+ICAgICAgIHN0cnVjdCBkcm1fdmJsYW5rX2NydGMgKnZibGFu
ayA9ICZkZXYtPnZibGFua1twaXBlXTsKPiA+ID4gKyAgICAgdTY0IGNvdW50Owo+ID4gPgo+ID4g
PiAgICAgICBpZiAoV0FSTl9PTihwaXBlID49IGRldi0+bnVtX2NydGNzKSkKPiA+ID4gICAgICAg
ICAgICAgICByZXR1cm4gMDsKPiA+ID4KPiA+ID4gLSAgICAgcmV0dXJuIHZibGFuay0+Y291bnQ7
Cj4gPiA+ICsgICAgIGNvdW50ID0gdmJsYW5rLT5jb3VudDsKPiA+Cj4gPiBIbW0uIFRoaXMgaXMg
bm93IGEgNjRiaXQgcXVhbnRpdHksIHdoaWNoIG1lYW5zIG9uIDMyYml0IHRoZSBsb2FkL3N0b3Jl
Cj4gPiB3b24ndCBiZSBhdG9taWMuIFRoYXQgZG9lc24ndCBzZWVtIHBhcnRpY3VsYXJseSBncmVh
dC4KPiAKPiBIbSAuLi4gc28gcmVhZC1zaWRlIHNlcW5vIGhlcmU/IEF0IGxlYXN0IGZvciAzMmJp
dCwgYnV0IG5vdCBzdXJlCj4gdGhhdCdzIHdvcnRoIGl0LCBwcm9iYWJseSBzaW1wbGVyIHRvIGp1
c3QgZG8gaXQgdW5jb25kaXRpb25hbGx5LgoKT3IgbWFrZSBpdCBhdG9taWM2NF90IHBlcmhhcHM/
Cgo+IE90b2gKPiAuLi4gZG8gd2UgY2FyZT8gVGhpcyBtYXR0ZXJzIGxpa2Ugb25jZSBldmVyeSBl
dmVyeSB5ZWFyIGF0IDEyMEh6IC4uLgoKRHVubm8uIE1pZ2h0IGF2b2lkIGEgZmV3IG9kZCBidWcg
cmVwb3J0cyBtYXliZS4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

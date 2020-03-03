Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1B3177E34
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 19:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AD66E933;
	Tue,  3 Mar 2020 18:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE536E933
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 18:02:04 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 10:02:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="233714477"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 03 Mar 2020 10:02:00 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 03 Mar 2020 20:01:59 +0200
Date: Tue, 3 Mar 2020 20:01:59 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] drm/edid: Distribute switch variables for initialization
Message-ID: <20200303180159.GA13686@intel.com>
References: <20200220062229.68762-1-keescook@chromium.org>
 <202003022038.07A611E@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202003022038.07A611E@keescook>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMDIsIDIwMjAgYXQgMDg6Mzk6MzdQTSAtMDgwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IE9uIFdlZCwgRmViIDE5LCAyMDIwIGF0IDEwOjIyOjI5UE0gLTA4MDAsIEtlZXMgQ29vayB3
cm90ZToKPiA+IFZhcmlhYmxlcyBkZWNsYXJlZCBpbiBhIHN3aXRjaCBzdGF0ZW1lbnQgYmVmb3Jl
IGFueSBjYXNlIHN0YXRlbWVudHMKPiA+IGNhbm5vdCBiZSBhdXRvbWF0aWNhbGx5IGluaXRpYWxp
emVkIHdpdGggY29tcGlsZXIgaW5zdHJ1bWVudGF0aW9uIChhcwo+ID4gdGhleSBhcmUgbm90IHBh
cnQgb2YgYW55IGV4ZWN1dGlvbiBmbG93KS4gV2l0aCBHQ0MncyBwcm9wb3NlZCBhdXRvbWF0aWMK
PiA+IHN0YWNrIHZhcmlhYmxlIGluaXRpYWxpemF0aW9uIGZlYXR1cmUsIHRoaXMgdHJpZ2dlcnMg
YSB3YXJuaW5nIChhbmQgdGhleQo+ID4gZG9uJ3QgZ2V0IGluaXRpYWxpemVkKS4gQ2xhbmcncyBh
dXRvbWF0aWMgc3RhY2sgdmFyaWFibGUgaW5pdGlhbGl6YXRpb24KPiA+ICh2aWEgQ09ORklHX0lO
SVRfU1RBQ0tfQUxMPXkpIGRvZXNuJ3QgdGhyb3cgYSB3YXJuaW5nLCBidXQgaXQgYWxzbwo+ID4g
ZG9lc24ndCBpbml0aWFsaXplIHN1Y2ggdmFyaWFibGVzWzFdLiBOb3RlIHRoYXQgdGhlc2Ugd2Fy
bmluZ3MgKG9yIHNpbGVudAo+ID4gc2tpcHBpbmcpIGhhcHBlbiBiZWZvcmUgdGhlIGRlYWQtc3Rv
cmUgZWxpbWluYXRpb24gb3B0aW1pemF0aW9uIHBoYXNlLAo+ID4gc28gZXZlbiB3aGVuIHRoZSBh
dXRvbWF0aWMgaW5pdGlhbGl6YXRpb25zIGFyZSBsYXRlciBlbGlkZWQgaW4gZmF2b3Igb2YKPiA+
IGRpcmVjdCBpbml0aWFsaXphdGlvbnMsIHRoZSB3YXJuaW5ncyByZW1haW4uCj4gPiAKPiA+IFRv
IGF2b2lkIHRoZXNlIHByb2JsZW1zLCBtb3ZlIHN1Y2ggdmFyaWFibGVzIGludG8gdGhlICJjYXNl
IiB3aGVyZQo+ID4gdGhleSdyZSB1c2VkIG9yIGxpZnQgdGhlbSB1cCBpbnRvIHRoZSBtYWluIGZ1
bmN0aW9uIGJvZHkuCj4gPiAKPiA+IGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jOiBJbiBmdW5j
dGlvbiDigJhkcm1fZWRpZF90b19lbGTigJk6Cj4gPiBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQu
Yzo0Mzk1Ojk6IHdhcm5pbmc6IHN0YXRlbWVudCB3aWxsIG5ldmVyIGJlIGV4ZWN1dGVkIFstV3N3
aXRjaC11bnJlYWNoYWJsZV0KPiA+ICA0Mzk1IHwgICAgIGludCBzYWRfY291bnQ7Cj4gPiAgICAg
ICB8ICAgICAgICAgXn5+fn5+fn5+Cj4gPiAKPiA+IFsxXSBodHRwczovL2J1Z3MubGx2bS5vcmcv
c2hvd19idWcuY2dpP2lkPTQ0OTE2Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEtlZXMgQ29vayA8
a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+IAo+IFBpbmcuIENhbiBzb21lb25lIHBpY2sgdGhpcyB1
cCwgcGxlYXNlPwo+IAo+IFRoYW5rcyEKPiAKPiAtS2Vlcwo+IAo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV9lZGlkLmMgfCAgICA1ICsrKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiA+IGlu
ZGV4IDgwNWZiMDA0YzhlYi4uMjk0MWI2NWI0MjdmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4g
PiBAQCAtNDM5Miw5ICs0MzkyLDkgQEAgc3RhdGljIHZvaWQgZHJtX2VkaWRfdG9fZWxkKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIHN0cnVjdCBlZGlkICplZGlkKQo+ID4gIAkJCWRi
bCA9IGNlYV9kYl9wYXlsb2FkX2xlbihkYik7Cj4gPiAgCj4gPiAgCQkJc3dpdGNoIChjZWFfZGJf
dGFnKGRiKSkgewo+ID4gLQkJCQlpbnQgc2FkX2NvdW50Owo+ID4gKwkJCWNhc2UgQVVESU9fQkxP
Q0s6IHsKCkkndmUgbmV2ZXIgYmVlbiBhIGZhbiBvZiB7fSBpbnNpZGUgc3dpdGNoIHN0YXRlbWVu
dHMuIEknZCBqdXN0Cm1vdmUgdGhpcyBvbmUgbGV2ZWwgdXAuCgo+ID4gIAo+ID4gLQkJCWNhc2Ug
QVVESU9fQkxPQ0s6Cj4gPiArCQkJCWludCBzYWRfY291bnQ7Cj4gPiAgCQkJCS8qIEF1ZGlvIERh
dGEgQmxvY2ssIGNvbnRhaW5zIFNBRHMgKi8KPiA+ICAJCQkJc2FkX2NvdW50ID0gbWluKGRibCAv
IDMsIDE1IC0gdG90YWxfc2FkX2NvdW50KTsKPiA+ICAJCQkJaWYgKHNhZF9jb3VudCA+PSAxKQo+
ID4gQEAgLTQ0MDIsNiArNDQwMiw3IEBAIHN0YXRpYyB2b2lkIGRybV9lZGlkX3RvX2VsZChzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBzdHJ1Y3QgZWRpZCAqZWRpZCkKPiA+ICAJCQkJ
CSAgICAgICAmZGJbMV0sIHNhZF9jb3VudCAqIDMpOwo+ID4gIAkJCQl0b3RhbF9zYWRfY291bnQg
Kz0gc2FkX2NvdW50Owo+ID4gIAkJCQlicmVhazsKPiA+ICsJCQl9Cj4gPiAgCQkJY2FzZSBTUEVB
S0VSX0JMT0NLOgo+ID4gIAkJCQkvKiBTcGVha2VyIEFsbG9jYXRpb24gRGF0YSBCbG9jayAqLwo+
ID4gIAkJCQlpZiAoZGJsID49IDEpCj4gPiAKPiAKPiAtLSAKPiBLZWVzIENvb2sKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApWaWxsZSBT
eXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==

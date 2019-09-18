Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C509B6A4B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 20:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3886F6B4;
	Wed, 18 Sep 2019 18:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FB36F6B4;
 Wed, 18 Sep 2019 18:11:40 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 11:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,521,1559545200"; d="scan'208";a="199131548"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 18 Sep 2019 11:11:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2019 21:11:36 +0300
Date: Wed, 18 Sep 2019 21:11:36 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [PATCH] drm/i915/dp: Fix DP MST error after unplugging TypeC cable
Message-ID: <20190918181136.GQ1208@intel.com>
References: <1568770783-169735-1-git-send-email-srinivasan.s@intel.com>
 <20190918175038.GA31062@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918175038.GA31062@intel.com>
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
Cc: srinivasan.s@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMTA6NTA6MzlBTSAtMDcwMCwgTWFuYXNpIE5hdmFyZSB3
cm90ZToKPiBPbiBXZWQsIFNlcCAxOCwgMjAxOSBhdCAwNzowOTo0M0FNICswNTMwLCBzcmluaXZh
c2FuLnNAaW50ZWwuY29tIHdyb3RlOgo+ID4gRnJvbTogU3Jpbml2YXNhbiBTIDxzcmluaXZhc2Fu
LnNAaW50ZWwuY29tPgo+ID4gCj4gPiBUaGlzIHBhdGNoIGF2b2lkcyBEUCBNU1QgcGF5bG9hZCBl
cnJvciBtZXNzYWdlIGluIGRtZXNnLCBhcyBpdCBpcyB0cnlpbmcKPiA+IHRvIHJlYWQgdGhlIHBh
eWxvYWQgZnJvbSB0aGUgZGlzY29ubmVjdGVkIERQIE1TVCBkZXZpY2UuIEFmdGVyIHRoZSB1bnBs
dWcKPiA+IHRoZSBjb25uZWN0b3Igc3RhdHVzIGlzIGRpc2Nvbm5lY3RlZCBhbmQgd2Ugc2hvdWxk
IG5vdCBiZSBsb29raW5nIGZvciB0aGUKPiA+IHBheWxvYWQgYW5kIGhlbmNlIHJlbW92ZSB0aGUg
ZXJyb3IgYW5kIHRocm93IHRoZSB3YXJuaW5nLgo+ID4gCj4gPiBUaGlzIGRldGFpbHMgY2FuIGJl
IGZvdW5kIGluOgo+ID4gaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9MTExNjMyCj4gCj4gUGxlYXNlIGFkZCB0aGlzIGxpbmsgYXMgQnVnemlsbGE6IGh0dHBzOi8v
YnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMTYzMiBhZnRlciB0aGUgU2ln
biBvZmYKPiBzdGF0ZW1lbnQKPiAKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogU3Jpbml2YXNhbiBT
IDxzcmluaXZhc2FuLnNAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyB8IDcgKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jCj4gPiBpbmRleCBlZWViM2Y5MzNhYTQuLjVi
MjI3OGZkZjY3NSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHBfbXN0LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHBfbXN0LmMKPiA+IEBAIC0yMTUsNyArMjE1LDEyIEBAIHN0YXRpYyB2b2lkIGludGVsX21z
dF9kaXNhYmxlX2RwKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyLAo+ID4gIAo+ID4gIAly
ZXQgPSBkcm1fZHBfdXBkYXRlX3BheWxvYWRfcGFydDEoJmludGVsX2RwLT5tc3RfbWdyKTsKPiA+
ICAJaWYgKHJldCkgewo+ID4gLQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gdXBkYXRlIHBheWxvYWQg
JWRcbiIsIHJldCk7Cj4gPiArCQlpZiAoIWNvbm5lY3RvciB8fAo+ID4gKwkJICAgIGNvbm5lY3Rv
ci0+YmFzZS5zdGF0dXMgIT0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQpIHsKPiA+ICsJCQlE
Uk1fV0FSTigiRFAgTVNUIGRpc2Nvbm5lY3RcbiIpOwo+IAo+IE1heSBiZSBhZGRpbmcgdGhpcyBj
aGVjayBiZWZvcmUgY2FsbGluZyBkcm1fZHBfdXBkYXRlX3BheWxvYWRfcGFydDEoKSBpcyBhIGJl
dHRlciBpZGVhPwo+IElmIHRoZSBjb25uZWN0b3IgaXMgZGlzY29ubmVjdGVkLCB3aHkgdXBkYXRl
IHBheWxvYWQ/Cj4gCj4gSmFuaSwgVmlsbGUsIHRob3VnaHRzPwoKT3IganVzdCBjb252ZXJ0IGl0
IHRvIGEgZGVidWc/Cgo+IAo+IFJlZ2FyZHMKPiBNYW5hc2kKPiAKPiA+ICsJCX0gZWxzZSB7Cj4g
PiArCQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gdXBkYXRlIHBheWxvYWQgJWRcbiIsIHJldCk7Cj4g
PiArCQl9Cj4gPiAgCX0KPiA+ICAJaWYgKG9sZF9jcnRjX3N0YXRlLT5oYXNfYXVkaW8pCj4gPiAg
CQlpbnRlbF9hdWRpb19jb2RlY19kaXNhYmxlKGVuY29kZXIsCj4gPiAtLSAKPiA+IDIuNy40Cj4g
PiAKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs

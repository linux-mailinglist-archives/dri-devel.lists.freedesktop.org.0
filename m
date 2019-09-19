Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7C9B78D8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 14:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20E06FA4A;
	Thu, 19 Sep 2019 12:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468136FA33;
 Thu, 19 Sep 2019 12:03:36 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2019 05:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,523,1559545200"; d="scan'208";a="194358268"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 19 Sep 2019 05:03:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 19 Sep 2019 15:03:31 +0300
Date: Thu, 19 Sep 2019 15:03:31 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "S, Srinivasan" <srinivasan.s@intel.com>
Subject: Re: [PATCH] drm/i915/dp: Fix DP MST error after unplugging TypeC cable
Message-ID: <20190919120331.GR1208@intel.com>
References: <1568770783-169735-1-git-send-email-srinivasan.s@intel.com>
 <20190918175038.GA31062@intel.com>
 <20190918181136.GQ1208@intel.com>
 <20190918182528.GB31062@intel.com>
 <BFA53C78450B204BBCED0B0A62E9EAE73254C690@BGSMSX110.gar.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BFA53C78450B204BBCED0B0A62E9EAE73254C690@BGSMSX110.gar.corp.intel.com>
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
Cc: "Navare, Manasi D" <manasi.d.navare@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMDc6MjM6MzBBTSArMDAwMCwgUywgU3Jpbml2YXNhbiB3
cm90ZToKPiBXb3VsZCB0aGUgZm9sbG93aW5nIGJlIGFwcHJvcHJpYXRlIGZpeD8KPiAKPiAgICAg
ICAgIGlmIChjb25uZWN0b3IgfHwgY29ubmVjdG9yLT5iYXNlLnN0YXR1cyA9PSBjb25uZWN0b3Jf
c3RhdHVzX2Nvbm5lY3RlZCkgewo+ICAgICAgICAgICAgICAgICByZXQgPSBkcm1fZHBfdXBkYXRl
X3BheWxvYWRfcGFydDEoJmludGVsX2RwLT5tc3RfbWdyKTsKPiAgICAgICAgICAgICAgICAgaWYg
KHJldCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigiZmFpbGVkIHRvIHVw
ZGF0ZSBwYXlsb2FkICVkXG4iLCByZXQpOwo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9
CgpUaGUgd2hvbGUgY29ubmVjdG9yLT5zdGF0dXMgY2hlY2sgaXMgcmFjeS4gSU1PIGRvbid0IGRv
IGl0LgoKPiAKPiBSZWdhcmRzLAo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTog
ZHJpLWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJl
aGFsZiBPZiBNYW5hc2kgTmF2YXJlCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTgsIDIw
MTkgMTE6NTUgUE0KPiBUbzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KPiBDYzogUywgU3Jpbml2YXNhbiA8c3Jpbml2YXNhbi5zQGludGVsLmNvbT47IGlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vaTkxNS9kcDogRml4IERQIE1TVCBlcnJv
ciBhZnRlciB1bnBsdWdnaW5nIFR5cGVDIGNhYmxlCj4gCj4gT24gV2VkLCBTZXAgMTgsIDIwMTkg
YXQgMDk6MTE6MzZQTSArMDMwMCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+ID4gT24gV2VkLCBT
ZXAgMTgsIDIwMTkgYXQgMTA6NTA6MzlBTSAtMDcwMCwgTWFuYXNpIE5hdmFyZSB3cm90ZToKPiA+
ID4gT24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDc6MDk6NDNBTSArMDUzMCwgc3Jpbml2YXNhbi5z
QGludGVsLmNvbSB3cm90ZToKPiA+ID4gPiBGcm9tOiBTcmluaXZhc2FuIFMgPHNyaW5pdmFzYW4u
c0BpbnRlbC5jb20+Cj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBwYXRjaCBhdm9pZHMgRFAgTVNUIHBh
eWxvYWQgZXJyb3IgbWVzc2FnZSBpbiBkbWVzZywgYXMgaXQgaXMgCj4gPiA+ID4gdHJ5aW5nIHRv
IHJlYWQgdGhlIHBheWxvYWQgZnJvbSB0aGUgZGlzY29ubmVjdGVkIERQIE1TVCBkZXZpY2UuIAo+
ID4gPiA+IEFmdGVyIHRoZSB1bnBsdWcgdGhlIGNvbm5lY3RvciBzdGF0dXMgaXMgZGlzY29ubmVj
dGVkIGFuZCB3ZSAKPiA+ID4gPiBzaG91bGQgbm90IGJlIGxvb2tpbmcgZm9yIHRoZSBwYXlsb2Fk
IGFuZCBoZW5jZSByZW1vdmUgdGhlIGVycm9yIGFuZCB0aHJvdyB0aGUgd2FybmluZy4KPiA+ID4g
PiAKPiA+ID4gPiBUaGlzIGRldGFpbHMgY2FuIGJlIGZvdW5kIGluOgo+ID4gPiA+IGh0dHBzOi8v
YnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMTYzMgo+ID4gPiAKPiA+ID4g
UGxlYXNlIGFkZCB0aGlzIGxpbmsgYXMgQnVnemlsbGE6IAo+ID4gPiBodHRwczovL2J1Z3MuZnJl
ZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTE2MzIgYWZ0ZXIgdGhlIFNpZ24gCj4gPiA+
IG9mZiBzdGF0ZW1lbnQKPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU3Jp
bml2YXNhbiBTIDxzcmluaXZhc2FuLnNAaW50ZWwuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jIHwgNyArKysrKystCj4g
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+
ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcF9tc3QuYyAKPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHBfbXN0LmMKPiA+ID4gPiBpbmRleCBlZWViM2Y5MzNhYTQuLjViMjI3OGZkZjY3NSAxMDA2
NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21z
dC5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9t
c3QuYwo+ID4gPiA+IEBAIC0yMTUsNyArMjE1LDEyIEBAIHN0YXRpYyB2b2lkIGludGVsX21zdF9k
aXNhYmxlX2RwKHN0cnVjdCAKPiA+ID4gPiBpbnRlbF9lbmNvZGVyICplbmNvZGVyLAo+ID4gPiA+
ICAKPiA+ID4gPiAgCXJldCA9IGRybV9kcF91cGRhdGVfcGF5bG9hZF9wYXJ0MSgmaW50ZWxfZHAt
Pm1zdF9tZ3IpOwo+ID4gPiA+ICAJaWYgKHJldCkgewo+ID4gPiA+IC0JCURSTV9FUlJPUigiZmFp
bGVkIHRvIHVwZGF0ZSBwYXlsb2FkICVkXG4iLCByZXQpOwo+ID4gPiA+ICsJCWlmICghY29ubmVj
dG9yIHx8Cj4gPiA+ID4gKwkJICAgIGNvbm5lY3Rvci0+YmFzZS5zdGF0dXMgIT0gY29ubmVjdG9y
X3N0YXR1c19jb25uZWN0ZWQpIHsKPiA+ID4gPiArCQkJRFJNX1dBUk4oIkRQIE1TVCBkaXNjb25u
ZWN0XG4iKTsKPiA+ID4gCj4gPiA+IE1heSBiZSBhZGRpbmcgdGhpcyBjaGVjayBiZWZvcmUgY2Fs
bGluZyBkcm1fZHBfdXBkYXRlX3BheWxvYWRfcGFydDEoKSBpcyBhIGJldHRlciBpZGVhPwo+ID4g
PiBJZiB0aGUgY29ubmVjdG9yIGlzIGRpc2Nvbm5lY3RlZCwgd2h5IHVwZGF0ZSBwYXlsb2FkPwo+
ID4gPiAKPiA+ID4gSmFuaSwgVmlsbGUsIHRob3VnaHRzPwo+ID4gCj4gPiBPciBqdXN0IGNvbnZl
cnQgaXQgdG8gYSBkZWJ1Zz8KPiAKPiBTdXJlIHRoYXQgd2lsbCB3b3JrLCBidXQgZG8gd2UgcmVh
bGx5IHdhbnQgdG8gdXBkYXRlIHRoZSBwYXlsb2FkIGlmIHRoZSBjb25uZWN0b3Igc3RhdHVzIGlz
IGRpc2Nvbm5lY3RlZC4KPiBTbyBzaG91bGRudCBjaGVja2luZyB0aGF0IGJlZm9yZSBjYWxsaW5n
IHRoZSBmdW5jdGlvbiBiZSBhIGJldHRlciBmaXg/Cj4gCj4gTWFuYXNpCj4gCj4gPiAKPiA+ID4g
Cj4gPiA+IFJlZ2FyZHMKPiA+ID4gTWFuYXNpCj4gPiA+IAo+ID4gPiA+ICsJCX0gZWxzZSB7Cj4g
PiA+ID4gKwkJCURSTV9FUlJPUigiZmFpbGVkIHRvIHVwZGF0ZSBwYXlsb2FkICVkXG4iLCByZXQp
Owo+ID4gPiA+ICsJCX0KPiA+ID4gPiAgCX0KPiA+ID4gPiAgCWlmIChvbGRfY3J0Y19zdGF0ZS0+
aGFzX2F1ZGlvKQo+ID4gPiA+ICAJCWludGVsX2F1ZGlvX2NvZGVjX2Rpc2FibGUoZW5jb2RlciwK
PiA+ID4gPiAtLQo+ID4gPiA+IDIuNy40Cj4gPiA+ID4gCj4gPiAKPiA+IC0tCj4gPiBWaWxsZSBT
eXJqw6Rsw6QKPiA+IEludGVsCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

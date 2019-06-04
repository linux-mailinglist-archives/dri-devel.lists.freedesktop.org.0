Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E6334ECA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 19:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A89989B05;
	Tue,  4 Jun 2019 17:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3692989948;
 Tue,  4 Jun 2019 17:29:41 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 10:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,550,1549958400"; d="scan'208";a="181630918"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 04 Jun 2019 10:29:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 04 Jun 2019 20:29:36 +0300
Date: Tue, 4 Jun 2019 20:29:36 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] drm/i915/dsi: Use a fuzzy check for burst mode clock
 check
Message-ID: <20190604172936.GH5942@intel.com>
References: <20190524174028.21659-1-hdegoede@redhat.com>
 <20190524174028.21659-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524174028.21659-2-hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDc6NDA6MjhQTSArMDIwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBQcmlvciB0byB0aGlzIGNvbW1pdCB3ZSBmYWlsIHRvIGluaXQgdGhlIERTSSBwYW5l
bCBvbiB0aGUgR1BEIE1pY3JvUEM6Cj4gaHR0cHM6Ly93d3cuaW5kaWVnb2dvLmNvbS9wcm9qZWN0
cy9ncGQtbWljcm9wYy02LWluY2gtaGFuZGhlbGQtaW5kdXN0cnktbGFwdG9wIy8KPiAKPiBUaGUg
cHJvYmxlbSBpcyBpbnRlbF9kc2lfdmJ0X2luaXQoKSBmYWlsaW5nIHdpdGggdGhlIGZvbGxvd2lu
ZyBlcnJvcjoKPiAqRVJST1IqIEJ1cnN0IG1vZGUgZnJlcSBpcyBsZXNzIHRoYW4gY29tcHV0ZWQK
PiAKPiBUaGUgcGNsayBpbiB0aGUgVkJUIHBhbmVsIG1vZGVsaW5lIGlzIDcwMDAwLCB0b2dldGhl
ciB3aXRoIDI0IGJwcCBhbmQKPiA0IGxpbmVzIHRoaXMgcmVzdWx0cyBpbiBhIGJpdHJhdGUgdmFs
dWUgb2YgNzAwMDAgKiAyNCAvIDQgPSA0MjAwMDAuCj4gQnV0IHRoZSB0YXJnZXRfYnVyc3RfbW9k
ZV9mcmVxIGluIHRoZSBWQlQgaXMgNDE4MDAwLgo+IAo+IFRoaXMgY29tbWl0IHdvcmtzIGFyb3Vu
ZCB0aGlzIHByb2JsZW0gYnkgYWRkaW5nIGFuIGludGVsX2Z1enp5X2Nsb2NrX2NoZWNrCj4gd2hl
biB0YXJnZXRfYnVyc3RfbW9kZV9mcmVxIDwgYml0cmF0ZSBhbmQgc2V0dGluZyB0YXJnZXRfYnVy
c3RfbW9kZV9mcmVxIHRvCj4gYml0cmF0ZSB3aGVuIHRoYXQgY2hlY2tzIHN1Y2NlZWRzLCBmaXhp
bmcgdGhlIHBhbmVsIG5vdCB3b3JraW5nLgo+IAo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
Cj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHNpX3ZidC5jIHwgMTEgKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHNpX3ZidC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaW50ZWxfZHNpX3ZidC5jCj4gaW5kZXggMDIyYmY1OTQxOGRmLi5hMmE5YjlkMGVlYWEgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHNpX3ZidC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHNpX3ZidC5jCj4gQEAgLTg5NSw2ICs4OTUsMTcg
QEAgYm9vbCBpbnRlbF9kc2lfdmJ0X2luaXQoc3RydWN0IGludGVsX2RzaSAqaW50ZWxfZHNpLCB1
MTYgcGFuZWxfaWQpCj4gIAkJaWYgKG1pcGlfY29uZmlnLT50YXJnZXRfYnVyc3RfbW9kZV9mcmVx
KSB7Cj4gIAkJCXUzMiBiaXRyYXRlID0gaW50ZWxfZHNpX2JpdHJhdGUoaW50ZWxfZHNpKTsKPiAg
Cj4gKwkJCS8qCj4gKwkJCSAqIFNvbWV0aW1lcyB0aGUgVkJUIGNvbnRhaW5zIGEgc2xpZ2h0bHkg
bG93ZXIgY2xvY2ssCj4gKwkJCSAqIHRoZW4gdGhlIGJpdHJhdGUgd2UgaGF2ZSBjYWxjdWxhdGVk
LCBpbiB0aGlzIGNhc2UKPiArCQkJICoganVzdCByZXBsYWNlIGl0IHdpdGggdGhlIGNhbGN1bGF0
ZWQgYml0cmF0ZS4KPiArCQkJICovCj4gKwkJCWlmIChtaXBpX2NvbmZpZy0+dGFyZ2V0X2J1cnN0
X21vZGVfZnJlcSA8IGJpdHJhdGUgJiYKPiArCQkJICAgIGludGVsX2Z1enp5X2Nsb2NrX2NoZWNr
KAo+ICsJCQkJCW1pcGlfY29uZmlnLT50YXJnZXRfYnVyc3RfbW9kZV9mcmVxLAo+ICsJCQkJCWJp
dHJhdGUpKQo+ICsJCQkJbWlwaV9jb25maWctPnRhcmdldF9idXJzdF9tb2RlX2ZyZXEgPSBiaXRy
YXRlOwoKTWF5YmUgc2hvdWxkIHNxdWFzaCB0aGVzZSBwYXRjaGVzIHRvZ2V0aGVyIHRvIG1ha2Ug
dGhlIHN0YWJsZQpiYWNrcG9ydCBsZXNzIHBhaW5mdWw/CgpBbnl3YXlzLCBzZWVtcyBPSyB0byBt
ZS4KUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+Cgo+ICsKPiAgCQkJaWYgKG1pcGlfY29uZmlnLT50YXJnZXRfYnVyc3RfbW9kZV9mcmVx
IDwgYml0cmF0ZSkgewo+ICAJCQkJRFJNX0VSUk9SKCJCdXJzdCBtb2RlIGZyZXEgaXMgbGVzcyB0
aGFuIGNvbXB1dGVkXG4iKTsKPiAgCQkJCXJldHVybiBmYWxzZTsKPiAtLSAKPiAyLjIxLjAKCi0t
IApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs

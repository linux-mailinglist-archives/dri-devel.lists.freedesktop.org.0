Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E8159A3A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DE76E8FD;
	Fri, 28 Jun 2019 12:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757D86E8FD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:13:19 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jun 2019 05:13:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; d="scan'208";a="189422313"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 28 Jun 2019 05:13:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Jun 2019 15:13:15 +0300
Date: Fri, 28 Jun 2019 15:13:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Robert Beckett <bob.beckett@collabora.com>
Subject: Re: [PATCH v4 2/2] Revert "drm/vblank: Do not update vblank count if
 interrupts are already disabled."
Message-ID: <20190628121315.GH5942@intel.com>
References: <cover.1561722822.git.bob.beckett@collabora.com>
 <fc4a6e587e4570227f67a82f2d0e9520934e717e.1561722822.git.bob.beckett@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc4a6e587e4570227f67a82f2d0e9520934e717e.1561722822.git.bob.beckett@collabora.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMDE6MDU6MzJQTSArMDEwMCwgUm9iZXJ0IEJlY2tldHQg
d3JvdGU6Cj4gSWYgaW50ZXJydXB0cyBhcmUgYWxyZWFkeSBkaXNhYmxlZCwgdGhlbiB0aGUgdGlt
ZXN0YW1wIGZvciB0aGUgdmJsYW5rCj4gZG9lcyBub3QgZ2V0IHVwZGF0ZWQsIGNhdXNpbmcgYSBz
dGFsZSB0aW1lc3RhbXAgdG8gYmUgcmVwb3J0ZWQgdG8KPiB1c2VybGFuZCB3aGlsZSBkaXNhYmxp
bmcgY3J0Y3MuCj4gCj4gVGhpcyByZXZlcnRzIGNvbW1pdCA2ODAzNmIwOGI5MWJjNDkxY2NjMzA4
ZjkwMjYxNmE1NzBhNDkyMjdjLgoKUGxlYXNlIGNjIHRoZSBwZW9wbGUgaW52b2x2ZWQgaW4gdGhh
dC4gQW5kIEknZCBkcm9wIHRoZSBsa21sIGNjLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQg
QmVja2V0dCA8Ym9iLmJlY2tldHRAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2RybV92YmxhbmsuYyB8IDE4ICsrKysrKysrLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMK
PiBpbmRleCA3ZGFiYjJiZGI3MzMuLmFlYjk3MzRkNzc5OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX3ZibGFuay5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92Ymxhbmsu
Ywo+IEBAIC0zNzEsMjUgKzM3MSwyMyBAQCB2b2lkIGRybV92YmxhbmtfZGlzYWJsZV9hbmRfc2F2
ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcGlwZSkKPiAgCXNwaW5fbG9j
a19pcnFzYXZlKCZkZXYtPnZibGFua190aW1lX2xvY2ssIGlycWZsYWdzKTsKPiAgCj4gIAkvKgo+
IC0JICogVXBkYXRlIHZibGFuayBjb3VudCBhbmQgZGlzYWJsZSB2YmxhbmsgaW50ZXJydXB0cyBv
bmx5IGlmIHRoZQo+IC0JICogaW50ZXJydXB0cyB3ZXJlIGVuYWJsZWQuIFRoaXMgYXZvaWRzIGNh
bGxpbmcgdGhlIC0+ZGlzYWJsZV92YmxhbmsoKQo+IC0JICogb3BlcmF0aW9uIGluIGF0b21pYyBj
b250ZXh0IHdpdGggdGhlIGhhcmR3YXJlIHBvdGVudGlhbGx5IHJ1bnRpbWUKPiAtCSAqIHN1c3Bl
bmRlZC4KPiArCSAqIE9ubHkgZGlzYWJsZSB2YmxhbmsgaW50ZXJydXB0cyBpZiB0aGV5J3JlIGVu
YWJsZWQuIFRoaXMgYXZvaWRzCj4gKwkgKiBjYWxsaW5nIHRoZSAtPmRpc2FibGVfdmJsYW5rKCkg
b3BlcmF0aW9uIGluIGF0b21pYyBjb250ZXh0IHdpdGggdGhlCj4gKwkgKiBoYXJkd2FyZSBwb3Rl
bnRpYWxseSBydW50aW1lIHN1c3BlbmRlZC4KPiAgCSAqLwo+IC0JaWYgKCF2YmxhbmstPmVuYWJs
ZWQpCj4gLQkJZ290byBvdXQ7Cj4gKwlpZiAodmJsYW5rLT5lbmFibGVkKSB7Cj4gKwkJX19kaXNh
YmxlX3ZibGFuayhkZXYsIHBpcGUpOwo+ICsJCXZibGFuay0+ZW5hYmxlZCA9IGZhbHNlOwo+ICsJ
fQo+ICAKPiAgCS8qCj4gLQkgKiBVcGRhdGUgdGhlIGNvdW50IGFuZCB0aW1lc3RhbXAgdG8gbWFp
bnRhaW4gdGhlCj4gKwkgKiBBbHdheXMgdXBkYXRlIHRoZSBjb3VudCBhbmQgdGltZXN0YW1wIHRv
IG1haW50YWluIHRoZQo+ICAJICogYXBwZWFyYW5jZSB0aGF0IHRoZSBjb3VudGVyIGhhcyBiZWVu
IHRpY2tpbmcgYWxsIGFsb25nIHVudGlsCj4gIAkgKiB0aGlzIHRpbWUuIFRoaXMgbWFrZXMgdGhl
IGNvdW50IGFjY291bnQgZm9yIHRoZSBlbnRpcmUgdGltZQo+ICAJICogYmV0d2VlbiBkcm1fY3J0
Y192Ymxhbmtfb24oKSBhbmQgZHJtX2NydGNfdmJsYW5rX29mZigpLgo+ICAJICovCj4gIAlkcm1f
dXBkYXRlX3ZibGFua19jb3VudChkZXYsIHBpcGUsIGZhbHNlKTsKPiAtCV9fZGlzYWJsZV92Ymxh
bmsoZGV2LCBwaXBlKTsKPiAtCXZibGFuay0+ZW5hYmxlZCA9IGZhbHNlOwo+ICAKPiAtb3V0Ogo+
ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGV2LT52YmxhbmtfdGltZV9sb2NrLCBpcnFmbGFn
cyk7Cj4gIH0KPiAgCj4gLS0gCj4gMi4xOC4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

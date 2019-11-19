Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A524D100FA1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 01:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D9C8966B;
	Tue, 19 Nov 2019 00:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEFF8966B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 00:02:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AB82563;
 Tue, 19 Nov 2019 01:02:48 +0100 (CET)
Date: Tue, 19 Nov 2019 02:02:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
Message-ID: <20191119000237.GF5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1574121769;
 bh=zNIacMfQypz6l5ggJuH3A2Pi6iN+sk8YulgB9+eSy2Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WPyeyP6bjI635H57GIRptaS9WSKmWb6FNq39vQNOPuhHSCAYm+IMKqGx9K3qT3R0M
 ZmJbvcQPxKcb1JkMJaRrMKCNAfVvk2QPYDEajkbFTBLJMUxTcEf+CmeoR0ZBd6V5pR
 SdoBU+osBC+Oydps5R2TcL/VhUnFfNGyO23jGBgo=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFdlZCwgTm92IDEzLCAy
MDE5IGF0IDAzOjUxOjI1UE0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBBZGQgc3Vw
cG9ydCBmb3IgdHJhbnNwYXJlbnQgTFZEUyBkZWNvZGVycyBieSBhZGRpbmcgYSBuZXcKPiBjb21w
YXRpYmxlIHN0cmluZyAoImx2ZHMtZGVjb2RlciIpIHRvIHRoZSBkcml2ZXIuCj4gVGhpcyBwYXRj
aCBhbHNvIGFkZHMgbWVtYmVyIGNvbm5lY3Rvcl90eXBlIHRvIHN0cnVjdCBsdmRzX2NvZGVjLAo+
IGFuZCB0aGF0J3MgYmVjYXVzZSBMVkRTIGRlY29kZXJzIGhhdmUgYSBkaWZmZXJlbnQgY29ubmVj
dG9yIHR5cGUKPiBmcm9tIExWRFMgZW5jb2RlcnMuIFdlIGZpbGwgdGhpcyBuZXcgbWVtYmVyIHVw
IHdpdGggdGhlIGRhdGEKPiBtYXRjaGluZyB0aGUgY29tcGF0aWJsZSBzdHJpbmcuCj4gCj4gU2ln
bmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5j
b20+CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPgoKPiAtLS0KPiB2My0+djQ6Cj4gKiBOZXcgcGF0Y2gKPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVjLmMgfCAxOSArKysrKysrKysrKysrKysrLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jCj4gaW5kZXggYjU4MDFhMi4uYzMyZTEyNSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jCj4gQEAgLTcsNiArNyw3IEBACj4g
ICNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1
bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9vZl9kZXZp
Y2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L29mX2dyYXBoLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9w
bGF0Zm9ybV9kZXZpY2UuaD4KPiAgCj4gQEAgLTE3LDYgKzE4LDcgQEAgc3RydWN0IGx2ZHNfY29k
ZWMgewo+ICAJc3RydWN0IGRybV9icmlkZ2UgYnJpZGdlOwo+ICAJc3RydWN0IGRybV9icmlkZ2Ug
KnBhbmVsX2JyaWRnZTsKPiAgCXN0cnVjdCBncGlvX2Rlc2MgKnBvd2VyZG93bl9ncGlvOwo+ICsJ
dTMyIGNvbm5lY3Rvcl90eXBlOwo+ICB9Owo+ICAKPiAgc3RhdGljIGludCBsdmRzX2NvZGVjX2F0
dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+IEBAIC02NSw2ICs2Nyw3IEBAIHN0YXRp
YyBpbnQgbHZkc19jb2RlY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJ
aWYgKCFsdmRzX2NvZGVjKQo+ICAJCXJldHVybiAtRU5PTUVNOwo+ICAKPiArCWx2ZHNfY29kZWMt
PmNvbm5lY3Rvcl90eXBlID0gKHUzMilvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRl
dik7Cj4gIAlsdmRzX2NvZGVjLT5wb3dlcmRvd25fZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlv
bmFsKGRldiwgInBvd2VyZG93biIsCj4gIAkJCQkJCQkgICAgIEdQSU9EX09VVF9ISUdIKTsKPiAg
CWlmIChJU19FUlIobHZkc19jb2RlYy0+cG93ZXJkb3duX2dwaW8pKSB7Cj4gQEAgLTEwNSw3ICsx
MDgsNyBAQCBzdGF0aWMgaW50IGx2ZHNfY29kZWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPiAgCj4gIAlsdmRzX2NvZGVjLT5wYW5lbF9icmlkZ2UgPQo+ICAJCWRldm1fZHJt
X3BhbmVsX2JyaWRnZV9hZGRfdHlwZWQoZGV2LCBwYW5lbCwKPiAtCQkJCQkJRFJNX01PREVfQ09O
TkVDVE9SX0xWRFMpOwo+ICsJCQkJCQlsdmRzX2NvZGVjLT5jb25uZWN0b3JfdHlwZSk7Cj4gIAlp
ZiAoSVNfRVJSKGx2ZHNfY29kZWMtPnBhbmVsX2JyaWRnZSkpCj4gIAkJcmV0dXJuIFBUUl9FUlIo
bHZkc19jb2RlYy0+cGFuZWxfYnJpZGdlKTsKPiAgCj4gQEAgLTEzMyw4ICsxMzYsMTggQEAgc3Rh
dGljIGludCBsdmRzX2NvZGVjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
ICB9Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBsdmRzX2NvZGVjX21h
dGNoW10gPSB7Cj4gLQl7IC5jb21wYXRpYmxlID0gImx2ZHMtZW5jb2RlciIgfSwKPiAtCXsgLmNv
bXBhdGlibGUgPSAidGhpbmUsdGhjNjNsdmRtODNkIiB9LAo+ICsJewo+ICsJCS5jb21wYXRpYmxl
ID0gImx2ZHMtZGVjb2RlciIsCj4gKwkJLmRhdGEgPSAodm9pZCAqKURSTV9NT0RFX0NPTk5FQ1RP
Ul9EUEksCj4gKwl9LAo+ICsJewo+ICsJCS5jb21wYXRpYmxlID0gImx2ZHMtZW5jb2RlciIsCj4g
KwkJLmRhdGEgPSAodm9pZCAqKURSTV9NT0RFX0NPTk5FQ1RPUl9MVkRTLAo+ICsJfSwKPiArCXsK
PiArCQkuY29tcGF0aWJsZSA9ICJ0aGluZSx0aGM2M2x2ZG04M2QiLAo+ICsJCS5kYXRhID0gKHZv
aWQgKilEUk1fTU9ERV9DT05ORUNUT1JfTFZEUywKPiArCX0sCj4gIAl7fSwKPiAgfTsKPiAgTU9E
VUxFX0RFVklDRV9UQUJMRShvZiwgbHZkc19jb2RlY19tYXRjaCk7CgotLSAKUmVnYXJkcywKCkxh
dXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs

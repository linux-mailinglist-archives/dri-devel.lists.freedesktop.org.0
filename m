Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB246E18B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 09:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F016E5B0;
	Fri, 19 Jul 2019 07:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807DC6E429
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 16:42:13 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id 414D6227A81; Thu, 18 Jul 2019 18:42:07 +0200 (CEST)
Date: Thu, 18 Jul 2019 18:42:07 +0200
From: Torsten Duwe <duwe@lst.de>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 5/7] drm/bridge: Add Analogix anx6345 support
Message-ID: <20190718164207.GA29501@lst.de>
References: <20190604122150.29D6468B05@newverein.lst.de>
 <CGME20190604122331epcas1p45e234dfad3f1288cb557e3bae7f9af38@epcas1p4.samsung.com>
 <20190604122302.006A168C7B@newverein.lst.de>
 <610ab353-7e05-81b6-2cc4-2dac09823d42@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <610ab353-7e05-81b6-2cc4-2dac09823d42@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:16:02 +0000
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTE6MTM6MTBBTSArMDIwMCwgQW5kcnplaiBIYWpkYSB3
cm90ZToKPiBPbiAwNC4wNi4yMDE5IDE0OjIzLCBUb3JzdGVuIER1d2Ugd3JvdGU6Cj4gPiArCj4g
PiArc3RhdGljIHZvaWQgYW54NjM0NV9wb3dlcm9uKHN0cnVjdCBhbng2MzQ1ICphbng2MzQ1KQo+
ID4gK3sKPiA+ICsJaW50IGVycjsKPiA+ICsKPiA+ICsJLyogRW5zdXJlIHJlc2V0IGlzIGFzc2Vy
dGVkIGJlZm9yZSBzdGFydGluZyBwb3dlciBvbiBzZXF1ZW5jZSAqLwo+ID4gKwlncGlvZF9zZXRf
dmFsdWVfY2Fuc2xlZXAoYW54NjM0NS0+Z3Bpb2RfcmVzZXQsIDEpOwo+IAo+IFdpdGggZml4ZWQg
ZGV2bV9ncGlvZF9nZXQgYmVsb3cgdGhpcyBsaW5lIGNhbiBiZSByZW1vdmVkLgoKSW4gYW55IGNh
c2UsIHJlc2V0IG11c3QgYmUgYXNzZXJ0ZWQgZm9yIHRoaXMgcHJvY2VkdXJlIHRvIHN1Y2NlZWQu
Li4KCj4gPiArc3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVzCj4gPiArYW54NjM0NV9icmlkZ2Vf
bW9kZV92YWxpZChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+ID4gKwkJCSAgY29uc3Qgc3Ry
dWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCj4gPiArewo+ID4gKwlpZiAobW9kZS0+ZmxhZ3Mg
JiBEUk1fTU9ERV9GTEFHX0lOVEVSTEFDRSkKPiA+ICsJCXJldHVybiBNT0RFX05PX0lOVEVSTEFD
RTsKPiA+ICsKPiA+ICsJLyogTWF4IDEyMDBwIGF0IDUuNCBHaHosIG9uZSBsYW5lICovCj4gPiAr
CWlmIChtb2RlLT5jbG9jayA+IDE1NDAwMCkKPiA+ICsJCXJldHVybiBNT0RFX0NMT0NLX0hJR0g7
Cj4gCj4gSSB3b25kZXIgaWYgeW91IHNob3VsZG4ndCB0YWtlIGludG8gYWNjb3VudCB0cmFpbmlu
ZyByZXN1bHRzIGhlcmUsIGllLgo+IHRyYWluaW5nIHBlcmZyb3JtZWQgYmVmb3JlIHZhbGlkYXRp
b24uCgpTdXJlLCBidXQgdGhpcyBpcyB2ZXJiYXRpbSBmcm9tIHRoZSBhbng3OHh4LmMgc2libGlu
ZywgY29kZSBwcm92aWRlZApieSBhbmFsb2dpeC4gTGFja2luZyBpbi1kZXB0aCBkYXRhc2hlZXRz
LCB0aGlzIGlzIHByb2JhYmx5IHRoZSBiZXN0IGVmZm9ydC4KCj4gPiArCj4gPiArCS8qIDIuNVYg
ZGlnaXRhbCBjb3JlIHBvd2VyIHJlZ3VsYXRvciAgKi8KPiA+ICsJYW54NjM0NS0+ZHZkZDI1ID0g
ZGV2bV9yZWd1bGF0b3JfZ2V0KGRldiwgImR2ZGQyNS1zdXBwbHkiKTsKPiA+ICsJaWYgKElTX0VS
Uihhbng2MzQ1LT5kdmRkMjUpKSB7Cj4gPiArCQlEUk1fRVJST1IoImR2ZGQyNS1zdXBwbHkgbm90
IGZvdW5kXG4iKTsKPiA+ICsJCXJldHVybiBQVFJfRVJSKGFueDYzNDUtPmR2ZGQyNSk7Cj4gPiAr
CX0KPiA+ICsKPiA+ICsJLyogR1BJTyBmb3IgY2hpcCByZXNldCAqLwo+ID4gKwlhbng2MzQ1LT5n
cGlvZF9yZXNldCA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgInJlc2V0IiwgR1BJT0RfT1VUX0xPVyk7
Cj4gCj4gU2hvdWxkbid0IGJlIHNldCB0byBHUElPRF9PVVRfSElHSD8KCkl0IHVzZWQgdG8gYmUg
aW4gdGhlIG9yaWdpbmFsIHN1Ym1pc3Npb24sIGFuZCBjb25mdXNlZCBldmVuIG1vcmUgcGVvcGxl
IDstKQpGYWN0IGlzLCB0aGUgcmVzZXQgZm9yIHRoaXMgY2hpcCBfaXNfIGxvdyBhY3RpdmU7IEkn
bSBmb2xsb3dpbmcKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vZ3Bpby50
eHQsICIxLjEpIEdQSU8gc3BlY2lmaWVyCmJlc3QgcHJhY3RpY2VzIiwgd2hpY2ggSSBmaW5kIHJh
dGhlciBjb21wcmVoZW5zaXZlLgoKQW55IHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBwaHJhc2UgdGhp
cyBldmVuIGJldHRlciBhcmUgYXBwcmVjaWF0ZWQuCgo+ID4gK307Cj4gPiArbW9kdWxlX2kyY19k
cml2ZXIoYW54NjM0NV9kcml2ZXIpOwo+ID4gKwo+ID4gK01PRFVMRV9ERVNDUklQVElPTigiQU5Y
NjM0NSBlRFAgVHJhbnNtaXR0ZXIgZHJpdmVyIik7Cj4gPiArTU9EVUxFX0FVVEhPUigiRW5yaWMg
QmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4iKTsKPiAKPiBT
dWJtaXR0ZXIsIHBhdGNoIGF1dGhvciwgYW5kIG1vZHVsZSBhdXRob3IgYXJlIGRpZmZlcmVudCwg
dGhpcyBjYW4gYmUKPiBjb3JyZWN0LCBidXQgbWF5YmUgc29tZWJvZHkgZm9yZ290IHRvIHVwZGF0
ZSBzb21lIG9mIHRoZXNlIGZpZWxkcy4KCkFzIG1lbnRpb25lZCBpbiB0aGUgdjIgY292ZXIgbGV0
dGVyLCBJIGhhZCBhIGNsb3NlciBsb29rIG9uIHdoaWNoIGNvZGUgZ290CmFjdHVhbGx5IGludHJv
ZHVjZWQgYW5kIHdoaWNoIGxpbmVzIHdlcmUgc2ltcGx5IGNvcGllZCBhcm91bmQsIGFuZCBtYWRl
IHRoZQpjb3B5cmlnaHQgYW5kIGF1dGhvcnNoaXAgc3RpY2sgdG8gd2hlcmUgdGhleSBiZWxvbmcu
ICpJKiBiZWxpZXZlIHRoaXMgaXMKY29ycmVjdCBub3c7IHNwZWNpZmljIGltcHJvdmVtZW50cyB3
ZWxjb21lLgoKCVRvcnN0ZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=

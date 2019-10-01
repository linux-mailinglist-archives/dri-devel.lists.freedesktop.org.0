Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0E6C40E0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 21:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CA46E429;
	Tue,  1 Oct 2019 19:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8336E429
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 19:20:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8717623F;
 Tue,  1 Oct 2019 21:20:29 +0200 (CEST)
Date: Tue, 1 Oct 2019 22:20:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v4 8/9] drm: rcar-du: kms: Update CMM in atomic commit tail
Message-ID: <20191001192015.GB21064@pendragon.ideasonboard.com>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-9-jacopo+renesas@jmondi.org>
 <8063b9555d5bce6f2c002e49da3b7afaca9ae0b4.camel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8063b9555d5bce6f2c002e49da3b7afaca9ae0b4.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1569957630;
 bh=Sa0SIsPyN1ATWCS9yyuYZWlyF0yqVPZu5bykCqOt5Uc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f9MxPlRhYTL6Mb7fNBnk14C/A646XeI/c7M5YeLylwqrBw0yM2fLZFBOpUU10lRPP
 RK1ieQ+V22aSCKG5Svwkj4fKwLezyqpunV2HPw9jreE08SgQBTxL/bwLbWR0Ys2sMK
 VFWDgA1xQKOrwLxRzK+8sUdsR3jz5YutSZF9dMrA=
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
Cc: muroya@ksk.co.jp, horms@verge.net.au, VenkataRajesh.Kalakodima@in.bosch.com,
 airlied@linux.ie, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com, uli+renesas@fpond.eu,
 Doug Anderson <dianders@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRXplcXVpZWwsCgpPbiBNb24sIFNlcCAzMCwgMjAxOSBhdCAwNTo1MzowMFBNIC0wMzAwLCBF
emVxdWllbCBHYXJjaWEgd3JvdGU6Cj4gK0RvdWcsIEhlaWtvOgo+IAo+IE9uIEZyaSwgMjAxOS0w
OS0wNiBhdCAxNTo1NCArMDIwMCwgSmFjb3BvIE1vbmRpIHdyb3RlOgo+ID4gVXBkYXRlIENNTSBz
ZXR0aW5ncyBhdCBpbiB0aGUgYXRvbWljIGNvbW1pdCB0YWlsIGhlbHBlciBtZXRob2QuCj4gPiBU
aGUgQ01NIGlzIHVwZGF0ZWQgd2l0aCBuZXcgZ2FtbWEgdmFsdWVzIHByb3ZpZGVkIHRvIHRoZSBk
cml2ZXIKPiA+IGluIHRoZSBHQU1NQV9MVVQgYmxvYiBwcm9wZXJ0eS4KPiA+IAo+ID4gV2hlbiBy
ZXN1bWluZyBmcm9tIHN5c3RlbSBzdXNwZW5kLCB0aGUgRFUgZHJpdmVyIGlzIHJlc3BvbnNpYmxl
IGZvcgo+ID4gcmVwcm9ncmFtbWluZyBhbmQgZW5hYmxpbmcgdGhlIENNTSB1bml0IGlmIGl0IHdh
cyBpbiB1c2UgYXQgdGhlIHRpbWUgdGhlCj4gPiBzeXN0ZW0gZW50ZXJlZCB0aGUgc3VzcGVuZCBz
dGF0ZS4gIEZvcmNlIHRoZSBjb2xvcl9tZ210X2NoYW5nZWQgZmxhZyB0bwo+ID4gdHJ1ZSBpZiB0
aGUgRFJNIGdhbW1hIGx1dCBjb2xvciB0cmFuc2Zvcm1hdGlvbiBwcm9wZXJ0eSB3YXMgc2V0IGlu
IHRoZQo+ID4gQ1JUQyBzdGF0ZSBkdXBsaWNhdGVkIGF0IHN1c3BlbmQgdGltZSwgYXMgdGhlIENN
TSBnZXRzIHJlcHJvZ3JhbW1lZCBvbmx5Cj4gPiBpZiBzYWlkIGZsYWcgaXMgYWN0aXZlIGluIHRo
ZSByY2FyX2R1X2F0b21pY19jb21taXRfdXBkYXRlX2NtbSgpIG1ldGhvZC4KPiA+IAo+ID4gUmV2
aWV3ZWQtYnk6IFVscmljaCBIZWNodCA8dWxpK3JlbmVzYXNAZnBvbmQuZXU+Cj4gPiBSZXZpZXdl
ZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGku
b3JnPgo+ID4gLS0tCj4gPiAKPiA+IERhbmllbCBjb3VsZCB5b3UgaGF2ZSBhIGxvb2sgaWYgcmVz
dW1lIGJpdHMgYXJlIHdvcnRoIGJlaW5nIG1vdmVkIHRvIHRoZQo+ID4gRFJNIGNvcmU/IFRoZSBj
b2xvcl9tZ210X2NoYW5nZWQgZmxhZyBpcyBzZXQgdG8gZmFsc2Ugd2hlbiB0aGUgc3RhdGUgaXMK
PiA+IGR1cGxpY2F0ZWQgaWYgSSByZWFkIHRoZSBjb2RlIGNvcnJlY3RseSwgYnV0IHdoZW4gdGhp
cyBoYXBwZW5zIGluIGEKPiA+IHN1c3BlbmQvcmVzdW1lIHNlcXVlbmNlIGl0cyB2YWx1ZSBzaG91
bGQgcHJvYmFibHkgYmUgcmVzdG9yZWQgdG8gdHJ1ZSBpZgo+ID4gYW55IGNvbG9yIG1hbmFnZW1l
bnQgcHJvcGVydHkgd2FzIHNldCBpbiB0aGUgY3J0YyBzdGF0ZSB3aGVuIHN5c3RlbSBlbnRlcmVk
Cj4gPiBzdXNwZW5kLgo+IAo+IFBlcmhhcHMgd2UgY2FuIHVzZSB0aGUgZm9yX2VhY2hfbmV3X2Ny
dGNfaW5fc3RhdGUoKSBoZWxwZXIgaGVyZSwKPiBhbmQgbW92ZSBpdCB0byB0aGUgY29yZSBsaWtl
IHRoaXM6Cj4gCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwo+IEBAIC0zMjM0LDggKzMy
MzQsMjAgQEAgaW50IGRybV9hdG9taWNfaGVscGVyX3Jlc3VtZShzdHJ1Y3QKPiBkcm1fZGV2aWNl
ICpkZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2F0b21pY19z
dGF0ZSAqc3RhdGUpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBkcm1fbW9kZXNldF9hY3F1aXJlX2N0
eCBjdHg7Cj4gKyAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUKPiAqY3J0Y19zdGF0ZTsKPiAr
ICAgICAgIHN0cnVjdCBkcm1fY3J0YyAqY3J0YzsKPiArICAgICAgIHVuc2lnbmVkIGludCBpOwo+
ICAgICAgICAgaW50IGVycjsKPiAgCj4gKyAgICAgICBmb3JfZWFjaF9uZXdfY3J0Y19pbl9zdGF0
ZShzdGF0ZSwgY3J0YywgY3J0Y19zdGF0ZSwgaSkgewo+ICsgICAKPiAgICAgICAgICAgICAvKgo+
ICsgICAgICAgICAgICAgICAgKiBGb3JjZSByZS1lbmFibGVtZW50IG9mIENNTSBhZnRlciBzeXN0
ZW0gcmVzdW1lIGlmIGFueQo+ICsgICAgICAgICAgICAgICAgKiBvZiB0aGUgRFJNIGNvbG9yIHRy
YW5zZm9ybWF0aW9uIHByb3BlcnRpZXMKPiB3YXMgc2V0IGluCj4gKyAgICAgICAgICAgICAgICAq
IHRoZSBzdGF0ZSBzYXZlZCBhdCBzeXN0ZW0gc3VzcGVuZCB0aW1lLgo+ICsgICAgICAgICAgICAg
ICAgKi8KPiArICAgICAgICAgICAgICAgaWYgKGNydGNfc3RhdGUtPmdhbW1hX2x1dCkKPiArICAg
ICAgICAgICAgICAgICAgICAKPiAgICBjcnRjX3N0YXRlLT5jb2xvcl9tZ210X2NoYW5nZWQgPSB0
cnVlOwo+ICsgICAgICAgfQo+IAo+IFRoaXMgcHJvYmFibHkgaXMgd3JvbmcsIGFuZCBzaG91bGQg
YmUgaW5zdGVhZCBjb25zdHJhaW5lZCB0byBzb21lCj4gY29uZGl0aW9uIG9mIHNvbWUgc29ydC4K
PiAKPiBGV0lXLCB0aGUgUm9ja2NoaXAgRFJNIGlzIGdvaW5nIHRvIG5lZWQgdGhpcyBhcyB3ZWxs
Lgo+IAo+IEFueSBpZGVhcz8KClRoYXQncyBtb3JlIG9yIGxlc3Mgd2hhdCBJIGhhZCBpbiBtaW5k
LCB5ZXMuIFRoZSBxdWVzdGlvbiBpcyBpZgpzb21ldGhpbmcgbGlrZSB0aGlzIHdvdWxkIG1ha2Ug
c2Vuc2UuIElmIHRoZXJlJ3MgYSBjb25zZW5zdXMgaXQgd291bGQsIEkKdGhpbmsgaXQgY2FuIGJl
IGRvbmUgYXMgcGFydCBvZiB0aGlzIHNlcmllcy4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5j
aGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16892F39B7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 21:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612486F7B4;
	Thu,  7 Nov 2019 20:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD0B6F7B4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 20:47:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EE9771D;
 Thu,  7 Nov 2019 21:47:06 +0100 (CET)
Date: Thu, 7 Nov 2019 22:46:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 4/7] drm: Define DRM_MODE_CONNECTOR_PARALLEL
Message-ID: <20191107204656.GP24983@pendragon.ideasonboard.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573157463-14070-5-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1573159626;
 bh=5CCn+LusZTnQDr42Vwr6V3gT6kudUv6MM8WIdUKadyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UEjzU/Id1GESLCKXnQK4b2QtXeckfRA9xJQ9Ay3dUdSOCk/+67tYDU6FU4AGyD1Sr
 KbVycvM+ARryp6XNia/Hi/+QufhSEO/UWNbbBTpI0yfwXy30RKi3sDSNEHMXTjKdGA
 5YUAXr66kzFHD4zO4PHCCVpLCFQcSLyv8e7jiKzg=
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
 Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgooQ0MnaW5nIFNhbSkKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24g
VGh1LCBOb3YgMDcsIDIwMTkgYXQgMDg6MTE6MDBQTSArMDAwMCwgRmFicml6aW8gQ2FzdHJvIHdy
b3RlOgo+IFRoZSBleGlzdGluZyBEUk1fTU9ERV9DT05ORUNUT1JfIGRlZmluaXRpb25zIGRvbid0
IHNlZW0gdG8KPiBkZXNjcmliZSB0aGUgY29ubmVjdG9yIGZvciBSR0IvUGFyYWxsZWwgZW1iZWRk
ZWQgZGlzcGxheXMsCj4gaGVuY2UgYWRkIERSTV9NT0RFX0NPTk5FQ1RPUl9QQVJBTExFTC4KClBs
ZWFzZSwgbm8uIFdlIGFscmVhZHkgaGF2ZSB0b28gbWFueSBjb25uZWN0b3IgdHlwZXMgZm9yIHBh
bmVscywgd2hlbgp1c2Vyc3BhY2Ugc2hvdWxkIHJlYWxseSBub3QgY2FyZS4gRFJNX01PREVfQ09O
TkVDVE9SX0xWRFMsCkRSTV9NT0RFX0NPTk5FQ1RPUl9lRFAsIERSTV9NT0RFX0NPTk5FQ1RPUl9E
U0ksIERSTV9NT0RFX0NPTk5FQ1RPUl9EUEkKYW5kIHByb2JhYmx5IERSTV9NT0RFX0NPTk5FQ1RP
Ul9TUEkgc2hvdWxkIGhhdmUgYmVlbgpEUk1fTU9ERV9DT05ORUNUT1JfUEFORUwuCgpUaGlzIGhh
cyBiZWVuIGRpc2N1c3NlZCBpbiBbMV0uIExldCdzIGluc3RlYWQgZGVmaW5lIGEKRFJNX01PREVf
Q09OTkVDVE9SX1BBTkVMLCBwb3NzaWJseSBhcyBhbiBhbGlhcyB0byBvbmUgb2YgdGhlIGV4aXN0
aW5nCnR5cGVzLCBhbmQgZGVwcmVjYXRlIHRoZSBvdGhlciB0eXBlcy4KClsxXSBodHRwczovL3d3
dy5zcGluaWNzLm5ldC9saXN0cy9kcmktZGV2ZWwvbXNnMjI0NjM4Lmh0bWwKCj4gU2lnbmVkLW9m
Zi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+Cj4g
Cj4gLS0tCj4gdjItPnYzOgo+ICogTmV3IHBhdGNoCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9k
cm1fY29ubmVjdG9yLmMgfCAxICsKPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oICAgICB8
IDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9j
b25uZWN0b3IuYwo+IGluZGV4IDIxNjYwMDAuLmIyMzMwMjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29u
bmVjdG9yLmMKPiBAQCAtOTMsNiArOTMsNyBAQCBzdGF0aWMgc3RydWN0IGRybV9jb25uX3Byb3Bf
ZW51bV9saXN0IGRybV9jb25uZWN0b3JfZW51bV9saXN0W10gPSB7Cj4gIAl7IERSTV9NT0RFX0NP
Tk5FQ1RPUl9EUEksICJEUEkiIH0sCj4gIAl7IERSTV9NT0RFX0NPTk5FQ1RPUl9XUklURUJBQ0ss
ICJXcml0ZWJhY2siIH0sCj4gIAl7IERSTV9NT0RFX0NPTk5FQ1RPUl9TUEksICJTUEkiIH0sCj4g
Kwl7IERSTV9NT0RFX0NPTk5FQ1RPUl9QQVJBTExFTCwgIlBhcmFsbGVsIiB9LAo+ICB9Owo+ICAK
PiAgdm9pZCBkcm1fY29ubmVjdG9yX2lkYV9pbml0KHZvaWQpCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaAo+IGlu
ZGV4IDczNWM4Y2YuLjU4NTJmNDcgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1f
bW9kZS5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oCj4gQEAgLTM2Miw2ICsz
NjIsNyBAQCBlbnVtIGRybV9tb2RlX3N1YmNvbm5lY3RvciB7Cj4gICNkZWZpbmUgRFJNX01PREVf
Q09OTkVDVE9SX0RQSQkJMTcKPiAgI2RlZmluZSBEUk1fTU9ERV9DT05ORUNUT1JfV1JJVEVCQUNL
CTE4Cj4gICNkZWZpbmUgRFJNX01PREVfQ09OTkVDVE9SX1NQSQkJMTkKPiArI2RlZmluZSBEUk1f
TU9ERV9DT05ORUNUT1JfUEFSQUxMRUwJMjAKPiAgCj4gIHN0cnVjdCBkcm1fbW9kZV9nZXRfY29u
bmVjdG9yIHsKPiAgCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

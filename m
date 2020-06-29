Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B146B20EF87
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC64789D8E;
	Tue, 30 Jun 2020 07:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473AD89FC9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 08:19:05 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 9C5633AA9B4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 08:15:31 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EB831C000E;
 Mon, 29 Jun 2020 08:15:04 +0000 (UTC)
Date: Mon, 29 Jun 2020 10:15:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5 2/2] drm/panel: simple: Add Satoz SAT050AT40H12R2
 panel support
Message-ID: <20200629101503.5bae21d6@xps13>
In-Reply-To: <20200628072444.GA8391@pendragon.ideasonboard.com>
References: <20200109184037.9091-1-miquel.raynal@bootlin.com>
 <20200109184037.9091-2-miquel.raynal@bootlin.com>
 <20200628072444.GA8391@pendragon.ideasonboard.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:53 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKClsuLi5dCgo+ID4gIAo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGlzcGxh
eV90aW1pbmcgc2F0b3pfc2F0MDUwYXQ0MGgxMnIyX3RpbWluZyA9IHsKPiA+ICsJLnBpeGVsY2xv
Y2sgPSB7MzMzMDAwMDAsIDMzMzAwMDAwLCA1MDAwMDAwMH0sCj4gPiArCS5oYWN0aXZlID0gezgw
MCwgODAwLCA4MDB9LAo+ID4gKwkuaGZyb250X3BvcmNoID0gezE2LCAyMTAsIDM1NH0sCj4gPiAr
CS5oYmFja19wb3JjaCA9IHs0NiwgNDYsIDQ2fSwKPiA+ICsJLmhzeW5jX2xlbiA9IHsxLCAxLCA0
MH0sCj4gPiArCS52YWN0aXZlID0gezQ4MCwgNDgwLCA0ODB9LAo+ID4gKwkudmZyb250X3BvcmNo
ID0gezcsIDIyLCAxNDd9LAo+ID4gKwkudmJhY2tfcG9yY2ggPSB7MjMsIDIzLCAyM30sCj4gPiAr
CS52c3luY19sZW4gPSB7MSwgMSwgMjB9LAo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIGNvbnN0
IHN0cnVjdCBwYW5lbF9kZXNjIHNhdG96X3NhdDA1MGF0NDBoMTJyMiA9IHsKPiA+ICsJLnRpbWlu
Z3MgPSAmc2F0b3pfc2F0MDUwYXQ0MGgxMnIyX3RpbWluZywKPiA+ICsJLm51bV90aW1pbmdzID0g
MSwKPiA+ICsJLmJwYyA9IDgsCj4gPiArCS5zaXplID0gewo+ID4gKwkJLndpZHRoID0gMTA4LAo+
ID4gKwkJLmhlaWdodCA9IDY1LAo+ID4gKwl9LAo+ID4gKwkuYnVzX2Zvcm1hdCA9IE1FRElBX0JV
U19GTVRfUkdCODg4XzFYMjQsCj4gPiArCS5jb25uZWN0b3JfdHlwZSA9IERSTV9NT0RFX0NPTk5F
Q1RPUl9MVkRTLCAgCj4gCj4gSSdtIHRyeWluZyB0byBmaXggaW5jb25zaXN0ZW5jaWVzIGluIHRo
ZSBwYW5lbC1zaW1wbGUgZHJpdmVyLCBhbmQgdGhpcwo+IGNhdWdodCBteSBleWVzLiBNRURJQV9C
VVNfRk1UX1JHQjg4OF8xWDI0IGlzbid0IGEgY29ycmVjdCBmb3JtYXQgZm9yCj4gTFZEUyBwYW5l
bHMuIE1FRElBX0JVU19GTVRfUkdCNjY2XzFYN1gzX1NQV0csCj4gTUVESUFfQlVTX0ZNVF9SR0I4
ODhfMVg3WDRfU1BXRyBvciBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDdYNF9KRUlEQQo+IHNob3Vs
ZCBiZSB1c2VkIGluc3RlYWQuIEFzIEkgY291bGRuJ3QgZmluZCBkb2N1bWVudGF0aW9uIGZvciB0
aGUgcGFuZWwsCj4gSSBjYW4ndCB0ZWxsIHdoaWNoIGZvcm1hdCBpcyBjb3JyZWN0LiBDb3VsZCB5
b3UgcGxlYXNlIGhlbHAgPwoKSW5kZWVkLCBJIGdvdCB0aGlzIGRhdGFzaGVldCB1bmRlciBOREEu
CgpXZSBjaGVja2VkIHdpdGggUGF1bCwgd2UgdGhpbmsgdGhlIHJpZ2h0IGZvcm1hdCBpczoKTUVE
SUFfQlVTX0ZNVF9SR0I4ODhfMVg3WDRfU1BXRy4KClRoYW5rcywKTWlxdcOobApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

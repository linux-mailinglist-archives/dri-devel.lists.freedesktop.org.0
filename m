Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C14E312A242
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE1D6E5C6;
	Tue, 24 Dec 2019 14:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAFB89B57
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 14:12:31 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3DF8E240007;
 Tue, 24 Dec 2019 14:12:26 +0000 (UTC)
Date: Tue, 24 Dec 2019 15:12:22 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: Re: [PATCH v2 3/3] drm/panel: simple: Add Satoz SAT050AT40H12R2
 panel support
Message-ID: <20191224151222.7164810d@xps13>
In-Reply-To: <20191224140551.21227-3-miquel.raynal@bootlin.com>
References: <20191224140551.21227-1-miquel.raynal@bootlin.com>
 <20191224140551.21227-3-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBv
biBUdWUsIDI0IERlYyAyMDE5CjE1OjA1OjUxICswMTAwOgoKPiBBZGQgc3VwcG9ydCBmb3IgdGhl
IFNhdG96IFNBVDA1MEFUNDBIMTJSMiBSR0IgcGFuZWwuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAtLS0KPiAKPiBDaGFuZ2Vz
IHNpbmNlIHYxOgo+ICogU3dpdGNoZWQgdG8gZGlzcGxheV90aW1pbmcncyBpbnN0ZWFkIG9mIGRp
c3BsYXlfbW9kZS4KPiAKPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwg
MjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjggaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiBpbmRleCBh
YzZmNmI1ZDIwMGQuLjAwNTM4NTUzYTE4OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtc2ltcGxlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2ltcGxlLmMKPiBAQCAtMjU1OSw2ICsyNTU5LDMxIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFu
ZWxfZGVzYyBzYW1zdW5nX2x0bjE0MGF0MjlfMzAxID0gewo+ICAJfSwKPiAgfTsKPiAgCj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgZGlzcGxheV90aW1pbmcgc2F0b3pfc2F0MDUwYXQ0MGgxMnIyX3Rp
bWluZyA9IHsKPiArCS5waXhlbGNsb2NrID0geyAzMzMwMDAwMCwgMzMzMDAwMDAsIDUwMDAwMDAw
IH0sCj4gKwkuaGFjdGl2ZSA9IHs4MDAsIDgwMCwgODAwfSwKPiArCS5oZnJvbnRfcG9yY2ggPSB7
MTYsIDIxMCwgMzU0fSwKPiArCS5oYmFja19wb3JjaCA9IHs0NiwgNDYsIDQ2fSwKPiArCS5oc3lu
Y19sZW4gPSB7MSwgMSwgNDB9LAo+ICsJLnZhY3RpdmUgPSB7NDgwLCA0ODAsIDQ4MH0sCj4gKwku
dmZyb250X3BvcmNoID0gezcsIDIyLCAxNDd9LAo+ICsJLnZiYWNrX3BvcmNoID0gezIzLCAyMywg
MjN9LAo+ICsJLnZzeW5jX2xlbiA9IHsxLCAxLCAyMH0sCj4gK307Cj4gKwo+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IHBhbmVsX2Rlc2Mgc2F0b3pfc2F0MDUwYXQ0MGgxMnIyID0gewo+ICsJLnRpbWlu
Z3MgPSAmc2F0b3pfc2F0MDUwYXQ0MGgxMnIyX3RpbWluZywKPiArCS5udW1fdGltaW5ncyA9IDEs
Cj4gKwkuYnBjID0gOCwKPiArCS5zaXplID0gewo+ICsJCS53aWR0aCA9IDEwOCwKPiArCQkuaGVp
Z2h0ID0gNjUsCj4gKwl9LAo+ICsJLmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjg4OF8x
WDI0LAo+ICsJLnJlc2V0X3RpbWUgPSAxMCwKPiArCS5yZXNldF93YWl0ID0gMSwKCkkgZGl0IG5v
dCBnZW5lcmF0ZSB0aGUgcGF0Y2ggZnJvbSB0aGUgcmlnaHQgYnJhbmNoOiB0aGlzIGlzIGEgcHJv
cG9zYWwKZm9yIHRoZSByZXNldCBHUElPIGNoYW5nZSBhbmQgc2hvdWxkIG5vdCBhcHBlYXIgaGVy
ZS4gUGxlYXNlIGZvcmdldAphYm91dCB0aGlzIHNlcmllcywgSSB3aWxsIHJlc3BpbiBhIHYzIHdp
dGhvdXQgdGhlc2UgdHdvIGxpbmVzLgoKU29ycnkgZm9yIHRoZSBub2lzZS4KClRoYW5rcywKTWlx
dcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

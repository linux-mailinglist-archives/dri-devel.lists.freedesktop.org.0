Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0FDCF3D4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132916E271;
	Tue,  8 Oct 2019 07:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80A36E17E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 19:33:45 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMgw47ty6c="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
 with ESMTPSA id v00409v97JXTqry
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Mon, 7 Oct 2019 21:33:29 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [PATCH 4/5] drm/panel: tpo-td028ttec1: Fix SPI
 alias
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191007195849.72562d6b@aktux>
Date: Mon, 7 Oct 2019 21:33:29 +0200
Message-Id: <4524D803-D5C8-4201-B1B3-7EB88FE1460C@goldelico.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
 <20191007170801.27647-5-laurent.pinchart@ideasonboard.com>
 <20191007195849.72562d6b@aktux>
To: Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1570476823; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=hBBDf3WMhkIUZHGfT8GhaY3Pu2txvTnzOFfltNs8rKg=;
 b=fUhuNOAkGa/0ciqqfGi+bINpQTTfOmBC8sQ4HDJB0BeMLNSJgMOnK6cB7rLodvxcif
 5MTnLHMpi2+blQAkds8teQqgrEFbBXiIjr2auVO05Hbbs3m82NHgSOAOl9v+CdTzG4JA
 qpN1WnWzEIOiRld15lmuj9AiJoFOoaukGVOI/JS0Q1bgOb/Cc+V65bFcnWsPcWAl12IG
 EBdgXcI0elOuyvcf6S4Fedtm63Z0h/KP0bSLJygPjV9z6EAx/xXqUUm6YsMLudl+EiRB
 P6O13OZv1A/rPpEuVOdMtXV159T9l9fLqW33YkrCUBr9NSaZifUfGUncDiVP5w+itic0
 flBg==
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
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 thierry.reding@gmail.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gQW0gMDcuMTAuMjAxOSB1bSAxOTo1OCBzY2hyaWViIEFuZHJlYXMgS2VtbmFkZSA8YW5kcmVh
c0BrZW1uYWRlLmluZm8+Ogo+IAo+IE9uIE1vbiwgIDcgT2N0IDIwMTkgMjA6MDg6MDAgKzAzMDAK
PiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdy
b3RlOgo+IAo+PiBUaGUgcGFuZWwtdHBvLXRkMDI4dHRlYzEgZHJpdmVyIGluY29ycmVjdGx5IGlu
Y2x1ZGVzIHRoZSBPRiB2ZW5kb3IKPj4gcHJlZml4IGluIGl0cyBTUEkgYWxpYXMuIEZpeCBpdC4K
Pj4gCj4+IEZpeGVzOiA0MTViOGRkMDg3MTEgKCJkcm0vcGFuZWw6IEFkZCBkcml2ZXIgZm9yIHRo
ZSBUb3Bwb2x5IFREMDI4VFRFQzEgcGFuZWwiKQo+PiBSZXBvcnRlZC1ieTogSC4gTmlrb2xhdXMg
U2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBp
bmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gCj4gVGVzdGVkLWJ5
OiBBbmRyZWFzIEtlbW5hZGUgPGFuZHJlYXNAa2VtbmFkZS5pbmZvPgpUZXN0ZWQtYnk6IEguIE5p
a29sYXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNvLmNvbT4KPiAKPj4gLS0tCj4+IGRyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC10cG8tdGQwMjh0dGVjMS5jIHwgMyArLS0KPj4gMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cG8tdGQwMjh0dGVjMS5jIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXRwby10ZDAyOHR0ZWMxLmMKPj4gaW5kZXggZDdiMmUzNDYyNmVm
Li5mMmJhZmY4MjdmNTAgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC10cG8tdGQwMjh0dGVjMS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10
cG8tdGQwMjh0dGVjMS5jCj4+IEBAIC0zNzUsOCArMzc1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgdGQwMjh0dGVjMV9vZl9tYXRjaFtdID0gewo+PiBNT0RVTEVfREVWSUNF
X1RBQkxFKG9mLCB0ZDAyOHR0ZWMxX29mX21hdGNoKTsKPj4gCj4+IHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgc3BpX2RldmljZV9pZCB0ZDAyOHR0ZWMxX2lkc1tdID0gewo+PiAtCXsgInRwbyx0ZDAyOHR0
ZWMxIiwgMH0sCj4+IC0JeyAidG9wcG9seSx0ZDAyOHR0ZWMxIiwgMCB9LAo+PiArCXsgInRkMDI4
dHRlYzEiLCAwIH0sCj4+IAl7IC8qIHNlbnRpbmVsICovIH0KPj4gfTsKPj4gCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

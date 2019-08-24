Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B59BC9C
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 10:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093026E096;
	Sat, 24 Aug 2019 08:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1246E096
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2019 08:49:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C73B220042;
 Sat, 24 Aug 2019 10:48:52 +0200 (CEST)
Date: Sat, 24 Aug 2019 10:48:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/4] drm/panel: Add missing drm_panel_init() in panel
 drivers
Message-ID: <20190824084851.GA30584@ravnborg.org>
References: <20190823193245.23876-1-laurent.pinchart@ideasonboard.com>
 <20190823193245.23876-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823193245.23876-2-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=XctQEPjzDpzqge3OlGcA:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Philippe Cornu <philippe.cornu@st.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Yannick Fertre <yannick.fertre@st.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jyri Sarha <jsarha@ti.com>,
 Sean Paul <sean@poorly.run>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Purism Kernel Team <kernel@puri.sm>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTA6MzI6NDJQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBQYW5lbHMgbXVzdCBiZSBpbml0aWFsaXNlZCB3aXRoIGRybV9wYW5lbF9pbml0
KCkuIEFkZCB0aGUgbWlzc2luZwo+IGZ1bmN0aW9uIGNhbGwgaW4gdGhlIHBhbmVsLXJhc3BiZXJy
eXBpLXRvdWNoc2NyZWVuLmMgYW5kCj4gcGFuZWwtc2l0cm9uaXgtc3Q3Nzg5di5jIGRyaXZlcnMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPgoKVGhhbmtzLCBnb29kIHRvIGhhdmUgdGhpcyBkb25lIGluIHRoZSBy
aWdodCB3YXkuCgpUaGlzIGRvZXMgbm90IHNvbHZlIGFueSBrbm93IGJ1Z3MgdmlzaWJsZSB0byB1
c2Vycy4gQXQgbGVhc3QgdGhlcmUgYXJlCm5vIHJlcG9ydHMgSSBrbm93IG9mZi4gU28gZm9yIG5v
dyBvbmx5IGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dC4KCglTYW0KCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jIHwgMSArCj4gIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaXRyb25peC1zdDc3ODl2LmMgICAgICAgIHwgMSAr
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVuLmMKPiBpbmRl
eCBiNWIxNGFhMDU5ZWEuLjJhYTg5ZWFlY2Y2ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtcmFzcGJlcnJ5cGktdG91Y2hzY3JlZW4uYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jCj4gQEAgLTQyNiw2
ICs0MjYsNyBAQCBzdGF0aWMgaW50IHJwaV90b3VjaHNjcmVlbl9wcm9iZShzdHJ1Y3QgaTJjX2Ns
aWVudCAqaTJjLAo+ICAJCXJldHVybiBQVFJfRVJSKHRzLT5kc2kpOwo+ICAJfQo+ICAKPiArCWRy
bV9wYW5lbF9pbml0KCZ0cy0+YmFzZSk7Cj4gIAl0cy0+YmFzZS5kZXYgPSBkZXY7Cj4gIAl0cy0+
YmFzZS5mdW5jcyA9ICZycGlfdG91Y2hzY3JlZW5fZnVuY3M7Cj4gIAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3Nzg5di5jIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXNpdHJvbml4LXN0Nzc4OXYuYwo+IGluZGV4IDVlM2U5MmVhOWVh
Ni4uM2IyNjEyYWU5MzFlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaXRyb25peC1zdDc3ODl2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2l0cm9uaXgtc3Q3Nzg5di5jCj4gQEAgLTM4MSw2ICszODEsNyBAQCBzdGF0aWMgaW50IHN0Nzc4
OXZfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKPiAgCXNwaV9zZXRfZHJ2ZGF0YShzcGks
IGN0eCk7Cj4gIAljdHgtPnNwaSA9IHNwaTsKPiAgCj4gKwlkcm1fcGFuZWxfaW5pdCgmY3R4LT5w
YW5lbCk7Cj4gIAljdHgtPnBhbmVsLmRldiA9ICZzcGktPmRldjsKPiAgCWN0eC0+cGFuZWwuZnVu
Y3MgPSAmc3Q3Nzg5dl9kcm1fZnVuY3M7Cj4gIAo+IC0tIAo+IFJlZ2FyZHMsCj4gCj4gTGF1cmVu
dCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

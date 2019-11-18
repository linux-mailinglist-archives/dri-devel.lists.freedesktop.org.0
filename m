Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D54E101B0E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6813A6EC00;
	Tue, 19 Nov 2019 08:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9E389DBD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 14:51:43 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMlw43pqoI="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
 by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vAIEpfTZM
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Mon, 18 Nov 2019 15:51:41 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFCv1 32/42] drm/omap: dsi: convert to drm_panel
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191118144558.abix5y555jk63szb@earth.universe>
Date: Mon, 18 Nov 2019 15:51:44 +0100
Message-Id: <9681B365-9174-43CE-BCAE-ED986F182935@goldelico.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-33-sebastian.reichel@collabora.com>
 <D109D867-1C8E-44F6-9C91-AF55BCB3FDD3@goldelico.com>
 <20191118144558.abix5y555jk63szb@earth.universe>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1574088701; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=4Q0DX8jQIGKw8CJ/saZVBLA56ATthF66g7P4lECTFNM=;
 b=Ce5iRj95sHseNto9Y2sZoYP07Mxq6ZepnYDRIGdWYyhlk5/8PW57O/Ho9MWxHud/AY
 O955kZFxDtM6i1hyrTTtRGfxpDGOX5TINLHvfT/Rt407BRd5iuaUwoQMicms2CjQpsPp
 U3ZY9GPy6TgkPSUGqGesszf+hT++LVHVKMy1JTq9Gdw+QsUUDmHaywlclhf3f0R6i4no
 FVf8tFpEb7BBLBlIzT/W8CibB5pomylbZkg2KNHGRORCtNq8rl36Qrt5RIg/KdlNZpL3
 h5En1seLGKAwrjAhEGWv4+kOXmyrJt9C+aCX9VFlsGjMyi0zTwMrT5k4QIh6Uk0zR8ji
 284Q==
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 Merlijn Wajer <merlijn@wizzup.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gQW0gMTguMTEuMjAxOSB1bSAxNTo0NSBzY2hyaWViIFNlYmFzdGlhbiBSZWljaGVsIDxzZWJh
c3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPjoKPiAKPiBIaSwKPiAKPiBPbiBTdW4sIE5vdiAx
NywgMjAxOSBhdCAwODoyMzowNVBNICswMTAwLCBILiBOaWtvbGF1cyBTY2hhbGxlciB3cm90ZToK
Pj4+IFsuLi5dCj4+IAo+Pj4gKwlkcm1fcGFuZWxfaW5pdCgmZGRhdGEtPnBhbmVsLCBkZXYsICZk
c2ljbV9wYW5lbF9mdW5jcywKPj4+ICsJCSAgICAgICBEUk1fTU9ERV9DT05ORUNUT1JfRFNJKTsK
Pj4+ICsKPj4gCj4+IFRoaXMgbGVhZHMgdG8KPj4gCj4+IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1kc2ktY20uYzogSW4gZnVuY3Rpb24gJ2RzaWNtX3Byb2JlJzoKPj4gZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLWRzaS1jbS5jOjU1MjoyOiBlcnJvcjogdG9vIG1hbnkgYXJndW1lbnRz
IHRvIGZ1bmN0aW9uICdkcm1fcGFuZWxfaW5pdCcKPj4gIGRybV9wYW5lbF9pbml0KCZkZGF0YS0+
cGFuZWwsIGRldiwgJmRzaWNtX3BhbmVsX2Z1bmNzLAo+PiAgXgo+PiBJbiBmaWxlIGluY2x1ZGVk
IGZyb20gZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWRzaS1jbS5jOjIyOjA6Cj4+IC4vaW5j
bHVkZS9kcm0vZHJtX3BhbmVsLmg6MTUwOjY6IG5vdGU6IGRlY2xhcmVkIGhlcmUKPj4gdm9pZCBk
cm1fcGFuZWxfaW5pdChzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7Cj4+ICAgICAgXgo+PiAKPj4g
KHdoZW4gYXBwbGllZCB0byB2NS40LXJjNykKPiAKPiBUaGUgcGF0Y2hzZXQgaXMgYmFzZWQgb24g
ZHJtLW5leHQgZnJvbQo+IGh0dHBzOi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZ2l0L2RybS9k
cm0uZ2l0Cj4gCj4gRm9yIHY1LjQtcmM3IGl0IG5lZWRzIHRvIGxvb2sgbGlrZSB0aGlzOgo+IAo+
ICsJZHJtX3BhbmVsX2luaXQoJmRkYXRhLT5wYW5lbCk7Cj4gKwlkZGF0YS0+cGFuZWwuZGV2ID0g
ZGV2Owo+ICsJZGRhdGEtPnBhbmVsLmZ1bmNzID0gJmRzaWNtX3BhbmVsX2Z1bmNzOwoKQWgsIG9r
LiBUaGUgaXNzdWUgd2l0aCBjaGFuZ2VkIHBhcmFtZXRlcnMgc2VlbXMKdG8gYWxyZWFkeSBiZSBm
aXhlZCBieSB0d28gcGF0Y2hlcyBpbiBsaW51eC1uZXh0CmFuZCB0aGVyZWZvcmUgc29vbiBpbiB2
NS41LXJjMS4KCj4gCj4+PiBbLi4uXSAKPj4gCj4+IE90aGVyd2lzZSB0aGUgcGF0Y2hlcyBjb21w
aWxlIGZpbmUgYW5kIG15IHdvcmstaW4gcHJvZ3Jlc3MKPj4gRFNJIHBhbmVsIGRyaXZlciBpcyBw
cm9iaW5nLCBidXQgbm90IGluaXRpYWxpemluZy4KPiAKPiBPaywgSSB0cmllZCBub3QgdG8gYnJl
YWsgdmlkZW8gbW9kZSBzdXBwb3J0LCBidXQgSSBkbyBub3QgaGF2ZSBhbnkKPiBoYXJkd2FyZS4g
TWFrZSBzdXJlIHRvIHNldCB0aGUgTUlQSV9EU0lfTU9ERV9WSURFTyBmbGFnIGluIHRoZSBwYW5l
bAo+IGRyaXZlci4KCkluZGVlZCwgdGhpcyBtYXkgYmUgbWlzc2luZyAoY2FuJ3QgbG9vayBpbnRv
IHRoZSBjb2RlIGF0IHRoZSBtb21lbnQpLi4uCk9yIEkgZGlkIHNvbWV0aGluZyB3cm9uZyB3aGVu
IHJlZmFjdG9yaW5nIHRoZSBkcml2ZXIuCldlIHdpbGwgZmluZCBvdXQuCgpCUiBhbmQgdGhhbmtz
IGZvciB0aGUgZ3JlYXQgd29yaywKTmlrb2xhdXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=

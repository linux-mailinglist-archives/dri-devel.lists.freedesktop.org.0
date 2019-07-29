Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E6F7A299
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2153C6E432;
	Tue, 30 Jul 2019 07:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364D789CA2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 17:05:51 +0000 (UTC)
Date: Mon, 29 Jul 2019 13:05:21 -0400
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 00/11] JZ4740 SoC cleanup
To: Richard Weinberger <richard.weinberger@gmail.com>
Message-Id: <1564419921.1759.1@crapouillou.net>
In-Reply-To: <CAFLxGvyi0+0E3M12A7cRoHfEKd8-7Yr8EMG9J=2XcjCxPWY5pA@mail.gmail.com>
References: <20190725220215.460-1-paul@crapouillou.net>
 <CAFLxGvyi0+0E3M12A7cRoHfEKd8-7Yr8EMG9J=2XcjCxPWY5pA@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jul 2019 07:55:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1564419948; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ct5sfA9aKEmr8hMlVPpfoX1PCyM/MxIecN3pTsFsbo=;
 b=tGIbEOveRSTKHoZcpg/izsWRXZB3sJbHvlT52bDMqqruC35KNldtJ6Z1UumMknOBTmqxkS
 L0QxFFWQrtfalRctJpTe/AFwPD5hYLu/miXPRxLnpxQZvMuW30gWEtzMHrKJVpyhyW4MrF
 oruZx2tu/qGuw0Xp6xod1DxlnpMTbLU=
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, alsa-devel <alsa-devel@alsa-project.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sre@kernel.org>, od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dmaengine@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUmljaGFyZCwKCgpMZSBsdW4uIDI5IGp1aWwuIDIwMTkgw6AgNzoyMywgUmljaGFyZCBXZWlu
YmVyZ2VyIAo8cmljaGFyZC53ZWluYmVyZ2VyQGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+IE9uIEZy
aSwgSnVsIDI2LCAyMDE5IGF0IDEyOjAyIEFNIFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxs
b3UubmV0PiAKPiB3cm90ZToKPj4gCj4+ICBIaSwKPj4gCj4+ICBUaGlzIHBhdGNoc2V0IGNvbnZl
cnRzIHRoZSBRaSBMQjYwIE1JUFMgYm9hcmQgdG8gZGV2aWNldHJlZSBhbmQgCj4+IG1ha2VzIGl0
Cj4+ICB1c2UgYWxsIHRoZSBzaGlueSBuZXcgZHJpdmVycyB0aGF0IGhhdmUgYmVlbiBkZXZlbG9w
ZWQgb3IgdXBkYXRlZAo+PiAgcmVjZW50bHkuCj4+IAo+PiAgQWxsIHRoZSBjcmFwcHkgb2xkIGRy
aXZlcnMgYW5kIGN1c3RvbSBjb2RlIGNhbiBiZSBkcm9wcGVkIHNpbmNlIHRoZXkKPj4gIGhhdmUg
YmVlbiByZXBsYWNlZCBieSBiZXR0ZXIgYWx0ZXJuYXRpdmVzLgo+PiAKPj4gIFNvbWUgb2YgdGhl
c2UgYWx0ZXJuYXRpdmVzIGFyZSBub3QgeWV0IGluIDUuMy1yYzEgYnV0IGhhdmUgYWxyZWFkeSAK
Pj4gYmVlbgo+PiAgYWNjZXB0ZWQgYnkgdGhlaXIgcmVzcGVjdGl2ZSBtYWludGFpbmVyIGZvciBp
bmNsdXNpb24gaW4gNS40LXJjMS4KPj4gCj4+ICBUbyB1cHN0cmVhbSB0aGlzIHBhdGNoc2V0LCBJ
IHRoaW5rIHRoYXQgYXMgc29vbiBhcyBNSVBTIG1haW50YWluZXJzCj4+ICBhZ3JlZSB0byB0YWtl
IHBhdGNoZXMgMDEtMDMvMTEgYW5kIDExLzExLCB0aGUgb3RoZXIgcGF0Y2hlcyBjYW4gZ28KPj4g
IHRocm91Z2ggdGhlaXIgcmVzcGVjdGl2ZSBtYWludGFpbmVyJ3MgdHJlZS4KPiAKPiBXYXMgdGhp
cyBzZXJpZXMgdGVzdGVkIHdpdGggdGhlIEJlbiBOYW5vbm90ZSBkZXZpY2U/Cj4gSSBoYXZlIG9u
ZSBvZiB0aGVzZSBhbmQgZnJvbSB0aW1lIHRvIHRpbWUgSSB1cGdyYWRlIHRoZSBrZXJuZWwgb24g
aXQuCgpZZXMhIEFydHVyIChDYydkKSB0ZXN0ZWQgaXQuCgpZb3UgY2FuIHRlc3QgaXQgeW91cnNl
bGYsIGFmdGVyIG1lcmdpbmcgdGhpcyBwYXRjaHNldCB3aXRoOgpodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC92a291bC9zbGF2ZS1kbWEuZ2l0IApicmFuY2gg
bmV4dCwKZ2l0Oi8vZ2l0LmZyZWVkZXNrdG9wLm9yZy9naXQvZHJtLW1pc2MgYnJhbmNoIGRybS1t
aXNjLW5leHQuCgpUaGVzZSB3aWxsIGJlIGluIDUuNC1yYzEuCgpDaGVlcnMsCi1QYXVsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

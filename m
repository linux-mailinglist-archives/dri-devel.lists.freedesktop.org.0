Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B2FB3C9F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 16:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046706E99E;
	Mon, 16 Sep 2019 14:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0556E99C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 14:33:48 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1i9s4P-00044Z-Rf; Mon, 16 Sep 2019 16:33:37 +0200
Message-ID: <60da82b157be87d7a1050da47ace80adf2b638f3.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] dts: arm64: imx8mq: Enable gpu passive throttling
From: Lucas Stach <l.stach@pengutronix.de>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Carlo
 Caione <ccaione@baylibre.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Angus Ainslie (Purism)" <angus@akkea.ca>,  etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Date: Mon, 16 Sep 2019 16:33:37 +0200
In-Reply-To: <0ab2ee7de9c2e24f6de860ffcbcdfc25b72c2c61.1568255903.git.agx@sigxcpu.org>
References: <cover.1568255903.git.agx@sigxcpu.org>
 <0ab2ee7de9c2e24f6de860ffcbcdfc25b72c2c61.1568255903.git.agx@sigxcpu.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTWksIDIwMTktMDktMTEgYXQgMTk6NDAgLTA3MDAsIEd1aWRvIEfDvG50aGVyIHdyb3RlOgo+
IFRlbXBlcmF0dXJlIGFuZCBoeXN0ZXJlc2lzIHdlcmUgcGlja2VkIGFmdGVyIHRoZSBDUFUuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KClJldmll
d2VkLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KCj4gLS0tCj4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpIHwgMTUgKysrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpIGIvYXJjaC9hcm02NC9i
b290L2R0cy9mcmVlc2NhbGUvaW14OG1xLmR0c2kKPiBpbmRleCA0ZmRkNjBmMmM1MWUuLjUwMjNh
MGU1MDY4ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4
bXEuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNp
Cj4gQEAgLTIzNSwxMiArMjM1LDI2IEBACj4gIAkJCXRoZXJtYWwtc2Vuc29ycyA9IDwmdG11IDE+
Owo+ICAKPiAgCQkJdHJpcHMgewo+ICsJCQkJZ3B1X2FsZXJ0OiBncHUtYWxlcnQgewo+ICsJCQkJ
CXRlbXBlcmF0dXJlID0gPDgwMDAwPjsKPiArCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+Owo+ICsJ
CQkJCXR5cGUgPSAicGFzc2l2ZSI7Cj4gKwkJCQl9Owo+ICsKPiAgCQkJCWdwdS1jcml0IHsKPiAg
CQkJCQl0ZW1wZXJhdHVyZSA9IDw5MDAwMD47Cj4gIAkJCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsK
PiAgCQkJCQl0eXBlID0gImNyaXRpY2FsIjsKPiAgCQkJCX07Cj4gIAkJCX07Cj4gKwo+ICsJCQlj
b29saW5nLW1hcHMgewo+ICsJCQkJbWFwMCB7Cj4gKwkJCQkJdHJpcCA9IDwmZ3B1X2FsZXJ0PjsK
PiArCQkJCQljb29saW5nLWRldmljZSA9Cj4gKwkJCQkJCTwmZ3B1IFRIRVJNQUxfTk9fTElNSVQg
VEhFUk1BTF9OT19MSU1JVD47Cj4gKwkJCQl9Owo+ICsJCQl9Owo+ICAJCX07Cj4gIAo+ICAJCXZw
dS10aGVybWFsIHsKPiBAQCAtOTEyLDYgKzkyNiw3IEBACj4gIAkJCSAgICAgICAgIDwmY2xrIElN
WDhNUV9DTEtfR1BVX0FYST4sCj4gIAkJCSAgICAgICAgIDwmY2xrIElNWDhNUV9DTEtfR1BVX0FI
Qj47Cj4gIAkJCWNsb2NrLW5hbWVzID0gImNvcmUiLCAic2hhZGVyIiwgImJ1cyIsICJyZWciOwo+
ICsJCQkjY29vbGluZy1jZWxscyA9IDwyPjsKPiAgCQkJYXNzaWduZWQtY2xvY2tzID0gPCZjbGsg
SU1YOE1RX0NMS19HUFVfQ09SRV9TUkM+LAo+ICAJCQkgICAgICAgICAgICAgICAgICA8JmNsayBJ
TVg4TVFfQ0xLX0dQVV9TSEFERVJfU1JDPiwKPiAgCQkJICAgICAgICAgICAgICAgICAgPCZjbGsg
SU1YOE1RX0NMS19HUFVfQVhJPiwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==

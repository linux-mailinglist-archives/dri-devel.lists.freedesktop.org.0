Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20099564A5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B946E329;
	Wed, 26 Jun 2019 08:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290586E329
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 08:33:22 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hg3Ml-0004LD-L5; Wed, 26 Jun 2019 10:33:19 +0200
Message-ID: <1561537996.4870.3.camel@pengutronix.de>
Subject: Re: [PATCH v3 4/4] drm/imx: only send event on crtc disable if kept
 disabled
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>, Robert Beckett <bob.beckett@collabora.com>
Date: Wed, 26 Jun 2019 10:33:16 +0200
In-Reply-To: <20190625202244.GG12905@phenom.ffwll.local>
References: <cover.1561483965.git.bob.beckett@collabora.com>
 <6599f538740632c5524bab86514b8ba026798537.1561483965.git.bob.beckett@collabora.com>
 <20190625202244.GG12905@phenom.ffwll.local>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA2LTI1IGF0IDIyOjIyICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+
IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDA2OjU5OjE1UE0gKzAxMDAsIFJvYmVydCBCZWNrZXR0
IHdyb3RlOgo+ID4gVGhlIGV2ZW50IHdpbGwgYmUgc2VudCBhcyBwYXJ0IG9mIHRoZSB2Ymxhbmsg
ZW5hYmxlIGR1cmluZyB0aGUgbW9kZXNldAo+ID4gaWYgdGhlIGNydGMgaXMgbm90IGJlaW5nIGtl
cHQgZGlzYWJsZWQuCj4gPiAKPiA+IEZpeGVzOiA1ZjJmOTExNTc4ZmIgKCJkcm0vaW14OiBhdG9t
aWMgcGhhc2UgMyBzdGVwIDE6IFVzZSBhdG9taWMgY29uZmlndXJhdGlvbiIpCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IFJvYmVydCBCZWNrZXR0IDxib2IuYmVja2V0dEBjb2xsYWJvcmEuY29tPgo+
IAo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoK
VGhhbmsgeW91LCBwYXRjaGVzIDIgYW5kIDQgYXBwbGllZCB0byBpbXgtZHJtL2ZpeGVzLgoKcmVn
YXJkcwpQaGlsaXBwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==

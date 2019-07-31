Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6879B7EF0D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D48F6ED47;
	Fri,  2 Aug 2019 08:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs24.siol.net [185.57.226.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8BB89A32
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 16:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id 7B0A05209AE;
 Wed, 31 Jul 2019 18:40:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id fXh7Bj71aPKg; Wed, 31 Jul 2019 18:40:08 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 84F755233C1;
 Wed, 31 Jul 2019 18:40:07 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-194-152-11-237.cable.triera.net
 [194.152.11.237]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Zimbra) with ESMTPA id 488405209AE;
 Wed, 31 Jul 2019 18:40:04 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: Add NWL MIPI DSI host controller support
Date: Wed, 31 Jul 2019 18:40:03 +0200
Message-ID: <13373313.BzCyiC4ED7@jernej-laptop>
In-Reply-To: <CAOMZO5Djoi7EuXapkg+dQ6HR2oZZHrw+vnjc837Gxee-Nh00Hw@mail.gmail.com>
References: <cover.1563983037.git.agx@sigxcpu.org>
 <20190731143532.GA1935@bogon.m.sigxcpu.org>
 <CAOMZO5Djoi7EuXapkg+dQ6HR2oZZHrw+vnjc837Gxee-Nh00Hw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, Chris Healy <cphealy@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpEbmUgc3JlZGEsIDMxLiBqdWxpaiAyMDE5IG9iIDE2OjQzOjQ3IENFU1QgamUgRmFiaW8g
RXN0ZXZhbSBuYXBpc2FsKGEpOgo+IEhpIEd1aWRvLAo+IAo+IE9uIFdlZCwgSnVsIDMxLCAyMDE5
IGF0IDExOjM1IEFNIEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+IHdyb3RlOgo+ID4g
VGhlIGlkZWEgaXMgdG8gaGF2ZQo+ID4gCj4gPiAgICAgIiVzYWJsaW5nIHBsYXRmb3JtIGNsb2Nr
cyIsIGVuYWJsZSA/ICJlbiIgOiAiZGlzIik7Cj4gPiAKPiA+IGRlcGVuZGluZyB3aGV0aGVyIGNs
b2NrcyBhcmUgZW5hYmxlZC9kaXNhYmxlZC4KPiAKPiBZZXMsIEkgdW5kZXJzdG9vZCB0aGUgaWRl
YSwgYnV0IHRoaXMgd291bGQgcHJpbnQ6Cj4gCj4gZW5zYWJsaW5nIG9yIGRpc3NhYmxpbmcgOi0p
CgpObywgaXQgd291bGRuJ3QuIFRoYXQgZXh0cmEgInMiIGlzIHBhcnQgb2YgIiVzIiwgZS5nLiBw
YXJ0IG9mIGZvcm1hdCBzcGVjaWZpZXIuCgpCZXN0IHJlZ2FyZHMsCkplcm5lagoKPiAKPiA+ID4g
U2FtZSBoZXJlLiBQbGVhc2UgcmV0dXJuICdpbnQnIGluc3RlYWQuCj4gPiAKPiA+IFRoaXMgaXMg
ZnJvbSBkcm1fYnJpZGdlX2Z1bmNzIHNvIHRoZSBwcm90b3R5cGUgaXMgZml4ZWQuIEknbSBub3Qg
c3VyZQo+ID4gaG93IHdoYXQncyB0aGUgYmVzdCB3YXkgdG8gYnViYmxlIHVwIGZhdGFsIGVycm9y
cyB0aHJvdWdoIHRoZSBkcm0gbGF5ZXI/Cj4gCj4gT2ssIHNvIGxldCdzIG5vdCBjaGFuZ2UgdGhp
cyBvbmUuCj4gCj4gPiBJIHdlbnQgZm9yIERSTV9ERVZfRVJST1IoKSBzaW5jZSB0aGF0IHdoYXQg
aSB1c2VkIGluIHRoZSByZXN0IG9mIHRoZQo+ID4gZHJpdmVyIGFuZCB0aGVzZSBvbmVzIHdlcmUg
b21pc3Npb24uIEhvcGUgdGhhdCdzIG8uay4KPiAKPiBObyBzdHJvbmcgcHJlZmVyZW5jZXMgaGVy
ZS4gSSBqdXN0IHRoaW5rIGRldl9lcnIoKSBlYXNpZXIgdG8gdHlwZSBhbmQKPiBzaG9ydGVyLgo+
IAo+IFRoYW5rcyBmb3IgdGhpcyB3b3JrIQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs

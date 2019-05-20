Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A7522F28
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1080589362;
	Mon, 20 May 2019 08:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 472 seconds by postgrey-1.36 at gabe;
 Mon, 20 May 2019 08:45:18 UTC
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.90.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FC889361;
 Mon, 20 May 2019 08:45:18 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 1FCF52800BC20;
 Mon, 20 May 2019 10:37:24 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id BE197AEB34; Mon, 20 May 2019 10:37:23 +0200 (CEST)
Date: Mon, 20 May 2019 10:37:23 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 30/33] vgaswitcheroo: call fbcon_remap_all directly
Message-ID: <20190520083723.xgjrocuuhwq4mcms@wunner.de>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
 <20190520082216.26273-31-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520082216.26273-31-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-fbdev@vger.kernel.org,
 Yisheng Xie <ysxie@foxmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTA6MjI6MTNBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYwo+ICsrKyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jCj4gQEAgLTMxNDYsMTYgKzMxNDYsMTYgQEAg
dm9pZCBmYmNvbl9mYl91bnJlZ2lzdGVyZWQoc3RydWN0IGZiX2luZm8gKmluZm8pCj4gIH0KPiAg
Cj4gIC8qIGNhbGxlZCB3aXRoIGNvbnNvbGVfbG9jayBoZWxkICovCj4gLXN0YXRpYyB2b2lkIGZi
Y29uX3JlbWFwX2FsbChpbnQgaWR4KQoKVGhhdCBjb21tZW50IG5lZWRzIHRvIGJlIHJlbW92ZWQg
YXMgd2VsbC4KCk5vdCBhbiBleHBlcnQgb24gZmJjb24gY29kZSBidXQgdGhpcyBsb29rcyBzYW5l
IHRvIG1lLCBzbyBpbiBjYXNlIGl0IGhlbHBzOgpBY2tlZC1ieTogTHVrYXMgV3VubmVyIDxsdWth
c0B3dW5uZXIuZGU+CgpUaGFua3MsCgpMdWthcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=

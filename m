Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A4B10EA81
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 14:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4545E6E1CD;
	Mon,  2 Dec 2019 13:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A046E1C0
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 13:07:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7D4D309;
 Mon,  2 Dec 2019 14:07:24 +0100 (CET)
Date: Mon, 2 Dec 2019 15:07:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 3/3] drm/panel: simple: fix osd070t1718_19ts sync drive
 edge
Message-ID: <20191202130717.GI4929@pendragon.ideasonboard.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-4-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114093950.4101-4-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575292045;
 bh=i0NLW6aBvPnI2JrfSoijhQ7ujUPXRt3jer7edIparCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=INI+B1FavbSfFBM+iLJAoQKoHPnvn5dim2vG3BPSXfwkJ+L9kWLiuQXIsov6+Z1GC
 bFeoJMas5gM5u/xqDlkG5zHOso90FahtWQZ+d4T+Pf2mU2cben66dzx7JBTI8R1UDl
 ulAM1HYhXrr0yOuisuhLH75kOrCVkyqPQ1Caw2e0=
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Jyri Sarha <jsarha@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVGh1LCBOb3YgMTQsIDIwMTkg
YXQgMTE6Mzk6NTBBTSArMDIwMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gVGhlIHBhbmVsIGRh
dGFzaGVldCBzYXlzIHRoYXQgdGhlIHBhbmVsIHNhbXBsZXMgYXQgZmFsbGluZyBlZGdlLCBidXQK
PiBkb2VzIG5vdCBzYXkgYW55dGhpbmcgYWJvdXQgaC92IHN5bmMgc2lnbmFscy4gVGVzdGluZyBz
aG93cyB0aGF0IGlmIHRoZQo+IHN5bmMgc2lnbmFscyBhcmUgZHJpdmVuIG9uIGZhbGxpbmcgZWRn
ZSwgdGhlIHBpY3R1cmUgb24gdGhlIHBhbmVsIHdpbGwKPiBiZSBzbGlnaHRseSBzaGlmdGVkIHJp
Z2h0Lgo+IAo+IFNldHRpbmcgc3luYyBkcml2ZSBlZGdlIHRvIHRoZSBzYW1lIGFzIGRhdGEgZHJp
dmUgZWRnZSBmaXhlcyB0aGlzIGlzc3VlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2Vp
bmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+CgpJIGRvbid0IGhhdmUgYWNjZXNzIHRvIHRoZSBk
b2N1bWVudGF0aW9uLCBidXQgdGhpcyBtYWtlcyBzZW5zZSwgc28KCkFja2VkLWJ5OiBMYXVyZW50
IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1zaW1wbGUuYwo+IGluZGV4IDVkNDg3Njg2ZDI1Yy4uMDc4NDUzNmFlNmFmIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+IEBAIC0yMzk3LDcgKzIzOTcsOCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mgb3NkZGlzcGxheXNfb3NkMDcwdDE3MThf
MTl0cyA9IHsKPiAgCQkuaGVpZ2h0ID0gOTEsCj4gIAl9LAo+ICAJLmJ1c19mb3JtYXQgPSBNRURJ
QV9CVVNfRk1UX1JHQjg4OF8xWDI0LAo+IC0JLmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19ERV9I
SUdIIHwgRFJNX0JVU19GTEFHX1BJWERBVEFfRFJJVkVfUE9TRURHRSwKPiArCS5idXNfZmxhZ3Mg
PSBEUk1fQlVTX0ZMQUdfREVfSElHSCB8IERSTV9CVVNfRkxBR19QSVhEQVRBX0RSSVZFX1BPU0VE
R0UgfAo+ICsJCURSTV9CVVNfRkxBR19TWU5DX0RSSVZFX1BPU0VER0UsCj4gIAkuY29ubmVjdG9y
X3R5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfRFBJLAo+ICB9Owo+ICAKCi0tIApSZWdhcmRzLAoK
TGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 543AB10F9E4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 09:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FC46E42B;
	Tue,  3 Dec 2019 08:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7146E42B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 08:34:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 33C3D80478;
 Tue,  3 Dec 2019 09:33:53 +0100 (CET)
Date: Tue, 3 Dec 2019 09:33:51 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 0/26] drm/panel infrastructure + backlight update
Message-ID: <20191203083351.GA30687@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191203072443.GK4730@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203072443.GK4730@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=9hfdOVt4OdhUXmoMrC4A:9 a=CjuIK1q_8ugA:10
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KCj4gPiBUaGlzIHBhdGNoc2V0IGluY2x1ZGUgYSBjb3VwbGUgb2YgZGlmZmVy
ZW50Cj4gPiB0aGluZ3MgLSBhbGwgcmVsYXRlZCB0byBwYW5lbHMuCj4gPiAKPiA+IC0gVGhlIHBh
bmVsIGNhbGxiYWNrcyBhcmUgb3B0aW9uYWwgLSBzbyBkcm9wIGVycm9yIGlmCj4gPiAgIGNhbGxi
YWNrIGlzIG5vdCBwcmVzZW50Lgo+ID4gIAo+ID4gLSBBZGQgc3VwcG9ydCBmb3IgYmFja2xpZ2h0
IGluIGRybV9wYW5lbC4KPiA+ICAgVGhpcyBhbGxvd3MgdXMgdG8gbWFrZSBtdWNoIHNpbXBsZXIg
YmFja2xpZ2h0Cj4gPiAgIHN1cHBvcnQgdG8gbW9zdCBwYW5lbHMuCj4gPiAgIFRoZSBwYXRjaHNl
dCBpbmNsdWRlIGNvbnZlcnNpb24gb2YgbW9zdCBvZiB0aGUKPiA+ICAgdHJpdmlhbCBjYXNlcy4K
PiA+IAo+ID4gLSBEcm9wIGRybV9jb25uZWN0b3IgZnJvbSBkcm1fcGFuZWwuCj4gPiAgIFRoaXMg
Y2hhbmdlIHJlcXVpcmVkIG1hbnkgY2hhbmdlcyB0byBtb3N0Cj4gPiAgIHBhbmVscyBhbmQgbWFu
eSBicmlkZ2VzIGFuZCBkaXNwbGF5IGRyaXZlcnMuCj4gPiAgIFRoaXMgaXMgYnkgZmFyIHRoZSBt
b3N0IGludmFzaXZlIGNoYW5nZSBpbiB0aGlzIHBhdGNoc2V0Lgo+ID4gCj4gPiAtIERyb3AgdGhl
IHVudXNlZCBnZXRfdGltaW5ncygpIGNhbGxiYWNrLgo+ID4gICBObyB1c2Vycywgc28gbm8gbmVl
ZCB0byBrZWVwIGl0IGFyb3VuZC4KPiA+IAo+ID4gV2l0aCB0aGlzIHBhdGNoc2V0IGRybV9wYW5l
bF8oYXR0YWNofGRldGFjaCkgYXJlIG5vcCdzCj4gPiBidXQgdGhleSBhcmUga2VwdCBmb3Igbm93
Lgo+ID4gCj4gPiBBIGZldyBvZiB0aGVzZSBwYXRjaGVzIGhhcyBiZWVuIHNlbnQgb3V0IGJlZm9y
ZSAtIGJ1dCB2ZXJzaW9uaW5nCj4gPiBzdGFydGVkIGFnYWluIGZyb20gdjEgLSBhcyB0aGUgbW9z
dCBwYXRjaGVzIGFyZSBuZXcuCj4gPiAKPiA+IEkgaGF2ZSB0ZXN0ZWQgdGhlIHBhbmVsLXNpbXBs
ZSBjaGFuZ2VzLCBhbmQgdGh1cyBzb21lCj4gPiBvZiB0aGUgaW5mcmFzdHJ1Y3R1cmUgY2hhbmdl
cy4KPiA+IFRoZSB0ZXN0aW5nIHdhcyBkb25lIG9uIGFuIGVhcmxpZXIgaXRlcmF0aW9uIC0gYW5k
IEkgZW5kZWQKPiA+IHVwIHN1Ym1pdHRpbmcgdGhpcyBhcyBMYXVyZW50IGFuZCBvdGhlcnMgc3Rh
cnRlZCB0byBkZXBlbmQgb24gaXQuCj4gPiBKaXRhbyBoYXMgYSBwYXRjaCB0byBhZGQgbW9yZSBj
YWxsYmFja3MsIGFuZCBJIHdhbnRlZCB0aGUKPiA+IHNpbXBsaWZpY2F0aW9uIG9mIHRoZSBjYWxs
YmFja3MgYmVmb3JlIHdlIGFkZCBtb3JlIGNhbGxiYWNrcy4KPiAKPiBHcmVhdCBzZXJpZXMgISEh
IFRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzLgpBbmQgbGlrZXdpc2UgLSB0aGFua3MgZm9yIHRo
ZSBkZXRhaWxlZCByZXZpZXdzIQoKSSBoYXZlIGEgcGF0Y2ggdG8gcmVtb3ZlIGRybV9wYW5lbF8o
YXR0YWNofGRldGFjaCksCmJ1dCB0aGV5IHdhcyBub3QgaW5jbHVkZWQgYmVjYXVzZSB0aGVyZSBp
cyBhbHNvIGEgcGF0Y2hzZXQgZmxvYXRpbmcKdGhhdCBhZGQgbW9yZSBmdW5jdGlvbmFsaXR5IHRv
IHRoZXNlLgoKSSB3aWxsIGFkZHJlc3MgdGhlIGZlZWRiYWNrLCBpdCBsb29rZWQgYWxsIHN0cmFp
Z2hmb3J3YXJkLCBhbmQgcG9zdAphbiB1cGRhdGVkIHNlcmllcy4KCj4gZHJtL3BhbmVsOiByZW1v
dmUgZ2V0X3RpbWluZ3MKSSB3aWxsIGRyb3AgdGhpcyBwYXRjaCBhcyB3ZSBtYXkgbmVlZCB0aGlz
IGxhdGVyLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=

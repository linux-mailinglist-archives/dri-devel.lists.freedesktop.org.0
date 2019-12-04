Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B071124AC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 09:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593456F45E;
	Wed,  4 Dec 2019 08:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163CC6F45F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 08:23:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96AD92E5;
 Wed,  4 Dec 2019 09:23:56 +0100 (CET)
Date: Wed, 4 Dec 2019 10:23:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v1 07/26] drm/panel: remove get_timings
Message-ID: <20191204082349.GA6705@pendragon.ideasonboard.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-8-sam@ravnborg.org>
 <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan>
 <CACRpkdZrReQs08+bXS7s7eJ-K76nMGvRgQ-L-1-baunEtiF40g@mail.gmail.com>
 <20191204081650.4n4ehbub4n7pxdom@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204081650.4n4ehbub4n7pxdom@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575447836;
 bh=nyd4XgcLyCSTsQupfb4xv5PHTwGKyb6g5i8r8JAXHVc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=afblBDczenWomfuQolNaMdlOwLQiZ6lBV1+s5nJP0cq1IIYRBma4GLk/PiEl+OtYX
 p027OZRpAYqWRLrPJbKXCuPmvfGr2Sr42a6ZZYqXhDrEx2SSotyu6yAjzMUGInB7Mt
 j6ljitY8cjSQla2EKxmJfgOxHwZT1feGlJFqj7SI=
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
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF4aW1lLAoKT24gV2VkLCBEZWMgMDQsIDIwMTkgYXQgMDk6MTY6NTBBTSArMDEwMCwgTWF4
aW1lIFJpcGFyZCB3cm90ZToKPiBPbiBUdWUsIERlYyAwMywgMjAxOSBhdCAwNDoyMDoyNFBNICsw
MTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+ID4gT24gVHVlLCBEZWMgMywgMjAxOSBhdCA4OjQ3
IEFNIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4gPgo+ID4gPiBVc2luZyBvbmx5IHRoZSBtb2RlIGFz
IHdlIGRvIGN1cnJlbnRseSBoYXMgYSBidW5jaCBvZiBzaG9ydGNvbWluZ3MgYXMKPiA+ID4gYWxt
b3N0IG5vIGVuY29kZXIgd2lsbCBiZSBhYmxlIHRvIHByb3ZpZGUgdGhlIHR5cGljYWwgcGl4ZWwg
Y2xvY2ssIGFuZAo+ID4gPiB0aGF0IHNpdHVhdGlvbiBsZWFkcyB0byBtdWx0aXBsZSB0aGluZ3M6
Cj4gPiA+Cj4gPiA+ICAgLSBJZiBzb21lb25lIHdvcmtpbmcgb24gb25lIGVuY29kZXIgd2FudHMg
dG8gdXBzdHJlYW0gYSBwYW5lbCB0aGV5Cj4gPiA+ICAgICBoYXZlIHRlc3RlZCwgY2hhbmNlcyBh
cmUgdGhpcyB3aWxsIG5vdCBiZSB0aGUgdHlwaWNhbCBwaXhlbCBjbG9jawo+ID4gPiAgICAgLyB0
aW1pbmdzIGJlaW5nIHVzZWQgYnV0IHJhdGhlciB0aGUgb25lIHRoYXQgd2lsbCBtYXRjaCB3aGF0
IHRoYXQKPiA+ID4gICAgIFNvQyBpcyBjYXBhYmxlIG9mLiBUcm91YmxlIGNvbWVzIHdoZW4gYSBz
ZWNvbmQgdXNlciBjb21lcyBpbiB3aXRoCj4gPiA+ICAgICBhIGRpZmZlcmVudCBlbmNvZGVyIGFu
ZCBkaWZmZXJlbnQgY2FwYWJpbGl0aWVzLCBhbmQgdGhlbiB3ZSBoYXZlIGEKPiA+ID4gICAgIG1h
aW50YWluYW5jZSBmaWdodCBvdmVyIHdoaWNoIHRpbWluZyBpcyB0aGUgdHJ1ZSB0aW1pbmcgKHdp
dGggYQo+ID4gPiAgICAgc2lnbmlmaWNhbnQgY2hhbmNlIHRoYXQgbm9uZSBvZiB0aGVtIGFyZSku
Cj4gPiA+Cj4gPiA+ICAgLSBJZiB3ZSBjYW4ndCBtYXRjaCB0aGUgcGl4ZWwgY2xvY2ssIHdlIGN1
cnJlbnRseSBoYXZlIG5vIGVhc3kgd2F5Cj4gPiA+ICAgICB0byBtYWtlIHRoZSB1c3VhbCBtZWFz
dXJlcyBvZiByZWR1Y2luZyAvIGdyb3dpbmcgdGhlIHBvcmNoZXMgYW5kCj4gPiA+ICAgICBibGFu
a2luZ3MgYXJlYXMgdG8gbWF0Y2ggdGhlIHBpeGVsIGNsb2NrIHdlIGNhbiBwcm92aWRlLCBzaW5j
ZSB3ZQo+ID4gPiAgICAgZG9uJ3QgaGF2ZSBhbiBlYXN5IHdheSB0byBnZXQgdGhlIHRvbGVyYW5j
ZSBvbiB0aG9zZSB0aW1pbmdzIGZvciBhCj4gPiA+ICAgICBnaXZlbiBwYW5lbC4gVGhlcmUncyBz
b21lIGFkIGhvYyBzb2x1dGlvbnMgb24gc29tZSBkcml2ZXJzIChJCj4gPiA+ICAgICB0aGluayB2
YzQgaGFzIHRoYXQ/KSB0byBpZ25vcmUgdGhlIHBhbmVsIGFuZCBqdXN0IHBsYXkgYXJvdW5kIHdp
dGgKPiA+ID4gICAgIHRoZSB0aW1pbmdzLCBidXQgSSB0aGluayB0aGlzIHNob3VsZCBiZSBnZW5l
cmFsaXNlZC4KPiA+Cj4gPiBJJ3ZlIGJlZW4gY29uZnVzZWQgd2l0aCB0aGVzZSB0aGluZ3MgYXMg
dGhleSBsb29rIHRvZGF5IGFuZCBpdCBzZWVtcwo+ID4gdGhlIHdob2xlIHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlIGNvdWxkIG5lZWQgc29tZSBpbXByb3ZlbWVudD8KPiA+Cj4gPiBJZiAuY2xvY2sg
aXMgc3VwcG9zZWQgdG8gYmUgaHRvdGFsICogdnRvdGFsICogdnJlZnJlc2gsIHdoYXQgaXMgdGhl
Cj4gPiAuY2xvY2sgZG9pbmcgdGhlcmUgYW55d2F5Lgo+IAo+IEl0J3Mgb25lIHRoaW5nIEkgd29u
ZGVyIGFzIHdlbGwuIEkgZ3Vlc3MgaXQncyBqdXN0IG1vcmUgY29udmVuaWVudCBmb3IKPiBldmVy
eW9uZSwgc2luY2UgaXQncyBleHBvc2VkIGJ5IHRoZSBWRVNBIG1vZGVzIChpaXJjKSBhbmQgYSBs
b3Qgb2YKPiBkcml2ZXJzIHJlYWxseSBjYXJlIGFib3V0IHRoZSBjbG9jay4KCk15IHVuZGVyc3Rh
bmRpbmcgaXMgdGhhdCB0aGUgY2xvY2sgaXMgdGhlIGF1dGhvcml0YXRpdmUgcGFyYW1ldGVyLCB3
aGlsZQp2cmVmcmVzaCBpcyBvZmZlcmVkIGFzIGEgY29udmVuaWVuY2UgdG8gYXZvaWQgY2FsY3Vs
YXRpbmcgaXQgbWFudWFsbHkKdGhyb3VnaCBkcml2ZXJzLgoKPiA+IFNhZGx5IEkgYW0gdG9vIGlu
ZXhwZXJpZW5jZWQgdG8gcmVhbGl6ZSB3aGVyZSB0aGUgdG9sZXJhbmNlcyBzaG91bGQKPiA+IGJl
IHN0YXRlZCwgYnV0IEkgZ3Vlc3MganVzdCBzdGF0aW5nIHRoYXQgaHN5bmNfc3RhcnQgZXRjIGFy
ZSB0eXBpY2FsLAo+ID4gdGhlbiBzcGVjaWZ5IHNvbWUgdG9sZXJhbmNlIGZvciBlYWNoIHdvdWxk
IGhlbHAgYSBiaXQ/Cj4gCj4gVGhlIHRpbWluZ3Mgc3RydWN0dXJlIGRpc2N1c3NlZCBpbiB0aGUg
cGF0Y2ggdGhhdCBzdGFydGVkIHRoaXMKPiBkaXNjdXNzaW9uIGlzIGFjdHVhbGx5IGRvaW5nIHRo
aXMgbmljZWx5LCB5b3UgaGF2ZSBmb3IgZWFjaCB0aW1pbmcgdGhlCj4gbWluaW11bSwgdHlwaWNh
bCBhbmQgbWF4aW11bSB2YWx1ZS4gVGhlIGN1cnJlbnQgaXNzdWUgd2l0aCBpdCB0aG91Z2gKPiBp
cyB0aGF0IGl0J3MgcHJldHR5IGRpZmZpY3VsdCB0byB1c2UgaXQsIHNpbmNlIGl0J3Mgbm90IHJl
YWxseSB0aWVkIHRvCj4gYW55IG9mIHRoZSBwYW5lbCBjb2RlIChvciBEUk0gaGVscGVycykuIFRo
ZSBvbmx5IGRyaXZlciB0aGF0IHdhcwo+IHN1cHBvcnRpbmcgaXQgd2FzIG9tYXBkcm0gYW5kIGl0
IHdhcyByZW1vdmVkIHJlY2VudGx5Lgo+IAo+IElmIHdlIHJlYWxseSB3YW50ZWQgdG8gc3VwcG9y
dCBpdCwgb25lIHBhdGggZm9yd2FyZCBJIGNhbiBzZWUgd291bGQgYmUKPiB0byBtYWtlIHRoZSB0
aW1pbmdzIHN0cnVjdHVyZSB0aGUgcHJpbWFyeSBvbmUsIGFuZCBvbmx5IHVzZQo+IGRybV9kaXNw
bGF5X21vZGUgZm9yIHVzZXJzcGFjZSBmYWNpbmcgY29kZSwgYW5kIGdlbmVyYXRlIGl0IGZyb20g
dGhlCj4gdGltaW5ncy4gVGhpcyB3b3VsZCBiZSBhIHByZXR0eSBpbnZhc2l2ZSBjaGFuZ2UgdGhv
dWdoLi4uCj4gCj4gPiBPbiB0aGUgRFNJIGRpc3BsYXlzIGluIHZpZGVvIG1vZGUgdGhlcmUgaXMg
YWxzbyB0aGlzIEVPTCBhcmVhCj4gPiB3aGljaCBzZWVtcyB0byBiZSB3aGVyZSB0aGUgbG9naWMg
aXMgbm9ybWFsbHkganVzdCBpZGxpbmcgZm9yIGEKPiA+IHdoaWxlLCB0aGF0IGNhbiBiZSBhZGp1
c3RlZCBvbiBzb21lIGhhcmR3YXJlIGFzIHdlbGwsIGJ1dAo+ID4gSSBkb24ndCBxdWl0ZSB1bmRl
cnN0YW5kIGl0IGFkbWl0dGVkbHkuIFNvbWV0aW1lcyBJIHdvbmRlciBpZgo+ID4gYW55b25lIHJl
YWxseSB1bmRlcnN0YW5kcyBEU0kuLi4gOi8KPiAKPiBJJ20gbm90IGF3YXJlIG9mIGFueSBFT0wg
YXJlYSBpbiBNSVBJLURTSSB0aGF0IHdvdWxkIG1ha2UgdGhlIGhhcmR3YXJlCj4gaWRsZSwgZG9u
J3QgeW91IG1lYW4gTFAtMTE/CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4B8C4193
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 22:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9CF6E822;
	Tue,  1 Oct 2019 20:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9026E822
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 20:08:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8A1F23F;
 Tue,  1 Oct 2019 22:08:15 +0200 (CEST)
Date: Tue, 1 Oct 2019 23:08:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 10/60] drm/bridge: Add bridge driver for display connectors
Message-ID: <20191001200804.GG21064@pendragon.ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-7-laurent.pinchart@ideasonboard.com>
 <6024b178-f4e0-b54a-fcec-ace6ec256048@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6024b178-f4e0-b54a-fcec-ace6ec256048@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1569960496;
 bh=RLMv+8V6wpc/A+eNTCgLuahmlgSshO2lgiOgwJmjJkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kheRiwCOV7hIovBhJtcTbGOY1LD8hWru+zlJyr/ejCtDht60m4sCAXHpMI466SMXm
 1z3FzhxZ1P5Zy7sKYwSrszbvSxmZKQ1rc4T7VNePcnz1FOtgYY+jX8l1pzNrAhOkof
 s0n0gmmZqzAEyepLU/Mo7g6kJFPVCU/AJ3ZrPI2E=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIE1vbiwgU2VwIDMwLCAyMDE5IGF0IDAyOjE1OjIwUE0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDA3LzA3LzIwMTkgMjE6MTgsIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gPiBEaXNwbGF5IGNvbm5lY3RvcnMgYXJlIG1vZGVsbGVkIGluIERUIGFzIGEgZGV2
aWNlIG5vZGUsIGJ1dCBoYXZlIHNvIGZhcgo+ID4gYmVlbiBoYW5kbGVkIG1hbnVhbGx5IGluIHNl
dmVyYWwgYnJpZGdlIGRyaXZlcnMuIFRoaXMgcmVzdWx0ZWQgaW4KPiA+IGR1cGxpY2F0ZSBjb2Rl
IGluIHNldmVyYWwgYnJpZGdlIGRyaXZlcnMsIHdpdGggc2xpZ2h0bHkgZGlmZmVyZW50IChhbmQK
PiA+IHRodXMgY29uZnVzaW5nKSBsb2dpY3MuCj4gPiAKPiA+IEluIG9yZGVyIHRvIGZpeCB0aGlz
LCBpbXBsZW1lbnQgYSBicmlkZ2UgZHJpdmVyIGZvciBkaXNwbGF5IGNvbm5lY3RvcnMuCj4gPiBU
aGUgZHJpdmVyIGNlbnRyYWxpc2VzIGxvZ2ljIGZvciB0aGUgRFZJLCBIRE1JLCBWR0FuIGNvbXBv
c2l0ZSBhbmQKPiA+IFMtdmlkZW8gY29ubmVjdG9ycyBhbmQgZXhwb3NlcyBjb3JyZXNwb25kaW5n
IGJyaWRnZSBvcGVyYXRpb25zLgo+ID4gCj4gPiBUaGlzIGRyaXZlciBpbiBpdHNlbGYgZG9lc24n
dCBzb2x2ZSB0aGUgaXNzdWUgY29tcGxldGVseSwgY2hhbmdlcyBpbgo+ID4gYnJpZGdlIGFuZCBk
aXNwbGF5IGNvbnRyb2xsZXIgZHJpdmVycyBhcmUgbmVlZGVkIHRvIG1ha2UgdXNlIG9mIHRoZSBu
ZXcKPiA+IGNvbm5lY3RvciBkcml2ZXIuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQg
UGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiA+IC0tLQo+ID4g
ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgICAgICAgICAgICAgfCAgMTEgKwo+ID4g
ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlICAgICAgICAgICAgfCAgIDEgKwo+ID4g
ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Rpc3BsYXktY29ubmVjdG9yLmMgfCAzMjcgKysrKysr
KysrKysrKysrKysrKysrCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMzM5IGluc2VydGlvbnMoKykK
PiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZGlzcGxheS1j
b25uZWN0b3IuYwo+IAo+IAo+ID4gKwlkZXZfaW5mbygmcGRldi0+ZGV2LAo+ID4gKwkJICJGb3Vu
ZCAlcyBkaXNwbGF5IGNvbm5lY3RvciAnJXMnICVzIEREQyBidXMgYW5kICVzIEhQRCBHUElPIChv
cHMgMHgleClcbiIsCj4gPiArCQkgZGlzcGxheV9jb25uZWN0b3JfdHlwZV9uYW1lKGNvbm4pLAo+
ID4gKwkJIGNvbm4tPmxhYmVsID8gY29ubi0+bGFiZWwgOiAiPHVubGFiZWxsZWQ+IiwKPiA+ICsJ
CSBjb25uLT5kZGMgPyAid2l0aCIgOiAid2l0aG91dCIsCj4gPiArCQkgY29ubi0+aHBkX2dwaW8g
PyAid2l0aCIgOiAid2l0aG91dCIsCj4gPiArCQkgY29ubi0+YnJpZGdlLm9wcyk7Cj4gCj4gZGV2
X2RiZygpPwoKTWFueSBkcml2ZXJzIHByaW50IGFuIGluZm8gbWVzc2FnZSBhdCBwcm9iZSB0aW1l
IHdoZW4gZXZlcnl0aGluZyBnb2VzCmZpbmUsIHRvIGluZm9ybSBhYm91dCB0aGUgZGV2aWNlIHRo
YXQgaGFzIGJlZW4gc3VjY2VzZnVsbHkgcHJvYmVkLiBEbwp5b3UgdGhpbmsgdGhpcyBpcyBvdmVy
a2lsbCBhbmQgYSBkZXZfZGJnKCkgd291bGQgYmUgYmV0dGVyID8KCi0tIApSZWdhcmRzLAoKTGF1
cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=

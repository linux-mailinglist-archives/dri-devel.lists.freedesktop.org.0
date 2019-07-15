Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CB3698FE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 18:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A0289A1E;
	Mon, 15 Jul 2019 16:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E8A89A1E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 16:28:19 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id F305720029;
 Mon, 15 Jul 2019 18:28:16 +0200 (CEST)
Date: Mon, 15 Jul 2019 18:28:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v1 05/33] drm/mxsfb: drop use of drmP.h
Message-ID: <20190715162815.GC27038@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-6-sam@ravnborg.org>
 <a2727131814fe53ed162853f1215ba45@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2727131814fe53ed162853f1215ba45@agner.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=8AirrxEcAAAA:8 a=JfrnYn6hAAAA:8
 a=XDBTaux0hBuDtJMFZWcA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=AjGcO6oz07-iQ99wixmX:22 a=ST-jHhOKWsTCqRlWije3:22
 a=1CNFftbPRP8L7MoqJWF3:22
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Sam Ravnborg <sam.ravnborg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMTA6NDc6MzBQTSArMDIwMCwgU3RlZmFuIEFnbmVyIHdy
b3RlOgo+IE9uIDIwMTktMDYtMzAgMDg6MTgsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+IERyb3Ag
dXNlIG9mIHRoZSBkZXByZWNhdGVkIGRybVAuaCBoZWFkZXIgZmlsZS4KPiA+IAo+ID4gV2hpbGUg
dG91Y2hpbmcgdGhlIGxpc3Qgb2YgaW5jbHVkZSBmaWxlcyBkaXZpZGVkIHRoZW0KPiA+IGluIGJs
b2NrcyBhbmQgc29ydCB0aGVtIHdpdGhpbiBlYWNoIGJsb2NrLgo+ID4gRml4ZWQgZmFsbG91dCBp
biB0aGUgcmVsZXZhbnQgZmlsZXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiA+IENjOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4K
PiA+IENjOiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KPiA+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgo+ID4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4KPiA+IENjOiBTYXNj
aGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gPiBDYzogUGVuZ3V0cm9uaXggS2Vy
bmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4KPiA+IENjOiBGYWJpbyBFc3RldmFtIDxm
ZXN0ZXZhbUBnbWFpbC5jb20+Cj4gPiBDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAu
Y29tPgo+ID4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IAo+IAo+
IEFja2VkLWJ5OiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KCkFwcGxpZWQsIHRoYW5r
cy4KCkFzIGEgc3RyYW5nZSBub3RlLCB0aGlzIG1haWwgYWxzbyBzaG93ZWQgdXAgaW4gbXkgZ21h
aWwgYWNjb3VudC4KTWF5YmUgYmVjYXVzZSBJIHNlbmQgbWFpbHMgb3V0IHVzaW5nIGdtYWlsIGJ1
dCB0aGUgbWFpbCBhZGRyZXNzIGlzIG5vdAp2aXNpYmxlIGFueXdoZXJlLiBBbnl3YXkgLSBqdXN0
IGEgbm90ZS4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs

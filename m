Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44E063028
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 07:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B71689E4C;
	Tue,  9 Jul 2019 05:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC1789E4C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 05:48:04 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D9CC9804DF;
 Tue,  9 Jul 2019 07:48:00 +0200 (CEST)
Date: Tue, 9 Jul 2019 07:47:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 19/60] drm/panel: Add driver for the LG Philips LB035Q02
 panel
Message-ID: <20190709054759.GA15980@ravnborg.org>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-16-laurent.pinchart@ideasonboard.com>
 <20190708185129.GA4363@ravnborg.org>
 <20190709005649.GC4819@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709005649.GC4819@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=uPZiAMpXAAAA:8
 a=VwQbUJbxAAAA:8 a=EweBOYW7bgBu5vYQIcIA:9 a=QEXdDO2ut3YA:10
 a=mLIokOBbMDMA:10 a=W1xJO3YbG5cA:10 a=AjGcO6oz07-iQ99wixmX:22
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
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KCj4gCj4gPiA+ICsJdW5zaWduZWQgaW50IGk7Cj4gPiAKPiA+IGluZGV4IHRv
IGFycmF5cyBhcmUgZGVmYXVsdCAiaW50IiBJSVJDLgo+ID4gTm90IHRoYXQgaXQgbWF0dGVycyBi
dXQgbm90aWNlZCBpdC4KPiAKPiBBcmUgdGhleSA/IEkndmUgYWx3YXlzIGFkdm9jYXRlZCBmb3Ig
dW5zaWduZWQgaW5kZXhlcyB0byB1c2UgdW5zaWduZWQKPiBpbnQuCgpJIGRpZCBub3QgZGlnIHVw
IGFueXRoaW5nIGF1dGhvcmF0aXZlIC0gYnV0IGZvdW5kIHRoaXM6Cmh0dHBzOi8vc3RhY2tvdmVy
Zmxvdy5jb20vcXVlc3Rpb25zLzgxMTEzNTcvdHlwZS1vZi1hcnJheS1pbmRleC1pbi1jCgpUaGVy
ZSBpcyBzb21lIGNvbmZ1c2lvbiBiZXR3d2VuIHRoZSB0eXBlIG9mIGFycmF5IGFuZCB0aGUgdHlw
ZSBvZiB0aGUKaW5kZXguCkJ1dCB0aGUgcGFydCB0aGF0IGxvb2tzIHRvIGFuc3dlciB0aGUgcXVl
c3Rpb25zIHNheSB0aGF0IGluZGV4IGNhbiBiZQpuZWdhdGl2ZSwgc28gdGhlIGludGVncmFsIHR5
cGUgaXMgZGVmYXVsdCBpbnQuCkFnYWluLCBub3RoaW5nIHRvIHdvcnJ5IGFib3V0LCBhcyBjb2Rl
IHdva3JzIGFuZCB1bnNpZ2VuIGludCBpcyB1c2VkIGZvcgppbmRleCBpbiBtYW55IHBsYWNlcy4K
Cj4gPiA+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7Cj4gPiAKPiA+IFRoaXMgc2hvdWxkIGJlICJH
UEwgdjIiIGlmIEkgcmVhZCBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9w
cm9jZXNzL2xpY2Vuc2UtcnVsZXMuaHRtbAo+ID4gY29ycmVjdC4gU2VlICJNT0RVTEVfTElDRU5T
RSIgdGFibGUuCj4gCj4gQWNjb3JkaW5nIHRvIHRoYXQgdGFibGUsICJHUEwgdjIiIGlzIGRlZmlu
ZWQgYXMgIlNhbWUgYXMg4oCcR1BM4oCdLiBJdAo+IGV4aXN0cyBmb3IgaGlzdG9yaWMgcmVhc29u
cy4iLiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgIkdQTCB2MiIgZXhpc3RzCj4gZm9yIGhpc3Rv
cmljYWwgcmVhc29ucyBhbmQgc2hvdWxkIG5vdCBiZSB1c2VkIGluIG5ldyBjb2RlLgpSZS1yZWFk
aW5nIHRoZSBsaW5rIHlvdSBhcmUgcmlnaHQuIG1vZHVsZSBsaWNlbnNlIGlzIHRvIGJlIHNwZWNp
ZmllZCBhcwoiR1BMIiBhbmQgdGhlbiBvbmUgaGFzIHRvIHZpc2l0IHRoZSBmaWxlLgpTbyBpZ25v
cmUgdGhhdCBjb21tZW50IGluIGZvbGxvd2luZyByZXZpZXdzLgpTZWVtcyBzaW1wbGUgdG8gcmVt
ZW1iZXIsIHdpbGwga2VlcCBpbiBtaW5kIGZvciBmdXR1cmUgcmV2aWV3cy4KCglTYW0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

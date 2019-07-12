Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3905A6732A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 18:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5DB6E245;
	Fri, 12 Jul 2019 16:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807EA6E245
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 16:18:38 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4D68E803E8;
 Fri, 12 Jul 2019 18:18:36 +0200 (CEST)
Date: Fri, 12 Jul 2019 18:18:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/panel: simple: fix AUO g185han01 horizontal blanking
Message-ID: <20190712161834.GA18990@ravnborg.org>
References: <20181112174126.3787-1-l.stach@pengutronix.de>
 <1544793616.3137.44.camel@pengutronix.de>
 <1562764060.23869.12.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562764060.23869.12.camel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10
 a=GxIvO10V52-52CsMNnQA:9 a=wPNLvfGTeEIA:10
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
Cc: Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTHVjYXMuCgo+IEhpIFNhbSwKPiAKPiBzaW5jZSB5b3UndmUgYmVlbiBwaWNraW5nIHVwIHNv
bWUgcGFuZWwgcGF0Y2hlcyBsYXRlbHksIG1pZ2h0IEkgYXNrIHlvdQo+IHRvIHRha2UgYSBsb29r
IGF0IHRoaXMgcGF0Y2g/Cj4gCj4gUmVnYXJkcywKPiBMdWNhcwo+IAo+IEFtIEZyZWl0YWcsIGRl
biAxNC4xMi4yMDE4LCAxNDoyMCArMDEwMCBzY2hyaWViIEx1Y2FzIFN0YWNoOgo+ID4gSGkgVGhp
ZXJyeSwKPiA+IAo+ID4gY2FuIHlvdSBwbGVhc2UgaGF2ZSBhIGxvb2sgYXQgdGhpcyBvbmU/Cj4g
PiAKPiA+IFJlZ2FyZHMsCj4gPiBMdWNhcwo+ID4gCj4gPiBBbSBNb250YWcsIGRlbiAxMi4xMS4y
MDE4LCAxODo0MSArMDEwMCBzY2hyaWViIEx1Y2FzIFN0YWNoOgo+ID4gPiBUaGUgaG9yaXpvbnRh
bCBibGFua2luZyBwZXJpb2RzIGFyZSB0b28gc2hvcnQsIGFzIHRoZSB2YWx1ZXMgYXJlCj4gPiA+
IHNwZWNpZmllZCBmb3IgYSBzaW5nbGUgTFZEUyBjaGFubmVsLiBTaW5jZSB0aGlzIHBhbmVsIGlz
IGR1YWwgTFZEUwo+ID4gPiB0aGV5IG5lZWQgdG8gYmUgZG91YmxlZC4gV2l0aCB0aGlzIGNoYW5n
ZSB0aGUgcGFuZWwgcmVhY2hlcyBpdHMKPiA+ID4gbm9taW5hbCB2cmVmcmVzaCByYXRlIG9mIDYw
RnBzLCBpbnN0ZWFkIG9mIHRoZSA2NEZwcyB3aXRoIHRoZQo+ID4gPiBjdXJyZW50IHdyb25nIGJs
YW5raW5nLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hA
cGVuZ3V0cm9uaXguZGU+Cj4gPiA+IC0tLQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1zaW1wbGUuYyB8IDYgKysrLS0tCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtc2ltcGxlLmMKPiA+ID4gaW5kZXggOTc5NjRmN2YyYWNlLi4yYzg5NzkyZTkxZTIg
MTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+
ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiA+ID4gQEAg
LTY2Myw5ICs2NjMsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgYXVvX2cxMzNo
YW4wMSA9Cj4gPiA+IHsKPiA+ID4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IGRpc3BsYXlfdGltaW5n
IGF1b19nMTg1aGFuMDFfdGltaW5ncyA9IHsKPiA+ID4gwqAJLnBpeGVsY2xvY2sgPSB7IDEyMDAw
MDAwMCwgMTQ0MDAwMDAwLCAxNzUwMDAwMDAgfSwKPiA+ID4gwqAJLmhhY3RpdmUgPSB7IDE5MjAs
IDE5MjAsIDE5MjAgfSwKPiA+ID4gLQkuaGZyb250X3BvcmNoID0geyAxOCwgNjAsIDc0IH0sCj4g
PiA+IC0JLmhiYWNrX3BvcmNoID0geyAxMiwgNDQsIDU0IH0sCj4gPiA+IC0JLmhzeW5jX2xlbiA9
IHsgMTAsIDI0LCAzMiB9LAo+ID4gPiArCS5oZnJvbnRfcG9yY2ggPSB7IDM2LCAxMjAsIDE0OCB9
LAo+ID4gPiArCS5oYmFja19wb3JjaCA9IHsgMjQsIDg4LCAxMDggfSwKPiA+ID4gKwkuaHN5bmNf
bGVuID0geyAyMCwgNDgsIDY0IH0sCj4gPiA+IMKgCS52YWN0aXZlID0geyAxMDgwLCAxMDgwLCAx
MDgwIH0sCj4gPiA+IMKgCS52ZnJvbnRfcG9yY2ggPSB7IDYsIDEwLCA0MCB9LAo+ID4gPiDCoAku
dmJhY2tfcG9yY2ggPSB7IDIsIDUsIDIwIH0sCgpVcGRhdGVkIGNvbW1pdCBsb2cgdG8gaW5jbHVk
ZSBjb21tZW50IGZvcm0gUGhpbGlwcCBhbmQgYXBwbGllZCB0bwpkcm0tbWlzYy1uZXh0LgoKCVNh
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

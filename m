Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1179F064D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 20:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33DB6EAD5;
	Tue,  5 Nov 2019 19:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448E66EAD5
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 19:52:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C457559;
 Tue,  5 Nov 2019 20:52:15 +0100 (CET)
Date: Tue, 5 Nov 2019 21:52:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v6 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20191105195205.GB4869@pendragon.ideasonboard.com>
References: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
 <20191017191400.GH4901@pendragon.ideasonboard.com>
 <CAMuHMdWTCF30+JpztF-p-5JqHS5ALiAs5E0Jo82DCgpu99NZ7w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWTCF30+JpztF-p-5JqHS5ALiAs5E0Jo82DCgpu99NZ7w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1572983536;
 bh=HTRxW1JGt92kEA/NNvUHxAWI1eI7HemP329in2Rcpeo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RCkmw/scmF2sktO/Mcz0LCLM+Po9x2KPgnnqL2mVBICg43zP2Dmgq8wcM8Mz+Ip7g
 SgGRF7Luh8stLyFqQkZmZu0G2OsbpihHj8p9kLtwsQnJ4Uxp2GuM0wF6ijjgx6vcE+
 HDsHV1BcGoeI5ZyzTIen3dXLjPhG/td21ihK1ISw=
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
Cc: Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsCgpPbiBUdWUsIE5vdiAwNSwgMjAxOSBhdCAwNToxNDoyMFBNICswMTAwLCBHZWVy
dCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgOToxNCBQTSBM
YXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gT24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMTA6NTU6
NDBBTSArMDIwMCwgSmFjb3BvIE1vbmRpIHdyb3RlOgo+ID4gPiBNaW5pbWFsIGluY3JlbWVudCB0
byB0aGUgQ01NIHNlcmllcywgdGhpcyB0aW1lIHNob3VsZCByZWFsbHkgYmUgdGhlIGxhc3Qgb25l
Lgo+ID4gPgo+ID4gPiBKdXN0IG1pc3NpbmcgUm9iJ3MgYWNrIG9uIFsxLzhdIGFuZCBMYXVyZW50
J3Mgb25lIG9uIFs1LzhdLgo+ID4gPgo+ID4gPiBDaGFuZ2Vsb2cgaXMgbWluaW1hbDoKPiA+ID4g
Q01NCj4gPiA+IC0gUmVtb3ZlIHRoZSBjbW1fY29uZmlnLmVuYWJsZSBmbGFnLiBUaGUgY21tX2Nv
bmZpZy50YWJsZSBmaWVsZCB2YWxpZGl0eSBpcwo+ID4gPiAgIHVzZWQgdG8gZW5hYmxlL2Rpc2Fi
bGUgdGhlIExVVCBvcGVyYXRpb25zCj4gPiA+IC0gRXhwYW5kIGNvbW1lbnRzIGFzIHN1Z2dlc3Rl
ZCBieSBMYXVyZW50Cj4gPiA+Cj4gPiA+IENSVEMKPiA+ID4gLSB1c2UgZHJtX2NvbG9yX2x1dF9z
aXplKCkgdG8gY2hlY2sgdGhlIExVVCB0YWJsZSBzaXplCj4gPiA+IC0gSW5saW5lIGNhbGxzIHRv
IHJjYXJfY21tX2VuYWJsZSgpL2Rpc2FibGUoKQo+ID4gPiAtIEFkZCBUT0RPIGVudHJpZXMgYXMg
c3VnZ2VzdGVkIGJ5IExhdXJlbnQKPiA+ID4KPiA+ID4gRm9yIHRoZSByZWNvcmQsIHRoZSBmdWxs
IHNlcmllcyBjaGFuZ2Vsb2cgaXMgYXZhaWxhYmxlIGF0Ogo+ID4gPiBodHRwczovL3Bhc3RlLmRl
Ymlhbi5uZXQvMTEwNzQyNy8KPiA+ID4KPiA+ID4gdjUgZnJvbSB5ZXN0ZXJkYXkgd2l0aCBpbmZv
cm1hdGlvbnMgb24gdGVzdGluZyBpcyBhdmFpbGFibGUgYXQ6Cj4gPiA+IGh0dHBzOi8vbGttbC5v
cmcvbGttbC8yMDE5LzEwLzE1LzMzNwo+ID4gPgo+ID4gPiBHZWVydCB3aWxsIHlvdSBjb2xsZWN0
IGZvciBEVFMgcGF0Y2hlcyBmb3IgdGhlIG5leHQgcmVsZWFzZT8KPiA+ID4gSSBhc3N1bWUgdGhl
IERVIGNoYW5nZXMgZ28gdGhyb3VnaCBMYXVyZW50IGluc3RlYWQgPwo+ID4KPiA+IEkndmUgdGFr
ZW4gcGF0Y2ggMS84IHRvIDYvOCBhbmQgOC84IGluIG15IHRyZWUuIEkgZXhwZWN0ZWQgR2VlcnQg
dG8gdGFrZQo+ID4gNy84Lgo+IAo+IEFuZCBzbyBJIGRpZC4gNy84IGlzIG5vdyBpbiBhcm0tc29j
L2Zvci1uZXh0Lgo+IAo+IEhvd2V2ZXIsIHlvdXIgZHJtL2R1L25leHQgYnJhbmNoIHNlZW1zIHRv
IGNvbnRhaW4gNy84IGluc3RlYWQgb2YgOC84PwoKVGhhdCB3YXMgYSBtaXN0YWtlIHRoYXQgSSBm
aXhlZCBpbiBhIHNlY29uZCBwdWxsIHJlcXVlc3QgKHNlZQpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1PY3RvYmVyLzI0MTExMC5odG1sKSwKSSBm
b3Jnb3QgdG8gdXBkYXRlIHRoZSBkcm0vZHUvbmV4dCBicmFuY2gsIGJ1dCB0aGUgdGFnIHNob3Vs
ZCBiZQpjb3JyZWN0LiBJJ3ZlIG5vdyBmaXhlZCB0aGUgcHJvYmxlbSBpbiB0aGUgYnJhbmNoIGFz
IHdlbGwuCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

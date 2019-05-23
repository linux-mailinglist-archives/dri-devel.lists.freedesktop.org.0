Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740892B44D
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD71C89D53;
	Mon, 27 May 2019 12:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41BF89CD9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 12:45:32 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 139CB68AFE; Thu, 23 May 2019 14:45:09 +0200 (CEST)
Date: Thu, 23 May 2019 14:45:08 +0200
From: Torsten Duwe <duwe@lst.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 4/6] drm/bridge: Add Analogix anx6345 support
Message-ID: <20190523124508.GC15685@lst.de>
References: <20190523065013.2719D68B05@newverein.lst.de>
 <20190523065356.0734568BFE@newverein.lst.de>
 <20190523075041.GC4745@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523075041.GC4745@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTA6NTA6NDFBTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBUb3JzdGVuLAo+IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKVGhh
bmsgeW91IGZvciB0aGUgdGhvcm91Z2ggcmV2aWV3IQoKPiBPbiBUaHUsIE1heSAyMywgMjAxOSBh
dCAwODo1Mzo1NkFNICswMjAwLCBUb3JzdGVuIER1d2Ugd3JvdGU6Cj4gPiArewo+ID4gKwlzdHJ1
Y3QgYW54NjM0NSAqYW54NjM0NSA9IGNvbm5lY3Rvcl90b19hbng2MzQ1KGNvbm5lY3Rvcik7Cj4g
PiArCWludCBlcnIsIG51bV9tb2RlcyA9IDA7Cj4gPiArCWJvb2wgcG93ZXJfb2ZmID0gZmFsc2U7
Cj4gPiArCj4gPiArCW11dGV4X2xvY2soJmFueDYzNDUtPmxvY2spOwo+ID4gKwo+ID4gKwlpZiAo
IWFueDYzNDUtPmVkaWQpIHsKPiAKPiBDb3VsZCB0aGUgY2hpcCBiZSB1c2VkIHdpdGggYSBob3Qt
cGx1Z2dhYmxlIGRpc3BsYXksIG9yIGlzIGl0IGd1YXJhbnRlZWQKPiB0aGF0IEVESUQgd2lsbCBu
ZXZlciBjaGFuZ2UgPwoKVGhlIGNoaXAgaXRzZWxmIGlzIGNhcGFibGUgb2YgKGUpRFAgaG90LXBs
dWdnaW5nLCBzbyB0aGUgc2lnbmFscyBzdWdnZXN0LgpTZWUgdGhlIHByZXZpb3VzIGRpc2N1c3Np
b25zIGFib3V0IHdoYXQgdG8gZXhwZWN0IG9uIHRoZSBvdXRwdXQgc2lkZS4KQ3VycmVudGx5LCB0
aGUgZHJpdmVyIGRvZXMgbm90IGhhbmRsZSBob3QtcGx1Z2dpbmcuCgo+ID4gKwo+ID4gKwllcnIg
PSBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UoY2xpZW50LT5kZXYub2Zfbm9kZSwgMSwgMCwK
PiA+ICsJCQkJCSAgJmFueDYzNDUtPnBhbmVsLCBOVUxMKTsKPiA+ICsJaWYgKGVyciA9PSAtRVBS
T0JFX0RFRkVSKQo+ID4gKwkJcmV0dXJuIGVycjsKPiA+ICsKPiA+ICsJaWYgKGVycikKPiA+ICsJ
CURSTV9ERUJVRygiTm8gcGFuZWwgZm91bmRcbiIpOwo+IAo+IFNob3VsZG4ndCB0aGlzIGJlIGZh
dGFsID8KCk5vLCBiYXNpY2FsbHkgc2FtZSBhcyBhYm92ZS4gT24gdGhlIG91dHB1dCBzaWRlLCB0
aGVyZSBjYW4gYmUgYSBwYW5lbCwKYW5vdGhlciBicmlkZ2UsIG9yIHNvbWUgZURQIHBsdWcuIElm
IHRoZSBEVCBkaWRuJ3QgZXhwbGljaXRseSBzcGVjaWZ5CmEgcGFuZWwgb3IgYSBicmlkZ2UsIHdl
IGNhbiBzdGlsbCBnZW5lcmF0ZSB2aWRlbyBvdXRwdXQgYXMgc29vbiBhcwp0aGVyZSBpcyB2YWxp
ZCBFRElEIGRhdGEuCgpZb3VyIG90aGVyIHBvaW50cyB3ZW50IHN0cmFpZ2h0IG9udG8gbXkgVE9E
TyBsaXN0LgoKCVRvcnN0ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==

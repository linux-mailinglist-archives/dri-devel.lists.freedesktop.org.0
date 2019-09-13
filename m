Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231D6B1A64
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 11:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BEF6EEDE;
	Fri, 13 Sep 2019 09:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7B86EEDE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 09:04:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (bl10-204-24.dsl.telepac.pt
 [85.243.204.24])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DFB033A;
 Fri, 13 Sep 2019 11:04:07 +0200 (CEST)
Date: Fri, 13 Sep 2019 12:03:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
Message-ID: <20190913090359.GC29992@pendragon.ideasonboard.com>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1568365447;
 bh=rBMYwvvqL3UBs1e6XFztfLKo2R8+K/g/9AvBH5KoQa0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZpddhD4Wm8ABiqJwt0ssORXff5gBpf5FQpURY4pipMIeYTH48wsk1C7BKluVcFLPD
 o997vSNrqnHnVX7h3Bvsr1PmmEL0fW+vae3NDxcXf4ASWNvaxP82EdHYVZ6rCOw30S
 KUI2lEiRSANkrnCFWRel45Xazuu0hEDEZRFgnB+E=
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
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpPbiBGcmksIFNlcCAxMywgMjAxOSBhdCAxMDoyMToyOUFNICswMjAwLCBTaW1vbiBI
b3JtYW4gd3JvdGU6Cj4gT24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMDE6MDA6NDFQTSArMDMwMCwg
U2VyZ2VpIFNodHlseW92IHdyb3RlOgo+ID4gT24gMTEuMDkuMjAxOSAyMjoyNSwgS2llcmFuIEJp
bmdoYW0gd3JvdGU6Cj4gPiAKPiA+ID4gQWRkIGRpcmVjdCBzdXBwb3J0IGZvciB0aGUgcjhhNzc5
ODAgKFYzSCkuCj4gPiA+IAo+ID4gPiBUaGUgVjNIIHNoYXJlcyBhIGNvbW1vbiwgY29tcGF0aWJs
ZSBjb25maWd1cmF0aW9uIHdpdGggdGhlIHI4YTc3OTcwCj4gPiA+IChWM00pIHNvIHRoYXQgZGV2
aWNlIGluZm8gc3RydWN0dXJlIGlzIHJldXNlZC4KPiA+IAo+ID4gICAgRG8gd2UgcmVhbGx5IG5l
ZWQgdG8gYWRkIHlldCBhbm90aGVyIGNvbXBhdGlibGUgaW4gdGhpcyBjYXNlPwo+ID4gSSBqdXN0
IGFkZGVkIHI4YTc3OTcwIHRvIHRoZSBjb21wYXRpYmxlIHByb3AgaW4gdGhlIHI4YTc3OTgwIERU
LiBUaGF0J3Mgd2h5Cj4gPiBhIHBhdGNoIGxpa2UgdGhpcyBvbmUgZGlkbid0IGdldCBwb3N0ZWQg
YnkgbWUuCj4gCj4gVGhlIHJlYXNvbiBmb3IgaGF2aW5nIHBlci1Tb0MgY29tcGF0IHN0cmluZ3Mg
aXMgdGhhdCB0aGUgSVAgYmxvY2tzCj4gYXJlIG5vdCB2ZXJzaW9uZWQgYW5kIHdoaWxlIHdlIGNh
biBvYnNlcnZlIHRoYXQgdGhlcmUgYXJlIHNpbWlsYXJpdGllcwo+IGJldHdlZW4sIGYuZS4gdGhl
IERVIG9uIHRoZSByOGE3Nzk3MCBhbmQgcjhhNzc5ODAsIHdlIGNhbid0IGJlIGNlcnRhaW4gdGhh
dAo+IGRpZmZlcmVuY2VzIG1heSBub3QgZW1lcmdlIGF0IHNvbWUgcG9pbnQuIEJ5IGhhdmluZyBw
ZXItU29DIGNvbXBhdCBzdHJpbmdzCj4gd2UgaGF2ZSB0aGUgZmxleGliaWxpdHkgZm9yIHRoZSBk
cml2ZXIgdG8gYWRkcmVzcyBhbnkgc3VjaCBkaWZmZXJlbmNlcyBhcwo+IHRoZSBuZWVkIGFyaXNl
cy4KPiAKPiBNeSByZWNvbGxlY3Rpb24gaXMgdGhhdCB0aGlzIHNjaGVtZSBoYXMgYmVlbiBhZG9w
dGVkIGZvciBub24tdmVyc2lvbmVkCj4gUmVuZXNhcyBJUCBibG9ja3Mgc2luY2UgSnVuZSAyMDE1
IGFuZCB1c2VzIG9mIHRoaXMgc2NoZW1lIHdlbGwgYmVmb3JlIHRoYXQuCgpTdXJlLCBidXQgd2Ug
Y291bGQgdXNlCgoJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGR1LXI4YTc3OTgwIiwgInJlbmVzYXMs
ZHUtcjhhNzc5NzAiOwoKaW4gRFQgd2l0aG91dCB1cGRhdGluZyB0aGUgZHJpdmVyLiBJZiB0aGUg
cjhhNzc5ODAgdHVybnMgb3V0IHRvIGJlCmRpZmZlcmVudCwgd2UnbGwgdGhlbiB1cGRhdGUgdGhl
IGRyaXZlciB3aXRob3V0IGEgbmVlZCB0byBtb2RpZnkgRFQuIEknbQpmaW5lIGVpdGhlciB3YXks
IHNvCgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPgoKPiA+ID4gU2lnbmVkLW9mZi1ieTogS2llcmFuIEJpbmdoYW0gPGtpZXJh
bi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogU2lt
b24gSG9ybWFuIDxob3JtcytyZW5lc2FzQHZlcmdlLm5ldC5hdT4KCi0tIApSZWdhcmRzLAoKTGF1
cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=

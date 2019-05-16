Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A48E2086F
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 15:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AD28966C;
	Thu, 16 May 2019 13:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC7B89624
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 13:43:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85D3E320;
 Thu, 16 May 2019 15:43:21 +0200 (CEST)
Date: Thu, 16 May 2019 16:43:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sabyasachi Gupta <sabyasachi.linux@gmail.com>
Subject: Re: [PATCH] drm/bridge: Remove duplicate header
Message-ID: <20190516134304.GK14820@pendragon.ideasonboard.com>
References: <5cda6ee2.1c69fb81.2949b.d3e7@mx.google.com>
 <20190514073542.GA4969@pendragon.ideasonboard.com>
 <CAJr6mf0zy37MTuZQV2YLLQ7dY4a0r6LpSRTKByX0dBBfxuA4_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJr6mf0zy37MTuZQV2YLLQ7dY4a0r6LpSRTKByX0dBBfxuA4_g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1558014201;
 bh=R3GCz5NYOn5z9188GbAXj3i4ePg/ZQ54wfppbrWV8jo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FH2vMp2irks66vtpBn2+2Xt8IBp/vU7Fdzrxj9RzOYh0WeeRePyDsk4qIKgO9j3lw
 aLaGOt7frAvZDQyAhjAscwZW0Cm+nfuigy54EjwiE2dC4P6JhD/wzhDupAsAfa+BIr
 Qa3+YAFyFohxmtPzUe1wzMvlM3ytBAeuvXA24IHE=
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
Cc: architt@codeaurora.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Souptick Joarder <jrdr.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FieWFzYWNoaSwKCk9uIFRodSwgTWF5IDE2LCAyMDE5IGF0IDA2OjQ1OjA0UE0gKzA1MzAs
IFNhYnlhc2FjaGkgR3VwdGEgd3JvdGU6Cj4gT24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTowNSBQ
TSBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gT24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDE6
MDE6NDFQTSArMDUzMCwgU2FieWFzYWNoaSBHdXB0YSB3cm90ZToKPiA+ID4gUmVtb3ZlIGRybS9k
cm1fcGFuZWwuaCB3aGljaCBpcyBpbmNsdWRlZCBtb3JlIHRoYW4gb25jZQo+ID4gPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBTYWJ5YXNhY2hpIEd1cHRhIDxzYWJ5YXNhY2hpLmxpbnV4QGdtYWlsLmNv
bT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMgfCAxIC0K
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3BhbmVsLmMKPiA+ID4gaW5kZXggN2NiYWJhMi4uNDAyYjMxOCAxMDA2NDQKPiA+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvcGFuZWwuYwo+ID4gPiBAQCAtMTUsNyArMTUsNiBAQAo+ID4gPiAgI2luY2x1
ZGUgPGRybS9kcm1fY3J0Y19oZWxwZXIuaD4KPiA+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2VuY29k
ZXIuaD4KPiA+ID4gICNpbmNsdWRlIDxkcm0vZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJsZXMuaD4K
PiA+ID4gLSNpbmNsdWRlIDxkcm0vZHJtX3BhbmVsLmg+Cj4gPgo+ID4gV2hpY2ggdHJlZSBpcyB0
aGlzIGFnYWluc3QgPyBUaGUgcGF0Y2ggYXBwbGllcyBvbiBuZWl0aGVyIGRybS1uZXh0IG5vcgo+
ID4gZHJtLW1pc2MtbmV4dC4KPiA+Cj4gCj4gSXQgaXMgYWdhaW5zdCBsaW51eC1uZXh0IHRyZWUK
CllvdSB3aWxsIGxpa2VseSBoYXZlIHRvIHJlYmFzZSBpdCBvbiB0b3Agb2YgdGhlIGRybS1uZXh0
IG9yCmRybS1uZXh0LW1pc2MgYnJhbmNoLgoKPiA+IFdoaWxlIGF0IGl0LCBjb3VsZCB5b3UgeW91
IHJlb3JkZXIgdGhlIG90aGVyIGhlYWRlciBhbHBoYWJldGljYWxseSB0bwo+ID4gbWFrZSB0aGlz
IGtpbmQgb2YgaXNzdWUgZWFzaWVyIHRvIG5vdGljZSA/Cj4KPiBJdCBpcyBhbHJlYWR5IGFycmFu
Z2VkIGluIGFscGhhYmV0aWNhbCBvcmRlcgoKVGhlcmUncyBhbiAjaW5jbHVkZSA8ZHJtL2RybV9w
YW5lbC5oPiBhdCB0aGUgdG9wIG9mIHRoZSBsaXN0IG9mCmluY2x1ZGVzLiBUaGF0J3MgdGhlIG9u
ZSB0aGF0IGlzIG91dCBvZiBwbGFjZS4KCj4gPiA+Cj4gPiA+ICBzdHJ1Y3QgcGFuZWxfYnJpZGdl
IHsKPiA+ID4gICAgICAgc3RydWN0IGRybV9icmlkZ2UgYnJpZGdlOwoKLS0gClJlZ2FyZHMsCgpM
YXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6852486448
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 16:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2156B6E846;
	Thu,  8 Aug 2019 14:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A716E846
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 14:26:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7746ECC;
 Thu,  8 Aug 2019 16:26:29 +0200 (CEST)
Date: Thu, 8 Aug 2019 17:26:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 00/60] drm/omap: Replace custom display drivers with
 drm_bridge and drm_panel
Message-ID: <20190808142627.GM6055@pendragon.ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190711073726.GE15868@phenom.ffwll.local>
 <20190711115923.xwlppsfgbllxk6so@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190711115923.xwlppsfgbllxk6so@earth.universe>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565274389;
 bh=6bjtQh471camOj28pNNYVph+0IxUPC2VW94FZ3RIOh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vUz7+kfIKwd8tl6kRMzlIOZMewcQvtDXBPCa0qDCr3DvnYT4I13pCmUUtsvETpfqz
 WEHKOvHspScMHqZLvV9ACtLYGCrBegt8NMjEcCDJxfxe53d7zRHy8+wvUMiJj7iq0+
 eid739awSW/wFOmxOINxo25BQ6615SiHiLAaMJpY=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2ViYXN0aWFuLAoKT24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMDE6NTk6MjNQTSArMDIwMCwg
U2ViYXN0aWFuIFJlaWNoZWwgd3JvdGU6Cj4gT24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMDk6Mzc6
MjZBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gWzFdIFRoZSBvbmx5IG5vdGFi
bGUgZXhjZXB0aW9uIGlzIHRoZSBvbWFwZHJtLXNwZWNpZmljIERTSSBwYW5lbCBkcml2ZXIKPiA+
ID4gdGhhdCBpbXBsZW1lbnRzIGEgbGFyZ2UgbnVtYmVyIG9mIGN1c3RvbSBvcGVyYXRpb25zLiBU
aGlzIHNob3VsZCBiZQo+ID4gPiBhZGRyZXNzZWQgc2VwYXJhdGVseS4KPiA+IAo+ID4gRFNJIHRl
bmRzIHRvIGJlIGZhaXJseSBjdXN0b20gaW4gYWxsIGRyaXZlcnMsIEkgdGhpbmsgdGhhdCdzIHRv
dGFsbHkgZmluZS4KPiA+IE1heWJlIG5vdCBmb3JldmVyLCBidXQgd2UgaGF2ZSBhIGxvdCB3b3Jz
ZSBjcmltZXMgaW4gb3VyIGNvZGViYXNlIHRoYW4KPiA+IHRoYXQgOi0pCj4gCj4gSSBoYXZlIGEg
V0lQIGJyYW5jaCwgd2hpY2ggbW92ZXMgb21hcGRybSBEU0kgdG8gbWlwaV9kc2lfZHJpdmVyIGFu
ZAo+IGRybV9wYW5lbDoKPiAKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9zcmUvbGludXgtbjkwMC5naXQvbG9nLz9oPW9tYXBkcm0tNS4yLXdpdGgtZHNp
LXVudGVzdGVkLXdvcmstYnJhbmNoCj4gCj4gVGhlIG5hbWUgaXMgYSBiaXQgbWlzbGVhZGluZywg
c2luY2UgaXQgaXMgdGVzdGVkIG5vdy4gSEVBRH4yLCB3aGljaAo+IG1vdmVzIHRoZSBsYXN0IGN1
c3RvbSBvcGVyYXRpb24gKHBhbmVsIHVwZGF0ZSBmb3IgRFNJIGNvbW1hbmQgbW9kZSkKPiBmcm9t
IHRoZSBwYW5lbCBkcml2ZXIgdG8gdGhlIERTSSBjb3JlIHVuZm9ydHVuYXRsZXkgZG9lcyBub3Qg
eWV0IHdvcmsuCj4gSSdtIHN0aWxsIGludmVzdGlnYXRpbmcgdGhlIHJlYXNvbi4gQW55d2F5cyAt
IHRoaXMgaXMgYmVpbmcgd29ya2VkCj4gb24gOikKCldvcmRzIGZhaWwgbWUgdG8gZXhwcmVzcyBt
eSBncmF0aXR1ZGUgZm9yIHlvdXIgd29yayBvbiB0aGlzIHRvcGljIDotKQoKLS0gClJlZ2FyZHMs
CgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==

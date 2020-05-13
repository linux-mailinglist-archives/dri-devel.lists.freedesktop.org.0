Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFC61D1719
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 16:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C466E184;
	Wed, 13 May 2020 14:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4974E6E184
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:08:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A28E51F;
 Wed, 13 May 2020 16:08:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589378918;
 bh=gh7vku4NSeMzv0KAbhmRoUNTTiQEMMmz2tOWPU+t3L0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DW8Ulm8GXyANsGVzvVAWzAOk5XS36pIHFFHuRpXd2XeugUiSohRQUz9TJb5l8Z0mK
 6VNGO4rVE3YJDcU6uAypWgeEcNmzFju/RrpWTCbtzUrqb8OVmdM35QuRXp5PoYS9O+
 YIR48/JMbXv6oU+RM7cCqj8NLsdr7FFMhYC91WUA=
Date: Wed, 13 May 2020 17:08:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200513140832.GI5945@pendragon.ideasonboard.com>
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
 <20200506155320.GC15206@pendragon.ideasonboard.com>
 <20200513110957.dgb3axle24pmqp3a@rcn-XPS-13-9360>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513110957.dgb3axle24pmqp3a@rcn-XPS-13-9360>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUmljYXJkbywKCk9uIFdlZCwgTWF5IDEzLCAyMDIwIGF0IDAxOjA5OjU3UE0gKzAyMDAsIFJp
Y2FyZG8gQ2HDsXVlbG8gd3JvdGU6Cj4gT24gbWnDqSAwNi0wNS0yMDIwIDE4OjUzOjIwLCBMYXVy
ZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gSSBkaWRuJ3QgaWYgSSByZW1lbWJlciBjb3JyZWN0bHks
IEkganVzdCBtYXBwZWQgaXQgdG8gdGhlIGhhcmR3YXJlCj4gPiBmZWF0dXJlcy4gVGhlIGhhcmR3
YXJlIHJlZ2lzdGVyIGluZGVlZCB0YWtlcyBhIHZhbHVlIGJldHdlZW4gMCBhbmQgNywKPiA+IGFu
ZCB0aGF0IGlzIG1hcHBlZCB0byBbLTQsM10geCB0KFNURVApLiBJIGRvbid0IG1pbmQgZWl0aGVy
IG9wdGlvbi4KPiAKPiBJIHdhcyB0YWtpbmcgYSBsb29rIGF0IHRoZSB0aS10ZnA0MTAuYyBkcml2
ZXIgdG8gc2VlIGlmIGl0IG5lZWRzIGFueQo+IGNoYW5nZXMgdG8gc3VwcG9ydCB0aGUgdXBkYXRl
ZCBkZXNrZXcgcHJvcGVydHkgcmFuZ2VzIFswLTddLCBidXQgSSBkb24ndAo+IGZ1bGx5IHVuZGVy
c3RhbmQgd2hhdCB0aGlzIGRvZXMgKGxpbmUgMjc2KToKPiAKPiAJLyogR2V0IHRoZSBzZXR1cCBh
bmQgaG9sZCB0aW1lIGZyb20gdmVuZG9yLXNwZWNpZmljIHByb3BlcnRpZXMuICovCj4gCW9mX3By
b3BlcnR5X3JlYWRfdTMyKGR2aS0+ZGV2LT5vZl9ub2RlLCAidGksZGVza2V3IiwgKHUzMiAqKSZk
ZXNrZXcpOwo+IAlpZiAoZGVza2V3IDwgLTQgfHwgZGVza2V3ID4gMykKPiAJCXJldHVybiAtRUlO
VkFMOwo+IAo+IAl0aW1pbmdzLT5zZXR1cF90aW1lX3BzID0gbWluKDAsIDEyMDAgLSAzNTAgKiBk
ZXNrZXcpOwo+IAl0aW1pbmdzLT5ob2xkX3RpbWVfcHMgPSBtaW4oMCwgMTMwMCArIDM1MCAqIGRl
c2tldyk7Cj4gCj4gSXQgbG9va3MgbGlrZSB0aGF0IHRoZSBkcml2ZXIgZG9lc24ndCByZWFsbHkg
YXBwbHkgdGhlIGRlc2tldyBzZXR0aW5ncwo+IHRvIHRoZSBkZXZpY2UgYW5kIHRoYXQgdGhpcyBo
YXMgbm90IGJlZW4gcmVhbGx5IHRlc3RlZCwgc28gaXQncyBwcm9iYWJseQo+IG5vdCBhIGJpZyBk
ZWFsLgoKVGhlIGRyaXZlciBkb2Vzbid0IGFwcGx5IGFueSBzZXR0aW5nIHRvIHRoZSBkZXZpY2Ug
Oi0pIFRoZSB0aSxkZXNrZXcKcHJvcGVydHkgaXMgbWVhbnQgdG8gcmVwb3J0IHRoZSBkZXNrZXcg
c2V0dGluZ3Mgc2VsZWN0ZWQgYnkgdGhlIGNoaXAncwpjb25maWd1cmF0aW9uIHBpbnMsIG5vdCB0
byBzZXQgYSB2YWx1ZSB0byBiZSBwcm9ncmFtbWVkIHRvIHRoZSBkZXZpY2UuCgo+IEkgZ3Vlc3Mg
d2hhdCB5b3Ugd2FudGVkIHRvIGRvIHdhcyB0byBhZGp1c3QgdGhlIHNldHVwIGFuZCBob2xkIHRp
bWVzCj4gYXJvdW5kIDEyMDAgYW5kIDEzMDAgcHMgcmVzcGVjdGl2ZWx5IGluIGluY3JlbWVudHMv
ZGVjcmVtZW50cyBvZiAzNTAgcHMKPiBkZXBlbmRpbmcgb24gdGhlIGRlc2tldyB2YWx1ZSwgYXMg
dGhlIGRhdGFzaGVldCBkZXNjcmliZXMuIEJ1dCB0aGlzIGNvZGUKPiB3b3VsZCBzZXQgdGltaW5n
cy0+c2V0dXBfdGltZV9wcyB0byAwIHJlZ2FyZGxlc3Mgb2YgdGhlIGRlc2tldyB2YWx1ZSwKPiBh
bmQgdGltaW5ncy0+aG9sZF90aW1lX3BzIHdvdWxkIGJlIGVpdGhlciAwIG9yIGEgdmVyeSBiaWcg
aW50ZWdlciB2YWx1ZQo+IGlmIGRlc2tldyBpcyAtNCAoYm90aCBzZXR1cF90aW1lX3BzIGFuZCBo
b2xkX3RpbWVfcHMgYXJlIHUzMikuCj4gCj4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZz8gV2FzIHRo
aXMgaW50ZW50aW9uYWw/CgpPb3BzLiBUaGF0J3MgZW1iYXJhc3NpbmcuLi4gSXQgc2hvdWxkIGNs
ZWFybHkgYmUgYSBtYXgoKSwgbm90IGEgbWluKCkuCkFuZCBvbmx5IGZvciBob2xkX3RpbWVfcHMg
aXMgdGhpcyByZXF1aXJlZC4KCldvdWxkIHlvdSBsaWtlIHRvIHNlbmQgYSBwYXRjaCwgb3Igc2hv
dWxkIEkgZG8gc28gPwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

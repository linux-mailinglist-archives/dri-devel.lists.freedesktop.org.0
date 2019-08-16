Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB54890316
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 15:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F996E3F9;
	Fri, 16 Aug 2019 13:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D22E6E3F9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 13:32:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 229F82AF;
 Fri, 16 Aug 2019 15:32:55 +0200 (CEST)
Date: Fri, 16 Aug 2019 16:32:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/2] video: omapfb2: Make standard and custom panel
 drivers mutually exclusive
Message-ID: <20190816133250.GI5020@pendragon.ideasonboard.com>
References: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
 <20190816122228.9475-2-laurent.pinchart@ideasonboard.com>
 <96dc63bc-92b4-6d55-bbf5-006aab111bec@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96dc63bc-92b4-6d55-bbf5-006aab111bec@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565962375;
 bh=zQuiHcnyV1VQtRwKAJBK5yGmDk2uL89nkR9Vk2ocvnI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tcgAJnFglvLxaxjrAIBa8Ce08Sf019Nj3gEcogSKAY8J47s0Ruk0asBDE+3iABbtf
 3H9IsvRNk6Fu4UrcepFQieXoYrXc8x15Sy66XdzecPXx4TDLkDstNLuLAVL20hb9i7
 nKTn5KoHS8JnDznPjIlv+zhAbSpTiF69DE4SintQ=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDQ6MjA6NDZQTSArMDMwMCwgVG9taSBWYWxrZWluZW4g
d3JvdGU6Cj4gT24gMTYvMDgvMjAxOSAxNToyMiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiA+
IFN0YW5kYXJkIERSTSBwYW5lbCBkcml2ZXJzIGZvciBzZXZlcmFsIHBhbmVscyB1c2VkIGJ5IG9t
YXBmYjIgYXJlIG5vdwo+ID4gYXZhaWxhYmxlLiBUaGVpciBtb2R1bGUgbmFtZSBjbGFzaGVzIHdp
dGggdGhlIG1vZHVsZXMgZnJvbQo+ID4gZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZGlzcGxheXMv
LCBwYXJ0IG9mIHRoZSBkZXByZWNhdGVkIG9tYXBmYjIgZmJkZXYKPiAKPiBTaG91bGRuJ3QgdGhh
dCBwYXRoIGJlIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rpc3BsYXlzPwoKQWJz
b2x1dGVseSA6LSkgQ291bGQgdGhpcyBiZSBmaXhlZCB3aGVuIGFwcGx5aW5nID8gT3RoZXJ3aXNl
IEknbGwKc3VibWl0IGEgdjIuCgo+ID4gZHJpdmVyLiBBcyBvbWFwZmIyIGNhbiBvbmx5IGJlIGNv
bXBpbGVkIHdoZW4gdGhlIG9tYXBkcm0gZHJpdmVyIGlzCj4gPiBkaXNhYmxlZCwgYW5kIHRoZSBE
Uk0gcGFuZWwgZHJpdmVycyBhcmUgdXNlbGVzcyBpbiB0aGF0IGNhc2UsIG1ha2UgdGhlCj4gPiBv
bWFwZmIyIHBhbmVscyBkZXBlbmQgb24gdGhlIHN0YW5kYXJkIERSTSBwYW5lbHMgYmVpbmcgZGlz
YWJsZWQgdG8gZml4Cj4gPiB0aGUgbmFtZSBjbGFzaC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
TGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4g
LS0tCj4gPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rpc3BsYXlzL0tjb25m
aWcgfCA1ICsrKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBD
YydkIEJhcnRsb21pZWouCgpPb3BzLCBzb3JyeSwgZm9yZ290IHRvIGRvIHRoYXQgOi1TCgo+IFJl
dmlld2VkLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgoKLS0gClJl
Z2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==

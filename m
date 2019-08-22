Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A8D9A405
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 01:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E746EB88;
	Thu, 22 Aug 2019 23:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7949A6EB88
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 23:42:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 676182B2;
 Fri, 23 Aug 2019 01:42:00 +0200 (CEST)
Date: Fri, 23 Aug 2019 02:41:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 34/50] drm/omap: Create connector for bridges
Message-ID: <20190822234153.GM5027@pendragon.ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-35-laurent.pinchart@ideasonboard.com>
 <20190822190011.6030579d@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822190011.6030579d@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566517320;
 bh=7pFe9oK3J79x9xkuWVGun9/25QKLVaqvF1oUUV0AUyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fy7S5bgMvwXeACEANKESa6F3viHhM0BbFtZT8Nwa3I+1HXC1X7oQoGiLXDino4qon
 S0Qtv/jBe5tU4r+o/zjwO/6bBZTd1iyit/48aYTryIGc03Bt2fg8lyzdcaEUSxGD8S
 5cVWhe0GOXT59GkRtlJUfl8F11NRHyWP59E3ivSA=
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQm9yaXMsCgpPbiBUaHUsIEF1ZyAyMiwgMjAxOSBhdCAwNzowMDoxMVBNICswMjAwLCBCb3Jp
cyBCcmV6aWxsb24gd3JvdGU6Cj4gT24gVHVlLCAyMCBBdWcgMjAxOSAwNDoxNzowNSArMDMwMCBM
YXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gVXNlIHRoZSBkcm1fYnJpZGdlX2Nvbm5lY3RvciBo
ZWxwZXIgdG8gY3JlYXRlIGEgY29ubmVjdG9yIGZvciBwaXBlbGluZXMKPiA+IHRoYXQgdXNlIGRy
bV9icmlkZ2UuIFRoaXMgYWxsb3dzIHNwbGl0dGluZyBjb25uZWN0b3Igb3BlcmF0aW9ucyBhY3Jv
c3MKPiA+IG11bHRpcGxlIGJyaWRnZXMgd2hlbiBuZWNlc3NhcnksIGluc3RlYWQgb2YgaGF2aW5n
IHRoZSBsYXN0IGJyaWRnZSBpbgo+ID4gdGhlIGNoYWluIGNyZWF0aW5nIHRoZSBjb25uZWN0b3Ig
YW5kIGhhbmRsaW5nIGFsbCBjb25uZWN0b3Igb3BlcmF0aW9ucwo+ID4gaW50ZXJuYWxseS4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4gCj4gPiAt
IFNxdWFzaCB3aXRoIHBhdGNoICJkcm0vb21hcDogRGV0YWNoIGZyb20gcGFuZWxzIGF0IHJlbW92
ZSB0aW1lIgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYuYyB8
IDgyICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3
MCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9vbWFwX2Rydi5jCj4gPiBpbmRleCBkZTM3M2ZkNTA3MjkuLmYzOGQ5NWNiMzFiYSAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMKPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMKPiA+IEBAIC0xMSwxMCArMTEsMTIgQEAK
PiA+ICAKPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWMuaD4KPiA+ICAjaW5jbHVkZSA8ZHJt
L2RybV9hdG9taWNfaGVscGVyLmg+Cj4gPiArI2luY2x1ZGUgPGRybS9kcm1fYnJpZGdlX2Nvbm5l
Y3Rvci5oPgo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgo+ID4gICNpbmNsdWRlIDxkcm0v
ZHJtX2ZiX2hlbHBlci5oPgo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KPiA+ICAjaW5j
bHVkZSA8ZHJtL2RybV9pb2N0bC5oPgo+ID4gKyNpbmNsdWRlIDxkcm0vZHJtX3BhbmVsLmg+Cj4g
PiAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbWUuaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9wcm9i
ZV9oZWxwZXIuaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KPiA+IEBAIC0yOTAs
OSArMjkyLDE0IEBAIHN0YXRpYyBpbnQgb21hcF9tb2Rlc2V0X2luaXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldikKPiA+ICAKPiA+ICAJCWlmIChwaXBlLT5vdXRwdXQtPmJyaWRnZSkgewo+ID4gIAkJ
CXJldCA9IGRybV9icmlkZ2VfYXR0YWNoKHBpcGUtPmVuY29kZXIsCj4gPiAtCQkJCQkJcGlwZS0+
b3V0cHV0LT5icmlkZ2UsIE5VTEwsIDApOwo+ID4gLQkJCWlmIChyZXQgPCAwKQo+ID4gKwkJCQkJ
CXBpcGUtPm91dHB1dC0+YnJpZGdlLCBOVUxMLAo+ID4gKwkJCQkJCURSTV9CUklER0VfQVRUQUNI
X05PX0NPTk5FQ1RPUik7Cj4gCj4gSSBndWVzcyB0aGUgb25seSBleHRlcm5hbCBicmlkZ2UgY29u
bmVjdGVkIHRvIGFuIG9tYXAgZGlzcGxheQo+IGNvbnRyb2xsZXIgaW4gdXBzdHJlYW0gRFRzIGlz
IHRoZSBURlA0MTAuCgpObywgdGhlcmUncyBhbHNvIHRoZSBUSSBPUDM2MiAoYW5hbG9nIGFtcGxp
ZXIpIGFuZCBUSSBUUEQxMlMwMTUgKEhETUkKRVNEIHByb3RlY3Rpb24gYW5kIGxldmVsIHNoaWZ0
ZXIpLiBUaG9zZSBhcmUgbm90IHJlYWxseSBlbmNvZGVycywgYnV0CnRoZXkncmUgYnJpZGdlcy4K
Cj4gSSB3YXMgd29uZGVyaW5nIGlmIGZhbGxpbmcgYmFjayB0byAhRFJNX0JSSURHRV9BVFRBQ0hf
Tk9fQ09OTkVDVE9SCj4gd291bGQgYmUgYWNjZXB0YWJsZSBpbiBjYXNlIG9uZSB3YW50cyB0byBj
b252ZXJ0IGEgZGlzcGxheSBjb250cm9sbGVyCj4gZHJpdmVyIHdoaWNoIGlzIGtub3duIHRvIGJl
IHVzZWQgaW4gY29uanVuY3Rpb24gd2l0aCB2YXJpb3VzIGV4dGVybmFsCj4gYnJpZGdlcy4KClll
cywgYSBkaXNwbGF5IGNvbnRyb2xsZXIgY2FuIHN1cHBvcnQgYm90aCBvcHRpb25zLiBJIHdvdWxk
IGhvd2V2ZXIKcmVjb21tZW5kIGFkZHJlc3NpbmcgYnJpZGdlcyBmaXJzdCBpbiBhIGNvbnZlcnNp
b24sIGFuZCBvbmNlIGFsbCBicmlkZ2VzCnVzZWQgYnkgYSBkaXNwbGF5IGNvbnRyb2xsZXIgc3Vw
cG9ydCBEUk1fQlJJREdFX0FUVEFDSF9OT19DT05ORUNUT1IgKGFuZAppbXBsZW1lbnQgdGhlIGNv
bm5lY3RvciBicmlkZ2Ugb3BzKSwgc3dpdGNoIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIgdG8KRFJN
X0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9SIHVuY29uZGl0aW9uYWxseS4KCj4gPiArCQkJaWYg
KHJldCA8IDApIHsKPiA+ICsJCQkJZGV2X2Vycihwcml2LT5kZXYsCj4gPiArCQkJCQkidW5hYmxl
IHRvIGF0dGFjaCBicmlkZ2UgJXBPRlxuIiwKPiA+ICsJCQkJCXBpcGUtPm91dHB1dC0+YnJpZGdl
LT5vZl9ub2RlKTsKPiA+ICAJCQkJcmV0dXJuIHJldDsKPiA+ICsJCQl9Cj4gPiAgCQl9Cj4gPiAg
CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs

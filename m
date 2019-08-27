Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1C49DF01
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A33189842;
	Tue, 27 Aug 2019 07:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0A789842
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 07:48:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 770FA2F0;
 Tue, 27 Aug 2019 09:48:03 +0200 (CEST)
Date: Tue, 27 Aug 2019 10:47:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 13/60] drm/bridge: tfp410: Don't include drmP.h
Message-ID: <20190827074757.GC5054@pendragon.ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-10-laurent.pinchart@ideasonboard.com>
 <3bb82dc4-434a-aaac-8ea1-3aff0991e790@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bb82dc4-434a-aaac-8ea1-3aff0991e790@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566892083;
 bh=U5noo5MOPGqDsysNn8dzwMTXxLadUbcAwMKj+RuUAHk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T7YcRG0xhK45FPABvI59hR/E6A5gOHzuPPM1je4YCSD3xF7EzBJzNYCFJgxTpnG3P
 H5W1EgUHA03W+LbJfBQcZww8h/H4uE7Xo63IQ3Jy5ZPZlo4nAgvH10XGKCysLTzdXt
 GziaOynvpKepxay22FEhj0Owe7Z2730xdtJ3xqeQ=
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
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIFR1ZSwgQXVnIDI3LCAyMDE5IGF0IDA5OjM4OjE4QU0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDA3LzA3LzIwMTkgMjE6MTgsIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gPiBUaGUgZHJtUC5oIGhlYWRlciBpcyBkZXByZWNhdGVkLCByZXBsYWNlIGl0IHdp
dGggdGhlIGhlYWRlcnMKPiA+IHNwZWNpZmljYWxseSBuZWVkZWQgYnkgdGhlIHRmcDQxMCBkcml2
ZXIuIFdoaWxlIGF0IGl0LCByZXBsYWNlIHRoZSBEUk0KPiA+IHByaW50IG1hY3JvcyB3aXRoIGRl
dl9pbmZvKCkgYW5kIGRldl9lcnIoKSBpbnN0ZWFkIG9mIGluY2x1ZGluZwo+ID4gZHJtX3ByaW50
LmgKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGktdGZwNDEwLmMgfCA2ICsrKystLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS90aS10ZnA0MTAuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEw
LmMKPiA+IGluZGV4IDhkNDY5MGU0MzZjMy4uYTFjYWQ3NzdiMDU3IDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS90aS10ZnA0MTAuYwo+ID4gQEAgLTE4LDYgKzE4LDcgQEAKPiA+ICAgI2luY2x1
ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ID4gICAKPiA+ICAgI2luY2x1ZGUgPGRybS9k
cm1fYXRvbWljX2hlbHBlci5oPgo+ID4gKyNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPgo+ID4g
ICAjaW5jbHVkZSA8ZHJtL2RybV9jcnRjLmg+Cj4gPiAgICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50
Lmg+Cj4gPiAgICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgo+IAo+IFlvdSdyZSBu
b3QgYWN0dWFsbHkgcmVtb3ZpbmcgZHJtUC5oLiBTbyBpcyB0aGUgZHJtX2JyaWRnZS5oIG5lZWRl
ZD8KCkEgcHJldmlvdXMgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggZGlkLCBhbmQgSSBkaWRuJ3Qgbm90
aWNlIHNvbWVvbmUgYmVhdCBtZQp0byBpdCA6LSkgZHJtX2JyaWRnZS5oIGlzIG5lZWRlZCBidXQg
aXMgaW5jbHVkZWQgdGhyb3VnaCBkcm1fY3J0Yy5oLgpOb3RlIHRoYXQgQm9yaXMgaGFzIHN1Ym1p
dHRlZCAiW1BBVENIIHYyIDAxLzIxXSBkcm06IFN0b3AgaW5jbHVkaW5nCmRybV9icmlkZ2UuaCBm
cm9tIGRybV9jcnRjLmgiIHdoaWNoIHdpbGwgY2hhbmdlIHRoaXMsIGFuZCBpbmNsdWRlCmRybV9i
cmlkZ2UuaCBleHBsaWNpdGx5IGluIHRoaXMgZHJpdmVyLCBzbyBJJ2xsIGRyb3AgdGhpcyBwYXRj
aC4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

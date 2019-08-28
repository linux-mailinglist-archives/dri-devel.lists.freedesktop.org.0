Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374CA0B66
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 22:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98E689C98;
	Wed, 28 Aug 2019 20:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D1889C98
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 20:27:43 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 39CF528D29B;
 Wed, 28 Aug 2019 21:27:40 +0100 (BST)
Date: Wed, 28 Aug 2019 22:27:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 08/21] drm/msm: Use drm_attach_bridge() to attach a
 bridge to an encoder
Message-ID: <20190828222734.757d3171@collabora.com>
In-Reply-To: <CAMavQKLrOxE=3-bbVRxH+ghnapFTaWas0BEK5dcM5EMABuz7rg@mail.gmail.com>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
 <20190826152649.13820-9-boris.brezillon@collabora.com>
 <20190828152257.GB218215@art_vandelay>
 <20190828172533.4f24a37d@collabora.com>
 <CAMavQKLrOxE=3-bbVRxH+ghnapFTaWas0BEK5dcM5EMABuz7rg@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <Chris.Healy@zii.aero>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyOCBBdWcgMjAxOSAxMTozMDo0MyAtMDQwMApTZWFuIFBhdWwgPHNlYW5AcG9vcmx5
LnJ1bj4gd3JvdGU6Cgo+IE9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDExOjI1IEFNIEJvcmlzIEJy
ZXppbGxvbgo+IDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
T24gV2VkLCAyOCBBdWcgMjAxOSAxMToyMjo1NyAtMDQwMAo+ID4gU2VhbiBQYXVsIDxzZWFuQHBv
b3JseS5ydW4+IHdyb3RlOgo+ID4gIAo+ID4gPiBPbiBNb24sIEF1ZyAyNiwgMjAxOSBhdCAwNToy
NjozNlBNICswMjAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6ICAKPiA+ID4gPiBUaGlzIGlzIHBh
cnQgb2Ygb3VyIGF0dGVtcHQgdG8gbWFrZSB0aGUgYnJpZGdlIGNoYWluIGEgZG91YmxlLWxpbmtl
ZAo+ID4gPiA+IGxpc3QgYmFzZWQgb24gdGhlIGdlbmVyaWMgbGlzdCBoZWxwZXJzLiBJbiBvcmRl
ciB0byBkbyB0aGF0LCB3ZSBtdXN0Cj4gPiA+ID4gcGF0Y2ggYWxsIGRyaXZlcnMgbWFuaXB1bGF0
aW5nIHRoZSBlbmNvZGVyLT5icmlkZ2UgZmllbGQgZGlyZWN0bHkuCj4gPiA+ID4KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEu
Y29tPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+
Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4gIAo+ID4gPgo+ID4gPiBEbyB5b3Ugd2FudCB0byB0YWtlIHRoaXMg
dGhyb3VnaCAtbWlzYz8KPiA+ID4KPiA+ID4gUmV2aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBw
b29ybHkucnVuPiAgCj4gPgo+ID4gWWVzLCB0aGF0IHdhcyB0aGUgcGxhbiwgdW5sZXNzIHlvdSB3
YW50IHRvIGFwcGx5IGl0IHRvIHRoZSBtc20gdHJlZQo+ID4gKG5vdCBzdXJlIGlmIHRoZXJlJ3Mg
c3VjaCBhIHRyZWUpLgo+ID4gIAo+IAo+IFRoZXJlIGlzLCBidXQgSSB0aGluayBpdCdzIGZpbmUg
dG8gdGFrZSB0aGlzIHRocm91Z2ggLW1pc2MuCgpRdWV1ZWQgdG8gZHJtLW1pc2MtbmV4dC4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

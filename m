Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650C297BD7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 16:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F276E3E1;
	Wed, 21 Aug 2019 14:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8C06E3E1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 14:01:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3854133D;
 Wed, 21 Aug 2019 16:01:41 +0200 (CEST)
Date: Wed, 21 Aug 2019 17:01:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH RFC 05/19] drm/exynos: Don't reset bridge->next
Message-ID: <20190821140135.GC5433@pendragon.ideasonboard.com>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
 <20190808151150.16336-6-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808151150.16336-6-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566396101;
 bh=eVxxREP9ICoo/vFjQTA7WPnsDvm58R5vwNoIGBU05T0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BC4QlaMbH+2XPY0aE9Z5xpYwmHxIvZvA67qyfEqqeQxt9FEjuuSV25rAwoHpyscdF
 22rs5PQQPGCTyswu+WL6w4e2biCaUePi8wWg5qDG5rBWWUq1BYiWzjRZZZ2g5HbldS
 QZPrw39dMpj6VqktbhQwp+Dgl6As/FDONNTdEqNM=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQm9yaXMsCgpPbiBUaHUsIEF1ZyAwOCwgMjAxOSBhdCAwNToxMTozNlBNICswMjAwLCBCb3Jp
cyBCcmV6aWxsb24gd3JvdGU6Cj4gYnJpZGdlLT5uZXh0IGlzIG9ubHkgcG9pbnRzIHRvIHRoZSBu
ZXcgYnJpZGdlIGlmIGRybV9icmlkZ2VfYXR0YWNoKCkKPiBzdWNjZWVkcy4gTm8gbmVlZCB0byBy
ZXNldCBpdCBtYW51YWxseSBoZXJlLgo+IAo+IE5vdGUgdGhhdCB0aGlzIGNoYW5nZSBpcyBwYXJ0
IG9mIHRoZSBhdHRlbXB0IHRvIG1ha2UgdGhlIGJyaWRnZSBjaGFpbgo+IGEgZG91YmxlLWxpbmtl
ZCBsaXN0LiBJbiBvcmRlciB0byBkbyB0aGF0IHdlIG11c3QgcGF0Y2ggYWxsIGRyaXZlcnMKPiBt
YW5pcHVsYXRpbmcgdGhlIGJyaWRnZS0+bmV4dCBmaWVsZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBC
b3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgoKVGhpcyBsb29r
cyBnb29kIHRvIG1lIGFzIGEgY2xlYW51cCwgYW5kIEkgdGhpbmsgeW91IGNhbiBhbHJlYWR5IHB1
c2ggaXQKd2l0aG91dCB3YWl0aW5nIGZvciB0aGUgd2hvbGUgc2VyaWVzIHRvIGJlIHJlYWR5LgoK
UmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RwLmMgfCAx
IC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RwLmMKPiBpbmRleCAxZTZhYTI0YmY0NWUuLjQ3ODU4ODVjMGY0ZiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHAuYwo+IEBAIC0xMTAsNyArMTEwLDYgQEAgc3RhdGljIGlu
dCBleHlub3NfZHBfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgYW5hbG9naXhfZHBfcGxhdF9kYXRhICpw
bGF0X2RhdGEsCj4gIAkJaWYgKHJldCkgewo+ICAJCQlEUk1fREVWX0VSUk9SKGRwLT5kZXYsCj4g
IAkJCQkgICAgICAiRmFpbGVkIHRvIGF0dGFjaCBicmlkZ2UgdG8gZHJtXG4iKTsKPiAtCQkJYnJp
ZGdlLT5uZXh0ID0gTlVMTDsKPiAgCQkJcmV0dXJuIHJldDsKPiAgCQl9Cj4gIAl9CgotLSAKUmVn
YXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5664B86873
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 20:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1578F6E8A4;
	Thu,  8 Aug 2019 18:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449346E8A4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 18:05:57 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5BBC3804FE;
 Thu,  8 Aug 2019 20:05:53 +0200 (CEST)
Date: Thu, 8 Aug 2019 20:05:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH RFC 01/19] drm: Stop including drm_bridge.h from drm_crtc.h
Message-ID: <20190808180551.GA26160@ravnborg.org>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
 <20190808151150.16336-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808151150.16336-2-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=9YYDV24nRMEkEGgsH-UA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQm9yaXMuCgpHb29kIHRvIHNlZSB0aGF0IHlvdSBrZXB0IHRoZSBhbHBoYWJldGljYWwgb3Jk
ZXIgaW4gdGhlIGluY2x1ZGUgZmlsZXMuCk9uZSBuaXQgYmVsb3cuCldpdGggdGhpcyBmaXhlZDoK
UmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KCglTYW0KCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmggYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2hkbWkvaGRtaS5oCj4gaW5kZXggOTgyODY1ODY2YTI5Li5jNjgxYTllMjI0ODQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hkbWkuaAo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmgKPiBAQCAtNyw2ICs3LDggQEAKPiAgI2lmbmRlZiBf
X0hETUlfQ09OTkVDVE9SX0hfXwo+ICAjZGVmaW5lIF9fSERNSV9DT05ORUNUT1JfSF9fCj4gIAo+
ICsjaW5jbHVkZSA8ZHJtL2RybV9icmlkZ2UuaD4KPiArCj4gICNpbmNsdWRlIDxsaW51eC9pMmMu
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+CgpQbGVhc2UgZm9sbG93IHRoZSBzYW1lIG9yZGVyIG9mIGluY2x1ZGUgYmxvY2tz
IGFzIHdlIHNlZSBpbiBvdGhlciBmaWxlczoKCiNpbmNsdWRlIDxsaW51eC8qLmg+CgojaW5jbHVk
ZSA8ZHJtLyouaD4KCiNpbmNsdWRlICIqLmgiCgpBbmQgd2l0aCBhbiBlbXB0eSBsaW5lIGJldHdl
ZW4gdGhlIGJsb2NrcywgYW5kIHNvcnRlZCB3aXRoaW50IHRoZQpibG9ja3MuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

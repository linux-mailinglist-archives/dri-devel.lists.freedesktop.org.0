Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 586AE229741
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 13:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E2A89C17;
	Wed, 22 Jul 2020 11:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8956289C17
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 11:18:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E06B4329;
 Wed, 22 Jul 2020 13:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595416720;
 bh=3PppavpFe+RnKBwtRzRAtSsiWv4CSz6FActc7janNoA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N1pfTM8tHNetD+VOvb9GNg1KPDYrfYiK/wXi+pQMrSzu6Uc0eBPR82qtoEaTi5Ugd
 Ja8QpvhELuD9ctAd5afO173JOJGguGYVckOR+g49w/t3Bv0Im7mjSmzGGWHK3LhSDE
 olz25EyYMPPwKcV5IRq19U8Kn9nw/+jNpsKe8p90=
Date: Wed, 22 Jul 2020 14:18:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v1 1/1] drm/bridge: nwl-dsi: Drop
 DRM_BRIDGE_ATTACH_NO_CONNECTOR check.
Message-ID: <20200722111834.GB5833@pendragon.ideasonboard.com>
References: <cover.1595096667.git.agx@sigxcpu.org>
 <8b6545b991afce6add0a24f5f5d116778b0cb763.1595096667.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b6545b991afce6add0a24f5f5d116778b0cb763.1595096667.git.agx@sigxcpu.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3VpZG8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFNhdCwgSnVsIDE4LCAyMDIw
IGF0IDA4OjI2OjM3UE0gKzAyMDAsIEd1aWRvIEfDvG50aGVyIHdyb3RlOgo+IFdlIGRvbid0IGNy
ZWF0ZSBhIGNvbm5lY3RvciBidXQgbGV0IHBhbmVsX2JyaWRnZSBoYW5kbGUgdGhhdCBzbyB0aGVy
ZSdzCj4gbm8gcG9pbnQgaW4gcmVqZWN0aW5nIERSTV9CUklER0VfQVRUQUNIX05PX0NPTk5FQ1RP
Ui4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgoK
UmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5jIHwgNSAt
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9ud2wtZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L253bC1kc2kuYwo+IGluZGV4IDc3YTc5YWY3MDkxNC4uY2U5NGY3OTdkMDkwIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9ud2wtZHNpLmMKPiBAQCAtOTE4LDExICs5MTgsNiBAQCBzdGF0aWMgaW50IG53
bF9kc2lfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+ICAJc3RydWN0
IGRybV9wYW5lbCAqcGFuZWw7Cj4gIAlpbnQgcmV0Owo+ICAKPiAtCWlmIChmbGFncyAmIERSTV9C
UklER0VfQVRUQUNIX05PX0NPTk5FQ1RPUikgewo+IC0JCURSTV9FUlJPUigiRml4IGJyaWRnZSBk
cml2ZXIgdG8gbWFrZSBjb25uZWN0b3Igb3B0aW9uYWwhIik7Cj4gLQkJcmV0dXJuIC1FSU5WQUw7
Cj4gLQl9Cj4gLQo+ICAJcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKGRzaS0+ZGV2
LT5vZl9ub2RlLCAxLCAwLCAmcGFuZWwsCj4gIAkJCQkJICAmcGFuZWxfYnJpZGdlKTsKPiAgCWlm
IChyZXQpCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

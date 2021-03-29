Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3618A34D4A4
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 18:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FE06E438;
	Mon, 29 Mar 2021 16:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FD96E438
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 16:15:33 +0000 (UTC)
Date: Mon, 29 Mar 2021 17:15:06 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm: DON'T require each CRTC to have a unique primary
 plane
To: Simon Ser <contact@emersion.fr>
Message-Id: <6TNQQQ.CQL1KN8NARCK@crapouillou.net>
In-Reply-To: <rExcDgzsvu0kmMtp6ujD3gpKLXeYz121Dzm8yJrZOvv1A6IJkB9sTBGFcJHQTCTvAGmcrZ79bdD78ZYUeK3el868UYXTK46dkKnmlpQkj4Y=@emersion.fr>
References: <20210327112214.10252-1-paul@crapouillou.net>
 <20210329140731.tvkfxic4fu47v3rz@gilmour>
 <S1LQQQ.K5HO8ISMBGA02@crapouillou.net>
 <20210329153541.a3yil2aqsrtf2nlj@gilmour>
 <25MQQQ.YYKN0GE2YPZN1@crapouillou.net>
 <rExcDgzsvu0kmMtp6ujD3gpKLXeYz121Dzm8yJrZOvv1A6IJkB9sTBGFcJHQTCTvAGmcrZ79bdD78ZYUeK3el868UYXTK46dkKnmlpQkj4Y=@emersion.fr>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, od@zcrc.me,
 Maxime Ripard <maxime@cerno.tech>, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpMZSBsdW4uIDI5IG1hcnMgMjAyMSDDoCAxNTo0MiwgU2ltb24gU2VyIDxjb250YWN0QGVtZXJz
aW9uLmZyPiBhIMOpY3JpdCAKOgo+IE9uIE1vbmRheSwgTWFyY2ggMjl0aCwgMjAyMSBhdCA1OjM5
IFBNLCBQYXVsIENlcmN1ZWlsIAo+IDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4gd3JvdGU6Cj4gCj4+
ICBPaywgSSByZWFkIHRoYXQgYXMgImFsbCBkcml2ZXJzIHNob3VsZCBwcm92aWRlIEFUIExFQVNU
IG9uZSBwcmltYXJ5Cj4+ICBwbGFuZSBwZXIgQ1JUQyIsIGFuZCBub3QgYXMgImFsbCBkcml2ZXJz
IHNob3VsZCBwcm92aWRlIE9ORSBBTkQgT05MWQo+PiAgT05FIHByaW1hcnkgcGxhbmUgcGVyIENS
VEMiLiBNeSBiYWQuCj4gCj4gWWVhaCwgaXQncyBhIGxpdHRsZSBjb21wbGljYXRlZCB0byBkb2N1
bWVudCwgYmVjYXVzZSBpdCdzIHBvc3NpYmxlIGZvcgo+IGEgcHJpbWFyeSBwbGFuZSB0byBiZSBj
b21wYXRpYmxlIHdpdGggbXVsdGlwbGUgQ1JUQ3PigKYgV2UgdHJpZWQgdG8KPiBpbXByb3ZlIHRo
aXMgWzFdIHJlY2VudGx5Lgo+IAo+IFsxXTogCj4gaHR0cHM6Ly9kcmkuZnJlZWRlc2t0b3Aub3Jn
L2RvY3MvZHJtL2dwdS9kcm0ta21zLmh0bWwjcGxhbmUtYWJzdHJhY3Rpb24KCk9rLCB0aGF0IGlz
IGRlZmluaXRlbHkgbXVjaCBjbGVhcmVyIDopCgotUGF1bAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

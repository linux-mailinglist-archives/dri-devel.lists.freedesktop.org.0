Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5919478614
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A45789C8D;
	Mon, 29 Jul 2019 07:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C19899E6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 07:13:52 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 48CAE7D8F7C5BA45CBD0;
 Mon, 29 Jul 2019 15:13:47 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Mon, 29 Jul 2019
 15:13:36 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <eric@anholt.net>
Subject: [PATCH v2] drm/bridge: lvds-encoder: Fix build error while
 CONFIG_DRM_KMS_HELPER=m
Date: Mon, 29 Jul 2019 15:12:16 +0800
Message-ID: <20190729071216.27488-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20190729065344.9680-1-yuehaibing@huawei.com>
References: <20190729065344.9680-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgRFJNX0xWRFNfRU5DT0RFUj15IGJ1dCBDT05GSUdfRFJNX0tNU19IRUxQRVI9bSwKYnVpbGQg
ZmFpbHM6Cgpkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtZW5jb2Rlci5vOiBJbiBmdW5jdGlv
biBgbHZkc19lbmNvZGVyX3Byb2JlJzoKbHZkcy1lbmNvZGVyLmM6KC50ZXh0KzB4MTU1KTogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0byBgZGV2bV9kcm1fcGFuZWxfYnJpZGdlX2FkZCcKClJlcG9ydGVk
LWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KRml4ZXM6IGRiYjU4YmZkOWFlNiAo
ImRybS9icmlkZ2U6IEZpeCBsdmRzLWVuY29kZXIgc2luY2UgdGhlIHBhbmVsX2JyaWRnZSByZXdv
cmsuIikKU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgot
LS0KdjI6IHJlbW92ZSB0YzM1ODc2NCBsb2cgaW4gY29tbWl0IGxvZywgYWxzbyBmaXggRml4ZXMg
dGFnCi0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKaW5kZXggYTZlZWM5MC4u
NzdlNGI5NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwpAQCAtNDgsNiArNDgsNyBAQCBjb25maWcg
RFJNX0RVTUJfVkdBX0RBQwogY29uZmlnIERSTV9MVkRTX0VOQ09ERVIKIAl0cmlzdGF0ZSAiVHJh
bnNwYXJlbnQgcGFyYWxsZWwgdG8gTFZEUyBlbmNvZGVyIHN1cHBvcnQiCiAJZGVwZW5kcyBvbiBP
RgorCXNlbGVjdCBEUk1fS01TX0hFTFBFUgogCXNlbGVjdCBEUk1fUEFORUxfQlJJREdFCiAJaGVs
cAogCSAgU3VwcG9ydCBmb3IgdHJhbnNwYXJlbnQgcGFyYWxsZWwgdG8gTFZEUyBlbmNvZGVycyB0
aGF0IGRvbid0IHJlcXVpcmUKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs

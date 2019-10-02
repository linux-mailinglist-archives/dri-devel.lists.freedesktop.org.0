Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFF4C8D22
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 17:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315A66E218;
	Wed,  2 Oct 2019 15:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2426E218
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 15:43:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 6287428A27B
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Fix comment doc for format_modifiers
Date: Wed,  2 Oct 2019 17:43:49 +0200
Message-Id: <20191002154349.26895-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gaHVtYW4gcmVhZGVycwoKImFycmF5IG9mIHN0cnVjdCBkcm1fZm9ybWF0IG1vZGlmaWVycyIg
aXMgYWxtb3N0IGluZGlzdGluZ3Vpc2hhYmxlIGZyb20KImFycmF5IG9mIHN0cnVjdCBkcm1fZm9y
bWF0X21vZGlmaWVycyIsIGVzcGVjaWFsbHkgZ2l2ZW4gdGhhdApzdHJ1Y3QgZHJtX2Zvcm1hdF9t
b2RpZmllciBkb2VzIGV4aXN0LgoKQW5kIGluZGVlZCB0aGUgcGFyYW1ldGVyIHBhc3NlcyBhbiBh
cnJheSBvZiB1aW50NjRfdCByYXRoZXIgdGhhbiBhbiBhcnJheQpvZiBzdHJ1Y3RzLCBidXQgdGhl
IGZpcnN0IHdvcmRzIG9mIHRoZSBjb21tZW50IHN1Z2dlc3QgdGhhdCBpdCBwYXNzZXMKYW4gYXJy
YXkgb2Ygc3RydWN0cy4KClNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5k
cnplai5wQGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wbGFuZS5jCmluZGV4IGQ2YWQ2MGFiMGQzOC4uZGYwNWQ4YTBkZDYzIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFu
ZS5jCkBAIC0xNjAsNyArMTYwLDcgQEAgc3RhdGljIGludCBjcmVhdGVfaW5fZm9ybWF0X2Jsb2Io
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUKICAqIEBmdW5j
czogY2FsbGJhY2tzIGZvciB0aGUgbmV3IHBsYW5lCiAgKiBAZm9ybWF0czogYXJyYXkgb2Ygc3Vw
cG9ydGVkIGZvcm1hdHMgKERSTV9GT1JNQVRcX1wqKQogICogQGZvcm1hdF9jb3VudDogbnVtYmVy
IG9mIGVsZW1lbnRzIGluIEBmb3JtYXRzCi0gKiBAZm9ybWF0X21vZGlmaWVyczogYXJyYXkgb2Yg
c3RydWN0IGRybV9mb3JtYXQgbW9kaWZpZXJzIHRlcm1pbmF0ZWQgYnkKKyAqIEBmb3JtYXRfbW9k
aWZpZXJzOiBhcnJheSBvZiBtb2RpZmllcnMgb2Ygc3RydWN0IGRybV9mb3JtYXQgdGVybWluYXRl
ZCBieQogICogICAgICAgICAgICAgICAgICAgIERSTV9GT1JNQVRfTU9EX0lOVkFMSUQKICAqIEB0
eXBlOiB0eXBlIG9mIHBsYW5lIChvdmVybGF5LCBwcmltYXJ5LCBjdXJzb3IpCiAgKiBAbmFtZTog
cHJpbnRmIHN0eWxlIGZvcm1hdCBzdHJpbmcgZm9yIHRoZSBwbGFuZSBuYW1lLCBvciBOVUxMIGZv
ciBkZWZhdWx0IG5hbWUKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs

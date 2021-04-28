Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAE036E105
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 23:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED046EC4F;
	Wed, 28 Apr 2021 21:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E8189100
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 21:37:20 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:431:e7dd:b215:2a57:79ce:97d1:4a15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1FD951F4183F;
 Wed, 28 Apr 2021 22:37:12 +0100 (BST)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] Document drm_mode_get_plane
Date: Wed, 28 Apr 2021 18:36:49 -0300
Message-Id: <20210428213651.55467-1-leandro.ribeiro@collabora.com>
X-Mailer: git-send-email 2.31.1
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
Cc: airlied@linux.ie, pekka.paalanen@collabora.co.uk, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

djI6IHBvc3NpYmxlX2NydGNzIGZpZWxkIGlzIGEgYml0bWFzaywgbm90IGEgcG9pbnRlci4gU3Vn
Z2VzdGVkIGJ5ClZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+
Cgp2MzogZG9jdW1lbnQgaG93IHVzZXJzcGFjZSBzaG91bGQgZmluZCBvdXQgQ1JUQyBpbmRleC4g
QWxzbywKZG9jdW1lbnQgdGhhdCBmaWVsZCAnZ2FtbWFfc2l6ZScgcmVwcmVzZW50cyB0aGUgbnVt
YmVyIG9mCmVudHJpZXMgaW4gdGhlIGxvb2t1cCB0YWJsZS4gU3VnZ2VzdGVkIGJ5IFBla2thIFBh
YWxhbmVuCjxwcGFhbGFuZW5AZ21haWwuY29tPiBhbmQgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgoKTGVhbmRybyBSaWJlaXJvICgyKToKICBkcm0vZG9jOiBkb2N1bWVudCBob3cgdXNl
cnNwYWNlIHNob3VsZCBmaW5kIG91dCBDUlRDIGluZGV4CiAgZHJtL2RvYzogZG9jdW1lbnQgZHJt
X21vZGVfZ2V0X3BsYW5lCgogRG9jdW1lbnRhdGlvbi9ncHUvZHJtLXVhcGkucnN0ICAgIHwgMTQg
KysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyB8ICA5ICsr
KysrLS0tLQogaW5jbHVkZS91YXBpL2RybS9kcm0uaCAgICAgICAgICAgIHwgIDMgKystCiBpbmNs
dWRlL3VhcGkvZHJtL2RybV9tb2RlLmggICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysrKysr
CiA0IGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgotLQoy
LjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E139368661
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 20:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9F26E546;
	Thu, 22 Apr 2021 18:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1406E546
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 18:10:28 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:431:e7dd:973e:7b9c:c7cc:e902:8df9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5F7891F41B41;
 Thu, 22 Apr 2021 19:10:25 +0100 (BST)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/1] Document drm_mode_get_plane
Date: Thu, 22 Apr 2021 15:10:03 -0300
Message-Id: <20210422181004.34247-1-leandro.ribeiro@collabora.com>
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

VGhpcyBpcyBhIGZvbGxvdyB1cCBvZiB0aGUgcGF0Y2hzZXQgIkRvY3VtZW50IGhvdyB1c2Vyc3Bh
Y2Ugc2hvdWxkIHVzZQpwbGFuZSBmb3JtYXQgbGlzdCBhbmQgSU5fRk9STUFUUyI6CgpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAyMS1BcHJpbC8zMDI0
MzMuaHRtbAoKVGhlIGZpcnN0IHBhdGNoIG9mIHRoZSBzZXJpZXMgKCJkcm0vZG9jOiBkb2N1bWVu
dCBkcm1fbW9kZV9nZXRfcGxhbmUiKQppcyBzdGlsbCB1c2VmdWwsIGFsdGhvdWdoIHRoZSBvdGhl
ciBjb21taXQgb2YgdGhlIHNlcmllcyB3YXMgaW5jb3JyZWN0LgpTbyBJJ20gcHVzaGluZyB0aGUg
Zmlyc3QgY29tbWl0IGFnYWluLgoKdjI6IHBvc3NpYmxlX2NydGNzIGZpZWxkIGlzIGEgYml0bWFz
aywgbm90IGEgcG9pbnRlci4gU3VnZ2VzdGVkIGJ5ClZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+CgpMZWFuZHJvIFJpYmVpcm8gKDEpOgogIGRybS9kb2M6IGRv
Y3VtZW50IGRybV9tb2RlX2dldF9wbGFuZQoKIGluY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCB8
IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgot
LQoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

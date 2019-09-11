Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271C4AFC1C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 14:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CDD6EAC8;
	Wed, 11 Sep 2019 12:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC6E6EAC6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 12:04:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C7528B620;
 Wed, 11 Sep 2019 12:04:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Subject: [PATCH 0/3] drm/vram: Provide GEM VRAM vmap()/vunmap/()
Date: Wed, 11 Sep 2019 14:03:49 +0200
Message-Id: <20190911120352.20084-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGFzdCBhbmQgbWdhZzIwMCBkcml2ZXJzIHBpbigpIGFuZCBrbWFwKCkgY3Vyc29yIGJ1ZmZl
cnM7IGVzc2VudGlhbGx5CnJlaW1wbGVtZW50aW5nIHZtYXAoKS4gV2UgY2FuIHNoYXJlIHNvbWUg
Y29kZSBieSB1c2luZyB0aGUgcmVzcGVjdGl2ZQpmdW5jdGlvbmFsaXR5IGZyb20gR0VNIFZSQU0g
YnVmZmVyIG9iamVjdHMuCgpUaG9tYXMgWmltbWVybWFubiAoMyk6CiAgZHJtL3ZyYW06IFByb3Zp
ZGUgdm1hcCBhbmQgdnVubWFwIG9wZXJhdGlvbnMgZm9yIEdFTSBWUkFNIG9iamVjdHMKICBkcm0v
YXN0OiBVc2UgZHJtX2dlbV92cmFtX3t2bWFwLHZ1bm1hcH0oKSB0byBtYXAgY3Vyc29yIHNvdXJj
ZSBCTwogIGRybS9tZ2FnMjAwOiBVc2UgZHJtX2dlbV92cmFtX3t2bWFwLHZ1bm1hcH0oKSB0byBt
YXAgY3Vyc29yIHNvdXJjZSBCTwoKIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyAgICAg
ICAgICAgfCAgMjEgKystLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMg
ICAgfCAxMDYgKysrKysrKysrKysrKysrKy0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAw
L21nYWcyMDBfY3Vyc29yLmMgfCAgMjIgKystLS0KIGluY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9o
ZWxwZXIuaCAgICAgICAgfCAgIDUgKy0KIDQgZmlsZXMgY2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygr
KSwgNjEgZGVsZXRpb25zKC0pCgotLQoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==

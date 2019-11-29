Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61EF10D62F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 14:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F169D89B51;
	Fri, 29 Nov 2019 13:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F199689B7B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 13:39:24 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 817772927C9;
 Fri, 29 Nov 2019 13:39:23 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH] panfrost: Document base field location constraint in
 panfrost_gem_object
Date: Fri, 29 Nov 2019 14:39:20 +0100
Message-Id: <20191129133920.2435561-1-boris.brezillon@collabora.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSd2ZSBzcGVudCBob3VycyBjaGFzaW5nIGEgbWVtb3J5IGNvcnJ1cHRpb24gdGhhdCB3YXMgY2F1
c2VkIGJ5Cmluc2VydGlvbiBvZiBhbiBleHRyYSBmaWVsZCBmaWVsZCBiZWZvcmUgLT5iYXNlLiBM
ZXQncyBkb2N1bWVudCB0aGUKZmFjdCB0aGF0IGJhc2UgaGFzIHRvIGJlIHRoZSBmaXJzdCBmaWVs
ZCBpbiBwYW5mcm9zdF9nZW1fb2JqZWN0LgoKU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9u
IDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZ2VtLmggfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2Vt
LmggYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmgKaW5kZXggZTkyZWE2
Nzg3OGVkLi45NzlkZmYxZTdiMDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9nZW0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
Z2VtLmgKQEAgLTEwLDYgKzEwLDEwIEBACiBzdHJ1Y3QgcGFuZnJvc3RfbW11OwogCiBzdHJ1Y3Qg
cGFuZnJvc3RfZ2VtX29iamVjdCB7CisJLyoKKwkgKiBNdXN0IGJlIHRoZSBmaXJzdCBlbGVtZW50
IGJlY2F1c2Ugd2UncmUgdXNpbmcgc29tZSBvZiB0aGUKKwkgKiBkcm1fZ2VtX3NobWVtIGhlbHBl
cnMuCisJICovCiAJc3RydWN0IGRybV9nZW1fc2htZW1fb2JqZWN0IGJhc2U7CiAJc3RydWN0IHNn
X3RhYmxlICpzZ3RzOwogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==

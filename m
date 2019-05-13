Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 204721B1C5
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 10:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE78898C4;
	Mon, 13 May 2019 08:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12732898C4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 08:17:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbrezillon) with ESMTPSA id 7195827FDBB
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH] drm/panfrost: Add missing _fini() calls in
 panfrost_device_fini()
Date: Mon, 13 May 2019 10:17:34 +0200
Message-Id: <20190513081734.911-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
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

cGFuZnJvc3Rfe2pvYixtbXUsZ3B1LHJlc2V0fV9maW5pKCkgd2VyZSBtaXNzaW5nLgoKRml4ZXM6
IGYzYmE5MTIyOGU4ZSAoImRybS9wYW5mcm9zdDogQWRkIGluaXRpYWwgcGFuZnJvc3QgZHJpdmVy
IikKU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFi
b3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMg
fCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKaW5kZXggOTcwZjY2OWM2ZDI5Li4zYjJiY2Vk
MWIwMTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZp
Y2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKQEAg
LTE2NSw2ICsxNjUsMTAgQEAgaW50IHBhbmZyb3N0X2RldmljZV9pbml0KHN0cnVjdCBwYW5mcm9z
dF9kZXZpY2UgKnBmZGV2KQogCiB2b2lkIHBhbmZyb3N0X2RldmljZV9maW5pKHN0cnVjdCBwYW5m
cm9zdF9kZXZpY2UgKnBmZGV2KQogeworCXBhbmZyb3N0X2pvYl9maW5pKHBmZGV2KTsKKwlwYW5m
cm9zdF9tbXVfZmluaShwZmRldik7CisJcGFuZnJvc3RfZ3B1X2ZpbmkocGZkZXYpOworCXBhbmZy
b3N0X3Jlc2V0X2ZpbmkocGZkZXYpOwogCXBhbmZyb3N0X3JlZ3VsYXRvcl9maW5pKHBmZGV2KTsK
IAlwYW5mcm9zdF9jbGtfZmluaShwZmRldik7CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

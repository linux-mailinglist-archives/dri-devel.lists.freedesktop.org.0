Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EC5103B87
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD1A6E5E1;
	Wed, 20 Nov 2019 13:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C665E6E5E1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 13:33:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7D66219FA;
 Wed, 20 Nov 2019 13:33:45 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/udl: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:33:41 +0800
Message-Id: <20191120133341.6582-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574256827;
 bh=WT9VmNTwrSOiMErau7Je4Gl0AyGjIGnI48+wBKl5j8M=;
 h=From:To:Cc:Subject:Date:From;
 b=Oqr+fLUAYFAwTfgW96oVK4B3/FSTxPcXnRELQ9Sm2ZsFwHBRQipksvXxvPE27MSS6
 lW2rQcv1Q2yf1gQzfyvMJOi7W6kwJMCiZXGze/zeEcVwka+eqVZ3ACIANTLcATBmsW
 L8Vn6v+0kLn3asJLPYjNhEOwfTVenbGw4nyqUsYA=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKCSQgc2VkIC1lICdzL14g
ICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvS2NvbmZpZyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS91
ZGwvS2NvbmZpZwppbmRleCBiNGQxNzliODdmMDEuLmIxM2FhMzM5OTBmMyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3VkbC9LY29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvS2Nv
bmZpZwpAQCAtOCw0ICs4LDQgQEAgY29uZmlnIERSTV9VREwKIAlzZWxlY3QgRFJNX0tNU19IRUxQ
RVIKIAloZWxwCiAJICBUaGlzIGlzIGEgS01TIGRyaXZlciBmb3IgdGhlIFVTQiBkaXNwbGF5bGlu
ayB2aWRlbyBhZGFwdGVycy4KLSAgICAgICAgICBTYXkgTS9ZIHRvIGFkZCBzdXBwb3J0IGZvciB0
aGVzZSBkZXZpY2VzIHZpYSBkcm0va21zIGludGVyZmFjZXMuCisJICBTYXkgTS9ZIHRvIGFkZCBz
dXBwb3J0IGZvciB0aGVzZSBkZXZpY2VzIHZpYSBkcm0va21zIGludGVyZmFjZXMuCi0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441DA103BA5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1666E9A6;
	Wed, 20 Nov 2019 13:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4930F6E9A6;
 Wed, 20 Nov 2019 13:36:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3333E21939;
 Wed, 20 Nov 2019 13:36:31 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/lima: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:36:29 +0800
Message-Id: <20191120133629.11543-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574256994;
 bh=JGl5YYm/lMtsmGe8bGMD0wTvi8CqLpAb2Eyq/ZOaayk=;
 h=From:To:Cc:Subject:Date:From;
 b=Zj+HrwDYXdziBBH0eav9v3oBvD7Zu+6/zHAjp+wd/aBYrI6UiDaVnxsmDG4wpSqiq
 HDg6KhfVKT4BmtzgOyyiZBwCa37mgd1RF1oMsgb5OnMTmw8Y/1R6cDRW3bqB+9u067
 4M07JVZf5qxhPCzszHkARWM1uLyS3GrGX9XrIyhg=
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>, lima@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Qiang Yu <yuq825@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKCSQgc2VkIC1lICdzL14g
ICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9saW1hL0tjb25maWcg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJt
L2xpbWEvS2NvbmZpZwppbmRleCA1NzFkYzM2OWE3ZTkuLmQ1ODlmMDlkMDRkOSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0vbGlt
YS9LY29uZmlnCkBAIC0xMSw0ICsxMSw0IEBAIGNvbmZpZyBEUk1fTElNQQogICAgICAgIHNlbGVj
dCBEUk1fU0NIRUQKICAgICAgICBzZWxlY3QgRFJNX0dFTV9TSE1FTV9IRUxQRVIKICAgICAgICBo
ZWxwCi0gICAgICAgICBEUk0gZHJpdmVyIGZvciBBUk0gTWFsaSA0MDAvNDUwIEdQVXMuCisJIERS
TSBkcml2ZXIgZm9yIEFSTSBNYWxpIDQwMC80NTAgR1BVcy4KLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

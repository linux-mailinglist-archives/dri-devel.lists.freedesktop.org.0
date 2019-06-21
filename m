Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554344ED0E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 18:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B2B6E8F6;
	Fri, 21 Jun 2019 16:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CE26E8F4;
 Fri, 21 Jun 2019 16:21:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 56A322089E;
 Fri, 21 Jun 2019 16:21:27 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] drm/lima: Mark 64-bit number as ULL to silence Smatch
 warning
Date: Fri, 21 Jun 2019 18:21:14 +0200
Message-Id: <20190621162117.22533-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561134088;
 bh=i3bOwZCT85Q9yvApyiLHd1cEaAunSmxNvQtZBURK4gA=;
 h=From:To:Cc:Subject:Date:From;
 b=LAovNkRmT7jv/zYTohSOPD5n7AZiXiuDJek2AUQvr38TGR6rgnGIQnNHZfy8QqTr4
 Fusf7Pxnv817IFYu9Ed5oRY38K5+/x77K0K+IQU6X7UqO1ydcAfJSFCYbTY6N4lPul
 Mp/EHpW+d5TLkT2v/pliMtBFEqIyW3l9xnGPZXm4=
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFyayBsb25nIG51bWJlcnMgd2l0aCBVTEwgdG8gc2lsZW5jZSB0aGUgU21hdGNoIHdhcm5pbmc6
CgogICAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kZXZpY2UuYzozMTQ6MzI6IHdhcm5pbmc6
IGNvbnN0YW50IDB4MTAwMDAwMDAwIGlzIHNvIGJpZyBpdCBpcyBsb25nIGxvbmcKClNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6
IFFpYW5nIFl1IDx5dXE4MjVAZ21haWwuY29tPgoKLS0tCgpDaGFuZ2VzIHNpbmNlIHYxOgoxLiBB
ZGQgcmV2aWV3ZWQtYnkgdGFnCi0tLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV92bS5oIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfdm0uaCBiL2RyaXZlcnMvZ3B1
L2RybS9saW1hL2xpbWFfdm0uaAppbmRleCBjYWVlMmY4YTI5YjQuLmUwYmRlZGNmMTRkZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV92bS5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9saW1hL2xpbWFfdm0uaApAQCAtMTUsOSArMTUsOSBAQAogI2RlZmluZSBMSU1BX1ZNX05V
TV9QVF9QRVJfQlQgKDEgPDwgTElNQV9WTV9OVU1fUFRfUEVSX0JUX1NISUZUKQogI2RlZmluZSBM
SU1BX1ZNX05VTV9CVCAoTElNQV9QQUdFX0VOVF9OVU0gPj4gTElNQV9WTV9OVU1fUFRfUEVSX0JU
X1NISUZUKQogCi0jZGVmaW5lIExJTUFfVkFfUkVTRVJWRV9TVEFSVCAgMHhGRkYwMDAwMAorI2Rl
ZmluZSBMSU1BX1ZBX1JFU0VSVkVfU1RBUlQgIDB4MEZGRjAwMDAwVUxMCiAjZGVmaW5lIExJTUFf
VkFfUkVTRVJWRV9ETEJVICAgTElNQV9WQV9SRVNFUlZFX1NUQVJUCi0jZGVmaW5lIExJTUFfVkFf
UkVTRVJWRV9FTkQgICAgMHgxMDAwMDAwMDAKKyNkZWZpbmUgTElNQV9WQV9SRVNFUlZFX0VORCAg
ICAweDEwMDAwMDAwMFVMTAogCiBzdHJ1Y3QgbGltYV9kZXZpY2U7CiAKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7C14AA65
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 20:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFB66E219;
	Tue, 18 Jun 2019 18:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1756E219;
 Tue, 18 Jun 2019 18:55:11 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 520EB206BA;
 Tue, 18 Jun 2019 18:55:08 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/lima: Mark 64-bit number as ULL to silence Smatch
 warning
Date: Tue, 18 Jun 2019 20:55:00 +0200
Message-Id: <20190618185502.3839-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560884110;
 bh=brmz5Awo5xDD9CyvzRCYtkw/Mi4q6RDFq2tW986y0/Q=;
 h=From:To:Cc:Subject:Date:From;
 b=Yk1xdzUdDcJEdRMUHwhxwIujSEVpTBoH7hTe2mwxtaBbcTXBp7V3ZGugSDnzSZDAk
 9qFrssSbZ31Z6XOm2tjuU3pSYD9+XwMGjxLyXLyTSS9ejaZgmQu2T5rFtB6SSD3QKq
 ehTnsQE1CgkTECZ6IBUpA7Vr47lJZJHEpnB0NdiA=
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
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbGltYS9saW1hX3ZtLmggfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2xp
bWEvbGltYV92bS5oIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV92bS5oCmluZGV4IGNhZWUy
ZjhhMjliNC4uZTBiZGVkY2YxNGRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9s
aW1hX3ZtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV92bS5oCkBAIC0xNSw5ICsx
NSw5IEBACiAjZGVmaW5lIExJTUFfVk1fTlVNX1BUX1BFUl9CVCAoMSA8PCBMSU1BX1ZNX05VTV9Q
VF9QRVJfQlRfU0hJRlQpCiAjZGVmaW5lIExJTUFfVk1fTlVNX0JUIChMSU1BX1BBR0VfRU5UX05V
TSA+PiBMSU1BX1ZNX05VTV9QVF9QRVJfQlRfU0hJRlQpCiAKLSNkZWZpbmUgTElNQV9WQV9SRVNF
UlZFX1NUQVJUICAweEZGRjAwMDAwCisjZGVmaW5lIExJTUFfVkFfUkVTRVJWRV9TVEFSVCAgMHgw
RkZGMDAwMDBVTEwKICNkZWZpbmUgTElNQV9WQV9SRVNFUlZFX0RMQlUgICBMSU1BX1ZBX1JFU0VS
VkVfU1RBUlQKLSNkZWZpbmUgTElNQV9WQV9SRVNFUlZFX0VORCAgICAweDEwMDAwMDAwMAorI2Rl
ZmluZSBMSU1BX1ZBX1JFU0VSVkVfRU5EICAgIDB4MTAwMDAwMDAwVUxMCiAKIHN0cnVjdCBsaW1h
X2RldmljZTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=

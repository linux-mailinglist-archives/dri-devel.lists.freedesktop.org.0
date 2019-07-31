Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705C7C96B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 18:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16576E118;
	Wed, 31 Jul 2019 16:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F4689FEA;
 Wed, 31 Jul 2019 16:59:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 215E528B7B7
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/13] drm/exynos: Provide ddc symlink in connector's sysfs
Date: Wed, 31 Jul 2019 18:58:12 +0200
Message-Id: <613c1c09ff7db5be60ef86f930b45b3f56b4838d.1564591626.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1564591626.git.andrzej.p@collabora.com>
References: <65481afa-1104-4ee9-e53d-f2732a10d4b9@baylibre.com>
 <cover.1564591626.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1564591626.git.andrzej.p@collabora.com>
References: <cover.1564591626.git.andrzej.p@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, kernel@collabora.com,
 Anthony Koo <Anthony.Koo@amd.com>, Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 David Francis <David.Francis@amd.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Enrico Weigelt <info@metux.net>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Todor Tomov <todor.tomov@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3dpdGNoIHRvIHVzaW5nIHRoZSBkZGMgcHJvdmlkZWQgYnkgdGhlIGdlbmVyaWMgY29ubmVjdG9y
LgoKU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFi
b3JhLmNvbT4KQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KUmV2aWV3
ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfaGRtaS5jCmluZGV4IGJjMTU2NWYxODIyYS4uZDRhOWM5ZTE3NDM2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jCkBAIC05NDAsOCArOTQwLDEwIEBAIHN0YXRpYyBpbnQg
aGRtaV9jcmVhdGVfY29ubmVjdG9yKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIAljb25u
ZWN0b3ItPmludGVybGFjZV9hbGxvd2VkID0gdHJ1ZTsKIAljb25uZWN0b3ItPnBvbGxlZCA9IERS
TV9DT05ORUNUT1JfUE9MTF9IUEQ7CiAKLQlyZXQgPSBkcm1fY29ubmVjdG9yX2luaXQoaGRhdGEt
PmRybV9kZXYsIGNvbm5lY3RvciwKLQkJCSZoZG1pX2Nvbm5lY3Rvcl9mdW5jcywgRFJNX01PREVf
Q09OTkVDVE9SX0hETUlBKTsKKwlyZXQgPSBkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoaGRh
dGEtPmRybV9kZXYsIGNvbm5lY3RvciwKKwkJCQkJICAmaGRtaV9jb25uZWN0b3JfZnVuY3MsCisJ
CQkJCSAgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBLAorCQkJCQkgIGhkYXRhLT5kZGNfYWRwdCk7
CiAJaWYgKHJldCkgewogCQlEUk1fREVWX0VSUk9SKGhkYXRhLT5kZXYsCiAJCQkgICAgICAiRmFp
bGVkIHRvIGluaXRpYWxpemUgY29ubmVjdG9yIHdpdGggZHJtXG4iKTsKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

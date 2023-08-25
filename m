Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB57278871C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04FF10E13A;
	Fri, 25 Aug 2023 12:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0868610E13A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:24:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.83.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1819A6607283;
 Fri, 25 Aug 2023 13:24:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692966298;
 bh=KTW2XkA7TENvlUjtZxVgz0cTJt8BRHSoHLAxDPCe3/M=;
 h=From:To:Cc:Subject:Date:From;
 b=atR3yLJW3d4/PabzFRiwGIHVX5yPIRv3bnIJQpvAaxuB1jWhWikx9Rkc7j2ZFJn4d
 b73hUkhgzynNX8aEiXefftccC/IKE8gKQ7GAsmwBhpKhvzxJTVzi0OViisAtSg4LAU
 Ozr8OLVfH9ZbsTgvSRZ99RdWR4aByxBqbuvK6Sfzg4IojwEXR/4d30coZHDrJq+8YF
 tBK4niVms8OfEcUo9BK1nFBuOSwqFJ2/oNZo2yNDI+b2OJHvChJwX5Q0pBJTlG4LSx
 7ZAcPq8tCEQAC66520N4XYo6jVIUyLao0SU6VN8nAy2qbaboSWx0uDioZ9K8nxI2HI
 oqtqq8AyWLwVQ==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm: ci: fixes
Date: Fri, 25 Aug 2023 17:54:29 +0530
Message-Id: <20230825122435.316272-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, david.heidelberg@collabora.com,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com,
 corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, mripard@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch series contains improvements, enabling new ci jobs which
enables testing for Mediatek MT8173, Qualcomm APQ 8016 and VirtIO GPU,
fixing issues with the ci jobs and updating the expectation files.
This series is intended for drm branch topic/drm-ci.

Vignesh Raman (6):
  drm: ci: igt_runner: remove todo
  drm: ci: Force db410c to host mode
  drm: ci: virtio: update ci variables
  drm: ci: Enable configs to fix mt8173 boot hang issue
  drm: ci: Update xfails
  drm: ci: Remove rules

 drivers/gpu/drm/ci/arm64.config                  |  2 ++
 drivers/gpu/drm/ci/build.sh                      |  4 ++++
 drivers/gpu/drm/ci/gitlab-ci.yml                 |  2 +-
 drivers/gpu/drm/ci/igt_runner.sh                 |  1 -
 drivers/gpu/drm/ci/test.yml                      | 14 ++++----------
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt    |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt     |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt    |  2 ++
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt    |  1 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt  |  2 --
 .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt | 16 ++++++++++++++++
 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt |  2 ++
 .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt |  1 +
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt  |  4 ++--
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt |  3 +++
 15 files changed, 38 insertions(+), 18 deletions(-)

-- 
2.40.1


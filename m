Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471329DB217
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 05:21:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281A510E0DC;
	Thu, 28 Nov 2024 04:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dD9XeIQX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E217510E0DC
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 04:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732767680;
 bh=wQmBhpaZkflxWhHgpRCNXR0O8vTWJ+J0iFv8bWASh6s=;
 h=From:To:Cc:Subject:Date:From;
 b=dD9XeIQXksmNb/9F/I/M1ucSOdAP8lywD/6FnTBewTxPEMt6Ks3P75wrNl/6Ml1R8
 QOTkdmAc1HXP/im1Oezki03snF/i/uoXCg8uWdAwGUQxOliHnvSqEdKoU4KpbR+8xa
 aVwXiSyKQ0AKj14qZrodPrWeoxVevUiSRB/AltqcQpQW2l4R8eCuAxINvptVcYTaF9
 5+fBI21hOGNU378jUPMOB+7pGy+7no/nGdcyTh8DXkYpCLU9BwwrkNqXKMGYMUjxOr
 PTlayMMZgB1Iejzkst+DIp+GOSgnggA71MpcO6kMWTCUuK2BCWHCmwu4+MlTKjoYsk
 RHjybs5WFCt2Q==
Received: from localhost.localdomain (unknown [171.76.86.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 175D117E0FA6;
 Thu, 28 Nov 2024 05:21:17 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, jani.nikula@linux.intel.com,
 dmitry.baryshkov@linaro.org, mripard@kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] drm/ci: uprev mesa and modify gitlab rules
Date: Thu, 28 Nov 2024 09:50:19 +0530
Message-ID: <20241128042025.611659-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uprev mesa to adapt to the latest changes in mesa-ci,
including new container jobs and stages. Update the
lava-submit script to align with recent mesa-ci changes
for using LAVA rootfs overlays. Modify gitLab rules
to include scheduled pipelines.

Pipeline link,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1318024

Vignesh Raman (2):
  drm/ci: uprev mesa
  drm/ci: update gitlab rules

 drivers/gpu/drm/ci/build.sh       |   2 +-
 drivers/gpu/drm/ci/build.yml      | 104 ++++++++++++++++-
 drivers/gpu/drm/ci/container.yml  |  22 ++--
 drivers/gpu/drm/ci/gitlab-ci.yml  | 185 ++++++++++++++++--------------
 drivers/gpu/drm/ci/image-tags.yml |  11 +-
 drivers/gpu/drm/ci/lava-submit.sh |  99 +++++++++++-----
 drivers/gpu/drm/ci/test.yml       |  33 +++---
 7 files changed, 314 insertions(+), 142 deletions(-)

-- 
2.43.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C89F983B2E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 04:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7617110E4C1;
	Tue, 24 Sep 2024 02:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="I6FlfQQJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CF210E1F1;
 Tue, 24 Sep 2024 02:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727144777;
 bh=bVBlh+fY6Ig9uXlKnweewNbRdJcBCdmmmBM3MYgyfkc=;
 h=From:To:Cc:Subject:Date:From;
 b=I6FlfQQJLJgS0B4GYHreTcgkphmT0mtS/izy2z6fKSS7SM/YLiUDuQFlVGy/mj+BV
 LAJ5Z6OzVK7XlKTu8ty7d5B8lKWjrOvTfhYxuS2lGgxDMgwRhHeUh7zm+vBW/smVbC
 Lh9cVPMXsPLsFyyrDTIyHDkgs2vabkhVEfSxOnu4vKWN/Wk5xbz+iG7hP43duNJhhq
 RDxF4v0iGL0s4K00QMKKfxunJksIA+2M8LnIE854C+pIIKC3EfPWYcizvciDBHaP69
 s0b33b7a0NOtNEuAz5lPT4Chepeo/Zztl/y2h8GLSNs+QJry4OgRR2BW0VhQ/VipCC
 MEAHSNEfkemDA==
Received: from localhost.localdomain (unknown [171.76.80.125])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1187A17E0EC1;
 Tue, 24 Sep 2024 04:26:13 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, mripard@kernel.org, rodrigo.vivi@intel.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v1] docs/gpu: ci: update flake tests requirements
Date: Tue, 24 Sep 2024 07:55:58 +0530
Message-ID: <20240924022600.1441969-1-vignesh.raman@collabora.com>
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

Update the documentation to require linking to a relevant GitLab
issue for each new flake entry instead of an email report. Added
specific GitLab issue URLs for i915, xe and other drivers.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 Documentation/gpu/automated_testing.rst | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 2d5a28866afe..f73b8939dc3a 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -67,20 +67,25 @@ Lists the tests that for a given driver on a specific hardware revision are
 known to behave unreliably. These tests won't cause a job to fail regardless of
 the result. They will still be run.
 
-Each new flake entry must be associated with a link to the email reporting the
-bug to the author of the affected driver, the board name or Device Tree name of
-the board, the first kernel version affected, the IGT version used for tests,
-and an approximation of the failure rate.
+Each new flake entry must include a link to the relevant GitLab issue, the board
+name or Device Tree name, the first kernel version affected, the IGT version used
+for tests and an approximation of the failure rate.
 
 They should be provided under the following format::
 
-  # Bug Report: $LORE_OR_PATCHWORK_URL
+  # Bug Report: $GITLAB_ISSUE
   # Board Name: broken-board.dtb
   # Linux Version: 6.6-rc1
   # IGT Version: 1.28-gd2af13d9f
   # Failure Rate: 100
   flaky-test
 
+The GitLab issue must include the logs and the pipeline link. Use the appropriate
+link below to create an issue.
+https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/ for i915 drivers
+https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/ for xe drivers
+https://gitlab.freedesktop.org/drm/misc/kernel/-/issues for other drivers
+
 drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
 -----------------------------------------------------------
 
-- 
2.43.0


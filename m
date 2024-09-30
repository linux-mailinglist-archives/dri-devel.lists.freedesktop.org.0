Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EDC989EBB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 11:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4FD10E3E2;
	Mon, 30 Sep 2024 09:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kRe5RniR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BF410E157;
 Mon, 30 Sep 2024 09:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727689988;
 bh=xlQB+YRnWzPDGKcdRmDpIo+//kocNTxv1zsa8DtTEpI=;
 h=From:To:Cc:Subject:Date:From;
 b=kRe5RniRKjhzyPUIS9aI2gdQY/3yfKtncMkphK8EzeLqmp1VuuBWod/AA66jPXaNd
 EKRfxBP86hBpWoINgH9hkEhh+lONXGBZUmjk20jMP43TLhVSYUzoeldgkgazVcPL8j
 v+YoK6UZ7SpvFTo6sS2UT166Ry/DaV7GyOQ6xhSqnDZfk2GxgmN7YU9/I9n9oYwheV
 StpzBoIns/k8gwxB+xso+IansWWxQUChjuk6E9n9YVfie/psblmf4Nc8Iqe5ZJF9z+
 Y/fkYSDfLJnwsCX4Wfx+JjgMUPo/W7g2Ggtl0tWUReRwX5zUgUpaokHfSY3/d3MVtD
 hcqp2lZxrEpfQ==
Received: from localhost.localdomain (unknown [171.76.80.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AFD8F17E1147;
 Mon, 30 Sep 2024 11:53:04 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, mripard@kernel.org, rodrigo.vivi@intel.com,
 quic_abhinavk@quicinc.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4] docs/gpu: ci: update flake tests requirements
Date: Mon, 30 Sep 2024 15:22:47 +0530
Message-ID: <20240930095255.2071586-1-vignesh.raman@collabora.com>
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

Update the documentation to specify linking to a relevant GitLab
issue or email report for each new flake entry. Added specific
GitLab issue urls for amdgpu, i915, msm and xe driver.

Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #intel and xe
Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # msm
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
- Add gitlab issue link for msm driver.

v3:
- Update docs to specify we use email reporting or GitLab issues for flake entries.

v4:
- Add gitlab issue link for xe driver.

---
 Documentation/gpu/automated_testing.rst | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 2d5a28866afe..6d7c6086034d 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -68,19 +68,25 @@ known to behave unreliably. These tests won't cause a job to fail regardless of
 the result. They will still be run.
 
 Each new flake entry must be associated with a link to the email reporting the
-bug to the author of the affected driver, the board name or Device Tree name of
-the board, the first kernel version affected, the IGT version used for tests,
-and an approximation of the failure rate.
+bug to the author of the affected driver or the relevant GitLab issue. The entry
+must also include the board name or Device Tree name, the first kernel version
+affected, the IGT version used for tests, and an approximation of the failure rate.
 
 They should be provided under the following format::
 
-  # Bug Report: $LORE_OR_PATCHWORK_URL
+  # Bug Report: $LORE_URL_OR_GITLAB_ISSUE
   # Board Name: broken-board.dtb
   # Linux Version: 6.6-rc1
   # IGT Version: 1.28-gd2af13d9f
   # Failure Rate: 100
   flaky-test
 
+Use the appropriate link below to create a GitLab issue:
+amdgpu driver: https://gitlab.freedesktop.org/drm/amd/-/issues
+i915 driver: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues
+msm driver: https://gitlab.freedesktop.org/drm/msm/-/issues
+xe driver: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues
+
 drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
 -----------------------------------------------------------
 
-- 
2.43.0


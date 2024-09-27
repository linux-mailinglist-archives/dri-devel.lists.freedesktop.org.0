Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88D5987DD2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 07:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D426D10EC15;
	Fri, 27 Sep 2024 05:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qlfUz6eg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D90610E1EB;
 Fri, 27 Sep 2024 05:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727414687;
 bh=r5E3C8ovlOGFFH6WMn3gqo8ezIWZpB6JtgD66EOvBSU=;
 h=From:To:Cc:Subject:Date:From;
 b=qlfUz6egU+dmTUqLLZ/T/NtChPlvIXi5Cnxh+pjZW2RzNWlc8iwyFnQ9aLtIAqoBh
 3Mo5uuqK6PpFeIzDiNOfs/4acmFBcq4oFPd2V80PuLpCKTbA8rfVFhGvxvH5uHVcDf
 PeEIvrUpqfcFA0tm7JJVWUXTd/wW9R5KctFND710po/bTbfQVD14jaSvXziRrH973c
 Qilb43wFmKgA5+yspypzeEZBJDqu3cBX+WThpc8gwuUOsPFCfqb6XN9sQ4KQdr5egk
 4O+ryjd8lgSSuI2P5x5a2kr5k/K0vsgafGy78AzimNqxd6ufVF5SPLdttGxiRW78he
 zUrQFW0XMJ76g==
Received: from localhost.localdomain (unknown [171.76.80.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E15F17E0FAC;
 Fri, 27 Sep 2024 07:24:43 +0200 (CEST)
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
Subject: [PATCH v3] docs/gpu: ci: update flake tests requirements
Date: Fri, 27 Sep 2024 10:54:14 +0530
Message-ID: <20240927052416.1833889-1-vignesh.raman@collabora.com>
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
GitLab issue urls for i915, msm and amdgpu driver.

Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # msm
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
- Add gitlab issue link for msm driver.

v3:
- Update docs to specify we use email reporting or GitLab issues for flake entries.

---
 Documentation/gpu/automated_testing.rst | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 2d5a28866afe..03769b4a17cf 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -68,19 +68,24 @@ known to behave unreliably. These tests won't cause a job to fail regardless of
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
+
 drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
 -----------------------------------------------------------
 
-- 
2.43.0


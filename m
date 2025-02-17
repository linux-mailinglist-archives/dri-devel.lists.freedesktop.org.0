Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F8DA38173
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 12:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF1B10E0FA;
	Mon, 17 Feb 2025 11:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4C410E0FA;
 Mon, 17 Feb 2025 11:17:55 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 664A71F784;
 Mon, 17 Feb 2025 12:17:52 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 0/3] drm/msm: Initial fixes for DUALPIPE (+DSC) topology
Date: Mon, 17 Feb 2025 12:17:40 +0100
Message-Id: <20250217-drm-msm-initial-dualpipe-dsc-fixes-v3-0-913100d6103f@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQas2cC/43QzW7DIAwH8FeJOM8TEL4STdPeY9qBBtMihZBBG
 q2q+u4jqXrZLr1hLP1s/6+kYA5YSN9cScY1lJCmWrQvDRlOdjoiBFdrwikXVDAFLkeIJUKYwhL
 sCO5sxznMCK4M4MMPFmg91UweaHvwglRozrg3qvP5VetTKEvKl33myrbfB6+f4VcGFLSx2CJ2V
 nX6o6RowzSGCV9TPpJtxsofrqScdk+5vLoVpMwI74ZW/XNv92Myfp9rUMv9IhKxFLsH1Tdv+0D
 GObj5DIwxWNKcxnS8bDwDSSV2slPC+u4P/75FdbAFYUgxhqVv0EnjGG1ROcukFYJ7b7RU2nRGK
 1NXtErVZ13s9gu/pSb2yQEAAA==
X-Change-ID: 20240416-drm-msm-initial-dualpipe-dsc-fixes-3f0715b03bf4
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Archit Taneja <architt@codeaurora.org>, 
 Hai Li <hali@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3328;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=XlYKleX94y6B66dSSrT2H1qCHvUu0eQ2CYD3wdZHzm4=;
 b=owEBbQKS/ZANAwAIAfFi0jHH5IZ2AcsmYgBnsxrfcr9CYslQNi/zZFAiBjHbrUr4GF+oa/EUK
 iAVRzHzeCyJAjMEAAEIAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCZ7Ma3wAKCRDxYtIxx+SG
 duhXD/4gXtpsLfvjMzmOIHqN/Zv2OqY0dRVcboIQIYcdpzRrMREfIwRUyqqkBzwf+qsjgNnBlvH
 YoGrVBOWgoNMscgxFGV1FQDtzqb7h50V6JI2ojvBvBag4IoByJwPMvuIZ9nzcn93BbcteHSUek8
 Wz09Ks4EgC5pXQwH7MC5ZIjfPazGP1CqvHDrGAv6u5Fgmofk+G5pqaCS7GvUEQ09riEtrPLh04l
 lBdC1MjREMk1qCXFVzdCWRG1K7eaIX6tSahgdI07VzCqYb3zCrNPSZ9ZFA7WMNFEvDesWh2bYgx
 yIsTrvThd/FFX8GQ2NNS+da+Yk9CCRyMJvrIOzQZC/qLelstds+D8dik/NL4TmNL2sNnvcoqBfV
 0vGGAQlgJh1NLXJ7fQkiNAU+cPKFBPebtmmtt5ENjS9xZvkt6C6MQ7x4a2pEaCcUjgE14KQi4i6
 jdEiSitQJc1oDBIl5gVQ9rIibD7djr4cTD6xIVPektqkum9ReXwe2pKOIZTrPw+d4N8xQoxwWAZ
 cwpMHt40AaXIlk4BSbDShyGHj0A2b6K7SL6JT+8+hP8h/45ldHWb17JWK52bbQrWMAylFGKzUX6
 1XLIknD3t13ZJ4iehPlsnsWSQg/jgZJhbM00zNfEMe6QK0L4joa4opzELj9mChTJU7MyWBFARml
 Ft/t1hSHSQYORTg==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676
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

This series covers a step-up towards supporting the DUALPIPE DSC
topology, also known as 2:2:2 topology (on active-CTL hardware).  It
involves 2 layer mixers, 2 DSC compression encoders, and 2 interfaces
(on DSI, this is called bonded-DSI) where bandwidth constraints (e.g. 4k
panels at 120Hz) require two interfaces to transmit pixel data.

Enabling this topology will be hard(er) than downstream as hacking a
layout type in DTS won't be describing the hardware, but "dynamically"
determining it at runtime may pose some of a challenge that is left to a
future series.  Such changes will also involve the 1:1:1 topology needed
for constrained hardware like the Fairphone 5 on SC7280 with access to
only one DSC encoder and thus ruled out of the current 2:2:1 topology.

Likewise, the patches and discussions around improving active-CTL
configuration to support bonded interfaces (that share a single CTL
block) are still in full swing and hence elided from this series, apart
from one patch to fix the ACTIVE_DSC register coding to support updates,
so that it is not forgotten about.

This issue and successful resolution of all the problems is discussed
and demonstrated in https://gitlab.freedesktop.org/drm/msm/-/issues/41.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
Changes in v3:
- Removed start of multiline comment inside another comment
  (editor detritus from merging two comments in v2);
- Inserted empty newline after the start of multi-line comments (per
  kernel coding style).
- Link to v2: https://lore.kernel.org/r/20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org

Changes in v2:
- Dropped patches that were applied;
- dsi_mgr_setup_components() now sets both the usecase and phy_mode
  prior to calling msm_dsi_host_register(), and for non-bonded too;
- Added patch to remove a forced num_intf = 1 when DSC is enabled;
- Reworked hdisplay/2 "fix" when calculating "DSC timing" to instead use
  dsc->slice_count, allowing us to remove msm_dsc_get_slices_per_intf()
  entirely;
- Link to v1: https://lore.kernel.org/r/20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org

Depends on:
- https://lore.kernel.org/linux-arm-msm/20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org/
  (only to prevent conflicts with the patch that removes a hardcoded
   num_intf = 1;).

---
Marijn Suijten (3):
      drm/msm/dsi: Use existing per-interface slice count in DSC timing
      drm/msm/dsi: Set PHY usescase (and mode) before registering DSI host
      drm/msm/dpu: Remove arbitrary limit of 1 interface in DSC topology

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  7 ++++---
 drivers/gpu/drm/msm/dsi/dsi_host.c          |  8 ++++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c       | 32 +++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_dsc_helper.h        | 11 ----------
 4 files changed, 29 insertions(+), 29 deletions(-)
---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20240416-drm-msm-initial-dualpipe-dsc-fixes-3f0715b03bf4
prerequisite-message-id: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
prerequisite-patch-id: 9ed44ae089b173f452a6603e6739b0b3bf2d9274

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>


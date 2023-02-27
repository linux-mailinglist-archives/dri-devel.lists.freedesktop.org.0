Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8AA6A3722
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1465610E311;
	Mon, 27 Feb 2023 02:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B977310E311;
 Mon, 27 Feb 2023 02:07:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F48560DC4;
 Mon, 27 Feb 2023 02:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BA1C433EF;
 Mon, 27 Feb 2023 02:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463624;
 bh=d/og2jOEKeOdpeh3qI0txklsSvU7ptQycygyiomEzhU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gh5kLjHN2L52F4gNILhcz/W59NIkbTrdJSYcR+nfWB3kUX6O336/xTkBl2FLgjx3D
 b3jVtrdqVSsaWULUFssYYDBWY2NidpV+4CuKtm5lJ93pLs9OLGSlxU4PQvZLq6l8Zc
 SZ6Qgn0ceaEkv8bHatsYkX+lviUelnJ7/cyCAv58NH4Xs1qQPx9mGJ/kKVM2fLPZCt
 RABGcILURs718QHONWnikriIAuvFZtq4HJzCRMjFL/OsdXE9xSO2dC9pmbTUlOdJGe
 RSiDpbKfOkkHoDM9RkGjEbASXs+MKcr5yBkhYDYi2qQ5P82aGMiY++sylud/+5Jbsa
 DBW20i3XabPJw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 32/58] drm/msm/dpu: Add DSC hardware blocks to
 register snapshot
Date: Sun, 26 Feb 2023 21:04:30 -0500
Message-Id: <20230227020457.1048737-32-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 liushixin2@huawei.com, dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, konrad.dybcio@linaro.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marijn Suijten <marijn.suijten@somainline.org>

[ Upstream commit a7efe60e36b9c0e966d7f82ac90a89b591d984e9 ]

Add missing DSC hardware block register ranges to the snapshot utility
to include them in dmesg (on MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE) and the
kms debugfs file.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Patchwork: https://patchwork.freedesktop.org/patch/520175/
Link: https://lore.kernel.org/r/20230125101412.216924-1-marijn.suijten@somainline.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5e6e2626151e8..b7901b666612a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -942,6 +942,11 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
 			dpu_kms->mmio + cat->mdp[0].base, "top");
 
+	/* dump DSC sub-blocks HW regs info */
+	for (i = 0; i < cat->dsc_count; i++)
+		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
+				dpu_kms->mmio + cat->dsc[i].base, "dsc_%d", i);
+
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 
-- 
2.39.0


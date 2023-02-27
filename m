Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DAC6A3694
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F1710E253;
	Mon, 27 Feb 2023 02:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A1B10E1D5;
 Mon, 27 Feb 2023 02:02:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5398CB80CA7;
 Mon, 27 Feb 2023 02:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F47C433D2;
 Mon, 27 Feb 2023 02:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463376;
 bh=ox1R3Tf10CzECZ2WM6KwvnPkUPCaZYBN+WHbon+b9Z4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kJHo1rsiO++ERKwYMTVivmHvrdJOrE7fzZxCxa/zMvlaJSVmgDLSk8rfsXpj8vUN0
 EIhxos/3pgZqNps7KNr9N4Cmzifu1uvRwv2IiorwEBlhhEbhExqyiRe77C0AmFQt4P
 s+nlvLIleyoKKiJdcpASBwpH1EfsiXabSLksXM0mdrT15fDGfRYtco7Lvd66QK2SKd
 cIt++r24B1q9Ke59Kq2j0ljFNQyxO/pvcJHCdwI7gMR6mNbtxsfGnyEFa/p5G6JFCH
 1sNOwFrxxKXSEFrphVCnr3Wv100lNslCnynsdPAYCOA9xiIAh74EloOLFHSbfBArN5
 jJN840NresFeg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 33/60] drm/msm/dpu: Add DSC hardware blocks to
 register snapshot
Date: Sun, 26 Feb 2023 21:00:18 -0500
Message-Id: <20230227020045.1045105-33-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020045.1045105-1-sashal@kernel.org>
References: <20230227020045.1045105-1-sashal@kernel.org>
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
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, liushixin2@huawei.com,
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
index b71199511a52d..09757166a064a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -930,6 +930,11 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
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


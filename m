Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CAA9F4E56
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECE010E9B7;
	Tue, 17 Dec 2024 14:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zvd6LhAg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381DD10E9B6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 14:51:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3863703258fso3858463f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734447085; x=1735051885; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lNypXtc4nIg+qb7sUPhcVsJhL4eqdZ8B/Tfk40MaJXk=;
 b=zvd6LhAguPE6YvJHKBzk+MT0RfK9sSQ4/ndfqNDrK0TCqn3DR2Hnn/WqkQTRgrs2iQ
 QiKfEvRB95PZQ7mrk/uqBeam82FqtoRFqf/QJf3xgWMetcz9/dLkVGCXZLDu/NpU8eYB
 oB+2yi7U2/8eNavKwk5fB5R/lycv2rV8tuvpxxrA+f+tv6S9C67GRVxpcen+ou1eiqdm
 F+/h8RVhlFAf08LLe71AVu+OMgs2RM5Gr3L+JkEMit3vfU/efMl+fOSbT4DQhBX5QVLx
 qsoODz3W4e+OzKAMazpBlFy28UGY0KvKJZmq0Df42VNFanoqixUpdpukZj3Fw9UhNEgr
 e44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734447085; x=1735051885;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lNypXtc4nIg+qb7sUPhcVsJhL4eqdZ8B/Tfk40MaJXk=;
 b=qtI8/hw9fw24M+vXVcUDtql8FslyItVqvc/1/v2/fYNlclgpo2QMJjjtgnWrbERdXU
 cUzhnlZV0PfuMFtyss6nxtsdsyLo/r5tQ9TWB/zATFj/6WnJMYeWTeBjWPHSPemYtdi+
 VekKHixTq47lIzhyPsBCltarpQQ7aO8myDwS+h0qfeMhOk+eAI8IkzsqVfTfmtIkwi/v
 I7hfDO/yBNN/16NHjiQNVGCX2e+YFn4wGCphEREzmM1caSO1n4OyO0HTuTE0zwvdUrUl
 nos+QDWmhflNpGlBtSntYp9rYOpoMDdMF1dRocaJY0kUgPYGM0akcyYQful0znNy0NRB
 ZtZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLBpiLDJw6uxDluZQynfGY0mEC/l7bQGxjzGIwti1eBvibkgSUZSMHR9ncZgmfSF7okZzFFfbmyfI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUWOCUu9HFsYqWa/yDpJIGrQt2EHONEx9n25sqWMUOl5XpJiyH
 ZZApxvhjXeoe/6sm6FWsEp5AloDks+e83ZwsAL8NHa9vwCVAHC0oMwDEhxCZjFM=
X-Gm-Gg: ASbGncu/pz7xVIXXotZyG0GHAYWMmb8HqlIzpxRmH8jeIqlCEQHy077F1s90cUkGQVb
 scdHsp8G7S+NOJCvoMGYhmp2eKk5+x43YJ5GpcR7Fw1xYMprRI+znF3ZBlOE1Cx4J1r2MEWoDCF
 WjS8x4n/mPNg8B2xIODvMxMp/4PyIX1QbSGzl3S0hbIOSGlVtcE9XwaXne6jb+qpC5+5SRC1BtP
 R+OKhna8/XOL6RysLVmDzQDQBJU+Nrr2F/xHJAuzkm5/x+3Pp9OvYVdI++Y/XaVRrYP/Yu9eYrG
 0Q==
X-Google-Smtp-Source: AGHT+IF08CqGEVMJZfbJ7r7qZe8j0gbc+u42o5OD37BNt0zBqfD+ESOHAWpRHvgX9n/HUYO3z7ZyYw==
X-Received: by 2002:a05:6000:186b:b0:385:e986:416f with SMTP id
 ffacd0b85a97d-388db23d94emr3354627f8f.10.1734447085525; 
 Tue, 17 Dec 2024 06:51:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43636066f51sm118417375e9.22.2024.12.17.06.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 06:51:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 17 Dec 2024 15:51:16 +0100
Subject: [PATCH v6 3/7] drm/msm: adreno: dynamically generate GMU bw table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-topic-sm8x50-gpu-bw-vote-v6-3-1adaf97e7310@linaro.org>
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3622;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=yovwygK3S8pu26HzluofMUYGeWNAA5KC7l+8jvZOelI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnYY/mUIDbjRQ+iZT5JSE6X/+2KtHYBNH8pag3vPUd
 orbGlP+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ2GP5gAKCRB33NvayMhJ0STND/
 0aQZf1zj9prj6KG3kpeRhL+QNj38Aty/ttRl6Mpn6Tq9CdEIlEF1VNrv732vP9Z1iXlCFb+lUUcI59
 sMh21mihHwXVXanwwwy7WaneLGTuMlSpXpkPo+QvOVU5Rv6eI/Ax6SZFuV32fQoz3DORB9vp30sTH3
 xHAXrUc12SrofQItGTcxzr/1rYbx+yj1d/Jw4zQRhsUG0qowPq0QEnrgiy0h4gpLoVOKzQHVGvkvIs
 Qe8WcRUqvek6g6QZSKtZfxrHZohdq8FZZoXUmOEDYYhu9iEbZRdQ0Q//i2G+aHy7ZftYQkq9CQEWrM
 xN+RRk8uJHrjiKdB0kE+ppJnIwMVqGlTR0potzScAQtMs0PmAF78LvEihBGQo9TAFegkx0qDW2pLAg
 9yLBI1/rNSGWZVRtpv86Yxvv6fUpXFxB9CbsbI6b9G5yTatm8HzWWuqAbhpeaQlTXXdV3MvCkr7IL+
 CDasBq2BHRnMN6OcJC0TWGArfkBnoo0MDzzPDx3QbssFwzni3JjeKntNPGd8hHsOPbr4h+E6ZcsFaj
 kH8wBbNlBBeQ/7EMcUt7Qtj06/XY7YPonMPS+OUJdJbo0twWOuz7NhTUN4qBP3bV8hYe3cCIkMWuNo
 A9u7zbXaEfafzdr0+L/H4PF4BeSOsNcW4rMzjxhw2/uZQuLn2PMjd/enLcIw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The Adreno GPU Management Unit (GMU) can also scale the ddr
bandwidth along the frequency and power domain level, but for
now we statically fill the bw_table with values from the
downstream driver.

Only the first entry is used, which is a disable vote, so we
currently rely on scaling via the linux interconnect paths.

Let's dynamically generate the bw_table with the vote values
previously calculated from the OPPs.

Those entries will then be used by the GMU when passing the
appropriate bandwidth level while voting for a gpu frequency.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 48 ++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index cb8844ed46b29c4569d05eb7a24f7b27e173190f..995526620d678cd05020315f771213e4a6943bec 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -6,6 +6,7 @@
 #include <linux/list.h>
 
 #include <soc/qcom/cmd-db.h>
+#include <soc/qcom/tcs.h>
 
 #include "a6xx_gmu.h"
 #include "a6xx_gmu.xml.h"
@@ -259,6 +260,48 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
+static void a6xx_generate_bw_table(const struct a6xx_info *info, struct a6xx_gmu *gmu,
+				   struct a6xx_hfi_msg_bw_table *msg)
+{
+	unsigned int i, j;
+
+	for (i = 0; i < GMU_MAX_BCMS; i++) {
+		if (!info->bcms[i].name)
+			break;
+		msg->ddr_cmds_addrs[i] = cmd_db_read_addr(info->bcms[i].name);
+	}
+	msg->ddr_cmds_num = i;
+
+	for (i = 0; i < gmu->nr_gpu_bws; ++i)
+		for (j = 0; j < msg->ddr_cmds_num; j++)
+			msg->ddr_cmds_data[i][j] = gmu->gpu_ib_votes[i][j];
+	msg->bw_level_num = gmu->nr_gpu_bws;
+
+	/* Compute the wait bitmask with each BCM having the commit bit */
+	msg->ddr_wait_bitmask = 0;
+	for (j = 0; j < msg->ddr_cmds_num; j++)
+		if (msg->ddr_cmds_data[0][j] & BCM_TCS_CMD_COMMIT_MASK)
+			msg->ddr_wait_bitmask |= BIT(j);
+
+	/*
+	 * These are the CX (CNOC) votes - these are used by the GMU
+	 * The 'CN0' BCM is used on all targets, and votes are basically
+	 * 'off' and 'on' states with first bit to enable the path.
+	 */
+
+	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
+	msg->cnoc_cmds_num = 1;
+
+	msg->cnoc_cmds_data[0][0] = BCM_TCS_CMD(true, false, 0, 0);
+	msg->cnoc_cmds_data[1][0] = BCM_TCS_CMD(true, true, 0, BIT(0));
+
+	/* Compute the wait bitmask with each BCM having the commit bit */
+	msg->cnoc_wait_bitmask = 0;
+	for (j = 0; j < msg->cnoc_cmds_num; j++)
+		if (msg->cnoc_cmds_data[0][j] & BCM_TCS_CMD_COMMIT_MASK)
+			msg->cnoc_wait_bitmask |= BIT(j);
+}
+
 static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/* Send a single "off" entry since the 618 GMU doesn't do bus scaling */
@@ -664,6 +707,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 	struct a6xx_hfi_msg_bw_table *msg;
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 
 	if (gmu->bw_table)
 		goto send;
@@ -672,7 +716,9 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 	if (!msg)
 		return -ENOMEM;
 
-	if (adreno_is_a618(adreno_gpu))
+	if (info->bcms && gmu->nr_gpu_bws > 1)
+		a6xx_generate_bw_table(info, gmu, msg);
+	else if (adreno_is_a618(adreno_gpu))
 		a618_build_bw_table(msg);
 	else if (adreno_is_a619(adreno_gpu))
 		a619_build_bw_table(msg);

-- 
2.34.1


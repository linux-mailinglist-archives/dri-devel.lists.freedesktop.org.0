Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E979EC73D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 09:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFBA10EAB2;
	Wed, 11 Dec 2024 08:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I3DCDu40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F46810EAB4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 08:30:04 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so1196385e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733905803; x=1734510603; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lNypXtc4nIg+qb7sUPhcVsJhL4eqdZ8B/Tfk40MaJXk=;
 b=I3DCDu40rD27OwedFoMmCuY5Iea3qGvAbrMxVRThtWrs/jx3Hq3fqdBLO5C/zvIjs1
 C+SI/uzTNYi+RW2qVVCjUQgKWiNdBLioVuGBktH4natpBkB3m/rR7xB+zTKvbC+32cYY
 TjVEeFPW6+aw6IC8hRMvy5wUHvuDfDYbuKje/tDUhnDUUPxtYI2pAa73yrAVYoJqt1X3
 nQPs9Fw0O87Ay8DrNWO8nxWdF6wCxUYqJLYxRKIni6Na+tQ4iHMMTp+VsvcxUg1MrWXM
 7S4ilcvtRhyepS5bSAjo8y5JLw9smjlN1vP0WdYTMrzdDA4+SCZyDpTp4T3oQUw9Imvt
 cpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733905803; x=1734510603;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lNypXtc4nIg+qb7sUPhcVsJhL4eqdZ8B/Tfk40MaJXk=;
 b=J8x2KVxYMU268KeZNctkOjC7F5m+MjL1B2qBhRvTFBU5co8msJ/IFp+4CScExRuBVq
 Yrik+6wBC3dPdTc0aE5ejqI/DGYw1V255m4A8d+tbPFHVkBZdk0aOmWo7tw3iwDXev1E
 3A/CVSjePcVKpQVtkYrGROhH2yPAGUUNVLbuXxbds19SLP1VoFcND39ruyqkdKdJnR/z
 uYnx6jtQ39AOSdAMuGd27K/So3/PA+Kf2shjWVPrXsRq2/XTiDffuwMt//UFtcyhp1bA
 NVK+vm0rToPWPumLiOBkffsa6eAKaUNpc4U7Q7iuEUyTV3rxWYfx27qFvypRL9j3/3WF
 bE4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVes6XiKnaOWUta26ouAYuss2JKf3jzvqr6eDqUd5QN8MPcZaVz50MQtfaCut/ivzsyBMmXQS7PoF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCkJCmD1F3hotlBX2ud6M7+ChTuqV/P0nsarad8XiuX8rywfw7
 zPWu3+M2Ajnpu/BwhLIwtA4YpvU3N43kcofFwQFIrCzzztjZFExOIrKxFre28wc=
X-Gm-Gg: ASbGncuHHP1CNwnQN16pN+gn6c70CHLvylWt302CE6q0HBxTbBV9dRM3sDQ043b1BhA
 tQGGt0EG/S3OM3ypLPgl7Rcm3teDOL6Sb0cxzwPBZxJioRgpS5kQECv5iMoirXCZy0SikXvhzqW
 EUNYx4BkedRBnyUIxhUQ5i64oQCibZFtdsYG6mPNxKmQgjxSI15iNZ+LeUnnkQLp4QySmkLix6m
 sLwgpRkjRpxRjxuS7CSHQUx89p7fjaIk3jgPZnD9/bSl4hDDzV3XgRw5QdgnZhVZmpRpUUmiow=
X-Google-Smtp-Source: AGHT+IH6+vEX2WfNXNJ2nAc7kKUYdmLrBTuQoYVlYpfObom8aKcXHzrfp+P4XyYInweEJtk1gSrx/w==
X-Received: by 2002:a05:600c:c11:b0:434:f7ea:fb44 with SMTP id
 5b1f17b1804b1-4361c3acb65mr13968775e9.14.1733905802821; 
 Wed, 11 Dec 2024 00:30:02 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a3e38sm735687f8f.23.2024.12.11.00.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 00:30:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Dec 2024 09:29:53 +0100
Subject: [PATCH v5 3/7] drm/msm: adreno: dynamically generate GMU bw table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-topic-sm8x50-gpu-bw-vote-v5-3-6112f9f785ec@linaro.org>
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWU2D/mNj+S561qPZ/Vd9Rzw1cSUKaTGzvfXwgVkA
 QS3aNyqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lNgwAKCRB33NvayMhJ0agxEA
 C+A9ezN6FpehfMIejE/kwgdHMeDDhFA6t0KwsN/26Mi/YL0grjbDM5ahRuQ89HQ2nu9RXW/A3s7hkC
 ABtUbGsL5+ltQ7s+OSVAO8AOcSDEig5sNc6TuUTybS39C31rnVVdJtOCpVak5rw2dFWvBSAGX46fJG
 HMu4/UprRHYitqxhGOIhnA6O8OOWb/dff3ZbJ879AhsRnt/SSZK99ZrUjALeSBP50RcLgT0ulmm5tm
 586MuPgiAWTlol9VL1vovc+4dIz9NMnHywnqSBEme1ZUEUD1fw1JDUPaVlL5CBZ3n4KEIwDpnbPCEd
 /rNlt30YQ9ZLFxCEwEWIf/1rgMUhAB/V86RIFJX3UaH8jFkGTaXvFSt7vyFLw4gZ0QmRtWcCPghY1K
 6UtX59fg1BEBY0CyUMZ0VffC1kriWkCvYp3E9FWkRbMaf7Ij1s/d1/OJ+koJXOHr2ugy36ApYpYY+H
 B84m2/sFreBaRYe0ZzyiHWyO8NqaLVK2XafTNzQzcgKkArR65IYyjcVr+xKOQb/lr/c4qvgLN/qvX5
 wnuLhoapLyKY5Q/hRg9+PHmtcDt8ltdyZBu85AEKsX0QfZIqIClvD5z4c6G/uGhyBSKTPLnuocUeD+
 8g+dTvwRLe6WvTOGmfHKS5hyPOH9Nz9p98KbfvfcFnRBUxOqdhZWuQ71xPUQ==
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


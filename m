Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED14F9F4E55
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C57610E9B6;
	Tue, 17 Dec 2024 14:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XDFupalt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FF810E9B6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 14:51:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso57220725e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734447084; x=1735051884; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OyxaZBklys0e+cgmlXW8QjqJBVv11dGOjS19JlZ2Yec=;
 b=XDFupaltnuZdgUF8H8blPPcHUa5C0IGVGLd4VWl8nytkq2Vva8GYCJIsLrCGFe1D+F
 96Jwl5x0zBDK74jOie+tzZChbEbeFMfUkS5QBpKkDsJk+fL6kY43h4x1rHxhULPFTuLS
 AyiahAFvoY3zofnDse+zHUraDDvE2uSEC5jvVzr6QrTXVpE7bsqLsXUr/2uc4c0Kf0Sa
 3EKSRbQaQqFLY449N05LFe0ZDBIb/DiJvJFoM5IwMGewlOGJuPrSfL4cz5IRpogBhsxQ
 kIIk1zQhmyyLtVqg9EnQY3pAsdg2m4Cwul91ZuVOmOAsqnG9+CmZaDxsQvBaH+wntBMk
 SMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734447084; x=1735051884;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OyxaZBklys0e+cgmlXW8QjqJBVv11dGOjS19JlZ2Yec=;
 b=gwzKB+190I1/1gxMbkc5t5NhCouQISazmhbkf+efKmq0LAOXw0HOiYLD0E3XhOnnM5
 lLXZWMuIBY26mn+fnIBLvzXh0X7lVfJDw5Aka+jUEpLQYmGP4J1r4XvsD6y6V7F5mz0p
 mTMLL01rPLneIqDPVw5nKN/E9G57PguuWPhyL1lZRzH3sOC5wcZx6Y3tcv8CTrJB48BB
 tGebTgVvq955TiB0j8OAI6jnyzl6gQTYe14QwbC3NODyelLQcHX9QA+8ALZG1sg81f6q
 rYQd5FKxHC0Gqn+RJfHRn28TxH21yw6YZASyIiyGvV0A7+I8qDAAXDkGzE9yefx2QQCj
 BEtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3psGWaRm8DLUOZdwla3Ab3lf6NnFlhW1WCAnFrfBRFhgtCYP2ZWstVFkjgU3pu6FcmFtNCISQmH4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyY3LCHF7XlrWZxzMIsgxZWKE/EcMWHA3CZK6KAI4wnKmpdBPRF
 0v8mcVYfkvY4TDDrm+qM09vIXF53jsbdPdBtAttB5i3UFM0hs4X1mrna2UMPaps=
X-Gm-Gg: ASbGncutb27HynVciXFtSr6IXF0ymcqkyMiw8RQxYOUpeUnbPU/OKTwPEPJmiQzLuZY
 pqVuE6uiQo4zI4vhanDJKuj3wBQL08biM7bwNvsu3UliyMWv2BpIKyrmdL+3slKhLW5xgdyerRe
 z5iyAAlzEjnZIQoP3iUZTbEPVV93mfzvSWs1HQX8NaO9nRssdO2bxYqtuF6dhGkdLcIWv7S4zBO
 eTHAnVI0I1qeNWwU0LqjTftavq4U/bSt+uZIELT39+az8encV9PAFlXv6n0KKWumncuIJI0MCt1
 MQ==
X-Google-Smtp-Source: AGHT+IF/LXNrn41lrZeVuVkwHIPO1Ebl8nhSfn9sgtvy8hVPFpXifXS5J6LUa3TQlsDfjEv2RTBdrQ==
X-Received: by 2002:a05:600c:510c:b0:434:a19a:5965 with SMTP id
 5b1f17b1804b1-4362aa157afmr154125065e9.6.1734447084323; 
 Tue, 17 Dec 2024 06:51:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43636066f51sm118417375e9.22.2024.12.17.06.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 06:51:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 17 Dec 2024 15:51:15 +0100
Subject: [PATCH v6 2/7] drm/msm: adreno: add plumbing to generate bandwidth
 vote table for GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-topic-sm8x50-gpu-bw-vote-v6-2-1adaf97e7310@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9220;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TOr8XyqegTuO9sNdKB4EIhXx5sYwZRJd/x9NuxgQSfA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnYY/mYoDcfDfWiHKD55DdUfRoSM2rAamSHq/ekprB
 TiXXhF+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ2GP5gAKCRB33NvayMhJ0RFoEA
 Ct7AXZ457dew5JFj97GjTrq3+4ZvhM+7mnew5WbLWIMFIOO4U9Jds+kNIVAU7P5OcLJRVqd5juJTB6
 3JRf69Mw+lr9u+dZrESdWGwhjZFELUJdDa7uYyriE5iPjtEXRhVYLJ8nxMoGgOqM+qqirozrj2eTCT
 BBVE3IRY50VBpcfoEvAIZgIRwp0ur7TLyzBdLQHjkPLOua04Y7ziGfpfCbTNeKh82+VAsmnE7BOgkw
 by4MnujKyaiGTsf1XWHRRdWi+P66h63stLJfyRFA78lnmYr9esFvzV2tWz/bRcFsyg6XJf0UhDGYvH
 zrHRAyeoK5d4y92/+S9+2Vw6LUg9MJZRM2UA4G1YSSASzsnjteV+xdC+aepoM+CYAAErv3lbg1AcNh
 J5iVFXnapF8mX1dy6QJ8b65EPkfLBTFfSznxdo06sC1cLOBqf6156hK+RQhCQUrZAF/HxmV3AEvHFQ
 xdz7A0L3rb13xXhlslcLO7jom+UoXFnBOpfIE4GVE9dqRhAC0hIS0D9K4+FrLHuZ5plA3e/nhz4W+4
 YUAlblQau3VVeCWWcPPVaA4/RoTD9NEKr0dXyXM+Ak1bF1+wdHfFjmF/wJw7ZyUPxXl3a/dJxpP4G7
 oYXuOxYeuqy25TiMQzuIpANfI7BbKMQhRLbu6p9bjZP8Qfu8wEHVpeXovqTQ==
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

The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
the Frequency and Power Domain level, but by default we leave the
OPP core scale the interconnect ddr path.

While scaling via the interconnect path was sufficient, newer GPUs
like the A750 requires specific vote paremeters and bandwidth to
achieve full functionality.

In order to calculate vote values used by the GPU Management
Unit (GMU), we need to parse all the possible OPP Bandwidths and
create a vote value to be sent to the appropriate Bus Control
Modules (BCMs) declared in the GPU info struct.

This vote value is called IB, while on the other side the GMU also
takes another vote called AB which is a 16bit quantized value
of the floor bandwidth against the maximum supported bandwidth.
The AB vote will be calculated later when setting the frequency.

The vote array will then be used to dynamically generate the GMU
bw_table sent during the GMU power-up.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 147 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  13 +++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
 3 files changed, 161 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 14db7376c712d19446b38152e480bd5a1e0a5198..b1dadafc35e95d6173019bda1105008dec1ac03a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -9,6 +9,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <soc/qcom/cmd-db.h>
+#include <soc/qcom/tcs.h>
 #include <drm/drm_gem.h>
 
 #include "a6xx_gpu.h"
@@ -1287,6 +1288,104 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
 	return 0;
 }
 
+/**
+ * struct bcm_db - Auxiliary data pertaining to each Bus Clock Manager (BCM)
+ * @unit: divisor used to convert bytes/sec bw value to an RPMh msg
+ * @width: multiplier used to convert bytes/sec bw value to an RPMh msg
+ * @vcd: virtual clock domain that this bcm belongs to
+ * @reserved: reserved field
+ */
+struct bcm_db {
+	__le32 unit;
+	__le16 width;
+	u8 vcd;
+	u8 reserved;
+};
+
+static int a6xx_gmu_rpmh_bw_votes_init(struct adreno_gpu *adreno_gpu,
+				       const struct a6xx_info *info,
+				       struct a6xx_gmu *gmu)
+{
+	const struct bcm_db *bcm_data[GMU_MAX_BCMS] = { 0 };
+	unsigned int bcm_index, bw_index, bcm_count = 0;
+
+	/* Retrieve BCM data from cmd-db */
+	for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
+		const struct a6xx_bcm *bcm = &info->bcms[bcm_index];
+		size_t count;
+
+		/* Stop at NULL terminated bcm entry */
+		if (!bcm->name)
+			break;
+
+		bcm_data[bcm_index] = cmd_db_read_aux_data(bcm->name, &count);
+		if (IS_ERR(bcm_data[bcm_index]))
+			return PTR_ERR(bcm_data[bcm_index]);
+
+		if (!count) {
+			dev_err(gmu->dev, "invalid BCM '%s' aux data size\n",
+				bcm->name);
+			return -EINVAL;
+		}
+
+		bcm_count++;
+	}
+
+	/* Generate BCM votes values for each bandwidth & BCM */
+	for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
+		u32 *data = gmu->gpu_ib_votes[bw_index];
+		u32 bw = gmu->gpu_bw_table[bw_index];
+
+		/* Calculations loosely copied from bcm_aggregate() & tcs_cmd_gen() */
+		for (bcm_index = 0; bcm_index < bcm_count; bcm_index++) {
+			const struct a6xx_bcm *bcm = &info->bcms[bcm_index];
+			bool commit = false;
+			u64 peak;
+			u32 vote;
+
+			if (bcm_index == bcm_count - 1 ||
+			    (bcm_data[bcm_index + 1] &&
+			     bcm_data[bcm_index]->vcd != bcm_data[bcm_index + 1]->vcd))
+				commit = true;
+
+			if (!bw) {
+				data[bcm_index] = BCM_TCS_CMD(commit, false, 0, 0);
+				continue;
+			}
+
+			if (bcm->fixed) {
+				u32 perfmode = 0;
+
+				/* GMU on A6xx votes perfmode on all valid bandwidth */
+				if (!adreno_is_a7xx(adreno_gpu) ||
+				    (bcm->perfmode_bw && bw >= bcm->perfmode_bw))
+					perfmode = bcm->perfmode;
+
+				data[bcm_index] = BCM_TCS_CMD(commit, true, 0, perfmode);
+				continue;
+			}
+
+			/* Multiply the bandwidth by the width of the connection */
+			peak = (u64)bw * le16_to_cpu(bcm_data[bcm_index]->width);
+			do_div(peak, bcm->buswidth);
+
+			/* Input bandwidth value is in KBps, scale the value to BCM unit */
+			peak *= 1000;
+			do_div(peak, le32_to_cpu(bcm_data[bcm_index]->unit));
+
+			vote = clamp(peak, 1, BCM_TCS_CMD_VOTE_MASK);
+
+			/* GMUs on A7xx votes on both x & y */
+			if (adreno_is_a7xx(adreno_gpu))
+				data[bcm_index] = BCM_TCS_CMD(commit, true, vote, vote);
+			else
+				data[bcm_index] = BCM_TCS_CMD(commit, true, 0, vote);
+		}
+	}
+
+	return 0;
+}
+
 /* Return the 'arc-level' for the given frequency */
 static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
 					   unsigned long freq)
@@ -1390,12 +1489,15 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
  * The GMU votes with the RPMh for itself and on behalf of the GPU but we need
  * to construct the list of votes on the CPU and send it over. Query the RPMh
  * voltage levels and build the votes
+ * The GMU can also vote for DDR interconnects, use the OPP bandwidth entries
+ * and BCM parameters to build the votes.
  */
 
 static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	int ret;
 
@@ -1407,6 +1509,10 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
 		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
 
+	/* Build the interconnect votes */
+	if (info->bcms && gmu->nr_gpu_bws > 1)
+		ret |= a6xx_gmu_rpmh_bw_votes_init(adreno_gpu, info, gmu);
+
 	return ret;
 }
 
@@ -1442,10 +1548,43 @@ static int a6xx_gmu_build_freq_table(struct device *dev, unsigned long *freqs,
 	return index;
 }
 
+static int a6xx_gmu_build_bw_table(struct device *dev, unsigned long *bandwidths,
+		u32 size)
+{
+	int count = dev_pm_opp_get_opp_count(dev);
+	struct dev_pm_opp *opp;
+	int i, index = 0;
+	unsigned int bandwidth = 1;
+
+	/*
+	 * The OPP table doesn't contain the "off" bandwidth level so we need to
+	 * add 1 to the table size to account for it
+	 */
+
+	if (WARN(count + 1 > size,
+		"The GMU bandwidth table is being truncated\n"))
+		count = size - 1;
+
+	/* Set the "off" bandwidth */
+	bandwidths[index++] = 0;
+
+	for (i = 0; i < count; i++) {
+		opp = dev_pm_opp_find_bw_ceil(dev, &bandwidth, 0);
+		if (IS_ERR(opp))
+			break;
+
+		dev_pm_opp_put(opp);
+		bandwidths[index++] = bandwidth++;
+	}
+
+	return index;
+}
+
 static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
 
 	int ret = 0;
@@ -1472,6 +1611,14 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
 
 	gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
 
+	/*
+	 * The GMU also handles GPU Interconnect Votes so build a list
+	 * of DDR bandwidths from the GPU OPP table
+	 */
+	if (info->bcms)
+		gmu->nr_gpu_bws = a6xx_gmu_build_bw_table(&gpu->pdev->dev,
+			gmu->gpu_bw_table, ARRAY_SIZE(gmu->gpu_bw_table));
+
 	/* Build the list of RPMh votes that we'll send to the GMU */
 	return a6xx_gmu_rpmh_votes_init(gmu);
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 88f18ea6a38a08b5b171709e5020010947a5d347..2062a2be224768c1937d7768f7b8439920e9e127 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -21,6 +21,15 @@ struct a6xx_gmu_bo {
 
 #define GMU_MAX_GX_FREQS	16
 #define GMU_MAX_CX_FREQS	4
+#define GMU_MAX_BCMS		3
+
+struct a6xx_bcm {
+	char *name;
+	unsigned int buswidth;
+	bool fixed;
+	unsigned int perfmode;
+	unsigned int perfmode_bw;
+};
 
 /*
  * These define the different GMU wake up options - these define how both the
@@ -85,6 +94,10 @@ struct a6xx_gmu {
 	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
 	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
 
+	int nr_gpu_bws;
+	unsigned long gpu_bw_table[GMU_MAX_GX_FREQS];
+	u32 gpu_ib_votes[GMU_MAX_GX_FREQS][GMU_MAX_BCMS];
+
 	int nr_gmu_freqs;
 	unsigned long gmu_freqs[GMU_MAX_CX_FREQS];
 	u32 cx_arc_votes[GMU_MAX_CX_FREQS];
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 4aceffb6aae89c781facc2a6e4a82b20b341b6cb..9201a53dd341bf432923ffb44947e015208a3d02 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -44,6 +44,7 @@ struct a6xx_info {
 	u32 gmu_chipid;
 	u32 gmu_cgc_mode;
 	u32 prim_fifo_threshold;
+	const struct a6xx_bcm *bcms;
 };
 
 struct a6xx_gpu {

-- 
2.34.1


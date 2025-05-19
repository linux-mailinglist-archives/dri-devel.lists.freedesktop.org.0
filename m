Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47569ABC379
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2F010E379;
	Mon, 19 May 2025 16:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jInHb0HT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53DB10E2DE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ixf9022845
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZL6pOdAVZeGnzG7NNpx0LbhlTqFZLDNnGh7FAtqiAww=; b=jInHb0HTZMjx8/Zl
 4UHKKxYSjXtpKz+UYJcbWPKjk5S54cOD5gX3EDx/Fu5N377loqwThmzZEbHTyX1q
 CREW9euyHpoJ9JpIJ4htHKsJqkfZOB4TejYc/JFdBZfhZAZa+N5/EDtJuirus+mZ
 oOnpjj0rKXRAD6WUOL1hnQWoS3mjkZ2Kb2p/T8QOWc8pCKBpLZvOMOqJ5LjRUiIi
 PcZy1hYSw2iaSLmfm8oNmcQjducsNVkMaqGMV/tLFjde3Yfn56osHYqoldElEqTQ
 tpQ8+eVoah5ysX/bfj03rPQ3w4FiDvju6BgwRFjVhjdoltZagy+fWBDgC7CLOt8l
 +IUPgw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d11mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:19 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3f84fe7b63dso4458865b6e.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670658; x=1748275458;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZL6pOdAVZeGnzG7NNpx0LbhlTqFZLDNnGh7FAtqiAww=;
 b=njZJO5+zllMYdHmQJZsANYZHFJ8JQwXFBvRsZKukv4wdfLe2O+xJ9//991yv0MtH+Y
 Sl3lwp8AIGpeFLb9TrNLI7dvHE+6CL9zZobdR5qEEoCCyzNWsWqOJ3JhC9Twb5VgcWLC
 WL7bobJ6OEvX3DaAWFantSx5086/EnCLimexvoJxcZ7GrgIhsRN5FBGSykjR9u/SdMfC
 WsEZuz1LmfDv/9ZvwXxASHQiyk1MhEhQYgBxva8wnclqsVuwdz6zA05RK5p3vUUpkzKu
 vg5I3Q+qHYHyU77h9vVg3NH61WWuHx76JrD0jgQjLGsO8a/Jjw7NtZdPiIOHmU5mdAhz
 dlWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS1hEbg/J1i7ma74nNMwf8+rmFHHLXvjCi09ih8yASBpCDSL0sIU8V4e3HQRLCDpMD+LNOQvEjj5o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywc4TnZqfUuLLCRtCGTOYacbZU4CKwNn+2v2d0M2lqwRGVpJeZx
 uDV2DlMUjBexEI2ZQy1BHO34WRtLBm3ljGQhuqcWg0jcoDr1jftDl6SNJ5FLp7vS5w+tfCXwLJ2
 /PeWDFVnPXGznsljtE9Ok+un6XAQs5fOzDVLx+RYV55vQzdG2dF4RdY30wLTtRr3V9VErO1tHus
 4Ufuw=
X-Gm-Gg: ASbGnctHRD4/vNXEWBlM4pA2EUOw+VaN3aqQj6LIqQYhzdpMAxizD2IfwKg75RYGBF9
 pQiY5miyRfQCPegMPRC6Z8QooeBV6/UawoVIfMcr9KNafOsJJE/2Y6oRBDwZ6m9qU6KIdJz/jwF
 Nv+oCKK+wEfmJqhdWzvCvGH6JoH1rgGpJCI3WjWZSjdWYZzRu6FUf9IrBYp1JSgSYZRWesIclbn
 J4pFhOZ49jkgUgPreIDQJa0n4BJy+V8Q3AQLZDVCwbNbPNTtROdFd56JSjQNRJpTavQZmyOy9kY
 +LTb71A+6o5uWmqr7lb+/n43CvSbYo3m/iwGQcJnVxjne5ELVWL5U5fmG+pmhORz7qRK1OvH5+x
 IWQApgDTA24AicC6GDXDf//Xi
X-Received: by 2002:a05:6808:320e:b0:3f9:c0f6:2163 with SMTP id
 5614622812f47-404d86c16c6mr7913476b6e.12.1747670657751; 
 Mon, 19 May 2025 09:04:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa1ZWnT3cVS6hT4TKbEGhN2g/VFNk/7QQ9n5aitrhO9g5kpK7EA/YMf56SoMj8UgFO/O7mOg==
X-Received: by 2002:a05:6808:320e:b0:3f9:c0f6:2163 with SMTP id
 5614622812f47-404d86c16c6mr7913447b6e.12.1747670657433; 
 Mon, 19 May 2025 09:04:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:03 +0300
Subject: [PATCH v4 01/30] drm/msm/dpu: stop passing mdss_ver to
 setup_timing_gen()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-1-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3718;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tqlj8LXxDL0ZIrdpMe/CdigZeONJBV+bmLiEA3WJ1VM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z5L3L1i/g8Zfwi4G3+Ez9id9XN6cZNezATw
 J1xPzUBb5OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWeQAKCRCLPIo+Aiko
 1SOIB/wOsSbv4nod5wFIVx0MYuyh4+YD73mzWHesXEYz6EJ0waDOX8+0K2nRxE0eqAXKf49vRD7
 MxviScWEIDjyh5+gvn7TWbi/IaYK2BkRj0cLYjKC7D67Bixzv2wjcSPZJU7rrJdxZPeyFeeZ3WX
 AHdCJWQMAHDewwY09GueCWofkbxe5TRNjwLYZ4zQi46qbrnNB8mBvRdCxazSSF6R5+bktr7XiFH
 VJikbMiJLPeReJ2QYHXtJyRxhbnkPZWzCI8nQwUicSxX9ORzf8hoWYERluH+MAy/byylnXqWrWn
 aEnuJlidq6bVFx9QcF1VyTEkIg3ZJcP0cmOy5mkylxhix6qd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXxWhfY1URTY5g
 IU7g/KYqF8DWBgHlFGZ/bOw3ivpMfd1tGpgvg1ubN9uhd8/u7IuSvTm0VtkI0F7XzpuoJDP8w/s
 y8EC4OeQ76QKgThtY0pxCwD+MFU+xuOo6SLTN448qCxAGUgi5Lin99eHswUlzmZvbBEl4gYG1G1
 n0HnW60mzUTvOizYD1dyKudnH0d0JDvTFto48QcbFW6NXnDIjyoyYUb9DN5mJSeuDG/Nxbjw4Re
 okkzVCFe/GUoSZId1Ueqjh2BjvBCFM3p6NINg3xYzuvP2e6pDfCdevnJmNiVIw4LcmfkAPzO+jk
 2QBvc73dVWQPcQ0Q4xPoogaL1wYOKBdsK7/0AlIDLmHuFTahVslk/ATqdmr6g0Xbg7nOUJy7FxE
 2NWA9+/aUlPXD+h0NcVkt33ln7KZHPRYkOtQGJVgrKwuhvrkTQSHHg5pgEuSYlNtIoQ1teKX
X-Proofpoint-GUID: 66SdTUOEnEzLfmuekQXb_qdQ4-mvq79e
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b5683 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fc1Z5Xec4v_XsjI5eh8A:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 66SdTUOEnEzLfmuekQXb_qdQ4-mvq79e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As a preparation to further MDSS-revision cleanups stop passing MDSS
revision to the setup_timing_gen() callback. Instead store a pointer to
it inside struct dpu_hw_intf and use it diretly. It's not that the MDSS
revision can chance between dpu_hw_intf_init() and
dpu_encoder_phys_vid_setup_timing_engine().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 5 +++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 8a618841e3ea89acfe4a42d48319a6c54a1b3495..d35d15b60260037c5c0c369cb061e7759243b6fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -309,8 +309,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
-			&timing_params, fmt,
-			phys_enc->dpu_kms->catalog->mdss_ver);
+			&timing_params, fmt);
 	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
 
 	/* setup which pp blk will connect to this intf */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index fb1d25baa518057e74fec3406faffd48969d492b..1d56c21ac79095ab515aeb485346e1eb5793c260 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -98,8 +98,7 @@
 
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 		const struct dpu_hw_intf_timing_params *p,
-		const struct msm_format *fmt,
-		const struct dpu_mdss_version *mdss_ver)
+		const struct msm_format *fmt)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	u32 hsync_period, vsync_period;
@@ -180,7 +179,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 
 	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
 	if (p->compression_en && !dp_intf &&
-	    mdss_ver->core_major_ver >= 7)
+	    intf->mdss_ver->core_major_ver >= 7)
 		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
 
 	hsync_data_start_x = hsync_start_x;
@@ -580,6 +579,8 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 
+	c->mdss_ver = mdss_rev;
+
 	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
 	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
 	c->ops.get_status = dpu_hw_intf_get_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 114be272ac0ae67fe0d4dfc0c117baa4106f77c9..f31067a9aaf1d6b96c77157135122e5e8bccb7c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -81,8 +81,7 @@ struct dpu_hw_intf_cmd_mode_cfg {
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_timing_params *p,
-			const struct msm_format *fmt,
-			const struct dpu_mdss_version *mdss_ver);
+			const struct msm_format *fmt);
 
 	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_prog_fetch *fetch);
@@ -126,6 +125,8 @@ struct dpu_hw_intf {
 	enum dpu_intf idx;
 	const struct dpu_intf_cfg *cap;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* ops */
 	struct dpu_hw_intf_ops ops;
 };

-- 
2.39.5


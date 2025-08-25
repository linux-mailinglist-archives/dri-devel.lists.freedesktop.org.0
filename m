Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FEBB3431E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E342410E4C3;
	Mon, 25 Aug 2025 14:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMW3vWtA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A45610E4B2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P93A9o026431
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Iw8ppDiHE0lYEET88/vXvls/yMgN6I1RkwcMICrCuiY=; b=WMW3vWtAODsERtm1
 LnsGfFJOh5rsgnsBaveZ+kOxPajVhgAOcOKdqnv0D32CzjI60b+dhyX3tutRbKg0
 WQTMcs5idELdyQbCwilH+EjVevxYxkOzYKmE0h4nyW46ohah95WE42EqiTFuDjUW
 H9vQxjqeixSQ9dMFOjM8NFq0UGdwRB5HRidSMYNauLSZxPnX8pvtyfKhcBvELWIo
 t3QEVP9qbqUcOciisd0E5esqKAWuYq7H16pW151vklmfc/5oycLJ8pxFRwxBiXYf
 phDwCKbu6OfHjenkKS7FvOQX0/Q5fY5RDrKTbaDAqypVmM81HxJW9WIfOtSi4530
 YIsGLQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de5dgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-771f28ed113so173346b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131497; x=1756736297;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iw8ppDiHE0lYEET88/vXvls/yMgN6I1RkwcMICrCuiY=;
 b=A0d3whViirQwSFicRbRJYJzcT2t+JHZKIZiVkJoc8CDSvS5sTf45p/NdFkzm4G/uhF
 rQlL+pJHjpJvhmQOhnToxYmu0cL8qsPc7jpg85VMfPxCRx9gv1fszYHIixJZexJb8bjp
 rZ7OClnJC+ojwffDhapr98xRUYS/DIOC/V9QYorMVbgxjgH22ps+ejLZOBTZCHTHgkfX
 rOqzKnPB2Of98QAt580zKuIlaz67Pp01oYWyhy+M52LHk3CQlqG+0x2c2JPEOVC8uq3H
 8IJYzOxZZ0+qwjrkRCReEnIcM53v8tWE9lTX/L7oMtFEOAEA7qB9EORWoR9yF1MXe8wl
 U9zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdkfEHPZfnm06rTkGDhobfn8bwkcueJ5gujrvUgUIESAgfLdRO3OfLAr74Yy/ZMluaQ696dK7wJv8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/+XUHkPt2vkGCo00Zjj+owJHSsnSTMMgyGjEFl2ks1us8CebK
 VZZHlqkkF5s4d5Zr/nLJMwpME8F33l9DkDFjEinZWoPdX82u70rhu1Lu+xEzfaiHec+A0Ky6U0y
 4PIcAMKd5gYRCsUjgOy1RvXftx9+6kO8/f9nrcbIJkCOdxHLmDUFGK299UlIeeHTyF8STjY8=
X-Gm-Gg: ASbGncvKqK0aprW+538ifr4ZVl1UJlUVl9DDiG/ZlUqU+nC1ylBY1OKvCLGqGYhWHqB
 YOCjYHsF4/5jKWGdAL3bwldpI1R0b/hRTV3+zhkNnOH6wLubI4NjTVTygi6FgCBlRFjn0A6z8ag
 BlmQzb//5wKGcv5Q5MkefiWHI9NyeHz6fKbX2gjP+eat8FrFamDPfAsUY0AxGQpmgBpPsmUK0tl
 EFNixM3nuNIbDGqnV6iRyi8QEXbQafpNPaALEDWWB56YHt+9AAxG4sre+i8/u3eH34pq6PwixVk
 XK94LAeO+v3QrQeYRWOx7MefYtEimUHH01hFELSMj0v85WsDDiBm66enIITTutFAE6hZ1mo=
X-Received: by 2002:a05:6a00:bd11:b0:771:ebf1:5e3b with SMTP id
 d2e1a72fcca58-771ebf16591mr1851350b3a.23.1756131496627; 
 Mon, 25 Aug 2025 07:18:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJPpzXx2ojhVJGS5WV4U8pui8t3u9L5eVn/uZyEWhVErXDCSjjBh+QqWq22j/pttFR1frhTg==
X-Received: by 2002:a05:6a00:bd11:b0:771:ebf1:5e3b with SMTP id
 d2e1a72fcca58-771ebf16591mr1851306b3a.23.1756131496016; 
 Mon, 25 Aug 2025 07:18:16 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:15 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:02 +0800
Subject: [PATCH v3 16/38] drm/msm/dp: Add catalog support for 3rd/4th
 stream MST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-16-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131421; l=22901;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=80J64RIEdTyxDRclXKw3/HXgyS0HL1S0VsnIPl4LqvE=;
 b=r8sjetZkeaeSPmP8tWt3CmEN1quyWxtS5FyJzcvqoIZIxR6NrQb7+3JBvHFs8CgH/dn5GltV0
 VgNAaktG/X1BdeqOERUtiHfPvtq6dasmj8wKecBexZmsbrEU3CXEnnD
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfX/8Mi01lKWuUG
 TdEASqF7zwAoIdR15EcUh6nX2oQMZBGMpOv6PmFePmTIaxT4BTfHZFy8h5NPyCFgYSc0A/bEOuX
 4RpqwHqxz9jQVWZwondTochXdNbEuOL4hcmlwdyijG5EaYeOSbs9jR+GuL1HK5mmR/noJ16jA9J
 s8fNmZhoTR1UlgCiTNDYx4z11+2cm0NBFrKO0WJ0G96A04VzE3N9PUzAFc2SbMcc2NJORrcY6tK
 idcu9lXIIpxlDlI8qpD1P3dYUzNWjQYVLnqz90gbuYxaHrYkJRrUdf9TG3WgrGDxojZGV4gqDnR
 EZKAITT/LXvVtb3t6RsgmYYbsOgaYEHMbH/QMEeuIGTUsi3v36fa4Tcx76LyPtRw6ZoFylVaeIE
 qk2ED9fI
X-Proofpoint-ORIG-GUID: aEl9zMXvQo7bArgLz6A7GSKS3mN1rIDv
X-Proofpoint-GUID: aEl9zMXvQo7bArgLz6A7GSKS3mN1rIDv
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68ac70aa cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=XDKDc6bjgEyK0QdLY68A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037
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

To support 4-stream MST, the link clocks for stream 3 and stream 4
are controlled by MST_2_LCLK and MST_3_LCLK. These clocks share the
same register definitions but use different base addresses.

This patch adds catalog support to enable programming of these blocks.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  82 ++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  24 ++++++-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 138 ++++++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_panel.h   |   4 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |  14 ++++
 6 files changed, 230 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index b8b6a09966aed96f705bdd54cb16ea63e5f0141f..608a1a077301b2ef3c77c271d873bb4364abe779 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -118,6 +118,8 @@ struct msm_dp_ctrl_private {
 	struct msm_dp_link *link;
 	void __iomem *ahb_base;
 	void __iomem *link_base;
+	void __iomem *mst2link_base;
+	void __iomem *mst3link_base;
 
 	struct phy *phy;
 
@@ -172,6 +174,40 @@ static inline void msm_dp_write_link(struct msm_dp_ctrl_private *ctrl,
 	writel(data, ctrl->link_base + offset);
 }
 
+static inline u32 msm_dp_read_mstlink(struct msm_dp_ctrl_private *ctrl,
+				       enum msm_dp_stream_id stream_id, u32 offset)
+{
+	switch (stream_id) {
+	case DP_STREAM_2:
+		return readl_relaxed(ctrl->mst2link_base + offset);
+	case DP_STREAM_3:
+		return readl_relaxed(ctrl->mst3link_base + offset);
+	default:
+		DRM_ERROR("error stream_id\n");
+		return 0;
+	}
+}
+
+static inline void msm_dp_write_mstlink(struct msm_dp_ctrl_private *ctrl,
+			       enum msm_dp_stream_id stream_id, u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	switch (stream_id) {
+	case DP_STREAM_2:
+		writel(data, ctrl->mst2link_base + offset);
+		break;
+	case DP_STREAM_3:
+		writel(data, ctrl->mst3link_base + offset);
+		break;
+	default:
+		DRM_ERROR("error stream_id\n");
+		break;
+	}
+}
+
 static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 					struct msm_dp_link_info *link)
 {
@@ -386,7 +422,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 	u32 config = 0, tbd;
 	u32 reg_offset = 0;
 
-	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
+	if (msm_dp_panel->stream_id < DP_STREAM_2)
+		config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
+
+	if (msm_dp_panel->stream_id == DP_STREAM_1)
+		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
 
 	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
@@ -401,8 +441,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 
 	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
 
-	if (msm_dp_panel->stream_id == DP_STREAM_1)
-		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
+	if (msm_dp_panel->stream_id > DP_STREAM_1)
+		msm_dp_write_mstlink(ctrl, msm_dp_panel->stream_id,
+			REG_DP_MSTLINK_CONFIGURATION_CTRL, config);
+	else
+		msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL + reg_offset, config);
 }
 
 static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
@@ -462,7 +505,11 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	if (msm_dp_panel->stream_id == DP_STREAM_1)
 		reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
 
-	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset);
+	if (msm_dp_panel->stream_id > DP_STREAM_1)
+		misc_val = msm_dp_read_mstlink(ctrl, msm_dp_panel->stream_id,
+				REG_DP_MSTLINK_MISC1_MISC0);
+	else
+		misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset);
 
 	/* clear bpp bits */
 	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
@@ -472,7 +519,11 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
 
 	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
-	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset, misc_val);
+	if (msm_dp_panel->stream_id > DP_STREAM_1)
+		msm_dp_write_mstlink(ctrl, msm_dp_panel->stream_id,
+			REG_DP_MSTLINK_MISC1_MISC0, misc_val);
+	else
+		msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset, misc_val);
 }
 
 static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
@@ -2495,8 +2546,15 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 		nvid *= 3;
 
 	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
-	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID + mvid_reg_off, mvid);
-	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID + nvid_reg_off, nvid);
+	if (msm_dp_panel->stream_id > DP_STREAM_1) {
+		msm_dp_write_mstlink(ctrl, msm_dp_panel->stream_id,
+				     REG_MSTLINK_SOFTWARE_MVID, mvid);
+		msm_dp_write_mstlink(ctrl, msm_dp_panel->stream_id,
+				     REG_MSTLINK_SOFTWARE_NVID, nvid);
+	} else {
+		msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID + mvid_reg_off, mvid);
+		msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID + nvid_reg_off, nvid);
+	}
 }
 
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
@@ -2567,7 +2625,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
-	msm_dp_ctrl_config_ctrl_link(ctrl);
+
+	if (msm_dp_panel->stream_id == DP_STREAM_0)
+		msm_dp_ctrl_config_ctrl_link(ctrl);
 
 	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
 
@@ -2745,7 +2805,9 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 			struct phy *phy,
 			int max_stream,
 			void __iomem *ahb_base,
-			void __iomem *link_base)
+			void __iomem *link_base,
+			void __iomem *mst2link_base,
+			void __iomem *mst3link_base)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	int ret;
@@ -2785,6 +2847,8 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->phy      = phy;
 	ctrl->ahb_base = ahb_base;
 	ctrl->link_base = link_base;
+	ctrl->mst2link_base = mst2link_base;
+	ctrl->mst3link_base = mst3link_base;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl, max_stream);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 32ff1455caf0e7fcb1bd74b1f3192c6c3c03ee74..2baf7a1ff44dd7139d2da86390121d5e7a063e9a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -31,7 +31,9 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
 				    struct phy *phy,
 				    int max_stream,
 				    void __iomem *ahb_base,
-				    void __iomem *link_base);
+				    void __iomem *link_base,
+				    void __iomem *mst2link_base,
+				    void __iomem *mst3link_base);
 
 void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 935a0c57a928b15a1e9a6f1fab2576b7b09acb8e..562a5eccf3f08c5669cc7c2ad1268897e975d0c4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -84,6 +84,12 @@ struct msm_dp_display_private {
 	void __iomem *link_base;
 	size_t link_len;
 
+	void __iomem *mst2link_base;
+	size_t mst2link_len;
+
+	void __iomem *mst3link_base;
+	size_t mst3link_len;
+
 	void __iomem *pixel_base[DP_STREAM_MAX];
 	size_t pixel_len;
 
@@ -619,7 +625,8 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base);
+	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base,
+			       dp->mst2link_base, dp->mst3link_base, dp->pixel_base);
 	if (IS_ERR(dp->panel)) {
 		rc = PTR_ERR(dp->panel);
 		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
@@ -628,7 +635,8 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 	}
 
 	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
-			       phy, dp->max_stream, dp->ahb_base, dp->link_base);
+			       phy, dp->max_stream, dp->ahb_base,
+			       dp->link_base, dp->mst2link_base, dp->mst3link_base);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
@@ -937,6 +945,10 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 				    msm_dp_display->aux_base, "dp_aux");
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
 				    msm_dp_display->link_base, "dp_link");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_display->mst2link_len,
+				    msm_dp_display->mst2link_base, "dp_mst2link");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_display->mst3link_len,
+				    msm_dp_display->mst3link_base, "dp_mst3link");
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
 				    msm_dp_display->pixel_base[0], "dp_p0");
 }
@@ -1245,6 +1257,14 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 					      display->pixel_base[i]);
 	}
 
+	display->mst2link_base = msm_dp_ioremap(pdev, 7, &display->mst2link_len);
+	if (IS_ERR(display->mst2link_base))
+		DRM_DEBUG_DP("unable to remap link region: %pe\n", display->mst2link_base);
+
+	display->mst3link_base = msm_dp_ioremap(pdev, 8, &display->mst3link_len);
+	if (IS_ERR(display->mst3link_base))
+		DRM_DEBUG_DP("unable to remap link region: %pe\n", display->mst3link_base);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index d1af389dffcfee2d21a616de6ee027374997aaee..f792687c315a2c8203305a20b7290a93b0d791f4 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -26,6 +26,8 @@ struct msm_dp_panel_private {
 	struct drm_dp_aux *aux;
 	struct msm_dp_link *link;
 	void __iomem *link_base;
+	void __iomem *mst2link_base;
+	void __iomem *mst3link_base;
 	void __iomem *pixel_base[DP_STREAM_MAX];
 	bool panel_on;
 };
@@ -45,6 +47,39 @@ static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
 	writel(data, panel->link_base + offset);
 }
 
+static inline u32 msm_dp_read_mstlink(struct msm_dp_panel_private *panel, u32 offset)
+{
+	switch (panel->msm_dp_panel.stream_id) {
+	case DP_STREAM_2:
+		return readl_relaxed(panel->mst2link_base + offset);
+	case DP_STREAM_3:
+		return readl_relaxed(panel->mst3link_base + offset);
+	default:
+		DRM_ERROR("error stream_id\n");
+		return 0;
+	}
+}
+
+static inline void msm_dp_write_mstlink(struct msm_dp_panel_private *panel,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	switch (panel->msm_dp_panel.stream_id) {
+	case DP_STREAM_2:
+		writel(data, panel->mst2link_base + offset);
+		break;
+	case DP_STREAM_3:
+		writel(data, panel->mst3link_base + offset);
+		break;
+	default:
+		DRM_ERROR("error stream_id\n");
+		break;
+	}
+}
+
 static inline void msm_dp_write_pn(struct msm_dp_panel_private *panel,
 			       u32 offset, u32 data)
 {
@@ -384,13 +419,22 @@ static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct
 
 	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
 
-	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0 + offset, header[0]);
-	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1 + offset, header[1]);
+	if (panel->msm_dp_panel.stream_id > DP_STREAM_1) {
+		msm_dp_write_mstlink(panel, MMSS_DP_MSTLINK_GENERIC0_0, header[0]);
+		msm_dp_write_mstlink(panel, MMSS_DP_MSTLINK_GENERIC0_1, header[1]);
+	} else {
+		msm_dp_write_link(panel, MMSS_DP_GENERIC0_0 + offset, header[0]);
+		msm_dp_write_link(panel, MMSS_DP_GENERIC0_1 + offset, header[1]);
+	}
 
 	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
 		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
 		       (vsc_sdp->db[i + 3] << 24));
-		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i + offset, val);
+
+		if (panel->msm_dp_panel.stream_id > DP_STREAM_1)
+			msm_dp_write_mstlink(panel, MMSS_DP_MSTLINK_GENERIC0_2 + i, val);
+		else
+			msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i + offset, val);
 	}
 }
 
@@ -404,8 +448,13 @@ static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
 
 	if (hw_revision >= DP_HW_VERSION_1_0 &&
 	    hw_revision < DP_HW_VERSION_1_2) {
-		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, UPDATE_SDP);
-		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, 0x0);
+		if (panel->msm_dp_panel.stream_id > DP_STREAM_1) {
+			msm_dp_write_mstlink(panel, MMSS_DP_MSTLINK_SDP_CFG3, UPDATE_SDP);
+			msm_dp_write_mstlink(panel, MMSS_DP_MSTLINK_SDP_CFG3, 0x00);
+		} else {
+			msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, UPDATE_SDP);
+			msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, 0x0);
+		}
 	}
 }
 
@@ -424,15 +473,26 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
 		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
 	}
 
-	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
-	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
-	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
+	if (msm_dp_panel->stream_id > DP_STREAM_1) {
+		cfg = msm_dp_read_mstlink(panel, MMSS_DP_MSTLINK_SDP_CFG);
+		cfg2 = msm_dp_read_mstlink(panel, MMSS_DP_MSTLINK_SDP_CFG2);
+		misc = msm_dp_read_mstlink(panel, REG_DP_MSTLINK_MISC1_MISC0);
+	} else {
+		cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
+		cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
+		misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
+	}
 
 	cfg |= GEN0_SDP_EN;
-	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
-
 	cfg2 |= GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
+
+	if (msm_dp_panel->stream_id > DP_STREAM_1) {
+		msm_dp_write_mstlink(panel, MMSS_DP_MSTLINK_SDP_CFG, cfg);
+		msm_dp_write_mstlink(panel, MMSS_DP_MSTLINK_SDP_CFG2, cfg2);
+	} else {
+		msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
+		msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
+	}
 
 	msm_dp_panel_send_vsc_sdp(panel, vsc_sdp);
 
@@ -442,7 +502,10 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
 	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=1\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
+	if (msm_dp_panel->stream_id > DP_STREAM_1)
+		msm_dp_write_mstlink(panel, REG_DP_MSTLINK_MISC1_MISC0, misc);
+	else
+		msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
 
 	msm_dp_panel_update_sdp(panel);
 }
@@ -462,15 +525,26 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
 		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
 	}
 
-	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
-	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
-	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
+	if (msm_dp_panel->stream_id > DP_STREAM_1) {
+		cfg = msm_dp_read_mstlink(panel, MMSS_DP_MSTLINK_SDP_CFG);
+		cfg2 = msm_dp_read_mstlink(panel, MMSS_DP_MSTLINK_SDP_CFG2);
+		misc = msm_dp_read_mstlink(panel, REG_DP_MSTLINK_MISC1_MISC0);
+	} else {
+		cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
+		cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
+		misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
+	}
 
 	cfg &= ~GEN0_SDP_EN;
-	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
-
 	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
+
+	if (msm_dp_panel->stream_id > DP_STREAM_1) {
+		msm_dp_write_mstlink(panel, MMSS_DP_MSTLINK_SDP_CFG, cfg);
+		msm_dp_write_mstlink(panel, MMSS_DP_MSTLINK_SDP_CFG2, cfg2);
+	} else {
+		msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
+		msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
+	}
 
 	/* switch back to MSA */
 	misc &= ~DP_MISC1_VSC_SDP;
@@ -478,7 +552,10 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
 	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=0\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
+	if (msm_dp_panel->stream_id > DP_STREAM_1)
+		msm_dp_write_mstlink(panel, REG_DP_MSTLINK_MISC1_MISC0, misc);
+	else
+		msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
 
 	msm_dp_panel_update_sdp(panel);
 }
@@ -584,10 +661,20 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 
 	msm_dp_active = data;
 
-	msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER + offset, total);
-	msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC  + offset, sync_start);
-	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset, width_blanking);
-	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER  + offset, msm_dp_active);
+	if (msm_dp_panel->stream_id > DP_STREAM_1) {
+		msm_dp_write_mstlink(panel, REG_DP_MSTLINK_TOTAL_HOR_VER, total);
+		msm_dp_write_mstlink(panel, REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC,
+			sync_start);
+		msm_dp_write_mstlink(panel, REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY,
+			width_blanking);
+		msm_dp_write_mstlink(panel, REG_DP_MSTLINK_ACTIVE_HOR_VER, msm_dp_active);
+	} else {
+		msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER + offset, total);
+		msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC  + offset, sync_start);
+		msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset,
+			width_blanking);
+		msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER  + offset, msm_dp_active);
+	}
 
 	reg = msm_dp_read_pn(panel, MMSS_DP_INTF_CONFIG);
 	if (wide_bus_en)
@@ -703,6 +790,8 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
+			      void __iomem *mst2link_base,
+			      void __iomem *mst3link_base,
 			      void __iomem *pixel_base[])
 {
 	struct msm_dp_panel_private *panel;
@@ -722,6 +811,9 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 	panel->aux = aux;
 	panel->link = link;
 	panel->link_base = link_base;
+	panel->mst2link_base = mst2link_base;
+	panel->mst3link_base = mst3link_base;
+
 	memcpy(panel->pixel_base, pixel_base, sizeof(panel->pixel_base));
 
 	msm_dp_panel = &panel->msm_dp_panel;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 23b3e78e40479d133893a8afe1a69cfe8c16abdf..2bfe3695994235d04e209a2785915107c6a8e413 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -103,5 +103,7 @@ static inline bool is_lane_count_valid(u32 lane_count)
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
-			      void __iomem *p0_base);
+			      void __iomem *mst2link_base,
+			      void __iomem *mst3link_base,
+			      void __iomem *pixel_base[]);
 #endif /* _DP_PANEL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 43a9ce0539906e1f185abf250fdf161e462d9645..a806d397ff9d9ad3830b1f539614bffcc955a786 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -142,6 +142,7 @@
 
 #define REG_DP_CONFIGURATION_CTRL		(0x00000008)
 #define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
+#define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
 #define DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK	(0x00000001)
 #define DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN (0x00000002)
 #define DP_CONFIGURATION_CTRL_P_INTERLACED	(0x00000004)
@@ -163,12 +164,19 @@
 #define REG_DP1_SOFTWARE_MVID			(0x00000414)
 #define REG_DP1_SOFTWARE_NVID			(0x00000418)
 #define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
+#define REG_MSTLINK_SOFTWARE_MVID		(0x00000040)
+#define REG_MSTLINK_SOFTWARE_NVID		(0x00000044)
+#define REG_DP_MSTLINK_TOTAL_HOR_VER		(0x00000048)
 #define REG_DP_START_HOR_VER_FROM_SYNC		(0x00000020)
+#define REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC	(0x0000004C)
 #define REG_DP_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000024)
+#define REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000050)
 #define REG_DP_ACTIVE_HOR_VER			(0x00000028)
+#define REG_DP_MSTLINK_ACTIVE_HOR_VER		(0x00000054)
 
 #define REG_DP_MISC1_MISC0			(0x0000002C)
 #define REG_DP1_MISC1_MISC0			(0x0000042C)
+#define REG_DP_MSTLINK_MISC1_MISC0		(0x00000058)
 #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
 #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
 #define DP_MISC0_TEST_BITS_DEPTH_SHIFT		(0x00000005)
@@ -236,9 +244,11 @@
 
 #define MMSS_DP_SDP_CFG				(0x00000228)
 #define MMSS_DP1_SDP_CFG			(0x000004E0)
+#define MMSS_DP_MSTLINK_SDP_CFG		(0x0000010c)
 #define GEN0_SDP_EN				(0x00020000)
 #define MMSS_DP_SDP_CFG2			(0x0000022C)
 #define MMSS_DP1_SDP_CFG2			(0x000004E4)
+#define MMSS_DP_MSTLINK_SDP_CFG2		(0x0000011c)
 #define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
 #define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
 #define GENERIC0_SDPSIZE_VALID			(0x00010000)
@@ -248,6 +258,7 @@
 
 #define MMSS_DP_SDP_CFG3			(0x0000024c)
 #define MMSS_DP1_SDP_CFG3			(0x000004E8)
+#define MMSS_DP_MSTLINK_SDP_CFG3		(0x00000114)
 #define UPDATE_SDP				(0x00000001)
 
 #define MMSS_DP_EXTENSION_0			(0x00000250)
@@ -297,6 +308,9 @@
 #define MMSS_DP_GENERIC1_8			(0x00000348)
 #define MMSS_DP_GENERIC1_9			(0x0000034C)
 #define MMSS_DP1_GENERIC0_0			(0x00000490)
+#define MMSS_DP_MSTLINK_GENERIC0_0		(0x000000BC)
+#define MMSS_DP_MSTLINK_GENERIC0_1		(0x000000C0)
+#define MMSS_DP_MSTLINK_GENERIC0_2		(0x000000C4)
 
 #define MMSS_DP_VSCEXT_0			(0x000002D0)
 #define MMSS_DP_VSCEXT_1			(0x000002D4)

-- 
2.34.1


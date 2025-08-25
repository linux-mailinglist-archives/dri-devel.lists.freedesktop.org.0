Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F9BB34351
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1DE10E4D4;
	Mon, 25 Aug 2025 14:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bhue0yg5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB3910E4D5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:41 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8wq18023627
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CF1VNUZFWAoTkwVdcq3ZpR3SjUV1mxisKlAEosuGRMI=; b=Bhue0yg5FDRIXFC1
 wPqcZv/YSp/WB76gmJD0u2KYBaIlqhvsXdxjnokaAoRN+xYOLpsmgjypizHBSEZn
 J0d3TBoBPuqncIaHrdxoMts0M7c1/TfUS2PvJrCVMB3YshDS5iocP3h0qjEQnhQD
 BsISUmT5nDv4G8tRcMEyONWeKjdyjfDc0KWQfxsCrhFRR8jiqV3k10FDv+EHkUvD
 UI4JzMDn6H6gL+A+sSreOtiPt2R70EcDuYvTYIa/IWHhmyTnmVhsU6YT4GZcPw5R
 HbO4qXx61xDrtLb6QR457FDDQHde/qlX+abpuPSpzdQaU9TGXnsmJrjR/hgquUWA
 Ji001w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um5eq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b49da7c3ff6so787861a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131580; x=1756736380;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CF1VNUZFWAoTkwVdcq3ZpR3SjUV1mxisKlAEosuGRMI=;
 b=rktlBa7O4mz3QlD63AeXCWRQQ5DE2xfr6DROfr1MXsb+T95HBTAHyELmcFtQbeFhjf
 9lZSFUi2FqhBv0xK74FCAZDNpLqncJYK98q3iJDaFt3EGQHefrI2VQSQZTjF2UvxPRoG
 6NKFI30aea+meunQYbnoNV1HHd8diBeKkySePGkXLo3K/jINRhrQ7lIeBNFZfZap+Qgw
 /+9UOaoH+MNvTeY2bF7Aur3sga1TNxv+KvhhjPCi88/GGf/S+SRKa0e/aiW/7NEWvs0Y
 aNaJYXiam25LpGRUGL41DCmvHcHGWLh/UocKe3DLtqlzsNsUobX5DGrbFBA0GihxIt8Z
 xlfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOZ6ghjCyN7vI6DnyqqdbfhIQtmu6zzy0i62JxULEWp+gHpRC0nama98RUodA9sVOfzojMYwRtVeo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwheYU7dThYB3yBMupjn3DmaOKYVW03aw3gG5yFBbH/uBXBt3kF
 G0ZdxUHBIHZ4By4ldJYCF4LZAa5LGb+oVp66RctxgNFMqO6W0tIJPUm1/B1dyVtGtrTr1Qsc4tA
 LpfigqqvwsqOJ3h5upq+q15e/XvDKBScrf/NmX/W+In/vspgQ/90qx/wX50WIuTCPbdMjbmA=
X-Gm-Gg: ASbGncuSTB15idRUyl+tUhtaLdYC2cSvFPuBrtM3Y+CixGcjD90Gv2UYYrpgXlWuq02
 IpOgZxu+7xBUUl41TBiJiyXAaUpdUhPA4Vs4PknJH55HjXywjr9h2YWvBiYrRwAIGBMOWKZ6rdJ
 M6rR0U8OSdwkUPwHRIyUAp7RW4tZJw+kcK8r145ymNcq3TCduHFVimygwDew9MoYFt2+osuHGJB
 UFJnQ8ctLVechfIHOP+WMCEBbwfYAoZHJhGb5hdWkSbaJG3p4yfT/8tjoJnu0Kd3psUCEc46r2z
 R/zZJDYV9P89zNJ9Sztu7tQ5dCvNt8xSu7ZnStF76UZiXmEzERznU3VltGb1AMm5z0pK1N8=
X-Received: by 2002:a05:6a20:a10e:b0:23f:f5bf:35d7 with SMTP id
 adf61e73a8af0-24340dc88cemr18191243637.45.1756131580014; 
 Mon, 25 Aug 2025 07:19:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPAmA6KgMGWrk9NgRt8J2RIgsVMiMidd+39K0LNZbVzR37+jqMhfxfP0sgzD6hGlVlZlnp7g==
X-Received: by 2002:a05:6a20:a10e:b0:23f:f5bf:35d7 with SMTP id
 adf61e73a8af0-24340dc88cemr18191190637.45.1756131579394; 
 Mon, 25 Aug 2025 07:19:39 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:39 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:22 +0800
Subject: [PATCH v3 36/38] drm/msm/dpu: use msm_dp_get_mst_intf_id() to get
 the intf id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250825-msm-dp-mst-v3-36-01faacfcdedd@oss.qualcomm.com>
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
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131424; l=3583;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=uY2Iv++yN1m/94AgtNBgb5m01vTsGsicz0WYoBHYze0=;
 b=7yeZmvLqu/95G3RjFS9sZCcTWmjF6qHI1lm/pJRJHhLnmxHSYXpzgCI7P7hY0zP6dSheSEsyL
 HbjSfT6HzE4BwEVbOLkw7S5Iw7pEiOG3mPahNG+AH4mt5E0PZdjA6nW
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ac70fd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=73Fxo_05DylMrM8smIAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXy3RgQEbD0DUi
 AXcju7l7n2IHOQgWr4P0y6ftG2pIoCwXl2Eoao+pUUxD0co6S5WUuuQROGUsGMG4vpcq6ml1yMf
 SpyylqnJVca2zGFD+CtdxJFtKlpLw1nfL+rozE0r+AgLJngqmgxqbeK0aAKYJjahsjsxqoze+r3
 xBdh7K0pku6GjfHnP06niDp0XwpNs8vOl+DOWItBOEZWCFvjhZQUnfDtMf/84+IMZJi/uE3pLqd
 1U71s9OYXt6xmcFZVnitRWn+WyJ3C61MEXSjq9HlXIpT5CL6b1lbj81QxOceslLuiY3Kl+upB/G
 KGloPYyjhdzO7E4T1eOtrOvz13De1oGWDmeUGSxSOI6KyS2o/AfrdY00VYb/DrrIvZD/fdAtj2q
 BXEzxY4b
X-Proofpoint-GUID: 23IojnKyhSPxClOajdv3or1R411ncMwg
X-Proofpoint-ORIG-GUID: 23IojnKyhSPxClOajdv3or1R411ncMwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Use msm_dp_get_mst_intf_id() to get the interface ID for the DP MST
controller as the intf_id is unique for each MST stream of each
DP controller.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 51 +++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 05e5f3463e30c9a6bd5b740580720ae2bf6b3246..2eb5397d15732b224372c68d0b2b7167da9f2896 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1429,17 +1429,52 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 		struct dpu_rm *dpu_rm,
-		enum dpu_intf_type type, u32 controller_id)
+		enum dpu_intf_type type, int enc_type, u32 id)
 {
-	int i = 0;
+	int i = 0, cnt = 0;
+	int controller_id = id >> 16;
+	int stream_id = id & 0x0F;
 
 	if (type == INTF_WB)
 		return NULL;
 
-	for (i = 0; i < catalog->intf_count; i++) {
-		if (catalog->intf[i].type == type
-		    && catalog->intf[i].controller_id == controller_id) {
-			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
+	if (enc_type == DRM_MODE_ENCODER_DPMST) {
+		/* The intf order in dpu_intf_cfg matches the mapping in the DP HPG.
+		 * example:
+		 * DPU_8_4_0 - DP Controller intf to stream Mapping
+		 *
+		 * +-------------+----------+----------+----------+----------+
+		 * | stream_id   |    0     |    1     |    2     |    3     |
+		 * +-------------+----------+----------+----------+----------+
+		 * | DP0         | INTF_0   | INTF_3   | INTF_6   | INTF_7   |
+		 * | DP1         | INTF_4   | INTF_8   |          |          |
+		 * +-------------+----------+----------+----------+----------+
+		 *
+		 * DPU_9_2_0 - DP Controller intf to stream Mapping
+		 *
+		 * +-------------+----------+----------+
+		 * | Controller  |    0     |    1     |
+		 * +-------------+----------+----------+
+		 * | DP0         | INTF_0   | INTF_3   |
+		 * | DP1         | INTF_4   | INTF_8   |
+		 * | DP2         | INTF_6   | INTF_7   |
+		 * +-------------+----------+----------+
+		 */
+		DPU_DEBUG("controller_id %d for stream_id = %d\n", controller_id, stream_id);
+		for (i = 0; i < catalog->intf_count; i++) {
+			if (catalog->intf[i].type == INTF_DP
+			&& controller_id == catalog->intf[i].controller_id) {
+				if (cnt == stream_id)
+					return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
+				cnt++;
+			}
+		}
+	} else {
+		for (i = 0; i < catalog->intf_count; i++) {
+			if (catalog->intf[i].type == type
+			&& catalog->intf[i].controller_id == controller_id) {
+				return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
+			}
 		}
 	}
 
@@ -2670,7 +2705,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 
 		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
 							   disp_info->intf_type,
-							   controller_id);
+							   dpu_enc->base.encoder_type,
+							   controller_id << 16
+							   | disp_info->stream_id);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);

-- 
2.34.1


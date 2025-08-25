Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C86B3434D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1575F10E4C8;
	Mon, 25 Aug 2025 14:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gK1o+SQW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D12010E4C8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8NHkR016949
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CZhkbXVUFYW+zS7ofmyWUZHIa7LAHJP5wKa7KCePTVk=; b=gK1o+SQW/eRGtNgY
 cwkKf9XmIqP7EbppONYLbQWhVZQVht1u4T6b2E0FoCAHfSioHSOmFel2bYHghHeR
 tJs+oWCCIZtLI3WX4ODvsHtDYxW+gVN6e9cxtgX+GKynywXqwnC4pKjHPA1oamWj
 lRc59/EwphrFpoZ8x2EImF2j/98E784J3XlDgkUpW8eMa4rWMlzgDk58pWy+yYDz
 n9Ve7JcqN7TmJypPM+Udu42kWKXml0LI05bdfhlVZmMRmWeU7WduRGabHp6vJuiz
 GM0d2qyXoQ5ox86rHAG/fqV0VUMKBeYICI4rbF0HQS6XyBC2V7Ze5i2y+e+wQMF4
 c5aj5w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpnf11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b49da7c3ff6so787790a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131572; x=1756736372;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZhkbXVUFYW+zS7ofmyWUZHIa7LAHJP5wKa7KCePTVk=;
 b=HG97v1g2bmEBzSmvZ2If+tu/VkCtelnd54gm86ygEFrhkTE02VMzf/GdiUJXeI5JYw
 NwHL/YK3Z+ABP31h54WN/Oscn6+3rfjeMiO6XsqUmdwbyNZjhFISMW2A52kyTvgsS1bl
 t5ruTNcFIGEUat/lUKcYOH4+FE0MYa8y6VI9x72mMMraJz858cF2DOzv+6iJevYPEtyu
 CqDeYxfbvHFi+qO35mEe/KxCR2b+lJh9jkMATjDcUHM/NcF6+NqGlc6Cw8eXhcyYc0Pa
 +0bvP5ZfdR53c9vJaTz6QK3efHpWTtzXkdX9a0dEpTb6jcKCUWYzcoXLtdGu3eDlC0EK
 Ztjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/4c28nYbl/l9W+DPXwA/8wmntrzLop+gC+7KvT89YFBwIdvyZRf93D88yO3nZOlP5h735nkmn+P4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl5/Kl3xkslSI+Ed/LDcGVtqj6rqhCqjgbA7GeBtbYoEmRwvMH
 Zu38vG3YDyRBBM8w3ZQk+QeYGfIrFm9Fo5CD7N1e8TPw8rimW1SBewz/EG5TWpBEmRLlzHlFgrb
 MceGGYmpbNKyK7cBGCxTrEer1aqu42j2JZdhaQ7920mQlyAoK3hwKD9NdfSWp9V/5SFuWd0U=
X-Gm-Gg: ASbGncvFYjRNCDIGTKHDbFR+jB+rBSUoY28L28+RHW3rUrc3KXzdVHKK840RpGqAWl2
 hmU8eXjpfmnzf9xqpauulcaXe2PHc+54cBzM1FChGzBTgG0NaSODkY4y6nRXJxN24m+SZGgut+f
 bnhjdK8n5w2Kz87j/dAKN8n5ashNL1Kc1Ml5JS9l96f+L9h0wZ7BQqRCs+AY5H9rHgcUKsUXFwE
 a5f/UBlkly/JKZepkCei5mdb+t3HZxmDUr5DlbRcMqKrHSV4ogUlDFcE6yLxUypGIBRkDqSPyWN
 weNN5obVK7gmqd2WMB2H39Yx9Bg7apkMk2znekOL8i/Lpd4P5hFdHoi3eTgdwB3PE5OinKg=
X-Received: by 2002:a05:6a20:7f85:b0:243:78a:826c with SMTP id
 adf61e73a8af0-24340dcbc72mr19416780637.50.1756131571701; 
 Mon, 25 Aug 2025 07:19:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXv8tBZVC2UoKGO1/3uUglh2y92Zp+Cdn0tJSLzTXFD9surn4Xq1HARP3M1DlH3qrJwl+SIg==
X-Received: by 2002:a05:6a20:7f85:b0:243:78a:826c with SMTP id
 adf61e73a8af0-24340dcbc72mr19416732637.50.1756131571237; 
 Mon, 25 Aug 2025 07:19:31 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:30 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:20 +0800
Subject: [PATCH v3 34/38] drm/msm: initialize DRM MST encoders for DP
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-34-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131424; l=4594;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=ZDHDyo+PGP0KVM/qc1FieiisvNG7qcmF8Qsrn9I5YcA=;
 b=IJWtywfKvZuE1pb21io/8fr6S2zZOE9lbHx1ilz2xgbyuxZb7lpvGT+BHkqz7UJ1bav+k/+rZ
 syLKbD/EHzaAl5ZUlJy8FdXAgX2dGnVSHJu+0l3FtCWMskX8WKDLSSo
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ac70f4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=z9hH63PmnJvNFBvS1J4A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -8qQg9eyjV2l-0bI-ijUYIk9l_T5LLWV
X-Proofpoint-ORIG-GUID: -8qQg9eyjV2l-0bI-ijUYIk9l_T5LLWV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX/cl7gCHjqRr2
 NYCBE+tRQ8cxXT1ObGJkh3naf8vSNuME88OZ/Dg3N7VPbDivkW1ciidAtTuDGeUT6dLL//GB//e
 6uADWqJlGB50dshoRWS28U9NIkEY6Rt7JWi3bJtIKLf1J7/bjq1YasLIyNXHTekMZsaM7AXatBB
 K5iiT74DmjlvD/safumPTbElK6OeTK9eEPxFl6ljckgB/JVPSI0K0tQz6ELJGemigWtqmLBd98F
 K2vVDnw8Hrbp9ERVsEGDclb+zVUG9NIhIgPt/O06e0fiIWG7F089jWKRl9Iv90JpKtTDlYc+bQM
 wIcTzn6Oxd1JM10P2q2x2qJ+AX6TGu3eju3tv92xPvqQn5lFM7A7z6EE/6aBJDeKpBzbhHcurja
 yY+bNzyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

Initialize a DPMST encoder for each  MST capable DP controller
and the number of encoders it supports depends on the number
of streams it supports.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 23 ++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_mst_drm.h         |  2 --
 drivers/gpu/drm/msm/msm_drv.h               | 13 +++++++++++++
 4 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index ca1ca2e51d7ead0eb34b27f3168e6bb06a71a11a..2eb4c39b111c1d8622e09e78ffafef017e28bbf6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -28,6 +28,7 @@
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
  * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
+ * @stream_id		stream id for which the interface needs to be acquired
  * @vsync_source:	Source of the TE signal for DSI CMD devices
  */
 struct msm_display_info {
@@ -35,6 +36,7 @@ struct msm_display_info {
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
+	int stream_id;
 	enum dpu_vsync_source vsync_source;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 12dcb32b472497f9e59619db4e810abfbf610c7c..0b9d9207f4f69e0d0725ff265c624828b5816a8b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -653,7 +653,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	struct msm_display_info info;
 	bool yuv_supported;
 	int rc;
-	int i;
+	int i, stream_id;
+	int stream_cnt;
 
 	for (i = 0; i < ARRAY_SIZE(priv->kms->dp); i++) {
 		if (!priv->kms->dp[i])
@@ -676,6 +677,26 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 			return rc;
 		}
+
+		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
+
+		if (stream_cnt > 1) {
+			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
+				info.stream_id = stream_id;
+				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
+				if (IS_ERR(encoder)) {
+					DPU_ERROR("encoder init failed for dp mst display\n");
+					return PTR_ERR(encoder);
+				}
+
+				rc = msm_dp_mst_drm_bridge_init(priv->kms->dp[i], encoder);
+				if (rc) {
+					DPU_ERROR("dp mst bridge %d init failed, %d\n",
+						  stream_id, rc);
+					continue;
+				}
+			}
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 8fe6cbbe741da4abb232256b3a15ba6b16ca4f3e..d73e3f908439094532e88945ed4d41ed092051c9 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -82,8 +82,6 @@ struct msm_dp_mst_connector {
 	struct msm_dp_panel *dp_panel;
 };
 
-int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
-
 int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
 
 void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 985db9febd98e35dfed51d39dac1a522abe5a351..3e64ec7b7dbe1d1107e85def9aa80277131f40bf 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -363,6 +363,9 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 
+int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
+int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
+
 #else
 static inline int __init msm_dp_register(void)
 {
@@ -379,6 +382,16 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
 	return -EINVAL;
 }
 
+static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
+static inline int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
+
 static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
 {
 }

-- 
2.34.1


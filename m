Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F15B3432F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A0910E261;
	Mon, 25 Aug 2025 14:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Np8PC2BL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1D310E4C9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:43 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PEB5Id017451
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I2yrIKVtSgCYOAK2wm3ompeqK3ltVqzQASfDY9soWxg=; b=Np8PC2BLCVYephNs
 qV4IlpbJc3c+dR2/fQEQZCPlWA7CaTOYoForXBC0Hu0I7Vzi/lgZ2vqplFic804N
 eFs/LLT8ziQLznkxnCTNGlv/6CWxSeVaJzbdULVet1ITrfSvAztzi6UZAlUyPnc/
 Nz5sckNlLn1cQ6lzH83QO11HLp9ifmuGhq8IjDk7lN5k4uN8ftbvEIx//GwUZCeT
 KuqgBdIz0jDCw2gg/HkzIK+JdRVrJm34AAVsvC6xTSZFHmjfQDaoLTSRYJc9Zihu
 hbbMGLce6rhyMW/O2qNgvKBHFDyCfuxLbKWVnoU86NXMCc4ZDsMSTyZLejUNvDsM
 SA3Y7A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpnes5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-771e1451631so1955398b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131522; x=1756736322;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2yrIKVtSgCYOAK2wm3ompeqK3ltVqzQASfDY9soWxg=;
 b=C6FUNtr5cRqN4NaTIbIOLxdqeY6taH4qTrJBJkLzlpmdnu/QTFY5Bqc1vLRcdD2CSr
 d7Rvx8831E9BBKwsXcjoGQhfKpSl5PWEQ7gsTFL1jB+nuDIwrupbf2MOVmt6jQ/YQWZD
 tGnqusjFhPmc5gSPYYXguZYpEt0vgklFhG9UJgWspkJWj/zRL5uxpzleu36KIn9Nw6GQ
 FCtLQHmVIexoxb+ldhkk1nao8hK3i/nOPKTDD7U4dxSZbEFvHlrmExM8ZmdbaAirMi3f
 Cl/5CyXfU3I/aT6PerApGa1bwXguYHwoEE37BYObDAkaPWaA6a3xK9NH5/Lxp5ojxhC0
 kuNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJSzoPg062xBw1QvwJyiDO2zh0hRAh4XPMawgRiqeP6/y7JiOKUXX2twWVMihJVVKANmSAJTHzSbo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykFq3eLIrXOGoQ4NQwtleij9sr+p5z9kNkOr05U6z0f9ye2IY9
 PWWDn2JdDadgv1frxsSIbVGVTdVf/bNvHCsmKAYlwuKfG4dwFq6puKRUrqWJBOCRjLBEFKjsHEY
 VGiB6RH9QzhuGMJi9Lc2F07sSxYwUBfEkZYdi0PqeNMh+uqMskxHbX/w7CaeTwr1IRQwqUcw=
X-Gm-Gg: ASbGncv7hD/zn3/j7AJDqiZJvi3NFr1oVTVu//qw0yq/unsEPLp7OJl7paXJfvI7SiG
 +2vu16s2lcFRyoKOneiX7gIFm912phdPZ6+GDesbu8iL0IKyZ5E4v/50fIInDsrNQ0IcG8HCtC6
 Kwt4RHCzuGnFv6297FuqpdNHmKRQTQm90GhUV3WbZJjvn3pX/dTx3NDGhR/9k64HIRErDydIckS
 sMlZr51McYg05nCUnUlKwr8b+STp7JMpM4xzIImm28chLTTt6HLgcwEbe5brUxHCh8FIbypNc9q
 RvXts5BNXnx1Tqso+hTN0qMsY8xa9OXNPXzMMsSu5p8SiAHCm8ax28EDF5M2Vb2mSbm7QnI=
X-Received: by 2002:a05:6a00:4601:b0:749:b41:2976 with SMTP id
 d2e1a72fcca58-7702fa09144mr15470409b3a.3.1756131521577; 
 Mon, 25 Aug 2025 07:18:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdSOkRTXVNCTQDFfDc5W6vzuFdTII0EdHm/SKbunuThNTE+6ampSQ99nwTQsw8BnknCh8P9Q==
X-Received: by 2002:a05:6a00:4601:b0:749:b41:2976 with SMTP id
 d2e1a72fcca58-7702fa09144mr15470371b3a.3.1756131521078; 
 Mon, 25 Aug 2025 07:18:41 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:40 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:08 +0800
Subject: [PATCH v3 22/38] drm/msm/dp: Always program MST_FIFO_CONSTANT_FILL
 for MST use cases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-22-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131422; l=2648;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=PrNjVGA2xHmx5gJIf7BbEQxTGZtpIGlEvLtwzJXOzsM=;
 b=plNGlZvN1wDw5lAaf+a7NON7sJMcGsC0y4yvNqCKHVHUDe4MumXutSydFBwEx12wozakyGBj4
 y65jmFlRYDOCnF6o4Dv23+z8iPBH/fRA0xjNqtFZmKHCOqIzLx0IAKC
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ac70c2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=HaeL3RsyjvW3zFWBFcMA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6YlvWk-67A5eZ6Kt6Qi-Xdj9cn2NDrQP
X-Proofpoint-ORIG-GUID: 6YlvWk-67A5eZ6Kt6Qi-Xdj9cn2NDrQP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX5KFPCb/UxKA2
 L7QgAmzocF/4vfiaQvZsKaZk8Om1MzSDjTmfhbrCKLBuvp/XJ3Rk5b2srHCVDifWbCJeuffeJR6
 0paKRA3BH48bWT2TOc4q66cYLtL9qeikKPYboDMFmpgvYF0KxbHXNuTEP0iMy3Fsk7RgKMiEJAF
 cIB50DN+4TydYgXihGJDyEAZnlKtwr4Si3OGyfI3gT7yKZAI4hUHHxG73qg3bWxppMLqT38bB7c
 gwsh73aVL4eyRsSodjEERdKKJsnuCRkC/oDmSOoqWci6vwNc+aoAs9BA0fm5BIEOYCp4+5+LdDQ
 oYl1zn9e4DWi+EwlmD8Y8/Hz0Fc6duuXDY0CzNZBIRUtb0JDWJrn1ZQdjyhvYBTuMkBaio0YROm
 vJLyFC8O
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

As per the hardware programming guide, MST_FIFO_CONSTANT_FILL must
always be programmed when operating in MST mode. This patch ensures
the register is configured accordingly.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c | 12 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 58e8c526253f77f306c669d474bdb2d1751b49a5..9f8733da78cea20593b4fd4d4a07583fd17d316b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -693,6 +693,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_config_misc1_misc0(ctrl, msm_dp_panel);
 
 	msm_dp_panel_timing_cfg(msm_dp_panel, ctrl->msm_dp_ctrl.wide_bus_en);
+
+	msm_dp_panel_mst_async_fifo(msm_dp_panel, ctrl->mst_active);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index f792687c315a2c8203305a20b7290a93b0d791f4..f58cf38a47a119790f86b40ee86d45a3ffbd951f 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -694,6 +694,18 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	return 0;
 }
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en)
+{
+	struct msm_dp_panel_private *panel;
+
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+
+	if (mst_en)
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x01);
+	else
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x00);
+}
+
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel)
 {
 	struct drm_display_mode *drm_mode;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index cb5bf6c99a6f7a68995f0f0ac48382dc90beca31..715ffc739ac4bec4d41bf4176a04d6651e81bbd4 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -74,6 +74,8 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);
 void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sdp *vsc_sdp);
 void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel);
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en);
+
 /**
  * is_link_rate_valid() - validates the link rate
  * @lane_rate: link rate requested by the sink

-- 
2.34.1


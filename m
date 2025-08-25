Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21787B3432E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FDE892ED;
	Mon, 25 Aug 2025 14:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCwYx+Mf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2065D10E261
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:41 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Pll2020583
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kuhCuvceT3eBUZZRoUj1Cw3I8qp6BdzHVaKzZZmWw2k=; b=BCwYx+MfjzN5j5XD
 UIx9+Rt8excXpF9pD7VrdHI5rvk5QXkgTN5XDRxlOgC9KBcIJewNtb3ewhjomSJX
 qGI0cTUEVBCfMElG4onIMoUEceD8jlbs1KiXDNqIjrobxy6jl6GoSjcw/OuhVUCT
 rxf8KrC0eRJHeU6VWsx+StfTFjQaDrnL2968NbMHA8ZICEf35KH5ZzS+cUltWLlb
 /ZR1uwVTX/hbQm2/i6GuqaWnkfyX/Gge57+y2FbTNtqkFM6OunU6TV9uSEF6hW4b
 X5LUG3KEwOUiRx9pODqlKNzP9tlHP3qvco3NYEAHFR/mY2QQj6G/BjdXj7CURFV4
 1dv6Gw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5d7ta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-771b23c0a6bso1835031b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131505; x=1756736305;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kuhCuvceT3eBUZZRoUj1Cw3I8qp6BdzHVaKzZZmWw2k=;
 b=j+vkapfRd0JLxLN/AacG+q78DFE2NDktkBJfBgl9qtxmBHyiEDyOS1iQ80ZDXeFrK5
 5aDNqWCZq3xfYDVULZUzJrvZHWlyc9wlKxVb739mWwPLbN7TakSaOQVrhNjZvfzLM/HK
 8N4IEYwx5FF5wjqkuP7jKqp/WqyfaQpuScn5cj3pWB3WOSRvo+dL1YozzI1e9LNkvZRX
 KEAthNw6OzpUb597tdaeQDnTqxGoPsQV6N6rHGdKPwJtDbV6zTdnX9GDilEwvVytzGuO
 TdJXlRqHHMmORsTpL8ocy5VHrlcNk2MMSSVrJNnEdaJU657R57AMAq5kO+1w2CPKcj2m
 e1/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgOm1AXTT+MBgV11/dJws+JUzVi/lpjaRrBXOLtkcCRaLTJ98ARguj6Tw/foN7HQDNMq9y/kdJ6zE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2+hkee/2yRN0TPvTOkztHJxT4sz2uhTF798d3467ddLU94ah6
 hiWE23K0Lt1kefLmNOYer43U86/6pAb7YncU+7N+GJEL6qFFjN9/pbusMCVKAN4OFb44vsWrAsX
 zFPgRo/QWw+hSlAj3XRn/8yfsAkNHCD4+r3HIbMy78EfF6FdAKJnGDmy0yRZJPQWGyqxzcKI=
X-Gm-Gg: ASbGncs6Ym3PleRDuMnIOAd14L7A0DacX34ALpMdS3j2B1E1njveC9yhuyJlYOBWxDK
 YEV9NTup17Va8vFFiYATI6suiVY0N1UCty8KwBBojNeuhA85g07i//qV3of3JxixD0W40jj91/u
 eqhgjk3lbJw482IQiwxEbJyrIpUuZmyrI9rrRYmxG82G5dMgrwgaNwM5czFG8lKOw8lPXWLWO5s
 b8aPuNi3wLibvlJMuQfEkNHOQ3wPa0mF4uXMes8nPsBn1IsQx+hfrDHDYhUB8y1CmX/KQT0/rhr
 RUl5Jp0hCEJWG4fxZvTqwZ147hcdtMqr9TrFvgdxxMXdF6W9i8BKCfOTQM2BMO9cRHYotnc=
X-Received: by 2002:a05:6a00:4601:b0:749:b41:2976 with SMTP id
 d2e1a72fcca58-7702fa09144mr15469477b3a.3.1756131504704; 
 Mon, 25 Aug 2025 07:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuyDMxEaj9hDf69kGJI/QXSxzc8wFRyqVUbHdT3W2rALNv1ZU3Zrh52CK35M7QFmouPkuDEg==
X-Received: by 2002:a05:6a00:4601:b0:749:b41:2976 with SMTP id
 d2e1a72fcca58-7702fa09144mr15469449b3a.3.1756131504198; 
 Mon, 25 Aug 2025 07:18:24 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:23 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:04 +0800
Subject: [PATCH v3 18/38] drm/msm/dp: Add support to enable MST in mainlink
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-18-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131421; l=2479;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=UgwUqVKQaiarblhKv5Vuldkk6W6tuFzzpm5QCSz9nNY=;
 b=8DFs8ZRIVpVv1RtAu9MVTMPn/Da8N8A3WndZ6AS5sI3ksGWJ6VP1jcWx8ja0GYtxcomfrqCUh
 tE3btu75o5UCx9G2f58LThPebkL58kLIDlLOrpqeb031npkDVpEMGiH
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXxGcYOQSp7BDd
 +FR/iEydC/wusBbz5CkPVlOV06xcHV4rAwhvO45e36x9NU3CAKIxCUdLb9cow17uWrgivtRYiDu
 3R6ZFecbrF8jNpKQDF/OKRa5NEL5HS4htC8cxOH36v8HNHeE19xdZc0J3PJjDpWnsg9SNfFBASg
 0dzki2WXb9+BiQ9uUGW10SifRwCE22oi03ZUb9VwHkV9FMPPsZK8lkrpG14973YJTu7m72mrHJw
 pLICUr/GbIk4jt7DU0+iHBno1uy0oLmZz0cmHHJEYQy1/siDZdY/aQ1uUJ3SXUyoHYCwdCIi3GB
 EF2VAP85ao8bHDpwdc6iMqbUHXX5/wwnxKIDBNI0tNtb69WJU3/j8XmRirz6fbTrjHQ2d39B3OQ
 c5PTJvfG
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac70bf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=GJT6Fafo9oTAj6z5dyEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7I8lBwybJVae8uj5q8NoBbTSbkbPRuml
X-Proofpoint-ORIG-GUID: 7I8lBwybJVae8uj5q8NoBbTSbkbPRuml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
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

Add support to program the MST enable bit in the mainlink control
register when an MST session is active or being disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_reg.h  |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 16e5ed58e791971d5dca3077cbb77bfcc186505a..d562377a8d2846099bf0f8757128978a162745c3 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -254,6 +254,19 @@ void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
 	return;
 }
 
+static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable)
+{
+	u32 mainlink_ctrl;
+
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
+	if (enable)
+		mainlink_ctrl |= DP_MAINLINK_CTRL_MST_EN;
+	else
+		mainlink_ctrl &= ~DP_MAINLINK_CTRL_MST_EN;
+
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2656,6 +2669,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
 
+	if (ctrl->mst_active)
+		msm_dp_ctrl_mst_config(ctrl, true);
+
 	if (msm_dp_panel->stream_id == DP_STREAM_0)
 		msm_dp_ctrl_config_ctrl_link(ctrl);
 
@@ -2711,6 +2727,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy = ctrl->phy;
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
+	msm_dp_ctrl_mst_config(ctrl, false);
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index de3d0b8b52c269fd7575edf3f4096a4284ad0b8d..fda847b33f8d0d6ec4d2589586b5a3d6c9b1ccf3 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -128,6 +128,7 @@
 #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
 #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
+#define DP_MAINLINK_CTRL_MST_EN			(0x04000100)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)

-- 
2.34.1


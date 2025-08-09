Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26F8B1F180
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BB410E991;
	Sat,  9 Aug 2025 00:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNdW/BzJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E5E10E991
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:42 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578EAotH012936
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mAlKuYMUBKfxakMSfWgLZizUCrxLq9eDwfE1oN2ywF8=; b=ZNdW/BzJWHMxNjgH
 cG/ZwRGbA06QQXSnIHYaPDXnBuLcIGCC/j0+LeXehIVwGNmRbixdyFc1dnJWgBwj
 k+q++S2Di/I4/RB8I0JBdXwDb2ooIb0ugDQSxLGHNfkV3SLYPdo1keEvEmv8+gqp
 IOVO4MjH9stCisBV14zqlrYuGLK+Q6NAG+8jJ0IjH/yfleFjMHz0dVXmWZ1rzV/b
 i8nSqKUR8pHTuUfGLVHoVCwWCGEqawKIEr3YXL4KrBSFyFAq48NsW7zW/6rHnapB
 mfN+agJm09oJNGdemwG/Bd6NkOzWU4rqCrYRWnhRJBB6MejkRmjVVZyiuJ7tsbFf
 vEObxw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybkm5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b42bcfe9c89so2098899a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699740; x=1755304540;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mAlKuYMUBKfxakMSfWgLZizUCrxLq9eDwfE1oN2ywF8=;
 b=qNknPKsciSIxvpN5D6tAbj35ANUFAmxNvU0DoX/xwVVhNnyBXItnFQSNuMOxUIS4wy
 pFzNYBAEgWicVdr1+RBpnWY918sP9rUjZuJqDsspMVsC8QDS+uwx4CmUVPrHHJErykOc
 W6syTH6GuKWR4Y5WWAl58w/t6RYaDgc+sH4wIqciojE9xzsJUCVoiSXnZ2Aofoey69G9
 +73Hp9th2NoOlwo1GsZJdBrmyq9IHTG70r08FM1xDGqAWc9nG3p+2utYGeW07Qa8MUX+
 DfA2FxH5WM8zKSWBGylIAOYKykKc3SIxR3wPkiv2GX7do3mcC0iqNnDw+eR2pe96NhUD
 7wfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrfyyqSyZIJ46yPeCBOkQPLn0TfVWo+3QzFPbKdUddaVpscgTHwFamCIP+EySZ+Dozx9hyfCneHW0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDws0CqqVxS+14ZhC4m7dk73s6KZoja2otI9qoNkfzc/EgIbxt
 ORi53j2OMLsBl+YmcyGaCZd+rhpf9dEixuPgF5vZQpdwNhimJeKJW7Sy3lTb1Y18/f4vhGHmyhg
 kwC2fKiPn6ikrdUeWkOI+oRfrI4dczNbKZUqu2arVGZNmgJ3thLssAcWSuRGNOoLwvESod5w=
X-Gm-Gg: ASbGnctnc4C2N9kezvO8u59ho5Bo/vErJbkvxIku6aViR1joV+XAIhDzomo33qanZns
 EzaRJ6XgoK3AfC8IKBnHINKeSvW4PT1egjiUzKIDTZQxU8Ndd8Nafo4TXjQtlUEfRlvfIHQERo5
 bh9IafW45HXL6LOtoBQGpT3R/0vtQOS4fquMOLIDkRBudBVDif1F6VKWG19qMiqYxUR2uJqRyVT
 SDcw1XRM2airue71cINWZWNj/BE4tBUEcz+dJ3ujj0I6xcslwMLkF7YkNWNWDk0LMOFuwhALVhZ
 nboXWiyN1GtEoYeRqRiKCb9pHgrPypEHj+t2lZ76gcUR6TtmI7HM5PTfPDKx8wNEFLLzUgbutIg
 us4bfJ51jk6RUJ1u07D+WzC5E
X-Received: by 2002:a17:902:e74e:b0:240:8369:9b9d with SMTP id
 d9443c01a7336-242c1fdc961mr74137215ad.9.1754699739973; 
 Fri, 08 Aug 2025 17:35:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGriD7dy6Sg8oPpjahvuVk0KyIUeYorIx0HoQ8CSaI46CMni9HLIVrzkTQsXSQEyGkXQKkBHg==
X-Received: by 2002:a17:902:e74e:b0:240:8369:9b9d with SMTP id
 d9443c01a7336-242c1fdc961mr74136965ad.9.1754699739564; 
 Fri, 08 Aug 2025 17:35:39 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:39 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:15 -0700
Subject: [PATCH v2 03/12] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-3-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=4040;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=50USIutSA8njn6IYfRQMWxI5xMJaaBqIOw1Eii1PLhU=;
 b=4j7gDk8sNyixD1Hl/kxqP3JU//WBcuVk/VfmANElISz56rT9N0jAEtgKqEEI77CpPxspmj01L
 p5RwZK7dmsCDdUMwXe3SIjIcMUnqq9RNArmVeW/oEtPcNcx4FcxOay2
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXwrkJEGYsi4gK
 F0nhnUVxbZcTNm4xqvW1lQST4ftVWOhnlP7eIOd9nvMLgF3XliW5w9LVt+ofG8MsAebt+KcZG1q
 MrWIkUW7+B0VdCg/1bKOC99GdVkVHXtF/008co3wg3a3/Fsx8rEWjQR4IsEEkfeq7D+rpjfONKJ
 u4XZ9KiaTd7EziTm8jfbg6tWiYZ9rwRnizcmUTO3aZJC3nYFegIUf9xdzmc+XOLLIfxOBIAaSDZ
 oOIU55wGcAa8KoILO6fCSeB486Ifm7b+oQyWYbPTH8K62NgLQeuy14CJr5IW7iY2m5GBEtWTQvz
 ajoQQNI+Yj8Zv1sVEAqgfPWp3wOTpm0n90kYhFAgpfMsCtllMpGYg5CEyhTc2IjuP1/VR8SXP3M
 quwP48KR
X-Proofpoint-GUID: MzFjG-eRbXtDcXKY2mHSqp6VWO1yBG95
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=689697dd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=7iSa1Ozp54svVWoPkB8A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: MzFjG-eRbXtDcXKY2mHSqp6VWO1yBG95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

Instead of relying on the link_ready flag to specify if DP is connected,
read the DPCD bits and get the sink count to accurately detect if DP is
connected.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 54 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 18 -------------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  1 +
 3 files changed, 55 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bfcb39ff89e0..e2556de99894 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1142,6 +1142,60 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
 	return 0;
 }
 
+/**
+ * msm_dp_bridge_detect - callback to determine if connector is connected
+ * @bridge: Pointer to drm bridge structure
+ * Returns: Bridge's 'is connected' status
+ */
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
+{
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct msm_dp_display_private *priv;
+	int ret = 0, sink_count = 0;
+	int status = connector_status_disconnected;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+
+	dp = to_dp_bridge(bridge)->msm_dp_display;
+
+	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+
+	if (!dp->link_ready)
+		return status;
+
+	msm_dp_aux_enable_xfers(priv->aux, true);
+
+	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
+	if (ret) {
+		DRM_ERROR("failed to pm_runtime_resume\n");
+		msm_dp_aux_enable_xfers(priv->aux, false);
+		return status;
+	}
+
+	ret = msm_dp_aux_is_link_connected(priv->aux);
+	if (dp->internal_hpd && !ret)
+		goto end;
+
+	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
+	if (ret)
+		goto end;
+
+	sink_count = drm_dp_read_sink_count(priv->aux);
+
+	drm_dbg_dp(dp->drm_dev, "is_branch = %s, sink_count = %d\n",
+		   str_true_false(drm_dp_is_branch(dpcd)),
+		   sink_count);
+
+	if (drm_dp_is_branch(dpcd) && sink_count == 0)
+		status = connector_status_disconnected;
+	else
+		status = connector_status_connected;
+
+end:
+	pm_runtime_put_sync(&dp->pdev->dev);
+	return status;
+}
+
 static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 {
 	struct msm_dp_display_private *dp = dev_id;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index f222d7ccaa88..e4622c85fb66 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -15,24 +15,6 @@
 #include "dp_audio.h"
 #include "dp_drm.h"
 
-/**
- * msm_dp_bridge_detect - callback to determine if connector is connected
- * @bridge: Pointer to drm bridge structure
- * Returns: Bridge's 'is connected' status
- */
-static enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
-{
-	struct msm_dp *dp;
-
-	dp = to_dp_bridge(bridge)->msm_dp_display;
-
-	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
-		str_true_false(dp->link_ready));
-
-	return (dp->link_ready) ? connector_status_connected :
-					connector_status_disconnected;
-}
-
 static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
 			    struct drm_bridge_state *bridge_state,
 			    struct drm_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index d8c9b905f8bf..0f0d4bacb194 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -25,6 +25,7 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		   struct drm_encoder *encoder,
 		   bool yuv_supported);
 
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge);
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_state *state);
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,

-- 
2.50.1


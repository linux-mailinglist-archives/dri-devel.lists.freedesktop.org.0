Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC55CD22D08
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F1C10E6C9;
	Thu, 15 Jan 2026 07:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QChqDDhQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LpyE+Zml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE9010E6C4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:19 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fqVc1745019
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SKcwhb+xWTwW8lIkUoC+RbFacXz+V1PCsboLX21gXQg=; b=QChqDDhQ+ZNKSQ2t
 6udelvrDHnhlqimBU5vWWtvyf3amZGORYl/j2Q/q4I8DPn6QV2BvR+c0QJ8f+xl+
 V+tqumiqLbzUF0EuYX2c9v/0+V75JXOvILK7PrHfIryNgNNJxylejL+WIxNK3c8c
 eIUTJEAvKgRPF8PRrBRKijr779OtcnvK1aEGho//BLHJpy9h5U/PIb+AgpR4rrsj
 v/k2N23VVMu0iEzdZVpNo0/N3QCdxiCpS9Q0sp+1uWrgLZhOay6X2kXaXGfVQsGb
 ye7jh9hTHvBeTpAlAKC4cT46SlsY66U1ZjoUt84N303/t58ymB5eOzwV2gUyPGGD
 VG0zKQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2g68x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c52af6855fso78896085a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 23:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768462158; x=1769066958;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SKcwhb+xWTwW8lIkUoC+RbFacXz+V1PCsboLX21gXQg=;
 b=LpyE+ZmlQZ8yX6MV5QKPUhPSnZDzuy0QXtAkQCQCYCuheW1O5cilPvNn7qT5gFB9jh
 s/6NLz+kFwgilmgf2VEeiuIsZpsUPRXk8rjhrSmMK5QpeKWGtq1ZyDxORj1so+KfKNBG
 IysuFYAekv7hXm4QY8nUZvOXG/qic0Ih8vr5jWZxQOMbS0yUq0Gm+o+ix+JOy58lPGDF
 vTGJPdwr/47cCegcDtIBRfIrciRCs9LXwqT/xYth2gJwPeQY/pQUnQSQGe7HxxRf7MxX
 /vHmoPkgkFs/YCHw8wJLF/H8PQOG3QMwV2g53ps9YBoS8kOR1tI0NCviuUzDr90My/TA
 aEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768462158; x=1769066958;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SKcwhb+xWTwW8lIkUoC+RbFacXz+V1PCsboLX21gXQg=;
 b=QoSNXSC1HC9CnfzpfjxWG5ezEbXlZqqhx36RXjS1w/YrVQoDeaYVAStRVy37OTxcpa
 9NWcRcisPDck4HFTOayhSi0AGbPAax4DMOuMkQxyRhdaSjrKlSLYzRipF+vdOpDvmxjw
 rlXAsKU7T2PDO2Hb5Wp4rT8NkXO/xFf7lM8LZssdiNOkFHW9Pld8lhuevaVlLi9G8UtG
 W15Wq4yq75QPwGL5jSO01kU3lA/vpNk9Y8g729k+jj5uq63ogHK1QoJBEz4EHr/2bQC9
 JzjCDHl5edAecs8CUElvft9cYo+w92ZstAJPXWCmCYGwc+5yVmKqy1GWJyv62PYebsrW
 GKDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGufvKvOoN9Fb27G2ISGCHDBHxhaDzqFxgIfTzF0T8pvEf6BUI9vsO45uQB0picqNhFt8QVVtmdTU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyvj8+4bI0ptwRbBl/Wo9uuLyFPlt6mU+ipIDnWbprbcC8m2gBs
 F83SQj4O5ooOejsm7+PCkbQ6+mxu12cv0eYVeM7CCvWUX7sU5Tff4eDP8tkYwa/hCSp/r7hDDMu
 COlOOuNWHqFbWQOBhb8qVUWK2p0NbGs0C8cGUy4HNPFtx3teF+bJFmQ6hAP6t0cRQrX9fH9c=
X-Gm-Gg: AY/fxX7E+eiG0jmJ3Xk02di8Y7SzZdi5Nc/xK8lkmkYiBjizp2OXnM8hrGllH14dlTP
 vtae0z0O6VZWU0PRXYWInAwTcv2ervlqHau9IqYhiPM+FI1ZIDyRtUuxgQWzLL87CixOIUs0goo
 Gku3ZMnQGPB9m5LMPPYXbDZv8MPaqXNNsGwmV4L9Uel3PsGQG5ZFjVfzuk7M5E8Xc5OhNyUax9+
 JhI6/2bpYtM1GrvAPgb2Xd6fTYI7XJWvGui0RlOO1Yr0NnDUe48ri2jdKCCxz61DfYnPzeantDi
 Lz99fAjVZwlNFCr5KJrXgPQQTewjVQawvF9Gfshar+ybYOW59GGLTF/qA3dXFsjlnZxJBPO/ykE
 Fm6gyE3UJsl/y+BUOajRcQ9HVxrEDWVVy8ShmIYJGWbpuPZY0BxTBwKmF0TvvQvfnOlEcWwPAIJ
 ipf8sCDe9cB8crSf4rt6yKmoY=
X-Received: by 2002:a05:620a:1aa0:b0:8c5:391f:1dc8 with SMTP id
 af79cd13be357-8c5391f20c9mr360109985a.8.1768462157961; 
 Wed, 14 Jan 2026 23:29:17 -0800 (PST)
X-Received: by 2002:a05:620a:1aa0:b0:8c5:391f:1dc8 with SMTP id
 af79cd13be357-8c5391f20c9mr360107185a.8.1768462157456; 
 Wed, 14 Jan 2026 23:29:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 23:29:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:08 +0200
Subject: [PATCH v3 3/8] drm/msm/dp: Read DPCD and sink count in bridge detect()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4422;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fflo70A3oSMP6LkHXNPuDEYg6XV8ot0GBkcmgzq2Sd4=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGlol0OivLl6on31pVXR7v4POr3PP4wwtB7kPm4JaLlWM899d
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpaJdDAAoJEIs8ij4CKSjVAv8H/RxK
 4vcM55F3t2HfQGy/N9jSrzxJoUl2O/G09gBg5g/vA77U5dkM30CVBMwMdMrDhVJ4XE7Lrm4nHm1
 WOS6FAL+uJ9sgIIGruel9b2rVZAFd5xP4Pu0obH9qT4r7bBVIIwaZPeC2H4If3AQjvk1tuibe3i
 qA80BEyM2GpVKZlEjH5lboDiXVADopIFcJXmSJSmcwdOFCHto2CdoATvmNwsGe/YhyAMrdSGh/5
 zGFuSE31wBa/3MiMbjLO/QEpOWrvassaGnhYYPciDu3hNz7B9LL1PStJpvapQacW7TO6FCTd5Fm
 1S3hZzUL5iTkrNOMfaygYTc5ykwuwrRJAO7nPQQ=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfXxVyjfZ810Epe
 O0TaPen0autqBdxeWHer7GCnkynXMYmLAfc8vqeD1uKvW2v0Zh5RC1SRu20lxytzgQiiLSIS+KB
 XOJGVZnZtPpCixIQcXFsY15OQLb6VL1Ka2belZ3O+nly9i0QVquLN6s2knAL9PVR40Ani/5NGMt
 xSyvIC6UAZI/FutzrN2RopKZBJNCUyq6D7teOCW0Yb0V94qevHPXpzk2NdRKYvBLsam2dgMUcaJ
 g04lRFoElh7cqtjBhSLeEZdojG60GW6tWaEdWv5JouFaUzLbYkfSMDLWXXdzo/wKElaOW0Sj3mL
 FGKmOw3S5JjxV+rBV5hRmwjRUWuKc77VvjHrdlNl0jhMlhrehSf5MmV0CjRk9A0RGOf+1FvsXi7
 zjOCGj4SKaOMYfNxlCnxfFUuq5/CrmVvGpUyqoLYb337kDq3YliwqRZZuOYGbQCDY0zG17QShAr
 BJ1CF4cedc/HGo+GnGw==
X-Proofpoint-ORIG-GUID: gvrF3N-aj8Fwv2PK-t57QFVn7GLJ-PZH
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=6968974e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jcEwYMPARZwhhGfK5pwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: gvrF3N-aj8Fwv2PK-t57QFVn7GLJ-PZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150049
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

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Instead of relying on the link_ready flag to specify if DP is connected,
read the DPCD bits and get the sink count to accurately detect if DP is
connected.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
 3 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5997cd28ba11..a05144de3b93 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
 	return 0;
 }
 
+/**
+ * msm_dp_bridge_detect - callback to determine if connector is connected
+ * @bridge: Pointer to drm bridge structure
+ * @connector: Pointer to drm connector structure
+ * Returns: Bridge's 'is connected' status
+ */
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
+					       struct drm_connector *connector)
+{
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct msm_dp_display_private *priv;
+	int ret = 0;
+	int status = connector_status_disconnected;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	struct drm_dp_desc desc;
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
+	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
+	if (ret)
+		goto end;
+
+	status = connector_status_connected;
+	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
+		int sink_count = drm_dp_read_sink_count(priv->aux);
+
+		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
+
+		if (sink_count <= 0)
+			status = connector_status_disconnected;
+	}
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
index fd6443d2b6ce..e4622c85fb66 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -15,26 +15,6 @@
 #include "dp_audio.h"
 #include "dp_drm.h"
 
-/**
- * msm_dp_bridge_detect - callback to determine if connector is connected
- * @bridge: Pointer to drm bridge structure
- * @connector: Pointer to drm connector structure
- * Returns: Bridge's 'is connected' status
- */
-static enum drm_connector_status
-msm_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
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
index 9eb3431dd93a..6c0426803d78 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -25,6 +25,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		   struct drm_encoder *encoder,
 		   bool yuv_supported);
 
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
+					       struct drm_connector *connector);
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_state *state);
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,

-- 
2.47.3


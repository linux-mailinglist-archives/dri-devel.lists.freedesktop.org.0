Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88FFD22D32
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76CD10E6D4;
	Thu, 15 Jan 2026 07:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nfsBUHc1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYfvjE6b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C1C10E6C2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:29 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fxxv1991699
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bfp/Kt52/HQb5Zs4SCmnXul2ftTp5Gedk1eZEPJTaac=; b=nfsBUHc1GMRuqMMx
 01qbr90cO3DuWzVLdQTM5stfEIOtNn1UQhC4VoMkJn9CTgWQ2INAgnJ8fhfAIv/V
 JciEbL6HhxrckCOrXUrKICf3ZCgCCMKtTKvukt0S2ArFxgACcrsvqdk7Y5eM4UdM
 icyD1IZlQaP/hfQaG0PZU9QaBs5Df7K/WgpyIDlGKEl9x9h5dBB697LNZ9INSKSy
 tgaZI6cDUH4QC1fCf6WYe8EHVYo32O3BfveRBraSIKxGQZxzESXp630nAkB6Otd6
 qO0ftI7hPXnz8BQ8/pnqF9NF5e1Qlb8+MUQU3Ryi0X8ODMMf6sQI6SuwHFXxlBls
 YD+XxA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbu1ds-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c530da0691so150422885a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 23:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768462168; x=1769066968;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bfp/Kt52/HQb5Zs4SCmnXul2ftTp5Gedk1eZEPJTaac=;
 b=VYfvjE6b37IyH0ugjcoY/qcnAvZ0sxtGV/11v457tw5V/LLWEjxey6z/CVQWbP7OP5
 3xS1zg+Z9Cr84n3hxjDq1dyrwjnYggcYUiLo37NWD30LN0OIP9FvCyYN/IcPrxEznJ48
 VoDidKwSzSczKkVhvTIfdg9Bk/5a7L8ptXqIXR2RFziNI2UW0lN0HQmBykm1m6zvBjPx
 i6LbgbuaZRb/KFykIDjX806cwIDoHY7ot1oY+apH08w9lVxdXzkZMDOrUrgoPCStqtNH
 SbLUqpAVZH6GHdW9hN2NViuyimAuIeEYQ5VImwG8hXuw5yzl5CxgSdpkrrppffu27zsh
 CfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768462168; x=1769066968;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bfp/Kt52/HQb5Zs4SCmnXul2ftTp5Gedk1eZEPJTaac=;
 b=lvEpHkqMOsMEktjL4CYC3gXEjwSAtZ/xIpx7ySfSvB7eejgy+H9uJvgYznk/c/73Tj
 Oiowm454PtuRa6a84OrRHSwMlRLYl5Zbvo6+fU1zB+v9KMIa/JIGvyOzwhDbMT848R3/
 oagRO5R3effHw22SHUnoQd45hTSyjZMsCMXcyO7HQj4goag9yvDsibdHz3gCeCAyzGm3
 UDXsZmmmJc+xlr7Fy1ut3iJDu5+OsqD6OzWWxznmS9Sh/ITsVrVVDBdD/dDTwd93hmIG
 wQEEMfKyJugbC2qRtaKRfVO0HgPiE01MFWAq+ZNFK1ICFNfYSAoWsM8iN3EYrGOQzFHr
 XWUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEWlQfpkuufwjvPBvGxSK9J/LDgBbQWpnIUBEaFtwYXMvGjqhbs1GhnfHBODuzjnPhE6NidVa0f4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOBCC0Kjf6lMeI7RKz59BkMyNpfNV1yjf500sxyVeDWQFYO4Hn
 cbyJCmXcQlTLfzPsNry60D2Buq1pZDvtChhk2/XvdBmx1MQBWk3aluQ4uJacHG4xXZ+LDUkyPmG
 448aV84WcDsT5nitjFmjUDxitjt/bUwmtW30BNmErSgm6Dk22qIDnwkF9rFif1/7jEyn4Z4k=
X-Gm-Gg: AY/fxX79gPinPf9qvqysXCm7N4dqqe+UBgc1FZVxS/fy7Eophw7fhDLr60yPZF2V0S0
 nPWr+Uz+HKh2TC9rjFduEwIZ30BnoSOxQlwRHT/c4CxBRHao21iKgT2apyVCfyd4F4FeppTx63N
 gzS60eda8ds/EHj3nQ0POTJ3WcrB2GVgAfK3a/dotXBXxO28GmuNjy14NMxTzjQCFnC3GDeXHL8
 9bW+iyFS0ZLOcQLqyE58n1INHJ3FWKIn8pdP/4a3JOjcPXM/TifgLT1/Qfdi/YWUX7uQzZqmsp4
 yV2DoqycBcx4vlwCbOcaz0b+/4f1NfYe9CwMLjrTYJduvCE9PpoiqGloaJvN1xSJP9vJOXqD9Te
 4/gjUKKeDjISU2qei/lsx+oRE0y6oXyAsAoxwzF4dBLmoL/r/a6rk32pLmOYxEJkjyNJIetNuys
 1hq4i08wCamJNRL0Ahm2285js=
X-Received: by 2002:a05:620a:29cc:b0:8b2:e1fa:6eab with SMTP id
 af79cd13be357-8c52fbb918bmr709830685a.62.1768462167703; 
 Wed, 14 Jan 2026 23:29:27 -0800 (PST)
X-Received: by 2002:a05:620a:29cc:b0:8b2:e1fa:6eab with SMTP id
 af79cd13be357-8c52fbb918bmr709828785a.62.1768462167008; 
 Wed, 14 Jan 2026 23:29:27 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 23:29:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:12 +0200
Subject: [PATCH v3 7/8] drm/msm/dp: rework HPD handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-7-08e2f3bcd2e0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=32989;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iUAY2l2ZhRty3P8sYwHAOBfac5Eksx59rD+0udJlh3k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaJdEIaPP2YU80aMME2QBXGiWdnSkw8J/MUt+N
 jfFkVJbqdyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWiXRAAKCRCLPIo+Aiko
 1Qa2B/9T4mLlkPZtsm6XU9C30MC0XUqY+eEhKOR9RTnaw1l0H7HNxzAmBj4sNCK4UXcVyy6hbmj
 fmQKMpAcMAH2ThR87EXggr4k2Bu5UIYQOxJ69PtbZYpSmnRbq5HRD1cW1HPpGORcteqeBuygvTS
 LYiVndTLrZ4RaY85kJRC3lyeY3jBS/cI+MCaoDbppbNtB7Z6TxAOZNdrliX6fxn3Y28CZhGtlNa
 sFvN3tPDv5C2lgecvNUAFN0QUuzoISAs2fVbmCZ1kUfUzpgV69cSAZ0SowXaaDdQEpOwKRaMmlI
 PIQflArvSNHc7CLF5efe9lQReP956xEXU2emiv/hXpu1ivE3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=69689759 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKU_MhpSG83TwyDdul0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: MxuFfrj7WzsYS_ovUH-Q0kK95u1FnqGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfX1CWNycEuwu9g
 fXPHLLfsjTLXm6KfxSoFAioKvvCOVVehcSl1ryqwRLgGPgfOUFFmwSMizQP6y8vn90mLFaYA6BA
 ip1Oj1ykpyi9Y4MXl4XR/Aa+kcs4pZ24yOnfh/7XvZn+iG8pe3HTJhDsw8NxAV3LpX7qot/Vwgl
 GGB2jMKIN/zwWLNiOnD2aM8rKWjsU2ghTd7XuJWaq1gK3uMP88dXT4m9ho/96467fhcAbswvTf+
 qkwWyz6Z+A1ifVm3taVgNZlpYhgo+vfok5ILCkTiiN5p7z9dtfhbEUsdR3fwaDtUDKEnD07yCmX
 j1JdIrrlP2+nZ3cDb4FhinEUmnj4Yb7CzkqBeHMhANvtfx4KYP4y20bORa5L0GrDKH3CECN/8TA
 RqPqiWijtmpXBlgm0USy/MIHaR2Uie6/YnTmVGwn53PZqPgMMiX2yijSHueOt5qdDKon7l5dkXR
 11D02dGv4uTkUF84gWw==
X-Proofpoint-GUID: MxuFfrj7WzsYS_ovUH-Q0kK95u1FnqGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
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

Handling of the HPD events in the MSM DP driver is plagued with lots of
problems. It tries to work aside of the main DRM framework, handling the
HPD signals on its own. There are two separate paths, one for the HPD
signals coming from the DP HPD pin and another path for signals coming
from outside (e.g. from the Type-C AltMode). It lies about the connected
state, returning the link established state instead. It is not easy to
understand or modify it. Having a separate event machine doesn't add
extra clarity.

Drop the whole event machine. When the DP receives a HPD event, send it
to the DRM core. Then handle the events in the hpd_notify callback,
unifying paths for HPD signals.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 --
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 625 +++++++++---------------------------
 drivers/gpu/drm/msm/dp/dp_display.h |   1 -
 4 files changed, 148 insertions(+), 501 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index aa2303d0e148..80796dd255fc 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2581,28 +2581,6 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 			phy, phy->init_count, phy->power_count);
 }
 
-void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
-{
-	struct msm_dp_ctrl_private *ctrl;
-	struct phy *phy;
-
-	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	phy = ctrl->phy;
-
-	msm_dp_ctrl_mainlink_disable(ctrl);
-
-	dev_pm_opp_set_rate(ctrl->dev, 0);
-	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
-
-	DRM_DEBUG_DP("Before, phy=%p init_count=%d power_on=%d\n",
-		phy, phy->init_count, phy->power_count);
-
-	phy_power_off(phy);
-
-	DRM_DEBUG_DP("After, phy=%p init_count=%d power_on=%d\n",
-		phy, phy->init_count, phy->power_count);
-}
-
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 124b9b21bb7f..f68bee62713f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,6 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
-void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e93de362dd39..b26fba89e73a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -43,35 +43,6 @@ enum {
 	ISR_HPD_REPLUG_COUNT,
 };
 
-/* event thread connection state */
-enum {
-	ST_DISCONNECTED,
-	ST_MAINLINK_READY,
-	ST_CONNECTED,
-	ST_DISCONNECT_PENDING,
-	ST_DISPLAY_OFF,
-};
-
-enum {
-	EV_NO_EVENT,
-	/* hpd events */
-	EV_HPD_PLUG_INT,
-	EV_IRQ_HPD_INT,
-	EV_HPD_UNPLUG_INT,
-};
-
-#define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
-#define DP_EVENT_Q_MAX	8
-
-#define DP_TIMEOUT_NONE		0
-
-#define WAIT_FOR_RESUME_TIMEOUT_JIFFIES (HZ / 2)
-
-struct msm_dp_event {
-	u32 event_id;
-	u32 delay;
-};
-
 struct msm_dp_display_private {
 	int irq;
 
@@ -95,15 +66,9 @@ struct msm_dp_display_private {
 	/* wait for audio signaling */
 	struct completion audio_comp;
 
-	/* event related only access by event thread */
-	struct mutex event_mutex;
-	wait_queue_head_t event_q;
-	u32 hpd_state;
-	u32 event_pndx;
-	u32 event_gndx;
-	struct task_struct *ev_tsk;
-	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
-	spinlock_t event_lock;
+	/* HPD IRQ handling */
+	spinlock_t irq_thread_lock;
+	u32 hpd_isr_status;
 
 	bool wide_bus_supported;
 
@@ -216,59 +181,6 @@ static struct msm_dp_display_private *dev_get_dp_display_private(struct device *
 	return container_of(dp, struct msm_dp_display_private, msm_dp_display);
 }
 
-static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 event,
-			    u32 delay)
-{
-	unsigned long flag;
-	struct msm_dp_event *todo;
-	int pndx;
-
-	spin_lock_irqsave(&msm_dp_priv->event_lock, flag);
-	pndx = msm_dp_priv->event_pndx + 1;
-	pndx %= DP_EVENT_Q_MAX;
-	if (pndx == msm_dp_priv->event_gndx) {
-		pr_err("event_q is full: pndx=%d gndx=%d\n",
-			msm_dp_priv->event_pndx, msm_dp_priv->event_gndx);
-		spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
-		return -EPERM;
-	}
-	todo = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
-	msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
-	todo->event_id = event;
-	todo->delay = delay;
-	wake_up(&msm_dp_priv->event_q);
-	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
-
-	return 0;
-}
-
-static int msm_dp_del_event(struct msm_dp_display_private *msm_dp_priv, u32 event)
-{
-	unsigned long flag;
-	struct msm_dp_event *todo;
-	u32	gndx;
-
-	spin_lock_irqsave(&msm_dp_priv->event_lock, flag);
-	if (msm_dp_priv->event_pndx == msm_dp_priv->event_gndx) {
-		spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
-		return -ENOENT;
-	}
-
-	gndx = msm_dp_priv->event_gndx;
-	while (msm_dp_priv->event_pndx != gndx) {
-		todo = &msm_dp_priv->event_list[gndx];
-		if (todo->event_id == event) {
-			todo->event_id = EV_NO_EVENT;	/* deleted */
-			todo->delay = 0;
-		}
-		gndx++;
-		gndx %= DP_EVENT_Q_MAX;
-	}
-	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
-
-	return 0;
-}
-
 void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display)
 {
 	struct msm_dp_display_private *dp;
@@ -287,8 +199,6 @@ void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display)
 	complete_all(&dp->audio_comp);
 }
 
-static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_priv);
-
 static int msm_dp_display_bind(struct device *dev, struct device *master,
 			   void *data)
 {
@@ -308,12 +218,6 @@ static int msm_dp_display_bind(struct device *dev, struct device *master,
 		goto end;
 	}
 
-	rc = msm_dp_hpd_event_thread_start(dp);
-	if (rc) {
-		DRM_ERROR("Event thread create failed\n");
-		goto end;
-	}
-
 	return 0;
 end:
 	return rc;
@@ -325,8 +229,6 @@ static void msm_dp_display_unbind(struct device *dev, struct device *master,
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 
-	kthread_stop(dp->ev_tsk);
-
 	of_dp_aux_depopulate_bus(dp->aux);
 
 	msm_dp_aux_unregister(dp->aux);
@@ -340,38 +242,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
 	.unbind = msm_dp_display_unbind,
 };
 
-static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
-					    bool hpd)
-{
-	if ((hpd && dp->msm_dp_display.link_ready) ||
-			(!hpd && !dp->msm_dp_display.link_ready)) {
-		drm_dbg_dp(dp->drm_dev, "HPD already %s\n", str_on_off(hpd));
-		return 0;
-	}
-
-	/* reset video pattern flag on disconnect */
-	if (!hpd) {
-		dp->panel->video_test = false;
-		if (!dp->msm_dp_display.is_edp)
-			drm_dp_set_subconnector_property(dp->msm_dp_display.connector,
-							 connector_status_disconnected,
-							 dp->panel->dpcd,
-							 dp->panel->downstream_ports);
-	}
-
-	dp->msm_dp_display.link_ready = hpd;
-
-	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
-			dp->msm_dp_display.connector_type, hpd);
-
-	drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
-			      hpd ?
-			      connector_status_connected :
-			      connector_status_disconnected);
-
-	return 0;
-}
-
 static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
 {
 	int rc, lttpr_count;
@@ -414,6 +284,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
+	dp->msm_dp_display.link_ready = true;
+
 	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = info->has_audio;
@@ -427,8 +299,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
-	msm_dp_display_send_hpd_notification(dp, true);
-
 end:
 	return rc;
 }
@@ -483,24 +353,6 @@ static void msm_dp_display_host_deinit(struct msm_dp_display_private *dp)
 	dp->core_initialized = false;
 }
 
-static int msm_dp_display_usbpd_configure_cb(struct device *dev)
-{
-	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
-
-	msm_dp_display_host_phy_init(dp);
-
-	return msm_dp_display_process_hpd_high(dp);
-}
-
-static int msm_dp_display_notify_disconnect(struct device *dev)
-{
-	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
-
-	msm_dp_display_send_hpd_notification(dp, false);
-
-	return 0;
-}
-
 static void msm_dp_display_handle_video_request(struct msm_dp_display_private *dp)
 {
 	if (dp->link->sink_request & DP_TEST_LINK_VIDEO_PATTERN) {
@@ -509,34 +361,12 @@ static void msm_dp_display_handle_video_request(struct msm_dp_display_private *d
 	}
 }
 
-static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_private *dp)
-{
-	int rc = 0;
-
-	if (drm_dp_is_branch(dp->panel->dpcd) && dp->link->sink_count == 0) {
-		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
-		if (dp->hpd_state != ST_DISCONNECTED) {
-			dp->hpd_state = ST_DISCONNECT_PENDING;
-			msm_dp_display_send_hpd_notification(dp, false);
-		}
-	} else {
-		if (dp->hpd_state == ST_DISCONNECTED) {
-			dp->hpd_state = ST_MAINLINK_READY;
-			rc = msm_dp_display_process_hpd_high(dp);
-			if (rc)
-				dp->hpd_state = ST_DISCONNECTED;
-		}
-	}
-
-	return rc;
-}
-
 static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 {
 	u32 sink_request = dp->link->sink_request;
 
 	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
-	if (dp->hpd_state == ST_DISCONNECTED) {
+	if (!dp->msm_dp_display.link_ready) {
 		if (sink_request & DP_LINK_STATUS_UPDATED) {
 			drm_dbg_dp(dp->drm_dev, "Disconnected sink_request: %d\n",
 							sink_request);
@@ -553,76 +383,36 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 	return 0;
 }
 
-static int msm_dp_display_usbpd_attention_cb(struct device *dev)
-{
-	int rc = 0;
-	u32 sink_request;
-	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
-
-	/* check for any test request issued by sink */
-	rc = msm_dp_link_process_request(dp->link);
-	if (!rc) {
-		sink_request = dp->link->sink_request;
-		drm_dbg_dp(dp->drm_dev, "hpd_state=%d sink_request=%d\n",
-					dp->hpd_state, sink_request);
-		if (sink_request & DS_PORT_STATUS_CHANGED)
-			rc = msm_dp_display_handle_port_status_changed(dp);
-		else
-			rc = msm_dp_display_handle_irq_hpd(dp);
-	}
-
-	return rc;
-}
-
 static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 {
-	u32 state;
 	int ret;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
-	msm_dp_aux_enable_xfers(dp->aux, true);
-
-	mutex_lock(&dp->event_mutex);
-
-	state =  dp->hpd_state;
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
-
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
-	if (state == ST_MAINLINK_READY || state == ST_CONNECTED) {
-		mutex_unlock(&dp->event_mutex);
+	if (dp->msm_dp_display.link_ready)
 		return 0;
-	}
-
-	if (state == ST_DISCONNECT_PENDING) {
-		/* wait until ST_DISCONNECTED */
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 1);
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
-		mutex_unlock(&dp->event_mutex);
 		return ret;
 	}
 
-	ret = msm_dp_display_usbpd_configure_cb(&pdev->dev);
+	msm_dp_aux_enable_xfers(dp->aux, true);
+
+	msm_dp_display_host_phy_init(dp);
+
+	ret = msm_dp_display_process_hpd_high(dp);
 	if (ret) {	/* link train failed */
-		dp->hpd_state = ST_DISCONNECTED;
+		dp->msm_dp_display.link_ready = false;
+		msm_dp_aux_enable_xfers(dp->aux, false);
 		pm_runtime_put_sync(&pdev->dev);
-	} else {
-		dp->hpd_state = ST_MAINLINK_READY;
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
-	mutex_unlock(&dp->event_mutex);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	/* uevent will complete connection part */
 	return 0;
@@ -644,97 +434,69 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 
 static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 {
-	u32 state;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
-	msm_dp_aux_enable_xfers(dp->aux, false);
-
-	mutex_lock(&dp->event_mutex);
-
-	state = dp->hpd_state;
+	dp->panel->video_test = false;
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	msm_dp_aux_enable_xfers(dp->aux, false);
 
-	/* unplugged, no more irq_hpd handle */
-	msm_dp_del_event(dp, EV_IRQ_HPD_INT);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
-	if (state == ST_DISCONNECTED) {
-		/* triggered by irq_hdp with sink_count = 0 */
-		if (dp->link->sink_count == 0) {
-			msm_dp_display_host_phy_exit(dp);
-		}
-		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
-		mutex_unlock(&dp->event_mutex);
+	if (!dp->msm_dp_display.link_ready)
 		return 0;
-	} else if (state == ST_DISCONNECT_PENDING) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	} else if (state == ST_MAINLINK_READY) {
-		msm_dp_ctrl_off_link(dp->ctrl);
+
+	/* triggered by irq_hdp with sink_count = 0 */
+	if (dp->link->sink_count == 0)
 		msm_dp_display_host_phy_exit(dp);
-		dp->hpd_state = ST_DISCONNECTED;
-		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
-		pm_runtime_put_sync(&pdev->dev);
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
 
 	/*
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
 	 */
-	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
+	if (!dp->msm_dp_display.is_edp)
+		drm_dp_set_subconnector_property(dp->msm_dp_display.connector,
+						 connector_status_disconnected,
+						 dp->panel->dpcd,
+						 dp->panel->downstream_ports);
 
-	if (state == ST_DISPLAY_OFF) {
-		dp->hpd_state = ST_DISCONNECTED;
-	} else {
-		dp->hpd_state = ST_DISCONNECT_PENDING;
-	}
+	dp->msm_dp_display.link_ready = false;
 
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	/* uevent will complete disconnection part */
 	pm_runtime_put_sync(&pdev->dev);
-	mutex_unlock(&dp->event_mutex);
 	return 0;
 }
 
 static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 {
-	u32 state;
-
-	mutex_lock(&dp->event_mutex);
+	u32 sink_request;
+	int rc = 0;
 
 	/* irq_hpd can happen at either connected or disconnected state */
-	state =  dp->hpd_state;
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
-
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
-	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
-		/* wait until ST_CONNECTED */
-		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 1);
-		mutex_unlock(&dp->event_mutex);
-		return 0;
+	/* check for any test request issued by sink */
+	rc = msm_dp_link_process_request(dp->link);
+	if (!rc) {
+		sink_request = dp->link->sink_request;
+		drm_dbg_dp(dp->drm_dev, "sink_request=%d\n", sink_request);
+		if (sink_request & DS_PORT_STATUS_CHANGED)
+			rc = msm_dp_display_process_hpd_high(dp);
+		else
+			rc = msm_dp_display_handle_irq_hpd(dp);
 	}
 
-	msm_dp_display_usbpd_attention_cb(&dp->msm_dp_display.pdev->dev);
-
-	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
-	mutex_unlock(&dp->event_mutex);
-
-	return 0;
+	return rc;
 }
 
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
@@ -1010,12 +772,8 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 	 * power_on status before dumping DP registers to avoid crash due
 	 * to unclocked access
 	 */
-	mutex_lock(&msm_dp_display->event_mutex);
-
-	if (!dp->power_on) {
-		mutex_unlock(&msm_dp_display->event_mutex);
+	if (!dp->power_on)
 		return;
-	}
 
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
 				    msm_dp_display->ahb_base, "dp_ahb");
@@ -1025,8 +783,6 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 				    msm_dp_display->link_base, "dp_link");
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->p0_len,
 				    msm_dp_display->p0_base, "dp_p0");
-
-	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
 void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
@@ -1042,95 +798,6 @@ void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
 	msm_dp_ctrl_set_psr(dp->ctrl, enter);
 }
 
-static int hpd_event_thread(void *data)
-{
-	struct msm_dp_display_private *msm_dp_priv;
-	unsigned long flag;
-	struct msm_dp_event *todo;
-	int timeout_mode = 0;
-
-	msm_dp_priv = (struct msm_dp_display_private *)data;
-
-	while (1) {
-		if (timeout_mode) {
-			wait_event_timeout(msm_dp_priv->event_q,
-				(msm_dp_priv->event_pndx == msm_dp_priv->event_gndx) ||
-					kthread_should_stop(), EVENT_TIMEOUT);
-		} else {
-			wait_event_interruptible(msm_dp_priv->event_q,
-				(msm_dp_priv->event_pndx != msm_dp_priv->event_gndx) ||
-					kthread_should_stop());
-		}
-
-		if (kthread_should_stop())
-			break;
-
-		spin_lock_irqsave(&msm_dp_priv->event_lock, flag);
-		todo = &msm_dp_priv->event_list[msm_dp_priv->event_gndx];
-		if (todo->delay) {
-			struct msm_dp_event *todo_next;
-
-			msm_dp_priv->event_gndx++;
-			msm_dp_priv->event_gndx %= DP_EVENT_Q_MAX;
-
-			/* re enter delay event into q */
-			todo_next = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
-			msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
-			todo_next->event_id = todo->event_id;
-			todo_next->delay = todo->delay - 1;
-
-			/* clean up older event */
-			todo->event_id = EV_NO_EVENT;
-			todo->delay = 0;
-
-			/* switch to timeout mode */
-			timeout_mode = 1;
-			spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
-			continue;
-		}
-
-		/* timeout with no events in q */
-		if (msm_dp_priv->event_pndx == msm_dp_priv->event_gndx) {
-			spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
-			continue;
-		}
-
-		msm_dp_priv->event_gndx++;
-		msm_dp_priv->event_gndx %= DP_EVENT_Q_MAX;
-		timeout_mode = 0;
-		spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
-
-		switch (todo->event_id) {
-		case EV_HPD_PLUG_INT:
-			msm_dp_hpd_plug_handle(msm_dp_priv);
-			break;
-		case EV_HPD_UNPLUG_INT:
-			msm_dp_hpd_unplug_handle(msm_dp_priv);
-			break;
-		case EV_IRQ_HPD_INT:
-			msm_dp_irq_hpd_handle(msm_dp_priv);
-			break;
-		default:
-			break;
-		}
-	}
-
-	return 0;
-}
-
-static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_priv)
-{
-	/* set event q to empty */
-	msm_dp_priv->event_gndx = 0;
-	msm_dp_priv->event_pndx = 0;
-
-	msm_dp_priv->ev_tsk = kthread_run(hpd_event_thread, msm_dp_priv, "dp_hpd_handler");
-	if (IS_ERR(msm_dp_priv->ev_tsk))
-		return PTR_ERR(msm_dp_priv->ev_tsk);
-
-	return 0;
-}
-
 /**
  * msm_dp_bridge_detect - callback to determine if connector is connected
  * @bridge: Pointer to drm bridge structure
@@ -1144,7 +811,7 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *priv;
 	int ret = 0;
-	int status = connector_status_disconnected;
+	int status;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	struct drm_dp_desc desc;
 
@@ -1153,77 +820,70 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	if (!dp->link_ready)
-		return status;
-
-	msm_dp_aux_enable_xfers(priv->aux, true);
+		return connector_status_disconnected;
 
 	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
-		msm_dp_aux_enable_xfers(priv->aux, false);
-		return status;
+		return connector_status_disconnected;
 	}
 
+	msm_dp_aux_enable_xfers(priv->aux, true);
+
 	ret = msm_dp_aux_is_link_connected(priv->aux);
-	if (dp->internal_hpd && !ret)
-		goto end;
+	if (ret) {
+		DRM_DEBUG_DP("aux not connected\n");
+		goto err;
+	}
 
 	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
-	if (ret)
-		goto end;
+	if (ret) {
+		DRM_DEBUG_DP("failed to read caps\n");
+		goto err;
+	}
 
 	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
-	if (ret)
-		goto end;
+	if (ret) {
+		DRM_DEBUG_DP("failed to read desc\n");
+		goto err;
+	}
 
 	status = connector_status_connected;
 	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
-		int sink_count = drm_dp_read_sink_count(priv->aux);
-
-		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
+		int sink_count;
 
+		sink_count = drm_dp_read_sink_count(priv->aux);
 		if (sink_count <= 0)
 			status = connector_status_disconnected;
+
+		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
 	}
 
-end:
 	pm_runtime_put_sync(&dp->pdev->dev);
 	return status;
+
+err:
+	pm_runtime_put_sync(&dp->pdev->dev);
+	return connector_status_disconnected;
 }
 
 static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 {
 	struct msm_dp_display_private *dp = dev_id;
-	irqreturn_t ret = IRQ_NONE;
 	u32 hpd_isr_status;
-
-	if (!dp) {
-		DRM_ERROR("invalid data\n");
-		return IRQ_NONE;
-	}
+	unsigned long flags;
+	irqreturn_t ret = IRQ_HANDLED;
 
 	hpd_isr_status = msm_dp_aux_get_hpd_intr_status(dp->aux);
 
 	if (hpd_isr_status & 0x0F) {
 		drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
 			dp->msm_dp_display.connector_type, hpd_isr_status);
-		/* hpd related interrupts */
-		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
-
-		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0);
-		}
-
-		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 3);
-		}
 
-		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
-
-		ret = IRQ_HANDLED;
+		spin_lock_irqsave(&dp->irq_thread_lock, flags);
+		dp->hpd_isr_status |= hpd_isr_status;
+		ret = IRQ_WAKE_THREAD;
+		spin_unlock_irqrestore(&dp->irq_thread_lock, flags);
 	}
 
 	/* DP controller isr */
@@ -1232,6 +892,36 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 	return ret;
 }
 
+static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
+{
+	struct msm_dp_display_private *dp = dev_id;
+	irqreturn_t ret = IRQ_NONE;
+	unsigned long flags;
+	u32 hpd_isr_status;
+
+	spin_lock_irqsave(&dp->irq_thread_lock, flags);
+	hpd_isr_status = dp->hpd_isr_status;
+	dp->hpd_isr_status = 0;
+	spin_unlock_irqrestore(&dp->irq_thread_lock, flags);
+
+	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
+		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+				      connector_status_disconnected);
+
+	if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
+		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+				      connector_status_connected);
+
+	/* Send HPD as connected and distinguish it in the notifier */
+	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+				      connector_status_connected);
+
+	ret = IRQ_HANDLED;
+
+	return ret;
+}
+
 static int msm_dp_display_request_irq(struct msm_dp_display_private *dp)
 {
 	int rc = 0;
@@ -1243,9 +933,13 @@ static int msm_dp_display_request_irq(struct msm_dp_display_private *dp)
 		return dp->irq;
 	}
 
-	rc = devm_request_irq(&pdev->dev, dp->irq, msm_dp_display_irq_handler,
-			      IRQF_TRIGGER_HIGH|IRQF_NO_AUTOEN,
-			      "dp_display_isr", dp);
+	spin_lock_init(&dp->irq_thread_lock);
+	irq_set_status_flags(dp->irq, IRQ_NOAUTOEN);
+	rc = devm_request_threaded_irq(&pdev->dev, dp->irq,
+				       msm_dp_display_irq_handler,
+				       msm_dp_display_irq_thread,
+				       IRQ_TYPE_LEVEL_HIGH,
+				       "dp_display_isr", dp);
 
 	if (rc < 0) {
 		DRM_ERROR("failed to request IRQ%u: %d\n",
@@ -1425,6 +1119,7 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 	dp->wide_bus_supported = desc->wide_bus_supported;
 	dp->msm_dp_display.is_edp =
 		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
+	dp->hpd_isr_status = 0;
 
 	rc = msm_dp_display_get_io(dp);
 	if (rc)
@@ -1436,11 +1131,6 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
-	/* setup event q */
-	mutex_init(&dp->event_mutex);
-	init_waitqueue_head(&dp->event_q);
-	spin_lock_init(&dp->event_lock);
-
 	/* Store DP audio handle inside DP display */
 	dp->msm_dp_display.msm_dp_audio = dp->audio;
 
@@ -1636,7 +1326,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	int rc = 0;
 	struct msm_dp_display_private *msm_dp_display;
-	u32 hpd_state;
 	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1648,29 +1337,21 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	if (dp->is_edp)
 		msm_dp_hpd_plug_handle(msm_dp_display);
 
-	mutex_lock(&msm_dp_display->event_mutex);
 	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
-		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
 
-	hpd_state = msm_dp_display->hpd_state;
-	if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
-		mutex_unlock(&msm_dp_display->event_mutex);
+	if (msm_dp_display->link->sink_count == 0)
 		return;
-	}
 
 	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
-		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
 
-	hpd_state =  msm_dp_display->hpd_state;
-
-	if (hpd_state == ST_DISPLAY_OFF) {
+	if (dp->link_ready && !dp->power_on) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
 	}
@@ -1689,11 +1370,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		msm_dp_display_disable(msm_dp_display);
 	}
 
-	/* completed connection */
-	msm_dp_display->hpd_state = ST_CONNECTED;
-
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
-	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
@@ -1713,7 +1390,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
-	u32 hpd_state;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1721,27 +1397,14 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (dp->is_edp)
 		msm_dp_hpd_unplug_handle(msm_dp_display);
 
-	mutex_lock(&msm_dp_display->event_mutex);
-
-	hpd_state = msm_dp_display->hpd_state;
-	if (hpd_state != ST_DISCONNECT_PENDING && hpd_state != ST_CONNECTED)
-		drm_dbg_dp(dp->drm_dev, "type=%d wrong hpd_state=%d\n",
-			   dp->connector_type, hpd_state);
+	if (!dp->link_ready)
+		drm_dbg_dp(dp->drm_dev, "type=%d is disconnected\n", dp->connector_type);
 
 	msm_dp_display_disable(msm_dp_display);
 
-	hpd_state =  msm_dp_display->hpd_state;
-	if (hpd_state == ST_DISCONNECT_PENDING) {
-		/* completed disconnection */
-		msm_dp_display->hpd_state = ST_DISCONNECTED;
-	} else {
-		msm_dp_display->hpd_state = ST_DISPLAY_OFF;
-	}
-
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 
 	pm_runtime_put_sync(&dp->pdev->dev);
-	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
 void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
@@ -1797,18 +1460,13 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
 	 * step-4: DP PHY is initialized at plugin handler before link training
 	 *
 	 */
-	mutex_lock(&dp->event_mutex);
 	if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
 		DRM_ERROR("failed to resume power\n");
-		mutex_unlock(&dp->event_mutex);
 		return;
 	}
 
 	msm_dp_aux_hpd_enable(dp->aux);
 	msm_dp_aux_hpd_intr_enable(dp->aux);
-
-	msm_dp_display->internal_hpd = true;
-	mutex_unlock(&dp->event_mutex);
 }
 
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
@@ -1817,15 +1475,10 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	mutex_lock(&dp->event_mutex);
-
 	msm_dp_aux_hpd_intr_disable(dp->aux);
 	msm_dp_aux_hpd_disable(dp->aux);
 
-	msm_dp_display->internal_hpd = false;
-
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
-	mutex_unlock(&dp->event_mutex);
 }
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
@@ -1835,13 +1488,31 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+	u32 hpd_link_status = 0;
 
-	/* Without next_bridge interrupts are handled by the DP core directly */
-	if (msm_dp_display->internal_hpd)
+	if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
+		DRM_ERROR("failed to pm_runtime_resume\n");
 		return;
+	}
+
+	hpd_link_status = msm_dp_aux_is_link_connected(dp->aux);
 
-	if (!msm_dp_display->link_ready && status == connector_status_connected)
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
-	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
-		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
+	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, link_ready=%d, status=%d\n",
+		   msm_dp_display->connector_type, hpd_link_status,
+		   msm_dp_display->link_ready, status);
+
+	if (status == connector_status_connected) {
+		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
+			msm_dp_hpd_plug_handle(dp);
+			msm_dp_hpd_unplug_handle(dp);
+		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
+			msm_dp_irq_hpd_handle(dp);
+		} else {
+			msm_dp_hpd_plug_handle(dp);
+		}
+	} else {
+		msm_dp_hpd_unplug_handle(dp);
+	}
+
+	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 60094061c102..d2d3d61eb0b0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -22,7 +22,6 @@ struct msm_dp {
 	bool power_on;
 	unsigned int connector_type;
 	bool is_edp;
-	bool internal_hpd;
 
 	struct msm_dp_audio *msm_dp_audio;
 	bool psr_supported;

-- 
2.47.3


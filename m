Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFF1B1F18A
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947D510E21D;
	Sat,  9 Aug 2025 00:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9pA9wdZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC0310E99B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578FbjYP007842
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pVp2LvuWfzIBugnNlvc8UhhBMesOGUqQJS4eHYhxUXE=; b=H9pA9wdZWtZ5bCRd
 onuweo1yrHB6viIZDm+SOzCyiUZeMGfOe/eDqfKvnKSADFGALA9sBnqZJRrbHB8l
 egOd2iXASsfB4ywFuWmpoY7meDjKyIOzyb3dNntnPrc6rWPh6RS46PhYE8PRE7v8
 YWhLnMyix4WScpUQ0KidnE86n8m+lAm++KY5SWtFe2oo6PKlZFdJ+45MQPy0NEjC
 nkH0NtoePOoOIjbAUt2GpK4Va52S62I46Kapy2HFcHBvp0rble7GeG+TLQcXv9Yp
 HpDTW+J49/IrPZpVpeODzDiDuBg0FZ90PqHfXZzXq3G/cbHnwT/T8JKM95J+GCyY
 dZC9Eg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy73h9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-240012b74dfso20677925ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699747; x=1755304547;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVp2LvuWfzIBugnNlvc8UhhBMesOGUqQJS4eHYhxUXE=;
 b=rR/HisIythzbHXRa/MdCuOTPZgL2Zc4Uu22ziXpf8BejfS02gr77aIen2Q4+QST1CS
 Ki4/iRNoB43MGcO1YblODkIsBZisfR+0G7gRHE6Y8CoTauEXkxi1u1jMiXoBxRrupAch
 bOfdH3EYspctzmITo6xOiBKEX2YLgc4rD7w5PsVA+jukKIC2Vp53fl2KOmEANj+1S/jp
 ACbHAGyOLrWOOMbfh4ix+I6wmdtDxpULth8CyijhG+IxKxq9Z123HPJbcBsECHGrS+eq
 st7RkMKwDI9O7UqxB+Gdt3un4I5iPPZ4JPkIMDxkvWtRlAsos99hh1vHlSshHYrbdMHs
 oCog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlXdoK0lysp30BhUYYD3TnhG/UNDdshvvpVzdAn99WGVdq26RrQvk++ceV9HAykO1c9ZggxVVqkRY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNUnwxjsVCelExHpVyIGAgZCSmYu7YrVtn5tLZSXy2oWgjwwvL
 UOlsBBysUhVGDrhyx1HlHg1EyHJ7wUlDsfAQhtEh2i+CYkWLwMyX2pgLFsX0lT1GyB/oRYdho+7
 MrZVxO24tw/D4lr2BsotJQBaUcUOEWaB09ikFVHPcQtON0uKh/leGrfjiDSLpK3c7tDhGiGI=
X-Gm-Gg: ASbGncuO8GY1KZiQ1LeDCJmtYa4yBJtVGxDs/tio6TM19tD6Jg5atuZS82gT1nrxfzq
 Ukm6DQNCPFGnXRj0D6yMDDWFb6svWwskotoQQaIDw9I0SKl0yhZzcqvkrQizzuK23jmK41A3Mv/
 L7Inl3BJps9s72car3EFvFBmso8RErOOENPG131V0TBB4cDGF8gtwmDTZauf6GEAKyPQCRYvgWl
 ZonOJbULv6uvdA2M1pzgTMRrhCNWl24P6kfQgqOZouhsGgbJePSf2uq5rXUTiTfEO9aquFtFU9A
 PeMeGFp1S9ZX1oo6g6E/z6wmKtijydGu6jjFpXXPjtYwitClzpdE3GcxwkDHsoHb9WyTtm11Uws
 sHxnW403AsdHwMLeMZBP7qIRk
X-Received: by 2002:a17:902:d585:b0:23f:d903:d867 with SMTP id
 d9443c01a7336-242c21dcdc9mr66684715ad.35.1754699746877; 
 Fri, 08 Aug 2025 17:35:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpDzXJUG2NG/inVALaMSroTXHJ0oWYwhYOpF7guVZ6NqIs4yl+/T4nnDKa6V0uCpokze4sOA==
X-Received: by 2002:a17:902:d585:b0:23f:d903:d867 with SMTP id
 d9443c01a7336-242c21dcdc9mr66684055ad.35.1754699746283; 
 Fri, 08 Aug 2025 17:35:46 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:45 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:20 -0700
Subject: [PATCH v2 08/12] drm/msm/dp: Drop event waitqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-8-7f4e1e741aa3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=15203;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=HTqrrF+C5QTfFndFWgmnWgSjgmkkDUYYRxWdw3qjL0o=;
 b=UJDbpsNuP3Llm5q+JW9nAZCwXzU559UaTsfBS+2xaxmyWqCzL2MvJufSsoeyxm/mGL3bZX0sz
 hdO4w+8z7wiBv0gkxveaFL2GP3NFm+VzutpY442bBVbynZVkkU2KkLw
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: TkOR_mMwe-RY4DUUfiHK4FVaXocag7rX
X-Proofpoint-GUID: TkOR_mMwe-RY4DUUfiHK4FVaXocag7rX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX895PWwCqFqeh
 XsYzLtt278J04od/M4mnW8NTJoHBi91pFgGqKFZQFX1ysZpICmOJgU3PTpMjKt3AYc9ITHm5jyG
 cCezC2AuwLzeajwq+tBNi37K29DuwcJncCnUBGEA5DNElX5vaZ9Ww0yyWZr+8uLxQQx7WvVtU9a
 WVF2raDOB186uUB0t8OvDr4Hr1BWdob5SZeAVFwIlr++j1gBQOQk29380xH1ktb2Dxog+WWofVd
 Lhuwknhjy6Il4dYhTgNiSy9zeN+xVpApK6Fn7lm+hdyrM1sqRVDhUmql/vCj7Gzx9MrpgJNC4L4
 ccafCZ025e9h+osdN85VUr3LbgrsaLZ5cXgFALy1ewQ0UEh+i/40VXNeyUTTkfeRMe1TsW6VtzG
 nXgO23rm
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=689697e4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=WmteE7YyU5uwuhFq2T4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009
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

Since the HPD IRQ handler directly notifies DRM core for hotplug events,
there is no need to maintain a separate event waitqueue.

Drop the event waitqueue and all related structs and helpers.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 255 +-----------------------------------
 1 file changed, 7 insertions(+), 248 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b9e2e368c4a8..eabd6e6981fb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -52,27 +52,6 @@ enum {
 	ST_DISPLAY_OFF,
 };
 
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
-	u32 data;
-	u32 delay;
-};
-
 struct msm_dp_display_private {
 	int irq;
 
@@ -100,16 +79,7 @@ struct msm_dp_display_private {
 	spinlock_t irq_thread_lock;
 	u32 hpd_isr_status;
 
-	/* event related only access by event thread */
-	struct mutex event_mutex;
-	wait_queue_head_t event_q;
 	u32 hpd_state;
-	u32 event_pndx;
-	u32 event_gndx;
-	struct task_struct *ev_tsk;
-	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
-	spinlock_t event_lock;
-
 	bool wide_bus_supported;
 
 	struct msm_dp_audio *audio;
@@ -212,60 +182,6 @@ static struct msm_dp_display_private *dev_get_dp_display_private(struct device *
 	return container_of(dp, struct msm_dp_display_private, msm_dp_display);
 }
 
-static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 event,
-						u32 data, u32 delay)
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
-	todo->data = data;
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
@@ -284,8 +200,6 @@ void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display)
 	complete_all(&dp->audio_comp);
 }
 
-static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_priv);
-
 static int msm_dp_display_bind(struct device *dev, struct device *master,
 			   void *data)
 {
@@ -305,12 +219,6 @@ static int msm_dp_display_bind(struct device *dev, struct device *master,
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
@@ -322,8 +230,6 @@ static void msm_dp_display_unbind(struct device *dev, struct device *master,
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 
-	kthread_stop(dp->ev_tsk);
-
 	of_dp_aux_depopulate_bus(dp->aux);
 
 	msm_dp_aux_unregister(dp->aux);
@@ -585,33 +491,22 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	msm_dp_aux_enable_xfers(dp->aux, true);
 
-	mutex_lock(&dp->event_mutex);
-
 	state =  dp->hpd_state;
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
+	if (state == ST_DISPLAY_OFF)
 		return 0;
-	}
 
-	if (state == ST_MAINLINK_READY || state == ST_CONNECTED) {
-		mutex_unlock(&dp->event_mutex);
+	if (state == ST_MAINLINK_READY || state == ST_CONNECTED)
 		return 0;
-	}
 
-	if (state == ST_DISCONNECT_PENDING) {
-		/* wait until ST_DISCONNECTED */
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
-		mutex_unlock(&dp->event_mutex);
+	if (state == ST_DISCONNECT_PENDING)
 		return 0;
-	}
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
-		mutex_unlock(&dp->event_mutex);
 		return ret;
 	}
 
@@ -625,7 +520,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
-	mutex_unlock(&dp->event_mutex);
 
 	/* uevent will complete connection part */
 	return 0;
@@ -652,26 +546,19 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	msm_dp_aux_enable_xfers(dp->aux, false);
 
-	mutex_lock(&dp->event_mutex);
-
 	state = dp->hpd_state;
 
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	/* unplugged, no more irq_hpd handle */
-	msm_dp_del_event(dp, EV_IRQ_HPD_INT);
-
 	if (state == ST_DISCONNECTED) {
 		/* triggered by irq_hdp with sink_count = 0 */
 		if (dp->link->sink_count == 0) {
 			msm_dp_display_host_phy_exit(dp);
 		}
 		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
-		mutex_unlock(&dp->event_mutex);
 		return 0;
 	} else if (state == ST_DISCONNECT_PENDING) {
-		mutex_unlock(&dp->event_mutex);
 		return 0;
 	} else if (state == ST_MAINLINK_READY) {
 		msm_dp_ctrl_off_link(dp->ctrl);
@@ -679,7 +566,6 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 		dp->hpd_state = ST_DISCONNECTED;
 		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 		pm_runtime_put_sync(&pdev->dev);
-		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
 
@@ -703,7 +589,6 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	/* uevent will complete disconnection part */
 	pm_runtime_put_sync(&pdev->dev);
-	mutex_unlock(&dp->event_mutex);
 	return 0;
 }
 
@@ -711,32 +596,22 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 {
 	u32 state;
 
-	mutex_lock(&dp->event_mutex);
-
 	/* irq_hpd can happen at either connected or disconnected state */
 	state =  dp->hpd_state;
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
+	if (state == ST_DISPLAY_OFF)
 		return 0;
-	}
 
-	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
-		/* wait until ST_CONNECTED */
-		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
-		mutex_unlock(&dp->event_mutex);
+	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING)
 		return 0;
-	}
 
 	msm_dp_display_usbpd_attention_cb(&dp->msm_dp_display.pdev->dev);
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	mutex_unlock(&dp->event_mutex);
-
 	return 0;
 }
 
@@ -1013,12 +888,8 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
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
@@ -1028,8 +899,6 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 				    msm_dp_display->link_base, "dp_link");
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->p0_len,
 				    msm_dp_display->p0_base, "dp_p0");
-
-	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
 void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
@@ -1045,96 +914,6 @@ void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
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
-			todo_next->data = todo->data;
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
-			msm_dp_hpd_plug_handle(msm_dp_priv, todo->data);
-			break;
-		case EV_HPD_UNPLUG_INT:
-			msm_dp_hpd_unplug_handle(msm_dp_priv, todo->data);
-			break;
-		case EV_IRQ_HPD_INT:
-			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
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
@@ -1455,11 +1234,6 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
-	/* setup event q */
-	mutex_init(&dp->event_mutex);
-	init_waitqueue_head(&dp->event_q);
-	spin_lock_init(&dp->event_lock);
-
 	/* Store DP audio handle inside DP display */
 	dp->msm_dp_display.msm_dp_audio = dp->audio;
 
@@ -1667,23 +1441,18 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	if (dp->is_edp)
 		msm_dp_hpd_plug_handle(msm_dp_display, 0);
 
-	mutex_lock(&msm_dp_display->event_mutex);
 	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
-		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
 
 	hpd_state = msm_dp_display->hpd_state;
-	if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
-		mutex_unlock(&msm_dp_display->event_mutex);
+	if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY)
 		return;
-	}
 
 	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
-		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
 
@@ -1712,7 +1481,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	msm_dp_display->hpd_state = ST_CONNECTED;
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
-	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
@@ -1740,8 +1508,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (dp->is_edp)
 		msm_dp_hpd_unplug_handle(msm_dp_display, 0);
 
-	mutex_lock(&msm_dp_display->event_mutex);
-
 	hpd_state = msm_dp_display->hpd_state;
 	if (hpd_state != ST_DISCONNECT_PENDING && hpd_state != ST_CONNECTED)
 		drm_dbg_dp(dp->drm_dev, "type=%d wrong hpd_state=%d\n",
@@ -1760,7 +1526,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 
 	pm_runtime_put_sync(&dp->pdev->dev);
-	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
 void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
@@ -1816,10 +1581,8 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
 	 * step-4: DP PHY is initialized at plugin handler before link training
 	 *
 	 */
-	mutex_lock(&dp->event_mutex);
 	if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
 		DRM_ERROR("failed to resume power\n");
-		mutex_unlock(&dp->event_mutex);
 		return;
 	}
 
@@ -1827,7 +1590,6 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
 	msm_dp_aux_hpd_intr_enable(dp->aux);
 
 	msm_dp_display->internal_hpd = true;
-	mutex_unlock(&dp->event_mutex);
 }
 
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
@@ -1836,15 +1598,12 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	mutex_lock(&dp->event_mutex);
-
 	msm_dp_aux_hpd_intr_disable(dp->aux);
 	msm_dp_aux_hpd_disable(dp->aux);
 
 	msm_dp_display->internal_hpd = false;
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
-	mutex_unlock(&dp->event_mutex);
 }
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,

-- 
2.50.1


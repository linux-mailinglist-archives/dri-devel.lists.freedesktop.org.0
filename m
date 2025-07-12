Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31BBB0289E
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091FA10EB11;
	Sat, 12 Jul 2025 00:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTP6A9el";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF9210E16D
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:53 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C0hWlx003248
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h6MX/4UQ3wXDdbyTB76Y7TSV5eGjDBlTaDUHvPE6J1c=; b=TTP6A9elD9VKFH3z
 MW6ZqLWWpCOtNVM/lZGaP+imvfgkJQviwT9nsNOQydy3FqkcT9EkNXm6DNyz7L3M
 G68rge6s9mOpkSDQOETMrgPmaPmHVzIoFtP9KfdKDQkjYrbhW6omuvXG9epL1Vtg
 pFm3gIHkN70hyhtjju9bpQk7rqMV73eFCADzP1d9JncK6kdnNC9EwQnDqPhOggVj
 qbHiy2EKjXEO/a//o/4HcWxzPt7C21UqvtIJW2/AMsXBwcHVEgyIf9gYIkaBMnOd
 gEsGyOseGjYXKntrHr+24qj36W0SSC13aaZe1QCTMyAoxL/n9VLMq1q81wBakVof
 ASuf/g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uddjr0ps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-311ae2b6647so2358802a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281932; x=1752886732;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h6MX/4UQ3wXDdbyTB76Y7TSV5eGjDBlTaDUHvPE6J1c=;
 b=K36lVtoxA3HKtQT+1wl5hFqEMsP73due+Nt4YLzrmvZaL0v6KjjHGCYoGfDsWrvcHA
 uOM3KbLOKMivdbezG18EGy5zH9IQq38MwkoULpC0x/g3pfCdSxZFsbEJtobnN7PBRL1P
 p8WrhKtIf3UJXl8lWIkRfjJGyUyj3gB1Qt/NGiyCJbEKlLwDeb8jMbTM3YN2gtYdQXBE
 StSa6O2pYNWUol64ZroIdYSCBeId7XGpmjnB2xRvQGh/QMeKIVTYJn+db3H/olISTGfA
 gmSVYq31r3mhcc4RZ0Jr1daJvZk1j5+pgmCvBRYXIOAxHk/hp0DsyAk8U50/6fOq8g3M
 t3tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX5pE/xmAYv6A4AEA9uDR2tFqVL3Pq4Wi0aOpM913r/wRBjBe9XJ4gWheSyCwWP0PaoqGW9EnAdxw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGV1M/b8lMqA/gGZCpM6rvCzu4lofPSXWfNr4PfiCcKZqKY+8n
 6EVAbr3iW9G0blPMiAtCzi6DS922s5ftpZR5fwTNVIaDeDSmrNfq2RfroyODzuQK3gNLQK/xPA5
 hgmT9fvBfPg0S31qmJELXNurR1u0mGKjAmpArhFxtL7RO5X0JC4PIqCFFsdTJqdAeV1A+f/oNZO
 cMZo0=
X-Gm-Gg: ASbGnctbEiSqTulzu7vQ41Rj+9mIbPWHAwhGopY/xeMbed7b0uAgQ0GyfslzKwqQNK3
 K7a/Yuejk/NMC0f3lUDAzg+B6oVGQC2EF0EaffXs8rve5IooqIbxrBtWq3M+AqR31laEfGnXD3c
 wnKQ9GYmjo24YNTGWzDSQQ+a1aL5FfX9T8i1UtsA7bHMNFF1VGEBMj0xlWY7WOe/S39iI7xz9Zk
 1g/nLtKXaiHTt6j34nvoXladgFLDlZidAnbqM82LcoFkv1D1EYQEsgIgj3y0NBPn9V3flx89ALX
 8MLxL+6N5yTPmaJFV9FvUVy30mCcjDj2ZBskW+SEij8kkiscSiqC7ACr2Fafydek6r2Wa4JvOLP
 4SMsQ7s2Pkj+pDuPheU7MeAsd
X-Received: by 2002:a17:90b:3a8a:b0:313:28e7:af14 with SMTP id
 98e67ed59e1d1-31c4cd65a3bmr7425875a91.19.1752281931700; 
 Fri, 11 Jul 2025 17:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+tFLKCiCnmepc6qucz0dfVj1tK+bY/9vBdgkeSkt43kwJGfNiJkqRtZ8IG3Tjs+Uvv+NhcQ==
X-Received: by 2002:a17:90b:3a8a:b0:313:28e7:af14 with SMTP id
 98e67ed59e1d1-31c4cd65a3bmr7425849a91.19.1752281931257; 
 Fri, 11 Jul 2025 17:58:51 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:50 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:21 -0700
Subject: [PATCH 16/19] drm/msm/dp: Drop hpd_state from msm_dp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-16-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=4635;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=xkdTJkD4WZOtCIaP3g0FoYgCz7GOS4niggFgMMcqAvE=;
 b=+E6l2V/nDb8KhG3CAAg7+kJnHr+MlfA6ctlX5ccgh5qrgoS8D0zCCOUNf12CexedtRsn0uiDv
 Dck1hnnKBUFCogGlFKtRqE0GtzIvTBqejdEVsAUDMO/2tI5UjOGKZ95
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: r0nT4QKGv8-_oq6qJEWuJYQ7snk6XvuO
X-Proofpoint-GUID: r0nT4QKGv8-_oq6qJEWuJYQ7snk6XvuO
X-Authority-Analysis: v=2.4 cv=ZPrXmW7b c=1 sm=1 tr=0 ts=6871b34c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=K4C07s3wgbYD0KnbiqQA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNCBTYWx0ZWRfX6v6qKtFKXdBi
 7Gx7ODbj+CjH+Fc2ESja1cWsrP8KXoPpu/rfbuW8qPdB9sydBzZ+40yst1Ve6EF5BCZ2arvm81U
 NaXj6XHTjEgg+XKqFOOBbcYzgUh+2IUhhi86E1NjewEF2pXL0eY7R4lhsIeCNqN42+1Ra8csren
 a/RqDqEYQSJFHi7PEIn3LdRyiuYiqvoIAKO3Q1ixoQgMgXA2xonROYXkHcCscejiPZoLUkTo4n6
 1BbZ6FWA9b8XAsFlYNDeDzOdhW+hfrww8L3pANezgBY8frLcHNDE1HBx8sB6UwmksE4zJp8JfNC
 poVVkSie5E9pMeA7pgZLkGFZjDzDEhTNGonsMP53rIhfSjmNwh6fhL7vhJydH2Ozey2qYM4TeUX
 3AvXryOltcXFUGGh9irsYC/CbpgjjmqRmjtBx4QMMBH0vXlb5MS0EdScGuUeXH6qvsMIXiRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120004
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

Drop the now unused hpd_state field from msm_dp and adjust debug logs
accordingly

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 529e30193168..3aaa603da4f9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -91,7 +91,6 @@ struct msm_dp_display_private {
 	/* event related only access by event thread */
 	struct mutex event_mutex;
 	wait_queue_head_t event_q;
-	u32 hpd_state;
 	u32 event_pndx;
 	u32 event_gndx;
 	struct task_struct *ev_tsk;
@@ -556,8 +555,7 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 	rc = msm_dp_link_process_request(dp->link);
 	if (!rc) {
 		sink_request = dp->link->sink_request;
-		drm_dbg_dp(dp->drm_dev, "hpd_state=%d sink_request=%d\n",
-					dp->hpd_state, sink_request);
+		drm_dbg_dp(dp->drm_dev, "sink_request=%d\n", sink_request);
 		if (sink_request & DS_PORT_STATUS_CHANGED)
 			rc = msm_dp_display_handle_port_status_changed(dp);
 		else
@@ -569,7 +567,6 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 
 static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 {
-	u32 state;
 	int ret;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
@@ -577,9 +574,8 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	mutex_lock(&dp->event_mutex);
 
-	state =  dp->hpd_state;
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	if (dp->msm_dp_display.link_ready) {
 		mutex_unlock(&dp->event_mutex);
@@ -601,8 +597,8 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 		pm_runtime_put_sync(&pdev->dev);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
+			dp->msm_dp_display.connector_type);
 	mutex_unlock(&dp->event_mutex);
 
 	/* uevent will complete connection part */
@@ -625,17 +621,14 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 
 static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 {
-	u32 state;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
 	msm_dp_aux_enable_xfers(dp->aux, false);
 
 	mutex_lock(&dp->event_mutex);
 
-	state = dp->hpd_state;
-
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	if (!dp->msm_dp_display.link_ready) {
 		mutex_unlock(&dp->event_mutex);
@@ -660,8 +653,8 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	/* uevent will complete disconnection part */
 	pm_runtime_put_sync(&pdev->dev);
@@ -671,14 +664,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 
 static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 {
-	u32 state;
-
 	mutex_lock(&dp->event_mutex);
 
 	/* irq_hpd can happen at either connected or disconnected state */
-	state =  dp->hpd_state;
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	if (dp->msm_dp_display.link_ready != dp->msm_dp_display.connected) {
 		/* wait until connect/disconnect handling is completed */
@@ -689,8 +679,8 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 
 	msm_dp_display_usbpd_attention_cb(&dp->msm_dp_display.pdev->dev);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	mutex_unlock(&dp->event_mutex);
 

-- 
2.50.1


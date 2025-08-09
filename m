Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01099B1F196
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7919E10E24E;
	Sat,  9 Aug 2025 00:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J71t2Ve+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBCB10E99E
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:53 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578EjP1c007642
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lygnt7Zi/DkDBsXWW/2tMmsIMiJD5/QBa7Q1HdwAysI=; b=J71t2Ve+xg0D+Yw9
 +Bs7s5zBjwvaNfF4eswxmyQNq3gopOMpfOaSBAuX18u+UZWwuOjMDeA8NdXkuT3U
 pL0GlnI3zDkMj5Ed29gs8AVaZmkWi+U4xRlkqQ9tCLg7Hycp35tK4YoUy2r/jD6V
 58BUZg+J1kDC0phV6l0tc2sjmlbiTBoW+U8eYgGlhzMlBXhFOJReMaNVhrH7lBgB
 vH3duJW74/OYT9x9KpUIrWsjfApUBuBx3YLaHJHOTbrQL0dd3J3f1ynLJG5wyqTP
 1piGel42/S7+ka33rRiD3jyVCLICRqCx+6JAFsYbZ6hSdltQx8FX+Xzld5+LxfLp
 Vy5/YA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u28k4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b42a097bbb1so1278902a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699752; x=1755304552;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lygnt7Zi/DkDBsXWW/2tMmsIMiJD5/QBa7Q1HdwAysI=;
 b=D9JOiE7bH0gonxpOjCfgrdh557YG9N6jAwVbbWQts7FOS5dGsGw4Bci2mZIqzLI7NN
 cUWFuEauPLpdMOjpnlCicghj6ogD8bVJUwBSEgX/qfxI6zy2Hwjk4H75CFWV0Cd0fUfd
 eXsXvYwToseUwWjec6Z9w41R+m4gSfQPEcgs1duB1J0wAU0B5zPh5nNiofw0YF4ZkNPc
 gTr98xwctKqS/PuVisykPhAyGqZ/jwFdtjvh2iNMTDaJ3Fa8liMSNbVCW+dMZTf+P1Aw
 fVa6GzgwSxd33jnV0RYU5rxxeM/KFP69dD8Ixlvo1f6t6HsaYHLn7w/ijUqDvqxwZnTt
 /yeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi2gCVWAvKBKfDuxp/Ymmpho6geY0vl2g+JHmLRVN0oC4YWVkafwkFe8QoSFGTUtFCeQ5kn1gYaNg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy9vE2exTg8tiKFAEpTLYoE8aZSmzTSr7FJGnjBjohKm+8L/OQ
 qtrs9CuKATMk2uWn2qpSFx/t5Ch1mzkhoo+6Wspq4nOm0OvMhfxLOTRe7IXhqQyBEYLk7d/gDXr
 RTX7katyCnjftk8OukENGKo+Av/OPPq73zqR3LruIrodvDGWD3qhx8FysOdC5wnIVGcPQqvY=
X-Gm-Gg: ASbGnctfq4TTn0rBpoMqCV/F4izvskXoMubGRwmR06w4Z6w+G253mLUNKZGZ8c4HSvc
 9mwga+eTFEXyXRnephgpnSo0qAhVl4tPpNOg90KVocanpEuvXOnMGBx8pTDcltdSSnLykSJRcEb
 1NlQ0ZbKQoUatOlnHdvElQbTNfQ0KfPt5gIgueTRuRwD2oUprZzoiPCMFnu7oqXhLHvJncaYSYC
 WnV13FoDoyAoxFDcS5Hl0+U1INCBPYwe3eqMNph2yaZind0JWrhdXehcCt5R1qGew0Yi4mQGlit
 aJGanahwIHCWDzu+JM1e4titbFZCEH9jwQ/y5KrSPiIdlzxuz0Fx+7mKL4TP/QSeA9uZR5jz8eT
 c27xHU6dumk20Rq7dyyi0zCL1
X-Received: by 2002:a17:902:e550:b0:240:bf61:fee3 with SMTP id
 d9443c01a7336-242c225701dmr76135285ad.44.1754699751994; 
 Fri, 08 Aug 2025 17:35:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE33DCMAedQDUiF2/I3ZWb+fz5inLjDwdHMAuwQmrl6+a26bmnVEJtkyEOMMqC99p7LJwIB1g==
X-Received: by 2002:a17:902:e550:b0:240:bf61:fee3 with SMTP id
 d9443c01a7336-242c225701dmr76135015ad.44.1754699751568; 
 Fri, 08 Aug 2025 17:35:51 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:51 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:24 -0700
Subject: [PATCH v2 12/12] drm/msm/dp: Add sink_count and link_ready to
 debug logs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-12-7f4e1e741aa3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=3874;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=JQn53FWdqnsenAxhsXtXftYUURqXJ8dtPT1Q4jRdnDU=;
 b=UfAJZEmii2W1xg/n7I3OixqLYvkqxFi5dqufHjpIdry9W5CQqZsyJUliQA/+ckK85WtgecgCZ
 CVY9K6KZqniDV8ngdPtL9w803gnE4hUnfeNcWL8TSsh2p37Dk/WXnlm
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: C_AnJCWEQ_n7muxxqoYJ9_bmwBiP7u7k
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=689697e8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=nsv5_4zRg9i3qj8PKKQA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: C_AnJCWEQ_n7muxxqoYJ9_bmwBiP7u7k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfXz2noDG8Z9N4w
 5IlLO5io3eH2XnjXBfF7nwf2QFfjMPVSvM2uRvkNQ6Hn40SJlG8xUXxI6zl21IrYBHONw6CVuvE
 ai6oXK0zpe0t1geZ4Ehk9F8qcUqNfZKIy+8zxstbsqaMT6ZkUyAJN4819JK9mnYWUin0u/WcUCW
 oTzJA/hbXCY9zeQC/51rJp/xL25IzAo1jKw6BQ5E2NOEIObsB5W+c0AYM7/iUawgB3WZ03A866E
 njz4AjVWjiXm+tHWnXQ+VWkrcGbv+JH9GhE7vdACkbBdP8s5aW3muowID7x9J5YIUlOfB2uhzoI
 ObjTDfou1GOlxEs+y3V9/MXzhNLftXGsFhFi8kqFkaaPozOkhBBZ+TExtar8+x3dTtQz2dZxoac
 k2vIe6NN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090
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

Add sink count and link_ready to the debug logs for [un]plug and HPD IRQ
handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 38 ++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dd529942f7db..93ea623473f4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -455,8 +455,10 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	msm_dp_aux_enable_xfers(dp->aux, true);
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	if (dp->msm_dp_display.link_ready)
 		return 0;
@@ -473,8 +475,10 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 		pm_runtime_put_sync(&pdev->dev);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	/* uevent will complete connection part */
 	return 0;
@@ -500,8 +504,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	msm_dp_aux_enable_xfers(dp->aux, false);
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	if (!dp->msm_dp_display.link_ready)
 		return 0;
@@ -528,8 +534,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	/* uevent will complete disconnection part */
 	pm_runtime_put_sync(&pdev->dev);
@@ -539,13 +547,17 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 {
 	/* irq_hpd can happen at either connected or disconnected state */
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	msm_dp_display_usbpd_attention_cb(&dp->msm_dp_display.pdev->dev);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	return 0;
 }
@@ -1540,7 +1552,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		hpd_link_status = msm_dp_aux_is_link_connected(dp->aux);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "type=%d link connected=0x%x, link_ready=%d, status=%d\n",
+	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, link_ready=%d, status=%d\n",
 		   msm_dp_display->connector_type, hpd_link_status,
 		   msm_dp_display->link_ready, status);
 

-- 
2.50.1


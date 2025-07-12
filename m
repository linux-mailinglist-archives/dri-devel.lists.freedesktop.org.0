Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA501B028A3
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D28B10EB14;
	Sat, 12 Jul 2025 00:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JvtJ3mq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF45210EB0C
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:57 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C0grSb001276
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 brzXIsHemnuaxFgKGlGWJGmC5q7fHaCKN6Y5ci5Sa70=; b=JvtJ3mq5keG3hAtJ
 S++6Zgv9QIInRxQqSVkuRzN1cACQbPbAWzx+nPqub3t9a7tRHb/5pwzBc7welOst
 H/hqXh1CpgpTghBSEq/dl/uH286XyFxYYMNrVJS96V/nBgKqEI7yfAZXbIjbx2iD
 FWFWQViAYlBoegE+SswzcErnGbGVdUQQcAb+WIWqxqqUZmcBTOd0OcwjSdwMzL0o
 hJCC8ApOP6lDFA2K7dY/nFbzn9wSo+/BHo7uDw8xTJHxkB9P/COgqJ5Uo9cbbG8p
 C6ThQxA4FCafGJb5SnRivWPE+/Evf6MgM420CiPIixrLTpzsmRCvtP3/ES4cU4RG
 3T8irA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uddjr0q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-313d6d671ffso2413402a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281936; x=1752886736;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=brzXIsHemnuaxFgKGlGWJGmC5q7fHaCKN6Y5ci5Sa70=;
 b=u8I3E1oyLFMQFoBNX529D8lyj5BZcMbQUP80L5BYlEmDFDYBWEQRJQJU/UJ+BfqWRK
 4cAMUhcKYTj6QAnDNVgTEvZxMThQ/8oZ8hXwOJ2MfnHKwWbvJ28Y/V1E7Duf/etb7i7E
 T2VSV9CHYn6EbinV3/k0qQ/oo8sL7760Mz1MpDnEGnKpub+9kb9INnZNsu3KDm9TyIy5
 jkT+6baxHbuv4mFE5JDS/GnxT+RROawo/7s0c8MbdbHmMkqz5Ndmw15tY4s4FRzvp9dk
 /WZmnGnL1gj5Kfo6+Re+xFTWGA0CzyvnQMcSPxLvhb7gSSCq9qfzOqR1xl/pDuPoFygI
 bw0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp5VKhsNwRAzWOk6yZHDHCBsQaqnqs2bbxjzfQXT5OZrdlMopDmUr5ooeArCvhGqTuA7+kO6tXXrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXES3fK1ECkv4k/VP732GsynKFUZsjUeFREjgfjgQ2moTzejIJ
 2WpevgQSHTdIp7rw4tgHXZ773/ElK11FOqceYM0z5j4o/d1luq+C3Po5W8dzyP2cNW9mRSOt9w0
 OF12NgkgeNbUzV0lyIMi+B4uCu0SMSfA0kn2YIgJ0gyM7boUE9YgS6apv3z8jKvB2jhNIuvA=
X-Gm-Gg: ASbGncvQdjb4gWIWlMPI2hSB0ky20mPRuIOGHYuPs4ZtisJyPHyoiYUihi58x8+pGdj
 EwSaMPXLrLHoL1pOcLn25cyx961+AyhETHUIYpxTv221AXkHP9ijpH9gEhzsD9mtE1ZdHxL3zN2
 DIJkcbDMWJLQTRFz2aq1RZMZ1WbzNLIGkI/ypi7d6CafYsJyZoQUkcNG0hmMRRyPTQPil8x/OLr
 w4fNPR+8ogLp/+MKBmjE4U0FgRmCK/Qi3pNjQZiyXewd0em+5Aq9ryqne85loK56ozoii4qGl+u
 FHp8ggMYTcrwy0ekjtdGEslr8x0zIMa6xnWsi5StvPEiNs6agIl5YhliwEnp7hjXLvH4x8ZkbtG
 wPtX8QTIXYLjssWkxNt2d3yXg
X-Received: by 2002:a17:90b:33d1:b0:31c:15d9:8a8 with SMTP id
 98e67ed59e1d1-31c50d5dfc7mr5338682a91.1.1752281936280; 
 Fri, 11 Jul 2025 17:58:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvo9hbWXSjbIaLy6V9BoL7KWqzJCvsi54CA7ay9HQd27IGhLWtKXupp2h3sOg371TH9ZnR9w==
X-Received: by 2002:a17:90b:33d1:b0:31c:15d9:8a8 with SMTP id
 98e67ed59e1d1-31c50d5dfc7mr5338667a91.1.1752281935841; 
 Fri, 11 Jul 2025 17:58:55 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:55 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:24 -0700
Subject: [PATCH 19/19] drm/msm/dp: Log connected and link_ready for event
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-19-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=4119;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=cVrxZLsPS+6RQHt1ufzsG9tg+vHQCxscM1KTv98juZc=;
 b=FuqweivJeealXfSD8xy2eFBqVIbs56G1r5I9+i1Cn2gvrrUFh80/4K/TytFcQpIvOJpGHGp+J
 QErTeVZWORFBk8y5k9LYBtXb1jKvneKx5O1SPg+6mgQKvSpGhB4WYQ7
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: 8pe78OiFB1HWhCYgYF67jv9DpwFt7q5v
X-Proofpoint-GUID: 8pe78OiFB1HWhCYgYF67jv9DpwFt7q5v
X-Authority-Analysis: v=2.4 cv=ZPrXmW7b c=1 sm=1 tr=0 ts=6871b351 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZRSb5Y5lcQKK3ktpWfgA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNCBTYWx0ZWRfX7WowXzIfxG0/
 VsCqQ3fxRJwkhy5caXBB8iQDj46sfOj4JlzAcNNi3m+fr/mB0kgKkvarBuHdtK5Cqm84qJ0n3g4
 4FNI31jN7FhrECOKyiz04vHqikGqsEfu5/SYlbESKyG9GdEnFaVaxYwu+CVqNLbOt8qDbWquE+3
 PHDGLD+hi3zQ8fU2rNc7T63+F8OdYkcNRgzJXAtk0VutMqLK2CpQB1ocYnjey0w+0pKSw1mGJaQ
 gzi754W0U41tRfSBRFpB58ix4pIAR05H1hM4/E2Xamea7lgZr3kHwKANI9KL5uaZ9fGTSEgTfNr
 QN9V6FzE3CSMnkjU0AxY8+AW9mWgifeipJb+0qmLT/at8rl+KSd5Hj5Bd7uCdLSExIhGacBxq8T
 wbRiKVnmHIQCeNU7kGWnZHLc0Mhk5foTuUeJAQvzNExHAC5ZV6p7owftt4j7VXF7xYm6bxCI
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

Add the connected and link_ready states to the debug logs for [un]plug
and HPD IRQ handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 38 ++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 32e1ee40c2c3..6cff87e4ad9a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -543,7 +543,9 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 	rc = msm_dp_link_process_request(dp->link);
 	if (!rc) {
 		sink_request = dp->link->sink_request;
-		drm_dbg_dp(dp->drm_dev, "sink_request=%d\n", sink_request);
+		drm_dbg_dp(dp->drm_dev, "sink_request=%d connected=%d\n",
+			   sink_request, dp->msm_dp_display.connected);
+
 		if (sink_request & DS_PORT_STATUS_CHANGED)
 			rc = msm_dp_display_handle_port_status_changed(dp);
 		else
@@ -562,8 +564,10 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	mutex_lock(&dp->event_mutex);
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d connected=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->msm_dp_display.connected,
+			dp->msm_dp_display.link_ready);
 
 	if (dp->msm_dp_display.link_ready) {
 		mutex_unlock(&dp->event_mutex);
@@ -585,8 +589,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 		pm_runtime_put_sync(&pdev->dev);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d connected=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->msm_dp_display.connected);
 	mutex_unlock(&dp->event_mutex);
 
 	/* uevent will complete connection part */
@@ -615,8 +620,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	mutex_lock(&dp->event_mutex);
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d connected=%d, link_ready=%d, sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->msm_dp_display.connected,
+			dp->msm_dp_display.link_ready,
+			dp->link->sink_count);
 
 	if (!dp->msm_dp_display.link_ready) {
 		mutex_unlock(&dp->event_mutex);
@@ -641,8 +649,9 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d connected=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->msm_dp_display.connected);
 
 	/* uevent will complete disconnection part */
 	pm_runtime_put_sync(&pdev->dev);
@@ -655,8 +664,10 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	/* irq_hpd can happen at either connected or disconnected state */
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d connected=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->msm_dp_display.connected,
+			dp->msm_dp_display.link_ready);
 
 	if (dp->msm_dp_display.link_ready != dp->msm_dp_display.connected) {
 		/* wait until connect/disconnect handling is completed */
@@ -667,8 +678,9 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 
 	msm_dp_display_usbpd_attention_cb(&dp->msm_dp_display.pdev->dev);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d connected=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->msm_dp_display.connected);
 
 	mutex_unlock(&dp->event_mutex);
 

-- 
2.50.1


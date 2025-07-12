Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5242EB02897
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7DF10EAFC;
	Sat, 12 Jul 2025 00:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6SwqmYO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDE110E3DD
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C0hXNF003251
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X44+EY0MMh66SQSLKZsrsjmtnAL6ZSI0nRwBgvyoyyM=; b=Y6SwqmYODZD9Xzw5
 CWZBlVJuMXC0j8tdCk8R7xlovwGem/qAUpGMSmnMrth4Hm7/muGdF/bWLg2zK85k
 QXQ2kqyxqj/RUJM3Hsrhp8jhDF8Pgd6gBregEpR0StAqeWGCRjXu7XEB2xJYD7Uc
 GTX+Wzi8rCu2FAENHpuunGheD+fYz5nTDtlXCYm0RcNGNE7qhLfBYE806kN5KFgu
 EvD95Tlz8HFge58uUEtaXNwf9O0XlA329r5HPdmIrJuEe6k1tAG6ilg+U8Bmw3WO
 aX/m4lBeUs9Usm0S5yfC4gOS/powQ9sjWoVWjc8EiQHRzuiTW2BVZwr4tdf1utWj
 q6bF4w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uddjr0p8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-313fab41f4bso3598850a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281927; x=1752886727;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X44+EY0MMh66SQSLKZsrsjmtnAL6ZSI0nRwBgvyoyyM=;
 b=sEXjPOnFlAz7XxYVwDHk5WBLdvvLsr2xmgaUKspQ6axrEXAog/Llar8eXo32Xu7x8J
 JszTgYm18SwjkIKhTfsvW0dawoAZ6VAH7mabW52qHpwI1EIs6RSQ3qpY4+koE32+JYcK
 0Aa636sKvFd7ZYUjL0J3cQfCWuRXBXKpDDI0hRB7PUoBtH/gX6fTgGJOZ5r1Sce35A+v
 /X617k05c1JD1iKt/ijr5piyFbElZ13+CIMK+cfxuql3ASbjJ7SfjHHxkRp2q2Jo1eGX
 z1R/+zbMAiiLZ9Lh6bjsmd445q5BwXP1hKEnheR3ZFjAKb5ikF2fOIel7OlFEphXvQAH
 y4Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaEL2AZ5oY7NQpG4aZr2MDQ+7e96ugb8n7vBCIzsTbLmJJHfPHfIhRKyMLDDjFH9VEFyD4cXY+MWo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTdzyPad/C3t1wXoIkxCG4rtAFEpVVUpvK+j4CUrZ+kWQiXEu7
 Fqe7seJrE2cWh0KCPIE5AmgkgSZtnhxErVjaleXxxXa7lIvX0LA42BUV4bZAlORFsCkorFRdwQB
 YhWJHlI49TXqzLlWWiBlJQw4g2/MWx7eVz9Pprb5D5lplEmfxjbe1mF5N8T0/iNUVvWuXF3g=
X-Gm-Gg: ASbGncvH/J3H8Wnfw/CJokJS6WC3LVMMvhg+rBYk7SlcfL35p+pa+4wT8s7Ole7vkgB
 eCdImsEmnkoTnFGzcbfbQN4jpnVZh9Eym9vx0b/TZtK4AYCzDjkwRKJHjclPdkWs2gak1hHmJ2e
 pHrG8RChYAFbevraUGO0MxCASFmcO1wtNh0X567gXwLX81eRTIuzGX5h0EHErDyOjwfNYBAP20y
 7Mzo4xMiE+fDI23pm1k3MesRQuR3G+zg6O4Rs+5Qg2+5ynYN493qnXTSs4WIZhqx1FH7P5HV3ek
 gU8biWfRKCp+vk1exE8WztdW8hCt+AwKy4dR85Le6HpJoG25gU7baSamGvkR9tk1SdhtpiXsiZl
 xHNqQxfNGZckNCzDAu4bkqsTc
X-Received: by 2002:a17:90b:2790:b0:312:1ae9:152b with SMTP id
 98e67ed59e1d1-31c4cd04544mr6586939a91.23.1752281927151; 
 Fri, 11 Jul 2025 17:58:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEoLPLd8me4X8XPt7V2tzzU0N8EU2ZNyg5wcTau9plhMwtdyz+45J7Cbb8YmssvpxzQ7F9HA==
X-Received: by 2002:a17:90b:2790:b0:312:1ae9:152b with SMTP id
 98e67ed59e1d1-31c4cd04544mr6586918a91.23.1752281926709; 
 Fri, 11 Jul 2025 17:58:46 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:46 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:18 -0700
Subject: [PATCH 13/19] drm/msm/dp: Drop ST_DISCONNECTED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-13-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=2475;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=fjQ46wtHnJ8FY9wdYiHjF2udiecElMVze21Qux1/Y+0=;
 b=a2mpv0CIxX8rOFkYRUChcCtBBnHir6lhM1QupbemCr+UDu0A66v5VkIgBVwZWzeDdtz17c5GU
 dW5pQKU6HxuDR5Yv3N1+X/l+jAuAB8B+XMOvGSDmTTpKCzIyi6hChSD
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: 1VtrlTtYG1fDAw4P34heSy3EG0DbYvT8
X-Proofpoint-GUID: 1VtrlTtYG1fDAw4P34heSy3EG0DbYvT8
X-Authority-Analysis: v=2.4 cv=ZPrXmW7b c=1 sm=1 tr=0 ts=6871b348 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=geG2uR4XrXNgRqKXHj0A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNCBTYWx0ZWRfX9F1Gc8gBPE42
 /kg2Onn8tVJhFkFTKEaFy+O7s93xiTkeIVj9DZ5Gp2VeTEQ/6FFrRCv+YMw+w2PLJBRjD7hBmWe
 AL9JTOLMt4ef1zl6judlbHwPucSnx0tP0iYBNj41wtOxORbbst2Hu518iWXe9l91g3IvyJcG7VX
 1LjrTTS6MlNkP6CfxaRIujzCW3RLrmtNuZcxUAgLWPGfzPy+ix6ET07/FttCoL1EtqI4BM0tb3N
 qQdn7n8W30JYb5THGkqLmbBljKMLJNVtEMEgLgy4Vx8tQJnnoA7CCJnTYlVIizNlUdN1SV57J1c
 rl+gP6jLSMJZvKPPqWYLNl5v9DvyJ5W3kz3m6G7NNw9wOZE99BF82vi7urYTpQzG+tlpOgSOy4s
 mNXjBYfbMqwlEe51VCapM/122YUUYeNaprHvi/RIOO/lsT1TOcyxZ7pXpBjKun3K5CF0G45b
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

Drop the now unused ST_DISCONNECTED state

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5efc8d4ecf54..dac5078a849d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -45,7 +45,6 @@ enum {
 
 /* event thread connection state */
 enum {
-	ST_DISCONNECTED,
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
 };
@@ -526,8 +525,6 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 	} else {
 		if (!dp->msm_dp_display.connected) {
 			rc = msm_dp_display_process_hpd_high(dp);
-			if (rc)
-				dp->hpd_state = ST_DISCONNECTED;
 			dp->msm_dp_display.connected = true;
 		}
 	}
@@ -608,7 +605,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	ret = msm_dp_display_usbpd_configure_cb(&pdev->dev);
 	if (ret) {	/* link train failed */
-		dp->hpd_state = ST_DISCONNECTED;
 		dp->msm_dp_display.connected = false;
 		pm_runtime_put_sync(&pdev->dev);
 	}
@@ -669,12 +665,6 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	 */
 	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 
-	if (!dp->msm_dp_display.power_on) {
-		dp->hpd_state = ST_DISCONNECTED;
-	} else {
-		dp->hpd_state = ST_DISCONNECT_PENDING;
-	}
-
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
@@ -1628,7 +1618,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
-	u32 hpd_state;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1643,12 +1632,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 
 	msm_dp_display_disable(msm_dp_display);
 
-	hpd_state =  msm_dp_display->hpd_state;
-	if (hpd_state == ST_DISCONNECT_PENDING) {
-		/* completed disconnection */
-		msm_dp_display->hpd_state = ST_DISCONNECTED;
-	}
-
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 
 	pm_runtime_put_sync(&dp->pdev->dev);

-- 
2.50.1


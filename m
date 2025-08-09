Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C05B8B1F18F
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A30210E9A1;
	Sat,  9 Aug 2025 00:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+SL+fuf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5F110E993
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578FPMVu008394
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1hdCfTP1N1Lll13RFi4QL7o8c/WBGzlCEwL+AMYyzJM=; b=E+SL+fufl61vfuki
 fbXAWnPJNTGbn1TtP32D96aGYWG66TAvIz1ls1heHdVLJhJ6l1leMvSqBGe7l/2u
 +ANgQoqNvvFNAsy0Pm3lHdb1UBsy4Sf8h+R24sF5VbNtQDlw67ZGZdu1QmidD3br
 vjWQ0N+H61kkPE3tThVmZ21ddln1VstzvLQaExVJJOMup4G3nNywTVOiNL8Uq2tP
 bx3R91/G4Z6/9474W9SLawl5Hvyw0WSeN/OdQh01jJUTJLb0NbKZ8Kkj7ZCBroa1
 MWVjTlBzNLeU5a/UW71dGOw6Ib/RR0lozSXh2m4Xg286s2pWr4qx/Lwkr5LOPpuh
 5DGmKA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u28k3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2424aaa9840so27559875ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699744; x=1755304544;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1hdCfTP1N1Lll13RFi4QL7o8c/WBGzlCEwL+AMYyzJM=;
 b=NxZ2gaO/VmTFiNmLoXmvBHdflc7maN0Q/IYHcs5ku0TU6OLXo49IxF1dhDLKFs2kz3
 vEV8RB7FPIjF621fJZbOSd8U7NUXCzwstPsfzA/jhTD3IdTcLCd+jIVpi+ev3EoKDmpp
 A3g/6k/Vl8xVtR8miEc1ycrUtZCax0Hc0cYAfJEB3384hCZ49+l+L3ypdCaUZGZFwGn/
 Svjg4/H29rfP7hbQxmNKjMWd6OMFFqcXHv/JiyLvH+XVH7TFeh9YYq+2/wu+2MkFFDtI
 aUxWDywr4UmWRCClW2j6zSueoroM4nvle3QIel9n28KSptJfWHsFjSpQJ2QwL5SkEkH0
 R/wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX2MxoN7LUbwteK4sORBSRcDoPe7QwRwUOkU0nlMjK7iavVAdbN7uEd4jqJdbD+FnfyYvxe+HeNlY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTZQNxb2ThlgavNjo+BEk9gaLQwHK9S9NgsF96J9DAFGgopfJz
 /Bb94sFNxYAtcSdtrEhwh6evAUkPON3Dw399LDshwCMw6jGTlLhegA+pDFQPTMTZTGkPUCdSh0t
 jOf0T494ozUjDqeZthAJhdademmxVDX45dEeRBbCyanUEat9/yjGAxwz5sOPNAMSDmOJUZz8=
X-Gm-Gg: ASbGncsiSUVBl9fuUwSvF+2oIkdz5rPs6sZKulYjcZ/mqRPbRfBPzyckd1g5+d7vL1J
 w32FsCrMJ7RDabKaVI5GxTzje9y6wh1GZQgO4fJiEXenrFCCtvroZjbOeBPb7IG2R6vnuW85Y3g
 YPR0t4ydcHRAY/E2q2gAq1h7C7sANt/4EQcjJdBAveEiVue3k87kjR2bXeEBxEh6vdkYM1dmB55
 eX6AMgGC3ktWiNwHg6DUshacSIhnVakwsgd9SyGe/KW+N6RPke+nfjWft+t2i3rhpvLByf9iQiE
 G5WRIn49eVRb0Ijr7nnpVo/kO5qQDKfMguo8sK0srx5nY8WXIrnHLjieKYTrO1iiSF1ORBx5JHT
 4jWtxJnx9EhE79+MX5TTZ1pO+
X-Received: by 2002:a17:903:1c9:b0:240:e9d:6c54 with SMTP id
 d9443c01a7336-242c2271e8dmr79853055ad.48.1754699744039; 
 Fri, 08 Aug 2025 17:35:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiff/ThYc6UuyZtbEXTBnN49IuMPgSQgl9gfWHA+0K+TeLvuc4b9uNZ9TWhJt8aKuTgT0LiQ==
X-Received: by 2002:a17:903:1c9:b0:240:e9d:6c54 with SMTP id
 d9443c01a7336-242c2271e8dmr79852665ad.48.1754699743574; 
 Fri, 08 Aug 2025 17:35:43 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:43 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:18 -0700
Subject: [PATCH v2 06/12] drm/msm/dp: Use drm_bridge_hpd_notify()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-6-7f4e1e741aa3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=2470;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=29HYP/DXnl5EwK/8eh4LDOHT+urC513pYg2fM9mWL2U=;
 b=hUDrHjRGa0KSwFA/brYTaqQ3aB1uEyojqFJUPg/WEOdZZ0zMPAQBmtvg12Q6ggaRIFRwqN2hA
 NgI6QAvH7kCA9iTY0rUfx519/9SnrO0gy/ydRL5EGu4CCUm7Fs+e6Ka
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: ThWy-eBNr4fYnFEUEnHpipMyDxNcCUg6
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=689697e1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vUZxlgmVQAOzQBO0PGoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ThWy-eBNr4fYnFEUEnHpipMyDxNcCUg6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX/AUUoGkLC5r7
 xPpuclAl1Osf5jRX5HaiXInPvuxr3H4pQ8fbM+laE6cXzpyavXfpG+Heftl8P391jnIcHrARtOS
 EwneABWvGqS/1l/dT9JHm0gmauoPwN6np3z5mLPOSbPx23pq/VnARnwY2bPEzRK/hL2WV8CSUgi
 8oMcJ06OarUhRLFWiLtDakhPKWuCtSduoBh7safEVtnq4o4M/TDEY3TQuMdk3+jCLx8ELHmkSmw
 17pxLPHZPFYKAihdaShphVGVgT6q3KgIEvO9vyuqquARdxp9jE72wMCn9g9BP4ObonkM2xVfyie
 jnChCdhAinkRE+Tiq5GtpT/zZIxAdhcfxdNI5XEaqyHuFeH9uAl+FvGGFevgifbtI8YhL15ocje
 WBlcorg1
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

Call drm_bridge_hpd_notify() instead of drm_helper_hpd_irq_event(). This
way, we can directly call hpd_notify() via the bridge connector.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 55fe8c95657e..8779bcd1b27c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -333,17 +333,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
 	.unbind = msm_dp_display_unbind,
 };
 
-static void msm_dp_display_send_hpd_event(struct msm_dp *msm_dp_display)
-{
-	struct msm_dp_display_private *dp;
-	struct drm_connector *connector;
-
-	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-
-	connector = dp->msm_dp_display.connector;
-	drm_helper_hpd_irq_event(connector->dev);
-}
-
 static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
 					    bool hpd)
 {
@@ -367,7 +356,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->msm_dp_display.connector_type, hpd);
-	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
+
+	drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+			      hpd ?
+			      connector_status_connected :
+			      connector_status_disconnected);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index cc6e2cab36e9..60094061c102 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,6 +16,7 @@ struct msm_dp {
 	struct platform_device *pdev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
+	struct drm_bridge *bridge;
 	bool link_ready;
 	bool audio_enabled;
 	bool power_on;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index e4622c85fb66..f935093c4df4 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -340,6 +340,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		}
 	}
 
+	msm_dp_display->bridge = bridge;
+
 	return 0;
 }
 

-- 
2.50.1


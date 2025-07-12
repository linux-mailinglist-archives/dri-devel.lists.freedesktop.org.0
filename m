Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B921B0289F
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4F310EB13;
	Sat, 12 Jul 2025 00:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iuGCGBLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F2610EB04
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:54 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BNKd6J029941
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hfqgXTQcuvdD+oPZQXvpnC/A02zcRDZ028wqX5sH15Y=; b=iuGCGBLdAI+QG2tw
 lbDd6WMIWvQ/E1JxIK5MPbRReUyQSmYJjqXCz+L1EPUTgXwz6owUkbAwmPYrqhFe
 klzw9sFCc93p4IWbOrI2MO2mJG5WTjx/bgIWLwOU4b9iEIije/BBRBjseS+VxrHS
 UZhqVDQQLoVMs9W5mwLw5cgm15lz1cH2Km1q8NPCYvqT5krP8+dbCoUEkeD5xA5H
 Qw0QnplsfEa3kxcfegiutzRkv68YMSMjTfLouNIIrNG281eQ9o5hjb2lZ4l2wPbU
 Fyaiwdi1/zouVzCJfWEWqyj0k7xVuvg6AV095vmyc2NtiK7HJl8W6MrmOBeKmgDT
 kBxZ+g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbet99m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-311e7337f26so2663507a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281933; x=1752886733;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hfqgXTQcuvdD+oPZQXvpnC/A02zcRDZ028wqX5sH15Y=;
 b=OwqOC0ZvFpawVPGD0/xD1Ydv0l6Q96JSVpU1WqVtD9ZkYnqafxwnGpbDslql9dqW2v
 9IkjGZjvk/iKvk85xCwXBhuWHLKGV4yHBreQUFXOTRSYEMDCazRZ10u4uSdCWFtbDF9o
 HSoBttS7L3QQOPrJc/XRn6iXV5na7y9R5gEiAbgeOzHlRXJFdM8petMuF2U+SUEXlo22
 2DnaEydfAR667zJAa9WbzCOX5OuE1Udf1+srY4o4N5y46hjd/ErV0hD6UU/SWZGjKsQM
 GiKDN4Wf4ZbUgRT8ARkOLg5OyPew2RDqgumrdNetGVOT54UvlonSDusJ0DzLWoLfGhCN
 Z52w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJeU0EBUA53vtVljS0qI9mpV0QhwSnfou/UZLJ8k7bMiVC77Vmi961/bC5wlBAabRFez5szv/T2x4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHcvaH0EYFpbsWdL1WvYmXVCWzhWHIT4O5YvRJ6z1qB16uVppT
 TOkCtAyfcTmvnn/obZRoz8KpMXNwlFXwdk21pdePc1oLsGBFsdKtX6w4RYtxqJz+gKZPJB42UX9
 VhSX72y5qTIg8iNnXyoA+Y7FsU8Oj1HUd+y3sw1x1ArIUN8WKDnQxgGVmd6GHvyPGtxVMF1A=
X-Gm-Gg: ASbGncvyBgwzCS7my+oG7n+WOn+UiTizIIusOtZHwx8o+om9roiefT8BIhjImlvMkJc
 r1Yug3V7GLu5N3jwL0TmibUYosrE1QCSGIhcldt7FgGMi75Zt2KA0NJCEQb0WAg7+yqWz27zFpA
 4KCBBXyw8xoaY8j2uwbKs6zpePJtm9M0uvRA3kCOxC/Zr36m66SF0WIFmN2+L/Wx8aubYeUDvcO
 o+z+KDMiH0pEged8nRsjykUMMfP0AXH/0PcgYKzEo8llcD2RtKQHCIYWZlJw6dSCwYuvMhJ3YIG
 esM5U9ugygbIeBWvTIsUOzFpYEiH7mAqJ6B/TlZZldFINxprSRgHoHtB0RmN+h4EHhquoMKk9HL
 8AvqHX1GonCDZbPMC1WYIwox+
X-Received: by 2002:a17:90b:2708:b0:311:e8cc:425d with SMTP id
 98e67ed59e1d1-31c4ccc0e50mr6907465a91.10.1752281933210; 
 Fri, 11 Jul 2025 17:58:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7/uPvxLktYrM8ch7LnXCoHhYeFgjupJmhBcRiyeOoV5Mh4IxsfUoFBcoS1rpfP/X9mTjmzg==
X-Received: by 2002:a17:90b:2708:b0:311:e8cc:425d with SMTP id
 98e67ed59e1d1-31c4ccc0e50mr6907436a91.10.1752281932809; 
 Fri, 11 Jul 2025 17:58:52 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:52 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:22 -0700
Subject: [PATCH 17/19] drm/msm/dp: Use drm_bridge_hpd_notify()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-17-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=2506;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=Nilu1E/giHkwBPy/wf7h3OVA7PlAAogAgyPHnfWsq7A=;
 b=zjvhshEsuNvdL2MGy3+vIib7IJ+dS8vv6SU9gQtMA5rPdCA/RooUYT8P7do31i9ZOTW/XcJkd
 FezTzROw+JHCyUc0ytOAv+OniLISzTxmQR4B7pMZtbqSrFb4edr0pQ1
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX9tl89+eCGEh0
 x0we7c9GEfuenQ6Pr9I+uxo+8dNrJkpjEevfUIv0naOsZ7466hfFy05IOaz4WDOoha2YKp4ZH/i
 Dvwg2EHCrFST6PHb5k3JZWKiDx+MeDz6nU9ltStV1qrkvCVNPBARmtDqt43k/so0TH79iJUk+Ye
 XK8GDwf8R2zsRpm0P6qX2+2fY4XpUokClzWasSZNSgGYRWND/cZe27W3aGnS3QmLSTAwKT/fzuE
 m6TGTC91/1KBQffinmwOTEgYJiy4rbptNLRbc6wDwveH6A/apPP0geKWXJQgHsIJbxJrw7a6K8N
 q4o63TtGz+Hwp6f7ql6bKlzBifXXq9X19R31IMPacnW187UZQ2K5KWZl3Rn0Tsnc0Rk7rIAt9xn
 idHhjc02YnVFgKW9nVy6tyJBtyxwp5FkrgCybzLAY72E2mZ7RDhBEju0DQKEifxpATzdzNWN
X-Proofpoint-GUID: fBOZc4bag7V8aCAYFFoMHBc147YQPQ3g
X-Proofpoint-ORIG-GUID: fBOZc4bag7V8aCAYFFoMHBc147YQPQ3g
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=6871b34e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vUZxlgmVQAOzQBO0PGoA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507120005
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
index 3aaa603da4f9..87f2750a99ca 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -324,17 +324,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
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
@@ -358,7 +347,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->msm_dp_display.connector_type, hpd);
-	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
+
+	if (hpd)
+		drm_bridge_hpd_notify(dp->msm_dp_display.bridge, connector_status_connected);
+	else
+		drm_bridge_hpd_notify(dp->msm_dp_display.bridge, connector_status_disconnected);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 68bd8be19463..6e12694d5a64 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,6 +16,7 @@ struct msm_dp {
 	struct platform_device *pdev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
+	struct drm_bridge *bridge;
 	bool connected;
 	bool link_ready;
 	bool audio_enabled;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index f222d7ccaa88..b12a43499c54 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -358,6 +358,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		}
 	}
 
+	msm_dp_display->bridge = bridge;
+
 	return 0;
 }
 

-- 
2.50.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051E2B1F183
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABC710E208;
	Sat,  9 Aug 2025 00:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="INIUqQF4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAB310E208
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:43 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578EptR6018676
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kXOtZj4AG8lm5vvINjpaTa4etK/yY7fA6vbU8dIkBcE=; b=INIUqQF4UXhK3SDP
 GO1CXtEMfLZ+Ne58RgutuB9EckctL1e9qnrhGKCqqnTNNunahUGEjjvCEuRURzWR
 gVPhekfA40jZs6PX6nkJNTpTorueSx0BWIYuTJwwRXhdqP7zR57B3QfhOU7TcN9Y
 M6g6R6S95OHvlY4j4RY0sFV4etKUxiDfXDr/l+s365Qy8qd0dmyreD8APc1GOF4u
 M+Nx/MmzHKpLBTtAvGqwMGT9u9v+cGYi5tj+QnavJV5il+q9Qr66bvU/vVKgcFz6
 6vL5a5/xWBI2nd0hUBleR+gErZrtOP3AqwJAO55O3frzCq6dBS/F2skGLR9Cr/Mw
 J1q1Cw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8kjgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-23fc5b1c983so37978935ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699741; x=1755304541;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kXOtZj4AG8lm5vvINjpaTa4etK/yY7fA6vbU8dIkBcE=;
 b=eaV7fuRQKNlTPslAtKRgfIelbs621q7nrpZaqX/qm62MJIzZNMkVIVLlM06NFlzzqs
 uMlw4Towb6ihJK+vXGKpbXk02Z84HzJ4T5ErN/CK6bitI/HrWJf3BFo70tU6pPdRQSok
 W1fxVzXJzJyntFPXhjroMzBskwtdrSxt2ssxdTApR7mCUi27t4p8wngnDOHkENAQ89Dr
 soFizK8ZmMtzUBJb0ldWRXC8xwkifObFnL4y7B9KiYfdr75XNSRuqKPRVLb5gVe636QJ
 PYTdIFgsIZVQ0KrGl0t1kdQpjDytAHkkDiVB/v3G/UvLaiGkTM8QdTi7TDToGtAjC28m
 MQ4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmcJmq/YhfQp/0nbDp6/q7v6jxaF/Ci9OBmNlAUoJc7jh4gUinwV+AkuKVaIdK9J/l6nsfZUMqtmg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXn5mPr3YH7ZwRThs4VO5qRzBgQAmGzwzVJ4KUsY0nMT7qKT+2
 F4QbZeQ05Y5xUQgSAKWWYUpqtXs6qSIYw5ZcxrhBhMBhzYqYVRAli8zvpEXY6zF5kSs2lOKvU1H
 PCaIRTSKrwyjR63JWeJfm/0jPMXgpPbB7gGBwZrWHDU/WYL8nZalu5uuHA49trKAP6c16R1U=
X-Gm-Gg: ASbGncvC6BYoiIH/DwbdsKLRq3DlTUnACkVBFE8rbvOTtuvlSeKzoA50okOaZakT7a3
 JtMC20iBvDlRyDpbdpX540fePKkNYEwk23NyagJZoyBiW3haWAADL8jpSqGTwHEa3q7Wc6vjYb/
 8IPJ46azBdldFneCeu6+ZfG7XGyxn2gzTC2tX9y/wpyLrBfoonzNoJmHMtJH8/K2t8Efxaonszv
 1x+BWgBgvBxJcRf1ua+vVwnDU3zCPBjSYB64d0W402ZqBn/qXvpNy0ed6k2K936Cu6VlGIxT7xk
 Bc/jBf1nENZJnuTa5uTNHQljUorllKZ2vjTuURnuzx84sVLsJglyboM7yssf6hAOJJ7LiDjA2mc
 yVrNWoV+PeouqJabqZf2OA4OW
X-Received: by 2002:a17:903:3d06:b0:23f:b00a:d4c with SMTP id
 d9443c01a7336-242c29cdd3amr60381445ad.2.1754699741448; 
 Fri, 08 Aug 2025 17:35:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDyEuI8cudsyGtLHsEqiFHexgdl0zgq5jG1/dngt6evbM2Zkgpc/LBc1GnzKw2QMS85nXS1A==
X-Received: by 2002:a17:903:3d06:b0:23f:b00a:d4c with SMTP id
 d9443c01a7336-242c29cdd3amr60381135ad.2.1754699741056; 
 Fri, 08 Aug 2025 17:35:41 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:40 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:16 -0700
Subject: [PATCH v2 04/12] drm/msm/dp: Move link training to atomic_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-4-7f4e1e741aa3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=2088;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=58pz+VUOHj7Z0Ly24ZItrTkzzLlWR66ogd2xqPyF3A4=;
 b=eSNm82PX5XDbPsqU0qhNfwtEkv99SM1nnMQfbj8CUV4Yiqt32zqfug2mQbHMfdphj2pXeeZq+
 a5+8ZGyjM2+Atpl7P0zmlxH63kdl24dOubtns2aknTDjXqXQGWkE6tQ
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: GrmkvS_fTVlf_1M6cANeUln9_wv2nRFM
X-Proofpoint-ORIG-GUID: GrmkvS_fTVlf_1M6cANeUln9_wv2nRFM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXxoeDjdb6RvqO
 zCfRQEtPmxam/vV4121LiIsYcGY2joCBE0yX0qUf/tHeCtQcvVvI9ImTTxBixcuuaRCEoDn+sDD
 AhZJHjjUea8Skb/ha7+DEWQD6AWVP6bIKKb8eQecCigdt01rsrCGEY9VN3XqzAms0hb4G+s4N/m
 s4dT4HpDuR7D47DDgFjVjByUhj0bvFlKG5WWWhFqUfoc8jTur+pJ24rSv4u81PjxpkHDLoJcVUD
 Qc2/09m/060jgVcdHIFuCdihWtBABWOlYeVVNZKYDqwBn4U3Khbe4o3Ht1mCpr2uHOsJQLj90uJ
 h+fR9n6Q06wMI4sG0rrGjNK7yglBEF+ToyWJypk35PHE2yBJTlT2+1W8ImjYt3U/LiBXz9Hp/Um
 Tj+3Rk+v
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=689697de cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=3k-UeYenDjfnnxpotcMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
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

Currently, the DP link training is being done during HPD. Move
link training to atomic_enable() in accordance with the atomic_enable()
documentation.

Link disabling is already done in atomic_post_disable() (as part of the
dp_ctrl_off_link_stream() helper).

Finally, call the plug/unplug handlers directly in hpd_notify() instead
of queueing them in the event thread so that they aren't preempted by
other events.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e2556de99894..c849befe58f0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -427,11 +427,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
-	if (rc) {
-		DRM_ERROR("failed to complete DP link training\n");
-		goto end;
-	}
 
 	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
@@ -1680,6 +1675,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		force_link_train = true;
 	}
 
+	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
+	if (rc) {
+		DRM_ERROR("Failed link training (rc=%d)\n", rc);
+		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
+	}
+
 	msm_dp_display_enable(msm_dp_display, force_link_train);
 
 	rc = msm_dp_display_post_enable(dp);
@@ -1839,7 +1840,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		return;
 
 	if (!msm_dp_display->link_ready && status == connector_status_connected)
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+		msm_dp_hpd_plug_handle(dp, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
-		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+		msm_dp_hpd_unplug_handle(dp, 0);
 }

-- 
2.50.1


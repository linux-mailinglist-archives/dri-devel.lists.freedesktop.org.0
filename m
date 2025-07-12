Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CF6B02883
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DBA10EB05;
	Sat, 12 Jul 2025 00:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ln+md+AC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2623A10EAFC
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:36 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BMwTsY021762
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ryoqGXtctirqyVRL8pk0u/4G7vhZPMGpaQDhA5RozeA=; b=ln+md+ACLNbx7tt8
 wl+q6ie2LL5PSy+d8lnu92wvI7JGlTo4MnSkiUW1g5yyG0uNhGfpV5A/JQL2C119
 0xFYSgiOAxK3s22rdnEYP28TrO3ghZd4tbt8pXqy65sCzBTXnFCBVucoQoIsybin
 OQD9g6FrzsC+QAiPkykk3j5ew4o7ykyqCvLWFatoZEH8UChrnO3/uRVO96vWRW83
 ckbqR5s/ZVBSQBiSFCfKlga4X1Kdz8N98avMCItZ9yT3C/GcaC+oX4zU2WIrya4f
 RXoO0r7UGfDH9dRkC6WAq7Mh+YMGGg56nRDNxAh1YM9kJpCtmOfJ8V3iw+EbybGT
 qOE7gw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b1b8rb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-31218e2d5b0so4614149a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281915; x=1752886715;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ryoqGXtctirqyVRL8pk0u/4G7vhZPMGpaQDhA5RozeA=;
 b=fgLjk3sBU2fZ8gSCzYWAMwiSrNUlD7urWYbcgtMlg9Eouk1mfFtwOpYc0GsQ7IyW2H
 oBSItcMw7MrFZa2OaSQulVNdY9BDgxkSULannyjVCDBWAg6qZqJM4/FwfUhIkbQuTeL6
 ZlEa85yVG/UtdJaJrpMRm/x51/XYveE2JCXNr9RAaRRTzHhffTUPHHnK3XBTdiYm4GsO
 C5s+Tj3g99OHqb+c64CkEDrJru4dYipVSrZ4WjNXNyq1Vn6ikLb5/9yakjtC/ZB5BrSC
 QTkP1KOmUmEH3TosOrmbRc/Y1pSA2O1pxkYJ0m12RHjFexKTsTyZzoU+b5wJ+KSxGMLa
 ZQeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlRAMl2R6zr3OtlcHv4VvY/31c3tOrSQdic7cJIUBkKRTNRuTW2PTtaJ5oSivBi+a0isZySa6Voxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlGeyRWvmmxq+g9DXcf+H00VkmnQSQv6ZOa7NP6aD35X1lqfdi
 AYOSSINFz90QI2gpvtZYBrJcxSeCWBIxwFvbk+Cj0cguqem7X6lNaHYPaW/oU+gmic6/rcxPGZs
 KqTwpZZbrwKCcEIV558Y2X6WQs0XXezvenqnJVazxVeBiCxKy5nofoQUSLMACyruKGWgOAo4=
X-Gm-Gg: ASbGncusGXT8/PQIQDXauKTGGjd7t17pcq2A5q6ntcGmiX9m92F2gkU+Bnk5lgjf0sc
 7RU+28cPXoOTIREtbixBImY5e6/xkOOgwZVRpOhodvxIy/bwgQ3HTjgE9KZt08bBaV27reX2XJ7
 qwh57nL+ALIkfQ7h55y/tzfWiLde6prd3eEp+yusFt1N/SKeLWxL1JdnVqNX2WmnYC07HKA9S8J
 1tiGW7dJerqt5QO+YPG2FcCHqGoOZ1KtaONSnsIxHI0pHojSOiPwYvrm3fBYQ9uEhJLrXgmGbg2
 XKK9aKnHAUJRNdYWWQjRZG5KOJLJ8+m8bE/s4r6lbpLG5aHA9GuIIejcf07KS6F4UhfHhmp6SkC
 S7LIPcY1E8fUyO0hmRn1goAVS
X-Received: by 2002:a17:90b:33c8:b0:311:baa0:89ce with SMTP id
 98e67ed59e1d1-31c4ca84837mr8607941a91.12.1752281914612; 
 Fri, 11 Jul 2025 17:58:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHplGFsynCElwr1NRtQ/5QvHwKSH99tFLnrjAvvHtqqe/8u//qvLOUQmeienuhgOnqOhkIqZQ==
X-Received: by 2002:a17:90b:33c8:b0:311:baa0:89ce with SMTP id
 98e67ed59e1d1-31c4ca84837mr8607907a91.12.1752281914132; 
 Fri, 11 Jul 2025 17:58:34 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:33 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:10 -0700
Subject: [PATCH 05/19] drm/msm/dp: Replace ST_MAINLINK_READY with
 link_ready in plug/hpd_irq handlers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-5-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1996;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=gq9e9YDqbV92vcamNHfqZWNsHHp6f5oF2jcxHG6pcRo=;
 b=o2J1CD/iJYB4JR8o4EtmsYoQnGxEJLKpSW1vYKOK4BgQyaSffbEkHRlL2017e/6EEIfJ6IANW
 u3JAechQ4iUClFgYrrrkrDHKDZa/pwyOZR09x0M0YAwc3yd0UZfWGJx
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6871b33b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=woXWnDdVNuNVtG6xiacA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX0fUa39VT9udw
 R8zaURxhnyTcN88okrD4yQZWj3oGBZ/is1+U/PqVxyizlHwq6bW+IFTAmHXyaTlqmxGrjjgWNrs
 KpVLmmyWAKc1hDbZlzu1Bwah+jgmut9cii92t75Z2+2cA/Pe4bPA9aDl75eC2teuOjkrasCY7Lo
 Dv2F/7Oc0MZ5v5fnsbKFKNCtYu5a1rZIU9t81V5oeUXkUtvzhpy7/EmtfrbyTQRM1ZnRA5xcExI
 I4+fEdlChyRlTpniDEcMe2QsqvQa6awHPBbK/xL6uyT0yuflBEeggoBtcg1/3ytUQ063UnPhk/o
 SCaExWgOtfPB23thpmWn+oPbr6PjV52at+mKT6fyLrOnA5VjUdaSqAD+oxPNeHEZN4K8veg9Nrt
 76w8pF9biCLA5390Ly8ufPoMVLZ4pKokADXsaDoBeqOnbMcbxjsoe5V5YjUjtIamxXTYyNf1
X-Proofpoint-GUID: 5j_zrUFM2CNAkfRHvkZ5L7WL-gjgItSV
X-Proofpoint-ORIG-GUID: 5j_zrUFM2CNAkfRHvkZ5L7WL-gjgItSV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=925 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005
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

The ST_MAINLINK_READY state and msm_dp::link_ready both indicate when
link training has been successfully completed and the link is ready to be
used.

Thus, replace ST_MAINLINK_READY checks with a check for
msm_dp::link_ready.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f93fbcff2cda..af3cc32aa123 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -595,7 +595,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_MAINLINK_READY || state == ST_CONNECTED) {
+	if (dp->msm_dp_display.link_ready) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -677,7 +677,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	} else if (state == ST_DISCONNECT_PENDING) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
-	} else if (state == ST_MAINLINK_READY) {
+	} else if (state != ST_CONNECTED && dp->msm_dp_display.link_ready) {
 		msm_dp_ctrl_off_link(dp->ctrl);
 		msm_dp_display_host_phy_exit(dp);
 		dp->hpd_state = ST_DISCONNECTED;
@@ -723,8 +723,8 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
-		/* wait until ST_CONNECTED */
+	if (dp->msm_dp_display.link_ready != dp->msm_dp_display.connected) {
+		/* wait until connect/disconnect handling is completed */
 		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
 		mutex_unlock(&dp->event_mutex);
 		return 0;

-- 
2.50.1


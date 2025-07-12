Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33E9B02881
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE2810EB03;
	Sat, 12 Jul 2025 00:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxbK+gQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAE210EAFC
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:37 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C0h0hT001368
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ztg4BCYx+5l4ffFBXcfolxY/m0CGJMjBeYa+I+72rCQ=; b=ZxbK+gQ3o7Lg9I6o
 tW32UyfO1cE7hcJZNK52s6E4qCyyLXtZD3NlGUJWVHJIqQzMaW+zR5FJDYshzoZG
 WGfyr4GJr+7DGenQlUAyffo2YMu+unknAwcPrtgoYskZ4CNKf1r7C1GsuAAozurz
 7UCHEyr26QK04gctvrweQeOMfyvTd6BFhYHdyzdvTZv9jVVQJftY5txVtGa6H3Di
 kbP7XhYsakcEgOE4sgWQyqqXgKz1WKitp1dXXxOhcKfuqlJq6dJsxUSpmaUM+d1r
 gv1bs5iry7WxdWuTv66MZ6UW8B2+sOimH1zxdHYGAyK7spoS+/3qUJeMuRkHmxSr
 Vu5yxw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uddjr0n1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-313d6d671ffso2413297a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281916; x=1752886716;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ztg4BCYx+5l4ffFBXcfolxY/m0CGJMjBeYa+I+72rCQ=;
 b=qWyerJxjJW5oSOiIkqLl7Pb/chQXjpLapc6pSKwcBZQKN8aogLwyfPxl/vMq35nexB
 sdZj5CPMOVPOmKb8Qo9iCUxorKXfg/jidWY460pcRARfyLo7XL7h0tO2iG5sUUJv6vvb
 hNjlfOBO5FlMLJC2u6C4khoi4z5bl3ePqzkrdBXA1W9z64iRXn9Rpp4lQg0Yyj1R1p/o
 nQvH+ckW6lr9q8Fx32uwTxt5h6PKnkPCZFHlCBxfrWsEW89o5EIS3UskkgxChs9ohBfH
 0UgoDZ1lWrHsFd+6Wk8xAfSN/DtDJ/KllPBT+2hHRt24sUdm7qRFcvUbPNU60sDJGK4h
 Meww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZFL439j6xKBnvy6VAKf2lfFrOuHuBOYtwyW/H68XIiVbbPpyCQiN+sn5UUzO1f692rf0Nb6krd/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbLkMyJzbneRYTrGSI8vZnDHnVXawS5LbJG3xpfn6HaLBwX+oE
 vpbpmq65xC7DWIqCZWDzn1EgfkZe2ObUpB40KLJWxjxYri4JzENrtA8gh2hSQg7yTKaq60NGatb
 S9L8J2PZTQg1V6KjwL85sYfKy6StOqIpoLJUEb02zL7WoonsGVWMEbKOcjJyIdt3J0swEYOM=
X-Gm-Gg: ASbGncsvBHeGm9+pT8FWSBZuHL/UVoE4+J2ZT7DUxSAn+DuA1FPwhEKwXqXpexwH6DN
 i10Ip4c6VYaqfUrPUwXvm/v73fHarvG5VNMV0WPpB0nn9HhpBHHJt2WbW51dkmr2N/oRld5Nrw0
 wjwmUWhkMHS6ec9rr3vRqrjnaHSqDKc816Wvb1nR66JhWi64hHjcUTu3IjB7W04IG2YELNgysaA
 91erw3lsog3EuT1H31+ZbLho6j9RJxiRoh9hdF3GThUbDm1bbZuq1nYyr5pvFYo9H7yRYeDY0KN
 IKcgN3mGsG+i/YPuyro9IeOyQ2EoPGmb6U8KIszkmwdbx8GxlsdxoDPRzzCX+GgqOQSxllmsm5b
 ZeFLxPylpXVDYuHc98eymA93a
X-Received: by 2002:a17:90b:4b8d:b0:313:b1a:3939 with SMTP id
 98e67ed59e1d1-31c50da140amr6038213a91.15.1752281916043; 
 Fri, 11 Jul 2025 17:58:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYEyWKARo/kBpo3bdZrLz9C/cBJUuLVhrx+I5Awn+rzHrHkONY97ZQteD6SKGI0oaeUyzVHQ==
X-Received: by 2002:a17:90b:4b8d:b0:313:b1a:3939 with SMTP id
 98e67ed59e1d1-31c50da140amr6038183a91.15.1752281915603; 
 Fri, 11 Jul 2025 17:58:35 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:35 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:11 -0700
Subject: [PATCH 06/19] drm/msm/dp: Replace ST_DISCONNECTED with checks for
 connected
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-6-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1974;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=48wdgPtyNZwMd6sZV3ZvvtvNWOvHLwkNGaRnCDc5QMk=;
 b=dzPxfM43mTJa1032ZbcABoClTN8ieb2y7bh9ZE8auswDZJG9PPyvhrjmKx0NoQMg2/vNJ1lx6
 b1y9e7Ioc0RC8W5E2bRm2Avg76t5A142aCXiryZaYeU+RfQsDfZp+6v
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: hmDmfvcZoheKMAIXA7pz9tsXvDLTTWwE
X-Proofpoint-GUID: hmDmfvcZoheKMAIXA7pz9tsXvDLTTWwE
X-Authority-Analysis: v=2.4 cv=ZPrXmW7b c=1 sm=1 tr=0 ts=6871b33c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=iO33u3U-fp8Dsq_J1c8A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNCBTYWx0ZWRfX9+UmNp3fErX8
 PyEgTdYqPPTVmRYBV8tNZX0rSII3IX8Sq78NV/8hos2GvaWH/XS5r/cf9wZFukwLYvP5jkfRh87
 LtDoOnHGXCOxr2CtvgemN/649PTub3YBZCvPPvAE2tE2uU0B2E7INFY3UyDWZuDfIuXsxNYkG2c
 4qCmGc2mX6DNPrRM0AHKzxOx6E0MNYp05sYo51KSi0SVeAaVt3SBgWUyTHV/IDc9KuauAfRI6KJ
 7jFmxAvc8TA3FzRA5bHFF/6ViKbBAjfmPeaJpOmizD30q17uFM5yFyr7nIVlOsXhR6XRj6zfBF3
 abZY0l92L9b8Ex0CLYFbzlgN7Tdiagdym+7Bk6tBUir03ybwceS5eKjM3aJlhKaFJXDlHv5FQbn
 BYYeI1lCfDVHLtd86fKW37gV454Zsy9BDaoOGvsqEBeKNMkxmZHlJq/rN6X4pWTctin0Yso8
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

Replace ST_DISCONNECTED checks with checks for if !msm_dp::connected as
they both represent the DP cable being disconnected

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index af3cc32aa123..0f1c1fd2b1b7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -521,12 +521,12 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 
 	if (drm_dp_is_branch(dp->panel->dpcd) && dp->link->sink_count == 0) {
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
-		if (dp->hpd_state != ST_DISCONNECTED) {
+		if (dp->msm_dp_display.connected) {
 			dp->hpd_state = ST_DISCONNECT_PENDING;
 			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 		}
 	} else {
-		if (dp->hpd_state == ST_DISCONNECTED) {
+		if (!dp->msm_dp_display.connected) {
 			dp->hpd_state = ST_MAINLINK_READY;
 			rc = msm_dp_display_process_hpd_high(dp);
 			if (rc)
@@ -543,7 +543,7 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 	u32 sink_request = dp->link->sink_request;
 
 	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
-	if (dp->hpd_state == ST_DISCONNECTED) {
+	if (!dp->msm_dp_display.connected) {
 		if (sink_request & DP_LINK_STATUS_UPDATED) {
 			drm_dbg_dp(dp->drm_dev, "Disconnected sink_request: %d\n",
 							sink_request);
@@ -666,7 +666,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	/* unplugged, no more irq_hpd handle */
 	msm_dp_del_event(dp, EV_IRQ_HPD_INT);
 
-	if (state == ST_DISCONNECTED) {
+	if (!dp->msm_dp_display.connected) {
 		/* triggered by irq_hdp with sink_count = 0 */
 		if (dp->link->sink_count == 0) {
 			msm_dp_display_host_phy_exit(dp);

-- 
2.50.1


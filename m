Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D16EB0288B
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE0A10E3D9;
	Sat, 12 Jul 2025 00:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHY3mW2F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42FB10EB02
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAhK1g007976
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fl8z648VrhMIvou4b1DZumHvgXBVOysJzC66Tq4IjrU=; b=VHY3mW2FmUlRIfZ4
 ZOxSfsfARs3eWhNoskrb4v9kz2lzNUfUooKYRY9CHx+aEqadXRGbHX+6SN2P/egR
 YsfW6f/WRF+ZJZXJlgy+nf1TKdO3qC0f35olOsNDQnV0pQR9RvLi7BMauF2PKaSP
 faZCAtTP8Lo8q4WXmfKdOofTE8jLGpA3iQ79EqC9PXdvWNo8sE+JNa0kYKKQ4Mrt
 Hq7OUkPZIgsaE1hBPcwM6GZT98+A3HnLrkrBLge+0FzNWSz1nYYEuTqHlKC/6rix
 /BKwnGXe3YxiDkVO7MRgeRz35KoeEwVp67H3t7215rXlRztnGSjtRi22w9Sot+TC
 4NQTDg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcga6t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3132e7266d3so2831618a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281923; x=1752886723;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fl8z648VrhMIvou4b1DZumHvgXBVOysJzC66Tq4IjrU=;
 b=QwjjkD/c5qWyuHeVbZTHRmNa0I109lAP8gqVXgHMZGctmH0mJfmCdAjFPI9FVdkOpY
 uCaFBMCAjfTzXlwuC6s3xF/vlT/g5gdGEjEdwP8oqBmjcR84CzeU10CtD9VZrp5DyZTN
 HVzHQWtfcgScZs1PMIjo1IcHYULRS10uAbqyTEzV/9aDhQsVbNhjNuM14s8h7HZvQrHt
 GegYyFvBdA6ZwRESILbmYxV//G60yGFwdWHF80w2ax6v/yz4Jt49Ya98oSzN2NdrHr20
 cwVNacWvoDtsj+4369WZKWlGhSKWGR9t72A/98xaXMZtAmyP20MbX98QJG804yL93lSq
 +KTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV05m5zKHFmfkjWnXenu9Z6RgQmdc0yuo2WggW+ZqgQdtt5ejjT4HexBZrAwq3zSSFLnMevz37x/BI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXEwSdwp+somz2TXw9sXo1cM/bPMboeFROAb5fdXXKcgXx0cMd
 iQRlakHkYs5Y9ErsGldQrzJ99mY4o1dBeiGCzZ8Vb8rNyCjXYRDZp8Fd6k6DyA+plfI1p6wW+GV
 k7h9Ex13Cm1WB25LVO3odSTLK9ZILr3uMFugEbgI61cKD4g+7Qusq6GNAb7apTdPAuMAmarE=
X-Gm-Gg: ASbGnct+n13X5PJj5UuxYJSHckg2TKUD5flmxprtfTMq+lCyQQhQGwC5B6KtXVGslMY
 qU/IBkzv5H1KLI5lYA7+Q3sz+v87ky6z1oBSZ3eSTLftG5FV3RGvl/XsT1gqRWb1EAe7wSi1Byy
 vvkOukce3Z5qKz28chsM4HSazp8/tFaNd3GXEceRvdWOLBMu45lcKNKz+MS1QWsXq+RTy8RxOTc
 vTTfJzKRMSByiL2lbFJ0GSpUXDM8Rwru1furrzIqSOXpK7qYvPSDJ7ezr3NHEGlf12S9UM6SoXA
 sCF0atfDjROckziszcIIx3mTCJ+4vbCSyYl9nH2VuKOwlzNyWQTW80c0E2kEGTHDtADXS5OHPOm
 bMWPUFfnbWQd5le8Qg2V+2c4f
X-Received: by 2002:a17:90b:4c0b:b0:311:b3e7:fb31 with SMTP id
 98e67ed59e1d1-31c4f38f296mr6562772a91.0.1752281922868; 
 Fri, 11 Jul 2025 17:58:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzKmykxcOi7eiVHkBQUvfbqe7W8TpJLzKZDJVQgtqH3XstptXMGJj6vS+CfJ5H1ALRn0iosg==
X-Received: by 2002:a17:90b:4c0b:b0:311:b3e7:fb31 with SMTP id
 98e67ed59e1d1-31c4f38f296mr6562722a91.0.1752281922296; 
 Fri, 11 Jul 2025 17:58:42 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:41 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:15 -0700
Subject: [PATCH 10/19] drm/msm/dp: Check if DP is disconnected in atomic
 post_disable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-10-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1047;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=188J8HQVdkSWJL5yLh9gG8Tf0d3WxXMDhANnFNnA2Fk=;
 b=FqvQDl31EdqzSOt4Hvfj+exBkiXqDCV3n0dR0LgZUSZS8s7Kirwh9cM81Kk0rDfMx3wCd/r9L
 5vrMnhBRtN0BLDkpuichaWN+O2kslCCRaf2b2pp1tEdByp9TD+phAmK
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=6871b344 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ict5BleZVNFJU3CK3-QA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: n55q-t5Gmwks_TyLLecO2MaeJE_ArfUf
X-Proofpoint-GUID: n55q-t5Gmwks_TyLLecO2MaeJE_ArfUf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX7ZPNP0KqgClH
 x/C51zzTvM2mWm6nYRYDs3qL865+iKqQv48hiBTeZL3P1j/YJKIewS9AqZ23cO6SkXtQRFdehZw
 iSl6D8wsCbIHFzkJUmrxFITEuQiGIRzuBE9ruMOCabeZsyG7bPaXYD/qNtU8lrqj/x8CPL5RFdT
 qqXmEUpbcywxvbQe9vUX2IwUdzLl4GlngNELu8s9/cKl9kUigiK+578wJ8FF3MZqditlDGkNaEz
 45QthDyPIiTmDgwxWFa6iUA7VZSjTlDpTYjmMpMBqMhdVuspz5FYlKo0Sv3XrrO4PGelXSCmwFX
 URkYAVxxwwWc2mnqv6uEZcBViXKjcLYpKywKLiE1rZq17dGBhWRtE4ITje1zR/1gZQK9ub1Dqte
 W16v8/OWqHb3VSDv/eEWIxTvFbnbc1x0bXONhzqPOb/D7zhCpAbFGY7JExFnW6nsj6qUj8kb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
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

Since the hpd_state is unused, change the "wrong hpd_state" debug log in
atomic post_disable() to log if the DP cable is disconnected.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6535c1cccf84..4c9a515648bc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1643,10 +1643,8 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 
 	mutex_lock(&msm_dp_display->event_mutex);
 
-	hpd_state = msm_dp_display->hpd_state;
-	if (hpd_state != ST_DISCONNECT_PENDING && hpd_state != ST_CONNECTED)
-		drm_dbg_dp(dp->drm_dev, "type=%d wrong hpd_state=%d\n",
-			   dp->connector_type, hpd_state);
+	if (!dp->connected)
+		drm_dbg_dp(dp->drm_dev, "type=%d is disconnected\n", dp->connector_type);
 
 	msm_dp_display_disable(msm_dp_display);
 

-- 
2.50.1


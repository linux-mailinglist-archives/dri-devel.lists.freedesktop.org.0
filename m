Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D1B1F194
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E3310E9A4;
	Sat,  9 Aug 2025 00:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="npBGLZGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3EA10E99B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:50 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578NH0qk020567
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3eZyTM1lKAlxwHu0KgfbpHrzCleYc0+uy6KH19detY8=; b=npBGLZGlyc08LaU9
 kco4hlyvKU2rGweNbK6e3aJwO4lcjBj+EJeHiLv+73LNdhlCU6JX/eG4np2vuZGv
 +N1c2UGqOJFE8HnKbNzQ65/jM11QgmHEmx3zaH41+Y1Mq3F6so2XKaW2HQ/QeEfX
 ZHJ5R9GDF3elvWzYIU5eBP56zcnqXdUtpjYEjjJ+QI8uTqrZes3Wp8/uefdFgNJr
 +1YL567h9yr+WnujIu9aaX+kJ3VQQvAFyql3HzgJ5/qd8EL7/VYfA9uVx9WfyC3o
 kXSS0c6L2Fe516WBdcJwDLkZm8zFBF00MwHWFkPWHKiC7ykul2CFwJFHMgdqpUol
 qkUX4A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1kbbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76bf7375f8dso2462250b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699748; x=1755304548;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3eZyTM1lKAlxwHu0KgfbpHrzCleYc0+uy6KH19detY8=;
 b=hh6OU7sT0YnAoVpu20zBHFor6SRKz3f3k7J08LlQ874YMuO1gxb1vdFSuM33GvJhG5
 nYg4yRuSKUXlleVlQXNBGohxtWQp/dhagt/HcqWjv/iq8F5PEBZwLpvoYdiHz3SSPF1x
 6VeAJrirNqMXT8ngF7YhlZnJ01OCTAaUpCwgn+nwCRpi8WMBT6PMGDfUIWfK8rPd3vp1
 t3+SbkHsn0m0qeENxJYue2zb5YGrpOcKTz/HrEK+aoDb+taJrIvKxjlFPo1bu8Yfn6sx
 d9GlfZrcUa2z27jNJUcWzRGdNqhFXl+92Y30l5nZr+bI+Sq61dz7Xh4bdC9yTc8UNsFM
 e3rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrELc5kjBlkMEVYU0Q74s14bfBgC+JYIP9mBbVOoxqErInQ3u59YmKPSkwWzR9t3vfLhHjuH+pAhc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGeOq3QlDzAnaG+xSu8cHDyoUR6rJVOEnYpvckklP6LDe4kHuI
 WafOHo9VkSO8+60faV3DXhRa4oDvxzOAIOgMK35hju2AoNHuFrp2O1HY8pZr2FUe4X2ec7In43N
 lMsFxtdMOz26V7GZrFuSTwl9Caj70YlbZT5RtYlfXyzM87MDqozx3h/nC4RPzDZa4fmXloBM=
X-Gm-Gg: ASbGncvhA1CvhytkQYIcLLDRcApB6ol89yPeMic8TH/lgej+vW2433SsmnhK+YXk0xZ
 uuCXcGieb/3tdPHsAeoHn+fveg3JzI95VY1txxbzp/YKZrITWGlGfHxGDXTETf9pFvySh+Mpn95
 BwvfNkMdcclu88rUbGx7XXOUsIdEnONYHfy30iJkKuZT4K2fGEAfKBoo7mfro/5YQXMKdTh4NOb
 bheySYs9rQ/5kduNBg4RLcAABUObuyppzqyk1d4U237KPxklJxjFSBLQ4M+RlT3/RQYeui95Kw/
 KAN/LDxIAmab+P2G2CyJP4EbrBNNrFxbmOo8FGAkE0Qp7ROwp2wWoSZSR0qMQv0q3fDftqivd89
 nAHO69n12nHFkJC/eYN+Ebz4t
X-Received: by 2002:a17:902:e786:b0:23f:f96d:7581 with SMTP id
 d9443c01a7336-242c2039e50mr64543125ad.20.1754699748164; 
 Fri, 08 Aug 2025 17:35:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcMrJNf4hYbUM6Mca4QfD0ZQhsL/38byXKglBB4WfSR1lbVjH3mDxc+Vqs9SUlmhl07AwLRQ==
X-Received: by 2002:a17:902:e786:b0:23f:f96d:7581 with SMTP id
 d9443c01a7336-242c2039e50mr64542765ad.20.1754699747607; 
 Fri, 08 Aug 2025 17:35:47 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:47 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:21 -0700
Subject: [PATCH v2 09/12] drm/msm/dp: remove redundant checks related to
 ST_DISPLAY_OFF in plug handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-9-7f4e1e741aa3@oss.qualcomm.com>
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
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=1745;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=L/K5K5k1xBQ/wx+huy+cI13UFEAuqZN8YUVxLinE3Yk=;
 b=bDAongJDXX6a6O+352pvsIP13wU3uFnz7DQHr8iAWYbGG6fO0Ff2FBG7AzARKFuAkqFwsvxpz
 WAmus7KaTCSAThVoDDaKKbokeJY6sI8CUyT3NiIbYW7Lmqljm/T3ElI
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX+cYtcF7xA1hq
 149fmka6beG2B0pmr088vATAPtElrqNtQyYthKgVSZRf2LqOV90yrEWFGxiLZIbVt87u5W+XYcI
 A9exdjdZLfKZjvFDnOKz1/MmftitW5XgoETfOsxI2E99vU4swqAhMiZsIvDUBrGrQa7nY3kya3i
 VxHHeCFX0TSWWf5WS4bFQ75m3g6ixMCHr8jSW8SWI/HPsq/nrYqiN+Nt4z6cqOaWuEsRvprap4t
 ySfo65gLcT7AZl76HjxRLzF9A8vdU+03NYGDvPdKJwvcZrO753n6eJ3IAMhELSEk6d9yosBTe2C
 h//m4Mcf7MxZSVE/0VpfkqP+G1HVOmKmpK6DQQ49Kb4Ij/c3QyYMrFKfw51CiHfV0M2LJX9AgEj
 /EnhXyFb
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=689697e5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=3iXaqZgdguojTDSw8eMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BIeu_2g6jcq30m8IjRST0H8p_pwv0A0W
X-Proofpoint-GUID: BIeu_2g6jcq30m8IjRST0H8p_pwv0A0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

In commit 8ede2ecc3e5ee ("drm/msm/dp: Add DP compliance tests on Snapdragon
Chipsets"), checks were introduced to avoid handling any plug event in
ST_DISPLAY_OFF state.

Even if we do get hpd events, after the bridge was disabled,
it should get handled. Moreover, its unclear under what circumstances
these events will fire because ST_DISPLAY_OFF means that the link was
still connected but only the bridge was disabled. If the link was
untouched, then interrupts shouldn't fire.

Even in the case of the DP compliance equipment, it should be raising these
interrupts during the start of the test which is usually accompanied with
either a HPD pulse or a IRQ HPD but after the bridge is disabled it should
be fine to handle these anyway. In the absence of a better reason to keep
these checks, drop these and if any other issues do arise, it should be
handled in a different way.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
Note: Taken from https://patchwork.freedesktop.org/series/142010/
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index eabd6e6981fb..dd3fdeaacc91 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -495,9 +495,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF)
-		return 0;
-
 	if (state == ST_MAINLINK_READY || state == ST_CONNECTED)
 		return 0;
 

-- 
2.50.1


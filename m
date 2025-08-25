Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8001FB34304
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7472B10E4B9;
	Mon, 25 Aug 2025 14:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dezX248K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E3E10E4B7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8YH8I005884
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SE0gyMoB8H1CugyDSf0yuuJz5+xdbT3mnKETqrVtLJE=; b=dezX248KTCA8HBnZ
 k+1XoucYM9nNMkL0mTZDlkj234rYZWJdiHbQvaqqzxtKLhfyUWPpLm/0VKeEiNCl
 0bZf7vNVCMKE/obYAHL6JWAfg171ON2tJlFYPSIKIktLE15qGlSxulVUxFf+c7MA
 TiJhppipFBflXehXYu2B1ghesa1F5H3cWNpLP6AFoZE+9FNoPOXk7tI2SsUh3rcQ
 8dSnhQQom2xsSod+1p1n44+hxPXnD/vOtJq0HWHxz9vXMp1voV1Q9SncY+1c2P8C
 V8fhEEvaCnVhSxiPFhGLpI8lynUJcmZW25yeZOealxDGJsSKmA+RIia73j99Qen6
 y7h/7A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unn8xq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7705115a2a5so1249777b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131454; x=1756736254;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SE0gyMoB8H1CugyDSf0yuuJz5+xdbT3mnKETqrVtLJE=;
 b=wDVSRvKu/NuWhD3r+QOzu4zX44G/uCBDtQrcmOqhd+BIoj72cXZJ2rS8v4/uCgp+tX
 O0VSl+1hZS3Aav2rTZzkGfbWL0T5iRDennHzgWQ2OPokf0wBqx07WWIeqxzqrDeH/CRC
 Q96emYmxS3oqRApecx5swvjijpwD77+VyaDo8HtfpRn4eidA7FFITK1q94Yyf5H6lkhR
 qXdyAFa1Oe1s5YDHre7VRbAXwT4rulRYbQixQDosemUHBR/aPQ459LNXrwznFCjreC4b
 YCFh/kaQFgSzuocldMwToYD0178yo1anATrAd8doeSVznKnH/4+duksDl/zdQDxi54Ft
 YEzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6+T+3tL0zYmnjT3yImcj2WRIt83ExvQWE5BpiGj4+A2TFK+x/JDM3ZUCdF3juWNLfFWBgFqJxIvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8UON85qvGQTkNkOZgIOT1XOzjDFvA76tuLd95lkcPC5zDcQQ7
 H5nL4+TF0pDMb+o10c2/lXcHY12QvQ5mpMFOx8JXlLsY072I6cIDBdzxnu1gkvF3TeCdy40QzSk
 GWUI+tw7Nm3Aaf0XhwiJ5bds7DmMOpoq3obTvCxuVHw92BdQJ5+WY1hokBnvH73PqIjxnQJI=
X-Gm-Gg: ASbGnct25Wo9II0TBq+LzEu/ygKrfyJofOmJUOW6jOB8mGIFeaQCbZkQo9ZGVXw0Rmh
 8Jupy+M8Gtu2F32928LUCkjYRFc+GSMpvTn4ji91B1JRrvtwihswWo+MUeAHnKK38eU/ZQl5sAC
 g0MIIj6YvixEnYNu0M52yj07ZQSrE/SpF7pWpBs6UW7UuL6qk0up9Eg1+Y5SXpHM4yyrF4KQmN4
 8bvn3E8ntgM7iFuyjDM2MMPTwZhHLxP7n6vGSS6Rb+dAklvVM6pYAWUEjAYwNIHOvZBojvwXqNy
 k8ks+khKyYbSSocdQajWs0K7xNp6+XBaVOVzoNRv2k7sLNiATvTGBt8ouaTh5lu/X0FG2hQ=
X-Received: by 2002:a05:6a00:1148:b0:770:343b:5457 with SMTP id
 d2e1a72fcca58-770343b5776mr12538557b3a.16.1756131453934; 
 Mon, 25 Aug 2025 07:17:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMy2R23VqH7KKGD0dAfeWxD+PQOsTGsim/ksuVooGj2cwAdBV6kfz9RNS/shNC+Cw70XbkDw==
X-Received: by 2002:a05:6a00:1148:b0:770:343b:5457 with SMTP id
 d2e1a72fcca58-770343b5776mr12538514b3a.16.1756131453406; 
 Mon, 25 Aug 2025 07:17:33 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:33 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:52 +0800
Subject: [PATCH v3 06/38] drm/msm/dp: extract MISC1_MISC0 configuration
 into a separate function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-6-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131419; l=2040;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=c96ZWM2YbGkHRur6wRdiO/jYHW4Vd3JzeA7uCSEtT40=;
 b=7A1066X0KZACbntHPM+Jt/eD3ZsGYrvKe6zzDb5Z8KcJMssPlZjEANxf0jIuv1DUHGdJUBX6L
 K70v2S0HEELDa+s60FWY1wBPrH07gJDdKqrPryvvoisMjvel6HNe6/z
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: 0OIepj-7HCWqIw0ZM-4N7RKjxabQP0vD
X-Proofpoint-ORIG-GUID: 0OIepj-7HCWqIw0ZM-4N7RKjxabQP0vD
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ac7080 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=aoENilsEcffTQy9B1RkA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX/J9ex3BA1eg2
 FVCQPvMiQizd78oOtB4qgu6lbdOcI8zWDJeLvXF/RC87mrRikcBw8i1BwY9NMCb8+DTgY2NnS9P
 DDCEMH+FnyzZzqKShkmbCX7TJ0Q8akIhICdvmGMdWaZnjv1+SkRmMkh+o1jWwRAUJVwa3UBH+Cc
 x8fHagbqmUDRIWoHbzt32Wdh+Hn1FeIpl17txkm/TLsX/DoKreZyZ0NKhCNc9AYU/qFgy0usCEa
 qZeDabc9izTxJm7LFaKfUzxwjkbjn20D3lReVhTit5BrHcu71OzSNPxluk/KskJX1VjbqvzRNvZ
 JGzRuYUJHmYG5/00R4sfNv1MCdG3U9gGnZUyeRl/pGxuSjdqpXuCkiDLquGVdSoxXgjsg8Buqyq
 xpYpK+W9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
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

The MISC1_MISC0 register contains stream-specific configuration bits.
To improve code clarity and modularity, this patch refactors the related
code into a new helper function: msm_dp_ctrl_config_misc1_misc0().

This separation also prepares the codebase for future MST stream
programming support.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 45d6c9a7f7ddaa049443253cbf4c6fc5feda3177..6bfb639c1ebd33f1103c5b68dfb40701738fa267 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -447,13 +447,13 @@ static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
 			ln_mapping);
 }
 
-static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
+					   struct msm_dp_panel *msm_dp_panel)
 {
 	u32 colorimetry_cfg, test_bits_depth, misc_val;
 
-	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
-
-	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
+	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link,
+		msm_dp_panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
 
 	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
@@ -467,6 +467,13 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 
 	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
 	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
+}
+
+static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+{
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
+
+	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
 
 	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
 }

-- 
2.34.1


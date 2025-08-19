Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74896B2CDF9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 22:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8603610E686;
	Tue, 19 Aug 2025 20:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcI7/53i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7788210E683
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:15 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JFKwYf005595
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ndEz2xbpBNb9n5L2RWMR2nJPekvJ4u9Qsxz7tSzeQZk=; b=pcI7/53ilcL/mke/
 pFPxcZ0iyDVn+aikqejKPYNI5M4gwpQ7Tcs9PHfZQKBYdpBLpCxatL+NffQnrg8F
 QEM85eoyQmp2/gTLmZNXcEOY9VWDtXSCE6t33xwfm2whXkLX+BEVU+12pF0OtL6L
 au9pE5/8IRHhA6h1udBdAG1dKXRCIEpev9TM31QSDWxgxx9VcELviP/dOu3mMS5k
 lo6t/TZV/YEUFSSoaS2Y+Pd9eoE1kDWuoY6KAIsj2SHCTbaS8ohFK/3a+Jxgf430
 4YNNdUUPqTfKazvmDW9a1TF303UM+QQZnc3uqpkMdVxW1OdzDyK0peAv49EEEGgX
 v/i8tA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48muu0gwu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9f5bb140so191227236d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755635594; x=1756240394;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ndEz2xbpBNb9n5L2RWMR2nJPekvJ4u9Qsxz7tSzeQZk=;
 b=f7LnyMEdTdwdjehilxUmaqrc++FKGaTV/KmPFZMnMtgEGrff6qRNI6nZDRhcQGru7o
 eBwVY5gnu8dhFpXrAw2YUSH8MuVxCydX5Qox3E9kR+q1ufyI2u3weODFD0n1eKRilxUl
 ehZWMjbuH8pANtk7blNPqnbzSsE44fPRNal/CLYK+ZSQC9Uu9JNsNFZ7OIYjeOGgccgU
 15ULpv2yFugtTOHzjKkLAoDzqPOAoKKN7HFxo0eEXoTh4Z4xTs9cqHBG3NtZqSAr11ag
 hsUWt+DkDRJiDn2WVtormE/LZTVdXRMvmutX0lp+R/jB8WqAemKO8uiyJsdUjuPnJ1z7
 xqog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl1BVhhkhiUPpViQt5BQoKN/H2J8TwhBwLF9VW1RbohZQOjLOfJWIKvFXjZ17DdVS1MqlQY0iXeQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxmv7PJ35FCaKCGwrANtJIswvKoKdjgSdmeUExOwY9lUPZ5kaH3
 5AqonQShvG18dj5EXjPKVFQEdz4Q/OShIWd021pZMz4XuzJwtfw0n2PXbYCDUYC5xLvQ4F/VsGT
 +JxhJazpWtI2qUP89OX01CWntG0fN1CLrZsgMMP8vzezmwZu0FEV2YIADmfbHhfgJyGIPvOs=
X-Gm-Gg: ASbGnctoZzj2CWjL56zzF2UAPu1swRkfmw1Btvm4Fo9KW+zwwq9PE6XaVETlOO3JKEy
 7A0JIGFUPHcEwrbfN72cVCpPyfVN/4faXG5S01zWEei1peQbZ2z+GO8CI/jpfPDg8P65nrAiz0v
 6I+ET8KCA4fJaqvjQgqT8bfb/3OnTkUWJ/bzGIbkhmK6oo06tE8fBNAMAo4zjGNH/3zx2QDrW55
 d+8HblOzbYp7YCuxQlde4JY1pM/U7BVz0t8M3FOyKDYbuyWeT/lBel0jbYnoOMKlYZE7e+sVaC8
 ECYIqtiP4qDeGdJ66vxZNtBAUorjS8r6yHYF4EMYiMOVbbRBmHmXrFsBhRfkK7qZw98o+zr5cVs
 SDWnXyeo7T5P1tDOye8/M0cOpf526gFw/8rvjMu57Y0fDKcPZi/el
X-Received: by 2002:a05:6214:2526:b0:709:90d2:4628 with SMTP id
 6a1803df08f44-70d76f92bf6mr5416846d6.19.1755635593517; 
 Tue, 19 Aug 2025 13:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxihLKXa7JhuwwkeFQ0p5zKqK7B3jNVOf3qZbLFjzpePpJRXKGGlC8e34zDhvw9cZPJCBDjw==
X-Received: by 2002:a05:6214:2526:b0:709:90d2:4628 with SMTP id
 6a1803df08f44-70d76f92bf6mr5416336d6.19.1755635592861; 
 Tue, 19 Aug 2025 13:33:12 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 13:33:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:33:00 +0300
Subject: [PATCH v3 6/8] drm/vc4: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-6-b48a6af7903b@oss.qualcomm.com>
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
In-Reply-To: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1739;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9kPXh1enzh44Jx+JV9Ql6fG94nEVIAR8Tv81e1DfnG4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN98FeUHqsRMxqI2y7bSGcGGmIQ2ngHpJlEtt
 7qfS9PHwcmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTffAAKCRCLPIo+Aiko
 1aEoB/0S0UbRv6Cn22F8M6h9l8cAG1g8kwox9gPMNA16YkeVOr6K95UiTo3MMjJp7r9L+aqIiYW
 4VY008h32adgxAl6T4rztlv/gbNcK6wpN5EIJcGDsFjXYG6mcjcx1tPbG9kOmBqd3reRp4s1wOJ
 KAz5KS/AtmLz2CYVi6vPsL1PZXzn0Uc9Y1E7/ZG52uZtIAvqY2e3ToYbYtmTF7RKaLy/uIYmZMS
 2VVTZTlmjclBLLn02HJiSZDsiFI9KByjQEssXDY1vWz0MOTsCsts7Jrp8LWNtE7St9nwsiUNJWz
 E+fzSaHhOeKC2+ykQjdy0xhRKprf1e1ISuEYVrlH7d6pc9Tx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: AZBTfKetg8WuQ4iWYo3zy-UPNMOKbsVx
X-Authority-Analysis: v=2.4 cv=YtYPR5YX c=1 sm=1 tr=0 ts=68a4df8a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=hRdDZflY9wZGYtDLNskA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE0MyBTYWx0ZWRfX2FGm2lsQBqF/
 gWi9721HEyua7nCMFFSszV6d32/vmNXxzHebV+dnsDXDYViAbduAWZd1eDIl7w2D6ncnqh1sGaQ
 WtP5alvi6FKqGSeYQBqoJ1BTuPedeWMqTeu4gt/W48icN/phclB1fUXYgf9Fpvq84tCpQ686uwt
 T19+5TQcWqS49yP4YAOU9l+z0X7/P4GK+EnwoPVt+UYMcem3r5xyo+q/3ktjo7sLoHtg4c7myTT
 0gCaQWAh/PjUn80tXUJE7D7XSxRrJWsAaSJX5yrIOAui09oI/fd/iOn17jkVNkW93wOpv8d8xNR
 CghvuTODJyCdxXAsRO19gKSzSE+yB1ZZH+5UXKGI98au/VXb49X3OiEUjRBWxzfQHcPDaQrUm4/
 mmFxs03N
X-Proofpoint-ORIG-GUID: AZBTfKetg8WuQ4iWYo3zy-UPNMOKbsVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508190143
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

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 42acac05fe47861ced226a4f64661f545e21ddb5..fef4e4ee47cf41d40de47c5201f0349dc36c56bd 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -377,7 +377,6 @@ vc4_txp_connector_detect(struct drm_connector *connector, bool force)
 static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 	.detect = vc4_txp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -601,10 +600,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_connector_helper_add(&txp->connector.base,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init_with_encoder(drm, &txp->connector,
-							encoder,
-							&vc4_txp_connector_funcs,
-							drm_fmts, ARRAY_SIZE(drm_fmts));
+	ret = drmm_writeback_connector_init(drm, &txp->connector,
+					    &vc4_txp_connector_funcs,
+					    encoder,
+					    drm_fmts, ARRAY_SIZE(drm_fmts));
 	if (ret)
 		return ret;
 

-- 
2.47.2


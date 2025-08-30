Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4425B3C62D
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 02:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0B810E3E9;
	Sat, 30 Aug 2025 00:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IXnoLFe3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B26310E3FB
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:20 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TFaugf031696
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1AqNK0JvpkzUHYLdcGKR1RHF7N4CzTcthmQAulAujD0=; b=IXnoLFe3Mnw7FJ/3
 m28CaZTdvpwEbp6SY8hiWZu3PDM2KVfemXtqbZ9pWZ0QONyNOwQP7Pq8C9wXiQZ8
 9KIhHSY8UONnU8T2SV4IkXofTvDtgFwha/05lBNGensz56A4oTPBbThlXO61ZH36
 zQmiYcnMRsY6j2IdQPwmkTkiL8r6bV8SxKvm3ekrYrf/ic+4iIC/CSx4EzraZnq2
 oKpthEJcp8PA96vmPm4bg6c7H0nhhXoU08WUzfoFmzJOPDRlc4FFHhCcN5Iz8X55
 wpXXNiNNnB4P6lR8vn+bFUWx/k06lQaC7KuFDqtCT8Gtza4GSlMDew2tXRjX2R3t
 FkB7Ew==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpgpvkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b2b3cd4d00so72410411cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 17:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756513399; x=1757118199;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1AqNK0JvpkzUHYLdcGKR1RHF7N4CzTcthmQAulAujD0=;
 b=gf3cYeY6/2acz9lyK48xdEtN2tW1DzYe0bFCxi4tGO2T2L9kNDf3oojABmBjrSfrZa
 EtQrZ67zLNPkrvxzSVLU4IA+G4PPizdgm4dQcciAvlAW0F88OS5p6Qv1u4TWrBnUTrYD
 BrsldNJsNbGWaTYMQomxCj6iikruc5PsRG+5J188gktFJcxRQZe/R4dDctkEk/1CPTc7
 cAxhBX++3JbaDXfLmSNxm/dkuWLreRabZLc63GF6LeNLvubM1RcSHPHJ1DUm3GZzfNSA
 VusiN74C6+MEgGchQHwb0WyYOhYtIIcO8RWKYRsoOGlgHFucXByjuObP6hw7HPpPzGFi
 U6Aw==
X-Gm-Message-State: AOJu0YyxFIWedZcFFmb0dnX9B1iPv/sEh7IeKTE8bw3TjS3fyjk7fo0D
 SthX+TMiXtGnG9MqaZnfrElmmLnXzxCsLojky3t/xc11Va7jaTTZ/xMzocpWiHT7hAtqzYA+PqF
 7WhUSavIgFMWKdsECxlB7d/xWsjR/1UxeTHpgo3i9PD0YIuoG1n/sqfOeA1pCiYzlHYX+7X0=
X-Gm-Gg: ASbGnctKUy7KWVkxKsnU/SXfIHOdMUXFioI8fwwOd8YajwUSMUXwlXd4+dGaAlZFH59
 Ddc241/55sXOzPkLd1kEf38JdOBab5rJlx19QplePHokXpxbgXK3fVkdcr0XxTAbLLoGQqbf2sA
 X+EnrL7qP7Z0HI4XjjPN8Gr+AgzN2bH73EuDVOdjtPdJmGzUx2wzBX/eNeLTHgsgNHVLJdN55Wn
 D06IL4zkHKSm/irwonI8m6nK++hEVSrcK/230UKFSRkycWZRy97XeooWd7RP+P0twfL1JNFHPSX
 iviiHR15eDg3OPyh907fQfMzT5G2KDeoLfo+stryjAHpasOaGZdrQ0oLH7TcrusrFZhr6Uklajy
 avd9XXfPQkwRybjaNq4KBtzeg13jAHDzNOEGmjr5NPL3xG5mKVKLF
X-Received: by 2002:a05:622a:1a98:b0:4a3:fcc7:c72e with SMTP id
 d75a77b69052e-4b31d80cadbmr5813471cf.9.1756513398542; 
 Fri, 29 Aug 2025 17:23:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVN1muIBwmw4hoq9Rahodlm2w2ewntFQnkQICLUImr1NmaPx8XUeu2IF08fUmhex3lGfMyjg==
X-Received: by 2002:a05:622a:1a98:b0:4a3:fcc7:c72e with SMTP id
 d75a77b69052e-4b31d80cadbmr5813271cf.9.1756513398051; 
 Fri, 29 Aug 2025 17:23:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 17:23:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:04 +0300
Subject: [PATCH v3 08/11] drm/display: bridge_connector: drop default list
 for HDMI Infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-8-32fcbec4634e@oss.qualcomm.com>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cd27TNKmPZcfQJ3UKiBSlNuQpycc1+LIV7BQ0LEWwY0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Yml5RgLv0905LPmzQqxvhe2nOH5VfAIu5qjh8VjHPOT
 zjoMtOpk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATyTvD/lf0vs0N2VdxoewZ
 BlvKi1+Fpdx4oJ01g7fslfG8TE6f+kcbLJ81nku69W/mZz1rOe1Hpwyr3iWdED7Lo78x4ljX77t
 qdrbvpkZMmsBfof+pWKdBPm7n7qfFRk/ecfzsPf3tsOo3OxedX/aPmqNLTSbJlj7IE68q0jj3wj
 CxzjXZIePtS/dDOY+LF+rKV67NWGG73faf3I+mMv2ltctNV7jYC6ycModrTdPtj7IiBXlf9bZML
 bESv/3wA3NU0/3L6SLFdhPMn0xT8dBpkez0WVe51T+FcaO+g/iaSP24B4/aBMzOPihT/Sq7u8nv
 zDELdVPFCbyigqIpb1OvcIQxGLRbanuGOlkaZtyUK8oHAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 6Jywv9FLXJPDtJ6OlNrYnVCtRvVaFAV1
X-Proofpoint-ORIG-GUID: 6Jywv9FLXJPDtJ6OlNrYnVCtRvVaFAV1
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b24477 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=-zYrYaJvJPDGblfDOm8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX6IlVTwK5F9aH
 /pOBBG4TF/BQsj0wrxykqULh4TOmnOZDqDFgbVhf04EETtc0G6bOV3dcO4yrwuIzzPuweFhRZah
 uI8razMmY1sknetXo3cgH61RM7HPJOanTJI/ph3ZAlIw2Kzv7S1sjDOcr6qp3XQFiBxD9UMCiwk
 xZdh3PXis/VAhNxM0FuUM0uxsF1gy+3dE63jWe80JMHUoTdutBs+hslJygVrPJyMJ89OKC9CD9c
 Gtzwilb9aCO0MO3msMcLxnzs2aeuWZKmjHBHnXnf0HHzUBR+Nt6dcNHxbnoYv58An54UKf+pZhq
 NLikpY1U20RquPWEibdz8oqX/A6XlMcWQEvidS1F09kKvfagG6Qe0plPYysKajZSZ8TfuZrw/Jd
 4sT2MzCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199
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

Now as all bridges are updated to list supported HDMI InfoFrames, drop
the default value from drm_bridge_connector_init(). All HDMI bridges now
have to declare all supported InfoFrames.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 944fb497ca339ddd63c132c2df0888011cc0487f..2eb7ab033cc84f8bf5816b5a608b2583226336c5 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -786,12 +786,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       &drm_bridge_connector_hdmi_funcs,
 					       connector_type, ddc,
 					       supported_formats,
-					       bridge->software_infoframes ? :
-					       DRM_CONNECTOR_INFOFRAME_AUDIO |
-					       DRM_CONNECTOR_INFOFRAME_AVI |
-					       DRM_CONNECTOR_INFOFRAME_DRM |
-					       DRM_CONNECTOR_INFOFRAME_SPD |
-					       DRM_CONNECTOR_INFOFRAME_VENDOR,
+					       bridge->software_infoframes,
 					       bridge->autogenerated_infoframes,
 					       max_bpc);
 		if (ret)

-- 
2.47.2


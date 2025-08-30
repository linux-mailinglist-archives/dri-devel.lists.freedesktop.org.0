Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2EDB3C632
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 02:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F6D10E3EE;
	Sat, 30 Aug 2025 00:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTwPRJSr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EEB10E3E6
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:22 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TN0Oow009092
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P+gLmc6QIq1Gqbex22CG8o5k/mKnyADqk7w+J2c1oKo=; b=gTwPRJSrfbEm9ova
 UWH2HD2Kunhls692qcidzYuT+0FPL1Hut7Izk4SNYhYxkwYj+GAHqbn/DMOk6rHY
 K2ZaKRaLERT6IcpHP34r8q0BbJw8klmUbV9uoO1L1ZZQEgBQFIfFHz/AlF6S3Ljn
 O6kLlLkctUIDiz4vNXtDCk3LwN/z7sEDlkuRByJK2ty+F57Ab2me3DuDjoj4M47b
 3bFE8n63VRAjlacoruEGPR8gp4J42cRdkxk5f42RZXTBG/Y4PT+f6D7Tlr82DGlZ
 pOn/CG7TpV2vmKKK9PREYNtSi+ng+KFlag5FB2GhgKaJwBh+RxiljE10+FXiTSmE
 Z6mMtA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wectha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70dde77f3e9so51086406d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 17:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756513400; x=1757118200;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P+gLmc6QIq1Gqbex22CG8o5k/mKnyADqk7w+J2c1oKo=;
 b=dFMOj6JEDKEjmkEmMmvunkEtE31cBdK+ufOTmPwM3O0MuH/FvtDVcCJwf73ugwyPTJ
 eXKCnT2weIH4mGcfTQVOev0kbyIUEvXNACHtgJ+TavVXHbmVPwmV9cFbppkLIiWV2ZOU
 y6RLUg5+Of7HylhP8icTE7QTcpDCRLS0ezN7glKlJo05XzUVwgYW0Hej2fjJb3zr4amH
 4bQ27jRk8OuxakJQ3W6qH6XKdhWQL1vU6M/4QR0AjzZOIb86ePIXOKwJd8ZQg1/tYqoK
 vltmBN2uKuuS5bCjQ81GWMw9yEJgmfv1Hnx0E7+dcKNLXzpuW4f+94UMRHh/udNIVhMz
 AWfg==
X-Gm-Message-State: AOJu0YwYaab3aCT0VfKXiQ7r8g3/ejcVYEdPw6YCcwp+FtC0q0YDpir8
 y3NJ/kqWNjRQsOBIs2j4CS1x+mGoGdbHBqmqN8UgicdbpvmcUV9K91t5ZYv/x8LGP36VqOEqYvF
 Z70tys46HUgYgXFCJduFjmmuqtDqz7uYruCPp+3dGJKQgMuE1HApAAK80VG4exieKsTB1SMY=
X-Gm-Gg: ASbGncuIJvkwbr2WuZrwMMXLxDQfeFc6FtStsRqZU0pMkeR8tw34uLCnu6XGaSbbPhN
 JBJKDeq+3Tf/Pi+HR5qqS7jABR8bpIdKHq+NcSTQSsu9f7sJ22EgxNQBBpWudk/4QDo9Ma0xYF2
 lormN+Hihf46156GEAMA/rSUlv1zU3iL9J847eugIcWZ/C2Q+AVGwxSWP1+kbmLPAHIRShKEUEg
 4jxLWjvwTF50jRbcTFI6iOE50tRz6Sge4pAIDkO2c4U0LMkt1X3OCLBNfyhI9r9HZ7v/WiKk01Z
 Um7dH6NfkXT13/jihq5iwWspYm0gpWBSp4pxhdWVgsuLBVRKDJMb2rBPQ3+tnmFMFo84/KoGLRv
 IKTmy186qhJY+ESAumy6zQYioUZ6yijp2kzOs/iV3BBOkZRiaKgX8
X-Received: by 2002:a05:622a:98b:b0:4b2:8ac5:2588 with SMTP id
 d75a77b69052e-4b31dceda5fmr5331811cf.79.1756513400260; 
 Fri, 29 Aug 2025 17:23:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiRVPCy1ZyvNRY0SxkmPtK5TdJ45H/D+mdd/nazOG8FE/zTJi/BBm8Fy800I1NQMGrZsr0qA==
X-Received: by 2002:a05:622a:98b:b0:4b2:8ac5:2588 with SMTP id
 d75a77b69052e-4b31dceda5fmr5331431cf.79.1756513399780; 
 Fri, 29 Aug 2025 17:23:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 17:23:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:05 +0300
Subject: [PATCH v3 09/11] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-9-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1517;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TXVbDyYy47gcECct8bi3FdzY5XC0C+uBNPghEtpGc6w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRkOHE4fVow7vDWOUvmc/2iUcbcfIOqvZ6C2
 Dchv4veASeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEZAAKCRCLPIo+Aiko
 1YnWB/9HjDIWWBFOTM8HXaStc63uIk6SmVdJldXZsyniEFqPA35U6pxTvz22fY4ZqbvckumzrhR
 VzHrK4EaLNdvGVvpvzCqVg+lao3Ze8t/g8dHlSQUGz4uDNF9caS3kvpyqdRe/6MHFM1r3HC0Du+
 GKwPnh9RgBqznt7b/zoa44AB9KtgP/9LMftD22mQowgMWto5XI1N0Y4cPb6TL3PBmJkmQSvi63B
 fiTBoU6l5res5/vH2RuIug1cMVng+2t8eompix5jbFUnr3t9cm2f4SNOuTUVo6JZpap7J265oE5
 IBWsjZfpSptNolCOsELssC0lCC2aPYXd5tjx6jp63ntEd2vd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 9waUQYX85pMcULV-gp0XFppO-DYm_BMs
X-Proofpoint-ORIG-GUID: 9waUQYX85pMcULV-gp0XFppO-DYm_BMs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX1QpWxoCvusBP
 zAQ4EdyGhIwV+ww4OskKqhKc1NTO6iMKYvLIO2zweAH4a2TeWxs7m1zPSq9eSim+EJP/H9UJDeb
 R2E18HZ9UglyQOYWhVhNE2qjKP07WSfws2yP2Q+98e8s7BdwVWuQE480iEQUrIEM5wjE98CNY5n
 D3e6v+eOfFnfIHE7XNfYXxAww4qHyhGuWE+YZUGWE4PrPRn0RKVI4vfd8w9fFTZZn35dULUWVyU
 LHP567D9/G0WUZdqrgLntxhYELy3fqgE7n+9TgsoK6sfGZILiX/1Bg5lcorlVoSkeHwCZHDwi6U
 r8seb7Cxc05vAbiSPD68oO4JaYPCuPZ79jlQj8QyMyS3T4ZecUgEUDQYnSlrfQzQoW3zyNBxXtc
 PZkDLawn
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b24479 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NnPSNIktjdB4Ge1gQTIA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
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

Check that connector initialized by drmm_connector_hdmi_init() supports
AVI InfoFrames and warn if it doesn't support Vendor-Specific
InfofRames (HDMI InfoFrames are more or less required).

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index f031e8f8df57da15bb0f8fe21fd62f02a1576ebe..12ee06bad364183ad56a20b2bf9860491913a295 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -582,6 +582,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     unsigned long autogenerated_infoframes,
 			     unsigned int max_bpc)
 {
+	unsigned long supported_infoframes;
 	int ret;
 
 	if (!vendor || !product)
@@ -604,6 +605,15 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
+	supported_infoframes = software_infoframes | autogenerated_infoframes;
+
+	/* AVI is required */
+	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AVI))
+		return -EINVAL;
+
+	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_VENDOR))
+		drm_info(dev, "HDMI conneector with no support for Vendor-Specific InfoFrame\n");
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;

-- 
2.47.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F8EB2CC89
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 20:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353D210E657;
	Tue, 19 Aug 2025 18:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzFJ13Mh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFEA10E655
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHmfqY030335
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TBBRBvbZmhS5MEDtIi65bqiX0+TlTd1eeG9t75hRPEA=; b=NzFJ13MhLvh6Bnun
 6DKGWugHWCVVrx8FpY/hRr8H1/ooMbiRryBJkFoSclfqlDk91UnqsGfiNXDhNija
 m2dBRb9dm3qR781HHpFFOnQKhQSA6O4ymbUb322SP3N86Lj7hKKOrw4Kayv1/CZ4
 d5sTz240KODEl/jAlbTygJaarMMgDohV6MrBxXBV4mMJ/PslzOhTMVEsVl343ujB
 TYvn7n80AL4Bxcmq1mHhKjg8KGNiSeaahC1cYLRb6z4unbAiAvEUVsaUt+csbqLG
 mnjCA6a7AD2M4pR2hNlAM5tABWKXAoQcRosMgKLT5HrxqRZoh7YC8PV//NhjIYNV
 X7Vhmw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunwwcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a927f4090so129301876d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 11:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755629859; x=1756234659;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TBBRBvbZmhS5MEDtIi65bqiX0+TlTd1eeG9t75hRPEA=;
 b=WzCBDwl3vfJiEQv2Q4NFk5ZmJXow8hKDcQDyZRvZe+hHanZ+8L2vKYcLxpr9TA41Si
 MjyuuqRlE+MaKyRG6jnSnCPNTKRDCfGdpVBQu4CdWMae2hSeSvc0LsIoTWTI8/629Zyc
 AtbrreLbQMNumKCbAe55bl2maPDSDD7UcaQLCGQ8FFGIb5uZcmSjGiMmOS+6bqrf/ZZ6
 4q3hAFteB80jRLGRAun1hRdHa0olfsfU5jbCzgcK8RR86YPbaIPvuAOvEWeG7I5O0rTF
 tGFVZcJzG5deNDfrzrB4AzQiQ7uAP5qx+w0deCNHtpsd28WZXxXpxIt5TmttqlQUWjNU
 NYFA==
X-Gm-Message-State: AOJu0YwC0PWhlUOChkxEtjiVnHUCt+KIjGq97P1CFkyKg99Yw5n+jYfG
 rXfmXggk3j4u+owSqvpEDiUcWWO4OdTle5ezIciL+B8XGT7hcB/Xr0bINwOCcim+nsoPHzxWvbJ
 +Gbb1KZyG1JBTRSV2fUdimC1FsXKOlyqNxVfQ5Ot27OhZFkVh/ynRaKULl6z5ud78piR5NE8=
X-Gm-Gg: ASbGncvXMS4wnEBRf5MKXMu2N1g+4ENyHOKyMuW7VjgfOMZg1MTwxUZhpMmTVDRiAPV
 GOwOnpW8zVxRSx02XQ3l7SKKeB6JmlJ1jGyxCdhcDjEW1+TSZBCPgKFoqV8SeBP+JKneZxZh4kT
 gbBCupsHVCT26x2CFE4Pu7tglXRtPawDXpn5TyLfWGso76VI/ffiqXbJ7kpFNobjS/1i6vB2B/3
 7epJNjUCZaXNICM5DDxdJ/47oP8zuLl/5SgwNGAxYen75xUq1ntmO5sGqzX9rNxRhlzVGh34CT8
 pkPDhf21K2mHMO7ohMHNg30aF//7eAf+G/7wliIWPZ2kGoDgTIG6N4jQPFY5M+TwiSU+2F3+rBJ
 09z4RrrofnFxNY35NeGL7BpysOrNjunDFgzbULZIEfQKRV5p80Nbb
X-Received: by 2002:ad4:4ea3:0:b0:707:a430:e01b with SMTP id
 6a1803df08f44-70d76f864camr1093146d6.3.1755629858918; 
 Tue, 19 Aug 2025 11:57:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/O/W7rZNwwvVUGg1YhZMXZwis1OZ4X2shsfzNvq0AeHMh3ORjwG9eDWtEMthq/2S8G4RA+g==
X-Received: by 2002:ad4:4ea3:0:b0:707:a430:e01b with SMTP id
 6a1803df08f44-70d76f864camr1092586d6.3.1755629858342; 
 Tue, 19 Aug 2025 11:57:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:57:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:31 +0300
Subject: [PATCH v2 2/8] drm/bridge: adv7511: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-2-7595dda24fbd@oss.qualcomm.com>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
In-Reply-To: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ics5UJu435PTkR3N2XAnDPkmPWB0LL/sCgBg7ErLZlw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkbp/0MMomngf1L19CchYk3PLIvKZT5b3Sqc
 f6uAOG3abKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJGwAKCRCLPIo+Aiko
 1R2QB/9n5FpX6DEBpD5aLDh4BlYRZz+O8I9IOmTSO5TVq+bDT1D5c2WLxzQ4Td4kBMk1+Uu5p72
 3Qxf+QIPoHmANeB/F9CQXl2GSb8D+EPFfAiTZGjv68fM99RgbuaegsAu0O68QJolHhicnH3oG//
 neaovHBHmAtObPBED/kl3uRy0BlRcx0hhOyLx9xzbQ4SBmRlJibWr9zwLUyZea7P7ab+Qm2p0zL
 McKbULlvp0OUS8K+3ajdL40S0JMbYFxygrjTMdABv1d7mveJyp3GI8I9mLJjT4KrSEvy7TxCTDj
 BbL1/CutAHVSKCOEN5VVNxy02M5cuXz0Umc8l126pp2h81O4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: WkIBREh5uI7cyWGut9nz5Fyj52LdbyY4
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a4c923 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=BPUVXzEUzielt3HhGKsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX1uJFoMaHDVj7
 cAIuXBZ7YD7pEM/MCf4xg6pE1eBsGAOFv4YcFdgwXzWLcfvuO2GH5BqUeK9pN6k0X35vLrnrk6Y
 xcmx/1grvGGmD7OQdKOrb9dYtIZoy3BDOBohng8l1x1DOJMYq7EFtLQUdU1r82y7JMzoJEjvyYC
 2nyz4yE3RzXPL/8S9yFtzzJI+0yW/g4GFGrCfs+BQOy6QnDv/y/JCyMV5Th83tx6spp2S7aQvy5
 Ms6sDcL0A3lXuRS49sHIDlTFavZhC/vifkWlO29iecUBwxl7wsV/wwNvLqEjjTcZeYfqig0qQNA
 CR7QnWWMILfvDBLjVZPcSszhyjpNCxQcTn3Pj1+e0dXO61M/pe6ZYiZvj8K5tuusEIOqC9oyPrT
 70GlUoeW
X-Proofpoint-ORIG-GUID: WkIBREh5uI7cyWGut9nz5Fyj52LdbyY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071
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

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface. Audio infoframe is handled separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 00d6417c177b430cb1a81118800588b90c692018..a9b2757d7a2cda1064cbc564cdded429056dde0a 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1269,6 +1269,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.vendor = "Analog";
 	adv7511->bridge.product = adv7511->info->name;
+	adv7511->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_AUDIO;

-- 
2.47.2


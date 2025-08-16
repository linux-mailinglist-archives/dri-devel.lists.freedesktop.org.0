Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA74B28DC6
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 14:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD5E10E367;
	Sat, 16 Aug 2025 12:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzF61BOf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C6910E30A
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GBfcWA009008
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TBBRBvbZmhS5MEDtIi65bqiX0+TlTd1eeG9t75hRPEA=; b=BzF61BOfHC/Wx1vM
 JMbO+2U9ceQC6hSZZqpe2WMC+JYUUEUgHqmV2su1bxNxoKe47vYUAbfiWfx2acoN
 pZAWVO9TtuTS5hcedjk4ESPa3OPqJqQsWJLC9CKb64lNo8sW2j3qSTCpYDoAInI5
 RTkRAaciWPSackxvFAjSLUACz2fLhcGxoiAcZeGcZuWAxtMtFWl1sTkFIKsdOYEl
 RK2k5a5C4CtUoWYrVc7IoM3RjdE1l9eYP/qtg74Gm6wSsOQ2KV4Qd0nRVL3iUlA+
 iF60U68OWNMLyzMDGvzaU9hJdL7OlT8WU5Tx4BrDyVrdzitRaI6hYqEOs+dAlcu3
 /2476g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfrk09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b1099142e0so77742431cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 05:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755348069; x=1755952869;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TBBRBvbZmhS5MEDtIi65bqiX0+TlTd1eeG9t75hRPEA=;
 b=lWftW/pIugzlN4x+durgWL+KTECHnCk4vbe7BKakTaE9mOWG/xlSEdoJNPTryPV3jb
 rQRSrGsgvvAtoRjrmVyTgrAQ9epgcPxz/Ty4IZkFKuSrWAkPKimnBF39v9Xdl15JOD6K
 PNodjXy5zpYR8GaoKAyZ2eaKFuoNqcqWgyPWvCjHgH3LzgVv1EM6tETYhBkcu0MKdvkh
 X5VeYizUlqFDzah55IIknaVUkHlvh5i8mM1SUSjHXR401lQgr18dGtNwLF3HOSZ2yYB+
 TMyoCTETtcL/OB8LiZSr2BD+XYjmtRwXtOImRnu5rhkOOTCmsjNrW/wdhEp+1gSoWRdd
 ayPQ==
X-Gm-Message-State: AOJu0YxhAc4yCgWCTHJR5l4fYUQqJ2gmsJyx8mEf2IXkqLBVM8M5oc6c
 N7alsmik11Bn2NeXRXg39AguiJRug/npeaC+U4had6vlTNXZkAbc/OvgEi/3GCr9DeeuUpzmLC4
 57jM4m3KyyORQhq7QG5VgWOoATBssrGr2DDMDc5uEIX8RL3Hq78fyDoXKY/WFlsFurhLEors=
X-Gm-Gg: ASbGncs23UHHkQuUqZ+S6JBQR+w8LuBiJDaTTWB9a7Lu+2rn+IA+Y3f/BTp+xB0oG+j
 RhMNRV4HsPZeIvMya5WSIJIxADaAJCTQxxxmG6gykVrlJXdcq1LHpDjFemm++z1+8eON1xKth2y
 g2lFXnzJDSs7rCzutrXEJ7i6UE4BPHVgjhoThjV0U67M1FxXXGKRyE3KbhPADsclTprcX6TJdrY
 dvTbnPJ1sN+6FjzoshEye9neLObAGQ9ygJveIE0cFaWt6Lj+bfx4BRzO3tb/mk6WKR1yGuzQLXy
 BmbhWGtGx4r2Fq4q54xiVVVEp75CZ6aCF11Ry6/qjY8YUNnJG1yXPzG9PAk3b/E5HX4ad1o5kbz
 /86LPY0Pbg8trWHX+4gUNVP8yRSRrY/wfttIjhFmW4bkAbLTCVbyq
X-Received: by 2002:a05:622a:1108:b0:4b0:ec28:6fee with SMTP id
 d75a77b69052e-4b11e23aceemr77142821cf.38.1755348069175; 
 Sat, 16 Aug 2025 05:41:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEujKVPrwnqPmVwBrT/6yKZDdIPm7Rj84fddbqZ46SbGO9mqJHM95gjJV/0J1FbKa4y9npTlw==
X-Received: by 2002:a05:622a:1108:b0:4b0:ec28:6fee with SMTP id
 d75a77b69052e-4b11e23aceemr77142321cf.38.1755348068724; 
 Sat, 16 Aug 2025 05:41:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 05:41:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:02 +0300
Subject: [PATCH 2/7] drm/bridge: adv7511: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-2-6dc17d5f07e9@oss.qualcomm.com>
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
In-Reply-To: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxfM4SU8e3MmGmakUS5mUvOK2lRk5Rg6pgaF
 Culi/ZbaOyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XwAKCRCLPIo+Aiko
 1WmoB/0R5TBxmhvS4QiRmSEhjsQzSxvsfU1laRFx1oRGjZ1ar4jAOFsu3PQIsiMObIXEZWQYtlt
 Dj93ckAo+pDbud90Fki0EYit+uS7JUpd9EiQbxx96Jg0AkYoYu4KGHxOOUbVAXzULWQ5nEQv1A9
 tUjphXky2tRQvOSKl1/pTUPmRBKOOsESu7sQ6Ies/giG2MuIzwKB5Rx1FdxnfB0kNoxYZG7x/R2
 ETKyAzxVXIvMtGQky1Q8JGRdf90hMN4xz2OPiK4qyyJoz0++r6wWjj1TNzeHLacbKh5IIRzQkje
 GKf1BwdeSqphn8lh67+Vx9V3VP7Kb7S7DfYbHr9aVVy1SIa/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: YGPxWIN5R0MjOoJ8jGb3S53EkJ_lDg5-
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a07c66 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=BPUVXzEUzielt3HhGKsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX3GJ/vLrifE2/
 1V86LulL14EjT0ZJyJPBV4P6O+wXlJ23F5WUCu0fU52+NsQDMU2RNkH0EebzaW1IR9ieO3sZLON
 ehnTmHygrp7txI6sBFuASa0ZHalUIJHZKmZGM2jjmLGzIERQU2R2tbvZKQdagpDK9BE6EohI7DV
 T/7yMeHIPtdbzYE+26ZkpTf70f5Tj77xQSwn3OsUWbnga7M9BbC+3yZQ05VgxIm7UlUonSc1OW4
 Smwx3KMkr3HNtM1jlm07UdZzjGP4QsmZYtKYt3w965YR5V78n8hqhce7w1Mt7b/Namxio2CKRb9
 cQOiHS91D3XveUpGr1JyZWQWro3FzG9A/PUhL0y2955Qzhb6CR48C7X6Cl2icnNpt0grYGq0N15
 EhKAJSHi
X-Proofpoint-ORIG-GUID: YGPxWIN5R0MjOoJ8jGb3S53EkJ_lDg5-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B185AB426B6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 18:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D766A10E8BD;
	Wed,  3 Sep 2025 16:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2Gb7edX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD9510E1A4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 16:21:34 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwqWA003430
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 16:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Wx+UlrREb+3/RGIeIiUTNYYx077VW4T/hjO3EUFT8ZU=; b=m2Gb7edXXVao1k5J
 t84qWBU3WppUi6waOTqqsCXrxGeebyHuJGhr3VMWGyiAsGsUaC8FUvVHxKVIi1IN
 RIsQy71NPm4UrMQjeXv923G+gnWgrIDpogDSg+zDHTCXDhMDaPlUu6SqGZeRjLEe
 3iBEDlEvg+1Ym2BSAQhJmrb9jz7+RDsoMDEth5Nglv2TThbXNg3BXAjvXgn2/Oa9
 mWcUKh5FyLiwW/JVVzN6TA3QlmrTBWZ7lJu+kPHwkqc343RMNczeLBndNLHBgQEc
 geoEhOUNhJBG0GU1GBtcgzaVAvvwrYcdO9gF5OJ0RWw4iZzbW9HNCf2TE4bkKGjn
 mr+jHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8vaed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 16:21:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b319ed6427so2761051cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 09:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756916493; x=1757521293;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wx+UlrREb+3/RGIeIiUTNYYx077VW4T/hjO3EUFT8ZU=;
 b=kQDd+KNVlyewyygNKSXQuhJZpR7dvHPHwLaaF8pZGRwSoVjuZrd013KmHzt0mWSJiY
 XwAaMqDm3oEAX/BtSZEeZ/wlN43mrptlT1CZmRAKjaHWMXJ0gukidMKsP1vv577QO01n
 yKiyrKDv6NwCEBBnGOOdOIo1QOjyVQRsehvSneL6VXWuScXaSxuydt6yEvD3O04hbLhv
 j1Dj9Z74Uim8doL775pP/pQePAGuptUjFCnv5/PNFRCB5aukRRLfO9RyIW2PA6eIwpx/
 Pc7UzATh/4N5MNbhdOpIaxUiXSoukf3463No3VLIqL8m+W2e4c+Y6Q2ZdJKeqhLuOjck
 1S1g==
X-Gm-Message-State: AOJu0YyorUyGlf04SH2Wz39Rys8XJPqoHMNLpY5p25GWEt7usPiz+W28
 nvVY1LvMbE+ULAYlC7Z94qoYPtO6sb+o5pELOtNV5LLHVn9VDVUwS8adzqbHt0eePps7rWWK7ut
 ogcupf/zez+ophH+Dypf+y+8MV2G/5HvYkdkEX47icC2CPwTFoJM7wF0wXq3OOBMsyu1Tuc8=
X-Gm-Gg: ASbGncu0lXjt6f9rKW1JeaZIoOOYib73nfhpShDsmUFgKMwv3aFzTmr7VKjJTEsaohx
 n+Z9y8Fb0xYcetlrjCS3K4g9c1sNhacKIvtGHs2qVLqYuZvqlwAlMzDpGYv0vI3+a/yXQ4Awlqi
 J1JoI/ULgmGK+hfYtBIUpyseXPSbnIL6AJuK0nu6UYCpJWv8ImzwrC7ngcNRYLcOz6eZH7RcbK0
 bE48XYmBTxsriXEc3hbsH2Y5haF3tqoqz1XQKIYO3Mw46dN5Fn80AIuksc2C7whAWwTwxG9C6AO
 CnA8bxkDp4yDVLyqppPuYbBPiEUnb5L3pOMNlvXvtZVxJKQ13wepzldchHH62B/k+SkFfpn695e
 VwmOhe3s/LXMIJE0GEy0XPUQZxqyDTcbgd0FGV5/W59IH2buyo1dC
X-Received: by 2002:a05:622a:a953:10b0:4b4:91f8:3b13 with SMTP id
 d75a77b69052e-4b491f83e49mr28314091cf.63.1756916492636; 
 Wed, 03 Sep 2025 09:21:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf6v1CkiSW8hvYYfOCZ0HKs9HsNljzMwkvZJAirl8aFo4JvG2SUM6RV5X1TbJS8z39V5tUyg==
X-Received: by 2002:a05:622a:a953:10b0:4b4:91f8:3b13 with SMTP id
 d75a77b69052e-4b491f83e49mr28313681cf.63.1756916492082; 
 Wed, 03 Sep 2025 09:21:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfc24fsm608343e87.104.2025.09.03.09.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 09:21:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 19:21:28 +0300
Subject: [PATCH 1/2] drm/bridge: adv7511: use update latch for AVI infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-adv7511-audio-infoframe-v1-1-05b24459b9a4@oss.qualcomm.com>
References: <20250903-adv7511-audio-infoframe-v1-0-05b24459b9a4@oss.qualcomm.com>
In-Reply-To: <20250903-adv7511-audio-infoframe-v1-0-05b24459b9a4@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2179;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pir/G1LGNErUNeDZyuevq3mx0Sxb/EfIMpFh1snKzdU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouGsJ/rUjjvcobAYlgYl9D5anTzOit4VXG0+Vc
 F4pvuMitKmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLhrCQAKCRCLPIo+Aiko
 1cyvCACHQjt8qQi+bCnWmNxVD5VJ87xL2pZs6Jrqd8wrltjqGVQc+M+lkfjFUFPtLzrCONN9mom
 5ViUqhdpz00NDmJqvF7VjTXXzjr3+KFtSjEf/p6ua0VnpPVviOYwTVCfJhLGDyPLk1QLaHVfVri
 4ZS0Pa2oOnbvM+p679TsCppO6VQl/1/FsNMoIG1R11N5mTGq/AuDlIOAHCL00DMHGRfsgTmL+Il
 cb7sxF9nDz6grWFYi6Mz93JmwcpM5TRckWJ1HIlEadX/HfNNNrSR+zReGR4b9f6DH59TJ28Gnsj
 LmQoKQSuGfUIPA1DOECIyhMnM7Xqa4EGRRIh84w5KfagAc5B
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: MdvQC2FEHdE5sFzV7PoigE-Tc7_t5-w_
X-Proofpoint-GUID: MdvQC2FEHdE5sFzV7PoigE-Tc7_t5-w_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX2vQgJDc2hfoz
 4kXV6hxn4fo8P+dRcJEIOH90ieGFmgkx3qKDUB6HyQhFxIPk/VP5Vqa08SscL8YXLDljuzE31ZH
 c/wqw3o6/WYGFW4OxaiQSEW4hEbQMDkbwzcP8ts13nF1UPv2lbViNz/3t6y0bSrZ3wL7Z+xrYtv
 qwtpxjOO1YxgAfeOXwkAGH757lG+PDfsFsrkSTqXZQNce43KwBXcjYodkUoVhztfTNQjk/rg1FW
 uSsNb5euNDgKzkcFqYTwNkWYST/qQ7mnICKolEoSv+GR8LFTtt8hoTyPbPSLM00wNf1YU0uP7Ib
 WdNA6d4LcFoRpYRVQPOIKVC+C/B+m7dJ4VtsI5M+Pery0rXG4LA6ATAQ86dUcehZrf5ffGS+een
 jkNbM9GC
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b86b0d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=CjEKKNCaXEvhkZk4MagA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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

Instead of disabling and then reenabling AVI infoframe, use the
recommended way of updating it on the fly: latch current values using
the ADV7511_REG_INFOFRAME_UPDATE register.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 26f8ef4824235a9a85b57a9a3a816fe26a59e45c..26f8310382d8d1632dda5185b2b0230b59a6063a 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -916,22 +916,33 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
 {
 	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 
-	adv7511_bridge_hdmi_clear_infoframe(bridge, type);
-
 	switch (type) {
 	case HDMI_INFOFRAME_TYPE_AVI:
+		/* send current AVI infoframe values while updating */
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
+				   BIT(6), BIT(6));
+
 		/* The AVI infoframe id is not configurable */
 		regmap_bulk_write(adv7511->regmap, ADV7511_REG_AVI_INFOFRAME_VERSION,
 				  buffer + 1, len - 1);
 
+		regmap_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME_LENGTH, 0x2);
+		regmap_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME(1), 0x1);
+
+		/* use AVI infoframe updated info */
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
+				   BIT(6), 0);
+
 		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
 		break;
 	case HDMI_INFOFRAME_TYPE_SPD:
+		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPD);
 		regmap_bulk_write(adv7511->regmap_packet, ADV7511_PACKET_SPD(0),
 				  buffer, len);
 		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPD);
 		break;
 	case HDMI_INFOFRAME_TYPE_VENDOR:
+		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
 		regmap_bulk_write(adv7511->regmap_packet, ADV7511_PACKET_SPARE1(0),
 				  buffer, len);
 		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);

-- 
2.47.2


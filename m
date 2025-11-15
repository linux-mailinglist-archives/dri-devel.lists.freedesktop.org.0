Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC821C5FF65
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 04:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307B510E28F;
	Sat, 15 Nov 2025 03:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HboKQy1y";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irIlHTQH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1D310EB73
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 03:43:02 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AF0gmP2837664
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 03:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aamIlscdOZY2NtMNmIDW1DpTwPFXcWriH5eM+ZN8CSY=; b=HboKQy1yA7vhgXyT
 P1ia12JurKgStGgWb6jbJ4jftC9Uz4xPMG0FfCZ+xi8gG1lwxVQg7zReFC8weKGM
 erZsILtU3/ib4bpGndhO/ubNd3uU1Qwb2GqPvT+w16xjxEySW3Irj6+oJxLpP8Hx
 NMQQFIr6LT/xrzIMB9nWfUK40SrZNsT1DAppakH7D7Z1LtZNBLMvoMu/wXqYC7uT
 +2ZjxSOkQGwn2jh/EI5yllCZtC/gwyp91jUqRE6CLwQN8mzC639r/4HKIyMKgVrv
 BPaS0/nHk+NEa1O6o1E3f65EX+wGR/98n/DnSorOoZc3JiFm2nVUig9XxiJXGYfa
 06gEWQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aef7f89cn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 03:43:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8824b00ee8bso41836006d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 19:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763178180; x=1763782980;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aamIlscdOZY2NtMNmIDW1DpTwPFXcWriH5eM+ZN8CSY=;
 b=irIlHTQH9Ue9O8KLcoD4gIQ3+dEOG3TLAcLlg4wA2YaOVac0Danx1/463ZGPhVQNhI
 Y8b5mSLiZG9vC3EeALDQHqaXKXjO4OGw+YssemeXUezc3M/wiR2kYoV+1OCS/JS+qGix
 WVaaZ0Py5OqUrxsowkZWqqRkHzBpvxuHE7dcK5Lku0EzcsR2v6rf+Sz/bp9013MG1FhB
 fzf+8EFJ+FZQUIo5Xve8YKaqBacfzff+NAm2pSQwbh9mOyyE4FcR9X1X/F1Uht/IQXuQ
 688FkLkvsgvOta+wtvLrUJ2sH4s0c+2tNQPuS3ZMecxceB4qA2hy7a7Di8KdAFGP6PgH
 WDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763178180; x=1763782980;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aamIlscdOZY2NtMNmIDW1DpTwPFXcWriH5eM+ZN8CSY=;
 b=ACAC4KmzmP1uiguT8gC4dq+iibeAHcOwkCUlRE1HygzRRH1RKgpPyi3LeyaHJ9aQC6
 vX4QHE1nt6dAr/a96GwMlr+Y5Dstp+UfKozW/l4m3iQNnfcvCTyoCUlQFFW2o58zxTKe
 7c88Tg8jFnJfeaOGm3/DXsz04/H32DwiBquGr4nK0teiaYZ8MTG92q+bDEO+ih6XiccR
 2oCULqkmzY2HwdyY6oUcEEBvGiuRFab2tRjx2XjjlfAcUNrDTZA4+zrg9b2Cd4+OHfsC
 JkbhysWcJVhtmwpk78WnQ6x58+lARG9d6KBhbrCITDAoRaki0SpvOxZ8/gla9f2Dq62s
 fsxw==
X-Gm-Message-State: AOJu0YwrBR5uTkfht4kxI+tuEDyW9PrJcQHxJx3CRdkxo3MHkikhcAVI
 6yoQvbvUmmiDa2kIzmOH3/OsFpUIwAFRH3tbiHfgbSPdI3azM5n79yWb3lwSZpS1J7VzP9u84HC
 oYKIJHLu3ECnl7P3s64KH2Tped6nSvOCyXaiF3T+TeGxXEkA90d/FimQrfpoIyHAhGLu39UTSLJ
 XcUgw=
X-Gm-Gg: ASbGnctdmU+z0UP5IMPR8GjalYiRaF8pMseO8OM76iKRiaDWoR0scUICpVs/Wc+N9ve
 iEaaVTkcCO3/Cf0a8mJ9Y06Fw4cEssDdcmlM25qYuW53BWYJHZtmbclS3RONDuJ5kFxGbHLENpW
 EGsS8rwkmocgkmXyy2IsFjV9teVtG3JNzYiEOYvcQ3AQ44V5AarGTIKiJ+jgtfCQD+hWqTNqXxB
 9x+uYKetKh7zcyAC/UddDBXji06hTRMSufgrCtQaAsm6EQXs168ghnOlDM+jHy0q/3URgu+TYl0
 1vXe6VC2wODqr+HowYYRJ0gfy9zn4rWoUDWmUeA/taVqNg+srq5pdeV16Zehbj1FAzcDcTIWfO2
 8tllWZ7EruAFj0aNbXNEfM2LOWfg+Rgs6dg+c3/sb+IwxgXTlIKjtA0XzLlfoK0KbMUp3YWpSMj
 +DTY81ROQM3Wyp
X-Received: by 2002:a05:6214:248e:b0:882:3453:8248 with SMTP id
 6a1803df08f44-882925f67a9mr77231996d6.28.1763178180251; 
 Fri, 14 Nov 2025 19:43:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhVxtE2vzDpCPxpniykwzQn02uMaRseK9nYWsrY16MxhuNwjNND/ElPUxOxZWzG5XyLWKoMQ==
X-Received: by 2002:a05:6214:248e:b0:882:3453:8248 with SMTP id
 6a1803df08f44-882925f67a9mr77231846d6.28.1763178179750; 
 Fri, 14 Nov 2025 19:42:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040578fsm1475880e87.78.2025.11.14.19.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 19:42:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 15 Nov 2025 05:42:51 +0200
Subject: [PATCH 3/3] drm/atomic: verify that gamma/degamma LUTs are not too big
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251115-drm-fix-lut-checks-v1-3-3586f5855bc7@oss.qualcomm.com>
References: <20251115-drm-fix-lut-checks-v1-0-3586f5855bc7@oss.qualcomm.com>
In-Reply-To: <20251115-drm-fix-lut-checks-v1-0-3586f5855bc7@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2089;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4P1wMVl+cr5YuoK0uLDDF4U6r3t4wXggB06NKtuqjxQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpF/a7T5WnPS0+6Tv496xy0Hm3V4HUcepWVOh7+
 VCvXzZ0ycWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRf2uwAKCRCLPIo+Aiko
 1YkmB/wPsLc6KEvkV424vpLAEbHyA6xjgnMKZ8tD9uJ/+MD6hxhPqfREqsSyl+MQ5pLR3IceAoS
 /kRCvgLGHirkV2I4x1xAwX+1Huqe2X8PL9InneIHyOgtV+G6Tm+sOxSeroduVzfJ/878dKw2rdh
 +6MQwO5CGzxmegoJ1uwt+cmQFi5ZQIRso9+YbQNSZUqw9m/54fgaZsDYyZ1CRTTNtRUkOBGBSTy
 jtzW9mSXfn4oeivRipQEgsOXmacKBxIU2LgE3wcFCEdbZoEd5dgrBG/MzM8Ll+XI/WbUm0+0pfd
 oUmsdaraNAe8qLgCznpVkSLyzHlVcKwODR9r6MfIPXGnNohi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAyOCBTYWx0ZWRfX5Vyga9pqq/Od
 3uFhnan6m9YfUZfhVrJqqCda8SeOQ02PQaT6lc7WzTF+9tDf2xk1tmq2f5fC+IbxkSYICYMT/da
 prqa7X2/NVjCEOZbhq+m2sQm0cEYntSBDl7I9v6FeHoft8V2+Og2GHSDqQJhdnG0egxotNBnbPT
 Xt8IQPbi0jFVMbcFJnVk/jRg6etI7daFm+5iDdQudFp0uZwDqo7LJv38AJHP9ddDu2092jVM6gd
 4W1CrtEamsQUeMy+irT/0kgo3UBZaLOQA5PPTtSHflUYh0TagsKBYnd7Z+lFEaY+MQo6kLTbHKv
 nNshIhbFGQSporFCELx+x7HHG/vUo5eeRyaqlIZ/I/VryVwVZdgHJ2fHnCnnxYlpT/nxJx3fd+/
 qw78OKmUOKjW1CNpEqw9GAbIaHlUhA==
X-Authority-Analysis: v=2.4 cv=OslCCi/t c=1 sm=1 tr=0 ts=6917f6c5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_v5trmpiMvKuf-VRmTkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: PrU28W3x8xsIonuv1J6KEAe7L_b8fJfa
X-Proofpoint-ORIG-GUID: PrU28W3x8xsIonuv1J6KEAe7L_b8fJfa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-15_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150028
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

The kernel specifies LUT table sizes in a separate property, however it
doesn't enforce it as a maximum. Some drivers implement max suze check
on their own in the atomic_check path. Other drivers simply ignore the
issue. Perform LUT size validation in the generic place.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7d2076f1006e976de73c898a838ceb4b5c4370e4..178d983b2378e1910a8afff4da24e090f02f3bd4 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -384,11 +384,19 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 	} else if (property == config->prop_vrr_enabled) {
 		state->vrr_enabled = val;
 	} else if (property == config->degamma_lut_property) {
+		u64 lut_size;
+
+		ret = drm_object_immutable_property_get_value(&crtc->base,
+							      config->degamma_lut_size_property,
+							      &lut_size);
+		if (ret)
+			return ret;
+
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->degamma_lut,
 					val,
 					-1, sizeof(struct drm_color_lut),
-					0,
+					sizeof(struct drm_color_lut) * lut_size,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
@@ -401,11 +409,19 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		state->color_mgmt_changed |= replaced;
 		return ret;
 	} else if (property == config->gamma_lut_property) {
+		u64 lut_size;
+
+		ret = drm_object_immutable_property_get_value(&crtc->base,
+							      config->gamma_lut_size_property,
+							      &lut_size);
+		if (ret)
+			return ret;
+
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->gamma_lut,
 					val,
 					-1, sizeof(struct drm_color_lut),
-					0,
+					sizeof(struct drm_color_lut) * lut_size,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;

-- 
2.47.3


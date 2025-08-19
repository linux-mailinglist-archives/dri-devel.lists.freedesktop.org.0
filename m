Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F117B2CC94
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 20:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D494A10E661;
	Tue, 19 Aug 2025 18:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ktGvIxX3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D7A10E65E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHYSOf026967
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bZCDNxT84H8d3+/4n1AbLc028ffeXusnvwh4O3/fxcY=; b=ktGvIxX3+a+kMRf3
 gz/jHRN9U197zjqXpZZ7YZ8G+x/JlXuA2fiSGoRmVgL7WZb6sYQpsm+zrEXvx+hy
 mnspKlHaAJSf+g1dWF3F5cooM9VxiR5yIhQQKfiShIkwmbwV+P0wkbhOPTE3U/Rv
 chQFJUKlx64hG3evIoUM7dFV2TUcd4oW3K7W65bIcDh8yc8dWRW64TgMfRCs1d1x
 DHzm9L3VH+uZzolr8RvK7qsjGhLQPkMbQrIs9r44Ne6FsvkyN8R6YWcLskzKIhGQ
 6dwqZ5RIt41yeqgg+vrBAOTJmkAasRsoJPMBue8blwIb28pTz4uGPnemmA6YF1zR
 Kf0+jQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyhnb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a88de16c0so129310926d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 11:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755629864; x=1756234664;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bZCDNxT84H8d3+/4n1AbLc028ffeXusnvwh4O3/fxcY=;
 b=IPUTXL9u+Brm7W3zhguWEuKaXQcOW8e4Ltf84C0dIyBpwYkER7FqZX46UpIaQs119y
 9jb0ugUffve0GDHER0JLoZe81UcJ97RyLZ50Y4tkKMrG4BBuvO22+VzTpPO+U6EAffaM
 ZcvyHkS/u+MKulTuBHLh6k0UBHhvZRShulJMRhjvqO6mOol+RkN77I8cYDFOx2xzLzkP
 tU6bZEeD6GFPJTUmBTmDTjZ1x2yAX2cEPYcz8HYIHd05GHYbtPVFMUHopyRjecRhQnwW
 6rXuO1yoj/mWTN6pV8jhXEAodFkM0JwPQOyiYha3z+2N0/6swFx8h2A6HRhm9VkLr3J3
 rjeA==
X-Gm-Message-State: AOJu0YxfI/n5qOpxOv3c6ymPFyCSL/HnxSCVNFKwpfgXHAAUCRveVo9O
 E77yr7eHffr/SIcVLUa4Hoe9j5eXQQ1YA9c5QwKYTk49qWNYgg4EBMCObKnu8ApPABCQrXdNVOY
 bKXWDj4Ysl/Yr9EMLNUxZ6JxHeq3PhCmM8hcSqHCz8UlM5qIRBe3oWZc93ACVuPSnNT/2ISc=
X-Gm-Gg: ASbGncukmOL2TPwgDdqdDkCZ3yjTrVMrr8XJQO3lao9/Kv0UFnpQgV6/TENfz482opd
 PuPpIuETFFZq5gy0RWyHVz//Y0fBSdzNr8gE6dd7RaI1s2ddhD6uy55i3lSNaTwJhZzpRTU31I7
 nzv2E2bofYemAgsu1kDHNMaIUeCxV8RwOOd5JaFf/J8tK2FHudjlW5Hrdusp/7WQ+7RwCbkbSec
 N0wO+ozq2A9PeEvNA5mWgh2vkRqYvAOhOd8LYDijWpSn8O6iurt+t359w7ofltueZYTeuVn6wxv
 0xD93YnFn+p1d9bbW0SjmnZGDsVPFt6LPuoTyWcHQN/geK/b2/jDHOECFLyoIP4rJEu3B5FhqkX
 hL2Lm72MpeSpUxNqFrh54hDqt4cE708C+2VaE5stBsQAqm4mVBND+
X-Received: by 2002:ad4:5bea:0:b0:70d:47a1:cae1 with SMTP id
 6a1803df08f44-70d76fe9438mr1113576d6.23.1755629864219; 
 Tue, 19 Aug 2025 11:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF43ghZ/MIpeDfbreZXCz6hnP/OCelyHPwjCR6LgbsWovNptiXgvN36/qqCklN5CrzagAqqhg==
X-Received: by 2002:ad4:5bea:0:b0:70d:47a1:cae1 with SMTP id
 6a1803df08f44-70d76fe9438mr1113056d6.23.1755629863654; 
 Tue, 19 Aug 2025 11:57:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:57:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:33 +0300
Subject: [PATCH v2 4/8] drm/bridge: lontium-lt9611: declare supported
 infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-4-7595dda24fbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6MDUGd2gCI/EsaEXrxZU0j17Xf9/Klm/EGghvRMYY3A=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8aSkzITQ1nce89WS/Y9MI2V1Mk0SPCPC++fUsMYqvw4v
 GepeXYnozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACbCHcv+vyLZxnbB1wsbO+xv
 1qo28ix0zo++mb8okuswxyWh/3xVotMKTuYf8z6zjeV1Np8N32v/V9PcMgrOatTnvj/sF8jVbyC
 Yr+dwTFb+3N/bp7jfW6xT/Sq3c0/Xse5fX0qs6ndclFiw9+RtNYmksPWLl/2TX9K2SqclvU/h5q
 FNtS8jTszyL7rlUr/ZNVNMfe4piQT7Lk8uji3H5Xs4V9XPbn94lYfr90v5rEIHdZEvxRlrNsyUs
 nzwwyrYPkkwaZtNT8UT/lMG3vWeEwJDzCw/zJjlUHmoanVT76fl6Q9eXp6kVZ1ff/FOuXldRolj
 qEGp1ane8pidVfIbmfb733k6bVb4ivd9bkcK8/Te1x0HAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JXnQ5dK4dM3nNt9WKYt-9YdlHG-jIiZa
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a4c929 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=AMvF8s34Jxw15HKoVo4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: JXnQ5dK4dM3nNt9WKYt-9YdlHG-jIiZa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX+83i2oCTdmwZ
 Ly4uYhNTgTwIEjYlGCcUjtwVKxk6rYXUN0LM4keyxBlv0gZ7TWb3ZdlYC/bPiTMKSfq/8FbUV1X
 47eCqMpR6mp+Om3aJV01L8BZGJ5If0wiAHS8lSblN7GNK2RlmeJ6hYsT2/3I4pBzkIYQfGQub6S
 nrejRolp9QxYD0UikNN0uzQv0sDAhgNIctgfLgIaBZEJQiwYvxEeElM14kTqpsyXsnUTmKkhh9s
 Z37h1SMHJRbsuJwJlpNztIHg+PnBQTPFu+6iFTw1HwdyXQUWurr7Sy195naN4ZYKXLAJ5z48VQs
 94P7ch0ftprFKct2zj29yzM1EqIjpyEOxCdsjmV4k0tfgrp49NapoCn3Y/L7HSdkG/tHkED5G6j
 tbqJPf+3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028
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
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744715b88eb66883edf69bab4c274b0..08cb6958b9154dbc516aeb0623a8fb5e4af1df92 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1136,6 +1136,10 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
+	lt9611->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR,
 	lt9611->bridge.hdmi_audio_dev = dev;
 	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611->bridge.hdmi_audio_dai_port = 2;

-- 
2.47.2


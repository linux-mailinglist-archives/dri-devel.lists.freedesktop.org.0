Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE042B28DC9
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 14:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B4D10E378;
	Sat, 16 Aug 2025 12:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLW2ErZd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CED810E371
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:16 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GBur0q017026
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bZCDNxT84H8d3+/4n1AbLc028ffeXusnvwh4O3/fxcY=; b=VLW2ErZdpDCW/AKF
 Eb4TUwL8MjplBqe2x3FPHhRyH48tvPOKFwg6snGM0nNz6M7+j5WEc41zOXhU/0Sl
 uyBkKXDVw3BdQoyz0PEzfSjgKJsxV/Zurr0DlFa9070Z8QAnIK+KCxAPuvEt0UlY
 CGp/AnaoxY2nujCPlmjkp6WdqZY39FJa3mY2LCoS3ZeESvZYGPsrdUEdwHVhVlot
 SIPNQ2rScWi73XuMo2bGnNJVaYPcaicVStR8wKdsWTaDwmWErwJN8JNR0mU5YUDi
 9B8PIxKed0FJzbugqGtjwSa9Paw+pM5ln15awOAH+/QDuZ96galVAtxhYmkaYdzq
 G1jgng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99ghnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b1292b00cfso6722581cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 05:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755348074; x=1755952874;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bZCDNxT84H8d3+/4n1AbLc028ffeXusnvwh4O3/fxcY=;
 b=ovRTgYu7i5c/zvh1JywVIaKsDwmVAc0q88p0hYF96TjnfU0vUqUF5ZKPjfaNBqcKAX
 DTkPGYytx8OUhCZujZcUHbBiKbkbGEk1RVL/wPA6ZLxEGbuNpdYlbfzXXBuj13ndIIPA
 JZsuBHgqGhJtAClPYQV1OTmAL80p9c7tHo+AiE3r82K/ArK0lm94ZXaPu09doCibnWPc
 rz763BEoFO+jazA8zaDMpPoPmzQR1SINXJPWh9YtDhn8uL7aQ303bnkn6mdmeO7vb3JO
 fuxbzA4hLeJMLwNpan5pdxQyqmXUcxVevL+lB9AV6jY4azxezXqTUhLjOfQSQWVuclgX
 IPXQ==
X-Gm-Message-State: AOJu0Yy8MpB/rOEhmiTEpskX2o41Uzvk2xG/Qz8gh6lfU2+TNgf7u7Pi
 Mr4A/2P6SgUr2zFz4BfbIj8Z/c9MRGX4DN1Y/JH2y9zG/mfRBpEmcWFY/gCLVnqnBVAFRLBfEir
 FYcLUq/UTyxtqTtCbLtZ/E5Ji6asDo4piTs1fT3G1skGbLC727wlL4MG/orcAbYAHY46SMXE=
X-Gm-Gg: ASbGncu5VW6bPvJ5s3k2vzBSWP0x8pzv7Ndgg4MS2LF5wliD+ADsna+7XE5Swf7Cin0
 wCXJXDiaDAMG2/FDcBoVlikBNwy//2XivOc9NFT8eJ+qSqRf0parl5Dps6IpH+EOeRpeO+aEvZ4
 isTDWiuPg3HpDn+Jueviq/4poHNDzxh0XuVPatLnoemSmgx27fuB0oMeqIj6CQ1IK8qygQF5Dzu
 Arps9NqiFNkxRtvT7zSfwt6/hTlHbjGbRj20jXsi1AccXXy7gDUo7nQlR0kd7J3pbUBVSf5/eU1
 8Gz1+PXjQe1RdDFbrthjLRgJ5sOPmje1W2uHW2YX765u3YpzbhtCMmbDbYPpeHp0iHhwmJzYjQW
 hC4GCWQtcv+/Plo128/KFMmtTQVoTLGR6q5pFKMcEDTr8GUAczIpj
X-Received: by 2002:ac8:5984:0:b0:4ab:5277:a5ab with SMTP id
 d75a77b69052e-4b11e0c2db9mr68298291cf.6.1755348074336; 
 Sat, 16 Aug 2025 05:41:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq+2D8bA6Exv7xwHUunlo4e1X/zZ2ZI/TlCYJHV66Jzf0On30yfS3pYH+kbbOYRboEDBH3bA==
X-Received: by 2002:ac8:5984:0:b0:4ab:5277:a5ab with SMTP id
 d75a77b69052e-4b11e0c2db9mr68298071cf.6.1755348073839; 
 Sat, 16 Aug 2025 05:41:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 05:41:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:04 +0300
Subject: [PATCH 4/7] drm/bridge: lontium-lt9611: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-4-6dc17d5f07e9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6MDUGd2gCI/EsaEXrxZU0j17Xf9/Klm/EGghvRMYY3A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxfeZjvuIKMDxc3NNDqA14HuD3rogLXgG1/x
 40vIEmKjtmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XwAKCRCLPIo+Aiko
 1Vr7B/9KbGoKGY0G6Zbc0PFJqwOln6oTx3g2EnrCz9bTxS7nuNcHvo4V4hVcxg3JHEn9XLW0aBq
 rcL64poAiL+A/Tk7OSFz76/ZS28ruSlHbEBfJykODqDlllZ89HEWOPZeQbxzH/SHmsO3bwa6Vzs
 gl9U1/yEFKmMWqDrHZKk7wJ/k8s+PAu66cGZrI2IJVQWiV6Or4n6hKa9wvloaFF7hKJdMqEUi9B
 QDjr0YsT5PqjevpATnBWoALz9MsgAIXYPDNDAsg+k9oWjqPJj9FAQq5ZHbLj4bCTPqetj50s9NP
 5ynpi+G/iWc0A4DOc71d38M10F3TXnligAlbQthOBFCoGKJJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qb9rEo5fkNGrP2jZMZcQcjAjYHHwR3Jn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfXzCYpHDDnGQSX
 3xtXTCk0ZtIaE1fO/BrHrN/JAeFj4TYzzNOAp6qPf9KVZKJZkNvDk1ZmEJCq4Wjq1gd5RZUUuW+
 xYc5RNAXG5IrWc1v7NFp8/17pwSo30BsOS9eIwcvF5m9xNZAb2gNqxzW7QwNl1Y70EXck3Nrq4w
 vdiP3NTp4qKMQRSVXCEYBC9xUcZrra5hyGFWTPelvCPBYP63awNZvCHPE8HPnp52PySOZVqLVjk
 bTDQwoA3sH1cA5xM9CzSniMXGau+YEtJEtNP/UrflRufSZVn2FQJ5AV5qiWgpXybbaz/t9IxgrH
 BnwbUk2TSMtoPFDjOBN6aTig1cRPTd59D2dRlJl9oDtenlDqfJfhkEbo70RCSDc4HkhUMtGEpve
 4cLJQwyv
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a07c6b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=AMvF8s34Jxw15HKoVo4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: qb9rEo5fkNGrP2jZMZcQcjAjYHHwR3Jn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B527A80CFF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 15:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B38E10E6BE;
	Tue,  8 Apr 2025 13:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnFwscvg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDBB10E6BA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 13:54:34 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AtnVw027883
 for <dri-devel@lists.freedesktop.org>; Tue, 8 Apr 2025 13:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VoddT4WTJIJT0yNhT4FC4b/bYXrodo9njax9aVNsabE=; b=RnFwscvgRGaY79kn
 CufrIekzoCXLRuK4GT6Br4LqUZ/MXzkW16QwRiGW94WlUpnHdZy5ZautnWgy9Psc
 6xWLFuSZRpua+C2ky1MIoiZOlT7D2CujIvLgdWBwz3TYLPYGZ4JOZubi6yljjAvf
 JRAKbKwUKl/dBQHt90//P8HYlU/EDekO2TJESAAYxc9Xz1qoLU1Wm8GKiR658qmK
 3Elg9YIcVfUQH5VIkyDwqTabJeW23B0wVFQSbuIxFIMilfEXYhYru2vTPUmGGb28
 pmBK1FiwuaekPL6PhF31u5BFdOzBNL8D8b43Ysjp5QPdSY9zIekIV1oojEMY6ese
 91eQRQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyyyqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:54:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e905e89798so76473346d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 06:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744120472; x=1744725272;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VoddT4WTJIJT0yNhT4FC4b/bYXrodo9njax9aVNsabE=;
 b=LVNbdSDNIQxTM8OfYiAYu63fUa6IPpzlNEOGvHXv6Fe5e16CIPYOfRlDDApMVnZdab
 KvzK437hVovHpdSsVv0DfIHn6lT5FxM8Y62Bl2Ol5FAZ/rYoCWrqBJFBCW3c6WvYUGaN
 /E1tk2F+SgwxbVT84zcFMColMHg00d05Vh1MY8uPU6MTbVrcq3Ms6IeutRBfRrjuAIHi
 1iV6by5r3RzOGr5sk+WlT/MEYQwrl+8s2ehCQiIv4CXu4zo+uLRWcb9JM10cXSkotAW4
 FtjRg37eervqOvoAr6z0mtJD1onWzmQy+bMevXLbC4LH5kp9a2lLMavlEr3g5Qz8zHoK
 Nb9g==
X-Gm-Message-State: AOJu0YxrJrpAJ/kek49D5gIJH4PT1/dC6BFg5SuopCgzgM6ofwoLN0vx
 DC19FNDuKON9SSnrHUkSooQYvKIXtFJUl8Jx9KZMrBr/IvHFGeIFFG6cy1O9ejstQVKIh+gYHr1
 k4czZ664LVUSvQLWWpLff3p+7qzHtd2e3G8rTYNhJWYoXxje/HCSfRlVQUORkx9YcR5U=
X-Gm-Gg: ASbGncsX5yM0hXd7PaX2yE5f1JdDRjxmPfRdTlBmbgH85BGSk4AFcPplsiqcOKa0W4c
 CjHLMCVmPe2BNGay2ac4sw9h8UX6AoXvV98SC9Ppg7jvW69UBdyRBRYPPl7u+t2u4Cpu0VIpufk
 swQ+HKf1RfFPaLM4Wb1rjvqM+okZver7ZtCSB5+cl3aSJIQq7312kNkkWiviE6ZTDq0euM/7vmS
 gcDPtn+GEk8FgXlwzo2/UPOGfrEIN0SF33q2HMZd+hkmq2RtqdWtUG0drq+MvWFGiOM6ufc+EeY
 Gq3NqfXsgnOQV3YKvEmNL5sKR14g4lvejvP22gfTsww6GpbcihGHmyv3GgZMaIwoRzCcncvxpqy
 D1BW0hsd0kCG2TMNDGv38Q5DymZt9
X-Received: by 2002:ad4:5d6f:0:b0:6e8:f945:ec5 with SMTP id
 6a1803df08f44-6f0b74a2698mr150976896d6.24.1744120472361; 
 Tue, 08 Apr 2025 06:54:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo5PtguWrlPQkg7PzNT6JSePd3gmBOQfxAcQUB3c3JU0H5P9uXM23N437IMVVcobqB10EG3g==
X-Received: by 2002:ad4:5d6f:0:b0:6e8:f945:ec5 with SMTP id
 6a1803df08f44-6f0b74a2698mr150976406d6.24.1744120471980; 
 Tue, 08 Apr 2025 06:54:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e672306sm1515306e87.237.2025.04.08.06.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 06:54:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 16:54:27 +0300
Subject: [PATCH v2 3/3] drm/msm/hdmi: use new helper for ACR tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-drm-hdmi-acr-v2-3-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
In-Reply-To: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6543;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=m7dH730YTdioUF5BVViTo6J7jKQSmTmURsxOFoLc+Wo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9SqRUveFfRw04aerqV4P1mxeRUVXtv2YfHPig
 cIqw6Sz6R+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/UqkQAKCRCLPIo+Aiko
 1cPYCACXyHEU5d593vgc9iDjQqplYCWxJZ93UbGcZfD1ZH0Xfqdy1Qtquvs1tTi+yEuDsXtp578
 EUJZJws/+kRBMjcM95QDIJiWifHuirYizSbSpj6d/qi8qfGh54EK9TEG1azNWdwgwqYjG/VMWDv
 vt5tJivF4ADAa2D0YzINUtR4WE4/+fuMZsrOchgAecygGGIxEKcQdmgZeZNKIP4pYrKLRw/PluH
 gVr+B3LM3NMq+VO8GGBsi+F43msoMbFC/t7vUdjdKPMtVm9EcKoTHqyhfeoE0iBVZdOY4zOYagj
 HzhkW/3QEMqUTUN5r1BmzIglWJ2TUxYe4gtA/qlbCy8TBkaE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: yUE0tItbUL4nHBLk18rl9fF4qR_AXsyz
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f52a99 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=qxPvP1J6ODAoBo1RHxQA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: yUE0tItbUL4nHBLk18rl9fF4qR_AXsyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080098
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

Use new drm_hdmi_acr_get_n_cts() helper instead of hand-coding the
tables. Instead of storing the rate 'index', store the audio sample rate
in hdmi->audio.rate, removing the need for even more defines.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c | 107 +++-------------------------------
 1 file changed, 9 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
index 8bb975e82c17c1d77217128e9ddbd6a0575bb33d..b9ec14ef2c20ebfa03c30994eb2395f21b9502bb 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
 #include <linux/hdmi.h>
@@ -12,71 +13,9 @@
 
 #include "hdmi.h"
 
-/* Supported HDMI Audio sample rates */
-#define MSM_HDMI_SAMPLE_RATE_32KHZ		0
-#define MSM_HDMI_SAMPLE_RATE_44_1KHZ		1
-#define MSM_HDMI_SAMPLE_RATE_48KHZ		2
-#define MSM_HDMI_SAMPLE_RATE_88_2KHZ		3
-#define MSM_HDMI_SAMPLE_RATE_96KHZ		4
-#define MSM_HDMI_SAMPLE_RATE_176_4KHZ		5
-#define MSM_HDMI_SAMPLE_RATE_192KHZ		6
-#define MSM_HDMI_SAMPLE_RATE_MAX		7
-
-
-struct hdmi_msm_audio_acr {
-	uint32_t n;	/* N parameter for clock regeneration */
-	uint32_t cts;	/* CTS parameter for clock regeneration */
-};
-
-struct hdmi_msm_audio_arcs {
-	unsigned long int pixclock;
-	struct hdmi_msm_audio_acr lut[MSM_HDMI_SAMPLE_RATE_MAX];
-};
-
-#define HDMI_MSM_AUDIO_ARCS(pclk, ...) { (1000 * (pclk)), __VA_ARGS__ }
-
-/* Audio constants lookup table for hdmi_msm_audio_acr_setup */
-/* Valid Pixel-Clock rates: 25.2MHz, 27MHz, 27.03MHz, 74.25MHz, 148.5MHz */
-static const struct hdmi_msm_audio_arcs acr_lut[] = {
-	/*  25.200MHz  */
-	HDMI_MSM_AUDIO_ARCS(25200, {
-		{4096, 25200}, {6272, 28000}, {6144, 25200}, {12544, 28000},
-		{12288, 25200}, {25088, 28000}, {24576, 25200} }),
-	/*  27.000MHz  */
-	HDMI_MSM_AUDIO_ARCS(27000, {
-		{4096, 27000}, {6272, 30000}, {6144, 27000}, {12544, 30000},
-		{12288, 27000}, {25088, 30000}, {24576, 27000} }),
-	/*  27.027MHz */
-	HDMI_MSM_AUDIO_ARCS(27030, {
-		{4096, 27027}, {6272, 30030}, {6144, 27027}, {12544, 30030},
-		{12288, 27027}, {25088, 30030}, {24576, 27027} }),
-	/*  74.250MHz */
-	HDMI_MSM_AUDIO_ARCS(74250, {
-		{4096, 74250}, {6272, 82500}, {6144, 74250}, {12544, 82500},
-		{12288, 74250}, {25088, 82500}, {24576, 74250} }),
-	/* 148.500MHz */
-	HDMI_MSM_AUDIO_ARCS(148500, {
-		{4096, 148500}, {6272, 165000}, {6144, 148500}, {12544, 165000},
-		{12288, 148500}, {25088, 165000}, {24576, 148500} }),
-};
-
-static const struct hdmi_msm_audio_arcs *get_arcs(unsigned long int pixclock)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(acr_lut); i++) {
-		const struct hdmi_msm_audio_arcs *arcs = &acr_lut[i];
-		if (arcs->pixclock == pixclock)
-			return arcs;
-	}
-
-	return NULL;
-}
-
 int msm_hdmi_audio_update(struct hdmi *hdmi)
 {
 	struct hdmi_audio *audio = &hdmi->audio;
-	const struct hdmi_msm_audio_arcs *arcs = NULL;
 	bool enabled = audio->enabled;
 	uint32_t acr_pkt_ctrl, vbi_pkt_ctrl, aud_pkt_ctrl;
 	uint32_t audio_config;
@@ -94,15 +33,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 		enabled = false;
 	}
 
-	if (enabled) {
-		arcs = get_arcs(hdmi->pixclock);
-		if (!arcs) {
-			DBG("disabling audio: unsupported pixclock: %lu",
-					hdmi->pixclock);
-			enabled = false;
-		}
-	}
-
 	/* Read first before writing */
 	acr_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_ACR_PKT_CTRL);
 	vbi_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_VBI_PKT_CTRL);
@@ -116,15 +46,12 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 		uint32_t n, cts, multiplier;
 		enum hdmi_acr_cts select;
 
-		n   = arcs->lut[audio->rate].n;
-		cts = arcs->lut[audio->rate].cts;
+		drm_hdmi_acr_get_n_cts(hdmi->pixclock, audio->rate, &n, &cts);
 
-		if ((MSM_HDMI_SAMPLE_RATE_192KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_176_4KHZ == audio->rate)) {
+		if (audio->rate == 192000 || audio->rate == 176400) {
 			multiplier = 4;
 			n >>= 2; /* divide N by 4 and use multiplier */
-		} else if ((MSM_HDMI_SAMPLE_RATE_96KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_88_2KHZ == audio->rate)) {
+		} else if (audio->rate == 96000 || audio->rate == 88200) {
 			multiplier = 2;
 			n >>= 1; /* divide N by 2 and use multiplier */
 		} else {
@@ -137,13 +64,11 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_AUDIO_PRIORITY;
 		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_N_MULTIPLIER(multiplier);
 
-		if ((MSM_HDMI_SAMPLE_RATE_48KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_96KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_192KHZ == audio->rate))
+		if (audio->rate == 48000 || audio->rate == 96000 ||
+		    audio->rate == 192000)
 			select = ACR_48;
-		else if ((MSM_HDMI_SAMPLE_RATE_44_1KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_88_2KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_176_4KHZ == audio->rate))
+		else if (audio->rate == 44100 || audio->rate == 88200 ||
+			 audio->rate == 176400)
 			select = ACR_44;
 		else /* default to 32k */
 			select = ACR_32;
@@ -204,7 +129,6 @@ int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	unsigned int rate;
 	int ret;
 
 	drm_dbg_driver(bridge->dev, "%u Hz, %d bit, %d channels\n",
@@ -214,25 +138,12 @@ int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
 
 	switch (params->sample_rate) {
 	case 32000:
-		rate = MSM_HDMI_SAMPLE_RATE_32KHZ;
-		break;
 	case 44100:
-		rate = MSM_HDMI_SAMPLE_RATE_44_1KHZ;
-		break;
 	case 48000:
-		rate = MSM_HDMI_SAMPLE_RATE_48KHZ;
-		break;
 	case 88200:
-		rate = MSM_HDMI_SAMPLE_RATE_88_2KHZ;
-		break;
 	case 96000:
-		rate = MSM_HDMI_SAMPLE_RATE_96KHZ;
-		break;
 	case 176400:
-		rate = MSM_HDMI_SAMPLE_RATE_176_4KHZ;
-		break;
 	case 192000:
-		rate = MSM_HDMI_SAMPLE_RATE_192KHZ;
 		break;
 	default:
 		drm_err(bridge->dev, "rate[%d] not supported!\n",
@@ -245,7 +156,7 @@ int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
 	if (ret)
 		return ret;
 
-	hdmi->audio.rate = rate;
+	hdmi->audio.rate = params->sample_rate;
 	hdmi->audio.channels = params->cea.channels;
 	hdmi->audio.enabled = true;
 

-- 
2.39.5


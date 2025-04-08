Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114F7A80CFD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 15:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D0910E6B9;
	Tue,  8 Apr 2025 13:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1xJhHsw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066F610E6B7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 13:54:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BDdB5008070
 for <dri-devel@lists.freedesktop.org>; Tue, 8 Apr 2025 13:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9jtVHB+LSL7jwpKNp08BEBgDkCQoesKM3+hWFxnCDVk=; b=e1xJhHswOE4j6l6Q
 eyVWG9RNqdvggvyxUfHyYMcWyYG8eouF53oi6RQuzOm1EgVeHdmOABFXbIHsZ+d2
 MaCUoas4gMnvz9VVcnLSXX7fb4FISR4LcwxyRpMJmnuww4CnDUDGYUgBplegeibY
 qLXnWRSat7pXNcGzfmX603UqDOyuTpaY9XvF8iGnp3fhLRrkQhLu7ugP1YqAFCaT
 eTwb+XHrNaoNlrPRHrz31UpuIcJ5k26dGtO+Rcp3Pbgshjg3mbvEpCGtD5bXJ2FP
 DK/TgFgWvILOD3MX/Vt0PMBIrPgTpteKorJ2zfA2btHNE2AF1rmNDTQGP5YWouGk
 ba6e8g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb00mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:54:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e8fb5a7183so100346136d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 06:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744120471; x=1744725271;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9jtVHB+LSL7jwpKNp08BEBgDkCQoesKM3+hWFxnCDVk=;
 b=pecbggE/kRjC+gREtfn0qMY+9vnMtXMbYZdi1p5mKJ7pHpZWPqnCI8x0QHKTmzF3ay
 Uuax/sF90/iDZsaZUnNkZRh2EoIqkeEVztQhKoiiqm6BuvZBqLjmjKRAmQupJbJxMRcg
 wJfwq7hbUvzggpjQEjtzi2SJkWoRuC3bF5Pu9vTRMokBBW/5jhO8ieeJzE18rMJRcycv
 HktWNVAxoG6t3/IX1bF1LKqB9OMs8DH6Mw6sglC2u9VQg1G4JXnhwqUfFEflNuWjflTK
 /LBsCN5vDXBhDFRjANzEJzodyHTHhaV059fTzSd7PjopUQ0hqSQ4qUwoFaOWlxqa/+dn
 i8gw==
X-Gm-Message-State: AOJu0YzK7vlT9mBXJIQNzgY68SizPqYmBC4hq1vYcpU6fAI0jRswXsfu
 BdOSQ8uvAFOmeN7hL2becqL7/sQQcVZ0ipww8O7oZeeuZQQL9NI9izzXQ4WzbtGGvja7QQcOSM0
 /wJlQVD31nVj01m/0Ycc2jooEJBWyJpXyNh2v7OhR66mX9KYGc9Fsta5CZWnYlSgY+1M=
X-Gm-Gg: ASbGncsiaMVtSLtBGwn8yKkY+GZ+3EYi07i41dsCebpj//r6ZdM8PF+jIMTDAckf7+o
 Hco+O1BXafnb9bIj+5Jxpki9SCkuyJbkIwhzqow6AYzuTMfhO6dq4B2xNOY8KrZL7E7hxjrCWCj
 obgka0X2TCEihjQIiiBgaQF3gZZ1iobqdbA8sDz7ap9pYvcLHapZEY2PPz6QWO1y794rUZJhE7U
 3e7U/f6UL+C7H6Ect6tMkPtmb7H/IjJgLY7uPhPWdiYkCSx7V4LA7nzLafFDNbxGDdJz1J0P2Ca
 CqN7+DeB80RHTL8NV5Pv06HXGG7Ln/tWTdrXOq/7Jxfm7EmNRJ4QYyKh2sKmPsTN/i6k12clB6r
 qdzM2AsklktD7ly4gVJRhPAoTQ5G7
X-Received: by 2002:a05:6214:29e3:b0:6e8:f60c:5879 with SMTP id
 6a1803df08f44-6f01e7e9b8emr227190236d6.42.1744120471092; 
 Tue, 08 Apr 2025 06:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/mVxtxCHKg/wXvM0W6651vvlIK97AkhY/TbhIAFbIce/NERJC8FY9A2ZvMtOD4hLPH5vZSw==
X-Received: by 2002:a05:6214:29e3:b0:6e8:f60c:5879 with SMTP id
 6a1803df08f44-6f01e7e9b8emr227189916d6.42.1744120470706; 
 Tue, 08 Apr 2025 06:54:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e672306sm1515306e87.237.2025.04.08.06.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 06:54:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 16:54:26 +0300
Subject: [PATCH v2 2/3] drm/msm/hdmi: move msm_hdmi_audio_update() out of
 msm_hdmi_set_timings()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-drm-hdmi-acr-v2-2-dee7298ab1af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5Dnaa5nU2/lgYjZ1nimtJqu9UVySqokolcJlX/EhafY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9SqRdA37uRn+R1KQbc2w0UaLXYPYJwEzzwBtO
 i0APoP8S+yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/UqkQAKCRCLPIo+Aiko
 1fCCB/0aE/Zr52AB9WQRb7/JZUkDvI+VrlMax3gl6oDlXBZl57/YmrlWjBrLJthR0kJSWE99L+k
 vHkJeMBMZ2OchATf4n8Gay6fqxBkWsrP7f7Us7OdenLsDUQvddq9ZAFs3PCez7wM5fkH4xQRjev
 aQWF1H1XZrusgshbp7SkAQyxqkMF+dGp2zIUiF3G849mTz5JDrK1VGeoYxWm2Nfkb5DbAxmd3by
 Y5of9TTXw9nqi2UPzunlNUJRf9loWdk9UxUsYPCBVE6UQpd0UZ0VqTzQ7aZyfEiy9Edwb3CTVHo
 ttmLC/Rwal5LET9cwrI6t6vwn2Wuf/arQZaEydmnSAcNAqNd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: wKqVGFj8heDoG7ve3UI_D9AYww7q5HYy
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f52a98 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=7vAEta9WQHVFImzO9-QA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: wKqVGFj8heDoG7ve3UI_D9AYww7q5HYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=883 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

There is a duplication between msm_hdmi_audio_update() calls in
msm_hdmi_set_timings() and msm_hdmi_bridge_atomic_pre_enable(). Merge
those two calls to be performed unconditionally at
msm_hdmi_bridge_atomic_pre_enable().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 1456354c8af4bc7f655e8a47e958e9e0b99b7d29..d1218f2a6e9fd70c0e4e30a620daa69e84e12e9f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -324,10 +324,11 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (connector->display_info.is_hdmi)
-			msm_hdmi_audio_update(hdmi);
 	}
 
+	if (connector->display_info.is_hdmi)
+		msm_hdmi_audio_update(hdmi);
+
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
@@ -411,9 +412,6 @@ static void msm_hdmi_set_timings(struct hdmi *hdmi,
 		frame_ctrl |= HDMI_FRAME_CTRL_INTERLACED_EN;
 	DBG("frame_ctrl=%08x", frame_ctrl);
 	hdmi_write(hdmi, REG_HDMI_FRAME_CTRL, frame_ctrl);
-
-	if (hdmi->connector->display_info.is_hdmi)
-		msm_hdmi_audio_update(hdmi);
 }
 
 static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridge,

-- 
2.39.5


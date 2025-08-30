Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5169B3C628
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 02:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB1A10E3DB;
	Sat, 30 Aug 2025 00:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7uh6kBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F9C10E0DB
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:17 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TLZXwn027124
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7nf0+abWmGCJST77+Ob/lOwCJuYhA6HECShYvSo7oZM=; b=D7uh6kBbblxZW9vJ
 AQO8arjsTAUfNxLenI3aVXaXtb+11BbgrmB1CsxpHrPwQdS43XAwfzIrKq+kezth
 j0GQ7nGhM7SpUqwR2cPX+XWfVbC24Ib5B7YwoYmATkzJY4gh8J1rwzi3aFyH9Ix+
 tAJCELg4AuWIOal/7AXKBIFsw1i4bmBWQMFMxyji7h6Ae+XVjBEjjf29BpO64YmQ
 6Wxm2TSFNric0wtJAfepyQebNkRovHAZTKwmgsL8J3FPhz7g9m5WwjFRN1Y+peAo
 YCMJZg046hFPxkrKymnymtVULik4qmEuSipYKoKOjpZlJYnHLEzCUmqqjwjldwBz
 WVeqDA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umna64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b3118ab93aso25449021cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 17:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756513395; x=1757118195;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7nf0+abWmGCJST77+Ob/lOwCJuYhA6HECShYvSo7oZM=;
 b=D0QwkEJBLtMOjZgzUe3Q4r29uVYjkrxnUWM/dfMzwXWLLrM7uerP/HvIo0AIt09jwr
 yyqVd0YEdOOTs9Y1OUhCWFLeqGI4kCGN5N40OACmqzCxW00vl+FUNUwJB2V6XGPqydzd
 A1tlu5ugNmYEOcNb5VtOXGuZTNRCnFQEOaaRsVhKrfO246rfLbPCnXb6IK1uLxaRFpR6
 nqk0vwDTT0kPd6Dxxgv5oiHkyQW9pQt57PqnGyoac3sbNMor0+V7qP0mDZ2ia7eUffgY
 COa+PIAJCkfgmOIZsWFHmFWc6kQA4R3n3mNwokpc8CrT4+fANuTZP8jrR2bBrjEB0Ks+
 P49g==
X-Gm-Message-State: AOJu0YwI7J8ic2Tr5LbBWWSZayw+O1O5z73ScLX9RbM0iCOiN0ri+1AL
 h+ublka3Uco64m8bPlBbUIAiIvHX/fjNmo14XZeyFXEp4z71IwRSy3MaEPKJnqZwmcKSsGpWrU5
 hZprlydp6PAGP/JjoLrpM77aXontWxOJBKKag1GMzrNorAXmJFtZ+maPwVCOAuCUdr034nSU=
X-Gm-Gg: ASbGncuHR4Ha5EQhuPXZHXELpcmvWFJc5980qYZH9+rriB49BbI5UPLTr0lqfV4fYW6
 qN0HfLDe0R3JeR7IZGUWJzjMxehxmaGvQ9ojKsYryU4B6OCetgeeGN6wf7f1G7noJyNPLSQqglw
 p6lAR2gsPaye+F3Gp18AUycrEG2IfvnqxqWaJ4nv1gjMPcb8i9hN4O9NnTaSyxRcqZu/I/qHCx9
 VUjN/7ncLKMMii54vt0y2zpyqDP237Ne4mOdhNvvp/xpqGAhcDpT9+5zSXYl3oBF4cHwj6Xm+vo
 ftZzOJg/56b4aj3LRWQSV0hbRjB2xDV5mUwA+g0DQOOCIwnYiWtvM87utwn1FDLAXdk1N03lnBT
 hgyfYSgf/LOHH8bxUgSL+p/Tcd3QlhQpFHdxOZk611hqdvzYG8TUM
X-Received: by 2002:ac8:5893:0:b0:4b2:967f:cb4b with SMTP id
 d75a77b69052e-4b31dcce3aemr6287651cf.63.1756513395168; 
 Fri, 29 Aug 2025 17:23:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOls7IHK5n71gLOims9R5oXNm30OZQlHiNW3nK6iLa1qZum2ksrrXODlblb3ZuRNvP5SOgkg==
X-Received: by 2002:ac8:5893:0:b0:4b2:967f:cb4b with SMTP id
 d75a77b69052e-4b31dcce3aemr6287201cf.63.1756513394655; 
 Fri, 29 Aug 2025 17:23:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 17:23:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:02 +0300
Subject: [PATCH v3 06/11] drm/msm: hdmi: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-6-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ECUd39xCRDayMF07yZPid7frZVCtdwJ1DNCpnou818A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRkadcPsIT5VtZsPUIxt4c7DuFRHVG0R9qPC
 e+hnmDKZ1qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEZAAKCRCLPIo+Aiko
 1XJoB/9uSIvkAkBHEdynP5Np4TmqF25QxdIHnyZDZRd2oMA6beg+0p2vmu4j8T7iBPLH6wuOfv6
 yuy3KGzqXY92I/wemcHThKBJhM3F9irEXV+pLwba1BFZ1tX4k9erRi846J49Ao7zWeEP/xfmaPz
 81ispd03TPnsUvWwua6/x85ON05f4ECTHRc4+QUmjqTUB5Do+4aS6kfHip8DmrVdpbiYpQEZcDY
 dyZgO9lEnPsSGc+YkPsQmyKeuNdrMSHxmoExrCm2VBYq9CaceiwABEYUbvXFk4YlFDv3aa3E0R6
 LB4x461C04PK5YUvWfKCdrT6vT5Mwb5jFjWe5xU7iIbWVh5W
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68b24474 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=QemjF6U71Mh5n78GOpwA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX3xqp70h4fVnR
 wHoHGQWTXGdTxohk5D7flz8S+T6ze3btdOI6U8urPc1nfjDY+amFtI9VZBgNGYEG0h7qnHZcr5I
 D1v+C7MeF81e24FPgMA5Hea4AI21J45XXsC0Smt1AK396uQMYNoJ/hgvL9WqM6vP+PWR0GyaW2c
 bTHyKe9JZeqIzY0Iu8UoHFGQ+Gn1X5ovKsCYtP3+0qYstHSpOVBtK59rEPcHFU+3uc+HYjd8e4u
 JesPy7PRCZWfpE0PRvxnv5jlwxZAYdGsqzmggk/w6xlFMpH57f15FZAOB8ZYCaQomvjW75kV718
 sY4KdDYCmkb00jPXdSqd1V0njOxX7N+pcbGw303VNClo4v28lxrm9+6t5ApKvfQS4iOl2am7AIv
 T3ymXs6c
X-Proofpoint-GUID: hpOBr1QTDTBRhtKSz-cis9XmfGBmL_VU
X-Proofpoint-ORIG-GUID: hpOBr1QTDTBRhtKSz-cis9XmfGBmL_VU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..9dddc0e47de462212d42f3ff1012a073b98e3a96 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -249,6 +249,7 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -274,7 +275,7 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
@@ -498,6 +499,11 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
 	bridge->vendor = "Qualcomm";
 	bridge->product = "Snapdragon";
+	bridge->software_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |

-- 
2.47.2


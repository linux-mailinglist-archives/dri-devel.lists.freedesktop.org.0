Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB88ABA7A7
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 03:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D89110E2AE;
	Sat, 17 May 2025 01:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzlF3ON8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1196C10E239
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54H1lLhh018882
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KyyWakxU/Z7DnyDzppFomci4qtOg/Wp/7gLP5SesAjI=; b=FzlF3ON8IURSYoRR
 5gPeKKOsUxVtsVNEHeaWuYJib4avDnhR2l3fQChF9Cpu0iF4jcVdDKtO0cM/LdTg
 BON8iVlwydjWFP+ULHEO/vY57t2NLRi0vgKBcGsGtPYV0ShvjWXFrt+oYmQ/+/55
 3ZCyJ4OWA891aECmw29d+fUT3ZOt5UgNFzTJUFotUdcW3cfMko0PSM1rDFwl6BlL
 9Q3jiHkt7eTAXGsVOKQ22IJs9wNbPH8WWUjjQeMmq7z/i20aGtfIRGHD2RChwDTt
 kpM+sL/aVCYBvVfvEEVQM0PM6dsy6tbKtiF+VJV6ntZq98yxKbGXQSdzc7214kY9
 IEvyjQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pgr1g1h0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f6ef385d1bso30983506d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 18:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747447188; x=1748051988;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KyyWakxU/Z7DnyDzppFomci4qtOg/Wp/7gLP5SesAjI=;
 b=ThDfJ03iUk1v7jb5BlHMuJqKFLZ+MdeXiQw8vzGrC+7XHMOzwVF0QAmMn8dZusz3L4
 OpWvOSk/GH7nAridWAa8AjvQi2lIA22zzr9Px1EqNKVKj4IW98edwLHVEO9yActPV0gv
 VjOoiynJbjcOyVqidyf32gItgCqcCKHtQ1Np6DxW3R+JAIsGpFJSMW0snOeQgOD3VDSU
 Q4kQhEwMem6GoAhSEsjG6vFVa8oA1XCRIp1N0XI5UXm1CHaA2YIB56uNMPfV2/sUQPC1
 R27ZZu/TtiFGnnyfW5U8J1IUp6X0+GvGfygpVy3gGdm9WbLNXkTAGQxdUp9oRjvOCHN6
 xG1w==
X-Gm-Message-State: AOJu0YyOcIW1ZT3C1NzLrVaxie5OJV4UVvl9QykcIiX5USaY4R/9NSgj
 ryzGwZWBt9N62qbRxnNBcoOk0DWOb+lWya4OKcJXky8g2gEllUEQFWl8CA2CdbszT0JoUnRobr4
 SEwJLbL34YKrYhh4E6xWVqCmmGzB+gminFxAfp2YBpF4jGs+mOye7pa1a3Ir3OnUNZBXPcxc=
X-Gm-Gg: ASbGncveXzt96uDZStY6uQJ7WRtjJurPwASo3C6oGVxlzQYcoEoUeETaW88e5iueNYv
 eOehKYK1zMmJf3S2GIH4Jn0bynjWovRfNCXDjriW9ed3KMK6hwoJj72XLd+V7Bu/PR6AtoHCRl/
 vFvZzuVdUPFawvtGu0raALVZSlfiP7On46pdMUUKqy7gRJ+ugIpotVqaW0TR6G+azQIs2OOeQ9S
 yKaKvNYtgSHtD2R2Spp9iv4WwbDT/y0xA1afkqwLi7pcz2kVX5tlZa5s5yHstI4BFoE2GiqxZ7z
 gN07FqliBAX+y+/kRetuqnh8Iv4O4o/SW6ZBfbuaICvEt6NguU6pyXHqo6WU4qwhOlnAcdyFQuJ
 0TyPXMffbS4VYw22okfIo39eZ
X-Received: by 2002:a05:6214:493:b0:6e8:eabf:fd44 with SMTP id
 6a1803df08f44-6f8b08ce997mr93637786d6.27.1747447188367; 
 Fri, 16 May 2025 18:59:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGti7Q9QQCKk/7l7rAp+Eam0O6WFZak94cTVGNCFbJLA0IfRgtRHLyKBrW0oWYy40vY4RQRZw==
X-Received: by 2002:a05:6214:493:b0:6e8:eabf:fd44 with SMTP id
 6a1803df08f44-6f8b08ce997mr93637566d6.27.1747447188002; 
 Fri, 16 May 2025 18:59:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 18:59:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:40 +0300
Subject: [PATCH v6 04/10] drm/display: move CEC_CORE selection to
 DRM_DISPLAY_HELPER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-4-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xsPFZuAoy5Xx+HAHSFTO3CpJ9ZWa79t8iv7KrGNnsVQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2LzlRiBFzeGKtLvzI9YxXgxpllhINoupjHY
 G0qcJIH93CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftiwAKCRCLPIo+Aiko
 1ZsdCACJtMwWiDYiD732KactqUyG3QUjLbp5nnLNbYMMCsbW3offpf3dDM0La1046N+G7iVXcka
 Bx8JBhEy3wMP+Q9QyQn1cNHEzH/Z+ErD2Xe6pKShIsKcu+49zsFGdKObUUGgRcO2HnxgtVUFEIe
 Qg4VMtxkhcO6QhnNb1xtGHa00UQonJjuHS3GegPFbQ4WR18eB0cUxAvY6NDW/vCj5XsvZhYL8Ac
 RjvPVUCAuGK3JjuQLAOnQ1J+w/yfq763HC+hElG2bG+2tdHciWjBLHjR/a1fVfEHujgtGIFmm5P
 3Eq2L6c6GzFTYjgQce4FTZ0AGpzD676EQkExyIsJfjds4Spt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: HJpB1v0pSIiKCZx7FS01sMf31ClTz2So
X-Proofpoint-GUID: HJpB1v0pSIiKCZx7FS01sMf31ClTz2So
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfX7M+0FXkvfs1g
 +aR2QjI12qvdKWhpjFLfVmkTVrhXZsExEISJTErXX0A/zT8J+k+4AFZyh2TW/NNCYvi4BCz8OIQ
 +x57eKZrHAHE2RAAHtqJ3JuJq6Xk5LoK+OCKFSswGXBq3j/7CQfQyo69SR/xMbv3xWLHUQizHZB
 Lcjcxl4h5+Ao6I2nKXDBIYlI7BYNiKxcS9JUSwJG6GKfUz5B4lcNYXQAY7l3UChfQOTaleuD9x7
 +uDIGf7ijpy3Rihmuti/1FYKeNwjEvIJRmBq0fY2dIN9uSeMvKWBw3vHp+lpwpx/S3MQpkMsGNo
 j1zlhU3VUfbaLTSt351xg3S0D8B8NnTBJFIpAV7ADh/MU+MK9O8uUsj8i7DSCL0SytfPjFrllb2
 ptY0ktJkDS0Yv3K1OTnhmqihHiqgN4UufJdTr8kOPZaoYgpvdE9aFV1nmv9XVrOi6qajJygr
X-Authority-Analysis: v=2.4 cv=EIAG00ZC c=1 sm=1 tr=0 ts=6827ed95 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=7OZCfA99JoLngDASymAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505170017
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

THe Kconfig symbol DRM_DISPLAY_DP_AUX_CEC is a boolean which simply
toggles whether DP_AUX_CEC support should be built into the
drm_display_helper (which can be eithera module or built-in into the
kernel). If DRM_DISPLAY_DP_AUX_CEC is selected, then CEC_CORE is
selected to be built-in into the kernel even if DRM_DISPLAY_HELPER is
selected to be built as a module. Move CEC_CORE selection to the latter
symbol in order to allow it to be built as a module.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 8d22b7627d41f7bc015decf24ae02a05bc00f055..3666e791d6d6eba58f095d7fb691de1fd0b95ed3 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -8,6 +8,7 @@ config DRM_DISPLAY_DP_AUX_BUS
 config DRM_DISPLAY_HELPER
 	tristate
 	depends on DRM
+	select CEC_CORE if DRM_DISPLAY_DP_AUX_CEC
 	help
 	  DRM helpers for display adapters.
 
@@ -23,7 +24,6 @@ config DRM_BRIDGE_CONNECTOR
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
 	select DRM_DISPLAY_DP_HELPER
-	select CEC_CORE
 	help
 	  Choose this option if you want to enable HDMI CEC support for
 	  DisplayPort/USB-C to HDMI adapters.

-- 
2.39.5


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC32B3C623
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 02:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC6B10E3D7;
	Sat, 30 Aug 2025 00:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DCtz4gtJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4509710E3C5
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:08 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TM3eW2025407
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EC24O8coXPxIicmmvFhXHG7RuMMbE2/IeNTru9ezMlw=; b=DCtz4gtJxTkhOa/5
 bgoi8G8kCfWOYQZKf1bnpFYsbO7z1XE+zqrSI8B1k5OLYGFCp92I5Syd9vprgipI
 WapoLgN84xInkHmir17aYOfrY2PnHdsalVYFR0FtH3CtFLu3tZuIfJ5qGPRHbyTV
 ISI+UZF5EnPNhifJjO3IO7DokPGK7/gx3+t0htTE1Rl2NG9zKd5dfwrNTdjIcdTV
 KxrfBkuz0j1e9CMYXZWifYtN2BCfmwAlv4CVWPEZLbAc82r8Gwtn5GR0DfNiHsLW
 wt8l93QTnd4VVRgCZxA74sRRDpCo46WJfwQQUOxKeUhTBmqpi+0psjJBjcnNfJG2
 VDn1zg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48u4xyjj3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e8702f4cf9so600211685a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 17:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756513386; x=1757118186;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EC24O8coXPxIicmmvFhXHG7RuMMbE2/IeNTru9ezMlw=;
 b=vVJ3iFYv2l2VnXMVacV2TbYTwVyQysAB3Vz+dlATkEUQIgf0Lx94/DgJCMd5seNbxp
 0px2DZySNIAzCOn57ON8HNkw3dgrdTFyylfDqFEcMP3C5ofLiFczRQfJalAX7f8EjkRQ
 p6YVfgQ0w8Q0LacCGCKIaHAFxZ713VZYEG2c00XrHcm6PxA/l25VLXTaNvB9HyHLkfLD
 uG8nHlBcf8aHy35r30SV8VN+kWpdLL8wcp9+Alns6SHlu8RLV/WBIlX+t/oITF1AtVBK
 //td4Ziew7L7nHX++mOuM0sFDthL+F7e28boDJEoY3XOFV0qY83IHWNQIH41VIWplmbO
 P7PA==
X-Gm-Message-State: AOJu0YzofVYMR/wXMQgFx2VkLgq2M+70MVy9Y3sovM9so8CMenBwr5Om
 uGGFGRsZ9ZrU2FN010+/dicn9s9OmPYKyK5XwLygS5FKsX8waoKRyuuflW0UQ4zqf0GnBTKQXGk
 dsRtoH6cpE4ByzIALfHlzx2Y/orZur8kH/FdqiSwW3qxIM1sFS8S6yos2JGfxGg7heUrspho=
X-Gm-Gg: ASbGncsHkjPF8NtXqqD0zqFpz4AF812d/rhGiMtZhhURfliytOcbpLHPlSQkLJB894+
 1OysP7EbPoHUY1ZQjfoioV87pClUUEGXkKffwZfKma/Q1fl4v0f/+45JmhtshU4+4nDtHHZB1X6
 O4HmF2aKPvQiooM6NDLP+IUn8lvcD+4gISx98cf0z347v+WkPX092nDGoy4a9WBoCE+xHuiZ0iE
 tqhaqEGlVRGFBjptmMkeqNfYkkqf2bfZBF5bxDTcLdwRQEGkzVeixyjOBD9CRT2HIi6tqDPsCBb
 cb7WWUV19X0B5LWAzsZ5g6/a/5wjNQhnjOKYSogePWaABrQMOw6vpnpp54ZSYaLrDGIQmZ/2Nl1
 NGVhZ07dLJJEbyLJINcepWokY2YRdgQmcFBqm2DByKNlm6ZTdo3rk
X-Received: by 2002:ac8:5884:0:b0:4b0:aa5b:7c6d with SMTP id
 d75a77b69052e-4b31d8450b2mr7951311cf.16.1756513386142; 
 Fri, 29 Aug 2025 17:23:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJMWSIAIjCYp1lT9McTj9bQ133h50tPHm6nwV01Yh4DnXv2EmLSxcQOP/1n5kMYt9GTSTzJA==
X-Received: by 2002:ac8:5884:0:b0:4b0:aa5b:7c6d with SMTP id
 d75a77b69052e-4b31d8450b2mr7950821cf.16.1756513385504; 
 Fri, 29 Aug 2025 17:23:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 17:23:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:22:58 +0300
Subject: [PATCH v3 02/11] drm/bridge: adv7511: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-2-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1675;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=q7eYf8+3RQX7ESv2tHgdRnLYQ1j/MZwxzLEz7NwM9XM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRjIMzK+I5pUhzNv/gzIuu0qrnQQAgGGLA/8
 sqWoDGr3RmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEYwAKCRCLPIo+Aiko
 1X46B/4ttG1//Uf3yzHz2UVvm8cP5B96gro5PvEoK3vjNCYja8hOZmVu6v9GW5CkmnOb+3jEy/A
 F3O2JkCE9qbaSinFwCxDG2IviHDn3R2MSLm0Oz38JU3THj1JqiqN9tkLVzqGWianYbVicOFDWLw
 ffgaoAshYzXH5V7xc09KzxsPqxBXnlpZraDTgrv8ahuF/tN7ra1jWUyA/Xa06DhQLj0cQZ/mOdT
 NVO7QobdWHWByEfRjFJEbZhhBnXbOVtNPRvwF3NyvPQcEcFZGp+KzxZI3EoIkBu34mYwHoNE+d9
 BT4naoD0RmK4tSKFUCczE4M+TIsdHkuH61/HLPB/sDlW+nSz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI5MDAzMyBTYWx0ZWRfXy4pHHsAayoCn
 rW1zX42+ynjbOYV6iPzmIqjp6UcX2xp21yS7wzSVe5Q+0T9A7UmtGDsCAoweDk5d+3BjjFcB/3w
 UjZU33I7G9+N6Hwpsr2tE5bNdI3QACMROa6iCt/LCYs390peJ3hb8Yqouq3Eubxn2udBkHOmxR6
 Kfkyefw8ViQvRtvSkiByiteOMtCuKajckv/Z1YDkUrnBGwKUAVMkouRpE8jSaJB0xjgdAWMdPYV
 WBeCvEEOqjz8Quxw4O0YEj+21xARAtMVt4A/ztu2w6oRw9Yvv1QKxWTdMFCVu4j2nWR3s681ZZM
 9QY/aSWztzT8YNMkx2UfrRDDq9PC/C4Q/sAdnohIcWp8yUru6TEnjL5kiTtPm1ClP0ko8hbUeaL
 mFz3JF04
X-Proofpoint-ORIG-GUID: -f2BO19rwZENvBLWjaPd4SPKn4eLMuRa
X-Authority-Analysis: v=2.4 cv=PYL/hjhd c=1 sm=1 tr=0 ts=68b2446b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=4euzTov2hVyL0VtTdw4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: -f2BO19rwZENvBLWjaPd4SPKn4eLMuRa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508290033
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

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 26f8ef4824235a9a85b57a9a3a816fe26a59e45c..fe30567b56b4f600683f0545ed270665e692b12c 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -904,7 +904,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -938,7 +938,7 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -1299,6 +1299,12 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.vendor = "Analog";
 	adv7511->bridge.product = adv7511->info->name;
+	adv7511->bridge.software_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
+	adv7511->bridge.autogenerated_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO;
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_AUDIO;

-- 
2.47.2


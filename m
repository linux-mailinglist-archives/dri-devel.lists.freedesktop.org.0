Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21F3B50022
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0249D10E788;
	Tue,  9 Sep 2025 14:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KguWA7JR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335FF10E258
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 14:52:28 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LTPm032407
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 14:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kdVSeIKuXTDzsb1f8YtSPNgLNA0VYyyck2+ZYEf3zp4=; b=KguWA7JRiHwdSubP
 gIgUX5U8rJR9evqjY/OTKPWycFLytfleVbA3JGx05fJeSXD3vvydeTWKz22i+pBd
 JuYFQbNhLbrnJZnDJjMkqNtTMOxstH+8A92uqWWw3Vs79nIlSufsK50wv/MGonH7
 MNKOUI/ayf5VG0UijxTtaTt7KxTJ5j0IN3FvF4gW2x0GIiL9jffURHxo+WmeMCWb
 p6kbZqrnQj1H3NOT1ARpzJ5mFYj8KZwPyPUaGB0GXAqEv3FIAOc2cDjtp0OnBZXe
 /rMUikho++7PUVS/Ajssxzic3MbohvRDyedLi1TGyRxB6EWqv75/SrFaYrL0OFqX
 Ws/yFg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m0f61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 14:52:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-718c2590e94so157521406d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 07:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757429546; x=1758034346;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kdVSeIKuXTDzsb1f8YtSPNgLNA0VYyyck2+ZYEf3zp4=;
 b=p7nAyH3OUpFwXO0yIF8WtwoFiX3I85E+ZOGSUNmsjwt0ySeEyIYcBlQn/yeXwyGZQG
 5q0XFZm+tXsyfyWZPF5+THeUHmd5cwjgdbqz/WrTIQYUmEDlx6kVCYlgxEb53Jt18c+y
 t7RmzR0sibdNmQTK3KL5up1jK8hQZdohGJ+phLLaHYt/uqNq80XN66ocrjVmZw+xzLzv
 oobe0e118WDROyfTEscxsEsygPv+tCPA8uyd0ivAtJzRPG+eHmakgEUqXeQHlttu4hKb
 lOk8zN/k1/rJdNPSSLQq1A3GGqCXTNJxHNSDoR8eOJsNqFAFFXnB4SgDMYAgzk2/YVCK
 AnGA==
X-Gm-Message-State: AOJu0YyaeGb3fBgwteB23todTgBp3aksVSu1G/iG/sgHyHZoiEsBND1g
 BPhD/4zKe+YlF1Y9w7kZD1stem8f68TMod4XZMuGeVsiHUgQNPr673dgzlpZKKBDNKwBkI6V3GO
 cJmGqG7AM3WYabYAEXlWPUEq89GoIte2KDe2Rlw4HF44okh0pGbyPdY6FqBjvIDluxDf/Oso=
X-Gm-Gg: ASbGncutD99lkGT3d8geZlm1qWAMU+fx6mv9wjzkXNPMYKANpR8uYNoOqBBVmgeAYj0
 NxBJzASkVyE08qK8Rp+MWcFBdiyuBbScScfXgb1sEyLL+eBmtHZoBXP7e0AD46PejCAp+mMiK8K
 HpO2CA9kMJ/f7cAeTeJk17jCH0VIqua0oEqBBl9tHgpQEMQkXlhi3vZXudpqDrv0kBlERnZlaog
 mGp7rqmFZLz+JSsu7ZSuro/MmhoDqR4ZMS9RL6XiJKgTVKGLZljEXuqm9EmGHzO4jRHiZdLKGgv
 3J/ZI0J1SDClhZvCnnd14bgj0LncPPcEglDxnPEumlyg2EZOeKHLz2r8JwVq83Zh500BgFeLn0Q
 Pzh/6eUFIjfgiEZNFlPMZHKSqh+8YKEALxzsCHGP5IDhC63UtRafz
X-Received: by 2002:ad4:5fc5:0:b0:707:6cf8:5963 with SMTP id
 6a1803df08f44-72bbf3fb0b1mr158064586d6.9.1757429545965; 
 Tue, 09 Sep 2025 07:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+0czZpNTxq9KgOE3QwkI3s44ERVHWu12W7OPI2XDlhVfpfdH+nJD0CIFl4aY+6gycdCccrw==
X-Received: by 2002:ad4:5fc5:0:b0:707:6cf8:5963 with SMTP id
 6a1803df08f44-72bbf3fb0b1mr158063976d6.9.1757429545199; 
 Tue, 09 Sep 2025 07:52:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:52:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:03 +0300
Subject: [PATCH v4 05/10] drm/bridge: synopsys/dw-hdmi-qp: declare
 supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-5-53fd0a65a4a2@oss.qualcomm.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
In-Reply-To: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Aq2mDEHmgp1SiIn37OLqW93okHrHKspB826EOGNpiU8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8YBe+mkx4yTHKo7u9dMr8stfj3H6f7aW3MzQnfyHjz6Y
 d670FTJTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMxI6J/X+ugGhLp7fzDxHn
 IluFvF35U3R8m2zjXqrUcp+8eGctR8zvKoEMv2huvaqa0C7Gmw8y9KayMcf+b54ZxjJ9U0rci6M
 HOQP7WjLUmt1lLnvpam+r5YpQLJ2Xc31u+95Tl7bdPdhbN5ujXq7RXfdt383Ud3UfbCZtXb/O+C
 b34cavM9/O9Z2vF+Dte+1uS2qCitekI3N5K9f3KzX1h4d9U5ALsLZjvPhW3X7rwx1CC3UX998Ov
 5zOOMFx5oavPjJGdaZuJ914O63uJvJ3lNx85rzc8VzqX9ljM6/n2OsfEI+5E7Xhyq7lFyXrIufZ
 Xc6y/mFx495BzWAPF8GyjP+euh73dzUVJq1vuf97SkUoAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXxSZ3lrhHWuC5
 Th+FaJn2Em96j5POFA3YfwAhxHDMdQJXjyPtOt+yH0jNjjl1puxNiaZ40wWIByRH5LEm4CyFq4o
 NTTsEKUPgX/ZtCHZue4OeLBOLqph5H8Z6jy5v0R67cez8K0J9YXri5flcESwyCT7PamO4lLDlPT
 B7v1bEK5tuHUhj4KXSLgKPoxgpNS1q9RInbpwB1Aho/kMh+b4reKkaIWTyZO7JzSUkjf+I5/hNN
 q5T0O13sgVzsfgtqFrHViognYeI2+cfCJ1XjxhhXoTArQSEmPPDNPHuKJ/plM2OrPpZlGledpSa
 1zQY1hSxjhq/ydbQet766I6B6VVtPDOq5tc8UdVnx5xZNfXL9OkjFaIej4FbQirhK8IAaXmSJzm
 IyGn6Lbw
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c03f2b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=vfAEGMZ_7ZOHtlG3iVcA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: -nHx0p91YNJekZRw1TxogxZ2ZwoX-wiE
X-Proofpoint-ORIG-GUID: -nHx0p91YNJekZRw1TxogxZ2ZwoX-wiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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
interface. Return -EOPNOTSUPP if the driver is asked to write or clear
the unsupported InfoFrame.

Reviewed-by: Daniel Stone <daniels@collabora.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..9a195c479bcaf112f67b6a2f085402d0e33896de 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -936,6 +936,7 @@ static int dw_hdmi_qp_bridge_clear_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -961,7 +962,7 @@ static int dw_hdmi_qp_bridge_write_infoframe(struct drm_bridge *bridge,
 
 	default:
 		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
@@ -1084,6 +1085,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
+	hdmi->bridge.supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_DRM;
 
 	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.3


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 741E4B50021
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDA910E258;
	Tue,  9 Sep 2025 14:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gb8P3eE4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8984710E770
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 14:52:24 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899M29m001029
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 14:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 34LbrOuc9PV8gpgeFWji3D+8fqmNkyUhv1A+EV+DDe0=; b=Gb8P3eE44KD5hhqK
 Pt7qz3acDht+w++2bwApYrOeR1zDzMzr4GbjemiUmx2GBg4v++SZ/m9IRzuWVOmv
 4Ru4VhP3y997kggPFSIEJn1ZYycaxRKce0Q+8EHh/POZSHSkCCzFdZo7gfD8KQxn
 KljKhF+sonsmGb0RCg/q56gfEOzetUb+Ao/KW2U0WU1mGewvL7Gc2TxF/nP4WW0W
 bVsz4NSkzexW5ncIgwUuAaXDTtLawaesIIIrk63fGhIOElMbKKosGAJ0neOEU8ih
 FBP2ZjzY4YzhrMFidHi1fUInXdEDmbS5DCf8xn6VZe5ypXhHNqLI2riT+ESkNX8f
 pWHu1Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m0f5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 14:52:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5fbf0388eso48016501cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 07:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757429542; x=1758034342;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=34LbrOuc9PV8gpgeFWji3D+8fqmNkyUhv1A+EV+DDe0=;
 b=L51M95CRu3E+FRIwDUdnnCPDlSJLtMbs9IS2en/GSV7fVRzAPPptXRADm2DNJYPl2x
 W9DN0ySj23+dhS+CdFZzgsboonCaeCerZomcSNLL03G3SMaRhAM94l1R06EcSwQ+8b04
 PCt68SySg0KySrYm7ayD+g++2P4fVKq486f3vZLu7rkhqPTbi19o5p7zaGqhsFHGde/3
 Gkrk1wqow7x/7rWJ/p/VsYZxjqDAMLRWHcYz6LfeWrn4ujWL9K6S8CiIgtSrstXQUnKa
 AVFVjs/MjYqhOsdwRcwy7bY9+bQbnZOL7acPKF4H2DJiAukJ4XIO6idRNfzHpBbpjaQh
 g5jg==
X-Gm-Message-State: AOJu0YzMi/U0dT02LmDc5xtc40JRGjEMLbZPBDqtYfN2dY//YbWPwMK1
 0eH2hgniH9rYtPuxh5TNMC8ME6yRqyVD6f7kEYYfR2xgLUV5lOUEixSICVwSLsE59L97KN/C/if
 UognxPwbXwxk8jz0x5XKF03GICooZkLxpot+OAA/VF+TEJubYYYb1nDwUJ1AXuN3jtd7E1Eo=
X-Gm-Gg: ASbGncu2YNiOmdYfULFwbgVCLm2daXlwZW0Omi9aAlL3Gn6vqOJHBZLI4EbwV6XgD6J
 pfclsE5DUzTBswvrdxpx1BH0MxAUL84WA2vxa/5kl24j4ypF9NcV+/RQ0QK3KShFUhs6qr0+H2R
 bT7mY4j339yXbpjSnb29foxBMZWLmQy5X7RCgKe7/h62eMfGkLNwdixWTgN7kr0j2sgwPdjitLT
 ++1oE+k/pYaT6Nbus2kWYSB9aNHDbJPExBuImW5HbOvIYIn11AbwpJVUoCJ3GAz9kTJM85Kcx5l
 Rk8Yh/9iEM6V+LamPXbAPlVNxDkpZDebPgRaBbnvGao2cMQ1nL+eoe21jCwqMgod9YjYp5O48V6
 Cp+mS0ODLAexUQ6TRrU1636HElVH4GfT01S1HEPQIslEbPvQeZbj2
X-Received: by 2002:a05:6214:f2d:b0:72a:f29e:72c5 with SMTP id
 6a1803df08f44-739323029c7mr114734726d6.24.1757429542264; 
 Tue, 09 Sep 2025 07:52:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh1k0uLi0ygOtqikFQVXs3ESyNR9ERK9bgM+N6UK8XiQgh0Uz27Q0AH3gIz+YQMk0Qw5PEvw==
X-Received: by 2002:a05:6214:f2d:b0:72a:f29e:72c5 with SMTP id
 6a1803df08f44-739323029c7mr114734356d6.24.1757429541712; 
 Tue, 09 Sep 2025 07:52:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:52:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:01 +0300
Subject: [PATCH v4 03/10] drm/bridge: ite-it6263: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-3-53fd0a65a4a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9B1/2qTsNC+xeCfao5KJMWH14J8iOYC+FCFWS/909HA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8a1S6w7PQRTBrbr0WKlt4RdgZG4QLR3D3nd
 Pc2+wIxe1qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GgAKCRCLPIo+Aiko
 1RFiB/9vPGLX4rCRjQOkWG3XFoRoxXAoe3goznIq2CFGqeijv1lUkS8knQervgfz0Mm0YJcdgjo
 B6079q8L+kL3ElAXr6Ik9sBD55c49g8MYAmAwSNSmXgmicEpVRkpmJm3YoQFopBBpGwtHMcQsz6
 awXfwfZAXcZy/DsHrOA8ScQ2OCT6UQazu3yZQxVKVAR6PQ6ca2XywVk6BgueG/RiNPX/ViYky2g
 VY5mlJSG20WmymvEwJLnpRUZUvAVhq7KdAfh0a6TCCwbD2fitVEjQmI2Yuez8ejW4e0Zx785+Zu
 2xEllX2NqZQx3EPNdpgno27vdf896pObSZfS/G2i9P9qiROT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX9LdSWyXZh7Kw
 B4Ejc40wiTFM8tHeJm8esfrc5yT/9tbIO7u1JP0G9ND06r6yJHW2Zz0draDy84VdzVvF8cEokA2
 q5WzbXYcnMYCCeH8Sk/3A0gTGwZgl4n/oEbtEiCE70aPQ8t+Jnux71Em1awjnoZP/Zjstr5dqjE
 VPGxRIejXlQKr/WkyBFdz02MbQs0nRFYGw3AC7XhWMT+BblJteZ37w39Yx5Cdk7beX9hXzeeyUL
 FMCsD9qlYAPXVoCCyioHG8EnH8Uh2FqTn1laNjO0UUCtoMZ8M7xilsxIZ6Fn5f+lZpaNlAP3Ht8
 0WN0Llmqz0sd8WCjZN+5yHf+6POGcAOe8rpN5rJg9Zy20/xQw4CVu+ndnawVy5Av+AtO/znVOAn
 YOqJSkDl
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c03f28 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=LFZCy68fuonoWmFi_RYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: XKhUVnZQ5H9kt20lpJi0-HfuLv4xeirV
X-Proofpoint-ORIG-GUID: XKhUVnZQ5H9kt20lpJi0-HfuLv4xeirV
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

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 2eb8fba7016cbf0dcb19aec4ca8849f1fffaa64c..691e2d8a721bdbf99ca2dd49a45ce508ee7d9591 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -773,6 +773,7 @@ static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -813,6 +814,7 @@ static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -899,6 +901,9 @@ static int it6263_probe(struct i2c_client *client)
 	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	it->bridge.vendor = "ITE";
 	it->bridge.product = "IT6263";
+	it->bridge.supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 
 	return devm_drm_bridge_add(dev, &it->bridge);
 }

-- 
2.47.3


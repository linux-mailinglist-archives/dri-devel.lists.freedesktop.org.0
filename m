Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6575ACDB08A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 02:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947A210E2FD;
	Wed, 24 Dec 2025 01:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocinDGIN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="koPveoPB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A88310E30E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:04:03 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNHraXc678230
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wLWwE3+OeE/g9lVfst6cEgHRxD/v4AAQeIf29KzVQzU=; b=ocinDGINcuRyGvWv
 qgltR7lMm4frTJ+aSKEOdPX0aqzZyqJpD0PaCxOFOPgiQGr8laYQxH2lb7R7e7GV
 StCQHC4ToUZakKAcrVPgk8iBJI3GUxmqXWxjHc+jc0ITFaURqs/zzdephK0ypwMg
 c9+RTYdv7+i4SA5bdkwOcom1HHKM1OVl1zHW2rjDg3VtGG2mZKer/0Xt9/vzIZ1t
 QBiyCjKVR0pAYq4M5lmdEu+yxeZgw7/mFMGtCknAggjID0J53oUXjiHrgmUm4kD9
 QOuCLmI0lP5EuXkuauAhK0eSR+kY8bj4evofy818VH7lrm0NXy5OxS9h7ifZrQCi
 9qeA+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq11a7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:04:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed6ff3de05so153864921cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766538242; x=1767143042;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wLWwE3+OeE/g9lVfst6cEgHRxD/v4AAQeIf29KzVQzU=;
 b=koPveoPBMUztKwiPJ2euFDQUTXcKKCWLxNxOGD/2TqHKhjN7CR6DrWeUW2TL/Eq8Bh
 jJQ4gvlHRYJGVMRko0OsfRX33zNNjTnoVxXq6f/6SuL0F5AYGPdkMSTx70YX5kfN0qU0
 6wVFqP/3Tm43OunqlS/Mwb8IkeqyDrVrNRp0BMinPtynEYQI8krtuXsIHym9/65+NWNv
 /xWwEAvcdVbjLgjCUXP1KsskRsjEoMTaJn/smRIdlELgeawRnZjejwiYoydcLHGxx+zX
 svygb+UlLqtsp/aK3hX5qHal38D85bd0FhjpG9Wui0rprLxqsyo2DY44U+Nn1oyCko3u
 EKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766538242; x=1767143042;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wLWwE3+OeE/g9lVfst6cEgHRxD/v4AAQeIf29KzVQzU=;
 b=IUbzgXtRCBY9Un5Ps5Lv9UiuznhuebwdnOfPe8n2sW2CVvbnYWvKwQxkXX9SMBR4IN
 DOl3ntFEIRfn8+E4JK4tyLZEFL8OOAk6hw0U26RLZ0Aoe4JNEjrOq3zxIudpsdko1Ngz
 8IQym9eK5a1QRMdZsPL1YmEH0jkI4SiOEPgQqVXFe5dHAgLNRrCriW5zrQ/1ZRSwK75e
 aHJVSqMP39dpKoIckz5BMA49iCsV0CIvZ1X15ijZw6iknAPg6ZTZFq/Ucdp+Py39qm6P
 9NDjN6W+MZvfe6EIkabmw+1ooJVPGqngcqxD7zENrdGaHyc92FWdza8we9f4j2q62Hw9
 c2Zg==
X-Gm-Message-State: AOJu0Yz7PWe1sq3ki//T53YblZoLFKNx0KzVtwAdvBhFNp+NTcCNqd33
 nYe5Z4O6qi+3rb5oA9i1AlijlSQKIYvcMJwV46DlNcSdSr2StcT9MUlv7NZbxRQ10zLdvfL/5pX
 oOJUEiDSb84+RtXpWw6sFOMz3e9/SiP+XfaU9nnDVTqNZpWFt/DyRXwTweiwkLl50xctilbQ=
X-Gm-Gg: AY/fxX4rFD3Wc1s5HOr/4e3ihqDLSaSyd1XmmzjWPS1sYraSfX17lZTSxMPi9IRdn+/
 itfqgPUyyzbsqTGCbKWTQBus8eZenQw0xvmffn/ULKskhrAie912Mm6guDIzDG6eLjh9I+vPSiD
 vGi5GQ0Ho8vaZ5OtYvSXQDVE5ahUyZhibUwRbr7FrH17TXeGoRvq7OQOiTAlQrW+Kb8HK9nYrNo
 6MTQKTMeTybLfZNA7HfMsLH5Op8s8x4ShHrh9lrmFMICNwLFLTwv1osfPSGlz4IpQseksWd9wTh
 6ojSGyU9NcFajOoAlokMcHxWrvep5ePODYxZCCX9SWpHgNZYUNmH0+xHQlKymhpdy476JVEdmwa
 dsJITdPDkXoZ6K+yxrxtBZqIVX/GHpnHLtH8GSFNBhRJtsNmnOw2cc+Bpf2ZQ1/gVxLid++jD3p
 0IdnxHiLpdg6PhkjURz57+t4s=
X-Received: by 2002:a05:622a:1248:b0:4ec:ef62:8c81 with SMTP id
 d75a77b69052e-4f4abd8c6bdmr206266861cf.47.1766538241855; 
 Tue, 23 Dec 2025 17:04:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjEL6KpdvGkaIQESqzuIk0ruXwS4QCPmI+GKo0q+FP+/3F3vrZO4vptQGCTX9RSoNL/0h9gg==
X-Received: by 2002:a05:622a:1248:b0:4ec:ef62:8c81 with SMTP id
 d75a77b69052e-4f4abd8c6bdmr206266431cf.47.1766538241402; 
 Tue, 23 Dec 2025 17:04:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 17:03:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:58 +0200
Subject: [PATCH v3 09/10] drm/display: bridge_connector: dynamically
 generate HDMI callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-9-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6848;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wjvfsQWX2SPvZmtfq/QDNeAsj27LvHfOsz915cSO54Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvaCm570BXj+xIjC/HsGcDtU3JpA7khf+YXS
 u9a7QR7RCeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72gAKCRCLPIo+Aiko
 1RcNCACKsTzltXBEDv5JA74NluYiKEOT2sk5yj6c9PVolhP6Av6n3Nd8/t+6XB3cYSb5w1io960
 9wqlW7vqJLAveCu+3Z7ebSvwfcaFyBSv3WTPBayBsfMzB6AqlUWornDKj76LVqhdKVSt7WBuDXD
 vatVEwKidWBUCYmkZVY6bgw3MHh1IavrIwmGwccrpBiOcKQX1569bdMvX2V/vrBdoY8npN/Vf3i
 9xPNMTYOWUmhlvG0QOffuyOf6enZ52Ukumfye5R7tjm0nOHqVQZqBI8rEAzGWq6Pp4W1J9M14XP
 oQc7kGcYfsQuNjirDnckyZJ7oCPqQPN1z3b/dJVZs+CcxwPT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: H3DD3_LrQFhPpme4QuhhHp7hBe4AmQG5
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694b3c02 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SmQ2dRXw9u10PpR7_9MA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: H3DD3_LrQFhPpme4QuhhHp7hBe4AmQG5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX7cca7Gthg6AE
 9/OcflBxEcm6sZqdbe/l2tpAvK7Vr5d60b3CJDaS7mL7o2kSi09jA0HpMV90NacnvEPof9mqzLP
 1qZDKH6CigMrYe2FHMksndSgw/0bIu59woxxD9SAbKOojVn3iHgfURn6ahWKwS0eXDhBPBNxy2Y
 Brmj3yAAfHaUj749ZIjv06ivnPbFdxrZBwBhqPcLBRxZkkMPUNsMqRLWYi6fwTS70HjSWORFaUO
 nnDXn75O+9RT9aGFvjuyNxitycK06R+uG4Bn4CuG+0IyXqkI15wlm3k4C2oWycr8L5gB5CCguLy
 IiLn2gPT1I7m2jEsjQzJwmT6AHhcLenbN5RUj1xcTxIn9Pq7FHq+OmbunS55NoIJceKDl9Ut3Qq
 Bc9Y9M0jJ6/1arMelA8B0WEcWPQhKwyWppyo4SVZBJFjh4P6U0hqJmiUsfiwkiW6kTYbtMY2Y3r
 yLH9TvHN6mP7yuDjJvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007
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

The rest of the DRM framework uses presence of the callbacks to check if
the particular infoframe is supported. Register HDMI callbacks
dynamically, basing on the corresponding drm_bridge ops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 94 ++++++++++++--------------
 1 file changed, 45 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index c8858d48199c..2a8f586c6d13 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -123,6 +123,14 @@ struct drm_bridge_connector {
 	 * DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER).
 	 */
 	struct drm_bridge *bridge_hdmi_cec;
+
+	/**
+	 * @hdmi_funcs:
+	 *
+	 * The particular &drm_connector_hdmi_funcs implementation for this
+	 * bridge connector.
+	 */
+	struct drm_connector_hdmi_funcs hdmi_funcs;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -465,12 +473,7 @@ static int drm_bridge_connector_clear_audio_infoframe(struct drm_connector *conn
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-		return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
 }
 
 static int drm_bridge_connector_write_audio_infoframe(struct drm_connector *connector,
@@ -484,12 +487,7 @@ static int drm_bridge_connector_write_audio_infoframe(struct drm_connector *conn
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-		return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
 }
 
 static int drm_bridge_connector_clear_hdr_drm_infoframe(struct drm_connector *connector)
@@ -502,12 +500,7 @@ static int drm_bridge_connector_clear_hdr_drm_infoframe(struct drm_connector *co
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-		return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
 }
 
 static int drm_bridge_connector_write_hdr_drm_infoframe(struct drm_connector *connector,
@@ -521,12 +514,7 @@ static int drm_bridge_connector_write_hdr_drm_infoframe(struct drm_connector *co
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-		return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
 }
 
 static int drm_bridge_connector_clear_spd_infoframe(struct drm_connector *connector)
@@ -539,12 +527,7 @@ static int drm_bridge_connector_clear_spd_infoframe(struct drm_connector *connec
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-		return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
 }
 
 static int drm_bridge_connector_write_spd_infoframe(struct drm_connector *connector,
@@ -558,12 +541,7 @@ static int drm_bridge_connector_write_spd_infoframe(struct drm_connector *connec
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-		return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
 }
 
 static const struct drm_edid *
@@ -591,18 +569,22 @@ static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 		.clear_infoframe = drm_bridge_connector_clear_hdmi_infoframe,
 		.write_infoframe = drm_bridge_connector_write_hdmi_infoframe,
 	},
-	.audio = {
-		.clear_infoframe = drm_bridge_connector_clear_audio_infoframe,
-		.write_infoframe = drm_bridge_connector_write_audio_infoframe,
-	},
-	.hdr_drm = {
-		.clear_infoframe = drm_bridge_connector_clear_hdr_drm_infoframe,
-		.write_infoframe = drm_bridge_connector_write_hdr_drm_infoframe,
-	},
-	.spd = {
-		.clear_infoframe = drm_bridge_connector_clear_spd_infoframe,
-		.write_infoframe = drm_bridge_connector_write_spd_infoframe,
-	},
+	/* audio, hdr_drm and spd are set dynamically during init */
+};
+
+static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_audio_infoframe = {
+	.clear_infoframe = drm_bridge_connector_clear_audio_infoframe,
+	.write_infoframe = drm_bridge_connector_write_audio_infoframe,
+};
+
+static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_hdr_drm_infoframe = {
+	.clear_infoframe = drm_bridge_connector_clear_hdr_drm_infoframe,
+	.write_infoframe = drm_bridge_connector_write_hdr_drm_infoframe,
+};
+
+static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_spd_infoframe = {
+	.clear_infoframe = drm_bridge_connector_clear_spd_infoframe,
+	.write_infoframe = drm_bridge_connector_write_spd_infoframe,
 };
 
 static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
@@ -971,11 +953,25 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (!connector->ycbcr_420_allowed)
 			supported_formats &= ~BIT(HDMI_COLORSPACE_YUV420);
 
+		bridge_connector->hdmi_funcs = drm_bridge_connector_hdmi_funcs;
+
+		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
+			bridge_connector->hdmi_funcs.audio =
+				drm_bridge_connector_hdmi_audio_infoframe;
+
+		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
+			bridge_connector->hdmi_funcs.hdr_drm =
+				drm_bridge_connector_hdmi_hdr_drm_infoframe;
+
+		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
+			bridge_connector->hdmi_funcs.spd =
+				drm_bridge_connector_hdmi_spd_infoframe;
+
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
 					       &drm_bridge_connector_funcs,
-					       &drm_bridge_connector_hdmi_funcs,
+					       &bridge_connector->hdmi_funcs,
 					       connector_type, ddc,
 					       supported_formats,
 					       max_bpc);

-- 
2.47.3


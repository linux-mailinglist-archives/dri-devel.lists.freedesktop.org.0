Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975ECCFF59B
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECF910E64D;
	Wed,  7 Jan 2026 18:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5gYSI5I";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NHo2Ozlo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6D510E649
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 18:15:15 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607H3R622453883
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 18:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FuvKMsYdeHCb+qiex5eN4gaDeI4nVkcPpNxIVMGnEFs=; b=k5gYSI5I8dYAg17d
 fM5dOuknFoyC2v0PhhCcQJy5+WYmkaFXDf6UMm2EZAvqWe4PeRQlmErsiIPsumpW
 in/oAbaL16QkUWySHp9122buDOe66yeR+FWY2W9pm1pyNMCL9XIVOxw1jiXIy10Z
 b2rFMNQDtpmySyLiiWrz/ovTSBcd/EoniUTuKfFtxmoPje3jymd0OVP/TOQL21/8
 DR0aQJPIw7VvRe87OUkIAwv0cY7mlToaJtoxlnrYab9Vb8/BrU7tiYHoykcYN+Ey
 3QZ4a2nrlQ09bXti4056YjQbVoGpM//9sWpUq2cuGSYOu1QovfEpiz4ysWexp6sx
 RWp74Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhmnbhpu7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 18:15:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b22ab98226so265613385a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 10:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767809714; x=1768414514;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FuvKMsYdeHCb+qiex5eN4gaDeI4nVkcPpNxIVMGnEFs=;
 b=NHo2Ozlojt32afn3vHx7vHxuPyJinfKgvMxtceJtYiO4xHI+0GkoP7ZC6kLOnvyE6J
 p5H2foVuf6vhB8KBNK1RO13f+W4hqCWlzg/7HIF8wj0rSD2Zx63Rb9zKtcX174BoKO95
 QxPh4yY1OoIyipj1zEhOcm5YxtlqYTAUT2xSGsfYA3DviUL/JoAwmSWI45MiUNk7WddQ
 9a09HcgPGtPFBvMgFt4aBdy10bpuj1iqgI81CjuoLU36tjsyAIZjIDuas4zqPiEpxeIv
 1GNWY4+SrStGq97sgrmIgvRcjJwde56+vVa+8Y+dKkZYY4TxoyLw9S2Xpy6njfZUkPOG
 xDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767809714; x=1768414514;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FuvKMsYdeHCb+qiex5eN4gaDeI4nVkcPpNxIVMGnEFs=;
 b=IT6xUY+u/Bw13TiuHQ6ep2amB0tp4oFFijgWpD+7hljt48UJhs1RFAzoUZdGyrYNh6
 TE4WJNTwtRAjhWXtH4pq49wjpUwk+6xhVXdNHQLbyKWGJzT5SzHOiQuNpZRUrq204WkP
 u92iHP6qTRaiIf0JdIO7noFT8A91MBNP1PLlbewwQr11JgGqJ/nfR9rKpqhnY72wwfPT
 UlkDb05TOBe2exg2WVW0VCbrKUfqlUSsnVwe1Zj22vGPjjb3VfX3WrDmlxrGrHcuv5by
 X/+sBtUyiyTje9pnZiH0wFj6o2qd8VWEa4SToouPdhSvHoOkOAgoBFU3e20TLG5z7Y1u
 pOzQ==
X-Gm-Message-State: AOJu0Yz3ohQVSp6popULDqjWkftFWhE2p+n/mL9eFQdIPgBbCRSSkVay
 gMcYRa/GfprxagBUOVILDUdqfwARiocAwSAIpfNbAI5pDoOZOERoePvntK310KWTb5wwACobDz7
 6WtSUW13xxnOT3ffy0BK0udHGLaMmyOfyrjjmtCTjsLAam2+0jVDCXbYRsPrIvbU+a7dX7/M=
X-Gm-Gg: AY/fxX6AcMtEvoNQkLqrOrafUOoDqQipSjWtRs4XuHDlLRbjFkmtWUZyzCoMHaByrZt
 ScL8tSC4trUJq3u/T21NeFl91moVhb0ED28obcxioNYbO12QhK8j8W69PAS3WoBFywsS6ln3X3D
 eLQXd0Yorsxs6JUygaf+Kyb/A5RypyX1RX7F0HATtm3Ffux/0MYgl/nUUmn39NR98vV7D9kg1an
 /dMRnbh5WON9gVoCVr2vIlJr9rA7b56ra8kEKWyivnDbCn4L1GvFYSjiSYlAE71dH+kD1AumxRc
 IYUSG9Xdl2icSeGDdsPPe2TXBXM6krgkrnj+KAS6IPc/RyL0wZBve829jBiiwPwMMuBtheU9+5x
 xIntvoZARexwohSFK7vWAhDJGci5cqCTtVFL1Hr7nMR1hxpEHiuHw19agFwRkicXLhlu6QV5+X/
 eqXpaiOgiw4BO7QJB5B3oTIUw=
X-Received: by 2002:a05:620a:698b:b0:8b8:dd7f:f032 with SMTP id
 af79cd13be357-8c38941bec9mr417349885a.78.1767809713419; 
 Wed, 07 Jan 2026 10:15:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoPBA8+usgh8WzBjQcdgLKsyd4pGWZrSMVrhAynD9c1OqnfO2wCskwOefNw7pH9SByyRIHiA==
X-Received: by 2002:a05:620a:698b:b0:8b8:dd7f:f032 with SMTP id
 af79cd13be357-8c38941bec9mr417342485a.78.1767809712676; 
 Wed, 07 Jan 2026 10:15:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 10:15:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:03 +0200
Subject: [PATCH v4 06/10] drm/display: hdmi_state_helper: split InfoFrame
 functions per type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-6-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=35452;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h+8kSKyyCVYvuPI9clygzcqBDU+O9Zth6ETXqpeby+g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKkW8YHXV5Ify/ZnGCs1fh2rPNCIYw+Hww1v
 6TTYyGVo26JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipAAKCRCLPIo+Aiko
 1XMACACCiORH8/VxHuARR4jC9zTWC4weknBPdzh2/dczrn7LnTslSIwwzW/YqMKowkAyvx4QZL4
 Kb9P3cbOnPag/CQdL1Q3wUxPvZMXfhb8+607lpgm2mUUyYvX/zHZrCfzWqQLk6JGqwz4zBg2NUj
 ov1WzfAwXe/UUbwjf+QF6GX4MbBhopo7f86SYAMTe3Fizo5s+4a2jSzeyJxdRGN7WHXr0gSypg3
 koy7NKvt0CRrmph4Ov0bc33YNOeIIk08bklKxwzRhOdynycd+YLuete7Jnneqhf1CD+skA7GY9L
 aKpqoR7OgtZJJm7LITmUXvLy6CBc0SFmJdjXZp3oj0cDWXEB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX4X038qX6I/H1
 XGFFMKkHxgKz11fo3ofMes18TuYDutRSQWYGhRQH8njf2eSXH3CJYFwVVfivDvwxUoxvQmbFMRJ
 H6Aq1kisv3FBU1ILJkRsL+WGNr7MolEuAEjGOOlYso72xSr1lEyXMYkx1xzko5qd4gZ1+AWeOJZ
 /QXdJGKWI246ctLtFS7GTswd4sHtsx4sMoWjYu0XPpy5znE/qtW5BjQpFS9lQ34mMasPo224cOF
 eBj7xZuOYtgvY1fx3kR5LxwELazZcLvQWMU4f1zmApLMY0u2W+wJX9yXCbRGIG1gyRyh2XaJgbM
 k0V0GLMcLiQhZk68vpmPTUm9pOd829RFNcR113c9ijYxL21e/X7b9jaDPKoW1kjJ0/2wZQ0hUK1
 KlNy4cdGrh1vJ3Nsk5SrG5EkTTi2B3mRVko+Zhj8NB9hgvAry7rbzv0gSoEJjPIy9YIfAcgdJhu
 AI56Q68WQDRsmtVNhjQ==
X-Proofpoint-GUID: BbPr7D4MJvNuUKQxd9GpXL9i9rsZCXsw
X-Authority-Analysis: v=2.4 cv=eIkeTXp1 c=1 sm=1 tr=0 ts=695ea2b2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bATBssBWj1biXikgvRQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: BbPr7D4MJvNuUKQxd9GpXL9i9rsZCXsw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144
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

Havign a single set of InfoFrame callbacks doesn't provide enough
information to the DRM framework about the InfoFrame types that are
actually supported. Also it's not really future-proof: it provides a way
to program only a single Vendor-Specific frame, however we might need to
support multiple VSIs at the same time (e.g. HDMI vs HDMI Forum
VSIs).

Provide separate sets of callbacks, one per the InfoFrame type.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c     | 206 ++++++++++++++++-----
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  86 ++++-----
 drivers/gpu/drm/drm_connector.c                    |   6 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  39 ++--
 drivers/gpu/drm/tests/drm_connector_test.c         |  14 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 102 +++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  82 +++++++-
 include/drm/drm_connector.h                        | 105 ++++++++---
 8 files changed, 455 insertions(+), 185 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index d38519e3923e..ca6a72a4cf80 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -401,8 +401,7 @@ drm_bridge_connector_tmds_char_rate_valid(const struct drm_connector *connector,
 		return MODE_OK;
 }
 
-static int drm_bridge_connector_clear_infoframe(struct drm_connector *connector,
-						enum hdmi_infoframe_type type)
+static int drm_bridge_connector_clear_avi_infoframe(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -412,35 +411,70 @@ static int drm_bridge_connector_clear_infoframe(struct drm_connector *connector,
 	if (!bridge)
 		return -EINVAL;
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		/* required */
-		return bridge->funcs->hdmi_clear_avi_infoframe(bridge);
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		/* required */
-		return bridge->funcs->hdmi_clear_hdmi_infoframe(bridge);
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-			return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
-		break;
-	case HDMI_INFOFRAME_TYPE_DRM:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-			return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
-		break;
-	case HDMI_INFOFRAME_TYPE_SPD:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-			return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
-		break;
-	}
+	return bridge->funcs->hdmi_clear_avi_infoframe(bridge);
+}
+
+static int drm_bridge_connector_write_avi_infoframe(struct drm_connector *connector,
+						    const u8 *buffer, size_t len)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_write_avi_infoframe(bridge, buffer, len);
+}
 
-	drm_dbg_driver(connector->dev, "Unsupported HDMI InfoFrame %x\n", type);
+static int drm_bridge_connector_clear_hdmi_infoframe(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_clear_hdmi_infoframe(bridge);
+}
+
+static int drm_bridge_connector_write_hdmi_infoframe(struct drm_connector *connector,
+						     const u8 *buffer, size_t len)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_write_hdmi_infoframe(bridge, buffer, len);
+}
+
+static int drm_bridge_connector_clear_audio_infoframe(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
+		return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
 
 	return 0;
 }
 
-static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
-						enum hdmi_infoframe_type type,
-						const u8 *buffer, size_t len)
+static int drm_bridge_connector_write_audio_infoframe(struct drm_connector *connector,
+						      const u8 *buffer, size_t len)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -450,28 +484,84 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
 	if (!bridge)
 		return -EINVAL;
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		/* required */
-		return bridge->funcs->hdmi_write_avi_infoframe(bridge, buffer, len);
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		/* required */
-		return bridge->funcs->hdmi_write_hdmi_infoframe(bridge, buffer, len);
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-			return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
-		break;
-	case HDMI_INFOFRAME_TYPE_DRM:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-			return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
-		break;
-	case HDMI_INFOFRAME_TYPE_SPD:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-			return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
-		break;
-	}
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
+		return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
+
+	return 0;
+}
+
+static int drm_bridge_connector_clear_hdr_drm_infoframe(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
+		return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
+
+	return 0;
+}
+
+static int drm_bridge_connector_write_hdr_drm_infoframe(struct drm_connector *connector,
+							const u8 *buffer, size_t len)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
+		return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
+
+	return 0;
+}
+
+static int drm_bridge_connector_clear_spd_infoframe(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
+		return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
+
+	return 0;
+}
+
+static int drm_bridge_connector_write_spd_infoframe(struct drm_connector *connector,
+						    const u8 *buffer, size_t len)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
+		return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
 
-	drm_dbg_driver(connector->dev, "Unsupported HDMI InfoFrame %x\n", type);
+	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
 
 	return 0;
 }
@@ -492,9 +582,27 @@ drm_bridge_connector_read_edid(struct drm_connector *connector)
 
 static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
-	.clear_infoframe = drm_bridge_connector_clear_infoframe,
-	.write_infoframe = drm_bridge_connector_write_infoframe,
 	.read_edid = drm_bridge_connector_read_edid,
+	.avi = {
+		.clear_infoframe = drm_bridge_connector_clear_avi_infoframe,
+		.write_infoframe = drm_bridge_connector_write_avi_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = drm_bridge_connector_clear_hdmi_infoframe,
+		.write_infoframe = drm_bridge_connector_write_hdmi_infoframe,
+	},
+	.audio = {
+		.clear_infoframe = drm_bridge_connector_clear_audio_infoframe,
+		.write_infoframe = drm_bridge_connector_write_audio_infoframe,
+	},
+	.hdr_drm = {
+		.clear_infoframe = drm_bridge_connector_clear_hdr_drm_infoframe,
+		.write_infoframe = drm_bridge_connector_write_hdr_drm_infoframe,
+	},
+	.spd = {
+		.clear_infoframe = drm_bridge_connector_clear_spd_infoframe,
+		.write_infoframe = drm_bridge_connector_write_spd_infoframe,
+	},
 };
 
 static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a561f124be99..5a3817271d91 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -891,21 +891,21 @@ drm_hdmi_connector_mode_valid(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_hdmi_connector_mode_valid);
 
-static int clear_device_infoframe(struct drm_connector *connector,
-				  enum hdmi_infoframe_type type)
+static int clear_infoframe(struct drm_connector *connector,
+			   const struct drm_connector_infoframe_funcs *funcs,
+			   const char *type)
 {
-	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_device *dev = connector->dev;
 	int ret;
 
-	drm_dbg_kms(dev, "Clearing infoframe type 0x%x\n", type);
+	drm_dbg_kms(dev, "Clearing %s InfoFrame\n", type);
 
-	if (!funcs || !funcs->clear_infoframe) {
+	if (!funcs->clear_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
 		return 0;
 	}
 
-	ret = funcs->clear_infoframe(connector, type);
+	ret = funcs->clear_infoframe(connector);
 	if (ret) {
 		drm_dbg_kms(dev, "Call failed: %d\n", ret);
 		return ret;
@@ -914,39 +914,28 @@ static int clear_device_infoframe(struct drm_connector *connector,
 	return 0;
 }
 
-static int clear_infoframe(struct drm_connector *connector,
-			   struct drm_connector_hdmi_infoframe *old_frame)
-{
-	int ret;
-
-	ret = clear_device_infoframe(connector, old_frame->data.any.type);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static int write_device_infoframe(struct drm_connector *connector,
-				  union hdmi_infoframe *frame)
+static int write_infoframe(struct drm_connector *connector,
+			   const struct drm_connector_infoframe_funcs *funcs,
+			   const char *type,
+			   struct drm_connector_hdmi_infoframe *new_frame)
 {
-	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_device *dev = connector->dev;
 	u8 buffer[HDMI_INFOFRAME_SIZE(MAX)];
 	int ret;
 	int len;
 
-	drm_dbg_kms(dev, "Writing infoframe type %x\n", frame->any.type);
+	drm_dbg_kms(dev, "Writing %s InfoFrame\n", type);
 
-	if (!funcs || !funcs->write_infoframe) {
+	if (!funcs->write_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return -EINVAL;
+		return 0; /* XXX: temporal until we stop generating unsupported frames */
 	}
 
-	len = hdmi_infoframe_pack(frame, buffer, sizeof(buffer));
+	len = hdmi_infoframe_pack(&new_frame->data, buffer, sizeof(buffer));
 	if (len < 0)
 		return len;
 
-	ret = funcs->write_infoframe(connector, frame->any.type, buffer, len);
+	ret = funcs->write_infoframe(connector, buffer, len);
 	if (ret) {
 		drm_dbg_kms(dev, "Call failed: %d\n", ret);
 		return ret;
@@ -955,27 +944,17 @@ static int write_device_infoframe(struct drm_connector *connector,
 	return 0;
 }
 
-static int write_infoframe(struct drm_connector *connector,
-			   struct drm_connector_hdmi_infoframe *new_frame)
-{
-	int ret;
-
-	ret = write_device_infoframe(connector, &new_frame->data);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static int write_or_clear_infoframe(struct drm_connector *connector,
+				    const struct drm_connector_infoframe_funcs *funcs,
+				    const char *type,
 				    struct drm_connector_hdmi_infoframe *old_frame,
 				    struct drm_connector_hdmi_infoframe *new_frame)
 {
 	if (new_frame->set)
-		return write_infoframe(connector, new_frame);
+		return write_infoframe(connector, funcs, type, new_frame);
 
 	if (old_frame->set && !new_frame->set)
-		return clear_infoframe(connector, old_frame);
+		return clear_infoframe(connector, funcs, type);
 
 	return 0;
 }
@@ -995,6 +974,7 @@ static int write_or_clear_infoframe(struct drm_connector *connector,
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state)
 {
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_connector_state *old_conn_state =
 		drm_atomic_get_old_connector_state(state, connector);
 	struct drm_connector_state *new_conn_state =
@@ -1005,9 +985,15 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 	if (!info->is_hdmi)
 		return 0;
 
+	if (!funcs) {
+		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
+		return -EINVAL;
+	}
+
 	mutex_lock(&connector->hdmi.infoframes.lock);
 
 	ret = write_or_clear_infoframe(connector,
+				       &funcs->avi, "AVI",
 				       &old_conn_state->hdmi.infoframes.avi,
 				       &new_conn_state->hdmi.infoframes.avi);
 	if (ret)
@@ -1015,18 +1001,21 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 
 	if (connector->hdmi.infoframes.audio.set) {
 		ret = write_infoframe(connector,
+				      &funcs->audio, "Audio",
 				      &connector->hdmi.infoframes.audio);
 		if (ret)
 			goto out;
 	}
 
 	ret = write_or_clear_infoframe(connector,
+				       &funcs->hdr_drm, "HDR DRM",
 				       &old_conn_state->hdmi.infoframes.hdr_drm,
 				       &new_conn_state->hdmi.infoframes.hdr_drm);
 	if (ret)
 		goto out;
 
 	ret = write_or_clear_infoframe(connector,
+				       &funcs->spd, "SPD",
 				       &old_conn_state->hdmi.infoframes.spd,
 				       &new_conn_state->hdmi.infoframes.spd);
 	if (ret)
@@ -1034,6 +1023,7 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 
 	if (info->has_hdmi_infoframe) {
 		ret = write_or_clear_infoframe(connector,
+					       &funcs->hdmi, "HDMI-VS",
 					       &old_conn_state->hdmi.infoframes.hdmi,
 					       &new_conn_state->hdmi.infoframes.hdmi);
 		if (ret)
@@ -1062,6 +1052,7 @@ int
 drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,
 							struct hdmi_audio_infoframe *frame)
 {
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_connector_hdmi_infoframe *infoframe =
 		&connector->hdmi.infoframes.audio;
 	struct drm_display_info *info = &connector->display_info;
@@ -1070,12 +1061,17 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 	if (!info->is_hdmi)
 		return 0;
 
+	if (!funcs) {
+		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
+		return -EINVAL;
+	}
+
 	mutex_lock(&connector->hdmi.infoframes.lock);
 
 	memcpy(&infoframe->data, frame, sizeof(infoframe->data));
 	infoframe->set = true;
 
-	ret = write_infoframe(connector, infoframe);
+	ret = write_infoframe(connector, &funcs->audio, "Audio", infoframe);
 
 	mutex_unlock(&connector->hdmi.infoframes.lock);
 
@@ -1097,6 +1093,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_audio_infoframe);
 int
 drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector)
 {
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_connector_hdmi_infoframe *infoframe =
 		&connector->hdmi.infoframes.audio;
 	struct drm_display_info *info = &connector->display_info;
@@ -1105,11 +1102,16 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	if (!info->is_hdmi)
 		return 0;
 
+	if (!funcs) {
+		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
+		return -EINVAL;
+	}
+
 	mutex_lock(&connector->hdmi.infoframes.lock);
 
 	infoframe->set = false;
 
-	ret = clear_infoframe(connector, infoframe);
+	ret = clear_infoframe(connector, &funcs->audio, "Audio");
 
 	memset(&infoframe->data, 0, sizeof(infoframe->data));
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 40e025712c9b..4f5b27fab475 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -600,8 +600,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
-	if (!hdmi_funcs->clear_infoframe ||
-	    !hdmi_funcs->write_infoframe)
+	if (!hdmi_funcs->avi.clear_infoframe ||
+	    !hdmi_funcs->avi.write_infoframe ||
+	    !hdmi_funcs->hdmi.clear_infoframe ||
+	    !hdmi_funcs->hdmi.write_infoframe)
 		return -EINVAL;
 
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 6263ee15880a..a50f260c73e4 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -40,27 +40,19 @@
 #define drm_connector_to_sun4i_hdmi(c)		\
 	container_of_const(c, struct sun4i_hdmi, connector)
 
-static int sun4i_hdmi_clear_infoframe(struct drm_connector *connector,
-				      enum hdmi_infoframe_type type)
+static int sun4i_hdmi_clear_avi_infoframe(struct drm_connector *connector)
 {
 	drm_warn_once(connector->dev, "clearing of AVI infoframe is not implemented\n");
 
 	return 0;
 }
 
-static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
-				      enum hdmi_infoframe_type type,
-				      const u8 *buffer, size_t len)
+static int sun4i_hdmi_write_avi_infoframe(struct drm_connector *connector,
+					  const u8 *buffer, size_t len)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
 	int i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
-
 	for (i = 0; i < len; i++)
 		writeb(buffer[i], hdmi->base + SUN4I_HDMI_AVI_INFOFRAME_REG(i));
 
@@ -68,6 +60,21 @@ static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 
 }
 
+static int sun4i_hdmi_clear_hdmi_infoframe(struct drm_connector *connector)
+{
+	drm_warn_once(connector->dev, "HDMI VSI not implemented\n");
+
+	return 0;
+}
+
+static int sun4i_hdmi_write_hdmi_infoframe(struct drm_connector *connector,
+					   const u8 *buffer, size_t len)
+{
+	drm_warn_once(connector->dev, "HDMI VSI not implemented\n");
+
+	return 0;
+}
+
 static void sun4i_hdmi_disable(struct drm_encoder *encoder,
 			       struct drm_atomic_state *state)
 {
@@ -244,8 +251,14 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
-	.clear_infoframe	= sun4i_hdmi_clear_infoframe,
-	.write_infoframe	= sun4i_hdmi_write_infoframe,
+	.avi = {
+		.clear_infoframe	= sun4i_hdmi_clear_avi_infoframe,
+		.write_infoframe	= sun4i_hdmi_write_avi_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe	= sun4i_hdmi_clear_hdmi_infoframe,
+		.write_infoframe	= sun4i_hdmi_write_hdmi_infoframe,
+	},
 };
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index f356ea695ae7..86860ad0861c 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -25,22 +25,26 @@ struct drm_connector_init_priv {
 	struct i2c_adapter ddc;
 };
 
-static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
-					    enum hdmi_infoframe_type type)
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector)
 {
 	return 0;
 }
 
 static int accept_infoframe_write_infoframe(struct drm_connector *connector,
-					    enum hdmi_infoframe_type type,
 					    const u8 *buffer, size_t len)
 {
 	return 0;
 }
 
 static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = accept_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
 };
 
 static const struct drm_connector_funcs dummy_funcs = {
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index cfa14a6eb97f..1c60947a13a1 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -78,22 +78,26 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 	return ret;
 }
 
-static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
-					    enum hdmi_infoframe_type type)
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector)
 {
 	return 0;
 }
 
 static int accept_infoframe_write_infoframe(struct drm_connector *connector,
-					    enum hdmi_infoframe_type type,
 					    const u8 *buffer, size_t len)
 {
 	return 0;
 }
 
 static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = accept_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
 };
 
 static enum drm_mode_status
@@ -106,8 +110,14 @@ reject_connector_tmds_char_rate_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = accept_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
 };
 
 static enum drm_mode_status
@@ -120,8 +130,14 @@ reject_100mhz_connector_tmds_char_rate_valid(const struct drm_connector *connect
 
 static const struct drm_connector_hdmi_funcs reject_100mhz_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_100mhz_connector_tmds_char_rate_valid,
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = accept_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
 };
 
 static int dummy_connector_get_modes(struct drm_connector *connector)
@@ -2449,19 +2465,21 @@ static void drm_test_check_infoframes(struct kunit *test)
 	drm_modeset_acquire_fini(&ctx);
 }
 
-static int reject_avi_infoframe_write_infoframe(struct drm_connector *connector,
-						enum hdmi_infoframe_type type,
-						const u8 *buffer, size_t len)
+static int reject_infoframe_write_infoframe(struct drm_connector *connector,
+					    const u8 *buffer, size_t len)
 {
-	if (type == HDMI_INFOFRAME_TYPE_AVI)
-		return -EOPNOTSUPP;
-
-	return 0;
+	return -EOPNOTSUPP;
 }
 
 static const struct drm_connector_hdmi_funcs reject_avi_infoframe_hdmi_funcs = {
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = reject_avi_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = reject_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
 };
 
 /*
@@ -2552,19 +2570,19 @@ static void drm_test_check_reject_avi_infoframe(struct kunit *test)
 	drm_modeset_acquire_fini(&ctx);
 }
 
-static int reject_hdr_infoframe_write_infoframe(struct drm_connector *connector,
-						enum hdmi_infoframe_type type,
-						const u8 *buffer, size_t len)
-{
-	if (type == HDMI_INFOFRAME_TYPE_DRM)
-		return -EOPNOTSUPP;
-
-	return 0;
-}
-
 static const struct drm_connector_hdmi_funcs reject_hdr_infoframe_hdmi_funcs = {
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = reject_hdr_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdr_drm = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = reject_infoframe_write_infoframe,
+	},
 };
 
 /*
@@ -2800,19 +2818,19 @@ static void drm_test_check_reject_hdr_infoframe_bpc_10(struct kunit *test)
 	drm_modeset_acquire_fini(&ctx);
 }
 
-static int reject_audio_infoframe_write_infoframe(struct drm_connector *connector,
-						  enum hdmi_infoframe_type type,
-						  const u8 *buffer, size_t len)
-{
-	if (type == HDMI_INFOFRAME_TYPE_AUDIO)
-		return -EOPNOTSUPP;
-
-	return 0;
-}
-
 static const struct drm_connector_hdmi_funcs reject_audio_infoframe_hdmi_funcs = {
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = reject_audio_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.audio = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = reject_infoframe_write_infoframe,
+	},
 };
 
 /*
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4cfb7ebc0c81..9fe605a42df7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -727,6 +727,66 @@ static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
 	return ret;
 }
 
+static int vc4_hdmi_clear_avi_infoframe(struct drm_connector *connector)
+{
+	return vc4_hdmi_clear_infoframe(connector, HDMI_INFOFRAME_TYPE_AVI);
+}
+
+static int vc4_hdmi_clear_hdmi_infoframe(struct drm_connector *connector)
+{
+	return vc4_hdmi_clear_infoframe(connector, HDMI_INFOFRAME_TYPE_VENDOR);
+}
+
+static int vc4_hdmi_clear_audio_infoframe(struct drm_connector *connector)
+{
+	return vc4_hdmi_clear_infoframe(connector, HDMI_INFOFRAME_TYPE_AUDIO);
+}
+
+static int vc4_hdmi_clear_hdr_drm_infoframe(struct drm_connector *connector)
+{
+	return vc4_hdmi_clear_infoframe(connector, HDMI_INFOFRAME_TYPE_DRM);
+}
+
+static int vc4_hdmi_clear_spd_infoframe(struct drm_connector *connector)
+{
+	return vc4_hdmi_clear_infoframe(connector, HDMI_INFOFRAME_TYPE_SPD);
+}
+
+static int vc4_hdmi_write_avi_infoframe(struct drm_connector *connector,
+					const u8 *buffer, size_t len)
+{
+	return vc4_hdmi_write_infoframe(connector, HDMI_INFOFRAME_TYPE_AVI,
+					buffer, len);
+}
+
+static int vc4_hdmi_write_hdmi_infoframe(struct drm_connector *connector,
+					 const u8 *buffer, size_t len)
+{
+	return vc4_hdmi_write_infoframe(connector, HDMI_INFOFRAME_TYPE_VENDOR,
+					buffer, len);
+}
+
+static int vc4_hdmi_write_audio_infoframe(struct drm_connector *connector,
+					  const u8 *buffer, size_t len)
+{
+	return vc4_hdmi_write_infoframe(connector, HDMI_INFOFRAME_TYPE_AUDIO,
+					buffer, len);
+}
+
+static int vc4_hdmi_write_hdr_drm_infoframe(struct drm_connector *connector,
+					    const u8 *buffer, size_t len)
+{
+	return vc4_hdmi_write_infoframe(connector, HDMI_INFOFRAME_TYPE_DRM,
+					buffer, len);
+}
+
+static int vc4_hdmi_write_spd_infoframe(struct drm_connector *connector,
+					const u8 *buffer, size_t len)
+{
+	return vc4_hdmi_write_infoframe(connector, HDMI_INFOFRAME_TYPE_SPD,
+					buffer, len);
+}
+
 #define SCRAMBLING_POLLING_DELAY_MS	1000
 
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
@@ -1684,8 +1744,26 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
-	.clear_infoframe	= vc4_hdmi_clear_infoframe,
-	.write_infoframe	= vc4_hdmi_write_infoframe,
+	.avi = {
+		.clear_infoframe = vc4_hdmi_clear_avi_infoframe,
+		.write_infoframe = vc4_hdmi_write_avi_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = vc4_hdmi_clear_hdmi_infoframe,
+		.write_infoframe = vc4_hdmi_write_hdmi_infoframe,
+	},
+	.audio = {
+		.clear_infoframe = vc4_hdmi_clear_audio_infoframe,
+		.write_infoframe = vc4_hdmi_write_audio_infoframe,
+	},
+	.hdr_drm = {
+		.clear_infoframe = vc4_hdmi_clear_hdr_drm_infoframe,
+		.write_infoframe = vc4_hdmi_write_hdr_drm_infoframe,
+	},
+	.spd = {
+		.clear_infoframe = vc4_hdmi_clear_spd_infoframe,
+		.write_infoframe = vc4_hdmi_write_spd_infoframe,
+	},
 };
 
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4543833acdec..7eaec37ae1c7 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1222,44 +1222,24 @@ struct drm_connector_cec_funcs {
 };
 
 /**
- * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
+ * struct drm_connector_infoframe_funcs - InfoFrame-related functions
  */
-struct drm_connector_hdmi_funcs {
-	/**
-	 * @tmds_char_rate_valid:
-	 *
-	 * This callback is invoked at atomic_check time to figure out
-	 * whether a particular TMDS character rate is supported by the
-	 * driver.
-	 *
-	 * The @tmds_char_rate_valid callback is optional.
-	 *
-	 * Returns:
-	 *
-	 * Either &drm_mode_status.MODE_OK or one of the failure reasons
-	 * in &enum drm_mode_status.
-	 */
-	enum drm_mode_status
-	(*tmds_char_rate_valid)(const struct drm_connector *connector,
-				const struct drm_display_mode *mode,
-				unsigned long long tmds_rate);
-
+struct drm_connector_infoframe_funcs {
 	/**
 	 * @clear_infoframe:
 	 *
 	 * This callback is invoked through
 	 * @drm_atomic_helper_connector_hdmi_update_infoframes during a
 	 * commit to clear the infoframes into the hardware. It will be
-	 * called multiple times, once for every disabled infoframe
-	 * type.
+	 * called once for each frame type to be disabled.
 	 *
-	 * The @clear_infoframe callback is mandatory.
+	 * The @clear_infoframe callback is mandatory for AVI and HDMI-VS
+	 * InfoFrame types.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
 	 */
-	int (*clear_infoframe)(struct drm_connector *connector,
-			       enum hdmi_infoframe_type type);
+	int (*clear_infoframe)(struct drm_connector *connector);
 
 	/**
 	 * @write_infoframe:
@@ -1267,18 +1247,42 @@ struct drm_connector_hdmi_funcs {
 	 * This callback is invoked through
 	 * @drm_atomic_helper_connector_hdmi_update_infoframes during a
 	 * commit to program the infoframes into the hardware. It will
-	 * be called multiple times, once for every updated infoframe
-	 * type.
+	 * be called for every updated infoframe type.
 	 *
-	 * The @write_infoframe callback is mandatory.
+	 * The @write_infoframe callback is mandatory for AVI and HDMI-VS
+	 * InfoFrame types.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
 	 */
 	int (*write_infoframe)(struct drm_connector *connector,
-			       enum hdmi_infoframe_type type,
 			       const u8 *buffer, size_t len);
 
+};
+
+/**
+ * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
+ */
+struct drm_connector_hdmi_funcs {
+	/**
+	 * @tmds_char_rate_valid:
+	 *
+	 * This callback is invoked at atomic_check time to figure out
+	 * whether a particular TMDS character rate is supported by the
+	 * driver.
+	 *
+	 * The @tmds_char_rate_valid callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * Either &drm_mode_status.MODE_OK or one of the failure reasons
+	 * in &enum drm_mode_status.
+	 */
+	enum drm_mode_status
+	(*tmds_char_rate_valid)(const struct drm_connector *connector,
+				const struct drm_display_mode *mode,
+				unsigned long long tmds_rate);
+
 	/**
 	 * @read_edid:
 	 *
@@ -1293,6 +1297,47 @@ struct drm_connector_hdmi_funcs {
 	 * Valid EDID on success, NULL in case of failure.
 	 */
 	const struct drm_edid *(*read_edid)(struct drm_connector *connector);
+
+	/**
+	 * @avi:
+	 *
+	 * Set of callbacks for handling the AVI InfoFrame. These callbacks are
+	 * mandatory.
+	 */
+	struct drm_connector_infoframe_funcs avi;
+
+	/**
+	 * @hdmi:
+	 *
+	 * Set of callbacks for handling the HDMI Vendor-Specific InfoFrame.
+	 * These callbacks are mandatory.
+	 */
+	struct drm_connector_infoframe_funcs hdmi;
+
+	/**
+	 * @audio:
+	 *
+	 * Set of callbacks for handling the Audio InfoFrame. These callbacks
+	 * are optional, but they are required for drivers which use
+	 * drm_atomic_helper_connector_hdmi_update_audio_infoframe().
+	 */
+	struct drm_connector_infoframe_funcs audio;
+
+	/**
+	 * @hdr_drm:
+	 *
+	 * Set of callbacks for handling the HDR DRM InfoFrame. These callbacks
+	 * are mandatory if HDR output is to be supported.
+	 */
+	struct drm_connector_infoframe_funcs hdr_drm;
+
+	/**
+	 * @spd:
+	 *
+	 * Set of callbacks for handling the SPD InfoFrame. These callbacks are
+	 * optional.
+	 */
+	struct drm_connector_infoframe_funcs spd;
 };
 
 /**

-- 
2.47.3


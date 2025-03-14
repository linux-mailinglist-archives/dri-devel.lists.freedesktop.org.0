Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240D2A60D70
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 10:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EF210E378;
	Fri, 14 Mar 2025 09:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6wt+O/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FCF10E34F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 09:37:03 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E05nq3003727
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 09:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MfnAPAp+R1qao5Wl5xlx5FtRla2ujtMfiADZ2nfdBAQ=; b=l6wt+O/6JjKNXJv6
 qTfaNcP0eRbf10CjgKQAzzap1lDQ5nUqQBwNRIqKm0kVu/muT9H2+VhjcfXdCR3u
 Jh/IZtx91b5WbKwYAxvY9y7ctYXjsloC/wnqUd0+KtFyyI7uUp6YBKIhNE0BBIw3
 JytDXWbOshqZ+n5bxAzMJUo7Xh2G5x7cXwIJr58bv8lUPQXkRffKCoCUzuHjZMWQ
 p/EOtWmL3nN2XkQLKNWdZHofZlUz9Ly0XNh3yhyv/o/D77/jDyObxeOGV4ledJ9r
 uN1JNwdqTcTtrLoMg7bFYK4iWCBL6FzY/eJcZffc5UjQjEEcd7pDvA0WPEtsmVXi
 iGAaJg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45b96yepvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 09:37:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8feea216aso56323266d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 02:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741945022; x=1742549822;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MfnAPAp+R1qao5Wl5xlx5FtRla2ujtMfiADZ2nfdBAQ=;
 b=FzWPD9FC55Sq+EY18fOMKz3sNXWLH9qipUjBNGZMPLXqucXnAnt1TKOFa1gaCf77f/
 FOlkB5DHdyQvAHdLq4BgA/I1iblW/Vs/fa9CnqJiLfG0Dyf9EE+vyFIoqzV210bYpfUS
 1dEB3jnX4ctkqsvy7kOEt+bFki/2paFBZsjgJTH94RL4Vn0De8+Ii9Gy9lhO11A2Rk/x
 S76ONzWWv6m0F923Qoq0BvHHe5Fz+8se+XDi6YXR2NCEd/brqL0mMoQvvm0jLhmuUm7x
 uUx4OB+PlDr6+6BJSpxDO1hQ70Ci+PJz6pRJ7gqy0XZJG3qgvkL0/9ObxZMESbRg1hnc
 1KFw==
X-Gm-Message-State: AOJu0YxFY6wtaRtyVfE6aofjR5jtZfmBtH5PJnrsbYSepbuNuveRC8Um
 lYYXbFqYwhJjcVyfW+SR3G+sXjBIO/64rlvaDtF1GeP3AczVZnYqN9HcUyndAO48TkvqGujICYW
 inTQl0rZEpUKB82EJ0WVVguWNvcrtshHAuNHeipmy2xjeri8HVEyX+f7x4musTc71KLg=
X-Gm-Gg: ASbGncuVyBhE5f3858xtOrI1QGQrBArx5YiG9mGSZkDTfYQtlbxffu8/USGwQlXt4f5
 PobEpLvmZRzTenj+kltxjfpOB8i4NCix+Y2UUly7UoQ9jaimESnX4+rs8+0jIigWyAh0L/cjUXg
 xr6VxXR5n1NGZuekPuu+CayIzOwvnf/TAs+DKelrkRtz2tMxiOHj4TDBfQFpcUg7USBixUxjJVi
 f0f1ONK1jcqDm/OMxNx/ChnFFzkU0+UqTmA3X1vBHZqLIMEvLr035cHMnEkO5hoBmFHcoTDErK5
 3ovwwJE5KVCZZ/R2jwvFBtSwY2pq1GgXBxjWn0TOqb3/TT/aNi7hnPGUbXfxlIKiMZPwl1p3GTA
 LKkzKGpUWA0wu30tuwiLDM02ujwPV
X-Received: by 2002:a05:6214:4606:b0:6e6:9b86:85d0 with SMTP id
 6a1803df08f44-6eaddf047edmr86519026d6.8.1741945021769; 
 Fri, 14 Mar 2025 02:37:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9R6JN0FXci6PacWxLW3IijDjh+4/mh8D4VFIDD4anPJXV7iyWYisApZ+3rhQVxcDkVem3Xg==
X-Received: by 2002:a05:6214:4606:b0:6e6:9b86:85d0 with SMTP id
 6a1803df08f44-6eaddf047edmr86518726d6.8.1741945021360; 
 Fri, 14 Mar 2025 02:37:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7a8368sm478585e87.32.2025.03.14.02.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 02:36:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 11:36:49 +0200
Subject: [PATCH v6 2/4] drm/bridge: add function interface for DisplayPort
 audio implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
References: <20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com>
In-Reply-To: <20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4882;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sPGFPs8Z9BJzKH3T0QhgjGfhe3qB0nROPdLNLb450jk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn0/ixcF0KVuK5O3qMfR6zk8CJZvUE1rfBf7MgP
 pa+lkcaIDiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9P4sQAKCRCLPIo+Aiko
 1VicCACT3fkLWM99BgjcdDqMoVZ2qL5iU7A4kGDlUS1EZSsdCxqcqblOHmzmqUNwzLd9RdUp/3h
 lo59QNm+mnNht9pNC4D67dPwm/pcRPGYQhoaiT4BuXb3LYm6GcJ+hF2Zu/IopztZUn0PIVq6bDL
 wwBV4yjwOsyWjXW2eeQYBuZSckBS9VxsI8WWvo4IVE987p+00C1Rzrb5mPG/WeuXtRd+axXAt7e
 0itOGCNXFS96Q+xXEE+7KGP+zt1swUhg9f+oj8xDv+W9MoBrtjY1vXU4ecwMxWj+ln3mUrfwwNM
 50DU1B51imC85WLt7ZfFfpHR/Wg01cv58amOmkvZGODGisPp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: W_fKJXBW3UFaZkCi0qqgByggytSU2rtz
X-Authority-Analysis: v=2.4 cv=I+llRMgg c=1 sm=1 tr=0 ts=67d3f8bf cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=4Yht-t6EeviOxvws5vEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: W_fKJXBW3UFaZkCi0qqgByggytSU2rtz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140075
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

It is common for the DisplayPort bridges to implement audio support. In
preparation to providing a generic framework for DP audio, add
corresponding interface to struct drm_bridge. As suggested by Maxime
for now this is mostly c&p of the corresponding HDMI audio API.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/drm/drm_bridge.h | 88 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 6 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index c6b66f733fffa77afc875e52f9d1500fcb66400f..e8d0e56bcc91c1f4c689e4e6fbd2aceaf4fc5cf1 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -737,6 +737,65 @@ struct drm_bridge_funcs {
 				      struct drm_bridge *bridge,
 				      bool enable, int direction);
 
+	/**
+	 * @dp_audio_startup:
+	 *
+	 * Called when ASoC starts a DisplayPort audio stream setup.
+	 *
+	 * This callback is optional, it can be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_DP_AUDIO flag in their &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*dp_audio_startup)(struct drm_connector *connector,
+				  struct drm_bridge *bridge);
+
+	/**
+	 * @dp_audio_prepare:
+	 * Configures DisplayPort audio stream. Can be called multiple
+	 * times for each setup.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_DP_AUDIO flag in their &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*dp_audio_prepare)(struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *fmt,
+				  struct hdmi_codec_params *hparms);
+
+	/**
+	 * @dp_audio_shutdown:
+	 *
+	 * Shut down the DisplayPort audio stream.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_DP_AUDIO flag in their &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	void (*dp_audio_shutdown)(struct drm_connector *connector,
+				    struct drm_bridge *bridge);
+
+	/**
+	 * @dp_audio_mute_stream:
+	 *
+	 * Mute/unmute DisplayPort audio stream.
+	 *
+	 * This callback is optional, it can be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_DP_AUDIO flag in their &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*dp_audio_mute_stream)(struct drm_connector *connector,
+				      struct drm_bridge *bridge,
+				      bool enable, int direction);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -830,9 +889,24 @@ enum drm_bridge_ops {
 	 *
 	 * Note: currently there can be at most one bridge in a chain that sets
 	 * this bit. This is to simplify corresponding glue code in connector
-	 * drivers.
+	 * drivers. Also it is not possible to have a bridge in the chain that
+	 * sets @DRM_BRIDGE_OP_DP_AUDIO if there is a bridge that sets this
+	 * flag.
 	 */
 	DRM_BRIDGE_OP_HDMI_AUDIO = BIT(5),
+	/**
+	 * @DRM_BRIDGE_OP_DP_AUDIO: The bridge provides DisplayPort audio operations.
+	 * Bridges that set this flag must implement the
+	 * &drm_bridge_funcs->dp_audio_prepare and
+	 * &drm_bridge_funcs->dp_audio_shutdown callbacks.
+	 *
+	 * Note: currently there can be at most one bridge in a chain that sets
+	 * this bit. This is to simplify corresponding glue code in connector
+	 * drivers. Also it is not possible to have a bridge in the chain that
+	 * sets @DRM_BRIDGE_OP_HDMI_AUDIO if there is a bridge that sets this
+	 * flag.
+	 */
+	DRM_BRIDGE_OP_DP_AUDIO = BIT(6),
 };
 
 /**
@@ -934,25 +1008,27 @@ struct drm_bridge {
 
 	/**
 	 * @hdmi_audio_dev: device to be used as a parent for the HDMI Codec if
-	 * @DRM_BRIDGE_OP_HDMI_AUDIO is set.
+	 * either of @DRM_BRIDGE_OP_HDMI_AUDIO or @DRM_BRIDGE_OP_DP_AUDIO is set.
 	 */
 	struct device *hdmi_audio_dev;
 
 	/**
 	 * @hdmi_audio_max_i2s_playback_channels: maximum number of playback
-	 * I2S channels for the bridge that sets @DRM_BRIDGE_OP_HDMI_AUDIO.
+	 * I2S channels for the @DRM_BRIDGE_OP_HDMI_AUDIO or
+	 * @DRM_BRIDGE_OP_DP_AUDIO.
 	 */
 	int hdmi_audio_max_i2s_playback_channels;
 
 	/**
 	 * @hdmi_audio_spdif_playback: set if this bridge has S/PDIF playback
-	 * port for @DRM_BRIDGE_OP_HDMI_AUDIO
+	 * port for @DRM_BRIDGE_OP_HDMI_AUDIO or @DRM_BRIDGE_OP_DP_AUDIO.
 	 */
 	unsigned int hdmi_audio_spdif_playback : 1;
 
 	/**
-	 * @hdmi_audio_dai_port: sound DAI port for @DRM_BRIDGE_OP_HDMI_AUDIO,
-	 * -1 if it is not used.
+	 * @hdmi_audio_dai_port: sound DAI port for either of
+	 * @DRM_BRIDGE_OP_HDMI_AUDIO and @DRM_BRIDGE_OP_DP_AUDIO, -1 if it is
+	 * not used.
 	 */
 	int hdmi_audio_dai_port;
 };

-- 
2.39.5


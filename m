Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37E1B0287E
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A34910E3DA;
	Sat, 12 Jul 2025 00:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnCi+5Cw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6A010E16D
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:31 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAxZRn008925
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ALCjDWEkXO3cSVphqkkbiifG5d6oMqeh3cfLujT630s=; b=hnCi+5CwYmkRDAp9
 x+OJO75PiMywynQsp5kAiZNA+Gvp4/QIEkBT/E9D3PrkgZXiTVQ6NxDnp7YtIz/l
 4wpxRtUtmtzpYdcgFhx6dVcRIy2fcy3+sc9voR+yIfBhh+/W5F6NlkROkfey4Roz
 oBvlpoMvVMC+dwKzZjSeMtH5lBGiugRUBJkNio+JPpvkhoYYPcffWr/O3Amxe8Qs
 /6h75rbMfDaeh1/mMAtY67zsFcGxoeJHGalnG0oQlt5uSFF1uW9brJpDXxkBgKxG
 m06D5HkxlGJU+yDe2oBXQ1mL4SkVLyF9gJbXsHrAsvoLQBLwORroM2+sXcC7OZIv
 vMWiwQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcga6rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3132c1942a1so4039578a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281909; x=1752886709;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALCjDWEkXO3cSVphqkkbiifG5d6oMqeh3cfLujT630s=;
 b=inbfZ5tSPSGBfbXYe3um/rCV4XK2/AZj4mJuDMgjKw/3Gp9hUl3LA920xR+IQk/RUK
 ycp5jfO1k5tCnGPWKi+K3Y06XdgJckCh2whpK4FLNCZZTgckX6SGikLoSKtKj3l2rDYc
 TAJqUeJRJWDe5Qniximj5Ro5L+YIQckhQsG/ney+VN6lh+djk0005nt9i4SbTdLWqcr9
 BGIuXQtFXmrupm1oZNEnBQ1EASUmBRrx8g5/gRgVaAy+5qBg9uirhbOBiq8dTCrHIuGT
 clM8Ym+aGLo17jhD7AygnekD3wK8t/xkmp5tzG2ClXhbHlVgslmz49u7s/NHkrgtRB4t
 zKyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjlpRFbCDdWx0Tw1YbyR7ajZpo4/TsxwY1tSLPAT850x/dm/ODU6YOKRPWPLzi8a64fAFvw/MGhvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDwU4RgvMFxa3vcWsG3aLYu+V2x5DtHsfuAGfy4VNkVjk6SRdr
 tyjZ4L3tIrbmAQsg2R2nypHvvVSIEZGQwqgtsE0Vu5cW4FZ89MZdC95220mePHd6EtLw5ViP3DK
 pfPYjl8OjMXlJ8YYWO5xqzjXGz28AeOuDNiwWiiH2HNjHv4r+Gp3besxKHRV9jmUrV0n5/S8=
X-Gm-Gg: ASbGnctU/f0VttAq3tOiPDyuyPcOg2eFqkJG34jxPdF71x6Z6Zq+nb51tEnY6+zsdQ5
 1Qa0XJU6PuyY09DI4iJnZY53qz22LCNc4ZLle/CoNnXCpkwVDZ+pWgaE3WYFW6SjA4QeXuJerWS
 Jvvx2uogCl/GznMAaG0ywopKyIBXon97a2YhJWxjPh6VwV2CS5Ip+LhBsxtjJZNT6JRtiOxC+Oj
 S5flOcNhG0jhyiKNOVJyeQdR2iiJAXCGBayfDZCRAS9+Yl49hYRUYcN39F+XiOQTUOa+0UGSfI3
 lyp03bKYceCGgGrGUD2k8fta08C0A06DqDpAYPS/zpkiNhISvO0wd2lyYHRONxZrmHu/rbleJX7
 LYCxqIdBp4OtWEGomPzaNA1TP
X-Received: by 2002:a17:90b:278c:b0:313:5d2f:5505 with SMTP id
 98e67ed59e1d1-31c4f57241dmr6755779a91.16.1752281909021; 
 Fri, 11 Jul 2025 17:58:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTjTzAf3W6aYWioBrfWiPpQYRHzCr2mBxDHLXuoKrspgu/JdV7ywhFPxy5/WNMhxgRvWfITg==
X-Received: by 2002:a17:90b:278c:b0:313:5d2f:5505 with SMTP id
 98e67ed59e1d1-31c4f57241dmr6755742a91.16.1752281908505; 
 Fri, 11 Jul 2025 17:58:28 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:28 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:06 -0700
Subject: [PATCH 01/19] drm/msm/dp: Track when DP is physically plugged in
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-1-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=2952;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=bjSlnzJsU8vYNvjXm7NY70sSMmOsV/kR5hEvlzfFWqE=;
 b=fGd0JKsAxwpnFjGlCPM8DT0L2cnVp4gMuVcB1Edo1LJxe3zWfpxwDElkztOq0ic23zZXz6T6R
 8QFOhmLTZ/bDTKmrdcnhAFmUyXCMi/ITBan1A5/bQ/LqH32Hsop5OGz
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=6871b336 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dpF7G2_Zdg4AieafSv4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 7y67D9VO0fH5YyH9V-gMHMMsmYPNN6H2
X-Proofpoint-GUID: 7y67D9VO0fH5YyH9V-gMHMMsmYPNN6H2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX6qS20Qg5Wc09
 HdNtAEgtWB0mYiud3gSUIUzzimRTAHc8AmlEm5EWCBMq6lzKhHQ3vRczsBZG5Df3vBmvXgTOz9R
 aSE6dYDqChqayhvMjgdEWk7ou5U/wIVxyCxv3YVTadg9cXovW2wkzwVpXKq8mzmAEgIG+crhL9r
 w8gssYesnjtJTj/RoWU/KW5vuq1bpbirN4wENVdpHUlKFz2Eu2ZhsA5sGApY8m0gNSHfO8wJY3i
 iHSqZGaw+FQevc+IeyuynIlba3cIEA1sYBlbQL8AHf4eKvlOlU/guYGVr5LYcDRv57Sgmte23eH
 +ZbRMN/vrA4jQmU4xj+EDcInmBGqXECq9JfW1DoWSfTEuv6VfuESt5GBqrfq9ajlsFtvxot2hGt
 /LdRuhWfIQJU0MOcDGou0gbkVj/IXzkwIjnTjDz5zIYRQJfcEWBbSqiLOJTaCDc1JBkV3ZDw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005
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

Add a boolean to track whether the DP cable is physically plugged in.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3..6945df782f7b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -531,6 +531,7 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 			rc = msm_dp_display_process_hpd_high(dp);
 			if (rc)
 				dp->hpd_state = ST_DISCONNECTED;
+			dp->msm_dp_display.connected = true;
 		}
 	}
 
@@ -604,6 +605,8 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 		return 0;
 	}
 
+	dp->msm_dp_display.connected = true;
+
 	if (state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_DISCONNECTED */
 		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
@@ -621,6 +624,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 	ret = msm_dp_display_usbpd_configure_cb(&pdev->dev);
 	if (ret) {	/* link train failed */
 		dp->hpd_state = ST_DISCONNECTED;
+		dp->msm_dp_display.connected = false;
 		pm_runtime_put_sync(&pdev->dev);
 	} else {
 		dp->hpd_state = ST_MAINLINK_READY;
@@ -662,6 +666,8 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
+	dp->msm_dp_display.connected = false;
+
 	/* unplugged, no more irq_hpd handle */
 	msm_dp_del_event(dp, EV_IRQ_HPD_INT);
 
@@ -680,6 +686,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 		msm_dp_ctrl_off_link(dp->ctrl);
 		msm_dp_display_host_phy_exit(dp);
 		dp->hpd_state = ST_DISCONNECTED;
+		dp->msm_dp_display.connected = false;
 		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 		pm_runtime_put_sync(&pdev->dev);
 		mutex_unlock(&dp->event_mutex);
@@ -1596,8 +1603,10 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	if (dp->is_edp)
+	if (dp->is_edp) {
 		msm_dp_hpd_plug_handle(msm_dp_display, 0);
+		dp->connected = true;
+	}
 
 	mutex_lock(&msm_dp_display->event_mutex);
 	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index cc6e2cab36e9..68bd8be19463 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,6 +16,7 @@ struct msm_dp {
 	struct platform_device *pdev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
+	bool connected;
 	bool link_ready;
 	bool audio_enabled;
 	bool power_on;

-- 
2.50.1


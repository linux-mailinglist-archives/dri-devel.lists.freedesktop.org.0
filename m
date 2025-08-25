Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21082B342FB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7153610E4AE;
	Mon, 25 Aug 2025 14:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGziQes7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DE210E4AE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Ow8M026509
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 228/LJ536Yw6oDyiIYYU61EUqHaRT0V0B7t/T3/fRWg=; b=gGziQes79OlpQcOK
 zDOD+YjNlZ/UX73RyXvgR8hucq5t21ooUmKRGBFgng629ZjqDrn7ebuyvO1ydzMu
 Hxv8j7VJEkplMvtjzvmPZMD7mDw0VIHdcuh22IqIMXMbIRDC6VLnQtjQovHNKvOY
 rAXV4er5P3+PLk7bfq3Bt3KCDiwWfqJ/OXiOezJiHhH+GOZjD4RzCbehWtFSSwPD
 1QkiTqHxPteS5hmxQCtetndoeP6zTxCRxM5Q9zxlrEnH39EJnCCtIscMrNynViCQ
 KzIVzQQY0yweIpcBXeuMONh7teAkHOV8xX60fftB2vuKb1AbXPnJdnmc/LZmXmwq
 gSleAg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5d7m6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b4c20148c54so582531a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131438; x=1756736238;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=228/LJ536Yw6oDyiIYYU61EUqHaRT0V0B7t/T3/fRWg=;
 b=LC8Xh3MNJFXGHiCLV21+7Lik9JQGlhXAqtkXBgVJi8zzAd50b+iUCaFM8fwTukZrPo
 6+oQBlViv1TNC/TjGtJnXGeDd+d7lf73NTAw5jXpTV/aAzeoAAdkSbsFzBUrGJXnMHI1
 j5lzNZ4MfCIcgLoPVTGWS2X6eOclL/ihfQnmSzcOFvMdI+BKbnKuPBoj1iWVLewAGyV2
 UkLaAaT3d4tKBNCpxAvouznS0wDPl+EweSQ2wWLjdU8EAKkvxA+lorQEw9UQJf62WH4o
 gNXt6u2pxmOtjS2BHX54fNJXNE18D/xWknkWOYRE2b6wn7EehTTV9EX1Z+ZIvbsgErA1
 jQdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUme9KroiMiIffJKOXBBgmF5LuTBR7mBxTzqFYSRGw0R40E86i+qv062oLZ8EejEhrVbp3l9nyRTbs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7uas0JsuHAD75RCS0lq4RM0+OhnmK9ToCYREuODWQ4I2HZyNt
 TuyfKFGREsKJFQTO3DBPhWGXfVJXdKZJEcF/PPEdtL9zMYt9fLFeOIenrN7AUe751eda4u7Qbp1
 aIK1cTTsHF9pNBPJpYPKq2HDU+ffpsCLX/NoKBBs//MVOONaqjfO2/Y4IlSDN1wI4BdnUJzU=
X-Gm-Gg: ASbGncu+LQW/av+JDESQR6ewIaDcGm2a6aBu44Pi2zR/VKyIfHt/u7skS2Gnlrvg91O
 eTs2NT40Y4r6dpL6qt0EXwkow6p58qIu39uc80um5Z0Z5lXE/ANqyXVJskvxnp8GPLm7O7BGu+4
 a4K9dIHvDASRI/UkTD8THusjtMJoBLTLsyknq+r30VhOOhWuMOEP52VI7FqEtGyxAcsWzy+zTmf
 AC4eFUV1aOqRPbyXM00VnQkrV64YebiRZ5ruo6Ta8zWLxXfCLflcGL+HD4NVeYIthM+yz+wEZ5N
 s1q/SCCAFKqUDlNbHBBXbKEQMJ4wZZP69zVAQwJqVLctxUDrLntAyuJtR5k/tQL7gUps5cY=
X-Received: by 2002:a05:6a20:2449:b0:239:a3b:33e5 with SMTP id
 adf61e73a8af0-24340d91844mr19080430637.39.1756131437841; 
 Mon, 25 Aug 2025 07:17:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeidNOygMem/ySNqGGxvS/UkycnpbyA5wkruiJa3ZLqkO68ei+5oPylTEuapzUQcwzkqNywQ==
X-Received: by 2002:a05:6a20:2449:b0:239:a3b:33e5 with SMTP id
 adf61e73a8af0-24340d91844mr19080372637.39.1756131437288; 
 Mon, 25 Aug 2025 07:17:17 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:16 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:48 +0800
Subject: [PATCH v3 02/38] drm/msm/dp: remove dp_display's dp_mode and use
 dp_panel's instead
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-2-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131418; l=5167;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=n4iY9cD+dBjYaCRvOQIEU6YYpjVmCWe/78mH40eh77w=;
 b=8dUmzqPkKrqJpSTKp59X3JBldDCjYW+1aJBMdtSRsgxsyUMuqgXBKSBS5JckVHsx+H7PMKZei
 wI9xYh5cHj1Dx1ogWt0TOyllj0mjlMCF8aw3Ucb/weyq0h3wGZxubV8
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX+FOM9VpWHWMx
 ulkz2hnvuOkOvMX/5flc81qxn2q9fvJfr4zQERVJkRr2Ec3XFzpH24MSIcoF3CThZiwFpNNQpJU
 Ox2xsXZAcJnjJnLsxFWX9IEWimK3nGrGFoo221CJaGwg6wXPzk7zIMA/G+o5Rv6omEulVVQlHS1
 4H3D7yxBS6iXMfkY4mYoE8oJH3TmpcIIceG+saNC9wsHU6KnYvLSyLxD6QDsE9gbo1ROpr1/rZF
 j0xnFMOeU00/j3j8Hdhqrd28iM0GHP8e6gSz0HfhtKdXWOo7plcLS5hNnHR9Ug2W11Bd7YEXfE1
 u7r1mzA1QoJgUGz4C2AeTxJ967hyntrWxcwlPEeBnkmYaLBdAx8Xty9IKeW0EYdtZfoPtzV4sZO
 DpecCtmF
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac706f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=wrQRTU2gfdt6St0ev-sA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8osgVRrCAyU4msF1cPaEKOEFKIkBrqfn
X-Proofpoint-ORIG-GUID: 8osgVRrCAyU4msF1cPaEKOEFKIkBrqfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_display caches the current display mode and then passes it onto
the panel to be used for programming the panel params. Remove this
two level passing and directly populate the panel's dp_display_mode
instead.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 66 ++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dadf31bc37763c4f07f68b76fbbe33fb77b20850..632a1191e4e48fecd7dbda2f6ec6b8ed0aeebc93 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -60,7 +60,6 @@ struct msm_dp_display_private {
 	struct msm_dp_panel   *panel;
 	struct msm_dp_ctrl    *ctrl;
 
-	struct msm_dp_display_mode msm_dp_mode;
 	struct msm_dp msm_dp_display;
 
 	/* wait for audio signaling */
@@ -649,16 +648,29 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 }
 
 static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
-			       struct msm_dp_display_mode *mode)
+				   const struct drm_display_mode *adjusted_mode,
+				   struct msm_dp_panel *msm_dp_panel)
 {
-	struct msm_dp_display_private *dp;
+	u32 bpp;
 
-	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
+
+	if (msm_dp_display_check_video_test(msm_dp_display))
+		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
+	else
+		bpp = msm_dp_panel->connector->display_info.bpc * 3;
+
+	msm_dp_panel->msm_dp_mode.bpp = bpp ? bpp : 24; /* Default bpp */
 
-	drm_mode_copy(&dp->panel->msm_dp_mode.drm_mode, &mode->drm_mode);
-	dp->panel->msm_dp_mode.bpp = mode->bpp;
-	dp->panel->msm_dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
-	msm_dp_panel_init_panel_info(dp->panel);
+	msm_dp_panel->msm_dp_mode.v_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
+	msm_dp_panel->msm_dp_mode.h_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
+	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
+		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
+		msm_dp_panel->vsc_sdp_supported;
+
+	msm_dp_panel_init_panel_info(msm_dp_panel);
 	return 0;
 }
 
@@ -1328,7 +1340,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	if (dp->msm_dp_mode.out_fmt_is_yuv_420)
+	if (dp->panel->msm_dp_mode.out_fmt_is_yuv_420)
 		return false;
 
 	return dp->wide_bus_supported;
@@ -1389,10 +1401,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
-		DRM_ERROR("invalid params\n");
-		return;
-	}
 
 	if (dp->is_edp)
 		msm_dp_hpd_plug_handle(msm_dp_display, 0);
@@ -1405,12 +1413,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	if (msm_dp_display->link->sink_count == 0)
 		return;
 
-	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
-	if (rc) {
-		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
-		return;
-	}
-
 	if (dp->link_ready && !dp->power_on) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
@@ -1479,31 +1481,11 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 	msm_dp_panel = msm_dp_display->panel;
 
-	memset(&msm_dp_display->msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
-
-	if (msm_dp_display_check_video_test(dp))
-		msm_dp_display->msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
-	else /* Default num_components per pixel = 3 */
-		msm_dp_display->msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
-
-	if (!msm_dp_display->msm_dp_mode.bpp)
-		msm_dp_display->msm_dp_mode.bpp = 24; /* Default bpp */
-
-	drm_mode_copy(&msm_dp_display->msm_dp_mode.drm_mode, adjusted_mode);
-
-	msm_dp_display->msm_dp_mode.v_active_low =
-		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
-
-	msm_dp_display->msm_dp_mode.h_active_low =
-		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
-
-	msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 =
-		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
-		msm_dp_panel->vsc_sdp_supported;
+	msm_dp_display_set_mode(dp, adjusted_mode, msm_dp_panel);
 
 	/* populate wide_bus_support to different layers */
-	msm_dp_display->ctrl->wide_bus_en =
-		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
+	msm_dp_display->ctrl->wide_bus_en = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ?
+		false : msm_dp_display->wide_bus_supported;
 }
 
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)

-- 
2.34.1


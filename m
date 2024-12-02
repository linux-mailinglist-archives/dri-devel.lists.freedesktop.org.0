Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D48B9DFE30
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D683A10E6B4;
	Mon,  2 Dec 2024 10:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JChrYen3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B834510E6B6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 10:07:03 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53df7f6a133so4240547e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 02:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733134022; x=1733738822; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3J+RA/P6k/c3cWJyY6sSHCDd2MnBp09XsyaxlQB7qN8=;
 b=JChrYen3hxwgVhL5SbnvhK5tBAPue9zf0WJoPbss7UjnPV3Rzj93tgpCX6WQJGAnNJ
 1os52DAyKU+eqzDPwKTtsBe4Ns2GVh8KtObFvNdcVK9JrHXLAPYcJtjx6rCZ3V4FsmOm
 LlvF7XH1n1uoe7fNjIWQrHSkSFyh7j4+dyzJd8V7g8Qd7dpdDe4hZnfoSThVrj+wi3Bb
 VgIhXnrClMpL+78Be5TMBS0lwJHDxOY0x/UpZyKPLzWe6rcAx5SW41qtSnoN2NpF6Z8t
 1xbyRo5gm+KprOpEMkLuvXHXU+WmX6wiV1WFSgTP4zkKVGJdgkhMJrUQsnmXnzHkajxM
 O16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733134022; x=1733738822;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3J+RA/P6k/c3cWJyY6sSHCDd2MnBp09XsyaxlQB7qN8=;
 b=b+LWKWMEphDoW3vBF1/Bh7IplaiMgiI70P5REGy6OFbG5VDpJd2oCCoK1rH1K6NnU9
 C2kufLNIE71JXvpQrwizLeDvswuXf9j0AMT9DdV33FEvdIJQY1zJde3zN0EVW3uxOMem
 Fvk0YbQkIMJ44FzlSelvAqsW+nUAfiE1E4q/eLVfXxdhurf2xnBhE7FBjkXpH8sv2YtD
 GUqnuXkIPorW8NHRb/+/fZomJXunRs8j3+Z4877FMZVkxpBqcz//pDqYLqqnSYYwghVl
 ppeZO/Z5csb5B0sAG01lUweD+ZmL0d62Qd+uiVdk6YXKU5VYIbxSDKALyZb5wOkKi+tl
 YBWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5SWkx0mSSNI2D2o//yWm7q0fBc2yzk0CGXVPRP7FOm9qQPxgb9YfHno17vAaybNr0bMVekBgu+aY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRxYz77HZEABUug47HIwEgfmZL199Nbfva8gemIanv9IViA/jP
 pXz7tZWlEh/BI38gCERN2HerDA4dy4CgbAPbG5JMxbMx0C8QQ3BL5InXTf/vIkg=
X-Gm-Gg: ASbGncttXkI58K1U1DSe4WAJHmb/hjMQdUY8aT3wKXYKUIK1RBJj1D3205ITTAkzyN9
 EAK3clcnakAJ1LS1YhKm8vYbx/MUfQtJc4vWXVq8tDXRVBLjqp1Adpyzwwc5QGW72AYL4F7JN/Z
 WZXJU+aSBw38mblC1Z88wY1BNNIFZoixhiQfwUPhlt1t8Z9ZHG1S48gWSmLhmZnSGPQNC22G2qA
 GpX1e4HWfL8Rm8DLzJpVU0QdCYQ0sePpmdhXXDMOPhnvOBv0BKjmpKfhg==
X-Google-Smtp-Source: AGHT+IGc2zZYcH8LA6R8/lH1zmwzeP6OLCJe5rJ/z/73nBw5oSkVqzgDZAAwb6RYP9xhJ/WC+ZQoLw==
X-Received: by 2002:a05:6512:1393:b0:539:ddf1:ac6f with SMTP id
 2adb3069b0e04-53df00ff22amr9717712e87.46.1733134021892; 
 Mon, 02 Dec 2024 02:07:01 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f191sm1418314e87.136.2024.12.02.02.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 02:07:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 02 Dec 2024 12:06:40 +0200
Subject: [PATCH v2 10/14] drm/msm/dp: drop obsolete audio headers access
 through catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fd-dp-audio-fixup-v2-10-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5661;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=y6xMrjriF+gjxuNQOlXvz31Omrij3NB7dDWW/SLy64c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnTYatPueMIDqk0DILPD06ksc36RuU/A0+2R1Jk
 postiENDneJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ02GrQAKCRCLPIo+Aiko
 1eU4B/94/LVUwx4JTvDjG9hLYHSKhXSgbU6xcgifL2JUq10vakm2VdSW5mbgUSaQhOP1PB47BL/
 Q3phMmfbVPlKhVh0EzZHA5AfHu1A1p7y6lYm8fSPw3YIm3SB9+dQ/3OujFq8OyheMQL/7bgz+Rv
 pG4OQVqEEsgAldlXyiQQqtwgWyD3Ii4CWsPc9uarbEOGreq6lyRH0dvvDxVKLzQia5FfAe1BECd
 yosdYszgIL2ZT16R2Yj9UW3LwvtW37rNm+tYWtzghF+Tkn3hKz/Txo5OTRnWTNv1RXFhRpt/vTT
 21yQLixDonq6HzsoaN9a/tI+qIMGU4VBtZVqzVLPzonQUV1c
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Drop obsolete functions to access audio packet headers. The dp_audio.c
now writes them using msm_dp_write_link() directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  2 -
 drivers/gpu/drm/msm/dp/dp_catalog.c | 76 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 24 ------------
 3 files changed, 102 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 1aa52d5cc08684a49102e45ed6e40ac2b13497c7..24b62faa875437e184895c6d03df19884ebb1fd6 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -405,8 +405,6 @@ struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
 
 	msm_dp_audio = &audio->msm_dp_audio;
 
-	msm_dp_catalog_audio_init(catalog);
-
 	return msm_dp_audio;
 error:
 	return ERR_PTR(rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 9c12484589dc38951a3f1cb4bb33eb9aa5822d87..5071c86fd219cb1c933b32104a396982c5cc8ace 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -62,7 +62,6 @@
 struct msm_dp_catalog_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
-	u32 (*audio_map)[DP_AUDIO_SDP_HEADER_MAX];
 	struct msm_dp_catalog msm_dp_catalog;
 };
 
@@ -300,40 +299,6 @@ struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
 	return &catalog->msm_dp_catalog;
 }
 
-u32 msm_dp_catalog_audio_get_header(struct msm_dp_catalog *msm_dp_catalog,
-				enum msm_dp_catalog_audio_sdp_type sdp,
-				enum msm_dp_catalog_audio_header_type header)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 (*sdp_map)[DP_AUDIO_SDP_HEADER_MAX];
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	sdp_map = catalog->audio_map;
-
-	return msm_dp_read_link(msm_dp_catalog, sdp_map[sdp][header]);
-}
-
-void msm_dp_catalog_audio_set_header(struct msm_dp_catalog *msm_dp_catalog,
-				 enum msm_dp_catalog_audio_sdp_type sdp,
-				 enum msm_dp_catalog_audio_header_type header,
-				 u32 data)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 (*sdp_map)[DP_AUDIO_SDP_HEADER_MAX];
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	sdp_map = catalog->audio_map;
-
-	msm_dp_write_link(msm_dp_catalog, sdp_map[sdp][header], data);
-}
-
 void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *msm_dp_catalog, u32 select)
 {
 	struct msm_dp_catalog_private *catalog;
@@ -417,47 +382,6 @@ void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *msm_dp_catalog)
 	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
 }
 
-void msm_dp_catalog_audio_init(struct msm_dp_catalog *msm_dp_catalog)
-{
-	struct msm_dp_catalog_private *catalog;
-
-	static u32 sdp_map[][DP_AUDIO_SDP_HEADER_MAX] = {
-		{
-			MMSS_DP_AUDIO_STREAM_0,
-			MMSS_DP_AUDIO_STREAM_1,
-			MMSS_DP_AUDIO_STREAM_1,
-		},
-		{
-			MMSS_DP_AUDIO_TIMESTAMP_0,
-			MMSS_DP_AUDIO_TIMESTAMP_1,
-			MMSS_DP_AUDIO_TIMESTAMP_1,
-		},
-		{
-			MMSS_DP_AUDIO_INFOFRAME_0,
-			MMSS_DP_AUDIO_INFOFRAME_1,
-			MMSS_DP_AUDIO_INFOFRAME_1,
-		},
-		{
-			MMSS_DP_AUDIO_COPYMANAGEMENT_0,
-			MMSS_DP_AUDIO_COPYMANAGEMENT_1,
-			MMSS_DP_AUDIO_COPYMANAGEMENT_1,
-		},
-		{
-			MMSS_DP_AUDIO_ISRC_0,
-			MMSS_DP_AUDIO_ISRC_1,
-			MMSS_DP_AUDIO_ISRC_1,
-		},
-	};
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	catalog->audio_map = sdp_map;
-}
-
 void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *msm_dp_catalog, u32 safe_to_exit_level)
 {
 	struct msm_dp_catalog_private *catalog;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 8b63f53e960092666f08b95f556aefe210f4a1e0..24f1cf4ed5150c4e0e80880588641a01bb6a1596 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -31,22 +31,6 @@
 #define DP_HW_VERSION_1_0	0x10000000
 #define DP_HW_VERSION_1_2	0x10020000
 
-enum msm_dp_catalog_audio_sdp_type {
-	DP_AUDIO_SDP_STREAM,
-	DP_AUDIO_SDP_TIMESTAMP,
-	DP_AUDIO_SDP_INFOFRAME,
-	DP_AUDIO_SDP_COPYMANAGEMENT,
-	DP_AUDIO_SDP_ISRC,
-	DP_AUDIO_SDP_MAX,
-};
-
-enum msm_dp_catalog_audio_header_type {
-	DP_AUDIO_SDP_HEADER_1,
-	DP_AUDIO_SDP_HEADER_2,
-	DP_AUDIO_SDP_HEADER_3,
-	DP_AUDIO_SDP_HEADER_MAX,
-};
-
 struct msm_dp_catalog {
 	bool wide_bus_en;
 
@@ -151,17 +135,9 @@ u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
-u32 msm_dp_catalog_audio_get_header(struct msm_dp_catalog *msm_dp_catalog,
-				enum msm_dp_catalog_audio_sdp_type sdp,
-				enum msm_dp_catalog_audio_header_type header);
-void msm_dp_catalog_audio_set_header(struct msm_dp_catalog *msm_dp_catalog,
-				 enum msm_dp_catalog_audio_sdp_type sdp,
-				 enum msm_dp_catalog_audio_header_type header,
-				 u32 data);
 void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *catalog, u32 select);
 void msm_dp_catalog_audio_enable(struct msm_dp_catalog *catalog, bool enable);
 void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *catalog);
-void msm_dp_catalog_audio_init(struct msm_dp_catalog *catalog);
 void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *catalog, u32 safe_to_exit_level);
 
 #endif /* _DP_CATALOG_H_ */

-- 
2.39.5


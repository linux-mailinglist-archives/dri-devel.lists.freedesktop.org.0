Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3939EDBF5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C97D10EC7E;
	Wed, 11 Dec 2024 23:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="leb6p4UF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3065E10EC83
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 23:42:14 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so1312849e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 15:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733960532; x=1734565332; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rqZk3Tq5fCD5CxCGxjQunAPcXw7TlzumxBBq+M+xg8w=;
 b=leb6p4UFsoWV4fM5qVt83podJKlFF8Tis/VUwh6GzMYj5ia5j7AAK4DzMnArMOlrbW
 KQC2lQDlkuK7ilKlQ3gFqV6C5juK9Cf3b8qkBUT8hJkrdoH5GFYSKYvi21zo0IYwRctu
 ox4TPP14TB0u44IT3Su3JSCB7gQ1KKicrUSV+wm3qZKuopaL8uqFxfLHAm4WStMcb1HP
 YU7RHOZYpEBEAMQ3DIAZfjn41lj2rBtgKSZwvBzmCvOvHtXA+K7J6NHYqoR3trLfkUFg
 /Os8hdSFsnHSKsO4L5UI0HwlTwDaVluvWwjlYfHjgny/BUmsoHrYSaQ1Ln99uFdo3zbp
 D9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733960532; x=1734565332;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqZk3Tq5fCD5CxCGxjQunAPcXw7TlzumxBBq+M+xg8w=;
 b=DxQlqKBqNmWjrS5jmVriI3zFz/7mwEq78w7CwkWOFAb5zupYZDsaQEGYXFEkekavid
 4w8WVoqOw1EgeJxWmOlqqnRo28UHIU8cibJnYdLxZQli80Zo9ce9pJCsTR2LhmkOdjCZ
 F0lD3mNRMCz1KxulwvFW620w7UN7Tu7bpWey0pI1alA8vTtXBmjgYRj1+lqjMWEc5qeR
 uYHxTbZrPkV2QuubD86sm5YVPr50OcG5YDTPWYrJ/ZCB28XRDC31791eLEGXqIyXZG2m
 9xtGg67wepAPf4Ln9Sxvo+DWvazFMizA9ANuARfybl3F0Ne83KabAPwkaOP2Tu4dWi0L
 /CFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7LzU/491KIUwxiEInq7V2vP9Wtfp+Z/fcD+9Xlafw0S4YKUVWNszGd+ekfNF1HPrkLSmcVl6X1k4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJhjQycN7vk92NRT0NbCBwxAtJmePPKz9nKvsAQaV9ssQVU+Il
 qwzZIyYbNfCD8XA+CCWoKbeM93MILmdKkit7eYu83b2sqVBvDgac1msmEJz3IK0=
X-Gm-Gg: ASbGncvWzML1esFFeDdbRA9XK+4Cy4tLYghBjHbDL+7UfOCLKLGBF6Ay+gqm2zgepE9
 cF1FAUDbN8wb1DKwC3+0hwUl9ycZxvYUYEzb2p3eqE/M5Gf8ZUuXvPlvrwrr6OZsAseUSSuw1Vy
 AQlgYgi0h2USvJjrmb9mJamX0v1PAE1+hEmwuVkulEWsOxJnY5gmfAquAbIXJwZ7QTlXexWDdvN
 N9Xp/Q+MoNHM/lD0YX3st/l3ViI4OiozulQCvhpP5W1w2wuinNvMqs/pPcyag==
X-Google-Smtp-Source: AGHT+IHQJxXVg7oUqoCxrKBCYDWSNziSaeipgx0uMcv1PGhRvvElpMAwOp78E97VVfBYsHxBPRArdQ==
X-Received: by 2002:a05:6512:4010:b0:53d:f769:14cb with SMTP id
 2adb3069b0e04-5402f96473emr325964e87.9.1733960532528; 
 Wed, 11 Dec 2024 15:42:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 15:42:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 01:41:45 +0200
Subject: [PATCH v3 10/14] drm/msm/dp: drop obsolete audio headers access
 through catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-fd-dp-audio-fixup-v3-10-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5710;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=07bzKTzskIVI/q9n2mCU9Sl5yWHixeA9E75gnkk3cpk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWiM55LP5AjgeqKTF4Cp1FK2osYOe0MoctlG7i
 C+LwG6UROKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1ojOQAKCRCLPIo+Aiko
 1ffwCACd3VFpro7OROy5FLGRbgVRuEnWjFc8Gd+7MWbyyhww4noXWXKpIxYiheUZ/hw4ZR1NvBF
 +WZAYlNocT+w2WaB9V42xPU3cIdig5stuMKNureZdruReM/hO8z252KB4TQcwrdkV/y8m4GLfqw
 39bvyTAIx1sZgg7r7/Gi0n9H6yflJZ02HjIvTkmizdiNDD1TgM43CkSBroVfsNGdf8Fvi9sY6BT
 PvMnOfgh7GPMky1FLRwES9Ys7/eE/WNN4U5167PZe6GkEvvfdcK799CmeTUpmi8wGP986SWNBlj
 /zdYiu8D8qhDX3dt5neMOcMP2QMH/fx1T8YwZVyqGddwGX+F
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

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
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
index 91c580b1ee312595f3cca886c61ec570069eff03..c1c30da001ed881e1524370be9082d959bdd8bc7 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -62,7 +62,6 @@
 struct msm_dp_catalog_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
-	u32 (*audio_map)[DP_AUDIO_SDP_HEADER_MAX];
 	struct msm_dp_catalog msm_dp_catalog;
 };
 
@@ -304,40 +303,6 @@ struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
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
@@ -421,47 +386,6 @@ void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *msm_dp_catalog)
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
index 8dcc029d87315d5777c9c48c0df403be8dd447ce..5ac89a11a503e2abae9f4cc4740b18f2f3b6da5e 100644
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
 
@@ -147,17 +131,9 @@ u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C3E9F26A8
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 23:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FD710E4F5;
	Sun, 15 Dec 2024 22:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oah/kbwT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2644410E3F4
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 22:44:22 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso44198791fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 14:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734302660; x=1734907460; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ms0vQUJ6EkhnaSvVp07c+pomCnX4NmVo6+wU6kgfGeE=;
 b=oah/kbwTPnWxvPVMtR1rIxGto9DL6f3MiwydEGc4CmMii7nHzIXfEZylDAdkMNatfM
 I3Pre1QOx7BEQR7ZW6pxb13NzKss1ecSZQhvoPfceY6XIud2Pvgqz13vKO7NO6iJyYmh
 NT0WkmtfveVhcaPYG3G1zXONXApU5E+K9/gaudvcp6yyYfGhkuNQ0O02VH92sS29t7Qq
 d6yr5YCC1Dbhhz4/OkZt+6ZjAtDOxAbop1iW467jhB7iQ8pc/+o5BYsicbpOYxA+Ha6x
 IeROkJEsXO+B8Ka6bjB+fU81SaL25wDndB3daaZi8kUNchyiU1zXgzN12C6H302AR9ns
 AJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734302660; x=1734907460;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ms0vQUJ6EkhnaSvVp07c+pomCnX4NmVo6+wU6kgfGeE=;
 b=o0+Ne4JannFj2hD6DxsJB2du269+owF1J3C4F1wgtTMuytXQLYAOpRTpoNMV9EeXnY
 Lq3R4XU77j//9oogY5IJ6h9Zuc/59HjYIVPH7dIM1oLUwaNATqO4unyKIV/hCZmprBAH
 ly8ijpjxTuzKeAJ3KbXXLgchCTXsDkVxCeJ9bTIdrxbr+e8asMtatcItj8zAl93C0EKU
 bHQFpXPgGTkfsQwkTM+Fv176y2BhYklW+/85nRPB8wp4wy+9xN2vx6/rvkxGf/bF6m/6
 7HbjxFj+4tz56rE3y46YE1kDFi+zyAFwPCVP41VwbmscsiauzLC7nmGITLsa4Gh7l8aT
 9HRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOTwKpJMM4yF2AGLlh5FLoR7Q5RHxoEhqQklFyQoADi9NhStJZhbmZ6ycm7N3grV2NgJvebvdnnUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwguQceOpz7YIchc2sCpeTdU5+PG2gWw19Vxvs6HIejgF3ljTs+
 LRgsegzuSBFNs5xaseo0Abo0iriPqbPbhcDWq2LPkYIlRVB7Ag0H2GYKJWHE0c4=
X-Gm-Gg: ASbGncuvYZz+ePEBVfarx4oqqekBZf4o73wAV7/p5XdaLfVfbQooV5GwQrMuFJ8Kz9y
 cqd14YqSjTY+IWoaSCmdAYW+TOWVtdVuEWlDvNmDCmH9ok8eHhpkinmwNkSTUagvyMAabypKuqe
 buQK4yRzVyB+R+mK/GaMSZv06xcMls6zQjj9zSt5k/tNq0O26i3hm191kM/suD7mxEQapOL+vfD
 rN8d9dYQgXh90wE+ODBRXbqJXvaqSCoMSJAATIDY94GTFv3aoKciQ5Q0+fLpHGW
X-Google-Smtp-Source: AGHT+IErVxeOfsnqC0f12/DDQP0+ROqX6EOS92NCxnbm63wd+g46SU5zacAJdLuE6yi8ggsTO4pDCA==
X-Received: by 2002:a2e:b604:0:b0:302:251a:bd04 with SMTP id
 38308e7fff4ca-30254438172mr27073371fa.9.1734302660430; 
 Sun, 15 Dec 2024 14:44:20 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a41d1sm7201701fa.100.2024.12.15.14.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 14:44:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 00:44:08 +0200
Subject: [PATCH v4 03/16] drm/msm/dp: drop obsolete audio headers access
 through catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fd-dp-audio-fixup-v4-3-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5897;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oRj6sLQ2s837KqrM7tEaeiY47Qq/FirSdHZL3/w5Sa8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX1u5Fjh+q/tK0RD01ptJ1lx7vI1GszUZBswIO
 xeIPfuLObaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ19buQAKCRCLPIo+Aiko
 1VCbB/9WdclMEUMq6WROXGQThUs2BAxjKFB5H8XykvmO5xrLMLm5wZpBNKaaGuNsumiJtT4lXyl
 snxctoA2htWypmydsOUW9eXr26f4o72m7WJHk9MyS9MJ26mh6rhq+GY/0viYLvC/WThyOjcD/eV
 82pynFvnkBhuV/tIIF01ZHsLbgD8sBAjtsYYvm69RRh18HsS7bbPmGoc1s713PAiCq8uHLoLd4u
 52H31gGAqakTJ9Qy5Jrjof0J15WbDkCm1gO+aVs7UltsPfW7VE0q1CSA3IeF6LAiYym7otiW/ju
 l00atr9kj3ajmidCkqY7B2c8Ioiihf21FdgM/LWGjVVmIIFU
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
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  2 -
 drivers/gpu/drm/msm/dp/dp_catalog.c | 76 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 24 ------------
 3 files changed, 102 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 46fbf8601eea8e43a152049dfd1dc1d77943d922..9e402d71b9761f640f1a8733e10e09477ff675cb 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -375,8 +375,6 @@ struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
 
 	msm_dp_audio = &audio->msm_dp_audio;
 
-	msm_dp_catalog_audio_init(catalog);
-
 	return msm_dp_audio;
 error:
 	return ERR_PTR(rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 8fddfe5d85d6398c6582e1f74647f4cd83f5a4d9..7b7eadb2f83b169d8df27ee93589abe05b38f3ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -79,7 +79,6 @@ struct msm_dp_catalog_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
 	struct dss_io_data io;
-	u32 (*audio_map)[DP_AUDIO_SDP_HEADER_MAX];
 	struct msm_dp_catalog msm_dp_catalog;
 };
 
@@ -1193,40 +1192,6 @@ void msm_dp_catalog_write_audio_isrc(struct msm_dp_catalog *msm_dp_catalog,
 	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
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
-	return msm_dp_read_link(catalog, sdp_map[sdp][header]);
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
-	msm_dp_write_link(catalog, sdp_map[sdp][header], data);
-}
-
 void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *msm_dp_catalog, u32 select)
 {
 	struct msm_dp_catalog_private *catalog;
@@ -1310,47 +1275,6 @@ void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *msm_dp_catalog)
 	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
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
index 4a5591d9f82a21d7a3bb64ad6b486e39bd406cd5..6678b0ac9a67881244884d59487fa288d33d1be7 100644
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
 };
@@ -121,17 +105,9 @@ void msm_dp_catalog_write_audio_copy_mgmt(struct msm_dp_catalog *msm_dp_catalog,
 					  struct dp_sdp_header *sdp_hdr);
 void msm_dp_catalog_write_audio_isrc(struct msm_dp_catalog *msm_dp_catalog,
 				     struct dp_sdp_header *sdp_hdr);
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


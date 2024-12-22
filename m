Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8594B9FA7ED
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 21:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3064610E0A4;
	Sun, 22 Dec 2024 20:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sne1SfKt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7921E10E0A4
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 20:14:13 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb4so3995368e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 12:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734898452; x=1735503252; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GfWsP8zJ6Bd75v6qXHtg0PPjaDnw7fwLfE4CLjuKSrI=;
 b=Sne1SfKtsaYSCwordL7T3I4dZvgYudopv4g+ai9huxv/lSJeaAaBjRQOAB6tARwgoh
 oTflEeiHDu5pvjvf2tunQdJEEDBQJRe4N97SSLOpaXX1yP3BKwvbJ9tmpvl6vuMyMR6g
 G430wm7faI31eDONQYqQzeUZnW1DEX8aveShA6/3P+rcYTYmXXSCoBfSGln9bqbFD+wn
 wE4tPz0vj3EwhyeNxJ6WE3o6jO3xP4dWTOC5f+cIpDv5Lz0a+1iW+zrEMXNqLqzUeGQl
 SY7VxwOON9tzk7j4c1n2to7lYCh/wSeM+EYoykspRxR+DuyO3uelXGHRKmD1yuZPItyc
 jkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734898452; x=1735503252;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GfWsP8zJ6Bd75v6qXHtg0PPjaDnw7fwLfE4CLjuKSrI=;
 b=vZOWAM3u+Lnc6TC1QhAB6gfY6wGWtiClEte5ss2t5Zq53eINTJILH+e5D0D75GFP2j
 foj+BM4h4ci3/CkEljxN8cjxWL5puxSxh+OymLApvdXULJsm07M6SZvchuyx13HsgOLN
 8GLS1HrqU1WQmCX//TH8WclayhUZrRSapbwmE6hrafgG2OflSowCSamtoN04DvlKjrC1
 2YQarLzy54COQDTXp+keOUlFUyFq3CbKRlnni3ReibBYHXibcCblZgZjzNUmJqIeBVVz
 xxQd4CIP28/ej+PTwje1MeH/I+/EKz7DlzAQYaaqorv/fIFGMb628P81EcPmmvzHEncT
 obFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwkmg7jGx7wGse7XOpKp+eEE6oi9qxh8puqJibXHkGAZ+t7WsBEIJfh4CX3TZh34OgtdUe7VD1XQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxTCSP9z4XR/fvy8yTHYADm9J7xupyDD0FEqHOKaQ+VA3O9gWX
 iikNJOabbMHaZBHHTjxvOh5vWY41YPJrUhVIONq8+9eWh87eX8tcqubquYHfBoQ=
X-Gm-Gg: ASbGncs+OsBbHm7LQemmiiSIrIyL+JAdI5+z6zDIaFU/yYWjL6RJjNGm54LiwKjsN85
 vRlfUoHLcNFn81Bf2aHr6T4ghfj1hqW9vLVNTLqyYvq87LCVJv/OLiJviQZW0Z+sOGSfMUoouCs
 K4gSF8z9dUwECiIcyfG7yHGNaO+ORSLVkJe3o/d2rYmHeVhAyj0HHctRJ/jbBZUZQ1STH6Q2qsY
 SNUC5Oz49vVPUChRfJLCnc7pBXwiV14qUB/Vay4sovGVsB42T3Tgbmf15QYCtbM
X-Google-Smtp-Source: AGHT+IF2hs7U2IOGhzcx5YpO+C2EoTCBdCFGQtBxCnmoWVldzG+ujthX6kCy1bdhismRsdOvmBoXIA==
X-Received: by 2002:a05:6512:1309:b0:542:2934:71a7 with SMTP id
 2adb3069b0e04-54229532463mr3380150e87.15.1734898451761; 
 Sun, 22 Dec 2024 12:14:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 12:14:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 22:14:04 +0200
Subject: [PATCH v5 01/11] drm/msm/dp: split MMSS_DP_DSC_DTO register write
 to a separate function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-fd-dp-audio-fixup-v5-1-370f09492cf6@linaro.org>
References: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
In-Reply-To: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3146;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pwp2kwUxVvqIf59YFiuScbWDIyecIHnjWcyoreyeCFc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3pGMa++0LZ/1XryNU8XlohaeJpOvM3S5L286MlyAQZzM
 eUHs5Q7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjARpzz2/zGXWevjfXwYtV1v
 /PtxeepZydq+SV2PPRnclXoqvzWumxjZ9VfvBl9PUJSqxO/gxtC1wZGTPrEsdhEvE5tyzCnxgwl
 n8keNQ6tOhhl9dVy7I6IwymqR8dYnLe8m9NdlulcevWrxJfPo9zUiyrnXznYKdq15mx/2ao3JX6
 N7yj+2XxPNfHVoIuecZdeLD5kn956Zc6jztUqWYkEE5+HLcWpxR/x596zxb3bfscvKljP+8Zltx
 yL/cInP6UyP7uVxjrj6dQbjN2ZGgy8b4lNbvip1T/lwXUwgU21C4Yk791bVVUT2C+QzeYmkM5x8
 c2udCLOeh3qUzfyVUsvV7V7wtrgyF5jvuhy+f+OCKyqvAA==
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

It's the dp_panel's duty to clear the MMSS_DP_DSC_DTO register. Once DP
driver gets DSC support, it will handle that register in other places
too. Split a call to write 0x0 to that register to a separate function.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 9 ++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h | 2 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 2 ++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 7b7eadb2f83b169d8df27ee93589abe05b38f3ae..4f80eceb6ae19f542110d7379007f57c2ac16a8a 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -486,7 +486,6 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
 	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
 	msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
 	msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
-	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
 }
 
 int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog,
@@ -1039,6 +1038,14 @@ void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog)
 	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
+void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+
+	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
+}
+
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 6678b0ac9a67881244884d59487fa288d33d1be7..08bb42e91b779633875dbeb4130bc55a6571cfb1 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -92,6 +92,8 @@ void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 				struct drm_display_mode *drm_mode);
 void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
 
+void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog);
+
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 9c463ae2f8fae916661fef1c7e225f55c1026478..b9c461fee96f8fae9259ce03a32e1155b42d17bb 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2011,6 +2011,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		pixel_rate_orig,
 		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
 
+	msm_dp_catalog_panel_clear_dsc_dto(ctrl->catalog);
+
 	msm_dp_ctrl_setup_tr_unit(ctrl);
 
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);

-- 
2.39.5


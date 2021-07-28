Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC373D937A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 18:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D496E9C5;
	Wed, 28 Jul 2021 16:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B8D6E97B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 16:46:32 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso4991713pjo.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 09:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3eEA42JlXQNC4PWoCIFgR+HXz7Rjp4J77j6npFrZR+4=;
 b=Ngg9a/kX+yBwppZxMsfTAwkNrCWuUc1GwnYAZSm8WCvy4KbDgu+V3Kwzhe+aFh4Zgs
 gszehOKA7U54UmQ1aCuJTSlnqKJCBvP5mQi/RYCDt0O3MmrHSaUKXcyAdZaDDTLOywaG
 mKXqA0ZOrTkck0FEWb4p/UgYx6bTwzmj7lnp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3eEA42JlXQNC4PWoCIFgR+HXz7Rjp4J77j6npFrZR+4=;
 b=r8NxlRu3n4NoAzh3KGZYIXTOraP/gsJ8nWgIIeT3UHiDi/A/Md6tM7rAlmCGgEhyzL
 3so8+5c3fyD/LT9QjLZueE7s69jtm9+L/F9moYrVmlv/DwPQ21CdXfapb2lRn5b8Ihby
 1BXpyiH6TXhSo+YG3MffA9jJ3CodTmRrCJGIUTFtWqmiDttZlBWK0e6/cP/6dCpn3O5U
 wC61XJ0d1rBV5skywA/hmg1w6DtN8qkBYTecZOYayHYEtg9TbjLLlJBW1Ke3kLYhDM6S
 3VV1SqQzubANCwR96dLTCzeCc08dqh1efW2SDnUTzmvl6VDhxhy4p8vsirHCsNL7nOU7
 7F/A==
X-Gm-Message-State: AOAM532BM/m84hROzzJH0UPL7JfuA2xgFHuA7oB/aSpcFUMmVBR9GHp1
 JDv14H4fPVI2e+vSI0f72RUcB/41WXeFyZ1L
X-Google-Smtp-Source: ABdhPJyxS+v19XYGtTUmlI/PnvqcN5S6DoY5auTi0nO8UXRAUp+H+Ub7crNHZFqYSSrGKv1eT4Hi2Q==
X-Received: by 2002:a65:41c7:: with SMTP id b7mr670981pgq.81.1627490792046;
 Wed, 28 Jul 2021 09:46:32 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:9f1e:e713:1a5e:89dc])
 by smtp.gmail.com with ESMTPSA id l12sm474075pff.182.2021.07.28.09.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 09:46:31 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] Revert "drm/panel-simple: Add Samsung ATNA33XC20"
Date: Wed, 28 Jul 2021 09:45:55 -0700
Message-Id: <20210728094511.4.Id9f076ec5f35633f8ce931051af268a04c45c075@changeid>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210728164557.1882787-1-dianders@chromium.org>
References: <20210728164557.1882787-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, steev@kali.org,
 bjorn.andersson@linaro.org, a.hajda@samsung.com, thierry.reding@gmail.com,
 Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, jernej.skrabec@gmail.com,
 devicetree@vger.kernel.org, tzimmermann@suse.de, jonas@kwiboo.se,
 linux-arm-msm@vger.kernel.org, rodrigo.vivi@intel.com, rajeevny@codeaurora.org,
 Douglas Anderson <dianders@chromium.org>, robert.foss@linaro.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 4bfe6c8f7c23b01719671b69fd29b87a35ccd9d6.

This panel's power sequencing really can't be handled properly by
panel-simple because of the special sequencing needed for the EL_ON3
GPIO. The only way it was sorta working in the past was by trying to
jam that signal into the "enable-gpio", but that really wasn't a good
fit. We'll add a custom panel driver for this panel to do it right.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 33 ----------------------------
 1 file changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9b286bd4444f..c8694f7f8e0f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3621,36 +3621,6 @@ static const struct panel_desc rocktech_rk101ii01d_ct = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-static const struct drm_display_mode samsung_atna33xc20_mode = {
-	.clock = 138770,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 48,
-	.hsync_end = 1920 + 48 + 32,
-	.htotal = 1920 + 48 + 32 + 80,
-	.vdisplay = 1080,
-	.vsync_start = 1080 + 8,
-	.vsync_end = 1080 + 8 + 8,
-	.vtotal = 1080 + 8 + 8 + 16,
-	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
-};
-
-static const struct panel_desc samsung_atna33xc20 = {
-	.modes = &samsung_atna33xc20_mode,
-	.num_modes = 1,
-	.bpc = 10,
-	.size = {
-		.width = 294,
-		.height = 165,
-	},
-	.delay = {
-		.disable_to_power_off = 200,
-		.power_to_enable = 400,
-		.hpd_absent_delay = 200,
-		.unprepare = 500,
-	},
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
 static const struct drm_display_mode samsung_lsn122dl01_c01_mode = {
 	.clock = 271560,
 	.hdisplay = 2560,
@@ -4657,9 +4627,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "rocktech,rk101ii01d-ct",
 		.data = &rocktech_rk101ii01d_ct,
-	}, {
-		.compatible = "samsung,atna33xc20",
-		.data = &samsung_atna33xc20,
 	}, {
 		.compatible = "samsung,lsn122dl01-c01",
 		.data = &samsung_lsn122dl01_c01,
-- 
2.32.0.432.gabb21c7263-goog


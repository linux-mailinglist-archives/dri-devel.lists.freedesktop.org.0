Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A76A42A8177
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591D66ED9C;
	Thu,  5 Nov 2020 14:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2186ED9D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 33so2089834wrl.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=msUJv3g77jRfXUZFInWbo08oOqamqaMF7n9SOzCcjkY=;
 b=r7IG/ZJuEPCMH4rRLkfuGlHBB4SlDlKJBOj/G97StXC4XJk2dMx6attzaVaNp5vWCQ
 LlVdWwEyqS22BVqDUXVugsP5iYpT/Lm/IvVDSZ2s/WC+RtTgnoEgW7RJE5Sw38gcm7b1
 B/B8xAIuwPcq6sm8QPMvbH1l5jBPls4ndV/ntH7W1GVpUxzoEkl3JS9gbUSEWuVbRAia
 Ai6PwdULfSyuWv5lcXDpVwRbj7Y8MJwknqHx0g29KlYuZ80PFKciu3XjdnWh2TIG7ght
 w0H8Hz3ptmwLg95uJLIp9jEDf7/+ciI3fBsYFv2WHqn+5UiNFGfBSCFr9PowwJshpQhl
 79ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=msUJv3g77jRfXUZFInWbo08oOqamqaMF7n9SOzCcjkY=;
 b=cA+qdo5kUT8lYkku0NK6/CjX99HHb3LKH2tjz24gyQsapbpg1gIuf5R1ePhhs0aKjA
 y0WzrU2TjuCAivDKNhUhQpuE2dti5lFCqO88aJeIBk37S5uEyYPVRYmpkHJLWAYPdC4l
 VzP1pCfdQ6Y612B4glvlplKxfQMpTDpL1KlGlbQRMSON37I6WmM35I1/QMGHkMMQbCFM
 RbEqHtWQ9i/N8G5L942BWoHWeQw1k6XjSPGP+IPKoc8BoSxyhZAkGcnwPBm4ztkwPPsa
 lQ4r2rkgGGPxqDe1uWahAqd4N7zATQ0xCqR8vmxJ0W+RVPxILA5W4wO48iFFqLKIXKW1
 kraA==
X-Gm-Message-State: AOAM531qvS2qo9khcqCfonw1ceb8/s/Fn04R0sANtrgHFL3P+M3N3Lwp
 K+2CT3gtpDjsYMcHa8WnwIhexA==
X-Google-Smtp-Source: ABdhPJwOCFph5hs/qG6yS2bZ9ZwIw/eSKDawsUf80Zrt7pTiS+RF1hawBHfFt7P9n2O5VPET+RJlAw==
X-Received: by 2002:adf:e682:: with SMTP id r2mr3425322wrm.184.1604587948243; 
 Thu, 05 Nov 2020 06:52:28 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:27 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/19] gpu: drm: panel: panel-simple: Fix 'struct panel_desc's
 header
Date: Thu,  5 Nov 2020 14:45:09 +0000
Message-Id: <20201105144517.1826692-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Struct headers should start with 'struct <name>'

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/panel/panel-simple.c:42: warning: Cannot understand  * @modes: Pointer to array of fixed modes appropriate for this panel.  If

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 8b82ec33f08ae..1327df0bddbd6 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -39,6 +39,7 @@
 #include <drm/drm_panel.h>
 
 /**
+ * struct panel_desc
  * @modes: Pointer to array of fixed modes appropriate for this panel.  If
  *         only one mode then this can just be the address of this the mode.
  *         NOTE: cannot be used with "timings" and also if this is specified
@@ -53,6 +54,7 @@
  * @delay: Structure containing various delay values for this panel.
  * @bus_format: See MEDIA_BUS_FMT_... defines.
  * @bus_flags: See DRM_BUS_FLAG_... defines.
+ * @connector_type: LVDS, eDP, DSI, DPI, etc.
  */
 struct panel_desc {
 	const struct drm_display_mode *modes;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

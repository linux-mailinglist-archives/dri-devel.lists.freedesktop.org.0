Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08092F83AA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8746E4DD;
	Fri, 15 Jan 2021 18:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887BB6E4D4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:36 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id 6so2912337wri.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y5b57SoAxHtBE8fuD7PasHO1SZ3n/WAQuB51kpZs09g=;
 b=rriSdpC5fDLxemjS3Am2r2KffU43TkGCeJu9m8OdsMcm8y/ebVSkzBUDFHfnkwR4uB
 aSwnLRROSDfnEeTaY2WBCoa7R1qbBcx5INFxovhPXjtBX5DnbVU1v+mupaoFEIt0m+sy
 DJZ3y71XrUAQoaZSNILkrHfh/zcD1yUmuyRku1oNv8+BpPJgMtik8tWYS1sf28+mQxoL
 K0gzlkodsZGeISrc+POlP3bp9lhge6TCYbk7XyCAKCqpxd1uhkUSuvrpduXACfSPE5Xs
 7Wp7mczt8u7BWMZYdq05c11wjz4a7cF4k2vFYRa5/EPSZ6cnb2CwCXkcenb8rtowZ5nZ
 NC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y5b57SoAxHtBE8fuD7PasHO1SZ3n/WAQuB51kpZs09g=;
 b=KIZcnpv2p0jUq0omBhYkTxI/MmiAvGlHWkAU1AD0MW5wAW7IcnYpUc8r2Y5B/gBYHk
 godnC1Wk/4QvKGNMwKyYIytowbh+7nfaBWcs8D1Naq4B19iJNlZCYpSjO0zgpsGfdrdB
 C/bzBp4bPOehkC0lXx1KqneNKLGXFi2CpVcP9FHJSzFhQgI4Z8oLPy6Uwq7GCIuvYlXL
 UPyXqebBgd7g7T9MWTVpHcfANOsfEEJl+YtZ7Rd+swsVOMdzGlvkQmkDNBx/1h6OzloW
 AqOHaZmlGA23g/pWv9FDXTVAO6wE/T7ktWSeBEcNeAIaru1RTJ7YBs3reSG+aSX1nvHH
 LhMA==
X-Gm-Message-State: AOAM5336r20RRX8jLDOHWOX6gdraR1l/BPmGjrhLL+fwmRf96cUdphy1
 PU+YvN9LPMdJxErkMRf70j42nQ==
X-Google-Smtp-Source: ABdhPJyvzvw/m3xAKhEScihwt0ijVEjC0hHVLK7eHUfHVxiZ87NT0kkWWVNCXymnBq6TGY1atX1JMw==
X-Received: by 2002:adf:92a4:: with SMTP id 33mr14243233wrn.347.1610734595212; 
 Fri, 15 Jan 2021 10:16:35 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:34 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 21/29] drm/gma500/mdfld_dsi_output: Demote a couple of
 kernel-doc formatting abuses
Date: Fri, 15 Jan 2021 18:15:53 +0000
Message-Id: <20210115181601.3432599-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
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
Cc: Jackie Li <yaodong.li@intel.com>, jim liu <jim.liu@intel.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/mdfld_dsi_output.c:71: warning: Function parameter or member 'dev' not described in 'mdfld_dsi_gen_fifo_ready'
 drivers/gpu/drm/gma500/mdfld_dsi_output.c:71: warning: Function parameter or member 'gen_fifo_stat_reg' not described in 'mdfld_dsi_gen_fifo_ready'
 drivers/gpu/drm/gma500/mdfld_dsi_output.c:71: warning: Function parameter or member 'fifo_stat' not described in 'mdfld_dsi_gen_fifo_ready'
 drivers/gpu/drm/gma500/mdfld_dsi_output.c:95: warning: Function parameter or member 'dsi_config' not described in 'mdfld_dsi_brightness_init'
 drivers/gpu/drm/gma500/mdfld_dsi_output.c:95: warning: Function parameter or member 'pipe' not described in 'mdfld_dsi_brightness_init'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: jim liu <jim.liu@intel.com>
Cc: Jackie Li <yaodong.li@intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/mdfld_dsi_output.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/mdfld_dsi_output.c b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
index 4aab76613bd9e..24105f45c1c4b 100644
--- a/drivers/gpu/drm/gma500/mdfld_dsi_output.c
+++ b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
@@ -63,7 +63,7 @@ static int __init parse_LABC_control(char *arg)
 early_param("LABC", parse_LABC_control);
 #endif
 
-/**
+/*
  * Check and see if the generic control or data buffer is empty and ready.
  */
 void mdfld_dsi_gen_fifo_ready(struct drm_device *dev, u32 gen_fifo_stat_reg,
@@ -85,7 +85,7 @@ void mdfld_dsi_gen_fifo_ready(struct drm_device *dev, u32 gen_fifo_stat_reg,
 					gen_fifo_stat_reg);
 }
 
-/**
+/*
  * Manage the DSI MIPI keyboard and display brightness.
  * FIXME: this is exported to OSPM code. should work out an specific
  * display interface to OSPM.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

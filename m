Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391984C3595
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE8F10E8A1;
	Thu, 24 Feb 2022 19:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F40310E8A1;
 Thu, 24 Feb 2022 19:16:31 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id 12so4311867oix.12;
 Thu, 24 Feb 2022 11:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89DjEEGsLwYVVyD3+lmgDuUkvgmk0sfi5HizC/FoSH4=;
 b=nLE4O+3a20KBgtMfBCmxPYKi2/yST1qDItJARMiJsPchNEAXZvAamWBMyYOiminHO0
 f+ViAwcqCo4QglNR7wsM980DfeBcDWIeXP0DYzmx/DqMcfWrtZ0qz7I2c6TyfMpnqz5e
 IIrErJME1K4nHTD3xFi2OsblyMCLWHZZg2NowBgylgzBMhK5gmry6+qQriY1+WUDSWE6
 /aEFiwDOdPhuNf0jeGDVq+lwdlyUtTcGnYpJm+09UMFwfVMDtVx6vKhlmy/4PH4m/aKb
 UWZ9VWjZbyyiYhWMeuu7xRiXXM1TtorNBbw1NozVfPlBs2nnV16Te7V6YlMrspA53Cnx
 9uIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=89DjEEGsLwYVVyD3+lmgDuUkvgmk0sfi5HizC/FoSH4=;
 b=g6DX3qi3ucy9MIJC+Hd5LuzLKd99DYiMr+3hAnuxpBvPoZdxobQNahkazOWtxacpvH
 g9iHawsexh4MZdTX5rOKVbf1ABQWeED1bI6hs5Y1Ujq1jRrspHCWU2RgWWH/ce+eWaNu
 N13FMse2zHukq3w7JM/Y8OgcJPLItNZerJ7+0PG9ubOXcihuZAxSRZASjEVNNB1fKhHq
 2VvrdvEncSujYXaAKjAtiaOS9ZGowNiteeWWklgmIPwMFWjscWw9tZVsSI4ibmyDGQn+
 YShZyV1AydfpGzh7wuwuuPuJRTJZ0lZTJ+nipw7mfkXK45dV0W6EQHHEEVMMparD5xXz
 qt/g==
X-Gm-Message-State: AOAM533HTBbW7ewqHnVab/f4kBt9GYpBjDPe5EwPsUto9yCVA6QxqeuJ
 hXVUBlQFQzQBuVVUpUJe8Eo=
X-Google-Smtp-Source: ABdhPJxkqDmRQVez9RKGPAup0tMKEJD6hMNayVig2vxoittVpi0Y4s2/5JCsUDFjoJX87Eht8C51Wg==
X-Received: by 2002:a05:6871:b10:b0:d3:a3f7:89f9 with SMTP id
 fq16-20020a0568710b1000b000d3a3f789f9mr6920606oab.163.1645730190688; 
 Thu, 24 Feb 2022 11:16:30 -0800 (PST)
Received: from localhost.localdomain (189-47-54-110.dsl.telesp.net.br.
 [189.47.54.110]) by smtp.gmail.com with ESMTPSA id
 w3-20020a056830110300b005af14392276sm79509otq.62.2022.02.24.11.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 11:16:30 -0800 (PST)
From: Magali Lemes <magalilemes00@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/4] drm/amd/display: Add conditional around function
Date: Thu, 24 Feb 2022 16:15:49 -0300
Message-Id: <20220224191551.69103-3-magalilemes00@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224191551.69103-1-magalilemes00@gmail.com>
References: <20220224191551.69103-1-magalilemes00@gmail.com>
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
Cc: kernel test robot <lkp@intel.com>, siqueirajordao@riseup.net,
 Magali Lemes <magalilemes00@gmail.com>, maira.canal@usp.br,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, isabbasso@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When CONFIG_DRM_AMD_DC_DCN is not set, the function
'dm_helpers_enable_periodic_detection' doesn't have its prototype defined,
causing the following warning:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:805:6:
warning: no previous prototype for function 'dm_helpers_enable_periodic_detection' [-Wmissing-prototypes]
   void dm_helpers_enable_periodic_detection(struct dc_context *ctx, bool enable)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:805:1:
note: declare 'static' if the function is not intended to be used outside
of this translation unit
   void dm_helpers_enable_periodic_detection(struct dc_context *ctx, bool enable)
   ^
   static
   1 warning generated.

This commit silences this warning by adding a conditional directive
around the mentioned function, and also corrects a small spelling error.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 010498ff5911..f5f39984702f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -977,7 +977,9 @@ void dm_set_phyd32clk(struct dc_context *ctx, int freq_khz)
        // TODO
 }
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 void dm_helpers_enable_periodic_detection(struct dc_context *ctx, bool enable)
 {
-	/* TODO: add peridic detection implementation */
+	/* TODO: add periodic detection implementation */
 }
+#endif
-- 
2.25.1


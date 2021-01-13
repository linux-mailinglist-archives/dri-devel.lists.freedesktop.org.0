Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E482E2F4DA2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF776EA6E;
	Wed, 13 Jan 2021 14:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505516EA66
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:49 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d26so2386549wrb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DvtlGdT5MHeh268WloE5stTLPTvRDEZ8rCCQAdX9t84=;
 b=k1fbqp18yv8PIWF/VtBZ1OCxmUUxm3DEuDCdGpp/1lf2Qusjjl6Jr0LbNjCDkAYjum
 1/wwNHwC2fYs6yOsRNYBp7G/0/6EKBrI0OVlE9krnhPcy8pLZI8vfx7yCAVMlSMwGOA+
 hnp7cTdcUMYNnIJqWcxy66Lo1P3xlU9yPVOVU+OePlvMmIh7A0BSVnlshSywJYQQwzbU
 5uukjwiQHWY6GeoO+bNuzYazh3MQdjtKvFY6BEa2ztaEJRUBzfF1uDCo9++RfRW+OfdJ
 ZYE/I/DDBlwjWjQBrwAXZdAbnCrtVk//3HRL1I6mCpS4vkKtNu8uXUKBPssO/APhiy0t
 CkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DvtlGdT5MHeh268WloE5stTLPTvRDEZ8rCCQAdX9t84=;
 b=hRIko46Y7ASkijs1r1XYF2Cebs9oJIhkwjK0w2oykWagyFCC8MSydU5J7VJ3Zvm4kf
 fD8yiPi2iJeesF9gbIfL3CfJT6/V0GDy/3eExOETn63bdA0t8QK0tt6SfT64I+SwvUU7
 NIxhVpTcHE/rUjEndUhShBWZMjH8GT6znLqvDavxbfUgSkL2qgx6UCl9pfeP0OpkrbGt
 cJrSgt4h/Oua0EtJDxPQD/eNKMFDKQ32SmvIzIQZvNr9Mdbru0xSGRZKJFNnIhHvdAUw
 JdgSvh8rbMv+2tpwDwUAoNB2slrApAlhwwAOsuQfKKBgvrtgP5DvGVCZjoLYL03im9E/
 uqig==
X-Gm-Message-State: AOAM530Z48EFRcRyfhKqNrgDEC8IQiblhZWhN9paqe5Mq5lv5QWYiCSH
 LyfkTJS33wki+nJzNio6WBFHsQ==
X-Google-Smtp-Source: ABdhPJzm7B7r7YLa6vfZWKXo9/XfNaBJsRwMRh4mKywkyucObHWaPSbUoL8ihPPgUVWu5+GcPhFQvw==
X-Received: by 2002:adf:eec6:: with SMTP id a6mr2949891wrp.239.1610549448015; 
 Wed, 13 Jan 2021 06:50:48 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:47 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 24/31] video: fbdev: s3c-fb: Fix some kernel-doc misdemeanours
Date: Wed, 13 Jan 2021 14:50:02 +0000
Message-Id: <20210113145009.1272040-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: Ben Dooks <ben@simtec.co.uk>, Jingoo Han <jingoohan1@gmail.com>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/video/fbdev/s3c-fb.c:104: warning: Function parameter or member 'osd_stride' not described in 's3c_fb_variant'
 drivers/video/fbdev/s3c-fb.c:174: warning: Function parameter or member 'variant' not described in 's3c_fb_win'
 drivers/video/fbdev/s3c-fb.c:345: warning: Function parameter or member 'pixclk' not described in 's3c_fb_calc_pixclk'
 drivers/video/fbdev/s3c-fb.c:345: warning: Excess function parameter 'pixclock' description in 's3c_fb_calc_pixclk'
 drivers/video/fbdev/s3c-fb.c:742: warning: Function parameter or member 'transp' not described in 's3c_fb_setcolreg'
 drivers/video/fbdev/s3c-fb.c:742: warning: Excess function parameter 'trans' description in 's3c_fb_setcolreg'
 drivers/video/fbdev/s3c-fb.c:1142: warning: Function parameter or member 'sfb' not described in 's3c_fb_release_win'
 drivers/video/fbdev/s3c-fb.c:1172: warning: Function parameter or member 'win_no' not described in 's3c_fb_probe_win'

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Ben Dooks <ben@simtec.co.uk>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/s3c-fb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
index ba316bd56efd7..d33d7df77a6a5 100644
--- a/drivers/video/fbdev/s3c-fb.c
+++ b/drivers/video/fbdev/s3c-fb.c
@@ -75,6 +75,7 @@ struct s3c_fb;
  * @buf_size: Offset of buffer size registers.
  * @buf_end: Offset of buffer end registers.
  * @osd: The base for the OSD registers.
+ * @osd_stride: The OSD stride value.
  * @palette: Address of palette memory, or 0 if none.
  * @has_prtcon: Set if has PRTCON register.
  * @has_shadowcon: Set if has SHADOWCON register.
@@ -155,7 +156,7 @@ struct s3c_fb_palette {
  * @windata: The platform data supplied for the window configuration.
  * @parent: The hardware that this window is part of.
  * @fbinfo: Pointer pack to the framebuffer info for this window.
- * @varint: The variant information for this window.
+ * @variant: The variant information for this window.
  * @palette_buffer: Buffer/cache to hold palette entries.
  * @pseudo_palette: For use in TRUECOLOUR modes for entries 0..15/
  * @index: The window number of this window.
@@ -336,7 +337,7 @@ static int s3c_fb_check_var(struct fb_var_screeninfo *var,
 /**
  * s3c_fb_calc_pixclk() - calculate the divider to create the pixel clock.
  * @sfb: The hardware state.
- * @pixclock: The pixel clock wanted, in picoseconds.
+ * @pixclk: The pixel clock wanted, in picoseconds.
  *
  * Given the specified pixel clock, work out the necessary divider to get
  * close to the output frequency.
@@ -733,7 +734,7 @@ static inline unsigned int chan_to_field(unsigned int chan,
  * @red: The red field for the palette data.
  * @green: The green field for the palette data.
  * @blue: The blue field for the palette data.
- * @trans: The transparency (alpha) field for the palette data.
+ * @transp: The transparency (alpha) field for the palette data.
  * @info: The framebuffer being changed.
  */
 static int s3c_fb_setcolreg(unsigned regno,
@@ -1133,6 +1134,7 @@ static void s3c_fb_free_memory(struct s3c_fb *sfb, struct s3c_fb_win *win)
 
 /**
  * s3c_fb_release_win() - release resources for a framebuffer window.
+ * @sfb: The base resources for the hardware.
  * @win: The window to cleanup the resources for.
  *
  * Release the resources that where claimed for the hardware window,
@@ -1160,6 +1162,7 @@ static void s3c_fb_release_win(struct s3c_fb *sfb, struct s3c_fb_win *win)
 /**
  * s3c_fb_probe_win() - register an hardware window
  * @sfb: The base resources for the hardware
+ * @win_no: The ID of the window to be registered
  * @variant: The variant information for this window.
  * @res: Pointer to where to place the resultant window.
  *
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49001577BAF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A56A9DD6;
	Mon, 18 Jul 2022 06:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1829DA9D95;
 Mon, 18 Jul 2022 06:39:22 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id o2so4131434ill.6;
 Sun, 17 Jul 2022 23:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vaEDPEvXL4gSKTwnQoP5IRm/Ux2q5cs9y+rjMuT2rqM=;
 b=qMxASVlV5EL3DSN4X5/kL7cEnYwqbADj3CB3z4Fg9I85YvNgk34E2/E5wcvqxqNZGJ
 lR7OMxJn5PqJmog8D9kGvWBfe63dld5tMiiSjzFVaOFTa7bYBrGxl3/XniSxML1t5CzT
 5Exvh09DTmTnqG42b3XWTNTvYERish7mkT4ZNUIb5V43pg8kFGoTl+KVf6gdxhWw5gab
 K/xKpzjAaJ6xW8KHl3qEVPgfbrPJ2QbUa+l5TG4XEi3v00icYP/vTH779SctLUgf5J41
 Eka1kRejuJU8cduZeMy3R1002VD0Rcfvb6vtwgiFQU3+iwBRGIVMnH1fpf5zp4W0S46I
 Bg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vaEDPEvXL4gSKTwnQoP5IRm/Ux2q5cs9y+rjMuT2rqM=;
 b=zIEnAvVbDh8J0JsFhUk0tLKJARUAz31Q1DDlXwe7AFaRgPFDtLe+TKauq0G1wat+qM
 XlCqvHUyiPM5OgI1GFV9LJGfQiQloZNrANiUY8jJohBai/SFEvZih43q3eTK9h7oNoJG
 NaY2anm7UBmnLMe0Ab2wivX6ueAz18rex/WxTHAe/1cedSFuM0S6ya2w19/wksURnb/w
 wEyuPEGVgL19VrLT5Dtx5+NY1ANCkOv/gEgJpgnNhlig4jAiI0kzDljheANqGfPVR4x7
 MfPWGw+HxODnOkkJ0QCufJPvsxNdosDBhQMLRSs1fre5AZStZQMpjm+vz6cHW/3rDoby
 aeIw==
X-Gm-Message-State: AJIora+7rMwOShv1cXom0Cb+c2mjQsqM/WnL+BtJtVSNh4ERNv4nn9zW
 tuA8Azr/p3X4gZ5mTGAvskHOdE7cS9Q=
X-Google-Smtp-Source: AGRyM1vcs+T31eEMCQrZChPj8oRUl45l02/rwkdoUrIzXEzbiS+uYCGi2q1Oyqi9DlCUt+d+B5+qpw==
X-Received: by 2002:a05:6e02:1d0a:b0:2dc:553f:13ab with SMTP id
 i10-20020a056e021d0a00b002dc553f13abmr13047274ila.49.1658126361438; 
 Sun, 17 Jul 2022 23:39:21 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:20 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 36/39] nv-subdev-debug
Date: Mon, 18 Jul 2022 00:36:33 -0600
Message-Id: <20220718063641.9179-50-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clone the nvkm_printk,_,__ macro ladder into nvkm_drmdbg,_,__.
And alter debug, trace, spam macros to use the renamed ladder.

This *sets-up* (not done yet) to remove the _subdev->debug >= (l)
condition, once the bitmap-param is wired up correctly, and figured
into dyndbg's jump-label enablement.

starting with:

    static struct ddebug_classes_bitmap_param drm_trace_bitmap = {
	.bits = &__drm_trace,
	.flags = "T",
	.map = &drm_trace_classes,
    };
    module_param_cb(tracecats, &param_ops_dyndbg_classes, &drm_trace_bitmap, 0600);

The missing part might be re-setting the .bits field to ref
_subdev->debug, while respecting the _subdev's lifecycle.

no functional changes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
index 065d07ccea87..b9c2afab321f 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
@@ -59,9 +59,17 @@ void nvkm_subdev_intr(struct nvkm_subdev *);
 #define nvkm_error(s,f,a...) nvkm_printk((s), ERROR,    err, f, ##a)
 #define nvkm_warn(s,f,a...)  nvkm_printk((s),  WARN, notice, f, ##a)
 #define nvkm_info(s,f,a...)  nvkm_printk((s),  INFO,   info, f, ##a)
-#define nvkm_debug(s,f,a...) nvkm_printk((s), DEBUG,    dbg, f, ##a)
-#define nvkm_trace(s,f,a...) nvkm_printk((s), TRACE,    dbg, f, ##a)
-#define nvkm_spam(s,f,a...)  nvkm_printk((s),  SPAM,    dbg, f, ##a)
+
+#define nvkm_drmdbg__(s,l,p,f,a...) do {				\
+	const struct nvkm_subdev *_subdev = (s);			\
+	if (CONFIG_NOUVEAU_DEBUG >= (l) && _subdev->debug >= (l))	\
+		dev_dbg(_subdev->device->dev, "%s: "f, _subdev->name, ##a); \
+} while(0)
+#define nvkm_drmdbg_(s,l,f,a...) nvkm_drmdbg__((s), NV_DBG_##l, dbg, f, ##a)
+#define nvkm_debug(s,f,a...) nvkm_drmdbg_((s), DEBUG, f, ##a)
+#define nvkm_trace(s,f,a...) nvkm_drmdbg_((s), TRACE, f, ##a)
+#define nvkm_spam(s,f,a...)  nvkm_drmdbg_((s),  SPAM, f, ##a)
 
 #define nvkm_error_ratelimited(s,f,a...) nvkm_printk((s), ERROR, err_ratelimited, f, ##a)
+
 #endif
-- 
2.36.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1137DB8C5E0
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 12:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E691A10E2B7;
	Sat, 20 Sep 2025 10:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZbfnISIk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407B710E0BA
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Sep 2025 09:46:20 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso2986861f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Sep 2025 02:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758361579; x=1758966379; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rq2teog4gIQygb1gH3aobDn756RO8w24JG5dF9G4uFY=;
 b=ZbfnISIk5/x/ZLOJchcYvj1rAU/SHklXLj0ECO33d+4XeSdkUFy7Mi7z1zhDPBHtQ4
 R5tELGVKbIONv1MWDroQlfc/5wRbRtUxwAZ3O4k5B1G0Gq8icnOzQDDpCaDiFjmhHzA7
 Nwdnm8lcYBdbnWY7fLt8z5QZQo8ucAqwvTOQPXOUScyH1p6Gpsvn4lDu2twlyO08vsCQ
 L09BMcmLcq3WiEw+5F4WwUQWFax2HSgwa39d1p5KRM+WqRB8dSwrR93xE0W7YdzWuXgP
 Z3asmA7/r/FdWs7pP0l+r3JR3AO0icmwXiZdVVv89eZ6TTyZVG6VgIixMNXSzlLyasnk
 k8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758361579; x=1758966379;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rq2teog4gIQygb1gH3aobDn756RO8w24JG5dF9G4uFY=;
 b=AzGjYFNn2ICJRPpiHmK+g6tBD/6AQvXlq5icjVAZ8DiuMvyqTvJAdAMLcRitHofA1F
 Ko9a5Jvl7/vJu7JSuFeYZ/mZs5MR8Su+9uw/9j7TsvyKT07uOelCfHsCnGUFvzytB5jQ
 kKhLkTSoH2VLMu51jWnj/e6AG27rI3a2dKUlXDuiiJdFET4o+jgG6Q05kXhBVJu3+alV
 yyPLTQUP3o5T3MFOufUEIfAhAiKV3nL9pHHxmtietgSCFs+caTep4Nkvgil/nb9BjAkQ
 QAOObXBFpEvGGfMtGE0qFGlQwnlhjqqdqUAJO1T4/BEe/e16bQKIAdVBR5GsXFPG0YG5
 pNvg==
X-Gm-Message-State: AOJu0Yxgmg4UmMtW52gX9oYCcX57Cjv/53eSgnVWrlbKlbO+SLi7ixb2
 hPV0UodJkFt4ZEMJLG37QCnE8ibMSINn+a2X9DS9+A07zOEuIN0Vi0i+
X-Gm-Gg: ASbGncvcgZCVe6aW2NypMYaFXc+KPHxNt4wIa8cLQMi7ZSIckkiV2UMmW+ExIlpynaU
 qBsMIXXh780haQnYAkdBE/2zP3HmIlgxRNwDUHKflR0WJH2llkSBbit3LAIsP7YE/Nsn3tWvpOB
 tXe3b0Tfjx1fDwOxFB2kzQrooQAbFQAM5kik2zb2B2Y5IRkA6VYG+kQB9frrO4XiQDNLv0pyVlV
 5P6BjPDsFkVKGLttwEFV5i+n+U2YYdDIhC/Cd71dq3HmeQ+unweQ7a68hWwr1cHTVO7Ua98cUux
 q8NYzDKx/Z6645JZ7UkCbEB/KWa6adUFEtBCdR1KADaU3/B476nzrReyYwETB+cOGtv2N86/lF1
 KBH+DWNbJg7qylhM5Coa6nrkAEPAlvsOlJ+Xy8TmfmwSalmEmwQuXy/9fpns/6FAP
X-Google-Smtp-Source: AGHT+IFl+MC1nDaVLJuiZMNJ7+rEO5Az3pzwP23zFiHFFh+Nl5JFajqsTQQ43BuBBoBZUolOBfA1hg==
X-Received: by 2002:a05:6000:1862:b0:3ea:bccc:2a2c with SMTP id
 ffacd0b85a97d-3ee7c552978mr4924011f8f.11.1758361578687; 
 Sat, 20 Sep 2025 02:46:18 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.139.156])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613eb27f25sm163883615e9.23.2025.09.20.02.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 02:46:18 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Sat, 20 Sep 2025 11:45:45 +0200
Subject: [PATCH v2 5/5] drm/solomon: Enforce one assignment per line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-improve-ssd130x-v2-5-77721e87ae08@gmail.com>
References: <20250920-improve-ssd130x-v2-0-77721e87ae08@gmail.com>
In-Reply-To: <20250920-improve-ssd130x-v2-0-77721e87ae08@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Sat, 20 Sep 2025 10:49:23 +0000
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

The code contains several instances of chained assignments. The Linux
kernel coding style generally favors clarity and simplicity over terse
syntax. Refactor the code to use a separate line for each assignment.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 50528a94cd3bcfa46517c6ffccf3f458e17cf816..f3dd6982b293c74024f7d70a6ef1ebfb5889b0a1 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1867,10 +1867,14 @@ static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
 
 	mode->type = DRM_MODE_TYPE_DRIVER;
 	mode->clock = 1;
-	mode->hdisplay = mode->htotal = ssd130x->width;
-	mode->hsync_start = mode->hsync_end = ssd130x->width;
-	mode->vdisplay = mode->vtotal = ssd130x->height;
-	mode->vsync_start = mode->vsync_end = ssd130x->height;
+	mode->hdisplay = ssd130x->width;
+	mode->htotal = ssd130x->width;
+	mode->hsync_start = ssd130x->width;
+	mode->hsync_end = ssd130x->width;
+	mode->vdisplay = ssd130x->height;
+	mode->vtotal = ssd130x->height;
+	mode->vsync_start = ssd130x->height;
+	mode->vsync_end = ssd130x->height;
 	mode->width_mm = 27;
 	mode->height_mm = 27;
 

-- 
2.51.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39435B8C5DA
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 12:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162328944A;
	Sat, 20 Sep 2025 10:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X+8ManhQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B0510E0BA
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Sep 2025 09:46:18 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45df0cde41bso18613775e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Sep 2025 02:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758361577; x=1758966377; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U2BtO4h5fgPnqopTeGkX9M9uevJqHFHjmHEuvEhPITU=;
 b=X+8ManhQjzqQ0pcmTijyUWz48GPsKlrfDbsYFxJLkuaRV/H7jLVbNkJY1erLnWaOK9
 yqchADvfEkXStD0uTVLDtZRlNg2KguxKHQNw1M4HvM04fMh8ZqyWy3MAtM/h1fT+229F
 VcaDPhncVjQhoWjJ3+HkYDz5DYcsGujzRm0aAbjHhooYcsJZB5Mjjdk55J6+Nz4DZ1rK
 nuqs9wrxZKRDGttC0D5mFUKsqul11qKJ269dQeeqVb4OATceHYdpUoFSIaDlSvodVqH9
 11gWII3ahjgHejKjsDIOy+Jlz/QkdqmZ6UygdXyFka6oiGYxSMnz9Losv+8Dt2+B3X42
 2hpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758361577; x=1758966377;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U2BtO4h5fgPnqopTeGkX9M9uevJqHFHjmHEuvEhPITU=;
 b=WuZ+Vc2BbuveJN2avyEbdcR+ddJ2N3z/NJ7kGYRPqSQvCQLShWQv4l2ejHA6AK5k2S
 Td8hr++w4Ey77eBj3d3vtQx3T1O6r+oa9K7edEjFGYVKE+EDmt/raCYCYTmc8+kWrDLw
 Mo1Cjn0gKS0LbiTZkU04Y57c4nmLoHl1OXuqi6/8MYJFgJ7iFx9krRAvSZ8abtQMViAI
 4YZ6vC8qPEzPUsKMIzW1iCrC5a2TWyRfZ/arDTJwo5w+2zhjkUVCGvY4MsVFXPU+E/Cl
 hQqTBp3g7nHIktzj7wT5s47p6gXefXQ4AfpGuRwl1natHj8U7i2sSydqmXVmtMpLwwOF
 wZZQ==
X-Gm-Message-State: AOJu0Yw4oytp486QmB63qRbLDEVWBnC3g6A1WX1toiXvojGpwxA7TFL2
 8AnhrtJK7h2GRdiNiLdh+xvnd1WlHiOM5cePAFLgbHrilyeTlzX6k/cV
X-Gm-Gg: ASbGncv225no0s3ZENY24h6XpvL011dqFTV6NYNkeyZShZum36PchHdl0jh4QI5yuzy
 PgyipDzM0xMmTCL5jLAMbIWFAuXYte6lsOuNgW4jRDKdu+snMJ74p79974baLPdfRELRz4zpF5j
 8Nr1Vas9qRpNlYwdtY8CtfgJ5RQSYCEq+NTTXIcSeZcTKxBMdqr6wpb8cSswQrpZGhxRKkCAfJK
 WNCOeGvPx3AxwTcyGPduQ8rKECEl+IPIASclOYEJylXhVgaGsS+sv5kWhUfJ2c6HyYNx3/tFrHZ
 HJhpsD4j0Rx4VBnFBTCVsWOqIPUn+fyZPWd+4utEvqetL8/0d0zk5cuEqDhkgkOWH0L0Erhh1zY
 gWFDgqKbTLT9nVBx8nMflCx6bNlplBBrymcSzqkosGJ4StYqR/ARpbKdI65m0NRlA
X-Google-Smtp-Source: AGHT+IFrr+GoJLZCI16/2tiEa+6av2fZixro4L1+EszOgL53IjeFy8N3GzS+hVuMn2/3gmqGADIWtw==
X-Received: by 2002:a05:600c:3556:b0:45b:9c93:d236 with SMTP id
 5b1f17b1804b1-467ebbbff00mr46716175e9.27.1758361576761; 
 Sat, 20 Sep 2025 02:46:16 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.139.156])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613eb27f25sm163883615e9.23.2025.09.20.02.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 02:46:16 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Sat, 20 Sep 2025 11:45:43 +0200
Subject: [PATCH v2 3/5] drm/solomon: Simplify mode_valid() using DRM helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-improve-ssd130x-v2-3-77721e87ae08@gmail.com>
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

The ssd130x_crtc_mode_valid() function contains a manual implementation
to validate the display mode against the panel's single fixed resolution.

This pattern is common for simple displays, and the DRM core already
provides the drm_crtc_helper_mode_valid_fixed() helper for this exact
use case.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 5b0d5bbc7f9fabd8430226e88cdee9e22ac7ad96..6083fd9e9e5e4def670961dc46df7e4adef7462d 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1473,15 +1473,7 @@ static enum drm_mode_status ssd130x_crtc_mode_valid(struct drm_crtc *crtc,
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(crtc->dev);
 
-	if (mode->hdisplay != ssd130x->mode.hdisplay &&
-	    mode->vdisplay != ssd130x->mode.vdisplay)
-		return MODE_ONE_SIZE;
-	else if (mode->hdisplay != ssd130x->mode.hdisplay)
-		return MODE_ONE_WIDTH;
-	else if (mode->vdisplay != ssd130x->mode.vdisplay)
-		return MODE_ONE_HEIGHT;
-
-	return MODE_OK;
+	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &ssd130x->mode);
 }
 
 static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,

-- 
2.51.0


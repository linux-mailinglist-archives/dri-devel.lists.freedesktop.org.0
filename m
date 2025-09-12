Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB74B56092
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 13:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D044610E146;
	Sat, 13 Sep 2025 11:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W3TIdRd1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AD110E13A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 16:42:46 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3e7636aa65fso1527943f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 09:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757695365; x=1758300165; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KFENQRkaHWGLQP/LJzCU4+3J7bwp0+IQHEZ8jQOM3aY=;
 b=W3TIdRd14Ms0qTBDDHDoxe6JL5ou9ZksJw8udGJzJ/sHn7zytMhlUMunRHOeVoLjto
 OF4wKaLundTWfgw8iB7+z0LKdmD8aLd5X1+vq/XU8hRNcMJhVjZxTfkzaccjR4dHhW+Z
 F51AD9uNVPdvX2NZ7OMY+Q9WDS1fw+pfW7GoORhcJsL/9dbnMs+/5s2aSIL8LdZl2vcC
 +om3eMnwaHjS/5TIM9O+N9+T5i5R+flAzZmwij7yDfX9F0pZUSIvDYHBQNKSKrAuCfj6
 evGlb8G5VoSMz+b6O9RBZguoqrVsO3buT1kcvhw5AOpPhVoFgyIcUbVL1Bp+xpdoOTb2
 eV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757695365; x=1758300165;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KFENQRkaHWGLQP/LJzCU4+3J7bwp0+IQHEZ8jQOM3aY=;
 b=fncP1fOACkc1JKkvltw2lhwJo//qLSBVUSGLVhBhzeIm58AeHwsXjiiO7pEzeh6vku
 0TOoc35A+mb8uh8hL9fXGcO9Sh9Dt7QHonZ4mSPF1gxADiGicfpa98xPjot8gsZpODAd
 lk1e0CyXfLGZ/FoXGZjiQGYU1B7HodE7iLx+EyjzOPoL2+DHABRUsaoF6OlxWlyI0Wdr
 7+7JlRYpM0fQpNRPBfjA8+C5ry3ITzKkDYvwUBC1s/46UspoAe4OkUpZINsJi6lyT/+K
 TtW3R62WwxrJqhstV7+ilG/vkUmkWQ1hMLTHHq1wlSroui/qVzHUXaZ7gRuohlPfnYMG
 2+/A==
X-Gm-Message-State: AOJu0YwbOvPoa81j6bLeUGmgc33KI1KgTmRX2PifGQMPwsChEnM/+dJS
 F4ErVy2t+m8cqnGftCakEu/nDTyPhCnW2FqnZQ/Yw3EdeE9K0SrsTlpV
X-Gm-Gg: ASbGncsVxUZwA14twEzl8DXJA+VQZbHKOXcHUVLy5A75amyP8dzRfg9ZUg7PBk8OCiG
 HDee3erZ9Bjo2d1fQ5QQmvgFv3GPPa8yZOOjiD4tyCRB6IPLflOJEXT06eHw/7puKp6x5qoKoXx
 oYj+c/ufYCEFEcg3hn4z25wapvpTWKy8NnJc2flcz8O0VlmRRmt1MHMcGS92xrna46pgvPz8YH+
 dMMCeCKQaBRXl/+ZxV4OZj2wavrsF1WeXHyVxCZ8Wy+R6uDObQIRiR3M4Sc3hhqTqfJLCgPc6db
 V4RPvV/t4tJkPN6PNfV/0nre2Ss+nm6HTS3tmtmX8uvdaXHWdbcclq9eAw2YvA3ndIZs1aiLHIX
 L7mvBBUGSxyKTWhT4Gvkm2Vj2jbRI96jP3w1JZ/5tcp3VwdH15MVM5i+PK5bJEXGbZKI/x0HE9y
 U=
X-Google-Smtp-Source: AGHT+IFUXlWlMsI+O3HCeBbRHHVgWy9WXZNhNJzCqjRktFunB1HznFupXLMqa6IWJ2R3netjj8TKLA==
X-Received: by 2002:a05:6000:2389:b0:3e7:6268:71fd with SMTP id
 ffacd0b85a97d-3e765a4c887mr3756492f8f.52.1757695365250; 
 Fri, 12 Sep 2025 09:42:45 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.138.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd415sm7086696f8f.30.2025.09.12.09.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 09:42:44 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 12 Sep 2025 18:42:12 +0200
Subject: [PATCH 4/5] drm/solomon: Simplify get_modes() using DRM helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-improve-ssd130x-v1-4-bc9389ed299e@gmail.com>
References: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
In-Reply-To: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Sat, 13 Sep 2025 11:45:22 +0000
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

The ssd130x_connector_get_modes function contains a manual implementation
to manage modes.

This pattern is common for simple displays, and the DRM core already
provides the drm_connector_helper_get_modes_fixed() helper for this exact
use case.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 2058d188159c3eae28de1614b9fffb06ac5551be..7bdccb5140195a45d8ffd01e139dd4eb2e3cc327 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1729,20 +1729,8 @@ static const struct drm_encoder_funcs ssd130x_encoder_funcs = {
 static int ssd130x_connector_get_modes(struct drm_connector *connector)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(connector->dev);
-	struct drm_display_mode *mode;
-	struct device *dev = ssd130x->dev;
-
-	mode = drm_mode_duplicate(connector->dev, &ssd130x->mode);
-	if (!mode) {
-		dev_err(dev, "Failed to duplicated mode\n");
-		return 0;
-	}
-
-	drm_mode_probed_add(connector, mode);
-	drm_set_preferred_mode(connector, mode->hdisplay, mode->vdisplay);
 
-	/* There is only a single mode */
-	return 1;
+	return drm_connector_helper_get_modes_fixed(connector, &ssd130x->mode);
 }
 
 static const struct drm_connector_helper_funcs ssd130x_connector_helper_funcs = {

-- 
2.51.0


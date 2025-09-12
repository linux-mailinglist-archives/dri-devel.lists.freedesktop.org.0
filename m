Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36644B5608E
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 13:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9E710E128;
	Sat, 13 Sep 2025 11:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FYjKgo01";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE60210E13A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 16:42:42 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-45dec026c78so20973695e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 09:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757695361; x=1758300161; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yWqbHcu30xqhsc7+J01h1Frd6Q/2FaMV7jjWv5Z2IxY=;
 b=FYjKgo01CP8ry8BqsBl/TH4zUWWNG4OageP0LYlqb2m3hrBcs942jTuAK/3tFSoPSw
 bax9jQx5+nvXXs/KgZBCdz27xbcxORVN+bUuXdyfEd/05h6cOliOWiLSv8hodVk0ywMf
 mQfcu/jcEZFqou5sNbKOYNMDLSCTL8Z3gf6I+DE5djGlcAZjYEManhBj0nRRWkqmgLWa
 EmM6MJOsFOZrJb4GHbL4rXgbGre8H314sxfOrn0LCE/BXtQOfvWUTmP0yITEcFh2YS6u
 V4sB3t7nKmBmfM96nHitK32s8pUgdoo5zqMAunIavtsNeS74BKrd6JYos+8d5L+ZVhJG
 qKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757695361; x=1758300161;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yWqbHcu30xqhsc7+J01h1Frd6Q/2FaMV7jjWv5Z2IxY=;
 b=ok1RH6406lBeSxLatwkIl71p1bGXZeI3KHUALMf7Im8+k12CNJaD9cvbVoJ8OJ180S
 BEiIwaRF3FnNVhT+WzXvkViN7f24NnLbv+rUf+WV0yt4twGqQUYzx79UTfMzAY6p+L4z
 dgu9JMH4CQHt6xm7gm7qB/NU9XwJxpA4DO77F1moXs+CpjnNIxd/j7FI2zeAWUEq4cND
 uOAW7iM0Wo0LpH9Vt0tMo5MfhtIIhJlMssLw5UT3FRAU0Oz2RXFd5ZIpZyFwxCQqvABv
 xOXqWdapIh0pJ8qR3mJDxBNGki34rDjCFlyocwIxJvUbWQl4jPrUfNG842QDO2V/GQPM
 ROaw==
X-Gm-Message-State: AOJu0YyyatcRO+dzBroQrSHryyp/ZEJtpqXGXcEcgLnDLh6T16HdtsCM
 hwlcNcm/y0ACj5dhdoU1+8Ht+bvraPZolwl2c5kqIdB+rU/ksxvTfkki
X-Gm-Gg: ASbGnctiLbxZdY21zo3vYFqM8RHFYsaJtHYBVZ+QBL//kaYdXCZlhfzmaGtMZlBxT+K
 RYxRSD7j7W/5X7yUn+3eONwEQ0wIrU4n9n0QuUvQ4ivYBe+KqfH06HQCGkBTxoTFuIBfzpyCdbB
 czhz9JjUSdrjGr4lMFlc25fbBTjJhenL25iAL3YBsrVO9siLecWGODaUHCWHcbYYCOnf3QLNslr
 HMHQ373F0+6XCZeWrx4hUIxCQsIjn5FwuyYkroMKYM6O06V0NKFwPj2sjeVWJhCKFPwSQzFeqA5
 pSGlLdC7fVM5wJr0ZsYNxa+oi54k6jgYYix8lJFvCmPTdAe4/g1H36cRYOe0A58WQ0e2gjZV+NC
 qblPaurwTvbMFgLO/LiYyk5RZYYZ+9nKkQMYUvEfhyYnDZjHcyS7titYlYiAPVarGq82OwQ6N3J
 o=
X-Google-Smtp-Source: AGHT+IH2WqFFYwwZKcq2dDys6lYV3Y9NNnL0D9d/ETn6ueyPNEao8tuz1jm9o8gPdjUwlS1YqeaFbA==
X-Received: by 2002:a05:600c:2282:b0:456:1dd2:4e3a with SMTP id
 5b1f17b1804b1-45f211ca99amr27964535e9.3.1757695361061; 
 Fri, 12 Sep 2025 09:42:41 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.138.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd415sm7086696f8f.30.2025.09.12.09.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 09:42:40 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH 0/5] drm/solomon: Code improvements and DRM helper adoption
Date: Fri, 12 Sep 2025 18:42:08 +0200
Message-Id: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBNxGgC/x3MQQqAIBBA0avErBPUNLKrRIvKsWaRhQMhhHdPW
 r7F/y8wJkKGsXkh4UNMV6xQbQPbscQdBflq0FJb6ZQWdN7pelAwe9XJLFZj18GFYHrXQa3uhIH
 yf5zmUj6aX2o9YQAAAA==
X-Change-ID: 20250912-improve-ssd130x-b45b89ff4693
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

This patch series improves the Solomon SSD130x DRM driver by adopting
existing DRM helpers, improving code clarity, and following kernel
coding standards.

* Patch #1 moves DRM GEM framebuffer CPU access calls to make critical
  sections more visible and maintainable.
* Patch #2 replaces WARN_ON with drm_WARN_ON_ONCE to prevent log spam.
* Patch #3 adopts drm_crtc_helper_mode_valid_fixed() for mode
  validation.
* Patch #4 adopts drm_connector_helper_get_modes_fixed() for mode
  management.
* Patch #5 enforces one assignment per line per kernel coding style.

These improvements reduce code duplication by leveraging existing DRM
infrastructure and enhance code readability without changing
functionality.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
Iker Pedrosa (5):
      drm/solomon: Move calls to drm_gem_fb_end_cpu*()
      drm/solomon: Use drm_WARN_ON_ONCE instead of WARN_ON
      drm/solomon: Simplify mode_valid() using DRM helper
      drm/solomon: Simplify get_modes() using DRM helper
      drm/solomon: Enforce one assignment per line

 drivers/gpu/drm/solomon/ssd130x.c | 77 +++++++++++++++------------------------
 1 file changed, 29 insertions(+), 48 deletions(-)
---
base-commit: c571cb70e1ed43ee543c70151e61a001ab2eefa2
change-id: 20250912-improve-ssd130x-b45b89ff4693

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>


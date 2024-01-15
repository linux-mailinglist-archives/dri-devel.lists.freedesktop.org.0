Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7166C82D5D0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 10:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D615810E218;
	Mon, 15 Jan 2024 09:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9928610E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 09:25:01 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3366ddd1eddso7019859f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 01:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705310700; x=1705915500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tVtFgKZwIFS1vEBdEVjotaw6JZpTlhG6vAn3dQd7JeU=;
 b=bcpRUWwZbNn5t65K/JOFZb86KeI5Y1fhvYnj6Sy0DcPYj3VQWi5u3+06LM5t0y3ifj
 lopJTYPfN6IlhlIJJPFoEAsdNuhWz41SumXKbZK4U7vHOGKb44QDzTkhxevRV2Q8mGAQ
 Ac/iuUvc42fuImmWD2Sx1iucsxcnAi2wyH28i9osfZ2BNVPeobMAd9VCELXtZDwZ8EG/
 h7nSsGArdcy4YHP7nzLI7tAX+0znQKaj6Ar+8tgf15IjAhbqfw7Wl5OJ9Fhl3NRACg96
 ntWnmc6hLrtkaeTHX+BKdl7Ft9wPwY3J/tC1Lm+/I/cY0D/1AnZ0q3Enq8utuNtdfQZR
 5d/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705310700; x=1705915500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tVtFgKZwIFS1vEBdEVjotaw6JZpTlhG6vAn3dQd7JeU=;
 b=eWx01/M5oePn9VgbCkS2eVsxtARetq10TuKr0p4fVO5/bJVeRrCbfI9a0Smg9RROVl
 Xcvf1np/tw9C+hsF4nSIHaLIkciuKUVmCLsa5/tQPLjT3fntInDgYjNwiSbNqiL0B3w/
 1shTNt3KBMMcF6dchtOztkbyHi6pRzTxK5XkTogje+a9EhtnbcJD7KYQkXOwhjnjHk5r
 4wza+2/U/I6x+XNFRf+QtOToZvf022wBoqCP9aS8GZ77pjfxgtrfDu4W5FFKRrxsGfjL
 Y3Uch085t65xb7F6FTqWorFk39H3lNkKFi7nH268Ql+gOxPCC8x6HF9BJn6dMG6X+IiF
 fvrg==
X-Gm-Message-State: AOJu0YxycDe0nnosyr+mc/GvkdX0h9DfiWwikKob2OUf79T4mlUcoszo
 wkpBOATzax6xT5Ehy7kcYg==
X-Google-Smtp-Source: AGHT+IFWA+Z+Q6sM5+EDxdV7QvTKq8nlsTgkfw59qSIaFAN6KRsmaa7Z2RYvssV+Zwrl5Nnwh2tI+g==
X-Received: by 2002:a5d:50d0:0:b0:337:99fb:ce2e with SMTP id
 f16-20020a5d50d0000000b0033799fbce2emr1306430wrt.209.1705310699743; 
 Mon, 15 Jan 2024 01:24:59 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:702c:8d99:9a73:8e9d])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a5d4cd2000000b0033740e109adsm11325864wrt.75.2024.01.15.01.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 01:24:59 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/rockchip: inno_hdmi: Explicitly include drm_atomic.h
Date: Mon, 15 Jan 2024 10:24:35 +0100
Message-ID: <20240115092434.41695-2-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: kernel test robot <lkp@intel.com>, Alex Bee <knaerzche@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit d3e040f450ec ("drm/rockchip: inno_hdmi: Get rid of mode_set")
started using drm_atomic_get_new_connector_state and
drm_atomic_get_new_crtc_state which are defined in drm_atomic.h
Building does currently only work if CONFIG_OF and CONFIG_DRM_PANEL_BRIDGE
are enabled since this will include drm_atomic.h via drm_bridge.h (see
drm_of.h).

Explicitly include drm_atomic.h in inno_hdmi.c to fix this.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401100949.ZVRr0pIa-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202401081720.UtgAZgba-lkp@intel.com/
Fixes: d3e040f450ec ("drm/rockchip: inno_hdmi: Get rid of mode_set")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 925320fef0a8..3bb8f1382612 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -15,6 +15,7 @@
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
-- 
2.43.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EE1808D5B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 17:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AAF10E920;
	Thu,  7 Dec 2023 16:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E134810E920
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 16:25:12 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-6d84ddd642fso687420a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 08:25:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701966312; x=1702571112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BG8DXABI26khRo/Cvsu7QCsP0TBGt0vEQX0MbHKakig=;
 b=eM8hwI6nf31dYqUsgsTJvx7xfKhEJNwPjriWjWedj5n81mXk74Q3ZphMeHZI2NqHmN
 NE0WeKQqVWtNboFeteS9BfwIVCf/+tBAuxq0btazo4k7Db+o95V3yRwwDPzfZ6Rl+l8J
 FXcVk/cybizsMXXTLy5T9+w/KMBRRNCYNDKdYxdxWCvEwV9zQnqNKOrj8XgRrZPnTG40
 Boe1ypDbHQLfLwHfx20LEAJqHmzx5S0NAi4x1q3epjNMTmFWAy0t0UmD74DPxvlgpGxy
 a8yr6Z2xEsX8eko3BXeXLZOV3aBlrHSxTCfog/IG7cVxlJk5iB5d1b4xJlEDBtbcbze8
 0ePA==
X-Gm-Message-State: AOJu0Yzgbey8MUFdx/lP33+mPKzNa87QAxIyBUjVqbm2z+tZBnDHmE1c
 6TPbfgrPB3c1ePdM9VIzDw==
X-Google-Smtp-Source: AGHT+IHDHo4nv2MT6E4HyQ0LIW+PExIE57JufBhvs/5LPfc77PCn6XBFLsr9P8vg6b2GGTfVvI8Y9A==
X-Received: by 2002:a05:6870:d60b:b0:1fb:2f58:f1c4 with SMTP id
 a11-20020a056870d60b00b001fb2f58f1c4mr3178764oaq.48.1701966312074; 
 Thu, 07 Dec 2023 08:25:12 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 pf11-20020a0568717b0b00b001faebb7ff77sm20912oac.56.2023.12.07.08.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 08:25:10 -0800 (PST)
Received: (nullmailer pid 2631917 invoked by uid 1000);
 Thu, 07 Dec 2023 16:25:09 -0000
From: Rob Herring <robh@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: aux-hpd: Replace of_device.h with explicit include
Date: Thu,  7 Dec 2023 10:25:00 -0600
Message-ID: <20231207162501.2629952-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it was merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. Soon the implicit includes are going to be removed.

of_device.h isn't needed, but of.h is for of_node_put().

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 5d2ab3a715f9..1999a053d59b 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -6,7 +6,7 @@
  */
 #include <linux/auxiliary_bus.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 #include <drm/drm_bridge.h>
 #include <drm/bridge/aux-bridge.h>
-- 
2.42.0


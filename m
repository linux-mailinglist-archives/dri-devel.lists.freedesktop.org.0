Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D27D6DED3D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 10:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F001D10E29E;
	Wed, 12 Apr 2023 08:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D1B10E29E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 08:09:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f080f4fbe1so4131945e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 01:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681286964; x=1683878964;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PRpqY9VnGSh6SWM569hybEzeQi5osbuqvPfjOLwbDuw=;
 b=Qm65QtZlp/M2//H/gVc+zucvGfZY0CvKRPCjsrkz4EmJt5ySIXfIWZ8OJaO8mVjnlH
 68tbbKYo85d1+0/wnsa1JC62P9hv0RH+C2ewhJw2femZJgVi9KxrFVWDzi7mvh+ZS8zW
 iCVPhnGaWs2hj8RsKuzsDtzgMWcWru94KlmXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681286964; x=1683878964;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PRpqY9VnGSh6SWM569hybEzeQi5osbuqvPfjOLwbDuw=;
 b=Nvz1E4SMZhewjjJRxnlzRMT5v37uAnNPMY/pQXVc7rJ9rUvyWAB7TTjTBMKXzGBZzu
 xJDhIEVdywwISz5agrpcO3rrM6AEsgMXUe/g84aiGduDz5R/jpiWhlVJL2B1zyHxuBTG
 C6i9n65EvSjDZvs584wjSzbYvywKbtP73OcdGQxBtYIs7MnJLdSbB+nZGK6XYKWZNtME
 5jv5a2E/UntuQsAfDNC7FI/J1+ID8aKlWPY7mdw6vLNe1NbIC3qVvqQYrBG3q/KSv/4Q
 xa4QMyy7HqHeKXZ+GRl1Krz9e4WQcewjdb4iofACzzuDVGlMzmO7rSabhgFei7JKg2pG
 B/zw==
X-Gm-Message-State: AAQBX9dmgPYXguFILv0Xmu3Z1bhRwZEiRcWF1rPXCZr6/5zRlG6ve+9n
 ZZqWyZaTGdq2eHlTYvRTUrNsxMS/SP/GeQDbNIw=
X-Google-Smtp-Source: AKy350ZxBqJopoX9C3cTKC8lsLY06mfTvsOHj1yjUVLJkBbj+hE2jEwUXAQro8fimiyHScajAkRa3A==
X-Received: by 2002:a05:600c:3109:b0:3ef:7795:e5b1 with SMTP id
 g9-20020a05600c310900b003ef7795e5b1mr11524734wmo.4.1681286964196; 
 Wed, 12 Apr 2023 01:09:24 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 e2-20020a05600c218200b003ede06f3178sm1456973wme.31.2023.04.12.01.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 01:09:23 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] MAINTAINERS: add drm_bridge for drm bridge maintainers
Date: Wed, 12 Apr 2023 10:09:20 +0200
Message-Id: <20230412080921.10171-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.40.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise core changes don't get noticed by the right people. I
noticed this because a patch set from Jagan Teki seems to have fallen
through the cracks.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
--
Jagan, with this your bridge series should find the right people!

Cheers, Daniel
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6a4625710f25..cf2add900c8b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6843,6 +6843,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/bridge/
 F:	drivers/gpu/drm/bridge/
 F:	include/drm/drm_bridge.h
+F:	drivers/gpu/drm/drm_bridge.c
 
 DRM DRIVERS FOR EXYNOS
 M:	Inki Dae <inki.dae@samsung.com>
-- 
2.40.0


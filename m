Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2BE1AAFE9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 19:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88C86E24E;
	Wed, 15 Apr 2020 17:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731A36E24E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 17:38:41 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e26so493072wmk.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 10:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ISANW8RbVtgw01X0Z7vr2l75hxDrB0VHudd5x6+tn7k=;
 b=Hxjte6zZzQMyHtGI0mzebj90IOdiNkZKOvmYmnM+kWQpShZy7TR5+mztkVPOLpjV3Z
 oIOZVtHK14Z4NDzRHzwhiwnLjH8ZkuX67gjKYc/P9u50cGcT1WvuhsfV0ORcS62iZ54p
 qn7CDTuiQkvCQ8Oj/AE18kDfYE/rPptZUyW6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ISANW8RbVtgw01X0Z7vr2l75hxDrB0VHudd5x6+tn7k=;
 b=E3i8Ub2nMO7pB5R7HLrycBzi89S7PA4Qr6lwEn+lrpap6jCLb1+RstJoS8hJ4npBKF
 reyJf8Oax5SzK6lVIl2mTqH4Kcf4KYxhAz93LegQsYSQSkEw4jApu0boC4U7Fsoze5HT
 IbcdPkRUYp6Fy039BgDG6qQw602O3wQ4+vwW6ERRsIlBfV2aJl5ZjImLAr06ExJuBBpP
 yrOetVmK/K+CaBm+QqgNH1gNlNAcDNbBq81xgW+cGUPZEbwdCyKHHRxEVyx9aanRjlAR
 E196wiDSgr6lAesXHAZxjdfawqNGMWQWrG+9/MDO8zneKYRIUvlG7pqXJbWtqDqZ60af
 aU3g==
X-Gm-Message-State: AGi0PuabBrvxz6AEH1mi+nmpVDGDt75hkUtQnHf5vSAYv3iDDumRXczC
 SUFPKDwkY+6Or+LhX200oC6KPra9OCU=
X-Google-Smtp-Source: APiQypKYPvY8Gbyvc0lpi+uNR4TxdICI5AujWod9Xw7AYUluT1fZhiKWWwn1Uj4FN/1m/SIE03u5JA==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr310583wmc.67.1586972319857;
 Wed, 15 Apr 2020 10:38:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w6sm20648663wrm.86.2020.04.15.10.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 10:38:39 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/bridge: Move mhl.h into driver directory
Date: Wed, 15 Apr 2020 19:38:33 +0200
Message-Id: <20200415173833.312706-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

include/drm/bridge is a bit a mistake, drivers are supposed to find
their bridges using one of the standard of_* functions the drm_bridge
core provides. dw-hdmi and analogix-dp are the only, historically
grown exception that we haven't managed to get rid of yet.

Make sure that at least no new ones grow by moving hardware header
files into the correct driver directory.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Kate Stewart <kstewart@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Allison Randal <allison@lohutok.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
---
 {include => drivers/gpu}/drm/bridge/mhl.h | 0
 drivers/gpu/drm/bridge/sii9234.c          | 3 ++-
 drivers/gpu/drm/bridge/sil-sii8620.c      | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename {include => drivers/gpu}/drm/bridge/mhl.h (100%)

diff --git a/include/drm/bridge/mhl.h b/drivers/gpu/drm/bridge/mhl.h
similarity index 100%
rename from include/drm/bridge/mhl.h
rename to drivers/gpu/drm/bridge/mhl.h
diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index b1258f0ed205..4c862c3af038 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -12,7 +12,6 @@
  *    Shankar Bandal <shankar.b@samsung.com>
  *    Dharam Kumar <dharam.kr@samsung.com>
  */
-#include <drm/bridge/mhl.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
@@ -29,6 +28,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
+#include "mhl.h"
+
 #define CBUS_DEVCAP_OFFSET		0x80
 
 #define SII9234_MHL_VERSION		0x11
diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 92acd336aa89..017dbb67404e 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -8,7 +8,6 @@
 
 #include <asm/unaligned.h>
 
-#include <drm/bridge/mhl.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
@@ -31,6 +30,7 @@
 
 #include <media/rc-core.h>
 
+#include "mhl.h"
 #include "sil-sii8620.h"
 
 #define SII8620_BURST_BUF_LEN 288
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

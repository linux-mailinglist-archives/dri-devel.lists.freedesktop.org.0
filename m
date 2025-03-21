Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA3A6BD13
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 15:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5AD10E140;
	Fri, 21 Mar 2025 14:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Chpfr5j2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B989510E140
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 14:36:22 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so1121867f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 07:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742567781; x=1743172581; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3fsDQxf7sE00cNo/2u31jHrQzeoPoyXMSlWbib8RZb4=;
 b=Chpfr5j2K7H37vSwh1MvExRtgVcoQTBw65x2BbOnqM72+hmVr/MqrjoBWrk8C2R7is
 N2AyswqqIxZ+RNNp6UKV6tZwxAT7PCkZqWixwEEEp2Ent2kIkyiaQtNkeIvjIsABm8kY
 7IBk+RYwAYR/EvP9j+0NIIuRNfUqPzjXZ8YiRu4r4t0AKwjSJVkFd5Dd01RPZLPynLeF
 le15jWwZx3GvjwFhjClpUaJMTarOR3w4ZJyJZiMU1TE37ujA6ICpT373iSP4xNcAPvFJ
 z6BD9t1khCkdPpPTkkWkKaozPNMeqS5VkYfhmKBrwZ7hVRW6Y1lvZCXgE1xZ1TFI7dMa
 +opQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742567781; x=1743172581;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3fsDQxf7sE00cNo/2u31jHrQzeoPoyXMSlWbib8RZb4=;
 b=vJ8s8OiHP/QXsMZA5fgUvIgVA3bVH5BEO9mC0dz90P/iZ8kF/oBzQ2SvjLoCExGK6c
 UBSEk1R6SBcvvWqZa+j1csfsVI20owyaYwd6TFYhzxRXe+DWIXhn8da7FV+zKrglQMha
 ozq9vQj9cr3dyebEshzXRNnWl9O29DPIAwCLA8Uy2QabKxZZ5RXKo4XQgwlZ7/XGakkn
 hRgyDb+levRpGeYp8J1ki3TeAIN7C+UHP6aBA8ySuhxjOk1dr4d3RFx/+WsgAeVS9cu+
 yL2GYwe1hUiblKHFBBYVrI/Ug/xYphKErnp+3hB+wl+7lI09LZiVyZaVEyUe1L/HcyIk
 uloQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9H13uNMo2X/lxohR439xRJvJXIG1BwTAJ69vyee52bjPXOAJ1+R0doncbvMkWFyrwyodmYdmKvFA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9OZ3dFLsg/hUBHQizjVBoErYI39dmarIlCbei4XPuYmj/Wodn
 h6wNgbmUvD/UGdmqqWET7b+5OiNolsuIWPgev+YOCRnqG5sCdJ3q/+X8x0uVDjw=
X-Gm-Gg: ASbGncuv3Zmq74YsKA5UuyX8XnA8s9OXO1fggqVt0Ez2qXyLPFMMpNhsNapFHILDw6r
 jJD6PqHN8m4FkRG+xp/wdmPBSEKQU4dZtflFla04l1W1a3+4IeVcTIdzU0iL8EgzTOI3UN9DSut
 lQTqAcks5fMTB9i5NQCcorS2TMtyg97alxpD3vcs8vMHM+bYa3eygQOYHcO24lcQhN08b96DeOU
 ZHPNmh5ogYzjVvqXuHIgogLKTwiAq0xN5am80nGwL1EX2RmSX7PInJdtrwZWYF+Q2u84dw4wLzK
 hwxM77hJv9j0Syz4+76TAKCantohVRHPfOlb+rwX9zyg2uC0Kg==
X-Google-Smtp-Source: AGHT+IEgYecXG1++S76XR+sJROCwf96bxZG3f1zzap9S0mQvYbpTt9wv6b4eLg8AyhHlqK1JOitUsw==
X-Received: by 2002:a5d:64e4:0:b0:38f:355b:13e9 with SMTP id
 ffacd0b85a97d-3997f8fa36emr3786610f8f.15.1742567781323; 
 Fri, 21 Mar 2025 07:36:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43d4fd277d5sm28710235e9.19.2025.03.21.07.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 07:36:20 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:36:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/bridge: chrontel-ch7033: Fix precedence bug in
 ch7033_bridge_mode_set()
Message-ID: <20c0422d-b4fc-4ec7-b3e5-4c4679f499f5@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The problem is that the bitwise OR operation has higher precedence than
the ternary expression.  The existing code will either set
HPO_I, VPO_I, or "mode->clock >> 16" but not a combination of the three
which is what we want.

Fixes: e7f12054a1b9 ("drm/bridge: chrontel-ch7033: Add a new driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Not tested!

 drivers/gpu/drm/bridge/chrontel-ch7033.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index da17f0978a79..1b858a8ced57 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -404,9 +404,9 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
 	/* Input clock and sync polarity. */
 	regmap_update_bits(priv->regmap, 0x19, 0x1, mode->clock >> 16);
 	regmap_update_bits(priv->regmap, 0x19, HPO_I | VPO_I | GCLKFREQ,
-			   (mode->flags & DRM_MODE_FLAG_PHSYNC) ? HPO_I : 0 |
-			   (mode->flags & DRM_MODE_FLAG_PVSYNC) ? VPO_I : 0 |
-			   mode->clock >> 16);
+			   ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? HPO_I : 0) |
+			   ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? VPO_I : 0) |
+			   (mode->clock >> 16));
 	regmap_write(priv->regmap, 0x1a, mode->clock >> 8);
 	regmap_write(priv->regmap, 0x1b, mode->clock);
 
@@ -427,8 +427,8 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
 
 	/* Output sync polarity. */
 	regmap_update_bits(priv->regmap, 0x2e, HPO_O | VPO_O,
-			   (mode->flags & DRM_MODE_FLAG_PHSYNC) ? HPO_O : 0 |
-			   (mode->flags & DRM_MODE_FLAG_PVSYNC) ? VPO_O : 0);
+			   ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? HPO_O : 0) |
+			   ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? VPO_O : 0));
 
 	/* HDMI horizontal output timing. */
 	regmap_update_bits(priv->regmap, 0x54, HWO_HDMI_HI | HOO_HDMI_HI,
-- 
2.47.2


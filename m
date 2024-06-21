Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAF0912963
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93E310F1ED;
	Fri, 21 Jun 2024 15:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="PfGKZXLB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f99.google.com (mail-ej1-f99.google.com
 [209.85.218.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EC010F1EA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:49 +0000 (UTC)
Received: by mail-ej1-f99.google.com with SMTP id
 a640c23a62f3a-a6f0e153eddso277059166b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983307; x=1719588107;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=igXdOq6HSkwvMS0hUKaMcJHd0v/UWxxaKogk6C3ClrI=;
 b=PfGKZXLBKtWmp6fP43OBVbRTug7xGbXCqNVe5CHOwsQvf/mRSuLImgJP5wLsCSI3xu
 NQwA2fZHRCoxd1bjF2lXcX/iJCb4LDfFBCczqfcIoPUGKGG/LGFxewbBs3VG3z1PTHQt
 w3G95D9gzwUvD6Grvn7rK6u44h9/MjO+tH8yet13dczlfBT3pOr6Wwo/CWOe0ZlYUUMk
 umIjkOU9vtYpQlSUwa7Q7WwnAH8lsfHW0mQ5mEuGq48VY96MA+q7V/UbKpA7m4FAJb0h
 Cdp7ODYKEYgkhK4LihtT/nSF5WH3+6bcgUihrR3jEkTGvR8Hn7pHloxtwfSj2LrnEmaq
 UA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983307; x=1719588107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=igXdOq6HSkwvMS0hUKaMcJHd0v/UWxxaKogk6C3ClrI=;
 b=Rsw8a2ScIUip0VuuJ3eEpFJgKkswFeRtmQUIT6pPvzXrTyx4LPl+nFdClTEyjutHCS
 PDMBSjyKoseupUHq6n0iVyy8OKSF/UainwelKAtXPRKtHg1Nq7ChZ6QiJOVChnbPxU81
 7TCZEL8PPdXQ5Q3EYPo7Nx2A7uXdplfZgzvd3yLinn2yQXQOsr+BN9jowQDeRwdDn1nu
 bdZ6upLK++uzJnhOQ0FedlzqPGQLsRN/QNIZHdh+J/3PBfF/yGPJdkF47Kxo0iFdAj6i
 xmfQBC1iXixi2sYKA18VSsx/eXjrNJaKWEAdb3W561AY9NNOVP/c77073xAdgEA0ugTR
 I+MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmTaGPtd4ZT1uBD52c/CtounX9K0ZiEDfPPdkFN1QGkuUAiRx3RLlVFlslqKkoRXUs5JdQJINXuTm7tTy5IHcJGCKJcKYvfURsjuTZtXqE
X-Gm-Message-State: AOJu0YywfshZnGlI+kdG/c6MHOwfjyDS+fEhkum3GYmCeMzqXJ2YU/N2
 aoU/teSrYffG/nvjQQFoKqSlyrSbfNh2920cTVMApnEz4Ns1D1eLPKoVKj/bfJNNL3GTgDT/jUn
 dlqXfKjehoYYr05+5/fMkoGCuHdOS4p2C
X-Google-Smtp-Source: AGHT+IEbeFJF3DzIiWmSsyb0kje4PqM84/o9u6azcdg0pSZKQvPvsfu5FpC/bEkdrW/Q28tx1dJAjgHCEcdp
X-Received: by 2002:a17:907:c713:b0:a6f:526a:cf5a with SMTP id
 a640c23a62f3a-a6fab77a248mr694830766b.48.1718983307552; 
 Fri, 21 Jun 2024 08:21:47 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf56f319sm5623866b.289.2024.06.21.08.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:47 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 31/31] drm/vc4: hvs: Correct logic on stopping an HVS
 channel
Date: Fri, 21 Jun 2024 16:20:55 +0100
Message-Id: <20240621152055.4180873-32-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When factoring out __vc4_hvs_stop_channel, the logic got inverted from
	if (condition)
	  // stop channel
to
	if (condition)
	  goto out
	//stop channel
	out:
and also changed the exact register writes used to stop the channel.

Correct the logic so that the channel is actually stopped, and revert
to the original register writes.

Fixes: 6d01a106b4c8 ("drm/vc4: crtc: Move HVS init and close to a function")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index be2173f6c58e..af79b19817d5 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -427,13 +427,11 @@ void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	if (HVS_READ(SCALER_DISPCTRLX(chan)) & SCALER_DISPCTRLX_ENABLE)
+	if (!(HVS_READ(SCALER_DISPCTRLX(chan)) & SCALER_DISPCTRLX_ENABLE))
 		goto out;
 
-	HVS_WRITE(SCALER_DISPCTRLX(chan),
-		  HVS_READ(SCALER_DISPCTRLX(chan)) | SCALER_DISPCTRLX_RESET);
-	HVS_WRITE(SCALER_DISPCTRLX(chan),
-		  HVS_READ(SCALER_DISPCTRLX(chan)) & ~SCALER_DISPCTRLX_ENABLE);
+	HVS_WRITE(SCALER_DISPCTRLX(chan), SCALER_DISPCTRLX_RESET);
+	HVS_WRITE(SCALER_DISPCTRLX(chan), 0);
 
 	/* Once we leave, the scaler should be disabled and its fifo empty. */
 	WARN_ON_ONCE(HVS_READ(SCALER_DISPCTRLX(chan)) & SCALER_DISPCTRLX_RESET);
-- 
2.34.1


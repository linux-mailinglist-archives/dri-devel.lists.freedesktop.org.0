Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0F9912970
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79D510F1FD;
	Fri, 21 Jun 2024 15:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="YLrc/Twg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f98.google.com (mail-ed1-f98.google.com
 [209.85.208.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AA210F1E5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:36 +0000 (UTC)
Received: by mail-ed1-f98.google.com with SMTP id
 4fb4d7f45d1cf-57d1679ee6eso4251842a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983295; x=1719588095;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+RosAK3panotwbgV2qEnCgW9hUj8rUBCEsqioz5MVOQ=;
 b=YLrc/TwgMgpqFg3kKmu0gEHUmor7RlKSbUzOzYt9sbMjNv6FmwfIqhcRKoarN8zQIP
 ddiGJebF5AZNZa96VakiMfETLYvQeZ3yy1rOGrwE9gPX75W6bp8q2AqrJDKo9wDyVlgF
 V4+528eAqOIv9FH3otM/nC62g4CrYH3i/9H30NowDVF36tPEuprEYZi428jOPhBeX3ME
 412VXRdGVdIYvUxBx9tLJna0bAJEk69RxLeyAxDPnGTOenAYfEHlAl3xAUY/pPznm61y
 9hVUaOlXv/h6K+XtAAep9LcLCNbUwp1HVsJ9f+1ekM1+5Fn8PgK9dLlLRF+RrvEwXG6+
 BiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983295; x=1719588095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+RosAK3panotwbgV2qEnCgW9hUj8rUBCEsqioz5MVOQ=;
 b=MGKrcxHnjLo7RrJ2YprVrDEij/EllIVV6/jgicx3a3A6yiAq97MC6VsfUUlgQ5vf3o
 TT9gZqF24ljkRUgXsAIMqjeSKdKy8uMIqW3F3p7ZBj/DEEJvclrUx7/VDvZPefveN3tx
 FzvH2n1NTJXwYzyYtLZeedXZq2O/yW9F/YB7NmncGLKAmnRWFXWUkV5G9gZLWh1hUa7J
 eB9RiBpaGrjfSMZlLh1wEg8JJLJVPbHJttWvwARHR7ZyQHEQIawSc4R+sbWpDSH9V1so
 A8ETvA7OpQWKUuTiKJuYspL3FOF4qgUU7BqguUhC2SxKdBqdHDqjOJMfgBkdKGj3anSG
 bTjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRLb45hNY7+Ox259R6mgVpikiMAP5zLVDecapRqHRvw5k/2XE8D5N3XxHhN44OLcdd5WLcwfDReJnEPMQU7mwqgV3RD4dKQIkaDY6YM3Hm
X-Gm-Message-State: AOJu0YxXYAIWD468o0AuyEqD0W/4Xcyw1LbPSqT9X7zOUgLqZsBwe6XD
 MV5baVP9Uhv2r6cT9rEXV8l+uorCUSnF3APz3yXqeu6XfGw5GpCHOO1CM5ZpO1rrQkHYrrUcUwo
 wXp+592oCLjUT5HGR0rwOtjOdNnrm57e3
X-Google-Smtp-Source: AGHT+IHoNaeeGwdzKfL6BCLP9eBHduv29ZpnH7JHqYMKoZJZN0ZL8IQOR5Si6l8kBPdwvLcbu0pvF9Ezr5cr
X-Received: by 2002:a17:907:d310:b0:a6f:70e7:6a54 with SMTP id
 a640c23a62f3a-a6fdb69b24cmr8018466b.28.1718983295312; 
 Fri, 21 Jun 2024 08:21:35 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf428781sm5663566b.29.2024.06.21.08.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:35 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 08/31] drm/vc4: hdmi: Warn if writing to an unknown HDMI
 register
Date: Fri, 21 Jun 2024 16:20:32 +0100
Message-Id: <20240621152055.4180873-9-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <mripard@kernel.org>

The VC4 HDMI driver has a bunch of accessors to read from a register.
The read accessor was warning when accessing an unknown register, but
the write one was just returning silently.

Let's make sure we warn also when writing to an unknown register.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index b04b2fc8d831..68455ce513e7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -498,8 +498,11 @@ static inline void vc4_hdmi_write(struct vc4_hdmi *hdmi,
 
 	field = &variant->registers[reg];
 	base = __vc4_hdmi_get_field_base(hdmi, field->reg);
-	if (!base)
+	if (!base) {
+		dev_warn(&hdmi->pdev->dev,
+			 "Unknown register ID %u\n", reg);
 		return;
+	}
 
 	writel(value, base + field->offset);
 }
-- 
2.34.1


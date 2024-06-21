Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB1291295E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D6710F1F6;
	Fri, 21 Jun 2024 15:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kfVdtH2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f100.google.com (mail-ed1-f100.google.com
 [209.85.208.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05C010F1E5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:35 +0000 (UTC)
Received: by mail-ed1-f100.google.com with SMTP id
 4fb4d7f45d1cf-57cf8880f95so2483613a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983294; x=1719588094;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4AjgM1lONumiIAH3nlA15QCd+ve3cOFFHpjhMZ1Fplo=;
 b=kfVdtH2ryrIraYksvQQb4/LjZT7zlLQwb/AB5iQyrrYKy6Km1pR45H0/J/Nz1hVyiI
 TAQxV7S9JU06oN7cWkCA0oT1fO7aTAXlLxdC6mbmYJ0esitw/tiz0B0tN4fymm1NJO+8
 lzqLjTdtFIh3R7qDGU9RvZuXQIOhKUOevQzsXnWpG6TsKzrAnnYyKF8GP9PtNJEa8lhB
 rhC3Bsnp/WO8Pci5bXoQ4v4cpH8daxfeQm4lPQ4VMkT/HwgHchHGZPO7SMlStgzn3xGV
 r2k6LY2moNkbp9eed419XeaqxcxH3O/tt8ddZJ7MybNvCtGkdsMzcIWAsNvHK0c6G2xH
 k/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983294; x=1719588094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4AjgM1lONumiIAH3nlA15QCd+ve3cOFFHpjhMZ1Fplo=;
 b=ud++StCYBGMroJ+6bYb8EBgxSy3MsKC7bK9cTzDi/ZhJ8Uc0Et5uqGt6BlEwoemZA3
 G4wN8iihQNIbuv+t1P07NeESVllalbxs+UcdGmNBNhavr3kD2iEpNllrDrspElPfQIwG
 QI4BnJTVhMyAF+6Xq4ZpfD26JHemQxaT7IBEt15FRVDDcdOMwiX55+b+TLbrnsXrZsVR
 cAHxcpOL+ire+sfdJhBcP36q4LrlhSqy1L+1IWGkGUyRN3tBO/x1nWNXxXUn19kEFRU9
 FdUJtX4S+nKoPk8E7Oh3kqQqHBoeVFTnFCDhwgFE8+CGxYTyT2ve+ojIWdGZzqQR1jUN
 NoxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw1RiM/RcWbcJYkdZUy7utvYeIYnfeFhlbX0WCk0K/7dibRNMn/C0GJOD86XqKSyPYls7hqOkBX7flOG3b4+kWaMXixyfZtL61uCppwv64
X-Gm-Message-State: AOJu0YzbUNnP1PlpXt7slzx0Sw05Z9M7TCuAwf90KK+v0A+wVTJ57Ui7
 07FPhJjIJGWkUMCsm0panKkxM4BoVcnmwhusBg+2TMQbbBV8SpGvHfXfBD8iicoAPA4g2ZLuD0t
 V52yz3BFdnUUvi9EQRKimvK6uvDevesNk
X-Google-Smtp-Source: AGHT+IFWEE2kemD04rCtVlXv6umZ1pXzZZuvIDrZ6Ep8wl4KkywMKID30pbJD1ElTI1b386h+/7ZLY/JRcpq
X-Received: by 2002:a17:907:a649:b0:a6f:bfb8:1ccb with SMTP id
 a640c23a62f3a-a6fbfb81d45mr496112066b.50.1718983294066; 
 Fri, 21 Jun 2024 08:21:34 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf485fb8sm5556466b.100.2024.06.21.08.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:34 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 06/31] drm/vc4: hvs: Set AXI panic modes for the HVS
Date: Fri, 21 Jun 2024 16:20:30 +0100
Message-Id: <20240621152055.4180873-7-dave.stevenson@raspberrypi.com>
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

The HVS can change AXI request mode based on how full the COB
FIFOs are.
Until now the vc4 driver has been relying on the firmware to
have set these to sensible values.

With HVS channel 2 now being used for live video, change the
panic mode for all channels to be explicitly set by the driver,
and the same for all channels.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 04af672caacb..267c9fde7362 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -951,6 +951,17 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 			      SCALER_DISPCTRL_SCLEIRQ);
 
 
+	/* Set AXI panic mode.
+	 * VC4 panics when < 2 lines in FIFO.
+	 * VC5 panics when less than 1 line in the FIFO.
+	 */
+	dispctrl &= ~(SCALER_DISPCTRL_PANIC0_MASK |
+		      SCALER_DISPCTRL_PANIC1_MASK |
+		      SCALER_DISPCTRL_PANIC2_MASK);
+	dispctrl |= VC4_SET_FIELD(2, SCALER_DISPCTRL_PANIC0);
+	dispctrl |= VC4_SET_FIELD(2, SCALER_DISPCTRL_PANIC1);
+	dispctrl |= VC4_SET_FIELD(2, SCALER_DISPCTRL_PANIC2);
+
 	/* Set AXI panic mode.
 	 * VC4 panics when < 2 lines in FIFO.
 	 * VC5 panics when less than 1 line in the FIFO.
-- 
2.34.1


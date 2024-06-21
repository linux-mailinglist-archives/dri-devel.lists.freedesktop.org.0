Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B50912972
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240C310F200;
	Fri, 21 Jun 2024 15:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="BdLB5mf3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f100.google.com (mail-ej1-f100.google.com
 [209.85.218.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9D510F1EA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:40 +0000 (UTC)
Received: by mail-ej1-f100.google.com with SMTP id
 a640c23a62f3a-a6f1c4800easo243736366b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983299; x=1719588099;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fEZOg49GL3FF3QmzlOFkIEj8om0DVPg2ZCP26GJJ2yI=;
 b=BdLB5mf3Lzz+8saEt1rFXmaaKvK37AT8CrvADl6621rXqAOiKsU96aaAZrxwYuHlvk
 YUTMmQ7LWTmcdzZeHkAXYhQG73/xFcSkSRSKHdZRTRsyGumErwmE2N7Bc0F2W6V0TL2y
 CdGCGpy9BjaFMqx/KThli/C8kAvsrJY4NfjzmvC6bmWtmyjHLcDJ7o2xAEISu/EqJA7J
 Lgu6Qz5CqneYppML4yEIyLJu2Krx8KM6aG3LqS4YeDSwy6le11xyUQuUxXgrxFXgVMKH
 Uh0K4ycQcwOM+lgLqBmGd5wceXSnIbcNYEIp8bIyf/6RVKrvsdzBacF6Mi1yYGIsLZAr
 WZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983299; x=1719588099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fEZOg49GL3FF3QmzlOFkIEj8om0DVPg2ZCP26GJJ2yI=;
 b=lPcZyFD+rrbVf+smepawR68QX0fGzk0P88J2iTaVftFnCqnH4tfA2MI33C7FqAjwgn
 kjQVGdwzNSA3qkoHICMqUXgumJP+XWE2fFJGBBXYdvYPeVwAzOSrJTA9aUi0t2NpNSJT
 fY0IJ0SmjouPmIeKShJ3YKkHorEgAgm77VdvsHIQieO5BJKiZ1zH8mgLdWRRuo5ev1Io
 ERPjuE5Fa7P66vsryJdQM8H4iMQc9TD6WDlAUG6GyHZANoBjn4XjU3t3JfuumnqhQ3OI
 S4a3V9DcWwjtdpsbGi0JDc8upKESCbNsdfB48YpcPHChSw+sp1p51Al4/QD1uxlDYOod
 tEhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVmkozyswb3okSJlNuUlit5EVMSuBT2sNzT76/6W2J6VLQQ/VD59U7NOyh6ObdvAGl8BBFbEsfCsv7BhDq8Pn1CV4JANpLe3kKmuBNx0j9
X-Gm-Message-State: AOJu0YzidMtxC/J183zrqgtPj018Ampb3VRtcwkXY09UqnArfKUADwDw
 fDMbSqMDD8p8qmUk4jk1X6oP56USjDQuUgfVvsJRZDnOly1pBjL1dCH0EnR0QsGafSyq1EVbP+S
 pX90MMT/UlBwjoouT5cC0kYQ+/3FWR6h+
X-Google-Smtp-Source: AGHT+IEMMkQrY1L+KTc4xeec4ECP87zcBwmoTjXIR+160U1+viZcpzXXQiWxxAZONiaMtOkCC9gRwegQ3M8k
X-Received: by 2002:a17:906:99cb:b0:a6f:63c7:3083 with SMTP id
 a640c23a62f3a-a6fab60bb2amr661356166b.13.1718983299348; 
 Fri, 21 Jun 2024 08:21:39 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf549514sm5477666b.168.2024.06.21.08.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:39 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 15/31] drm/vc4: plane: YUV planes require vertical scaling
 to always be enabled
Date: Fri, 21 Jun 2024 16:20:39 +0100
Message-Id: <20240621152055.4180873-16-dave.stevenson@raspberrypi.com>
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

It has been observed that a YUV422 unity scaled plane isn't displayed.
Enabling vertical scaling on the UV planes solves this. There is
already a similar clause to always enable horizontal scaling on the
UV planes.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index d078a2d21eea..4cd1721d2389 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -517,6 +517,12 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 		 */
 		if (vc4_state->x_scaling[1] == VC4_SCALING_NONE)
 			vc4_state->x_scaling[1] = VC4_SCALING_PPF;
+
+		/* Similarly UV needs vertical scaling to be enabled.
+		 * Without this a 1:1 scaled YUV422 plane isn't rendered.
+		 */
+		if (vc4_state->y_scaling[1] == VC4_SCALING_NONE)
+			vc4_state->y_scaling[1] = VC4_SCALING_PPF;
 	} else {
 		vc4_state->is_yuv = false;
 		vc4_state->x_scaling[1] = VC4_SCALING_NONE;
-- 
2.34.1


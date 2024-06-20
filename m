Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6DC910A86
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6D810EAB0;
	Thu, 20 Jun 2024 15:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="F0iavYbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f100.google.com (mail-ej1-f100.google.com
 [209.85.218.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A847310EAA1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:52 +0000 (UTC)
Received: by mail-ej1-f100.google.com with SMTP id
 a640c23a62f3a-a6f176c5c10so124111966b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898411; x=1719503211;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fEZOg49GL3FF3QmzlOFkIEj8om0DVPg2ZCP26GJJ2yI=;
 b=F0iavYbTkgDk3yI29ryb2OL46fyZ7PbCOr/AhmCJkHInliFlMiVZBOD4LWeJnELIak
 To1moEWieCRWZXaZRiv0F6dHDAop8vullUtozbGI3vFt5HI9assKVGLLLpY9i8txkoAf
 R1NqX3BkfwoQzRG8I7s3gwmbQoUIUiN5FeYJ8eUifzjF6wm4t/+BVmXOYQ/GPAHMmXYo
 cVx6yxHGNvQf+NR/G2jjQ9p16clHAkBIsnuu3FWYzzMmie76tyzp5OJQI2awO4RtbEeI
 jhaez6nKLG13ptsbiSHxCqpEMolVtr227bHbZDk3DqnE9gJ4F7Zric4NjZpIMDbo2jvz
 mcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898411; x=1719503211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fEZOg49GL3FF3QmzlOFkIEj8om0DVPg2ZCP26GJJ2yI=;
 b=IoS2bR+ydTjl1zHiMWFnOlEUThlLqRqTbLHCB4l9RY9TmPNMBOL7CZP/jtz//nqkVC
 PLLq3X7djtRZeZQHL2x10ZNk0L79Kn+qvKm7oz6hkV7SRi/45W7H8E2uUdR577joI18X
 ZS2MNgBYQEat7VOBhJSAFLCkWIRZUBT3x4yI680xGryozuelIEKx/CjQC4Kbqu/F5CZr
 1KOPvlYplwuewJXbGKPdHYgHiZZ/EtNTwXMdawctDjOorD8dMY7gKMMmxHtRsSZ6r6zD
 ssLLjkoerCQ0q2Nvdah2p9WR+15foED2HRd8bwvjxTlVphelon+v7pg0FC0yBY4bxNcs
 gvZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB8jkk/0y+6mOipbjLBbi6o9WGmQI8Ss6/8NBMOTl64jEqTqH13vRQu9bve9ph29El26Om1sFhxPyG/RK37Du+BGxFcarTPv9+8oWxxGRE
X-Gm-Message-State: AOJu0YyUkYKoqIxKwHtGvLaa0pY0hBj/EP0lBW6GKAAQj+Kfg7LdUL8h
 TeErXdEQnpkO4DdBcvUUg7bSl0TgR9k4HuD0y1i9YD/LYQe+Q/feU3v6rOy8XKMygnyfVU+CYcr
 ZDIFRLiZqKCIUU1TwowIKghw8eXQlW2Ng
X-Google-Smtp-Source: AGHT+IGBrcJZYoP7fH5ml/AuoDoR3wlkBpSblj4N1KiMMjBJgFIR93aSaFLqICUWQgH/NldOf5fbTOySmYNK
X-Received: by 2002:a17:906:f902:b0:a6e:feb5:148e with SMTP id
 a640c23a62f3a-a6fab6171f0mr351108466b.27.1718898411082; 
 Thu, 20 Jun 2024 08:46:51 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6f900cba4fsm17716766b.91.2024.06.20.08.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:51 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 16/31] drm/vc4: UV planes vertical scaling must always be
 enabled
Date: Thu, 20 Jun 2024 16:46:17 +0100
Message-Id: <20240620154632.4125308-17-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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


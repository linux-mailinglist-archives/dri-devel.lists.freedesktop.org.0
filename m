Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDD8AAECD7
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E87610E89F;
	Wed,  7 May 2025 20:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PDMoa9lL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EB710E89A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:32 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-72c09f8369cso98915a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649351; x=1747254151; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d6UX68KruPGnR61q1oninfcr4e5yK5hNeU8tagVAmo0=;
 b=PDMoa9lLlE+2denUYKNyaxdXCFRgZ8G7JclC5m6lxJb/k2LvwC+wUm46HgsrCfOb0V
 4ng1uh4LUlyud3+0AvvlKB5/hvQqWRC6SA5B84K710tUnlhGWxf6O80wbszG4EenuHZL
 IQjanNvHm5HdeOTU54eQsUgh21AhaBhqALjrWhrAeVpCLkaA04vsR2vw8yy70b/Z5o4+
 hpiB6NadjajuM4HRMPhzrXqlgBuQlECZ5TP7e+d6e8B5C/jpKM104hMMJ0NehfQ7wqBy
 MNI8z7tE0XLVefQT0POX4o6Eaa3oXnvJzIE6g0wYoUZEAs5JMsJ3DAhrL4BU2zMBBIC4
 XbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649351; x=1747254151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d6UX68KruPGnR61q1oninfcr4e5yK5hNeU8tagVAmo0=;
 b=b5fWKpUizWrS8C/1wSbxdY1izCt+3H6xaa1RHrfGSFmpti65/slyrLloaO9yYs1pLb
 68/dPRq4XYkrR8FyMv99KchkiobZ7BUyBYFUi52xDWnXx9GcVKvK1ZqcAa4gAd1zT7Zr
 Ou9JmnX4vbiXpDHu0y5hS35i9XAhdWlfR0w4EG8CBy9buSAEZa/kZvje57QeF2PaGfLt
 BRcC9JsvWjABm7Zk0QNt6iepk/Ma6ntLR4ZRji+6f5nRDJwflo4htlkZSYfBKAoeYQig
 s85AHKbFLatVLYefBBFMvJxgydX6gCBoQ5MqaFPWeRW04u5mIxCanhXOfCWRmhidU8/G
 kjEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2k+juMakDHgk0DCtFuW8EJnDBwU9cVj5D5fL3WWLFx363X5ekldlfo6gKayqA/IMUxNlmsl1gbLU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx10j/ZlIY3YotaWbJi43+2i9u2E9BHslMTN0SogMl6dcFFfTVp
 pyG0uoWQmrj0+xbSM8cU7YMIT3BK40DUO6inqnnX1j8p0rDJnCwM
X-Gm-Gg: ASbGncuUUzRgt+DCUkKzeQRbXYPOuTxYBguI7tqqj0E10mymSSYrXG+az9JkPKFuq8Z
 2BN+cLcwD6C3LBWRfu+JaZ0x57PJQqRJmTw1JdFeqHY0PqGv83b3Hfp6v0BU8aSb4hJvGRB5RMp
 E4sQxoznoIjnp5DulzfARqAv1B9isSNMoGEUWeAppmfvTmpsS4iK7t1QovmmIFkJk6inRWL5/MD
 iAXzb8gXNBh+L3INVu1Fm0qcdwOxp4Cmhz7U8ecrGu/r4fCbRrcU52bAciXBXDIhBo0SQ6UgAuS
 4BuxodSQhoZ01R4Z7/i51EtXMDEnXobTddibrfts5s5yyzKYY3vChdmrezNt3GcsAMH53Ok=
X-Google-Smtp-Source: AGHT+IGPGpn615U0r/Oli0xmd+gPDn6qmrBYBvqajhJLToKFTwGprcGZAZPK+hG5gePgwhRtCLZmSw==
X-Received: by 2002:a05:6830:6216:b0:72c:3235:3b99 with SMTP id
 46e09a7af769-73210b11cb2mr3068146a34.19.1746649351312; 
 Wed, 07 May 2025 13:22:31 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:30 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 05/24] drm: sun4i: de2/de3: add generic blender register
 reference function
Date: Wed,  7 May 2025 15:19:24 -0500
Message-ID: <20250507201943.330111-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The DE2 and DE3 engines have a blender register range within the
mixer engine register map, whereas the DE33 separates this out into
a separate display group.

Prepare for this by adding a function to look the blender reference up,
with a subsequent patch to add a conditional based on the DE type.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 7fe5ce20082a..43c413052a22 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -217,6 +217,12 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == sun8i_mixer_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
+static inline struct regmap *
+sun8i_blender_regmap(struct sun8i_mixer *mixer)
+{
+	return mixer->engine.regs;
+}
+
 static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
-- 
2.43.0


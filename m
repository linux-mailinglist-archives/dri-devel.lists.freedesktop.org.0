Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D57C9AD17C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC8E10E837;
	Wed, 23 Oct 2024 16:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dfskfLj7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A4110E82D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:42 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4315abed18aso67276165e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702241; x=1730307041;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6vaguUe7juL1LVMz08cL6sDxAEiRfNF+JBFP9wF0Q+s=;
 b=dfskfLj7hovZufJG8+b1Om3S02t8w2nkG2iBUWz156Qj9Dvk1T+1PuBDL31nNRin9J
 XFPswiM7gHlUO+asq+KBnZuGfU9W0L3CR8lutykn1xTx0AOjB/P77vppDYvMERrZ1B6D
 IRKCdRM2ZlQH0RuznM5F2N+Fd0xefcpss6WiD3eZvNfnQxIqj+2rwV4YkmY1Yj/iLzQt
 fZdppTvSd+BXHloFPZ7NS76LhFvWLzJFjY0WsVqQvCtwsOgoyIzBCxxsZlw/AWD+/Jcx
 eQLcmkDpiJyhbznP29xDeVGgbKgKltQDepLjPbI57Q3aSo3GZabDNQkndkDm0Z5c/b8Y
 OmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702241; x=1730307041;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6vaguUe7juL1LVMz08cL6sDxAEiRfNF+JBFP9wF0Q+s=;
 b=v+smOHAcK2FjCwMa8smFiPKmHCpV5VoDrSHCFVkRFxbfgdbVGAXMKdJCwfyK9jp5BO
 W/NMqoWTBQxwZwgc70cfmaxMwRjp3jKXTeGj6p056erFWPxnoSgvOG95uKZZ27JYqPhf
 bHX3qhKN3s2uqZJZonE4RsAf3R8XW0zZk7Rkbp1lW0a5mEETSLQ8qh0ChLJA9vEUkGYj
 E2VZSAGtzhIob4xIVJMcRbZ9Dq+6qyVAG1ly6p3m4CNvgTszmyPq0v1yTMtXh1rrBVNP
 kuVndNXsnbzwWU15uyUA6HOLU4E/1BEokQMqIKvPZAyZUFa8plliWBNZTBKLkhUqcSwY
 0M1A==
X-Gm-Message-State: AOJu0Yw/X5JUZ1K5c+lxpIHJLO++e8EvCZId6jQYjMbTy9RKI9nI0omM
 vP6zhNEK2NxSgqgyzECGLe0nTfD8MxeIlh/LkhT3WTk9XCdN+CUq10gMo2H7DRM=
X-Google-Smtp-Source: AGHT+IERYOndgW/udDrkKTC0Se/KUmNKFRwzDAk4TOKT6h49ITwfBkIc/0nZV6Akai4GqaHXpM9b4Q==
X-Received: by 2002:a05:600c:511c:b0:42f:823d:dddd with SMTP id
 5b1f17b1804b1-4318423b856mr23693165e9.27.1729702241069; 
 Wed, 23 Oct 2024 09:50:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:40 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:23 +0100
Subject: [PATCH 26/37] drm/vc4: hdmi: Support 2712 D-step register map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-26-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

The D-step has increased FIFO sizes of the MAI_THR blocks,
resulting in changes to the register masking. Add support for
it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 19 +++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_regs.h |  9 +++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 95ef8bbe6439..6fcdd1c247d2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2128,18 +2128,33 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 					     VC4_HDMI_AUDIO_PACKET_CEA_MASK);
 
 	/* Set the MAI threshold */
-	if (vc4->gen >= VC4_GEN_5)
+	switch (vc4->gen) {
+	case VC4_GEN_6_D:
+		HDMI_WRITE(HDMI_MAI_THR,
+			   VC4_SET_FIELD(0x10, VC6_D_HD_MAI_THR_PANICHIGH) |
+			   VC4_SET_FIELD(0x10, VC6_D_HD_MAI_THR_PANICLOW) |
+			   VC4_SET_FIELD(0x1c, VC6_D_HD_MAI_THR_DREQHIGH) |
+			   VC4_SET_FIELD(0x1c, VC6_D_HD_MAI_THR_DREQLOW));
+		break;
+	case VC4_GEN_6_C:
+	case VC4_GEN_5:
 		HDMI_WRITE(HDMI_MAI_THR,
 			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICHIGH) |
 			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICLOW) |
 			   VC4_SET_FIELD(0x1c, VC4_HD_MAI_THR_DREQHIGH) |
 			   VC4_SET_FIELD(0x1c, VC4_HD_MAI_THR_DREQLOW));
-	else
+		break;
+	case VC4_GEN_4:
 		HDMI_WRITE(HDMI_MAI_THR,
 			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_PANICHIGH) |
 			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_PANICLOW) |
 			   VC4_SET_FIELD(0x6, VC4_HD_MAI_THR_DREQHIGH) |
 			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_DREQLOW));
+		break;
+	default:
+		drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
+		break;
+	}
 
 	HDMI_WRITE(HDMI_MAI_CONFIG,
 		   VC4_HDMI_MAI_CONFIG_BIT_REVERSE |
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 0046bdb7ca32..27158be19952 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -987,6 +987,15 @@ enum {
 # define VC4_HD_MAI_THR_DREQLOW_MASK		VC4_MASK(5, 0)
 # define VC4_HD_MAI_THR_DREQLOW_SHIFT		0
 
+# define VC6_D_HD_MAI_THR_PANICHIGH_MASK	VC4_MASK(29, 23)
+# define VC6_D_HD_MAI_THR_PANICHIGH_SHIFT	23
+# define VC6_D_HD_MAI_THR_PANICLOW_MASK		VC4_MASK(21, 15)
+# define VC6_D_HD_MAI_THR_PANICLOW_SHIFT	15
+# define VC6_D_HD_MAI_THR_DREQHIGH_MASK		VC4_MASK(13, 7)
+# define VC6_D_HD_MAI_THR_DREQHIGH_SHIFT	7
+# define VC6_D_HD_MAI_THR_DREQLOW_MASK		VC4_MASK(6, 0)
+# define VC6_D_HD_MAI_THR_DREQLOW_SHIFT		0
+
 /* Divider from HDMI HSM clock to MAI serial clock.  Sampling period
  * converges to N / (M + 1) cycles.
  */

-- 
2.34.1


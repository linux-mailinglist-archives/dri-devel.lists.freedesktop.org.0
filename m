Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97F7AA9BC5
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 20:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC38610E118;
	Mon,  5 May 2025 18:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QFCwcvG/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D9910E118
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 18:43:46 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7398d65476eso3836466b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 11:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746470626; x=1747075426; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yQzbmjudt+hJvG7n8NMoirGU7KRPkcRToJ0JJSw35CU=;
 b=QFCwcvG/98NH9VeYrQbuatk5f4AwtnCA4symFldm5KwNZFPefF7BXoe7nZruV15wBR
 gOuhjRapgCcftw7SVhDnb/8BpgFjdxSCQ8KRAA7Py/U2NdDUVCGR9QfK6tL44yzClLBU
 /DMmUqgNuY4uTQfkAsOIdNMAPU6MmCQYv0yL8pLJGkhClTZUD0FuRYj0K/dg6uHauD0x
 2WTB/LTgcVcBhMholoxoi80GUIdvhBMfa9MrlNmbhmnt4ZENVz5h0sK65c6zUCbzMkdB
 EZZij+vwl7/BiKkwdIN5eNfyspcyn13T8W7/CBWvXJV7c4YIBz8wcsNiiuX+KGUtt+uf
 6/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746470626; x=1747075426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yQzbmjudt+hJvG7n8NMoirGU7KRPkcRToJ0JJSw35CU=;
 b=jhuL7qKrSSJozqjy7U8QPkMkG8o3FhBL6LfYY5keBbkE55fUkUdn9bb/ztvbWqSiBc
 X9mZYIK4TZ97U7BRm2+/91z28MWw1xb8qc9zo/b8+J2u9Xal37Zv9biMvhw/fo8XLHEX
 dStdCtKly2vWX0l8mj4AtcCPkNYEtyhVsOOxl4IDn3mxoBMBUqqw6OHSrjomroD2HDEL
 yNGS5DAIQWosoOs29lJr9FXoh3bhqdg5nmN5/2QLkHu6lfkkyRLiBApm2fP7LgzMmUU9
 +A5aLMyuCH0yEq5U28E7AYxyK0Ld5tPMJBmHU9tGwp+WhrQH11mWI0/YuZuvVxjlWNrg
 0fIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG46yU3qan9HGh4PewqGJ62jmcgypuN3NljVcRjXy6G9kGljFm3ra6GMlXd0mZ4BG9ks61gwtALAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxeazse5USLVgPNBrhMV+jbBD0tVXkbSFXpyKdO2cATJ/bt8ZxR
 cxpqbDSOxvdSy44sg476KS6PfiBf0RCH9u9RT3C9ECZKaDuw1CMY
X-Gm-Gg: ASbGncs6CxOrrGgjN+C6Xy7T6Uel3ZxUVeMPqgg1zocuioCIJuJlylBsazOg7MeqFHD
 6WF5SRI4CZEbhovTR72BJv4Uk+FKU8793ac0N2dBoD9rvaLU7XA7OvewFPcEpNTafwfZ+ssHN03
 uz0RVbRBCFad4CYb6ispgTlfFG/+SNagxXtng1kjxPOsEcCiwo9Zl+3CKNC3ZPBYEnQaR0lKnbf
 5jhwIbJfJppxJjy2Z9hmfRUKG7zkjqIS4vtBV+ZDRY7yMokVoQ8hx9OQ0QLHWYgyYllqYxK2A1b
 xZL87TUYR4+JZCZaDVlIPlvMgT3BZmqi1ZCrV0Rg1Fu1s8ecKZrUvXuY4gdLs73rC2mCfw==
X-Google-Smtp-Source: AGHT+IGMBauXSP9NfIaQaM7+UUg7ZcaSiDMXtLxYknxQzEukhYbTe1ekmAy1F/1+blL1smz9X2PsTg==
X-Received: by 2002:a05:6a00:1308:b0:73d:f9d2:9c64 with SMTP id
 d2e1a72fcca58-74090eb4df2mr813280b3a.10.1746470625673; 
 Mon, 05 May 2025 11:43:45 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB..
 ([2001:288:7001:2703:afa:5db4:54e4:f59c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7405902167csm7433788b3a.98.2025.05.05.11.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 11:43:45 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 christophe.jaillet@wanadoo.fr, skhan@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
Date: Tue,  6 May 2025 02:43:38 +0800
Message-ID: <20250505184338.678540-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Coverity scan reported the usage of "mode->clock * 1000" may lead to
integer overflow. Use "1000ULL" instead of "1000"
when utilizing it to avoid potential integer overflow issue.

Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
Changelog:

v1 -> v2:
	- Use 1000ULL instead of casting the type of "mode->clock"
	- Refine commit title and message
	- Fix the issue for the evaluation inside drm_mode_status
	  meson_encoder_hdmi_mode_valid() as well

Christophe,
Thanks for your review and your suggestion, I think I should add a tag
for you,too, but I'm not sure what should I add, if you would be so kind
please let me know how should I tag you in the patch.

Best regards,
I Hsin Cheng
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 7752d8ac85f0..c08fa93e50a3 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 	unsigned long long venc_freq;
 	unsigned long long hdmi_freq;
 
-	vclk_freq = mode->clock * 1000;
+	vclk_freq = mode->clock * 1000ULL;
 
 	/* For 420, pixel clock is half unlike venc clock */
 	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
@@ -123,7 +123,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 	struct meson_drm *priv = encoder_hdmi->priv;
 	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
-	unsigned long long clock = mode->clock * 1000;
+	unsigned long long clock = mode->clock * 1000ULL;
 	unsigned long long phy_freq;
 	unsigned long long vclk_freq;
 	unsigned long long venc_freq;
-- 
2.43.0


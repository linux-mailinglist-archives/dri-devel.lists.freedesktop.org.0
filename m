Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB5F7F5B6E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6266E10E707;
	Thu, 23 Nov 2023 09:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F50C10E6FB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:40:57 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a03a9009572so79635966b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 01:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732456; x=1701337256; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4GQVLU0yIdzvkWpe6EOtR/8b+D+v0ZubEgK+LbytqFk=;
 b=hdH0BUYp+NFnCcpM8pSFCbg3tD4NFgrqkbSE+PdPJtVmD3Jzfe3DU1Nmd1UYsQWlaq
 mSnUAsJBUxsbBjr0jtmz6XTzOVRpqpUu2l2h3R4HCVqrzeRjJd6RvLzUUuD6V5M4TLZ/
 AusoUG13Fgne4lTJl0IByAzYOPDGt/ZlIBKmY9nUfVSNFNnI0m6XYsMJCIPULC3AL6jn
 HZvxRhU0YkJp1pVz0rrrKT8ldoFR8j3SQIB7VUrYNjc36srj+tW0Fa7TZwlaL84Yedlt
 WUpmu2USZKZE3/0R+dREmaf1a0gV88HfIE6XpKGTr7Fm+vEzimEDLs4Z9MGFT+tgnI33
 KPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732456; x=1701337256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4GQVLU0yIdzvkWpe6EOtR/8b+D+v0ZubEgK+LbytqFk=;
 b=hu9afBoEHfJUfBukjehPdXl/FstHrfNoDOtKV3C2INE4GBiG3ur5wce7K1Zjjonb+x
 wM3MEeZlFElfP7hI//gy5flF0w6LcK9jbJ/wcHL96+7WGVWoZpeTWAGmhwTH88ZO77Ob
 k9RoWnwbOCspmDS49Rng80bjVkm24V5Ns6OHg7swO7fZXUZAi32GR9dpYEom7iq9kaYD
 zHKyvaumgz7IZgF36obh/ASdHNAAehqPuFyLi968EhVf7JFaDfz5nP9PoUpL0bFnCBL+
 UybIij0j2GVXTT7/zfnAB3MLlkBgItw9J2wcieed8oUdst/hPll1IgXHJqTO8aUeXeUs
 xYzQ==
X-Gm-Message-State: AOJu0YxfYSuiiZ/kc+BBEctlVWKyTIs8Ik65Y1fsOHJRtZfcDv8zIMqa
 JUuRHF/BjHRNn9NySDIBi7XqOVwG89Y=
X-Google-Smtp-Source: AGHT+IFW7oGp/sxqiNU9T6YyLWfXmVFxlR+ROFim07r/08bufC+IIaX6Uvxyofr/jhfjkQUrN3Ji5Q==
X-Received: by 2002:a17:906:1855:b0:a00:8706:c82b with SMTP id
 w21-20020a170906185500b00a008706c82bmr3269223eje.47.1700732455722; 
 Thu, 23 Nov 2023 01:40:55 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:55 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maik Broemme <mbroemme@libmpq.org>
Subject: [PATCH v5 13/20] drivers/video/fbdev/intelfb/intelfb_i2c.c: remove
 I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:33 +0100
Message-ID: <20231123094040.592-14-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Helge Deller <deller@gmx.de>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/video/fbdev/intelfb/intelfb_i2c.c |   15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/video/fbdev/intelfb/intelfb_i2c.c b/drivers/video/fbdev/intelfb/intelfb_i2c.c
index 3300bd31d..f24c7cb4c 100644
--- a/drivers/video/fbdev/intelfb/intelfb_i2c.c
+++ b/drivers/video/fbdev/intelfb/intelfb_i2c.c
@@ -99,8 +99,7 @@ static int intelfb_gpio_getsda(void *data)
 
 static int intelfb_setup_i2c_bus(struct intelfb_info *dinfo,
 				 struct intelfb_i2c_chan *chan,
-				 const u32 reg, const char *name,
-				 int class)
+				 const u32 reg, const char *name)
 {
 	int rc;
 
@@ -108,7 +107,6 @@ static int intelfb_setup_i2c_bus(struct intelfb_info *dinfo,
 	chan->reg			= reg;
 	snprintf(chan->adapter.name, sizeof(chan->adapter.name),
 		 "intelfb %s", name);
-	chan->adapter.class		= class;
 	chan->adapter.owner		= THIS_MODULE;
 	chan->adapter.algo_data		= &chan->algo;
 	chan->adapter.dev.parent	= &chan->dinfo->pdev->dev;
@@ -144,8 +142,7 @@ void intelfb_create_i2c_busses(struct intelfb_info *dinfo)
 	dinfo->output[i].type = INTELFB_OUTPUT_ANALOG;
 
 	/* setup the DDC bus for analog output */
-	intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].ddc_bus, GPIOA,
-			      "CRTDDC_A", I2C_CLASS_DDC);
+	intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].ddc_bus, GPIOA, "CRTDDC_A");
 	i++;
 
 	/* need to add the output busses for each device
@@ -159,10 +156,8 @@ void intelfb_create_i2c_busses(struct intelfb_info *dinfo)
 	case INTEL_855GM:
 	case INTEL_865G:
 		dinfo->output[i].type = INTELFB_OUTPUT_DVO;
-		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].ddc_bus,
-				      GPIOD, "DVODDC_D", I2C_CLASS_DDC);
-		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].i2c_bus,
-				      GPIOE, "DVOI2C_E", 0);
+		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].ddc_bus, GPIOD, "DVODDC_D");
+		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].i2c_bus, GPIOE, "DVOI2C_E");
 		i++;
 		break;
 	case INTEL_915G:
@@ -176,7 +171,7 @@ void intelfb_create_i2c_busses(struct intelfb_info *dinfo)
 		/* SDVO ports have a single control bus - 2 devices */
 		dinfo->output[i].type = INTELFB_OUTPUT_SDVO;
 		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].i2c_bus,
-				      GPIOE, "SDVOCTRL_E", 0);
+				      GPIOE, "SDVOCTRL_E");
 		/* TODO: initialize the SDVO */
 		/* I830SDVOInit(pScrn, i, DVOB); */
 		i++;


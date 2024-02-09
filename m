Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B93850039
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 23:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB9010FF2F;
	Fri,  9 Feb 2024 22:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RQMcaaN7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48A910FF31
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 22:52:05 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-40fd72f7125so12074655e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 14:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707519124; x=1708123924; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uOei1E7ZM7D5N46bTKXPAEYB4hzDHWnk0bYk8U2DD4M=;
 b=RQMcaaN7JkC5rUmIzGCbLMVQvKGItmxwmq+E0JAdF0iwNhlJECl8rJ0X4lWRQMaTvo
 KAWTLxLMFb4Jo7lh1Zqvy1it5zZYM5XpjhNqbvp6VatAr3xehBUU1B+L8SWX1cYI//nl
 iIWR93fA+vSM3o18U6CDVqtrEX2LImAO1RqDM/lGtbsE5v54k2ceZmmBTwRjGvTistX5
 83pdrI053Ecsw4w2+AzSrRFd91j5M4oILNLrlv6hXyx0v3GgkD962hFPsSzTtyhnR5PK
 fqUUDPbQ+VPAU6ORgUgW516J/LXB357kCdCOOtwqGR3GD3Vrti2X6QYS+qAzydPKvgxz
 ONCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707519124; x=1708123924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uOei1E7ZM7D5N46bTKXPAEYB4hzDHWnk0bYk8U2DD4M=;
 b=WpLQKCVH8YiEx+p0JJ8R9oHVYiOuH2HS+MgeVt4/qHC1XpCOG5m8wOT3dBUHHtYgc4
 hTdqLIEDwES63/QVbLK/feP8md775cUKv4YtMq+yyUMTWrvRO4ymt4y4AXKMvZf7NbUd
 lVnsxaj8DwnVCh9P++wulX1R3MiV3Ca82FUHjhJ0e08Uhpds2ca8aCGiHudKPgG5CJ8X
 X+F5PKAxfmr3utP1iMuLaVnddVFBk9jAww+d/2X+8BhUEYNe1h4NmArgohygA780JRez
 UsMEHZDiPjiFJFfYqrPppWVtuKykYqciX4E19FVUXErcqTsjq4mOSKIVk2d0gPvH7blZ
 jlnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU++VGhfUQH+irs7DQzvQpYDN7CO/24RTQa/kcMkpYEabm+ZyyZQo2YfyWFO1OuoN42NIKY4/zN/Hf5AaL5RV+SqTn/26qYfeTKnbliJwIb
X-Gm-Message-State: AOJu0Yx0juMGcuu+jGKgWIkIMFK8j7oAoRsNE+Zg7aprgPIzpKfmFZq/
 JJBQ+AKeNW2Di+dBX9Kkt3IOYbBynYEN7jnBrPw7jmpo95IrjDzT
X-Google-Smtp-Source: AGHT+IFHeZh/jz++qTdpV3FfEdbdhwrAGcqEr3azfNWd5sc+6+HVIMi7/Ho2cEKSQVL69fbJQBs/Qg==
X-Received: by 2002:a05:600c:6027:b0:410:7d76:de10 with SMTP id
 az39-20020a05600c602700b004107d76de10mr484122wmb.28.1707519124093; 
 Fri, 09 Feb 2024 14:52:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW1Zp7hBG/A3IsQXf1hQ1fqjgvk7/hNHhcwlYEPkRGQzm0R6K/xxIOYbX3cjwdsixBunk+I6RJTRFO71aWWNYQtdnn1LDXbtmxdQedqLgTtlcbuCestasyHGxaej1hA7W19pbBvdj0vlWp3xWG22QhormLtbIyDFawOE2s1MonzJiDsQEzWAmmMZw==
Received: from Hacc-ARM64-PC.. ([2a02:908:4f4:84e1::1051])
 by smtp.gmail.com with ESMTPSA id
 1-20020a05600c024100b0041061f094a2sm1792838wmj.11.2024.02.09.14.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 14:52:03 -0800 (PST)
From: Ao Zhong <hacc1225@gmail.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Morgan <macromorgan@hotmail.com>, Ao Zhong <hacc1225@gmail.com>
Subject: [PATCH v2] drm/panel: st7703: Fix Panel Initialization for Anbernic
 RG353V-V2
Date: Fri,  9 Feb 2024 23:51:00 +0100
Message-ID: <20240209225100.44493-1-hacc1225@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAG9e_p28w1vzR_Z3W-F8N4+W5MkQ75msr9UK1n-0MOiK=rgsWg@mail.gmail.com>
References: <CAG9e_p28w1vzR_Z3W-F8N4+W5MkQ75msr9UK1n-0MOiK=rgsWg@mail.gmail.com>
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

This patch addresses an issue with the Anbernic RG353V-V2 panel
initialization that was caused by incorrect parameter. The correct
initialization sequence was derived by referencing the JELOS (Just
Enough Linux OS) BSP kernel's device tree for the V2 panel, which is
identified by the ID "38 21". The relevant device tree can be found at:

https://github.com/JustEnoughLinuxOS/rk356x-kernel/blob/d4d7335a5ca18fc216a29712d5c6cecfb86147d2/arch/arm64/boot/dts/rockchip/rk3568-evb-rg353v.dtsi#L582

The proper initialization sequence was further informed by dissecting
instructions as outlined in the "Rockchip_DRM_Panel_Porting_Guide",
starting from page 18 of the document.

https://web.archive.org/web/20240209211932/http://download.t-firefly.com/product/Board/Common/Document/Developer/Rockchip_Developer_Guide_DRM_Panel_Porting_CN.pdf

Upon comparing the initialization sequence within the
rg353v2_init_sequence function against the device tree in the BSP
kernel, discrepancies were identified in two instructions. The relevant
instructions in the device tree are:

1. 15 00 03 b6 7f 7f corresponding to the ST7703_CMD_SETVCOM command
   with parameters 7f 7f
2. 39 00 05 b8 26 62 f0 63 corresponding to the ST7703_CMD_SETPOWER_EXT
   command with parameters 26 62 f0 63

Adjusting the parameters to match those specified in the BSP kernel's
device tree allow the panel to initialize correctly.

Signed-off-by: Ao Zhong <hacc1225@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index b55bafd1a8be..a346d6c3d283 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -357,8 +357,8 @@ static int rg353v2_init_sequence(struct st7703 *ctx)
 			       0x28, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
 	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
 	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x0a, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x92, 0x92);
-	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x25, 0x22,
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x7f, 0x7f);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x26, 0x62,
 			       0xf0, 0x63);
 	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI, 0x33, 0x81, 0x05,
 			       0xf9, 0x0e, 0x0e, 0x20, 0x00, 0x00, 0x00, 0x00,
-- 
2.43.0


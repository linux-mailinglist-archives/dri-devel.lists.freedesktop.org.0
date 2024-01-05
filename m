Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D77824ECA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 07:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AACC10E56E;
	Fri,  5 Jan 2024 06:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F33910E56E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 06:53:18 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a28b0207c1dso100982966b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 22:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704437597; x=1705042397; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gN9G9Kb0Ei3BRgzRKo9RDwtoeSks6/gH2+/hiv2p4q0=;
 b=I1EDux/M9VFH0XtfkZleVk9y5xowUtrqq5uKaRjhkZ+0wZ8ALDA95Y1iAsZHpm1MIJ
 mkOz+DZNUwZppjNghpNkXZUrgEa9MnU8PlwJMaPGdKdzMDrkk7ydaojthqtRdpOQQLK4
 0xJBTpv8KVttHTxccIXCLhRNm/8rtXA4WaEbMMUqhu4NpWA/SBC7BMY0fdU8mgpkOJHa
 AZtyZ72FeXmDyLz4gwUWH/5AAtkZQWvlZnvy3wgdfPK54lZD1/R0WutUnUW/WgRnEM+0
 we0ICpIxSVKOk3jB6BJVLwmLiZqcYpFwSrwQOR0FLwAZb3YDO7OyvF08cXgMziGqkT+I
 aFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704437597; x=1705042397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gN9G9Kb0Ei3BRgzRKo9RDwtoeSks6/gH2+/hiv2p4q0=;
 b=o+KKvlgioIRfuziXCkyn77MJnR/QZlG/qWHdISvK10kwZrqQuMC3p1O9+vd92BbuR9
 aFmQ+W7PTKCqbGDbu2v2mtq1TsNaOUL5eUzgKoRNYoBbSCHpw18VCjHSsulznVn9ECVE
 4P2mBjXrkaPp6nSxnZnlXcGm+durx3M/qKgYEpmW3nYc22dlHjRG4kQcmzn11SzM7TXx
 R6Yp09YHTJClUNH7o/n4SJISuNqu9vtCvCJ0OOG9XdfdbZyGUnFjl4MksTcK9RUdQR1w
 fptZTxuVNV0mJ615w5wTat1oO8lsuC3HfVMC7kNJC3harG8ElbpQ5oFxXgIOmIXIQrgS
 WAXg==
X-Gm-Message-State: AOJu0Yxb/W7gYtkm8bIn7ng5LTEnlPz0tT0V3KGWNSHFzsR1VT49YbOQ
 PxeuR5G9Uf/m8YZwqXCWwFw=
X-Google-Smtp-Source: AGHT+IESYsMQvwgG8Vjc2evgLPbZfxJkSk1hOrSDFtYcr8hG6M1PSfHIVVY+DSWVNgmznTt1z7F9yg==
X-Received: by 2002:a17:906:fa0d:b0:a18:4b1b:9522 with SMTP id
 lo13-20020a170906fa0d00b00a184b1b9522mr921754ejb.41.1704437596911; 
 Thu, 04 Jan 2024 22:53:16 -0800 (PST)
Received: from hex.my.domain (83.11.207.119.ipv4.supernova.orange.pl.
 [83.11.207.119]) by smtp.gmail.com with ESMTPSA id
 g23-20020a17090669d700b00a28e2b72db2sm518809ejs.56.2024.01.04.22.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 22:53:16 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 05 Jan 2024 07:53:02 +0100
Subject: [PATCH v2 2/2] drm/panel: samsung-s6d7aa0: drop
 DRM_BUS_FLAG_DE_HIGH for lsl080al02
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-tab3-display-fixes-v2-2-904d1207bf6f@gmail.com>
References: <20240105-tab3-display-fixes-v2-0-904d1207bf6f@gmail.com>
In-Reply-To: <20240105-tab3-display-fixes-v2-0-904d1207bf6f@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704437592; l=1183;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=zbV+r29VU46Ob/u8YrKcYcH1MdK6Qsp4rJGmvF1IAUs=;
 b=VrgBYBiZXrQxVeRGeUJTG5/9Lpc//qRFKYcfsvWONuxI8I4GIlZmC0QPmRikzgvYRGQ5U8gLD
 rcnhxSXRzcoD/ck0/wclvhBbGoIp3yABok93VCTPc8c70RJYq0/NkNd
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Artur Weber <aweber.kernel@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It turns out that I had misconfigured the device I was using the panel
with; the bus data polarity is not high for this panel, I had to change
the config on the display controller's side.

Fix the panel config to properly reflect its accurate settings.

Fixes: 6810bb390282 ("drm/panel: Add Samsung S6D7AA0 panel controller driver")
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
index ea5a85779382..f23d8832a1ad 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
@@ -309,7 +309,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
 	.off_func = s6d7aa0_lsl080al02_off,
 	.drm_mode = &s6d7aa0_lsl080al02_mode,
 	.mode_flags = MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_NO_HFP,
-	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.bus_flags = 0,
 
 	.has_backlight = false,
 	.use_passwd3 = false,

-- 
2.43.0


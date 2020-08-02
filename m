Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE77235672
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FAC6E0F0;
	Sun,  2 Aug 2020 11:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1626E0F0
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:27 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x24so1701486lfe.11
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=maHW2e0NnSMYHIlzXCYVNcTAjo21ZJ2pCny7UdG3764=;
 b=EEUgTuzJv5aeSpT4+9SfzrCN4Hq01Ca+zqBtutx65YfTjtGKBcBsTShj/Er6xY27Cm
 fnwrchks3TdsDup7J1AxOrMPqC3F3mik1FznVTLz9Ddl9dPsP+WisXkKy0vgT+nh1hBj
 9OFXINBGq5n54FlSNvez6POPbIth73y//+gz6F2cwVwii9AYN940PU38W711UJAbbbV2
 vXqpEceyFtHsf9fxiHDnetEhauyv5pd7kkuas/7YDhzLtWX9OE9f5WMBRTgANvZwC7dj
 F5OM+cvenL6Cyhg5us4EDsh4Mkji63xFCJsmynccbgG74pgQQaTJ4fACkm2OL0mYBN8V
 lhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=maHW2e0NnSMYHIlzXCYVNcTAjo21ZJ2pCny7UdG3764=;
 b=AOj/YMFH/ITVl1J5c54qD1Pde2hycL3qZyRPRAZWgQjyzUeyUhK2INYeZtnRma+/kz
 cphakrOsnultvOKOMGshPgFr9gDvXQeELaU4C2ZxH7xJWw+Gaee+IcmKu1meqYCvjj2W
 jXT8jAUnMOqLrEiC8gouvCtTzl1S2YOtM5vcTWh24ZV6aT1oYy66JbyKRwT1G3CSCeVL
 WJHvczZsJZbH2A4bWmGEuZId9HN8aoRdGZZYL1bSUhcPmpv9bHAsCDqtkmY0FerXxMFq
 2cKe88JNkHcgV3PCuwyaOKrIJws3XuV9qP1eQjewNorbpXadYZ5VotdoCxHmS7UPBYry
 trvA==
X-Gm-Message-State: AOAM532ULHnHXw18QJgMB4SpWU/KeDvYh6qceuzu6nONwKn91tpnsZGZ
 TMKjXGMswHMssLcMiCEMbLmlojkSXuE=
X-Google-Smtp-Source: ABdhPJzum9L0yvwU6Fz0ceNPjXvAZiJJhTiWMOWT4EdWo9m6vqCv5D7xiUL1IMUbG1xIm0lTbNYxOw==
X-Received: by 2002:a19:c7d7:: with SMTP id x206mr5895591lff.67.1596366445372; 
 Sun, 02 Aug 2020 04:07:25 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:24 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 10/22] drm/panel: raydium-rm67191: Backlight update
Date: Sun,  2 Aug 2020 13:06:24 +0200
Message-Id: <20200802110636.1018743-11-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802110636.1018743-1-sam@ravnborg.org>
References: <20200802110636.1018743-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Robert Chiras <robert.chiras@nxp.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Replace direct access to backlight_properties with
  backlight_get_brightness().
- Use macro for initialization

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-raydium-rm67191.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index 313637d53d28..5553db385dd5 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -479,7 +479,7 @@ static int rad_bl_get_brightness(struct backlight_device *bl)
 	if (ret < 0)
 		return ret;
 
-	bl->props.brightness = brightness;
+	backlight_set_brightness(bl, brightness);
 
 	return brightness & 0xff;
 }
@@ -495,7 +495,7 @@ static int rad_bl_update_status(struct backlight_device *bl)
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, backlight_get_brightness(bl));
 	if (ret < 0)
 		return ret;
 
@@ -539,10 +539,10 @@ static int rad_init_regulators(struct rad_panel *rad)
 
 static int rad_panel_probe(struct mipi_dsi_device *dsi)
 {
+	DECLARE_BACKLIGHT_INIT_RAW(bl_props, 255, 255);
 	struct device *dev = &dsi->dev;
 	struct device_node *np = dev->of_node;
 	struct rad_panel *panel;
-	struct backlight_properties bl_props;
 	int ret;
 	u32 video_mode;
 
@@ -588,11 +588,6 @@ static int rad_panel_probe(struct mipi_dsi_device *dsi)
 	if (IS_ERR(panel->reset))
 		return PTR_ERR(panel->reset);
 
-	memset(&bl_props, 0, sizeof(bl_props));
-	bl_props.type = BACKLIGHT_RAW;
-	bl_props.brightness = 255;
-	bl_props.max_brightness = 255;
-
 	panel->backlight = devm_backlight_device_register(dev, dev_name(dev),
 							  dev, dsi, &rad_bl_ops,
 							  &bl_props);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

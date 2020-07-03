Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FE4213FE4
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9559E6EBAE;
	Fri,  3 Jul 2020 19:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373786EBAB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:29 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id e4so38223836ljn.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TTecFeWhnkJS04/6vJx6YjKZESPPJ5FYJVs0LA7y+wc=;
 b=k21Kn1mqEpNm0J4N9eAzvMcKPUp80/EqId9x76AOzNJl9hLAaOIE9t4CmymenpSL+3
 udl/AkE4Fgu6mhnswUT9gmgT/JGi7invjCJl2IGplYYS7+YYpMQVIJspoqVNmnJ6gLfi
 SAdNFFWx5H5Z481ufKHtqJU8BXOaCGSUb9L55LKr5ahfW/BwkMpe73t5Pdj8JGcb+HHC
 jcr4RVapLrdXp7vsmpBvSUmo/khcZE9/pnPcq57O+obBet4iHF9Y8E6jkc7FDLwYCvft
 gVmEdHiBeab9MRW5xh2gf5vYcItyauCk/UE+tix1wfBIDEifn5N7zehnqI32rreI937k
 oXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TTecFeWhnkJS04/6vJx6YjKZESPPJ5FYJVs0LA7y+wc=;
 b=lASESnGxdXxIeXMUfajkI/d9b/RHCsVEheWhAZbfyK/8z/jLfnrm6asto2Zf0Jjwus
 dkeP7iOBNtB+5orumdIbsazv0K8YeD14B0zzY5/EjkM72qlz46oQYVgQ0211u8kOwdAR
 SRt9mmvOU7GSM87fnHdXswGUkTW4jhehABpBsoPmCvvWYH7rysbTMyU97CEyOGizNI+8
 WohGpoD7P5uMlLjO4ZQsTB+MxSIb9c0NvIAY1aNHAak3fEW/kjzWtjhSuskOhPS7kdbi
 IlbGDEQtB4o++n6cnBJPZ1KsjQDMMWPsDelQc+zXozbQ/E+6HBZiUDnGwv7FyGQU/Hg/
 +ulA==
X-Gm-Message-State: AOAM5300ZZvaeVS0sImb0J2gmQqDuhOIPfK9yRz2U5gzOG+PGGXdkN00
 +rcgzbVBoMGzyuoFE29IzF0OuNWJk7w=
X-Google-Smtp-Source: ABdhPJxIL1rwJl7DS1D9whh/28L0b2F3QaArb6NnM64C9SsmbJNcTTjC0M8fdDAeDUtWTXRlCyVYTg==
X-Received: by 2002:a2e:700e:: with SMTP id l14mr12971371ljc.131.1593804267477; 
 Fri, 03 Jul 2020 12:24:27 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:27 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 02/21] drm/panel: panel-simple: add default connector_type
Date: Fri,  3 Jul 2020 21:23:58 +0200
Message-Id: <20200703192417.372164-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703192417.372164-1-sam@ravnborg.org>
References: <20200703192417.372164-1-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All panels shall report a connector type.
panel-simple has a lot of panels with no connector_type,
and for these fall back to DPI as the default.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 7b5d212215e0..b3ec965721b0 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -500,6 +500,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	struct panel_simple *panel;
 	struct display_timing dt;
 	struct device_node *ddc;
+	int connector_type;
 	int err;
 
 	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
@@ -566,8 +567,13 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 			desc->bpc != 8);
 	}
 
-	drm_panel_init(&panel->base, dev, &panel_simple_funcs,
-		       desc->connector_type);
+	/* Default DRM_MODE_CONNECTOR_DPI if no connector_type is set */
+	if (desc->connector_type != 0)
+		connector_type = desc->connector_type;
+	else
+		connector_type = DRM_MODE_CONNECTOR_DPI;
+
+	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
 
 	err = drm_panel_of_backlight(&panel->base);
 	if (err)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

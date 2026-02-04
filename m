Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFUpJpeCg2llowMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 18:32:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AFFEB002
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 18:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B5210E6FE;
	Wed,  4 Feb 2026 17:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="faP7tv1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BC710E6FE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 17:32:02 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-42fb2314f52so85461f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 09:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1770226321; x=1770831121;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SHHzvTMf+Hyy3Mrd49IDT01zEwKV3sDoYa1lWPRRy14=;
 b=faP7tv1/AEHLJxLg+FxkPdW1hIjk6hvCJyFxiVE+nWopsJbwjBzk6ZyRjprVzJvN2E
 rSRTfzzJtQi5/ZRubBUj3TDEvb/wcetlX59qrMoi2fYUOF5FLwaHymJWDE5uheQjfGkM
 nnP24cYXnwuoIBFNMLXtb1KaXRMJJDhj6SVvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770226321; x=1770831121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SHHzvTMf+Hyy3Mrd49IDT01zEwKV3sDoYa1lWPRRy14=;
 b=Qxgf6XQanA4IoFsYg2XuSbSovvbUuMhz9Wwd5R6EgVJ/T80+hxC0Chg5SmgsvQEv+G
 I6a1aSW1F8T3aGWzMgqwZWiZXtw/cEfc24j0F8mC+FVWa8TnGblE1s6+IPDdLJ0j+fMk
 q93+Hu/ij/z6YDsFwgS1ZP0SU0f+bEYsooFIpTbUKjKdkgjjsVvyxBlzWlZKwz7aV9Ow
 YsYlkPfkdbrbySd4XT/oI1+/AzoE56XYUJ5xCVEsyMETIXIq9q9kAGDZC/fvRaMZdE9V
 9oDQ2Z3qYJ8WtITTrlLe9vCMFGQnu8+DA7c2q2Cf5DUOPZfrHi82FH52zk9DmIVpbyfY
 hHMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjiDDVJ7MXO1ZRzSIWK6EbsXlhZtAmRNqnGyodj+qJBOJgQbAbZ2n/FRRR8lYs39Blg3EeCCFfvkA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgAgkuOdfYo4+Yt3945iuyRG+KNjNZV2zW8quDLijT1YDGf3kB
 qtDjo4vzzAcxrgy5kZ2nz8+9FXLUmZavb0sTFHGer5wrA59b08dbCtiu5K9of2gHWPA=
X-Gm-Gg: AZuq6aJOuZ36V420lRVTVEyD5PvGgcuQNIVoi56LqRwQik4FotvAIzOzgwyzzstXPCF
 aE43qbDPuql3tVRnNt19KEiE1rk+NVeIp72ICWZbHomNn/xoRo+1FtLtfYt4o2oQsxIDNj0ebYs
 5W0kC33HMD7agE6pmXzzGpLPo1DrPTkK6QgiZOdjmgjgcaMxS0/ES2zEu93P9suvH0E9+PeRHol
 1xhniFKW21HR739IfylznqPMMZ7xejrSwRToxLig8aLCc66iC8NV79ZwOyzyY1DFnCKJqoGkDlc
 9b/RnW6tI1Emn3aszxrHJpjHxpf5PECsZ2svDLi/ztzstj5RrSCgYEzj1RmhWG4gWhaACf+Jifk
 SLQXKO7MYZyab92e5rbDXshzw7nLE8jCOG2tkmcKzMg2B1HDbYOTnbu3plYARerUR/lzL1EqgNf
 LRakO6A/zPkzhMw3nV3x/0TpahvqsN1n9rlu0Yt6Vq+HVStIlZ92vlABP/r0QRKuSjVq7s1M0ik
 Rowh06FY8azNeB0VdaeGr4vDQ5fW0rJrA==
X-Received: by 2002:a05:6000:3104:b0:435:9756:d4c4 with SMTP id
 ffacd0b85a97d-43617e42220mr5091024f8f.17.1770226320647; 
 Wed, 04 Feb 2026 09:32:00 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436180640f2sm7241565f8f.39.2026.02.04.09.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 09:31:59 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/4] drm/panel: ilitek-ili9806e: rename to specific DSI
 driver
Date: Wed,  4 Feb 2026 18:31:17 +0100
Message-ID: <20260204173154.337674-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204173154.337674-1-dario.binacchi@amarulasolutions.com>
References: <20260204173154.337674-1-dario.binacchi@amarulasolutions.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amarulasolutions.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amarulasolutions.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amarulasolutions.com,gmail.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-amarula@amarulasolutions.com,m:dario.binacchi@amarulasolutions.com,m:airlied@gmail.com,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mwalle@kernel.org,m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amarulasolutions.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 82AFFEB002
X-Rspamd-Action: no action

The Ilitek ILI9806E controller can support different transport buses,
such as MIPI-DSI and SPI. The current implementation is specific to
the MIPI-DSI interface.

In preparation for adding SPI support, rename the current Kconfig
symbol and files to be DSI-specific, clarifying the current scope
of the code.

Since DRM_PANEL_ILITEK_ILI9806E is not used in any in-tree defconfig,
the symbol is renamed directly to DRM_PANEL_ILITEK_ILI9806E_DSI without
providing a legacy compatibility alias.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 MAINTAINERS                                                 | 2 +-
 drivers/gpu/drm/panel/Kconfig                               | 6 +++---
 drivers/gpu/drm/panel/Makefile                              | 2 +-
 ...{panel-ilitek-ili9806e.c => panel-ilitek-ili9806e-dsi.c} | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename drivers/gpu/drm/panel/{panel-ilitek-ili9806e.c => panel-ilitek-ili9806e-dsi.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36abe938f960..58cd78fb9731 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7917,7 +7917,7 @@ F:	drivers/gpu/drm/panel/panel-ilitek-ili9805.c
 DRM DRIVER FOR ILITEK ILI9806E PANELS
 M:	Michael Walle <mwalle@kernel.org>
 S:	Maintained
-F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
+F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
 
 DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@edgeble.ai>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7a83804fedca..692cd474910d 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -257,14 +257,14 @@ config DRM_PANEL_ILITEK_ILI9805
 	  Say Y if you want to enable support for panels based on the
 	  Ilitek ILI9805 controller.
 
-config DRM_PANEL_ILITEK_ILI9806E
-	tristate "Ilitek ILI9806E-based panels"
+config DRM_PANEL_ILITEK_ILI9806E_DSI
+	tristate "Ilitek ILI9806E-based DSI panels"
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Say Y if you want to enable support for panels based on the
-	  Ilitek ILI9806E controller.
+	  Ilitek ILI9806E controller using DSI.
 
 config DRM_PANEL_ILITEK_ILI9881C
 	tristate "Ilitek ILI9881C-based panels"
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index b9562a6fdcb3..00071a983242 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -26,7 +26,7 @@ obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
-obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E) += panel-ilitek-ili9806e.o
+obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_DSI) += panel-ilitek-ili9806e-dsi.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9882T) += panel-ilitek-ili9882t.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_EJ030NA) += panel-innolux-ej030na.o
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
similarity index 99%
rename from drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
rename to drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
index 18aa6222b0c5..c337c4f1a1c7 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
@@ -561,5 +561,5 @@ module_mipi_dsi_driver(ili9806e_dsi_driver);
 
 MODULE_AUTHOR("Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>");
 MODULE_AUTHOR("Michael Walle <mwalle@kernel.org>");
-MODULE_DESCRIPTION("Ilitek ILI9806E Controller Driver");
+MODULE_DESCRIPTION("Ilitek ILI9806E Controller DSI Driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0


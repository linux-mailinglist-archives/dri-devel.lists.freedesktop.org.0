Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDRcK54IoGm4fQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:47:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0E91A2DCD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1CF10E882;
	Thu, 26 Feb 2026 08:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="oPWjAS3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018F810E863
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:47:19 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-483bd7354efso7969565e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 00:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1772095638; x=1772700438;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BDSMHE9cAnIvbdRGvADYhDcBowthvH8D43yGDbIOjfE=;
 b=oPWjAS3p+sdhA4G4bCDNvQm5ZtrtVn/3U5EoABjWIAVDKSMY1VVhp2o3YInT9yDJSI
 Lxt7S8L4ne7OHMZm23G6cjEQVBYskxAhRGJjbDrp2kReBYR8vcEZPED1Jb+KcWR4TPfY
 U0575pRNAzSe7C4/N9IWCt8zYvMW+wT99Bu1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772095638; x=1772700438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BDSMHE9cAnIvbdRGvADYhDcBowthvH8D43yGDbIOjfE=;
 b=Y+jX9uHa6xwWhUIvzW/5XgEq7O/axyWZX/37azcZojmeUoHXqgdn9HfkIXypkQic9w
 cWpFQGEICIzo9VHir+ORzVamBPOm26u3L8mCdLkMxSTxf/amOv7zNABmzdM8GuMg5ceY
 0svtyUgqd1ovc789CbzvynK+ANJTIUGDrPrP/AONdFlBe3qEJLLT+uOrMUGoggit/Tb7
 dc4zfQUoQD8E8TR3M2QBXyYJUKSxjldYgE9kPEL8dvqOUicujfS3BaLjJ5YvikxqtmDA
 UA6kG3ftj55W6xhgqxuxOlMlZucazn3vZ0FWV4ELPW6umXYOfBDiwPmQOfl6cWwQvWEx
 Wp4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX53AaWe6tgr3QKvNMYXfrFeDyYNO12RMs3yTPUadwMyNC3uYf5oLgUXn+x9u/NvoKJ/96kx8nPOtE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1e67erVyu3EBTFPm8dDfuiCu3CP7XImZBzAKGn3Uye61F8Fwe
 uBdIk9UF/0crrXMKFGLXsdTNYBlso+7+MrYsT453GEZTJ8pfMWRTqYy862/vxf2AOEs=
X-Gm-Gg: ATEYQzwZAFDx/mxZMx+mbuMm/0v4ag0bNn+QWICRDKDWaIQRcA4Vp14XNvfIPQLL3DG
 ZQZE71W1AKXhFesXTHGo3RepSyXEcZfGfer24N8Lm8AhDJVbYV2B9KxY6GhyQ3Oa14apoX+E5Jd
 HrVrQv/ZhjSOnf3kXvtzhfk/QV153Q6unQ80qq1l+lKjfL1MKnL8hH4J2OmWbCoZ9vQxC8XuOoe
 5l4ZTcoa8mEv2xzye6EbwdG8n2jGrnSaU1atJ17AnaBFQh3x6cMOeUuRTPLnahBMXGZj7qaDI6A
 DZWF0xvd7GNPlS1Z1qDTtZSmjLqedwTR8M650E6jQsMuDCSJMcO9LprHNo+X4lilLFIGiETDvNl
 KbC1ac91QmVoAplAepYRRZ7jl1h/HaNL811ChTKK3uWhwfycWmNnDDLSTSnl0GmOj+uxfKUAn4D
 l9JJGow5oMLkjDaWyZHhwyDFSdIEGI9riKcThim8GgJESiHqOlz0hGMa7onN3zzOtppDsJm7cMi
 IDGix2nFfvKp2XxFFNPP5gHJZo2wIjSkSUVLq6OSJ/cdexBRgn8dMl+h783FkJJHrEhEJpsIxI9
 dyN2+4hYel9PZxH0EFWG8OTW
X-Received: by 2002:a05:600c:8708:b0:483:a922:2e8d with SMTP id
 5b1f17b1804b1-483c216ab55mr48871945e9.4.1772095638419; 
 Thu, 26 Feb 2026 00:47:18 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb85c58sm31581075e9.9.2026.02.26.00.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 00:47:18 -0800 (PST)
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
Subject: [RESEND PATCH v4 1/4] drm/panel: ilitek-ili9806e: rename to specific
 DSI driver
Date: Thu, 26 Feb 2026 09:47:00 +0100
Message-ID: <20260226084713.2566672-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226084713.2566672-1-dario.binacchi@amarulasolutions.com>
References: <20260226084713.2566672-1-dario.binacchi@amarulasolutions.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amarulasolutions.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amarulasolutions.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amarulasolutions.com,gmail.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-amarula@amarulasolutions.com,m:dario.binacchi@amarulasolutions.com,m:airlied@gmail.com,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mwalle@kernel.org,m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,edgeble.ai:email,dlh.de:email]
X-Rspamd-Queue-Id: 5F0E91A2DCD
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
index 55af015174a5..8bd673456cda 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8032,7 +8032,7 @@ F:	drivers/gpu/drm/panel/panel-ilitek-ili9805.c
 DRM DRIVER FOR ILITEK ILI9806E PANELS
 M:	Michael Walle <mwalle@kernel.org>
 S:	Maintained
-F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
+F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
 
 DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@edgeble.ai>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 307152ad7759..142f32a1d256 100644
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
index aeffaa95666d..2ceeec7e2110 100644
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDF49F2345
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 12:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5642610E156;
	Sun, 15 Dec 2024 11:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KKoQmwZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AC510E156
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 11:09:16 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so36581121fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 03:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734260955; x=1734865755; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Rtqsq0uxUn5fTI7xk69AME8ZpJLgefJ43G2XJKPJ1EM=;
 b=KKoQmwZmDY1iwPAop/2IRsOK4Npb/Rn/0Btf87MuzvzVz54YqCvull6VLMY/vJCJH3
 zTta26L7riGC40oo0655nudyAIAw2lME8CG4pbqopobgUfxEz17R+t61mwzH2NXQyPJS
 2auD5fKRQe6S/3ApSLuLMFmJ8hI1IvNRtu5EDlROU2LSkrBgIecIq6I3HKj5i3B36F7M
 fgMGFFdQPT0XK0nfluVoo4WivV59W7en3lmtD/tdiq2mJYYUeSvnp8VLijdVDB2IHwUM
 UgFs+uN8sg4q0wloOI0bcRKhxM3L3ZXIjerBXbcUesffPvhou1Aj4hKXmbZUPnMwRi3S
 1h4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734260955; x=1734865755;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rtqsq0uxUn5fTI7xk69AME8ZpJLgefJ43G2XJKPJ1EM=;
 b=PWTzqIIrtrHUintqIuGkq7OvtYPf+jt4xvGRtf0qaMfaWsz8bIzZ+JTsF+1ke3T7G9
 ihFiB25Wc34jJ93+YNZbukatH2b/xFmFIyIBUK1d/RbYLOU6ConNfKUx6RWk64KKWseb
 rSAj3GzubmDe7cGiFEVXcILb5LxSeu8vzeYvm+Wq73DL+ocqfjLhJjasVPwQDDLpHofz
 yv3MfJ8Wtl3xeOgX4MtEtZfjr6mWKQPbCyAMc6vAceXLZwOjj+H9Ftq5AtsO3UIJUVjG
 ivvWneylVOOx7+7xx6NKseFy7tCh2WxB8qbbY6I1ICQUkivbEK3PL3JsFxoxZ8/dlZqv
 znKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1w0sKYPAeHOO13TZfae3kMVafK8JFx9g5Lh4PmO/8Y4yAbUDGKyrwT02ywapMqo6a+QxYsRozJqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT4Ifh/XTedzgAakcwgwJyw5z8VSpVgGdWucKch3hzmEoGL27j
 MqCUmDAYFls3ZL14FksB0L0m6L4c59kr+wYn3FqZRwMrnU0QCz4M9J1L8BL+9bI=
X-Gm-Gg: ASbGncuWBkmnwhLTwC1NDL2plBOuMKfDRO2ZNT54SODDCOCCXS9pA7OHXysbN6YCtsD
 3Vp926d6QxxF9C2kOqizQqPBbq9czXPZIieZEkc6a5e8tlc+F9VR1VALcqquoLb/qFmnPUBmF7O
 MDvcBRC1ZSEsm60jMMiU0WeIbPMQWothEOLcSGiihAxGI7R/Y9O5ZdCYP0bp3YMKaQwQPHY/5Ug
 U+GrNaBXq75tUX3nbNORo5B8zN7LGGNaYP8+fOxrX90Q+lRtSdPLRjjqeEgwjdA
X-Google-Smtp-Source: AGHT+IFLmlv6NB9HM3wZEuLR4IJuP/fDkB45V7+26pOX+LvGU9x8LaRy70CNTQyyApNHRA4iD0fP+Q==
X-Received: by 2002:a2e:700b:0:b0:300:360b:bc36 with SMTP id
 38308e7fff4ca-30254471c9bmr26058101fa.23.1734260954999; 
 Sun, 15 Dec 2024 03:09:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3034404544csm5261531fa.29.2024.12.15.03.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 03:09:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 15 Dec 2024 13:09:08 +0200
Subject: [PATCH 2/2] drm/i2c: move TDA drivers under drivers/gpu/drm/bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241215-drm-move-tda998x-v1-2-7817122b1d73@linaro.org>
References: <20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org>
In-Reply-To: <20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5882;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9HVg6HBh2+ASzBgpf6mNHTsofNt7kBP/QL4wncnBAys=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXrjUQZKmGmQo8Fo8eAtPuOigqvQqQFAG2xwiX
 ey6K6dHUHaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1641AAKCRCLPIo+Aiko
 1UxDB/0dxBw7DkueqenVzrvtWIOi2XXKAwKj+z31BJbjN099lOMVlTpMQHLXwsOzl1Y8UyEa9q0
 Df839NBVAQ7J05qOAf+MNlDEamFfoO4hChP+uVDIQY3syjwsQByNzYX2lrlZs4jZSicsLQY/Ma4
 Y/NK1E5QZf3A16uKaTtjbk7IS7QKwY6bpsQtFpz83eJyfAha1EDtq0mtLK/0O+ctXFZyjLCe7OW
 drghIcUUel3etPtsF7aYUAAEqv4i2D0vRZlY7+O8CjdN1sG9af3KALazOvd91rJPaE12TwXeP8f
 zM+ObiTq63sSxE/RcensAbq1KnEHOjj5E8vavQ7vRegV32MH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

TDA998x is the HDMI bridge driver, incorporating drm_connector and
optional drm_encoder (created via the component bind API by the TICLDC
and HDLCD drivers). Thus it should be residing together with the other
DRM bridge drivers under drivers/gpu/drm/bridge/.

TDA9950 is an I2C-CEC translator, being present on-die on the TDA9989
and TDA19989 chips, so it is being instantiated by the TDA998x driver.
Move it together with the TDA998x under bridge drivers subdir.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS                                       |  2 +-
 drivers/gpu/drm/arm/Kconfig                       |  1 +
 drivers/gpu/drm/bridge/Kconfig                    |  2 ++
 drivers/gpu/drm/bridge/Makefile                   |  1 +
 drivers/gpu/drm/bridge/tda/Kconfig                | 13 +++++++++++++
 drivers/gpu/drm/bridge/tda/Makefile               |  4 ++++
 drivers/gpu/drm/{i2c => bridge/tda}/tda9950.c     |  0
 drivers/gpu/drm/{i2c => bridge/tda}/tda998x_drv.c |  0
 drivers/gpu/drm/i2c/Kconfig                       | 13 -------------
 drivers/gpu/drm/i2c/Makefile                      |  4 ----
 10 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a23e80abf309cbd918a74683895f8dbe0507a6e..a4c7afd564e721e14aebaf828b75776e50760a45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16982,7 +16982,7 @@ M:	Russell King <linux@armlinux.org.uk>
 S:	Maintained
 T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-devel
 T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-fixes
-F:	drivers/gpu/drm/i2c/tda998x_drv.c
+F:	drivers/gpu/drm/bridge/tda/tda998x_drv.c
 F:	include/dt-bindings/display/tda998x.h
 K:	"nxp,tda998x"
 
diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
index c901ac00c0c3a8f356bd53d97305c6b39b3e6662..ed3ed617c6884876368c8bd072c53f1b710df443 100644
--- a/drivers/gpu/drm/arm/Kconfig
+++ b/drivers/gpu/drm/arm/Kconfig
@@ -9,6 +9,7 @@ config DRM_HDLCD
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
+	select DRM_BRIDGE # for TDA998x
 	help
 	  Choose this option if you have an ARM High Definition Colour LCD
 	  controller.
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 6b4664d91faa80f096ac6a0548ed342e802ae68b..1ef16dcc2ae53eb172604de2d6899004c080a979 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -438,4 +438,6 @@ source "drivers/gpu/drm/bridge/imx/Kconfig"
 
 source "drivers/gpu/drm/bridge/synopsys/Kconfig"
 
+source "drivers/gpu/drm/bridge/tda/Kconfig"
+
 endmenu
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 97304b429a530c108dcbff906965cda091b0a7a2..52e6c9b3094bba0fd6aaf28af1b58f4bd8bf26d0 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -43,3 +43,4 @@ obj-y += analogix/
 obj-y += cadence/
 obj-y += imx/
 obj-y += synopsys/
+obj-y += tda/
diff --git a/drivers/gpu/drm/bridge/tda/Kconfig b/drivers/gpu/drm/bridge/tda/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..5f13e4ffc24eeaa8dd0015c7e84d0dbac93e170c
--- /dev/null
+++ b/drivers/gpu/drm/bridge/tda/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DRM_I2C_NXP_TDA998X
+	tristate "NXP Semiconductors TDA998X HDMI encoder"
+	default m if DRM_TILCDC
+	select CEC_CORE if CEC_NOTIFIER
+	select SND_SOC_HDMI_CODEC if SND_SOC
+	help
+	  Support for NXP Semiconductors TDA998X HDMI encoders.
+
+config DRM_I2C_NXP_TDA9950
+	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
+	select CEC_NOTIFIER
+	select CEC_CORE
diff --git a/drivers/gpu/drm/bridge/tda/Makefile b/drivers/gpu/drm/bridge/tda/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..31fd35527d99d7eb23851d290175a3ff0c756772
--- /dev/null
+++ b/drivers/gpu/drm/bridge/tda/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+tda998x-y := tda998x_drv.o
+obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
+obj-$(CONFIG_DRM_I2C_NXP_TDA9950) += tda9950.o
diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/bridge/tda/tda9950.c
similarity index 100%
rename from drivers/gpu/drm/i2c/tda9950.c
rename to drivers/gpu/drm/bridge/tda/tda9950.c
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/bridge/tda/tda998x_drv.c
similarity index 100%
rename from drivers/gpu/drm/i2c/tda998x_drv.c
rename to drivers/gpu/drm/bridge/tda/tda998x_drv.c
diff --git a/drivers/gpu/drm/i2c/Kconfig b/drivers/gpu/drm/i2c/Kconfig
index 6f19e1c35e30b0e595c1a60628a6b8cf313fcabc..3205cdb827b95209a4bba9fb126ad2df27ddbdfb 100644
--- a/drivers/gpu/drm/i2c/Kconfig
+++ b/drivers/gpu/drm/i2c/Kconfig
@@ -20,17 +20,4 @@ config DRM_I2C_SIL164
 	  when used in pairs) TMDS transmitters, used in some nVidia
 	  video cards.
 
-config DRM_I2C_NXP_TDA998X
-	tristate "NXP Semiconductors TDA998X HDMI encoder"
-	default m if DRM_TILCDC
-	select CEC_CORE if CEC_NOTIFIER
-	select SND_SOC_HDMI_CODEC if SND_SOC
-	help
-	  Support for NXP Semiconductors TDA998X HDMI encoders.
-
-config DRM_I2C_NXP_TDA9950
-	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
-	select CEC_NOTIFIER
-	select CEC_CORE
-
 endmenu
diff --git a/drivers/gpu/drm/i2c/Makefile b/drivers/gpu/drm/i2c/Makefile
index a962f6f085686674ed33010345730db776815ebe..1df3869491e277ca210368c4e48efe6d11af62b6 100644
--- a/drivers/gpu/drm/i2c/Makefile
+++ b/drivers/gpu/drm/i2c/Makefile
@@ -4,7 +4,3 @@ obj-$(CONFIG_DRM_I2C_CH7006) += ch7006.o
 
 sil164-y := sil164_drv.o
 obj-$(CONFIG_DRM_I2C_SIL164) += sil164.o
-
-tda998x-y := tda998x_drv.o
-obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
-obj-$(CONFIG_DRM_I2C_NXP_TDA9950) += tda9950.o

-- 
2.39.5


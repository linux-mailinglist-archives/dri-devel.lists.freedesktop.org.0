Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313378C183D
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 23:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3021810F559;
	Thu,  9 May 2024 21:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Opa3lRJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055DF10F53A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 21:20:27 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2e3fa13f018so15603611fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 14:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715289626; x=1715894426; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=K0AjYQgc/Kg6ymj2SYvFJcHrf+33vNVWmj+ECCE5Uk4=;
 b=Opa3lRJA2tyI9sQLL4JNLfQz4u8p715dnQd26hjCiZtzgkDif7hiPIeq25kvmy4MWE
 6Rpokefs5C/rQtqAJPbpcdlXE4cKSIOj/Di/Q9KWkypDdUc2yYTsNMyPlK14p/GOezKM
 b32YOfhRfH8QglkOuhUhszKvRsjnrTx+9uN56JmtZnAKZ6+b3rhJVV/mTxR3Rtid9Kjo
 Ai6dZwSca6noBCLWjLte6G20Ir72I26NFurqkdDk03Kc532GPnHRrFR7y7r4LwPnucnR
 wy/lBQ88zA58HYIte5M3bMm5vkYHku++O2Wb4E6FkCDt2FqVqwugfROc8aoJIRr/aUGO
 QE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715289626; x=1715894426;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K0AjYQgc/Kg6ymj2SYvFJcHrf+33vNVWmj+ECCE5Uk4=;
 b=ptA9kNBCTX6wV41rRtf8DSvyyMfv34E7w8vPinQem1/PfvQnAuS/Q4l9CTgWoaDvN3
 CxtoYZ4bIWH3Q2/kslutegOqurgnC7YVWNn5kZEYYnSzHdOXQUcaC0TPtRHSUxMomH6J
 h1ujCubZLMvbTpZlJiG32ShmrKkIu0ymRltqesOxfhhDozVQtYIO1vY9ccy1PxdqNEXi
 P94lNKABPq7zBgnTSIiPi1CFl2b6Jjz1PNGwwOSL0A+f99o9ba/yAVnngP52KYmMLmn4
 Y4YYJDZmNSkcc3N6gY6uztWfjo7FF1x1VIVkI4BSoljSrHWu/0vHq58cvBDKxIAVYnN0
 VjEA==
X-Gm-Message-State: AOJu0YzOs3ISlD7AosxIvgqvLDimnwsUkpg4Tm/07iXQ6ZON4N/RLjgp
 n+BfQivOk1EAjhTk9srluftdW5nCg4IboJ4e9an6u4c9zDfI4a2tk/NVSZvf9Uk=
X-Google-Smtp-Source: AGHT+IGfXvgqsYlqWJKvA6gGWvMK2v5HC+TuvvP8p2JkYzfRGHQykildj77IYhfD/mCd8xaKabV6kA==
X-Received: by 2002:a05:6512:3701:b0:51d:3f07:c93c with SMTP id
 2adb3069b0e04-5220ff71d70mr332140e87.3.1715289625967; 
 Thu, 09 May 2024 14:20:25 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d898fsm438832e87.208.2024.05.09.14.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 14:20:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 May 2024 00:20:21 +0300
Subject: [PATCH v2 1/2] drm/panel/lg-sw43408: select
 CONFIG_DRM_DISPLAY_DP_HELPER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-panel-sw43408-fix-v2-1-d1ef91ee1b7d@linaro.org>
References: <20240510-panel-sw43408-fix-v2-0-d1ef91ee1b7d@linaro.org>
In-Reply-To: <20240510-panel-sw43408-fix-v2-0-d1ef91ee1b7d@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=986;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fJ1rFBZvq/u/ibZlYytLuo1NfFspyuxEibTUJ2GQ7b0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmPT4Xu19gIrEOfaCn3Nv8snYLMWWpmEo6Uppfa
 ZIvO2lCIK2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj0+FwAKCRCLPIo+Aiko
 1RSUB/9l96pY63NZpv3fzBCzZg3JjmqmQPyhZEoLIB0v1Epgo3eUl0eV+aUDC2NlkhHqksrZqGo
 jQmiwSwh8ZKgIOjXQFDekgIhL8x1fhjXj0c9g03H1UqXd7nsovDm2r00E9EhonIEQFGb6Ro1Fhz
 8H/3gIa8JYIgDWosbN07hW8phuVPDf7YGXjrSvEDh07x1BVv1yrqTT1yhXwRE3VZ6czzD/bKDLo
 ljztotW1xDNh474V4GU8RJvJe3buA4M9edYtybFBw3GHpCfxxG00eMHM6t96HhtSV51indajJ0Y
 9AtfJrktTVzNoGfO4y909b5KqWYWI0P6huGVDiEqAcLifedq
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

This panel driver uses DSC PPS functions and as such depends on the
DRM_DISPLAY_DP_HELPER. Select this symbol to make required functions
available to the driver.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404200800.kYsRYyli-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 982324ef5a41..2ae0eb0638f3 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -340,6 +340,8 @@ config DRM_PANEL_LG_SW43408
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for LG sw43408 panel.
 	  The panel has a 1080x2160@60Hz resolution and uses 24 bit RGB per

-- 
2.39.2


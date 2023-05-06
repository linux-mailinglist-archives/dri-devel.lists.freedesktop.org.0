Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C46A6F8D5C
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 03:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212FE10E688;
	Sat,  6 May 2023 01:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6757610E1A8
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 01:09:49 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-76640f8c456so59425339f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 18:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683335389; x=1685927389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S57aMfOKN4Ufu1gBwss42JtDuspNMJN7ZH7N5B2pZmI=;
 b=pzLeMW86eJOcyTJ1zfq7cQdlDIMTNuIxITfI+ssm6oxpDpjFhaa8waxO5nNzRTwZkt
 9YovPBhp7wzV7dpVQWHDJYDHovSgitGjS19usf5fFKHzV3k/TCc4pS9KwP3sHFF3VhCW
 X/XVrxFKC/W4XFZOAoTljDxGifOqBp9N2qGq0q823PHtn7utIu9LMhtgq/iYaOBGBODI
 UhvMqyiqde4sBmfJtIILbaQZ+X17DfpdSq/HkSyz9mJiol0yzjPtgxt/6D09fWCYm80E
 JELBdWoJWGi0SGgrAUWmUyMc/bjgdvu4Xk8XNGcOyM0b7ENPtIzM96nN6PIcQHjCGwpv
 kYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683335389; x=1685927389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S57aMfOKN4Ufu1gBwss42JtDuspNMJN7ZH7N5B2pZmI=;
 b=YwT5ZwPwwlp+dwzsdhBjuotMS8fJh1hr12nuS9AeFIhIV47OwCabBkPogL8T7a70jH
 yA4JASHorH23U/98l2OEEIAW7jQIET00Awi+kEgzz/tgMHOzNriF1dX0IEOXHu28hE0h
 CakuemgtAKZG2D6W5yiwbZB57jI+cGpepI/ZK7XUkD/+MrWClcULBGGmNHS9endkHbzh
 ekE/SZindWXZKdvHkXtkERo/lspicOC1+yUagrEAE6T4vMiMXOc+kdnowdJGhib+FhsW
 yTAGLqf44bIEuhREPux5MgJzzGk7kFbTGpWOX3SeEIpmul3Tsqu4vyVJaAS+XSgbcQ4j
 n0Mg==
X-Gm-Message-State: AC+VfDxtJ5NDptp1ADvA8cJBfWREql8PjdQRLk6DWS/jXTpmTRHN0bzv
 1VU8eTYA5bflsoQ5C96jOzJZaJjIiP8=
X-Google-Smtp-Source: ACHHUZ4JmXPdFUiUhXujk/P6gRbELBNJwCIN+oaZt9D2m9RqlgSbvf/tSL/tMVfVR9CVBNusYK+lgA==
X-Received: by 2002:a6b:fc18:0:b0:760:c072:d276 with SMTP id
 r24-20020a6bfc18000000b00760c072d276mr1949513ioh.21.1683335388666; 
 Fri, 05 May 2023 18:09:48 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:34a2:3894:45cc:c002])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a5e950b000000b00760ed929d0bsm335735ioj.2.2023.05.05.18.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 18:09:48 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V4 4/6] drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
Date: Fri,  5 May 2023 20:09:31 -0500
Message-Id: <20230506010933.170939-5-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506010933.170939-1-aford173@gmail.com>
References: <20230506010933.170939-1-aford173@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to support variable DPHY timings, it's necessary
to enable GENERIC_PHY_MIPI_DPHY so phy_mipi_dphy_get_default_config
can be used to determine the nominal values for a given resolution
and refresh rate.

Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index f076a09afac0..82c68b042444 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -227,6 +227,7 @@ config DRM_SAMSUNG_DSIM
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL_BRIDGE
+	select GENERIC_PHY_MIPI_DPHY
 	help
 	  The Samsung MIPI DSIM bridge controller driver.
 	  This MIPI DSIM bridge can be found it on Exynos SoCs and
-- 
2.39.2


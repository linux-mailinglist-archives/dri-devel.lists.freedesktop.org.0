Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 785ED6F3BB2
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 03:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322E488735;
	Tue,  2 May 2023 01:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D91310E2F7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 01:08:15 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-760f8ffb27fso54744639f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 18:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682989694; x=1685581694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v0duPWgTIsXWR+LqC+JicpRWC9rG9dOi1hmp+K9AKt4=;
 b=oAJ1HEpecrB2Q6BRpL9rdawMEoPUyuLAfbZul0lkxVERtwEr0Pyslu/QBfGALP1vGf
 FW2D2BmSQbZc4Ge43oVD+clOIBN30ayCgAjWrlixkuij6syeE8/Ty47txlKBOGvyat1I
 6GJ2puGIwLAGWAMu5/YvxvMUePnjUmEdMyCHEEbcCjkMH3NrABW+z74FRbIMaB8dFuvf
 yqgHr9sHVZZEgBFCV1xTUPWFCWfDykx24oAQP8mQBk3chFdbSvdsuhA3LwZzM1Wit/y2
 awR7O7dw95WIJjIi96DY6NfO3SlaTrHb/Hi4BfNbml+KRTD/IZyjB68rGkzZzovbKjv0
 7wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682989694; x=1685581694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v0duPWgTIsXWR+LqC+JicpRWC9rG9dOi1hmp+K9AKt4=;
 b=dQ3SfhqNqmARr38ru8TynKqhSjPXCeVLIgMloCFYxENZw00VTeSD6VdTndOWbfsUYO
 oCB8b7u7QrSjgHShxjtWf569FSGst0J70eJz+I1OeN7MgF6Nu61s2KczQV6uAqY0elly
 ERQH8qRoQ+Q5TNkEndCEesxJ4fsUU+oVJtuYjkb9SMeNYo0g2E2zirhYBzIOr26YP24S
 sAjUG034xxzdDctirXEl7FBebeAmOwgeVEwo3+bl+G1kK2dkWn9VghBDq0ydpiIM0n82
 G0oR5Qm11em9omZCraly4xZ1mpVcjy79vZbRcMsUBztkC0WwdaH8p+WKIk5bao/H2/rD
 5qOQ==
X-Gm-Message-State: AC+VfDzgGyxtJvKJJPk8PXTH+EGcqbBNax/CzamcOMwwqzAnlPG2pwYE
 8448rDlQh+bfkwTP8vk34GEWkDb4qkQ=
X-Google-Smtp-Source: ACHHUZ7dizlXI6hVaZ+RaY3BNeTDSUd8Ko7VO83X/pt9wJ4lPY8NsLPsumX4egRDWFTB6cv/DCWPzw==
X-Received: by 2002:a5d:9c94:0:b0:758:1fa5:f086 with SMTP id
 p20-20020a5d9c94000000b007581fa5f086mr9384657iop.17.1682989694343; 
 Mon, 01 May 2023 18:08:14 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:8257:a536:d7fc:1919])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056638329000b0040fb5d5429fsm4836329jav.131.2023.05.01.18.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 18:08:13 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 4/7] drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
Date: Mon,  1 May 2023 20:07:56 -0500
Message-Id: <20230502010759.17282-5-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502010759.17282-1-aford173@gmail.com>
References: <20230502010759.17282-1-aford173@gmail.com>
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to support variable DPHY timings, it's necessary
to enable GENERIC_PHY_MIPI_DPHY so phy_mipi_dphy_get_default_config
can be used to determine the nominal values for a given resolution
and refresh rate.

Signed-off-by: Adam Ford <aford173@gmail.com>
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB09703CFF
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 20:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FC210E24D;
	Mon, 15 May 2023 18:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5AC10E24F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 18:48:59 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f27b65bbf9so4361974e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 11:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684176537; x=1686768537;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iTBWs9VN/AmEk5vXMNYksrxne0o7kn1chFKcCzHHpNU=;
 b=OfaA86AQomUNauoaFFPAvp3N+WxOxPoBcEeP/Gjw1guhaydm3FI/3cQZlWmwOCjFPi
 X8gab610LUS17dQH5D4A13bMC9ARjpVwDt2glchCCIUO9CtoaGpTJR3YSnLRxnBD36/U
 Ts0l9jG+xFfL8jWyHT6jKuqdpRPd1onYvl1I+K/jtkdyA7XuQiqGyvQPrCR2Z9DRhOfZ
 ETv3nrX3aQILZjZMsswt9S/upRVOmL0Zz3Q9xDa+22ONb0fxYulAiIrW8SGG2xhTFvhb
 OAYWmxgQXvMk4VKX6BWPVc/CdR4kaDIzq8eNdTGEencaRY7v5S1MEaldvYge7eUazfq+
 grTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684176537; x=1686768537;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iTBWs9VN/AmEk5vXMNYksrxne0o7kn1chFKcCzHHpNU=;
 b=a3SKPW5Ip2PlIF3lDnEZDXvqdyLbLdaR8nKQMBaDApGeQga2zrYXMy5srBIY5e1SDF
 AGR+yhNIJdS1pjv3A23TR6nPbaHDwvlBtfMYhjH5LcdrXscwk7dZpiutAes4TiGLgoMQ
 /8I1EVxuH1dI7qRN6XPixxrzhUxv9Q0HWcu6Z7HK2G7LKm8zX6lw7PgoYP1OmG+mhdth
 9qRKSzkEPI7zh65yslJQ3B3TJdQsZE58yb24YIKyfJAyTB/gLepVkSuSQxNAZKU0+jYh
 O/3wYmDQFWGqySYyJUzKH4Mwbm6SL6NUyWinaflN41RPDpax0zpGA8ymKMUDCLK7p/Lv
 9x8Q==
X-Gm-Message-State: AC+VfDz9FvA7wUJRMvXSQkcvVY3D+5tWIex5s194iupSRYKkPnxP7IxA
 NKpnkNeKFL3uXlcBGA0qMXQ=
X-Google-Smtp-Source: ACHHUZ79wHJB/Ghdi7Cm4011cCmntxQXuFSxHB/31ZlUzeFBiBemCtGnbVt+2cD1sM0VJ+L0Xyrh5w==
X-Received: by 2002:a19:5214:0:b0:4f3:8411:f146 with SMTP id
 m20-20020a195214000000b004f38411f146mr913589lfb.68.1684176536567; 
 Mon, 15 May 2023 11:48:56 -0700 (PDT)
Received: from komp.lan (83.24.33.169.ipv4.supernova.orange.pl. [83.24.33.169])
 by smtp.gmail.com with ESMTPSA id
 z5-20020ac24f85000000b004ec8de8ab43sm2655742lfs.139.2023.05.15.11.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 11:48:56 -0700 (PDT)
From: Maya Matuszczyk <maccraft123mc@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: panel-orientation-quirks: Change Air's quirk to support
 Air Plus
Date: Mon, 15 May 2023 20:48:43 +0200
Message-Id: <20230515184843.1552612-1-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It turned out that Aya Neo Air Plus had a different board name than
expected.
This patch changes Aya Neo Air's quirk to account for that, as both
devices share "Air" in DMI product name.

Tested on Air claiming to be an Air Pro, and on Air Plus.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index b1a38e6ce2f8..0cb646cb04ee 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -179,7 +179,7 @@ static const struct dmi_system_id orientation_data[] = {
 	}, {	/* AYA NEO AIR */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
-		  DMI_MATCH(DMI_BOARD_NAME, "AIR"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "AIR"),
 		},
 		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* AYA NEO NEXT */
-- 
2.40.1


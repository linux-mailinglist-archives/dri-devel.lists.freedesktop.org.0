Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC3473923B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 00:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CF010E35F;
	Wed, 21 Jun 2023 22:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDED510E35F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 22:06:35 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6b5e9468720so303836a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 15:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687385195; x=1689977195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jApRl3G0nkzGeB1EhFPefA764c2ImCkJh8aeW4stjc=;
 b=qWwGDjfx/htff5ZCQv4bhJl6qVZ402as0zi+GPq9gnH0tcm3OvYV90ONqlxZrY0wqy
 KMIgpP7b8ssia5OOWn1HNNUP8x1ksfG43NnEVF5nbYpQzaAaPjkqeElaWgPKiC+hWJzs
 Ppm8iyCBiF6vwq+DcTHZB+iCA8G2nDsZzdcirC64lqp48EN8juYbC3upMlAQiEYB3hg2
 hT8URX4OmWSGkJ38pfCJMsRX3lp1ZwBRhuBVLNJHauuoH0KlxWVN7xmuYG1nSR19rbEl
 VEO4Z1/5onet7qUHGx3/725+F7/KbXQqYEit2k6IR7dPd8tNwORTVkTgnYvLCsJ03CGn
 cTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687385195; x=1689977195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0jApRl3G0nkzGeB1EhFPefA764c2ImCkJh8aeW4stjc=;
 b=kTyDLndwN0C0X/LQDkCuIaOpF8nj7lYMbCoj7x/LwqW1fNHybaBNnB8zASQUB0EnZ0
 HPGuSjvNzqjd2QKbUaT0wFiaJ/dNCYzb9zx57UpxOqY1aRu/FAQZ6rROy0dULvszfb00
 ihujb7HuFFfUVVmAZAeknkwrN6oj7akL20M2lKlF3SFxMBluzOOkaI+9ClIYyHAJ2Vio
 IfEHMoCPJ5Jb5y28fet29vlP1PU+dqp4/zjUEhVCMBzu3bPcSP4BnxAYOxii4armJoXn
 16ejOqhopYBZgtLv1aX3Rr5X2JcyDw8Ci0kJ39NRBVusw3aEH3/nB9kOS0elO7lE3PDv
 yvQQ==
X-Gm-Message-State: AC+VfDxC/QlojW3LEESN4DdZ3J4WO/YjrewH7zrCJdc55Z/pYBdy5hAP
 Io9NIcHG6GuSkaWpc8xO+NU=
X-Google-Smtp-Source: ACHHUZ4m/2C8LBVVKAkNrxewirUwQ9FLO5rveJ/sCX6cxuIGS+SuiwZe95rXFzQfq65EFjOR1oslNQ==
X-Received: by 2002:a05:6830:18f8:b0:6af:78cc:e489 with SMTP id
 d24-20020a05683018f800b006af78cce489mr17541148otf.26.1687385194647; 
 Wed, 21 Jun 2023 15:06:34 -0700 (PDT)
Received: from smeagol.fibertel.com.ar ([201.235.4.68])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a9d7d07000000b006af8b60e2c3sm2288987otn.74.2023.06.21.15.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 15:06:33 -0700 (PDT)
From: =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH 1/3] drm: panel-orientation-quirks: Add quirk for AYA NEO 2
 model
Date: Wed, 21 Jun 2023 19:06:13 -0300
Message-ID: <20230621220615.1253571-2-samsagax@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621220615.1253571-1-samsagax@gmail.com>
References: <20230621220615.1253571-1-samsagax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mripard@kernel.org,
 =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add quirk orientation for AYA NEO 2. The name appears without spaces in
dmi strings. That made it difficult to reuse the 2021 match and the
display is greater in resolution.

Tested by the JELOS team that has been patching their own kernel for a
while now and confirmed by users in the AYA NEO and ChimeraOS discord
servers.

Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 0cb646cb04ee..4b428792a3b6 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -170,6 +170,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T103HAF"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO AYANEO 2 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYANEO 2"),
+		},
+		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* AYA NEO 2021 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYADEVICE"),
-- 
2.41.0


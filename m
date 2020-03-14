Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A41855E9
	for <lists+dri-devel@lfdr.de>; Sat, 14 Mar 2020 16:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BBA6E17A;
	Sat, 14 Mar 2020 15:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D6C6E17A
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Mar 2020 15:30:59 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f10so13845370ljn.6
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Mar 2020 08:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s4J2rgtw2eg/k9wTAwL2QWWPRrjouBROxRXix47qXXA=;
 b=eeZgAO11rjVHokvwfCwtvNYv1RnJFDSvsZAI8b10ImlXxVkVm3jvuEKwTasfF+VfrJ
 jU8/y/JQD20cGXpk+pKPplmXiRYW44YNPwQPGQsKhnVPknMPzsLtitvFooALy9SZj37u
 WjipD5nFDcXtUwKPsCiVQNVijmuDtQ0a92gmdW9kSc9f0FYnVsBAG0A2edWw70WjVxyN
 9pVx6hPNAcsJCFEaE7qnuM0TUoL0rdaqWrBkLYGBI+EXgwaCP7D++7Mm81U+Wn3l2/Wy
 0i4DJnpYdpWV/t8QCh4jkOtfO6JzpnktmspxnuHujd951KVtCUG2d7Ix2M4SHHC5X6XS
 UVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s4J2rgtw2eg/k9wTAwL2QWWPRrjouBROxRXix47qXXA=;
 b=KQvvNEQDhNHv/VfY/U8CVsTJb8evDLSh+9hW1ZVZkExGDXo1oomftPWBz+AQuMbeEC
 CrkKZoNRWeV+idUbJXMMw7Mfn7CqUXCdbe6KIC4D4exgOLzTIAsQQO61GJaWs9DV+AUk
 cO4CL7A1xS7w4wV/jl0pRCopDBdcoXQjK0bGoFt6+g629LayOSKaLdC1w2yua4BDPgkO
 xD78ErzkQHCe98qI2wZvpbAie824z4pqJmSMly/UWmKro844pj0zjJyHSMDkUhZefzQE
 UJPl/5rg0PFlFZSgEkztoEKiEA+hrb5kvLlhpe5TxbwEnOPpbmgT9dMEe8jO2Asymjgb
 9vOQ==
X-Gm-Message-State: ANhLgQ0NlkYBHpFEoQN5w9v0Jeoj+n5c+LnUZVKQpRkbMV/tC5nsSG6E
 kFtYPgKvrnB/u1sY2y4WUpI=
X-Google-Smtp-Source: ADFU+vtrVcONFH7pz/7NWnIu9V/AlfW3A2RKEfrD4+SRdas3uaHOlK6KWEbm4MJiqWyDE6iRUsRPKg==
X-Received: by 2002:a2e:2e11:: with SMTP id u17mr11366418lju.90.1584199858438; 
 Sat, 14 Mar 2020 08:30:58 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n200sm15650418lfa.50.2020.03.14.08.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2020 08:30:58 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v1 2/3] drm/panel-simple: drop use of data-mapping property
Date: Sat, 14 Mar 2020 16:30:46 +0100
Message-Id: <20200314153047.2486-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200314153047.2486-1-sam@ravnborg.org>
References: <20200314153047.2486-1-sam@ravnborg.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "data-mapping" property may not be the best way to describe the
interface between panels and display interfaces.
Drop use of in the panel-simple driver, so we have time to find
the right way to describe this interface.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 0ce81b1f36af..3ad828eaefe1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -361,7 +361,6 @@ static int panel_dpi_probe(struct device *dev,
 	struct panel_desc *desc;
 	unsigned int bus_flags;
 	struct videomode vm;
-	const char *mapping;
 	int ret;
 
 	np = dev->of_node;
@@ -386,16 +385,6 @@ static int panel_dpi_probe(struct device *dev,
 	of_property_read_u32(np, "width-mm", &desc->size.width);
 	of_property_read_u32(np, "height-mm", &desc->size.height);
 
-	of_property_read_string(np, "data-mapping", &mapping);
-	if (!strcmp(mapping, "rgb24"))
-		desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
-	else if (!strcmp(mapping, "rgb565"))
-		desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
-	else if (!strcmp(mapping, "bgr666"))
-		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
-	else if (!strcmp(mapping, "lvds666"))
-		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
-
 	/* Extract bus_flags from display_timing */
 	bus_flags = 0;
 	vm.flags = timing->flags;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

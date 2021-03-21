Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4EE343223
	for <lists+dri-devel@lfdr.de>; Sun, 21 Mar 2021 12:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18976E1CD;
	Sun, 21 Mar 2021 11:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A2B6E1CF
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 11:43:49 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id o126so7390093lfa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 04:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DZAOWxxQmGAQuM4XepxTafRxS1Q61Cev/HyKLtTHaVA=;
 b=w2mzVHFsGABvESXvpg62uBCxQAmrg578CvIcCYxmH4LrQtSeP3aBLEoV6Db2VU6JnB
 MHJ+QMjK4sELQNu7le+Ci9m41YnS5OPPA79tnsOpbDMdPkT4iWtELnh++YaIqno+9yDh
 isigyg+dqtQQ4FkyWb5cit/ZgrvRHf2EHSJsGRgKb6j10O+dWEBIjpUseXjON+YjKRai
 C52PRcjb6oiCl1BBlVh2VSK5bUqyt8z+VTRrksEjrkhlplomczGbgjU4v7TzCH9gIlFT
 IwrHjGJnv/XEnf6+a5a+WhmB5NfFjvtf7Of5zfZlQKSjZOl9Ly1XySkDQ0NyNaGvfo21
 cjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DZAOWxxQmGAQuM4XepxTafRxS1Q61Cev/HyKLtTHaVA=;
 b=Z0Howd2oevYjNPh85Ibbu7W4muGYsoRWleWGWhtXBZN6ncyszEfN5tiQLGyCpeTQnP
 z6knb/LI6ebvj5li0bUWtV3SUjN3djJO0b2rGlGhndr81ah5mb0TySuk66/56erWPCN7
 Ov4t7+FLdCYpYFNJKGsfH8onB3pKKuB4uSsKyPu1XepIgvi3zuNjq+WDe5mLgBDcFyib
 aVsEAhul58hVt+uueI7iLsT3kmNi6Viq43EiGUSUVaSC2H10xsBHjSJMrUHl+Gu9H/K8
 w3DCHhOzB+P5D/Sg1RnB4+jCxVEevbEeFbS0WTDaMh8EApkdHSKOjhSTT5Mp/KyL39/4
 tSsQ==
X-Gm-Message-State: AOAM53113234BcW5TwmMpdm/1JRI6Y/pEqp247ag2cED1tkNrpyP4Yej
 E1tFNXCRMf1vuhi0rvuuJVZbFA==
X-Google-Smtp-Source: ABdhPJxUxJy6LTVbeIScMxn4yaCtVOuNxGvSUtM55uvryyCVgTyNR14MMom62Zkl1vlwXwgt6Wwb6g==
X-Received: by 2002:a19:ed03:: with SMTP id y3mr5864228lfy.377.1616327028248; 
 Sun, 21 Mar 2021 04:43:48 -0700 (PDT)
Received: from localhost.localdomain
 (c-d7cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.215])
 by smtp.gmail.com with ESMTPSA id 197sm1484419ljf.70.2021.03.21.04.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 04:43:47 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] backlight: ktd253: Support KTD259
Date: Sun, 21 Mar 2021 12:43:41 +0100
Message-Id: <20210321114341.944696-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210321114341.944696-1-linus.walleij@linaro.org>
References: <20210321114341.944696-1-linus.walleij@linaro.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The KTD259 works just like KTD253 so add this compatible
to the driver.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/video/backlight/ktd253-backlight.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/ktd253-backlight.c b/drivers/video/backlight/ktd253-backlight.c
index d7b287cffd5c..a7df5bcca9da 100644
--- a/drivers/video/backlight/ktd253-backlight.c
+++ b/drivers/video/backlight/ktd253-backlight.c
@@ -173,6 +173,7 @@ static int ktd253_backlight_probe(struct platform_device *pdev)
 
 static const struct of_device_id ktd253_backlight_of_match[] = {
 	{ .compatible = "kinetic,ktd253" },
+	{ .compatible = "kinetic,ktd259" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ktd253_backlight_of_match);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

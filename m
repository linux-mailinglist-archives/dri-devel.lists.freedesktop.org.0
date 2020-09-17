Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA4B26DD88
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B8B6EC2C;
	Thu, 17 Sep 2020 14:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F9F6EA1B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 11:56:31 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id d6so1058941pfn.9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 04:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mwiQFVnuTHeY2gHO84RjfglTiONbgKCnCABvveUVThQ=;
 b=fog2lnoBs5qYsr5GrZjMLZkHrGQzLIkBtCDjTB6v6YavrHLMIaty8smqYvFmhhMSG3
 /0oWuGGlHgQ4Qmq6Tgzhi73UmJBCceymEh9Qb7pogguXjlESeoA0cXVCOdH6WYggopgS
 hPmPcr3Fq1xge9VxAkQcMfxfIqbHyCHSznSrOPn7N7pM8bfElXrjMK9Dnekm0/Vdv/tt
 M8mplQV1BCO+z1S9pm9dNswcjKy0W/wJN1FfwDltHSnP/LKHy63JEZfwKsKYbm6U8Eh6
 YEvlwNz+CfywCbuGKHbx3ogbeEkqp+3Oe5CkzAAznQ6GNqqjhSblG/CIj6ZR33qnOSdY
 LjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mwiQFVnuTHeY2gHO84RjfglTiONbgKCnCABvveUVThQ=;
 b=H6v9UOh2vblg9nXEj+kQaC0WblSrBPFebL3k/yciTvXH9WJqqCgJr3MFmx5G/mzzAv
 f5lQBSPsCabMOLB2YwrETlTOtrvwldBaMAO/yIl/HqQWPLQNXInWjMIfxnYEmCXHQFoZ
 GyBUROF5Sj0KjDxc5ZUeYuBPZUMy/zICAHFhF4tq4ANHPCkvnkuzuZZXYjnY4/EdkYom
 VAEXVEfYOufovwgVucsz90NHmY0EFpxVnRk6x0odgwxbScWLtSdMlDwLDnspn4By2ilG
 mXvudTyesbUapzpdaIac85jSC9nYeAlLFPMar7FpBMgRDtZx+XLetw+YTfRcI6caVn+Y
 Mx7Q==
X-Gm-Message-State: AOAM530humgXMxGBauEcnK+InNMs2RqlADzhCSFRmUPCOdgxlbCQlrnb
 Lew2aZHr9cASZ8Hl7BkysvU=
X-Google-Smtp-Source: ABdhPJy5/dKEi8cR2pyPna5g/BJeYZVG7ok2M5MO3E6XURpkuvyW2XKc2jQ9nQoMnhscG7Sd2OX2ew==
X-Received: by 2002:a62:3044:0:b029:142:2501:398b with SMTP id
 w65-20020a6230440000b02901422501398bmr10772327pfw.80.1600343790923; 
 Thu, 17 Sep 2020 04:56:30 -0700 (PDT)
Received: from varodek.localdomain ([223.190.62.192])
 by smtp.gmail.com with ESMTPSA id z1sm20174720pfz.70.2020.09.17.04.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 04:56:30 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH v1] fbdev: aty: remove CONFIG_PM container
Date: Thu, 17 Sep 2020 17:23:14 +0530
Message-Id: <20200917115313.725622-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 17 Sep 2020 14:07:28 +0000
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The changes made in below mentioned commit removed CONFIG_PM containers
from drivers/video/fbdev/aty/atyfb_base.c but not from
drivers/video/fbdev/aty/atyfb.h for respective callbacks.

This resulted in error for implicit declaration for those callbacks.

Fixes: 348b2956d5e6 ("fbdev: aty: use generic power management")

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/video/fbdev/aty/atyfb.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/aty/atyfb.h b/drivers/video/fbdev/aty/atyfb.h
index a7833bc98225..551372f9b9aa 100644
--- a/drivers/video/fbdev/aty/atyfb.h
+++ b/drivers/video/fbdev/aty/atyfb.h
@@ -287,8 +287,8 @@ static inline void aty_st_8(int regindex, u8 val, const struct atyfb_par *par)
 #endif
 }
 
-#if defined(CONFIG_PM) || defined(CONFIG_PMAC_BACKLIGHT) || \
-defined (CONFIG_FB_ATY_GENERIC_LCD) || defined (CONFIG_FB_ATY_BACKLIGHT)
+#if defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENERIC_LCD) || \
+defined (CONFIG_FB_ATY_BACKLIGHT)
 extern void aty_st_lcd(int index, u32 val, const struct atyfb_par *par);
 extern u32 aty_ld_lcd(int index, const struct atyfb_par *par);
 #endif
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

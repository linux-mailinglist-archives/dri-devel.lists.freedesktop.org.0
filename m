Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1986E7F053F
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BD110E1B1;
	Sun, 19 Nov 2023 10:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D223A10E1AE
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:14:59 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9c603e2354fso649638566b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388898; x=1700993698; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
 b=Xt0KFG/SnE+1Ua7fqzYJwVnq5MA9re8pAHZObD2HXO6LzOdEUFiqdqXYeKfGWVQ3Rh
 an9Tz3cRNuXq5YO3xL36vsnxZyTpPo02mZ6yvTjU1uP7mGCMDllxc0Sh0YDNgI4wn84R
 eQ6SEfHuZ/yQC/DW2Gn7QkNy5oqgHwnqOdsOcn7Wx51Q/f3ByP6Up3zzLUKCz9OrVz0w
 JQVT/5Lw/WwEi3qBwWDeIkkPma1253pdrUfIKzPI1j5Sta0mpcKP23en7eUiGNZ+tpDG
 MRez+vy5Tfn1/ri0wt+am0OIu/NmBBVijov7c7MvzQMNQOAWMxcJh2+w1AtSdD8Lu0J+
 qM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388898; x=1700993698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
 b=imBVJmO9o3pPwPnHSO4UFwtHqAA383CS1EaFGCRTIvLSIE/g/5jvzIK8RpQGOAcey0
 WYYwOtyX7Ib/vOwAEleOBI8uasFq8Q1oROqRkeGLbMk4gu6BPZsZ8RBZ7oQRUtWWrn9y
 hkyQ90NeIMzpE0aMH9SyLJvggHBCummVPfOl7xbnhSjBzFQaob8UlwNX7dHkFuFLy/e+
 FRinKFl2C7zvi1uiIXuCSIhOQkPec2EZS7FXGrKo/xcP3t21+KUTrp2KK+VKvCVffj7o
 iLhquC1YjxLfo3VI+G3kT9sue2qloanxHZ4gCeCpZjNt6NPPf1HKRnhzi2HmE5i8HBvI
 IbXQ==
X-Gm-Message-State: AOJu0YwGV+CwEcTfqje1+e29ke0C7XyKBEcbbobcat428eu2DdvbeMp6
 NWlvLZSeOg7cB3LMueyi1gs=
X-Google-Smtp-Source: AGHT+IHFle1RXfTk6vKi5iOy+vzFpLJkczRWQhYONzqvKagrUs3pBjmQadRi0jtysCiaCW9sqta1Qg==
X-Received: by 2002:a17:906:c111:b0:9ee:9d98:7d8c with SMTP id
 do17-20020a170906c11100b009ee9d987d8cmr11093291ejc.6.1700388898244; 
 Sun, 19 Nov 2023 02:14:58 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:14:57 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 10/20] drivers/video/fbdev/cyber2000fb.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:35 +0100
Message-ID: <20231119101445.4737-11-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119101445.4737-1-hkallweit1@gmail.com>
References: <20231119101445.4737-1-hkallweit1@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/video/fbdev/cyber2000fb.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 52105dc1a..79775deda 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1234,7 +1234,6 @@ static int cyber2000fb_setup_ddc_bus(struct cfb_info *cfb)
 	strscpy(cfb->ddc_adapter.name, cfb->fb.fix.id,
 		sizeof(cfb->ddc_adapter.name));
 	cfb->ddc_adapter.owner		= THIS_MODULE;
-	cfb->ddc_adapter.class		= I2C_CLASS_DDC;
 	cfb->ddc_adapter.algo_data	= &cfb->ddc_algo;
 	cfb->ddc_adapter.dev.parent	= cfb->fb.device;
 	cfb->ddc_algo.setsda		= cyber2000fb_ddc_setsda;


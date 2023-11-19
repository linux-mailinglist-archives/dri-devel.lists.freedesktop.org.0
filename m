Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579CF7F05CD
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A96C10E1CC;
	Sun, 19 Nov 2023 11:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649DE10E1D1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 11:28:45 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-548b54ed16eso121498a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 03:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393324; x=1700998124; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
 b=mhj610T/tFWoTDM/7okNCFL9NRHD3v0FhKSJfaEbi6orxY8Ub1TJUXeewCWO+n7IMd
 +K2WDYQoveWXVOA11ppmlzCTgoCeP7pn70tisaWT33buPVmDJqH1VfvirUEqIk/PgPEi
 j5e4PWusbbmkMz3C9qdesTcEgMBdW9ZepcNo2aF6aDb4q1qdqpJY/B0fbW93sPTLG3iK
 5V8tLiZ7bmWU0ClvNJ4OixQOFADutlWylhQ16NWSvPPr/7sHzRxIz6X5rZcriDQ4lOaK
 OPhsEEASpteHzjvdvV7+sB1zAHONjFQzKkhGe4TEfim6rftCDv4tPxeTuDohwQ3miwfC
 pG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393324; x=1700998124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
 b=JAu8UqRyI7nIidW6RNc/sSV3cceUux3rbDNCfcWouWEmi8Yuw1huy+aSClebaY8Tqt
 H/WEGblAR2eae0klcQ22KShgCk/h4pGOLOSCz/LG/+1YB1Y2QHaJZtOHraxvojWgAeoO
 CiYqRk5opMhNIsx7BHf0w4DCkeVjSsAdUtcws2dKKtztLIW733rDzDwdSxsUX6P4P8nI
 sNszXUkkou/7N0WAcjDi+7GhnmAWMkj8O4T6V90GZspdT/IXOijxePSfgs0R8X35Ns5J
 H32d9OkKnrILNgwi4U0dtbc+IF867UVBb0Nuj/U+GTAOLgk5l0b4SYgCNg16hdpnn7IF
 UcuA==
X-Gm-Message-State: AOJu0YwI7M3cLO4+keIEcKCu+cluxvuZBlYMjIiYke0K/pyThxGSZ7PR
 Vt5yvnNOR4J+Vwr6k7k9CWs=
X-Google-Smtp-Source: AGHT+IEvkXiyvHrlLOpdjdZVnWlbUgrD89NC8HGpVTBiL34yZJObBE5/8pr84pk4cSZoZHrmT9MXOw==
X-Received: by 2002:a17:907:1ca4:b0:9c7:5200:e4f4 with SMTP id
 nb36-20020a1709071ca400b009c75200e4f4mr5046586ejc.41.1700393323809; 
 Sun, 19 Nov 2023 03:28:43 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:43 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Xinliang Liu <xinliang.liu@linaro.org>
Subject: [PATCH v3 16/20] drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c:
 remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:21 +0100
Message-ID: <20231119112826.5115-17-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, John Stultz <jstultz@google.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Yongqin Liu <yongqin.liu@linaro.org>, linux-i2c@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
index 410bd019b..e6e48651c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
@@ -81,7 +81,6 @@ int hibmc_ddc_create(struct drm_device *drm_dev,
 		     struct hibmc_connector *connector)
 {
 	connector->adapter.owner = THIS_MODULE;
-	connector->adapter.class = I2C_CLASS_DDC;
 	snprintf(connector->adapter.name, I2C_NAME_SIZE, "HIS i2c bit bus");
 	connector->adapter.dev.parent = drm_dev->dev;
 	i2c_set_adapdata(&connector->adapter, connector);


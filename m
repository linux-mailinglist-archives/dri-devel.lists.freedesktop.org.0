Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 071E27F055C
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088A910E1B0;
	Sun, 19 Nov 2023 10:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE3D10E1AA
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:15:05 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9de7a43bd1aso460286266b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388904; x=1700993704; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
 b=BB48L4Qwi78zV2e4OfopLe4VGKxDEffoF+W9wgOhIg9W9ha5La5RrhTTXhpkdyus+F
 ma/RYMyTN50aLPdg4oUirTC5/R6y0Vi5S14P1RMzmvojzTngW6HkH9qFaWWEIEfqPW1y
 GPtCI03JrFD8xbyU9chvUFfTkouLycUyKqmmgF7RBcqCIsEMvZTfJqadp0tiXBeCzEXW
 3KiPQaXQTb2Uxa7d7BPfQu9slyc2boitDm2cIDEvM5pAjoQiyRzJ4KqcXsDyfssAcF4/
 1vLNVU+Tvle4Iiy5/c+aQJwgZynEyBz4H3DbedvSuwrdQ5lNN61oPmBOPImfIFxVhoFW
 8nPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388904; x=1700993704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
 b=L3Kpzoy2uRtMB/8UQP++UkmQxnXyLwYaE/vrXX4l1nEgFQZm29F+dTSlWdKVSRNkBI
 +yjOinkgcFnPicuFhBv+Au7P+z14wotefBpqshKCagZoI5nvgtm6xdZZBxlAg2XMLFob
 O5zDGoTR1VvfxFwM2+F6vib+wj9VjwF/bk7ofFXYoPIU0plUFI8rkh9JCh9w9dHM7lun
 +9+/R2HNVZdTCsuTz6+8K3IRLIiOPUJ7ufk0aBEMgZjhrNhXPIX3MmpGoB7+9RddxOxq
 NxZixy+wirtSHb0x1tIxF5bIvLuvXDuo/vMP5J/h/cWIDrCgRw87DAhrkc7nNEmcLnlx
 Dszw==
X-Gm-Message-State: AOJu0YyOJq19G4s59v/XfTJ7zCn2t54TvMCWhAYUnLnr6Ng9lyQb5D0P
 J7UaO/XePmL2vBp4yqS1pjA=
X-Google-Smtp-Source: AGHT+IE8GHFq7uiHSNV4+P+yG9Uk8xKqFaoBRiYyFD0p/QlJu9rTxI9UZij7OIQ47Q1zPCUxvVwxGw==
X-Received: by 2002:a17:907:8b90:b0:9dd:7133:881 with SMTP id
 tb16-20020a1709078b9000b009dd71330881mr4222135ejc.40.1700388904176; 
 Sun, 19 Nov 2023 02:15:04 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:15:03 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Xinliang Liu <xinliang.liu@linaro.org>
Subject: [PATCH v3 16/20] drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c:
 remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:41 +0100
Message-ID: <20231119101445.4737-17-hkallweit1@gmail.com>
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


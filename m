Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F0F7F5B6C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2193110E704;
	Thu, 23 Nov 2023 09:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E1110E6FB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:41:00 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a002562bd8bso135524266b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 01:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732458; x=1701337258; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pq+FEnQba7Sk+IX5HM84oJaaaLkn3lu8uiYE4NrIrFw=;
 b=MK5xYJok+x1GFDAs/PvhZY4ctjLebmJ2c6+XE50GSsZuAfNWwx01JinrTVLFQNfd4W
 z3aP9RfBBq8t7Fcd8S2c72AOeyUkY/zwBUobR07UVOBGl4RiH/GHHbgU5QKX4qjDyxMR
 C7eIoXdMuMY1on65EbUBGPKoGsViebIiONkdoaa+LsULbUidu6bXH3emUEygL/4uVhLY
 5eSFzu/wr0+o71d1ms9r2ncHI2Msmbv5KCH8DKE5yDgxQw/7rHDM9/qyPkhhVnTJSKkJ
 vXq5sgbrXDx5xSGVHP9EPlobz2OBzjL0Yk3LM7AhoVfuaRcJIikqGqcznPTMMaZFo6MS
 +iDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732458; x=1701337258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pq+FEnQba7Sk+IX5HM84oJaaaLkn3lu8uiYE4NrIrFw=;
 b=n/Th1XiOPQe3MExOzOAaBjAf3WaNP0CyixzQmcG4XXrzIHVHYep3lh+bQH7h4ioRib
 N1nWtPcyWn2VCgJgTKQMBtL5MjQjeti1b5MZu7LLcFvDaR7m14hfh7jAd4wUnjESdk/z
 9L659N9obsvwFyKRYalZj17QNca7ZKGmZO2tU4ODsWwzn5EiiXp18FpR72GyOxgkk36a
 LewK0zquhL1WCOJ0ZRjADR1xNQyjqr4bqhqdu6lVp0RqcCwbJogHnswsBSpxQ9xbleLE
 vOYi86piosj4AGFm5aJfq9zEyIwWXgeR8wLDidvethCj18p87xFMM1jJxJlX4HU3CyAs
 Nbaw==
X-Gm-Message-State: AOJu0Yzos+rgom4Gr7c0stEH5ZuizJKWXnhzTK7adhI6WrTXnbeD2Iup
 jWJqsf2E4Z4pg6Em/E+JyZM=
X-Google-Smtp-Source: AGHT+IHo0GBiadovOU1BBR1oWkASv65VH9/WnHAU5a3ZhwF8MBuNzgNR/J1hpFuh5wSinOqeTq7u8w==
X-Received: by 2002:a17:906:78c:b0:a04:e1e7:d14c with SMTP id
 l12-20020a170906078c00b00a04e1e7d14cmr1774196ejc.32.1700732458571; 
 Thu, 23 Nov 2023 01:40:58 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:58 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Xinliang Liu <xinliang.liu@linaro.org>
Subject: [PATCH v5 16/20] drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c:
 remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:36 +0100
Message-ID: <20231123094040.592-17-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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


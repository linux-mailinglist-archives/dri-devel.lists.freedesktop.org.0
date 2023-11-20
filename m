Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D947F1F9A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F158D10E1EC;
	Mon, 20 Nov 2023 21:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B47910E1DB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 21:46:44 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32d81864e3fso3103238f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 13:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516802; x=1701121602; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
 b=I/1/HWsbncYSki75Nj9m4nADbZeazAnBOk7fy6FDcRRvjUsHG1xoO+a7dC2LejeZUo
 j7tP4iv/02RCHgZsassF1G6yITYrCQeJOEc5cAkQS0SoHpGzjqjeYuajfkArRMSh9Met
 Kh1y5mq4X6lPsyVL/A6bY+Rk6IjetRoO7/pgE2IQyMsObFspi0nxu/p05bEGjclxEhMa
 OGXoyeyvYtHYSoarwMvV+RUIvBN9RW2hidsj/aEdNahwQ/vRI5F7qC8+xrrz4wdIjDOs
 PrOeFS21dSmooPzvyW7Vntznrm5Hw1Xx6/ces7FZ0f7adULRwv65fEYcuDrFRFseGXj6
 kDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516802; x=1701121602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
 b=oztpl1nNC4lJeDBWlGguXEHOqJFBQf3JPzAKb0N+gMlPb5KRXSDT6RcQnPcfM3vSYb
 8uGlB9mN7xELph+C845/J+ydLCATRhCp8SxwxRB9R2Dge0ioOZBlvuDaNlSw7jkxN5zY
 sv/O3RrQdw6bBT7Hdw5iT6YnoVCUVdhLh/yHUXnqWNXcLnyjNW/t43Kbd8l451HR/4is
 4RkOVxS8nypgYgXWdzJthAsQn+WKBHLkpLGPR+bVNCY5IPt7r9S+xFgxbz7xGZOjTIJH
 8+h+p2Z1D6PDYs44zY0sZStrUbPu0h28r8n8aTgqZLJhE1tzV6wbsCHWc5YTmvjGJsPO
 pejQ==
X-Gm-Message-State: AOJu0YyRZwhCKRJj/VhrR0yreK5RuFVGpXJxd9psSFJWf1Wl1gId2Iz5
 5XUBPB3YFYKlrEjPtCXJrd4=
X-Google-Smtp-Source: AGHT+IGCNvJ+s9QKyAFCEyfQzE+WdN1YcyTEOm5eawrcWLv+hW9plFQx2WrzNQnxKdHkttv2+45PsA==
X-Received: by 2002:adf:ed45:0:b0:331:41ab:22ad with SMTP id
 u5-20020adfed45000000b0033141ab22admr5898305wro.20.1700516802375; 
 Mon, 20 Nov 2023 13:46:42 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:42 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Xinliang Liu <xinliang.liu@linaro.org>
Subject: [PATCH v4 16/20] drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c:
 remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:19 +0100
Message-ID: <20231120214624.9378-17-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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


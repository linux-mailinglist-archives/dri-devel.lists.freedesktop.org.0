Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF3EAA44B8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 10:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C3F10E6F3;
	Wed, 30 Apr 2025 08:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rqgEarYT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADFC10E71A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 08:03:51 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso46222445e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746000230; x=1746605030; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PAFg7e7QoI/NIhOM4U0ox4at7LqC43f8tqWtCVElvxY=;
 b=rqgEarYT+EgwlBnDr35qHuqFM32TKf4jwG5DDtjtXFfuphZqV5akVT7qOlGdwn7gWP
 x98M6m/5fRIlMFzz7GOte+pjrbUVmxKt1wB0JfRd4p87qFQYT3MUi7N5E1ckTDik2mn/
 QHO7cq0opdidyEu5fWBBFrscHoUoBaXq28LV1kG3kU4gKL2VuGOBQxN2rJbPxGP4KeVi
 vuP37WzUue7KDdDn/Inlzwz3S3kSD0p8evQrVnFr72X7Bkn+kWyW7GFFWMvzayReWwmr
 0kIT8pSwPDwofCU91TdFU3oKdXd9LrTdbC5bxbh25ZobuGKBLX3oPmOKabej8mlioljY
 mxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746000230; x=1746605030;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PAFg7e7QoI/NIhOM4U0ox4at7LqC43f8tqWtCVElvxY=;
 b=nps06H7lmbVqkS/gXKp0cHtkEIrjeuQ80n+JkxxsNby2MsQPaGMYR5aLSEqAHunP6X
 ns3E8fT8gqruMDg5j75x44/mvhgKLWEI/v2FrA8SeVwN+yrGSL26MEpa9F9HLg6wo8IU
 sPauNiY3uj2ki4dRmXijhb5Iv4UBbnud8RWlJh/87eBGOTAmT4RmzKO6pU2VD5Az2Wjb
 C6C9nYeBaY2BBd0enB2wKNUK6sJFXaABhvvyL7D4cg7f71RhJHTkmaA4XTznfECIGem1
 0SY/gS+ufl6ck9hR1U9pX61HVsfP/DxxcOpMuYZck2I5DLMrG3F9HNQNtqB/aeokB75P
 19zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPV9c1j8szvQxGW/tv8w6KWzfN1/0SP26pRhgLfrseXFHZn+U9YaI9fX/WjOTYejOh8udDyskyf+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOytIQU8o43/kjbcLzA9d+AKDi0eKAkI5UMFZEjl1YHnDh+dCW
 uWSabm6D2/GkjDKS8U9n3CKj9dsDCVt/pOo0BYqzcPpHWhgVCz+SshwuJZFEpuE=
X-Gm-Gg: ASbGncsgrhvwubO/foGJvn3+/3v6AGDW2HqOpzNVA6T4fdRnKER099HguunmogV11ZK
 WU/aNXf6Z9LtghaB5sIcplb8UOxh7of75f99cj37hMczByabms1miCW05dBzPl/4EXeNfPKQt+6
 LuiBXDPtibEOUmiyIVuENtyRLU/FitWn8cVd+Bh4OXd/dxzgrL1qHOfXl/ZE5J+NcSyTvpchBJn
 aos9rcRsekzITex3RHJmOb8mU7YftiiPs3wZULaNihnPCvpIsHkMZxXcLkgum5kzmK2vOgTja93
 hEu3ffpCHoDZK8746nizrJfXyocr2R8ZhHxpzvU8KKX5lQ==
X-Google-Smtp-Source: AGHT+IFi58B/opSrTiSCQEZcXK3JMBecxGa6PyaQe84wc8+j1ywljyVjJeAqD6J4qh7EoSFT1wKxSA==
X-Received: by 2002:a05:600c:4ec6:b0:43d:a90:9f1 with SMTP id
 5b1f17b1804b1-441b2635482mr12037525e9.6.1746000229687; 
 Wed, 30 Apr 2025 01:03:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b2af2922sm15458155e9.17.2025.04.30.01.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 01:03:49 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:03:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/st7571-i2c: Fix IS_ERR() vs NULL checks in probe()
Message-ID: <aBHZYgPPPYY-J8Vd@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The devm_kzalloc() function returns NULL on failure, not error pointers.
Also printing an error message for kmalloc() failures is against kernel
style so just return -ENOMEM without printing a message.  (Kmalloc
already prints a message).

Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/tiny/st7571-i2c.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tiny/st7571-i2c.c b/drivers/gpu/drm/tiny/st7571-i2c.c
index dc410ec41baf..eec846892962 100644
--- a/drivers/gpu/drm/tiny/st7571-i2c.c
+++ b/drivers/gpu/drm/tiny/st7571-i2c.c
@@ -908,16 +908,14 @@ static int st7571_probe(struct i2c_client *client)
 	st7571->hwbuf = devm_kzalloc(&client->dev,
 				     (st7571->nlines * st7571->ncols * st7571->bpp) / 8,
 				     GFP_KERNEL);
-	if (IS_ERR(st7571->hwbuf))
-		return dev_err_probe(&client->dev, PTR_ERR(st7571->hwbuf),
-				     "Failed to allocate intermediate buffer\n");
+	if (!st7571->hwbuf)
+		return -ENOMEM;
 
 	st7571->row = devm_kzalloc(&client->dev,
 				   (st7571->ncols * st7571->bpp),
 				   GFP_KERNEL);
-	if (IS_ERR(st7571->row))
-		return dev_err_probe(&client->dev, PTR_ERR(st7571->row),
-				     "Failed to allocate row buffer\n");
+	if (!st7571->row)
+		return -ENOMEM;
 
 	ret = st7571_mode_config_init(st7571);
 	if (ret)
-- 
2.47.2


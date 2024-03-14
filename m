Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B754D87C0A1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 16:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF8F10E39C;
	Thu, 14 Mar 2024 15:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lXNt2Ldh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BF210E39C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 15:49:50 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5682ecd1f81so1671317a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 08:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710431389; x=1711036189; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UoYqTJjbAWbKASaNyW64iARhPN3viTnTzys+DL4s3qM=;
 b=lXNt2Ldhhk27SNR/zE6mjuQWVJOABjNxIcNNGsx2t/DtPs0LLkmq9Ke7eWnWF4EuQ/
 DkkOgzQWuxwAcTG6a9sZ8z/9CT7JZsdPRQq4CWZWco1DiK7wuwNG2sIdLMxZw5hVNF5M
 fvPHQV9bMxpEV3SyRglIB0zd3win6Pbr5d+zvHhAbSeGYmBfbHkiBjLpGsxekEBK6exV
 OJJbZvQ8DkpIgZrCWCZN0rnVvim2fEnPsnEbpyaRjzV3hV0PTjp05MardGBKNdHNZ4FW
 QtwhPyTJeyNS42ThRTQ0Uabv9yzfuDMC5fRKELgdhNXBPsZ32Nf4+4f/PAgIcebsOce/
 wwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710431389; x=1711036189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UoYqTJjbAWbKASaNyW64iARhPN3viTnTzys+DL4s3qM=;
 b=Gf8kQdodIgTNAs+vUWj8j9wcbDJmALlA3B9/TQYA8XvRXjY13IHDJ3TUiiWcejUBeH
 4yoAvFU3h2ppvkfnQs6BuU1qGkC41xpGNUeyzvwTe5M/JaHYJE7pJyCQESVxEdKPsuuf
 hWZ7U9A5neax4fc3qREBbKqXDg0SJDePTI0PFJbXTKuk/LGTFXpwCDSjHW4zewEdSpii
 0PuKrdIB9inKlEvcQZTZtBRl5Qj/DD7ddmXVQTco1qLuc8qh393Pjt12bmOAiSIB23z6
 gIxkkGMudQCbnJv9zTU6WX1um200wNViTdxKOTAHE4pFbjdNXFWF4FRQ2JWd5wHhWBro
 dYMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTe4QRGPL8KfCEJW+Mw5U91lboA9+4Uq8B4iB7Y64hYXDSS2HxLSRh+XFBcJm3cpZsaNon+U5YTYFoN+WEk5LkNpPmiYYzNW1GYOx5GgeR
X-Gm-Message-State: AOJu0YwiG7pnGx41jSh9HwfwHyBdE0tego3IlUVvhvNfHKuPY9j6NDQq
 BlMzfLrtBY1qWrBXQNqJBPAs9GBCsu/X8YW91kongzY2GDy/NByg
X-Google-Smtp-Source: AGHT+IHJuEtl91TfCZ4KZZ4Sz6nunyNoL7j5bIkGvOI3TniyhZhZk6mX5MDqEb9xOuiYmazGIBgYEQ==
X-Received: by 2002:a17:907:c205:b0:a46:5eea:aece with SMTP id
 ti5-20020a170907c20500b00a465eeaaecemr1592117ejc.3.1710431388601; 
 Thu, 14 Mar 2024 08:49:48 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a1709067f9700b00a45a62e0ed0sm824296ejr.98.2024.03.14.08.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 08:49:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, "Jason Gunthorpe" <jgg@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] gpu: host1x: Do not setup DMA for virtual devices
Date: Thu, 14 Mar 2024 16:49:43 +0100
Message-ID: <20240314154943.2487549-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The host1x devices are virtual compound devices and do not perform DMA
accesses themselves, so they do not need to be set up for DMA.

Ideally we would also not need to set up DMA masks for the virtual
devices, but we currently still need those for legacy support on old
hardware.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/bus.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 783975d1384f..7c52757a89db 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -351,11 +351,6 @@ static int host1x_device_uevent(const struct device *dev,
 	return 0;
 }
 
-static int host1x_dma_configure(struct device *dev)
-{
-	return of_dma_configure(dev, dev->of_node, true);
-}
-
 static const struct dev_pm_ops host1x_device_pm_ops = {
 	.suspend = pm_generic_suspend,
 	.resume = pm_generic_resume,
@@ -369,7 +364,6 @@ const struct bus_type host1x_bus_type = {
 	.name = "host1x",
 	.match = host1x_device_match,
 	.uevent = host1x_device_uevent,
-	.dma_configure = host1x_dma_configure,
 	.pm = &host1x_device_pm_ops,
 };
 
@@ -458,8 +452,6 @@ static int host1x_device_add(struct host1x *host1x,
 	device->dev.bus = &host1x_bus_type;
 	device->dev.parent = host1x->dev;
 
-	of_dma_configure(&device->dev, host1x->dev->of_node, true);
-
 	device->dev.dma_parms = &device->dma_parms;
 	dma_set_max_seg_size(&device->dev, UINT_MAX);
 
-- 
2.44.0


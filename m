Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662DE469378
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C2373D6A;
	Mon,  6 Dec 2021 10:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889DA6E9C7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 14:37:47 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id r26so13773169lfn.8
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 06:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vJMd0+EtuV8FsgOp2tgrhJ12mBC/qiVsCflNDi5Px6s=;
 b=J4nAQrAkwH/Gnv10HYyAjYclVHwZ+Dc+e/HU24jpCQyfQIGuL/LYsyHcT9aqu9mBlx
 2ZHGA6QHLDHz50XWqOBT+vAeYt6WoD+kq5GEPUMaGtalmcJLgDCYbGDhPww7PTQnoFd3
 TdDvinyvBhzu/c+25gWOGq2vRncyxEQeLYZORThcTukOn5+6KGofzmtR3Qb/rf7mdzYZ
 dhm9fQTmPgZQrrQxvnsoRoy1U28BLOLbQp43sjLlU2REomLfcKEyLWvJz25ftJzrh2C5
 Dhl9Eq0R/X3teSl9udi6jfE/tTEND4svSK+icdKmX3EQDfRvdMrJNUi/A3D0N5iU4h12
 9gIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vJMd0+EtuV8FsgOp2tgrhJ12mBC/qiVsCflNDi5Px6s=;
 b=RsQR11jLSfYzn6P0QH/yqHQctDauXc2hcIWDAf87HEF+euGYEbNOu8s+PqmnCnFi/l
 dY6MIlcGHUbkGiOew3DHoECoYYrWpI9Z5pRfwHWjy5CmK04Ey5E4G1le+LH3iagVwaoS
 kzkWNn9FV3LGHsD4s4Op62UrXnrzuLKxIj/ufx2eIlaocE+cj/Qktt5gcRyuM3erQidd
 mDhEpmmdfUz7/vECihuzw5flBJsIg/Vvkl0AhZl7On8eiP9w3iUhuJRRKfJ3toj7hIdx
 zD63ymZ+HG4VwYRMSOc6gFR64P4JVIj2L6PLoUIqix0PwbQvS8JhVPrOxZd1hgAC0McH
 IAOg==
X-Gm-Message-State: AOAM533wzftTAGBtFBjPC2TGh+2LfTC2SpuYU0LMUV/OLXTPCQSTIEPo
 M06WoCXHbBwQcQJQVi6bWME=
X-Google-Smtp-Source: ABdhPJxC+zJx/5U6pfryZSqx3wxezgPHC4eT68U4AvDzjCAnen7V41d2UBAvXQDOy6dpXUUxt/FC9w==
X-Received: by 2002:a05:6512:22d3:: with SMTP id
 g19mr23416505lfu.404.1638628665976; 
 Sat, 04 Dec 2021 06:37:45 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:45 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 18/22] ARM: config: multi v7: Enable NVIDIA Tegra20 APB DMA
 driver
Date: Sat,  4 Dec 2021 17:37:21 +0300
Message-Id: <20211204143725.31646-19-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All Tegra20/30/114 serial and audio drivers depend on the Tegra20 APB DMA
driver, enable this DMA driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 172838566ecd..8863fa969ede 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -958,6 +958,7 @@ CONFIG_ST_FDMA=m
 CONFIG_STM32_DMA=y
 CONFIG_STM32_DMAMUX=y
 CONFIG_STM32_MDMA=y
+CONFIG_TEGRA20_APB_DMA=y
 CONFIG_UNIPHIER_MDMAC=y
 CONFIG_XILINX_DMA=y
 CONFIG_QCOM_BAM_DMA=y
-- 
2.33.1


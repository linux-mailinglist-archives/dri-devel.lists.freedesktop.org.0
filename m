Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04834693B0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3C67AAA8;
	Mon,  6 Dec 2021 10:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C946C6E9C7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 14:37:46 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id b1so13693384lfs.13
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 06:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LOjZjTQZlhp+jMD4XSw/sLUK6fzJWwcAyuJDWpowbN8=;
 b=BT6hF6T3DsytuOd6SZTcNzXERs13rmeoOu3/mz+D2wWE2AEXMz5AePtAKjON5adhiv
 4Eg+x6YMh0CmlZn29bmGzIUhZXTblIjx+gJIW5X+MLpbWUwJQq3t5PUFtUHEYOqpoXUj
 N/s3bjtzOgj4kf14X1ujZUvJ4TRdA5W+5DWqyx6jGpSj9XZgngr7RYky1XfCqbZpkcIb
 6BQPPAfxfQAUlhDUa9m3O5LiPcRAToD8BYhHqf28PXgIp50KAXh7V9unj8WtUV9aVTXA
 AUhfIcMScoN74mYSp/mdxpnhY6ggEUe2k6I2K7X8MbexqLi+kCyO/lJtkJWGRoSzZ7Qm
 qL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LOjZjTQZlhp+jMD4XSw/sLUK6fzJWwcAyuJDWpowbN8=;
 b=DUTrW6k5o+mS94U6DNBcCMeQrTjVPGF2BY0tX184q9pCn5rWRcPAzVdriNb89PPbp+
 vGOw5QUk0/OK7r8XQHkWARWiWSIfDHe27cjLAx1WoBh9CHCg5doad/h1k0c+sJt1tvcS
 wZ89VkZy1LJAqxmLDjVR4UDeUbeMXoFJRtO7T69Qp6FofxOxidPboWQs4LJy5MewnmzF
 YYersMy+WuBqkX9vzVZmYQR/BfPuqooc/fO66I/siK9LMXYQyEg763udEho2Jln7nv3R
 tGg0MYrUKKKvHU149Wz1Nhr3tjGv1n7x5NL9m79fJTTTMWmU8/4HqF8/+ZzW4qYoRviu
 qBKg==
X-Gm-Message-State: AOAM533oRs8mYsaeARmtQecl2vPVdp65Au6rs2L21D9VvgFtxwSBrNum
 pQ6upTb9DIpZAnuO3uma6dxWxXho6LI=
X-Google-Smtp-Source: ABdhPJxhAPoQB2zlY6ocg6tiCwvhZiauqouZ0jiz1JFXhJD0zm6ESqo3oOCFAyGe4uYC5aPabMjVTA==
X-Received: by 2002:a05:6512:114e:: with SMTP id
 m14mr23806948lfg.418.1638628665202; 
 Sat, 04 Dec 2021 06:37:45 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:44 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 17/22] ARM: config: multi v7: Enable NVIDIA Tegra20 S/PDIF
 driver
Date: Sat,  4 Dec 2021 17:37:20 +0300
Message-Id: <20211204143725.31646-18-digetx@gmail.com>
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

Enable Tegra20 S/PDIF driver that is a part of HDMI audio subsystem.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 3d509bc13444..172838566ecd 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -762,6 +762,7 @@ CONFIG_SND_SOC_STM32_DFSDM=m
 CONFIG_SND_SUN4I_CODEC=m
 CONFIG_SND_SOC_TEGRA=m
 CONFIG_SND_SOC_TEGRA20_I2S=m
+CONFIG_SND_SOC_TEGRA20_SPDIF=m
 CONFIG_SND_SOC_TEGRA30_I2S=m
 CONFIG_SND_SOC_TEGRA_RT5640=m
 CONFIG_SND_SOC_TEGRA_WM8753=m
-- 
2.33.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A474693A6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1D47A50E;
	Mon,  6 Dec 2021 10:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178386E9C7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 14:37:46 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bu18so13936289lfb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 06:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EtOyhR+C1wJvZU8wiedXGMGVSqNvvqifEMJLMiQgAVc=;
 b=L03nVmUkPndyUU9tH/MALMgelYXGq/p3zt1TwG85FzYAseUNRDA3Wt++ILbpd77ILA
 4h/eaUBsM7RuKPKX9HRitoYOaG972G3Tj0QD2x5GrL29nvVfiWDYaTbtjc6wPKEBt5OZ
 bs2vBX9my84twKztxReOEw9wZGY2Q0Wdl+DEtX3IrPr0S1+OuH84nzq6RCzVPfM2s9H4
 ImfwLYJ5UgbqMWS182Xz8bbwmTpCQqfQOFgEMnMm4tgMJQixPDHPkUsOgqTgLSrsumHs
 uIF/MuN0yVQ9trti88zo6x1k+eHN3ASLkkZXAlpdAbUhKhED2EZ49hlAQTbnJmuzMB5x
 b0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EtOyhR+C1wJvZU8wiedXGMGVSqNvvqifEMJLMiQgAVc=;
 b=Xgj9aWI7Qm8BjY0ow+0VxQ3M18kf2+1FGLpI6x+UC8CR1ahC6/kyWfC3odF8l+y27x
 gPBAFBuQxUYJ+76C7jP0LZvXbTWSDCZUibzKSQsUqlagJstrLeyAwti72BFs+w2Cvrlw
 KNO5LEbdB8rol1fJOfPo2vUJm5sdwLEgeB3zm44uObLoTO8skiVTCSAxrQnb0MAffK4I
 1msQMD3+/qgfhl3KeW8IvfH7yrV3SrqwVDMPfxNvH35ejcsKQgrvGdvRw4UsZIUTYWFq
 x9lqHvl0QuijR/X7BqCvySxDoGO+W8cE72dMEN8lt+Us7cpiwGJwrYnTGbajnO2Jh8ee
 5K9g==
X-Gm-Message-State: AOAM530WQmGUJlQKRbJKDPE7IGX/alVTbbMcL2CSrtqADZEIN/hZKV5m
 is1kPc8j3ggLsnk/hsI/jfI=
X-Google-Smtp-Source: ABdhPJy3QZudcRw4+yAZsC2/f4x/IcXmNDw0MftkOoWSdyIFIT0Dxo2x+Q+GsNwZwzdapu8R11Xzpw==
X-Received: by 2002:a05:6512:b8e:: with SMTP id
 b14mr24281414lfv.654.1638628664460; 
 Sat, 04 Dec 2021 06:37:44 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:44 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 16/22] ARM: tegra_defconfig: Enable S/PDIF driver
Date: Sat,  4 Dec 2021 17:37:19 +0300
Message-Id: <20211204143725.31646-17-digetx@gmail.com>
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

Enable Tegra20 S/PDIF driver. It's a part of HDMI audio subsystem on
Tegra.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 736a0d25900b..f8b40cfdfb3e 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -239,6 +239,7 @@ CONFIG_SND_HDA_CODEC_HDMI=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_TEGRA=y
 CONFIG_SND_SOC_TEGRA20_I2S=y
+CONFIG_SND_SOC_TEGRA20_SPDIF=y
 CONFIG_SND_SOC_TEGRA30_I2S=y
 CONFIG_SND_SOC_TEGRA_RT5640=y
 CONFIG_SND_SOC_TEGRA_WM8753=y
-- 
2.33.1


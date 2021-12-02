Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245B466809
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3996FB40;
	Thu,  2 Dec 2021 16:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C476FB3A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:25:32 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id 13so677079ljj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EtOyhR+C1wJvZU8wiedXGMGVSqNvvqifEMJLMiQgAVc=;
 b=dOu9BzuYlTpC2xjUx5FiaMQmzvC0Wse24LfnaZaGLEnZl/FIac+px7wWke8QbzNAHA
 AUSCNbsbkHs8U62J8652zcWyqb5SdMFhuU6x6HH3IzkjJyGdJoOYLvCo5TpceADEvsmo
 pVQ8cgX5xW2XmYL4X4xMa4Sy8Xvg10aqJ4SwvMMBCwz67mY4Zfk92fyYIqAzwerVH2vb
 igSfwldVzZTlCAmUTo50E9viuaP2xWAJNuoZ/ZtlbWWjVrG6ZzOxzKR73a8dMnwEXVb9
 SmMKd2QHwszU77E0A0Mm/FsZsLeNP0piWAdNaOoLcsF7oBBnU5wmAT+E9b1/b+thLU5E
 Wezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EtOyhR+C1wJvZU8wiedXGMGVSqNvvqifEMJLMiQgAVc=;
 b=GkC93svCLda+8bJniL8kjTHH/FJfEx6/1JaijyHiXF1C+ORQYQVDTzzW80g054WK67
 MfVa05RyVNw5YLCuL+bzZNHmUTlSxtlQD9FqOyAgDd7ohg8pwPKjY1MId0yGLJAnW57t
 UuFojSKn6YVgRJWjXZFVVkuDCpkiCpTo2WfZpp+6oYeSwwKbvRAw8YmvN6pYtqrjx6G8
 XJ5cGZR5haCxI/n0zzUFL+r0Ev6hoXu5H2nMLHeTUVaFbQIiiBxQXsxPPFkUb8WWEi5u
 LUheScuWNorc8suAfh/38d3NXy3x7M6mIFnLjLhTi5yOQmCYrOfepqRquzdPhExSAsmR
 we3g==
X-Gm-Message-State: AOAM533/qaEu+LaK44WtgvWpjZMN+jWcVujKrRfBtfYKB0f+6KR1C+HI
 1ZWCphY/kjLTrzqhBiB8gUg=
X-Google-Smtp-Source: ABdhPJwFLCUx6fgXehIugB4BT94Un9o4EbO9rkra0kPr/6ZY+CbsP9zrdLCdoVfQd7+OsnpW3h/Glw==
X-Received: by 2002:a2e:bf24:: with SMTP id c36mr13354979ljr.150.1638462330933; 
 Thu, 02 Dec 2021 08:25:30 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:30 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 16/20] ARM: tegra_defconfig: Enable S/PDIF driver
Date: Thu,  2 Dec 2021 19:23:37 +0300
Message-Id: <20211202162341.1791-17-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
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
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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


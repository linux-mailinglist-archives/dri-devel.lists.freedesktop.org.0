Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A9E45F1B5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD356F972;
	Fri, 26 Nov 2021 16:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B336F900
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:19:57 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id n12so25550686lfe.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0mQGburGzaVO6t6m0C9ToG0s590roHzjwKj9a/U1hq8=;
 b=fuV2rpY5vWtXLgfFL3kQDRM+ioE76IqkOsczEVCgP55ZUOsM6JRi1k1DUic6KroJPS
 0tKyZlRv6Eyfnu2i63/8F5l3GQ3gMNc9CdD0hLqviK+wvyStY1jg5iC7kGuzI3eIMcEf
 PB+2xvrZY342AogXJzAfszoXobBHB6Q3p0iYRgcdy2pL+5r5mbobIWDkdh/z9DTNnsQb
 x59msvnA+cjRsiH/FH7HPP0qQ5JLIZK47Am2iLsa5Qd3Lq9qRfBeS03r7y+yojAESQhP
 ShNJV3gqMzXfS0qwS2eGeNOLcm9Wh0FHqRbij68DTKDMYHAQ1d0SLguifx4pu026d7wv
 /dEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0mQGburGzaVO6t6m0C9ToG0s590roHzjwKj9a/U1hq8=;
 b=X2kNkKFwDKD/yg8S800Yg2chpK/4QjmkW9sfADkN0SJnca9zVEHHYDwEgmzaSnGC4i
 nQw5ZUqwHFqvMnGh2vsy3aRw66erPihU6cGvO1jNSrN4Vgx2l0YBN5puZiScEtrd1axY
 GCyWxrVHwIWW2H9Jb+Vv0osvBy/cT9E3AAVsnWJEk8aTCjBsPwOSZsGjqaoh53lwBP5s
 IxOUjwwMDmpDBfqo0S4dZPvF5rB3F+OEo7371G788Lyy2KHPf7dSoVyp5oKQbToe8q+k
 au42o0rMEuBm36iAOm5E03lghxMwWWl8M48Jqhe/HT1RRckw4CnkZOozIt1RlPBhWdtE
 wSSw==
X-Gm-Message-State: AOAM533NTL8AcrD7b9m0OkYjA1pFdeMof6+JjXjM9JOAcWabtNOye8eb
 B0UsMB4DSERrJDLX6zbOBxk=
X-Google-Smtp-Source: ABdhPJylJzqB2ZvlpxpzfeqjArW2IsHMhFnA0BIsWJR6W+91PfSCYZb5GLBH1w9hRPLmfiiTF5DZOg==
X-Received: by 2002:a05:6512:23a7:: with SMTP id
 c39mr31318838lfv.655.1637943596282; 
 Fri, 26 Nov 2021 08:19:56 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:55 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 16/20] ARM: tegra_defconfig: Enable S/PDIF driver
Date: Fri, 26 Nov 2021 19:18:03 +0300
Message-Id: <20211126161807.15776-17-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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
index 817b39190d54..1b8f8fdbedc5 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -235,6 +235,7 @@ CONFIG_SND_HDA_CODEC_HDMI=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_TEGRA=y
 CONFIG_SND_SOC_TEGRA20_I2S=y
+CONFIG_SND_SOC_TEGRA20_SPDIF=y
 CONFIG_SND_SOC_TEGRA30_I2S=y
 CONFIG_SND_SOC_TEGRA_RT5640=y
 CONFIG_SND_SOC_TEGRA_WM8753=y
-- 
2.33.1


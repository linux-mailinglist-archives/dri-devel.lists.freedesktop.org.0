Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980021F0EF9
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CCE6E3A2;
	Sun,  7 Jun 2020 19:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45616E39B
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:33 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s1so17785306ljo.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VGygXNg/Km//fsZYaJ9FCB7/EL/aLlPnXW30j/MHS28=;
 b=r69z4d5J6lw0MRto8JQP61swFFvrkt9EKKNOcCq3rCRg7EIAIsZaDjNVNgyBuRwV0S
 7ijJy8C0agS/gqOY7BNwBIs5ZetGcslLUFwZ6hmBc5CtYDGNhmZF29wmgcpUbwhjeq1V
 1owdiPk4FIGv3uNDMI9BkDZPb7yLq7i/sH9m7dSoDhZIjwtlq/qjLJKtvFqGF10CW4wP
 Y5Z8QQz6CnRPo+vuXT/6fmW4+x66SZGAxBstje6762r5jAO03am3XVxPbu0kZofHgtrk
 hhup7H0KAtelm2rB0pS4mZlaTzbk9c9QGeDZ3n5trQN/h8oowvomVWAGdPGbhTb5qeae
 1OFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGygXNg/Km//fsZYaJ9FCB7/EL/aLlPnXW30j/MHS28=;
 b=m25VKM3nruk+5sVh1C0F52gq3Ut7zvO7MJLAtRcyGE6oZe9wTVPfCkRgv8zJnWf4wy
 VP3dSDoqF8TDU/MiPfu2SFS+tqVGSTFUKUwwxG4Ln/90Q2lnWMXX0z2wpe9Vi9qT8ghc
 7KOeTbJLbHGHeEPNGSsMQmtmK4nyQc+cnvsQXRZYvcF7OWnsOKzzDuVKIluE4WDXnv+0
 a7y/qO2Jyo34RpeW2NQuKKn5IbjMi6FSdb4261/1qkG7AszyBv9AmfPzC8yqmvnXNQma
 B4AWl8x3wODtoJG3mP5TG/MGwTmtEoACrERHQfyy7O/hYZmmM5Cilojm9FjBnlHsW2WL
 MlcQ==
X-Gm-Message-State: AOAM533aUdcEfV6NRaywwPg6/6vIe1hIQmFTZ+3T0J3DuPLrIPJM3HpV
 +gFppiZdAz5zd5NLctxxAIc=
X-Google-Smtp-Source: ABdhPJyBa1kXodoEieeADUeO0t1g6uNXUR0h+2t4KNu7AMrcT7MZmLutI7pTwO0oEr2Dly6fNoUstg==
X-Received: by 2002:a2e:b6c5:: with SMTP id m5mr8870445ljo.94.1591556252328;
 Sun, 07 Jun 2020 11:57:32 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:31 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v3 17/39] PM / devfreq: tegra20: Relax Kconfig dependency
Date: Sun,  7 Jun 2020 21:55:08 +0300
Message-Id: <20200607185530.18113-18-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200607185530.18113-1-digetx@gmail.com>
References: <20200607185530.18113-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Tegra EMC driver now could be compiled as a loadable kernel module.
Currently devfreq driver depends on the EMC/MC drivers in Kconfig, and
thus, devfreq is forced to be a kernel module if EMC is compiled as a
module. This build dependency could be relaxed since devfreq driver
checks MC/EMC presence on probe, allowing kernel configuration where
devfreq is a built-in driver and EMC driver is a loadable module.
This change puts Tegra20 devfreq Kconfig entry on a par with the Tegra30
devfreq entry.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index 37dc40d1fcfb..0ee36ae2fa79 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -123,7 +123,7 @@ config ARM_TEGRA_DEVFREQ
 
 config ARM_TEGRA20_DEVFREQ
 	tristate "NVIDIA Tegra20 DEVFREQ Driver"
-	depends on (TEGRA_MC && TEGRA20_EMC) || COMPILE_TEST
+	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
 	depends on COMMON_CLK
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	help
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

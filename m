Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1282C418BE5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 00:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD676E5CC;
	Sun, 26 Sep 2021 22:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562826E5B4
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 22:42:45 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id x27so68579316lfu.5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 15:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
 b=pUEPNMkJQr5NWNa19a7ZyiLQA/ce5o3cooLHQciCTfn7GDvRH6VTTTdD6JKIL4UrmV
 rrVbAP/wvZWx2J0K2faasFGjzdi1o5y8ezrQGpvdeJIrszdl8ecw8YwEyqDA1MvPawmp
 0PJ6yycgmc045AsLdgLtVuy8KAgDTFddIzR6xi7P9lXt8qD3EuLmDuxPVs1BY89/wIsV
 /jXKmHsXeSDJelnpvglMhN0zjnmKIQw2G47uxtN2JI6M3VthPUoP+q02lvNETHoucFHI
 /JiJckf1QnJt46IeCFDl4rZymcy/0KL5Fowewmc53xoffriJ72cInIZPrF2f831BKUnf
 nYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
 b=icOY5VvjKHBNqag5T8hYSpFtMXEPNcdjA82CdCGQXkGhfkCVdmR4tLgAhO7h1G9+b0
 Ec/wJihBTsACPGjJfGAbWdJFmhEFkm1UOFHH5aMjfFwkk7Oo4YfDNu+XFRVxHSDv4Zlw
 celvF/+VD26qL72U1sd/56CXnoxXR4AcP85SDrp0jKTESpJuId3hhRGi3pO07Usykbz+
 LhBe+1/Nt3I/0f3H6P/IsEx2d/9EiQUQX73ayqkXHliGpr3Q5FGK3vHeT3j46D1fKlxq
 k9Ox98CrlO9FjuiZCfBuOw9xaVfxfdnwuGQKXcqO7A3zQSwqshWKWRJrX2yj6U+njL4C
 WODw==
X-Gm-Message-State: AOAM530E8gmOYOWqt9yK4Pa94s8b7pLJHoegm6HbEoOMo4qmygv4hkfu
 JMnmLEowkDNOPdnBHHr1ae4=
X-Google-Smtp-Source: ABdhPJy2rzvcK/EpmNkU06oa1ux+Bax5jzq0bb0T3/Dhw3FjdBPfDZTPA9CjLuSUJfe3zuDn+9yAGA==
X-Received: by 2002:a2e:585c:: with SMTP id x28mr25230381ljd.508.1632696163660; 
 Sun, 26 Sep 2021 15:42:43 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:42:43 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Subject: [PATCH v13 15/35] drm/tegra: vic: Support system suspend
Date: Mon, 27 Sep 2021 01:40:38 +0300
Message-Id: <20210926224058.1252-16-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210926224058.1252-1-digetx@gmail.com>
References: <20210926224058.1252-1-digetx@gmail.com>
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

Hardware must be stopped before system is suspended. Add suspend-resume
callbacks.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/vic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index c02010ff2b7f..359dd77f8b85 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -315,6 +315,8 @@ static int vic_runtime_suspend(struct device *dev)
 	struct vic *vic = dev_get_drvdata(dev);
 	int err;
 
+	host1x_channel_stop(vic->channel);
+
 	err = reset_control_assert(vic->rst);
 	if (err < 0)
 		return err;
@@ -517,6 +519,8 @@ static int vic_remove(struct platform_device *pdev)
 
 static const struct dev_pm_ops vic_pm_ops = {
 	SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 struct platform_driver tegra_vic_driver = {
-- 
2.32.0


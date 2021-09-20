Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA99741223E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 20:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DF56E7DD;
	Mon, 20 Sep 2021 18:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A956E7DD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 18:12:19 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id g41so38688429lfv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 11:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
 b=P3n5Y4bFKywJZHHHSG/NGHFO7ivkVICa5iZwl/XYtYAsA8Z0KHIqzgPxE1DHQQ/bGa
 5aiojbf/V5bTseCdLYnTvNRJXEUoHG5iuLWcz1A9/kr56vjKU9myEevXTOdyVMujAx54
 jt/ChwRV8DOz5uo4zdyjEerAWCMN0uAUhUhj1T97ljQ2xSvPrJWlIM6cXFOMg0q5T970
 2P2hwODEUN5MYDJB8tA09XoP+4Mya+iI4pWLdlvNUhaUgBxN0nswk+TNFbg1A5yqUEet
 Sb8jUas1VTrD4sfURz232vBrXIAbjuXDYWkYw8MxYfQJ5gLcLDsAU68ARE9FXmIyzabw
 YkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
 b=2hW7qVtilP8IcMzgUGJo7fDEE1sLnoM3qJkvjUFOrVXcFl1uDKKygSszgTxqUSJNAV
 xrAvyltadaoYNF1bakOrbZkAvEIqZLqlWdW/kZiVPvQPmIHJ+e2PwF0bX/x3W3hHh0QR
 y1thY/TBPfuppvjTCNgVdXn9NNV7pJ6ruDBMLYfX06ai1d1kq43f+UfU6e+nCDCugJN0
 64aNvJU7qP3tEewkN7Zru5W7zNUki8BUsYQTClCpFW1TAbbyk4pG0z/4zE+iXq0KxIG4
 rktZ0BxKx94xgnqBR7xyOLEVwF+wUrXirXBjXQ+bgf3lRrzXmRM0TIKC0iaCQ451TS2Z
 Jbsw==
X-Gm-Message-State: AOAM532PF46KZpP9K9ex1NXmD97DbvL1h4AUrpGwDh7ygDKfBpACeBEv
 1ln6bCdxp7Z4bcCk38u+DIA=
X-Google-Smtp-Source: ABdhPJzY/bsrNdOpD0q/W/8aRxgO6hmcKb9a3abKfUrwIW5GrrktqjeBIeoSR4B9iR1u0pJz28HUJg==
X-Received: by 2002:a19:7601:: with SMTP id c1mr19312559lff.448.1632161537838; 
 Mon, 20 Sep 2021 11:12:17 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru.
 [46.138.151.206])
 by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 11:12:17 -0700 (PDT)
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
 Rob Herring <robh+dt@kernel.org>,
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
Subject: [PATCH v12 15/35] drm/tegra: vic: Support system suspend
Date: Mon, 20 Sep 2021 21:11:25 +0300
Message-Id: <20210920181145.19543-16-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920181145.19543-1-digetx@gmail.com>
References: <20210920181145.19543-1-digetx@gmail.com>
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


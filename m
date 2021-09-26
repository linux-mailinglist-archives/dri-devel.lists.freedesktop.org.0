Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A28E418BBF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 00:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC81D6E5B6;
	Sun, 26 Sep 2021 22:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82286E5A5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 22:42:31 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i25so68976243lfg.6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 15:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=azJO16PBS0aaEX5vOfJpmf9jn1x1mJqiJpQpMZ0azY4=;
 b=CoucEmqsnHASEscWTvzWVMvPJx/TXgnqdGGuNIJPcO7mu88S+vh9AL8t1Ns9UQxBZI
 XYyLpgOhCbVihPd7RcTvlnEoo65EfnV9OkGmOWggm/JcV3T1Fkb0hoAtZ6o6YKD3Npjs
 H//NAJ7gp0wGVNHcKIrcVsCMNFUeMp9gBjixftFjxRLmL/Z2XsgUHsToJoIsQ91a9Rqp
 oV4EC8FnuEN/OmtmYdJoT+oiy2ExskpbLunYJ0pVQgGZEgVTuEE0BW+mpUw7+stYklh+
 wmG9/SuwJ+Co+IWoOjaOCa7e/0oMC36ZRTjBUO3zNyO8S7/jRGHaFUs2KkxQteQZYgcd
 hiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=azJO16PBS0aaEX5vOfJpmf9jn1x1mJqiJpQpMZ0azY4=;
 b=bflUAmU6W03+X7a3BFaoSbQBkIRYVyV+zrBxP5pc96kMsOnz0E2gyUkUIP4xnonXwN
 A3gtQ7OtBGhV6nFTHF1tepD6LZ1YiJNkHfGwPLe2PvYofUI0cUcZxyGfF3MuGbwPAX0m
 EVh6qgArOxjGcCYUzianpeODqtG34ouSXKedc+mi2YHELSURoooRjhGEOUNtxnj1WrbH
 tgQzBWHgch70CgGNMkbxYAuK+9nEPDj/kmcLlQMXk3Kh3wmPFXeKUAdPsu/I/VaaHTFC
 4Oj2Oyx+iPJGFLh5Iu3nvRYzgcMsR0CSMph+I1llYiyyD0A0SIXu9X9s5QVQDrXEQZmi
 zEQw==
X-Gm-Message-State: AOAM532+x08tr/PRXDTTmeFHzZ3kbMfcGU/z7+mgNetVt5/RcQ/1ZiSm
 rHLzwdNg1jYm6/kGAe+SfKo=
X-Google-Smtp-Source: ABdhPJz0FoBQucMxJTKUygz8qqUX0VYeANYjoqsIq2ZxRXzP7B+OIO/7ur7ISRYBXcphepoeMGZavA==
X-Received: by 2002:ac2:5458:: with SMTP id d24mr20907289lfn.385.1632696150192; 
 Sun, 26 Sep 2021 15:42:30 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:42:29 -0700 (PDT)
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
Subject: [PATCH v13 04/35] soc/tegra: Don't print error message when OPPs not
 available
Date: Mon, 27 Sep 2021 01:40:27 +0300
Message-Id: <20210926224058.1252-5-digetx@gmail.com>
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

Previously we assumed that devm_tegra_core_dev_init_opp_table() will
be used only by drivers that will always have device with OPP table,
but this is not true anymore. For example now Tegra30 will have OPP table
for PWM, but Tegra20 not and both use the same driver. Hence let's not
print the error message about missing OPP table in the common helper,
we can print it elsewhere.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index cd33e99249c3..a42d4f98c078 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -111,9 +111,7 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
 	 */
 	err = devm_pm_opp_of_add_table(dev);
 	if (err) {
-		if (err == -ENODEV)
-			dev_err_once(dev, "OPP table not found, please update device-tree\n");
-		else
+		if (err != -ENODEV)
 			dev_err(dev, "failed to add OPP table: %d\n", err);
 
 		return err;
-- 
2.32.0


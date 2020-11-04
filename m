Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C022A7912
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D256E9E0;
	Thu,  5 Nov 2020 08:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7EC6E853
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:28 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 23so301031ljv.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q04sc3lZzk/7Y2Vrk729DLPvzmihTnah64pqG8qeyNY=;
 b=TONR2+QYbapieLnDTf0Jk1QPqXZDWAjT9sIbfsQFU3S1ETVVTGWoJK1Ebv6MvCDAxu
 iFk8mmpyuk40cSTU2xGCAu0IvpyN9KggSBaUQ0HHUcphlkxTbwyPOPgcJyrtemqawCUZ
 IzkDtKXECzbZCA4IZob2ibn2+8dNPZTXjcCGMnrjW2yoErdNbjFSO1mXDS+eEXyo3O1Q
 MiuzyQ7fZ3tJFl2zUxr54tAVzMmTWH5TTg40i9bJj1HAViKxiTpO4EWYns9q1Jeg+pQs
 KLY3Dznjpa3LVkpFr2X2vcRQjrEZceJCA+H2N4jXkG7kOszuNZZdKNm3I1X6sEtQCAK/
 tPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q04sc3lZzk/7Y2Vrk729DLPvzmihTnah64pqG8qeyNY=;
 b=SFRyixHEURbUCFjxNx6xZ7mHOTFiAT5Zcvw88viVStmIdRByuMCSMV67j/WWQ0DGzS
 seqdNHXwQrh1TsWuL2bYZ4UC3zJ0s3wTTRIK6qtRY8zkroanKrzFd7pLoZ4g51JsuCm4
 79J765iVGtmO+xwVq+jP7d7ACj+IeMkVDv4kFM2N+OXhBh9+LtdkVufOQ1xbuY+70GGB
 nIbKLY9FJm7ImgoZkV7vdzCAPYAj84pntjaD5W9HoHvJG+wVtOl+Laftzb/uJCVU4JZZ
 DFE5sWPmoSEQxgyAlCmTFV1VsHVLQcKwidjwfuCkBTuwmm86PRJI7SnCyDvg3JKsBYHV
 HUJQ==
X-Gm-Message-State: AOAM533WfHR8asIsnxHp6qhu6pj5sJb4gqLQ4M7m3SGARKtpFqtHoXSN
 KQRD3NYCHjbsi+lR8uI2vIQ=
X-Google-Smtp-Source: ABdhPJy4JvIN2UzMvC1UGoXxnZuYWhG4YhonA0JFk9Z9oJ2zbTum5L2HXCOgLCmGf47Q0qaQDlrH3A==
X-Received: by 2002:a2e:a41b:: with SMTP id p27mr161088ljn.30.1604533526786;
 Wed, 04 Nov 2020 15:45:26 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:26 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>, Peter Chen <Peter.Chen@nxp.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH v1 22/30] memory: tegra20-emc: Support Tegra SoC device state
 syncing
Date: Thu,  5 Nov 2020 02:44:19 +0300
Message-Id: <20201104234427.26477-23-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104234427.26477-1-digetx@gmail.com>
References: <20201104234427.26477-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: devel@driverdev.osuosl.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sync driver state using the Tegra SoC device state syncing API, telling
to regulators voltage coupler that EMC state is ready for DVFS. This is
required for enabling system-wide DVFS on Tegra20.

Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 9946b957bb01..b1b0a2439689 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -1129,6 +1129,12 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	return err;
 }
 
+static void tegra_emc_sync_state(struct device *dev)
+{
+	tegra_soc_device_sync_state(dev);
+	icc_sync_state(dev);
+}
+
 static const struct of_device_id tegra_emc_of_match[] = {
 	{ .compatible = "nvidia,tegra20-emc", },
 	{},
@@ -1141,7 +1147,7 @@ static struct platform_driver tegra_emc_driver = {
 		.name = "tegra20-emc",
 		.of_match_table = tegra_emc_of_match,
 		.suppress_bind_attrs = true,
-		.sync_state = icc_sync_state,
+		.sync_state = tegra_emc_sync_state,
 	},
 };
 module_platform_driver(tegra_emc_driver);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

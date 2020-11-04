Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6572A78D5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C226E9F6;
	Thu,  5 Nov 2020 08:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2036E86C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:14 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id i6so196217lfd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4GdfWHUaJuS5SoIO3s3NHsXGshyNXM4oAFxRbthWkgE=;
 b=P4gTaLsCzg40YfN/+eDtmkytwvz3j6y/tLzbROBla8Lyn2uhMCZ9nQWk13kTV4Zk2I
 bnHXdTZ7JCgH2482+Bsq/SEutpf++F4rOA54+MOWEZoP1878JraQZGvFkgpKLj9EJ9oB
 Ur03LDACJy0Gk205Uogo9GuQ+XlgE8hF5XT1rgOzSpD2VK7CysF1SUQsEUWdgW7G/mUI
 rYhkJpYmOhvAYzocuXFm3t15Z32tacpF1m+u4i6DQO3oVETuAQznjAJx8HWU0saop/GI
 IZIcJRr08uQZnL9VfqjuEXvNgEuv/wV/5Cqn6nFXMW0PNPirIrgP8gZewdRK4OP6fS91
 JzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4GdfWHUaJuS5SoIO3s3NHsXGshyNXM4oAFxRbthWkgE=;
 b=aZqK9pXOMZc1ndEUVzF5jH3D0CXd8ABqhRzH4p8QrepXA91KLukom8PsyEgs2zA+/g
 SCGiUWKZ3So9/zdOdWjewVjj88xiCb293z8mDqIN7MY230FqYAeHZfO+Ijq2QHNUNuRC
 +MdTvlrrzFI2XfOe/oJeKu+SRRBqerOxITQmw0wlqtt8R4cqBJnv9bYx7CTKZ+mcoV26
 7G9aK95iEeb6A3N67elS4LGFiLO5W0TRKzsik7QsfKR5ZtCZpBHOA5SebHGpy1BIDfwR
 1+0P41guig6lWtcrNagh4UWZ+5mPUglzErO5P4g0MvjhUmkxF3PA0Txlsk6H4GyW2dLp
 v1PA==
X-Gm-Message-State: AOAM530DOGUs8aVFr7BaeC90cZEMJkEjv6tQFFfbe80bbR/erUanWuOJ
 OPXOTqItbBD/JSIxMzjl+3A=
X-Google-Smtp-Source: ABdhPJznyaKA15G7U7xNtBj9EgmdWFE2bHuNPgYQzw2meXnv4UjsY+M6043F6TKa+k1IIrlJjtZbHA==
X-Received: by 2002:ac2:562a:: with SMTP id b10mr47103lff.562.1604533512794;
 Wed, 04 Nov 2020 15:45:12 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:12 -0800 (PST)
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
Subject: [PATCH v1 12/30] drm/tegra: gr2d: Correct swapped device-tree
 compatibles
Date: Thu,  5 Nov 2020 02:44:09 +0300
Message-Id: <20201104234427.26477-13-digetx@gmail.com>
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

The device-tree compatibles are swapped in the code, correct them.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 1a0d3ba6e525..f30aa86e4c9f 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -162,8 +162,8 @@ static const struct gr2d_soc tegra30_gr2d_soc = {
 };
 
 static const struct of_device_id gr2d_match[] = {
-	{ .compatible = "nvidia,tegra30-gr2d", .data = &tegra20_gr2d_soc },
-	{ .compatible = "nvidia,tegra20-gr2d", .data = &tegra30_gr2d_soc },
+	{ .compatible = "nvidia,tegra30-gr2d", .data = &tegra30_gr2d_soc },
+	{ .compatible = "nvidia,tegra20-gr2d", .data = &tegra20_gr2d_soc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, gr2d_match);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

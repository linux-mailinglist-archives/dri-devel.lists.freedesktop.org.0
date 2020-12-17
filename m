Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 905DF2DDFCF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5897D89CB9;
	Fri, 18 Dec 2020 08:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA616E1ED
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:44 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id o19so34208627lfo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ic3kTPXawx4sKcxOaKN7fFyaFOYLW2jZWk2kyZRzIN8=;
 b=pDPXQoxWtm8qgegOQQnLPP2iNl8IcQFs8OGUq2CcE/tO41E62bEBO32YvUgCVcHJ+V
 YPtVtozDo2n+wZJ4WQmT4rbG7S/div+wwrks6vq0KVL+VFD7En3oQrxCR9XkycdVzhsW
 S6BmQauT0TOzAZHGgiEusPxXhQOSZMTP5TD6YEKytzyzXfypbZ+5zUfDdkPIIU8s3+Ou
 mqnXy8OLojNQRx7M8z4L+fND+7tQ+nvxgScaL4ixkM3YRwx7uRc1TLy61azneCrZUo4c
 Hlcrvlhj6vwXBTq4+eZfHetTjVFqobaSbAbt7owq2Uhx4ROsy0JCVwjBqThP2hwltppM
 s2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ic3kTPXawx4sKcxOaKN7fFyaFOYLW2jZWk2kyZRzIN8=;
 b=fUWP6iG9Cn7JkA1+jfxuCPaQjE0dr4NnDPnGdPPjGi82BSanHjn+g1rdwZ6h1JFuj0
 /5GxtvOKCbKVoMZDfqBQ6BPg6vRv1EkxCkazQB3Ln3DmnvqadzDbS9Bl1CbwwR5lw+I+
 wCvWDnpVvwe25liXZVRzZ48wSnoBdbENwGlTKTHSDUGTGeXsVFdoG5sQrF08HpQUrEZN
 T0qTyHESep1ZSkCqg4E+uFMn1EpVzrME2/SCWgRe41K/lfasuDHDlaYGDwIWQM4vkBal
 WpvsvHj8uBuFw1IQtg4gK8pojonuosOWKKP82mCsX9BN7fQvtW/y534cYeh2qKqZAYhy
 FukA==
X-Gm-Message-State: AOAM5334f2pfLOJOY6Jjs/OrQ3VtgVfdrFLHYoQZ/cF0mug4uFDC1o5r
 KcLldfsRo15iFfXqIedvWJU=
X-Google-Smtp-Source: ABdhPJwellNh5faxAJj9vvQwVQ45t8eRtpsRvTnCcKlBjZrYp1XD+vvrxTLHfCwLKBFNaDRVWiD1zw==
X-Received: by 2002:a2e:a407:: with SMTP id p7mr226531ljn.78.1608228463135;
 Thu, 17 Dec 2020 10:07:43 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:42 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 20/48] PM: domains: Make set_performance_state() callback
 optional
Date: Thu, 17 Dec 2020 21:06:10 +0300
Message-Id: <20201217180638.22748-21-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make set_performance_state() callback optional in order to remove the
need from power domain drivers to implement a dummy callback. If callback
isn't implemented by a GENPD driver, then the performance state is passed
to the parent domain.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/base/power/domain.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 9a14eedacb92..a3e1bfc233d4 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -339,9 +339,11 @@ static int _genpd_set_performance_state(struct generic_pm_domain *genpd,
 			goto err;
 	}
 
-	ret = genpd->set_performance_state(genpd, state);
-	if (ret)
-		goto err;
+	if (genpd->set_performance_state) {
+		ret = genpd->set_performance_state(genpd, state);
+		if (ret)
+			goto err;
+	}
 
 	genpd->performance_state = state;
 	return 0;
@@ -399,9 +401,6 @@ int dev_pm_genpd_set_performance_state(struct device *dev, unsigned int state)
 	if (!genpd)
 		return -ENODEV;
 
-	if (unlikely(!genpd->set_performance_state))
-		return -EINVAL;
-
 	if (WARN_ON(!dev->power.subsys_data ||
 		     !dev->power.subsys_data->domain_data))
 		return -EINVAL;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

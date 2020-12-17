Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EF92DDFB0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA4689B22;
	Fri, 18 Dec 2020 08:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E306E1BA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:50 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 23so59804469lfg.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6bihTvUOG89oM9Y/xPaskNMPx8lkVh3OwDTHQ+rUz0Q=;
 b=YgQsVYInkk2m03hroKiBAdfDFB0PzOxzZdQWbW80OhGLnIy3SbqjhUVrhoSZeXa/0W
 QptR34QOdICKwEMJUmDxpjneCiq75Y7dTMq7ocCew51i7k6af4lsmH5StFCUi9OTDhVb
 fkffM7TvBqgMrqtPjxPVzHIrvwZiJjnMgj7xb07gyClRUZltKNMvyRF6okcKk1aStAZd
 mp728vEPg8JQCyoih6cV4ja0h8WnBc1s6FIBhCFwdaw3v0fMvuWj2P6nkduHjFPSOjQS
 keUpNhEJqrXcP7lE7tFFikb8lcCmKC63UC7B+C+1vO13XTwgbK+khXS51cmtHSOxZQKa
 Bzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6bihTvUOG89oM9Y/xPaskNMPx8lkVh3OwDTHQ+rUz0Q=;
 b=QnhcLYhJ474nB9bWCe7SzgTsrMPEk56Zu749wvg8Ef3GEX40UkDSMszpZJZ2/KGt2P
 PPoKAkqCLt4sgtR3E2AJxZM4vpbAgmgRBN+qdTCcT19MHcWMtLgXMC0Z8gwo02kDFtiM
 /+txUbPsU7zYs20UInE5+idn3pW5ZL9IgC/FqzywXXBGwaf4jko7tEdEGelbEAxsrYnH
 1t9PiqLm3EcWZlY1cVoEyDnw7avBvhUW39I5j2iAgcH1+5ZU3xjxUL8025aoWlW9LIcQ
 bnZCTwJpc2tIwNe++7TTZO/Ku3Zs/iQP9AFbwOpTQbCX2W3Nw9c48kTOrFj/Tjwrxl2E
 c9Cg==
X-Gm-Message-State: AOAM532TDZfu3kSfYxNx539kbyp1UUxXOT8D+OA4Idky+hsWUF6C9+Zh
 QWvbPs1PLiyDEKv+eh1rlR0=
X-Google-Smtp-Source: ABdhPJzce1teuxCCTBwGEaaplQ9RyWEJB7D0DJvqSLoeEK+KGIZsCfWwh4vgsDqV4p/wJQUKuj+Jzg==
X-Received: by 2002:ac2:5547:: with SMTP id l7mr7724553lfk.313.1608228468872; 
 Thu, 17 Dec 2020 10:07:48 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:48 -0800 (PST)
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
Subject: [PATCH v2 25/48] soc/tegra: pmc: Print out domain name when reset
 fails to acquire
Date: Thu, 17 Dec 2020 21:06:15 +0300
Message-Id: <20201217180638.22748-26-digetx@gmail.com>
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

Print out domain name when reset fails to acquire for debugging purposes
and to make formatting of GENPD errors consistent in the driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 8edcd5b319f6..4f96dc7745c4 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -821,7 +821,8 @@ static int tegra_genpd_power_off(struct generic_pm_domain *domain)
 
 	err = reset_control_acquire(pg->reset);
 	if (err < 0) {
-		pr_err("failed to acquire resets: %d\n", err);
+		dev_err(dev, "failed to acquire resets for PM domain %s: %d\n",
+			pg->genpd.name, err);
 		return err;
 	}
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

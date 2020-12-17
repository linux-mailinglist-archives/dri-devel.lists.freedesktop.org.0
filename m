Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A3F2DDFC1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE8E89BC0;
	Fri, 18 Dec 2020 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AD66E20C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:54 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id o17so56902404lfg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aa+hChpvs0JDUl0QCouhA8Ook0AiIGpyBFoUGyXOUQI=;
 b=RhneqMMMFpT/rGzIIf7uEiGIehQLF+olyu6ZCNFX+oOHPVy1WdgNHVxT9bn1QlEeo8
 4n1SHThx55TK/bXvX0IGfRJ7GoL37rHD2WNc4lkOGHcBMZgFaWTsQ9+uAXZOE3rZqdlW
 hfAUUX5oiGE3CHjG6mziJsZz3/TzHP2qGv3tDSd1VA2XvrZn95KaGn/ZcVxL0pHAGh2t
 BFZLKfM9Wp2fxoMv38KrZ/YCEFInQqRvmkF2W5ssdGnXmVqNYh1slRuTRPDfy7h9LqfK
 9Ij69AfbaRxeblxSU7zdqyMpXBplESP2BswsvcjWDhIg3J1BrpiApycEtaMy4FtWjgRf
 UY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aa+hChpvs0JDUl0QCouhA8Ook0AiIGpyBFoUGyXOUQI=;
 b=PUFSmd2PWqvVeP8B5cVEOfy9X9PkPvVyY6LeoyUPuSjD4FNjzTLD2GzwQr/yPWEJuh
 CiSAa7M0HIOAu95ZbTqG5siYBffFwct+D+kYxuGG/rOJMV/tCyZ42z4seMGkBYWY+ZpW
 kCENuzsVguM8gNEctWs+hm/Av+aSXdVardNDPIvfT7i6CzCL4DcGnIwcTNgL4FHPZJ3B
 OL87POsfpal10v+w5zdU8QzdHSRAxbWGB82pScVb8aqhAj6RSV44YRyrjB2Xq7zKHnqK
 mXksE+7sBB2E0gv1Tb9aI/fby6BdH7OmNFVN6zHIKxuuSFVlCaSZ/eMfx7yKMdSjnpGp
 FpVw==
X-Gm-Message-State: AOAM533EFtJuOKcLttFGhhounAzD4Ma2/MBYpFZNcb8MGfdT96SnG/xL
 gG8dDUkZA1Hsc+1nTGLLUc4=
X-Google-Smtp-Source: ABdhPJxL85GcfJiXMkymH7isdZq+CnfDmDZN1MReJJCcpfCArlmNTx0/MjgW8Yls8T8+SwJfWzuMqQ==
X-Received: by 2002:a19:5e5b:: with SMTP id z27mr16037203lfi.143.1608228473454; 
 Thu, 17 Dec 2020 10:07:53 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:52 -0800 (PST)
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
Subject: [PATCH v2 29/48] soc/tegra: pmc: Link domains to the parent Core
 domain
Date: Thu, 17 Dec 2020 21:06:19 +0300
Message-Id: <20201217180638.22748-30-digetx@gmail.com>
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

The Core domain is a parent of PMC power domains, hence PMC domains
should be set up as a sub-domains of the parent (Core) domain if
"power-domains" phandle presents in a device-tree node of PMC domain.

This allows to propagate GENPD performance changes to the parent Core
domain if performance change is applied to PMC domain.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 4f96dc7745c4..1a659d1c06d7 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1236,6 +1236,7 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 static int tegra_powergate_init(struct tegra_pmc *pmc,
 				struct device_node *parent)
 {
+	struct of_phandle_args child_args, parent_args;
 	struct device_node *np, *child;
 	int err = 0;
 
@@ -1249,6 +1250,24 @@ static int tegra_powergate_init(struct tegra_pmc *pmc,
 			of_node_put(child);
 			break;
 		}
+
+		if (of_parse_phandle_with_args(child, "power-domains",
+					       "#power-domain-cells",
+					       0, &parent_args))
+			continue;
+
+		child_args.np = child;
+		child_args.args_count = 0;
+
+		err = of_genpd_add_subdomain(&parent_args, &child_args);
+		of_node_put(parent_args.np);
+		if (err) {
+			if (err == -ENOENT)
+				err = -EPROBE_DEFER;
+
+			of_node_put(child);
+			break;
+		}
 	}
 
 	of_node_put(np);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

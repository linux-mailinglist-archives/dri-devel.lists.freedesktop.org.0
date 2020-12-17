Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF89D2DDFA1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FEC89AB9;
	Fri, 18 Dec 2020 08:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D460C6E1ED
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:45 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id m12so59849876lfo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4FYxQew+p18AO5FBSec7kTxg/87GRcpO76q4A6IgDv4=;
 b=cOKXXBVSpDRg0y9isOFdN9ypZc0EDS0wcBFXXnpHA5gHfe4rMBp0KSj+DDdWOL11DO
 14H+OQC2eE39/MWECC9kqvFurVIqFvJ2WndhK/heNmgpBhaBuetfvjX3bSbDChUGYlOl
 M03g7jnK6aEYOl3VVMYqgb92F5jHXviJ0kadHsCvkB6DjdIkY3a6/yN0ivwTWZMQPNas
 0wbcDxjvzueYloI0q/vTGlIggkOTjoKgB+9h6hdCf1lTJRXhHWJAjOP8NmnXryCCK0tq
 y7aL9Gb5rsb/CvF+4IQm84UqG1pgiogHxaF3WzjOcQgVdkCBNmmODR0H0IjN3ODbgQKH
 YcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4FYxQew+p18AO5FBSec7kTxg/87GRcpO76q4A6IgDv4=;
 b=hJAjTLDN4MQL0xkeTb0wImV2f5xU6ffV71sF1UwjxWdYxzRk2pvzgRKVYcH7oDHLJv
 O5c/56mqH/OWrXBWJg4hrSCgt1tD1PIspo5kLtjYtK8qksE9L+7seP6YxNKTcC9EjIKj
 n3zjxhehUOXOY9pImSAe+Di8As7GubPZjFeM3ZwkaOK/FoNcH/LdNf3wI4C4By2gcU2X
 3i7IU5np3yEtBRB2yEr8nHN8siY8B2nzIE9a+I210Iikzah1N1uVaLP2JIu8OqvvnLYn
 AWRjXBi9MGzijis2zmx1WVleRJkAHYW3aMCCVNI33Qne8YNvTdaAWkQWZTDzPxfbRg/q
 /6eA==
X-Gm-Message-State: AOAM531i07I6ENt+pok/zmrUqFXObM9pUx767nyD/ePjTj8y7zJeGS1+
 hYoUByatFbrdth2ugmIwYUk=
X-Google-Smtp-Source: ABdhPJwJR2PqCRmXe5Tfarwrq+QmAbDDyYK3hcoSttNokb6f8iiftpP/z20ln6MtYTWY0f0cfPKVTg==
X-Received: by 2002:a2e:712:: with SMTP id 18mr205136ljh.165.1608228464322;
 Thu, 17 Dec 2020 10:07:44 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:43 -0800 (PST)
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
Subject: [PATCH v2 21/48] PM: domains: Add "performance" column to debug
 summary
Date: Thu, 17 Dec 2020 21:06:11 +0300
Message-Id: <20201217180638.22748-22-digetx@gmail.com>
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

Add "performance" column to debug summary which shows performance state
of all power domains and theirs devices.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/base/power/domain.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index a3e1bfc233d4..1c60dae8540c 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -2951,7 +2951,15 @@ static void rtpm_status_str(struct seq_file *s, struct device *dev)
 	else
 		WARN_ON(1);
 
-	seq_puts(s, p);
+	seq_printf(s, "%-25s  ", p);
+}
+
+static void perf_status_str(struct seq_file *s, struct device *dev)
+{
+	struct generic_pm_domain_data *gpd_data;
+
+	gpd_data = to_gpd_data(dev->power.subsys_data->domain_data);
+	seq_put_decimal_ull(s, "", gpd_data->performance_state);
 }
 
 static int genpd_summary_one(struct seq_file *s,
@@ -2979,7 +2987,7 @@ static int genpd_summary_one(struct seq_file *s,
 	else
 		snprintf(state, sizeof(state), "%s",
 			 status_lookup[genpd->status]);
-	seq_printf(s, "%-30s  %-15s ", genpd->name, state);
+	seq_printf(s, "%-30s  %-50s %u", genpd->name, state, genpd->performance_state);
 
 	/*
 	 * Modifications on the list require holding locks on both
@@ -2987,7 +2995,10 @@ static int genpd_summary_one(struct seq_file *s,
 	 * Also genpd->name is immutable.
 	 */
 	list_for_each_entry(link, &genpd->parent_links, parent_node) {
-		seq_printf(s, "%s", link->child->name);
+		if (list_is_first(&link->parent_node, &genpd->parent_links))
+			seq_printf(s, "\n%50s ", link->child->name);
+		else
+			seq_printf(s, "%s", link->child->name);
 		if (!list_is_last(&link->parent_node, &genpd->parent_links))
 			seq_puts(s, ", ");
 	}
@@ -3001,6 +3012,7 @@ static int genpd_summary_one(struct seq_file *s,
 
 		seq_printf(s, "\n    %-50s  ", kobj_path);
 		rtpm_status_str(s, pm_data->dev);
+		perf_status_str(s, pm_data->dev);
 		kfree(kobj_path);
 	}
 
@@ -3016,9 +3028,9 @@ static int summary_show(struct seq_file *s, void *data)
 	struct generic_pm_domain *genpd;
 	int ret = 0;
 
-	seq_puts(s, "domain                          status          children\n");
+	seq_puts(s, "domain                          status          children                           performance\n");
 	seq_puts(s, "    /device                                             runtime status\n");
-	seq_puts(s, "----------------------------------------------------------------------\n");
+	seq_puts(s, "----------------------------------------------------------------------------------------------\n");
 
 	ret = mutex_lock_interruptible(&gpd_list_lock);
 	if (ret)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

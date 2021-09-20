Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7DC412229
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 20:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDF86E5BD;
	Mon, 20 Sep 2021 18:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AF06E5BD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 18:12:01 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id t10so64972026lfd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 11:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wufLMjvcV2REchuzKnLPe9Ps3w6SDfXDXOXmKrrN/u8=;
 b=JN7GxvpOPNq+Oqp6duDkMntCZ8lBa2OcUwIq2xz81Cqu6aJXcvoSGwYvkEKSn3TGIi
 J/byK0VDMeaDXJRKJdcNNPquP5tCmrqGjYunCi4z2b567hkWsefXfoVApE0ZOtWBjtWa
 g/hqhyiS0h7h+IsYDCTeDEC55jfFprIpznVKtTPnNynj5sOIuqUWnYzk/hVFmfmLI6V+
 YnLIXS68xv13EVQVdA8z1uZg6FDW6l2sy+EwkkGbiIH0J4UOSXD15gD9Aw6/aPZZYHYI
 I7xNcKK3MqvJAOvUfniwLprFKU8hO18nrfUwnNDFwGjj6FdeCzZk6bzrg60DTViqtmGg
 QhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wufLMjvcV2REchuzKnLPe9Ps3w6SDfXDXOXmKrrN/u8=;
 b=qjdks9ic20RFcUj7f9z51VXQXEs7NvCrminf7Myn6tbQTFQY0n7ehCJNylXRt6rmQ1
 UoDBIlInpbJxzJPCLV2kUQACuLhzoMZ4xP+qMw3mU9JQE+rF/zWmziNZkTmt6h5OaONL
 6IRdaD8IcNT9SzoYsUy4to+a23OvDRXKDJFVtoRyQi3HvPJdlMCcI1NppIxNwP8+NWPv
 CszHNtHDSL8t7x+ZDU4dM3/dSDFQ0zwXMii9nuKh/qnno+7nW77bhjUJBz6KT152ODM2
 uZkliN3yir6GxyiQKDr+loz1Jk3obDjnuD1AUYI2fBeKbzC5z1uO8Jlcgm6suWPJzb5F
 tEgQ==
X-Gm-Message-State: AOAM5303OLxDBi+C56LRnyQrx5GWQAk5uC7yvbI/G0xudwG+YAFQzr01
 YPSAK8x5WFwnMQJ28f8aJGE=
X-Google-Smtp-Source: ABdhPJzbQIQuQGiApbO9GwH5+NuxjTWqNAoH6tuJ2Tj7QVup+0KXL9BjwmYobjt3qUZFoYVeLQeKoQ==
X-Received: by 2002:a05:6512:401e:: with SMTP id
 br30mr13112738lfb.399.1632161519020; 
 Mon, 20 Sep 2021 11:11:59 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru.
 [46.138.151.206])
 by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 11:11:58 -0700 (PDT)
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
Subject: [PATCH v12 01/35] opp: Change type of dev_pm_opp_attach_genpd(names)
 argument
Date: Mon, 20 Sep 2021 21:11:11 +0300
Message-Id: <20210920181145.19543-2-digetx@gmail.com>
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

Elements of the 'names' array are not changed by the code, constify them
for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 6 +++---
 include/linux/pm_opp.h | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 04b4691a8aac..3057beabd370 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2348,12 +2348,12 @@ static void _opp_detach_genpd(struct opp_table *opp_table)
  * "required-opps" are added in DT.
  */
 struct opp_table *dev_pm_opp_attach_genpd(struct device *dev,
-		const char **names, struct device ***virt_devs)
+		const char * const *names, struct device ***virt_devs)
 {
 	struct opp_table *opp_table;
 	struct device *virt_dev;
 	int index = 0, ret = -EINVAL;
-	const char **name = names;
+	const char * const *name = names;
 
 	opp_table = _add_opp_table(dev, false);
 	if (IS_ERR(opp_table))
@@ -2457,7 +2457,7 @@ static void devm_pm_opp_detach_genpd(void *data)
  *
  * Return: 0 on success and errorno otherwise.
  */
-int devm_pm_opp_attach_genpd(struct device *dev, const char **names,
+int devm_pm_opp_attach_genpd(struct device *dev, const char * const *names,
 			     struct device ***virt_devs)
 {
 	struct opp_table *opp_table;
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index a95d6fdd20b6..879c138c7b8e 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -156,9 +156,9 @@ int devm_pm_opp_set_clkname(struct device *dev, const char *name);
 struct opp_table *dev_pm_opp_register_set_opp_helper(struct device *dev, int (*set_opp)(struct dev_pm_set_opp_data *data));
 void dev_pm_opp_unregister_set_opp_helper(struct opp_table *opp_table);
 int devm_pm_opp_register_set_opp_helper(struct device *dev, int (*set_opp)(struct dev_pm_set_opp_data *data));
-struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs);
+struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, const char * const *names, struct device ***virt_devs);
 void dev_pm_opp_detach_genpd(struct opp_table *opp_table);
-int devm_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs);
+int devm_pm_opp_attach_genpd(struct device *dev, const char * const *names, struct device ***virt_devs);
 struct dev_pm_opp *dev_pm_opp_xlate_required_opp(struct opp_table *src_table, struct opp_table *dst_table, struct dev_pm_opp *src_opp);
 int dev_pm_opp_xlate_performance_state(struct opp_table *src_table, struct opp_table *dst_table, unsigned int pstate);
 int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq);
@@ -376,7 +376,7 @@ static inline int devm_pm_opp_set_clkname(struct device *dev, const char *name)
 	return -EOPNOTSUPP;
 }
 
-static inline struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs)
+static inline struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, const char * const *names, struct device ***virt_devs)
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
@@ -384,7 +384,7 @@ static inline struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, cons
 static inline void dev_pm_opp_detach_genpd(struct opp_table *opp_table) {}
 
 static inline int devm_pm_opp_attach_genpd(struct device *dev,
-					   const char **names,
+					   const char * const *names,
 					   struct device ***virt_devs)
 {
 	return -EOPNOTSUPP;
-- 
2.32.0


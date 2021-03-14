Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1E433A605
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 17:34:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCC989FC5;
	Sun, 14 Mar 2021 16:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0B189FC8;
 Sun, 14 Mar 2021 16:34:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d15so7478174wrv.5;
 Sun, 14 Mar 2021 09:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qS29V1BJSlNMqK4W3VtZ1MYGmSsW4VwhnDeOAdwAbvw=;
 b=cpESHBVt3ogqmVmqovwCZn1Ag4Z0WFHp1c7v/S1vqDt5xpVGRBRQSp3hdj6hYduwoW
 xwGGoudfu69sETSQWvPJAwqnraJugbB8M4h79Gcy6kRt+BBF8i7u8fExVH61Oxd7swVN
 3RxNgAJug2nueZJCGlp++UlnCrZ9BxYhQmR3zI9mYzX7OhCbpR4OxFTPfR2PEkEoXP05
 5c0g8NdyTdsvDH+VVAwEOwx289IIvY389tRFixFHI54GQWF9cP3uyZpepH7jW1jD/Loe
 bY2F33UJcx+BhojpDpWAPsARYYGAsuEcxAztWBmCxtRvcarqEVJP8bWKrVDOq+vgz2fl
 7Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qS29V1BJSlNMqK4W3VtZ1MYGmSsW4VwhnDeOAdwAbvw=;
 b=ToPqfsh0eFdiXlFzNU5Xz+WxIqj0Gz2MxlgRIOE/y4X5WIi1EnwzbKf7HoH8Fh8ppk
 khEZCzXAZgJlTfUYv/9H/e1uE0ByOACX0cMDautZXH5qH900npTUNinPf9dLe6KN/sUN
 0tUKvmoAykrUOpO/Ae9d2M9nyAk2+kP5TjSHUII97nb8aRFnx94kghoe6IYVCfS6R9oa
 vuZHohnLKzVM59TQ/Utuy0bWu2Tdf1RShFEtclQE6PBqWdVjFSAoQxtx7Zo3bFO+Fhim
 zFy9LEPah+sTxMXrUTS/j4EtYVbqXFchOtksWle2Taqrir8pL+aE3ROKKkYhoE6w8Wn2
 tG/g==
X-Gm-Message-State: AOAM530ZDDfTZdPNNH9V8XEQWJzU1rWq3Act59jt9VzQOk6drkELvU6b
 CgZVnMInOduR1MAblJUoeZM=
X-Google-Smtp-Source: ABdhPJwqAJpoo+3WpdYcCXMr1WxDj94mxJyjdRzjlxT5Tk19OseUPJKhU3WGd48Tc+w6ggG6mD+4CQ==
X-Received: by 2002:a5d:6443:: with SMTP id d3mr23825109wrw.292.1615739680210; 
 Sun, 14 Mar 2021 09:34:40 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id o7sm15723239wrs.16.2021.03.14.09.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 09:34:40 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v3 05/15] opp: Change return type of
 devm_pm_opp_register_set_opp_helper()
Date: Sun, 14 Mar 2021 19:33:58 +0300
Message-Id: <20210314163408.22292-6-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314163408.22292-1-digetx@gmail.com>
References: <20210314163408.22292-1-digetx@gmail.com>
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make devm_pm_opp_register_set_opp_helper() to return error code instead
of opp_table pointer in order to have return type consistent with the
other resource-managed OPP helpers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 18 ++++++------------
 include/linux/pm_opp.h |  6 +++---
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 34b054bbb28f..4f44f02e6049 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2295,25 +2295,19 @@ static void devm_pm_opp_unregister_set_opp_helper(void *data)
  *
  * This is a resource-managed version of dev_pm_opp_register_set_opp_helper().
  *
- * Return: pointer to 'struct opp_table' on success and errorno otherwise.
+ * Return: 0 on success and errorno otherwise.
  */
-struct opp_table *
-devm_pm_opp_register_set_opp_helper(struct device *dev,
-				    int (*set_opp)(struct dev_pm_set_opp_data *data))
+int devm_pm_opp_register_set_opp_helper(struct device *dev,
+					int (*set_opp)(struct dev_pm_set_opp_data *data))
 {
 	struct opp_table *opp_table;
-	int err;
 
 	opp_table = dev_pm_opp_register_set_opp_helper(dev, set_opp);
 	if (IS_ERR(opp_table))
-		return opp_table;
-
-	err = devm_add_action_or_reset(dev, devm_pm_opp_unregister_set_opp_helper,
-				       opp_table);
-	if (err)
-		return ERR_PTR(err);
+		return PTR_ERR(opp_table);
 
-	return opp_table;
+	return devm_add_action_or_reset(dev, devm_pm_opp_unregister_set_opp_helper,
+					opp_table);
 }
 EXPORT_SYMBOL_GPL(devm_pm_opp_register_set_opp_helper);
 
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 3f8894012429..865426b525a8 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -155,7 +155,7 @@ void dev_pm_opp_put_clkname(struct opp_table *opp_table);
 int devm_pm_opp_set_clkname(struct device *dev, const char *name);
 struct opp_table *dev_pm_opp_register_set_opp_helper(struct device *dev, int (*set_opp)(struct dev_pm_set_opp_data *data));
 void dev_pm_opp_unregister_set_opp_helper(struct opp_table *opp_table);
-struct opp_table *devm_pm_opp_register_set_opp_helper(struct device *dev, int (*set_opp)(struct dev_pm_set_opp_data *data));
+int devm_pm_opp_register_set_opp_helper(struct device *dev, int (*set_opp)(struct dev_pm_set_opp_data *data));
 struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs);
 void dev_pm_opp_detach_genpd(struct opp_table *opp_table);
 struct opp_table *devm_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs);
@@ -337,11 +337,11 @@ static inline struct opp_table *dev_pm_opp_register_set_opp_helper(struct device
 
 static inline void dev_pm_opp_unregister_set_opp_helper(struct opp_table *opp_table) {}
 
-static inline struct opp_table *
+static int
 devm_pm_opp_register_set_opp_helper(struct device *dev,
 				    int (*set_opp)(struct dev_pm_set_opp_data *data))
 {
-	return ERR_PTR(-EOPNOTSUPP);
+	return -EOPNOTSUPP;
 }
 
 static inline struct opp_table *dev_pm_opp_set_prop_name(struct device *dev, const char *name)
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

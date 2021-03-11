Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F5B337D90
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 20:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB62B6EB90;
	Thu, 11 Mar 2021 19:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A890D6EB88;
 Thu, 11 Mar 2021 19:21:40 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id u4so41677586lfs.0;
 Thu, 11 Mar 2021 11:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fsTd46l5Jglw9pw96E7Isv1iNj315cStq2faVWwmZQY=;
 b=O48j2praIpm6d4Lp3KF4U9fKQJiq115WXRZyxaVlSiDpKYaJ5MxRkLsSoiTsVizFyZ
 9mtbn7uErT2P61NT7bKf000cXQyaFBqQgwnt31jXAlIGlGjt3rVlQOporBs+rNCSvjax
 +V0MWKdv5j0hhD3Yc9XvHYoJG+vHeSnUcx2bB5yWiBIK6m7QtTqBGqhfhvpft0zAO8N6
 hJAFrAIkZF+01WGNygJw7ROr1mbs1Fnm6rvVRSSsNARhvbYhqkyAtGP5mU0LZvld5DNp
 x1y6gUv514RtQMOLAbB+TQVu4DbWFxoNvaoRCTTyJCqElg9Lc3SWLoX46LlnmraZAZMG
 n49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fsTd46l5Jglw9pw96E7Isv1iNj315cStq2faVWwmZQY=;
 b=DIwUNdJmMIHlvcO8bmkm/qYkQiXo+s6W1ampbjk6A5YXUTR6GWk31xy55o/WocC88d
 uOkIzwb9/9GK/OPPlo21mXvhn0q1wFx6bEXzyUvaFiwJOTBmYc45gGyGczTg6QzNyxzS
 DyEyx4sUPE3oPNga5lUIo/UNlyi1wloZk6VEHt50OC+WqUpSJAlwdgdo+b1u7xNFrihq
 8iLuxhb9f0mMF34XF8XeC21MyFJSCZoF4EexP2nycHCTjH0566T+8vfYZTppvOcZ7Tp7
 UOBpBgm+YyFVol4xCRxV4oTjzblDaRneqHMrEWZs3z1xrJkYCabuUt8vEdGCPKfuUgu0
 7R5w==
X-Gm-Message-State: AOAM530N76oYWtB4Z8E/xuC6qZUMvEHdp6FYgXCnOmW09gKUbrR5MW8q
 69+EyfQzxnv5iBc39vhKR8E=
X-Google-Smtp-Source: ABdhPJwYRhhMQoWzZIiXQPyd+9sZC33xOfDiT6XWugm+Ut7Eo3DAK83JRVu3uJVYd9XFqktMJp+AEg==
X-Received: by 2002:a19:f510:: with SMTP id j16mr3211024lfb.301.1615490497638; 
 Thu, 11 Mar 2021 11:21:37 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id u14sm1121153lfl.40.2021.03.11.11.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 11:21:37 -0800 (PST)
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
Subject: [PATCH v2 01/14] opp: Add devres wrapper for dev_pm_opp_set_clkname
Date: Thu, 11 Mar 2021 22:20:52 +0300
Message-Id: <20210311192105.14998-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311192105.14998-1-digetx@gmail.com>
References: <20210311192105.14998-1-digetx@gmail.com>
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

From: Yangtao Li <tiny.windzz@gmail.com>

Add devres wrapper for dev_pm_opp_set_clkname() to simplify drivers code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/pm_opp.h |  6 ++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 150be4c28c99..3345ab8da6b2 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2119,6 +2119,42 @@ void dev_pm_opp_put_clkname(struct opp_table *opp_table)
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_put_clkname);
 
+static void devm_pm_opp_clkname_release(void *data)
+{
+	dev_pm_opp_put_clkname(data);
+}
+
+/**
+ * devm_pm_opp_set_clkname() - Set clk name for the device
+ * @dev: Device for which clk name is being set.
+ * @name: Clk name.
+ *
+ * In order to support OPP switching, OPP layer needs to get pointer to the
+ * clock for the device. Simple cases work fine without using this routine (i.e.
+ * by passing connection-id as NULL), but for a device with multiple clocks
+ * available, the OPP core needs to know the exact name of the clk to use.
+ *
+ * This must be called before any OPPs are initialized for the device.
+ *
+ * The opp_table structure will be freed after the device is destroyed.
+ */
+struct opp_table *devm_pm_opp_set_clkname(struct device *dev, const char *name)
+{
+	struct opp_table *opp_table;
+	int err;
+
+	opp_table = dev_pm_opp_set_clkname(dev, name);
+	if (IS_ERR(opp_table))
+		return opp_table;
+
+	err = devm_add_action_or_reset(dev, devm_pm_opp_clkname_release, opp_table);
+	if (err)
+		opp_table = ERR_PTR(err);
+
+	return opp_table;
+}
+EXPORT_SYMBOL_GPL(devm_pm_opp_set_clkname);
+
 /**
  * dev_pm_opp_register_set_opp_helper() - Register custom set OPP helper
  * @dev: Device for which the helper is getting registered.
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index c0371efa4a0f..6fb992168f1e 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -150,6 +150,7 @@ struct opp_table *dev_pm_opp_set_regulators(struct device *dev, const char * con
 void dev_pm_opp_put_regulators(struct opp_table *opp_table);
 struct opp_table *dev_pm_opp_set_clkname(struct device *dev, const char *name);
 void dev_pm_opp_put_clkname(struct opp_table *opp_table);
+struct opp_table *devm_pm_opp_set_clkname(struct device *dev, const char *name);
 struct opp_table *dev_pm_opp_register_set_opp_helper(struct device *dev, int (*set_opp)(struct dev_pm_set_opp_data *data));
 void dev_pm_opp_unregister_set_opp_helper(struct opp_table *opp_table);
 struct opp_table *devm_pm_opp_register_set_opp_helper(struct device *dev, int (*set_opp)(struct dev_pm_set_opp_data *data));
@@ -355,6 +356,11 @@ static inline struct opp_table *dev_pm_opp_set_clkname(struct device *dev, const
 
 static inline void dev_pm_opp_put_clkname(struct opp_table *opp_table) {}
 
+static inline struct opp_table *devm_pm_opp_set_clkname(struct device *dev, const char *name)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
 static inline struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs)
 {
 	return ERR_PTR(-EOPNOTSUPP);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

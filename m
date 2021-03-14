Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4141D33A603
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 17:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D9B89FBC;
	Sun, 14 Mar 2021 16:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA1589F99;
 Sun, 14 Mar 2021 16:34:37 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e9so4486827wrw.10;
 Sun, 14 Mar 2021 09:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hPYuaQIiYacDdTRkFz7tGyExYGJ5aL233qtVSVNLxbM=;
 b=u+Tt9wWI4e3BQ1rYQRpaqKQDgHwRnDqzBh78+io9i+PwANlqkgXpLBdJ0l0ArdAeJR
 0wQLZUsIpbwe8BV0z1sh5u9qJ5lw7zXq+EBwqV+CHMuS5/kC2Cl99xWRUsIMKVQgX3lp
 kZVodOmxbA0vfSykFlRqfrpYBetNmq+8trL0ILDyT8yykYfhnIVmCjxis6SS/GlZDKMA
 fuOT3dCrNcyj9IAkCm5EfrYbWe8Y6OSAr/Zx+wz+UWY2256KVXw/z77MB8Y7oXg/b6f7
 BKnIkcfIZwstErOYkjtwUgnLsyGZvC1+jBV+sPXtYjeUGT7a4M/xHBChZEGLidK3wumh
 H9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hPYuaQIiYacDdTRkFz7tGyExYGJ5aL233qtVSVNLxbM=;
 b=kdgJMSaNTVQsHSzCUMWjOlwg/zGjUlrh3EC+nYfHXwXslKhyAdmNdePYOAJ4rIlGtX
 yjs8RolS7pKBfmDiAEjXMvspxWowJ8DCiGQ+xN9XjdQFYP1M8YYbjdgtDcSp3ZDYNTU4
 LaunJqnXG3jBSeXnxiDXSHOIHh+lKRH4/WkfM5C4PL51BDTXnerOAGY70JsgvPiNLDxn
 5WCaQYcA+5xkgR0njRUnL+mSOiGQY313ftX5T1r4XZH4rLY/InRniqonNDpkOi7+WpDQ
 m8HcBK/BhvDVDrwzHX4+wWpIdmPleuA/h0biTE6zJryGy3PC/TQ18zBq4X4+VHzs7hNk
 t03Q==
X-Gm-Message-State: AOAM533EJkX9LlmjaXF4OEN8BHFBCUXs6iZOipDoVAAola7M92G1kqhr
 B5chLXfnDCaHQQYKuNDPK24=
X-Google-Smtp-Source: ABdhPJwRxZyo8Lm2nydoYcYZxtHj/cVPyavor29AJZSFgxwGb12emaS8kHyyqbuV8T+gbvxEe7TieQ==
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr23809490wri.77.1615739675873; 
 Sun, 14 Mar 2021 09:34:35 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id o7sm15723239wrs.16.2021.03.14.09.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 09:34:35 -0700 (PDT)
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
Subject: [PATCH v3 03/15] opp: Add devres wrapper for
 dev_pm_opp_set_supported_hw
Date: Sun, 14 Mar 2021 19:33:56 +0300
Message-Id: <20210314163408.22292-4-digetx@gmail.com>
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

From: Yangtao Li <tiny.windzz@gmail.com>

Add devres wrapper for dev_pm_opp_set_supported_hw() to simplify drivers
code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 29 +++++++++++++++++++++++++++++
 include/linux/pm_opp.h |  8 ++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 6217af05141f..34b054bbb28f 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1857,6 +1857,35 @@ void dev_pm_opp_put_supported_hw(struct opp_table *opp_table)
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_put_supported_hw);
 
+static void devm_pm_opp_supported_hw_release(void *data)
+{
+	dev_pm_opp_put_supported_hw(data);
+}
+
+/**
+ * devm_pm_opp_set_supported_hw() - Set supported platforms
+ * @dev: Device for which supported-hw has to be set.
+ * @versions: Array of hierarchy of versions to match.
+ * @count: Number of elements in the array.
+ *
+ * This is a resource-managed variant of dev_pm_opp_set_supported_hw().
+ *
+ * Return: 0 on success and errorno otherwise.
+ */
+int devm_pm_opp_set_supported_hw(struct device *dev, const u32 *versions,
+				 unsigned int count)
+{
+	struct opp_table *opp_table;
+
+	opp_table = dev_pm_opp_set_supported_hw(dev, versions, count);
+	if (IS_ERR(opp_table))
+		return PTR_ERR(opp_table);
+
+	return devm_add_action_or_reset(dev, devm_pm_opp_supported_hw_release,
+					opp_table);
+}
+EXPORT_SYMBOL_GPL(devm_pm_opp_set_supported_hw);
+
 /**
  * dev_pm_opp_set_prop_name() - Set prop-extn name
  * @dev: Device for which the prop-name has to be set.
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 3e667af57211..e455b187e405 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -144,6 +144,7 @@ int dev_pm_opp_unregister_notifier(struct device *dev, struct notifier_block *nb
 
 struct opp_table *dev_pm_opp_set_supported_hw(struct device *dev, const u32 *versions, unsigned int count);
 void dev_pm_opp_put_supported_hw(struct opp_table *opp_table);
+int devm_pm_opp_set_supported_hw(struct device *dev, const u32 *versions, unsigned int count);
 struct opp_table *dev_pm_opp_set_prop_name(struct device *dev, const char *name);
 void dev_pm_opp_put_prop_name(struct opp_table *opp_table);
 struct opp_table *dev_pm_opp_set_regulators(struct device *dev, const char * const names[], unsigned int count);
@@ -321,6 +322,13 @@ static inline struct opp_table *dev_pm_opp_set_supported_hw(struct device *dev,
 
 static inline void dev_pm_opp_put_supported_hw(struct opp_table *opp_table) {}
 
+static inline int devm_pm_opp_set_supported_hw(struct device *dev,
+					       const u32 *versions,
+					       unsigned int count)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline struct opp_table *dev_pm_opp_register_set_opp_helper(struct device *dev,
 			int (*set_opp)(struct dev_pm_set_opp_data *data))
 {
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

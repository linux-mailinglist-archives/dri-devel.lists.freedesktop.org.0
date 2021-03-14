Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7572633A601
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 17:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AF389F8E;
	Sun, 14 Mar 2021 16:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE4789F8E;
 Sun, 14 Mar 2021 16:34:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso18823591wma.4; 
 Sun, 14 Mar 2021 09:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=suQTUJT95TToQZtvwJl+RSOWWo46pQcxeekooCpqVRE=;
 b=mWOhEWIIsc3g51/r4PPuTyVIq+fH9uyJTXCIr7ia4jxvUoOPc/NOBuXvxFpp37+sgM
 oWFUAvtO3jAmlc+Gh7AgygkSjZ3ZdAt9RnsigCjWBcz9qXNGbojGZYMx2MLYv63ioNUr
 kBcixmyyH2o612X49U7uUmIdbHOjwNNT+W/jZH7lULyWC6HofFScf3nELSuSnNeEgx+7
 c1LQLMTj0bHwnoJwjMCQgRzFXPsrqvDQDaUB3bSIPpPeyhndLfRs9bM6hCnL521qtyN+
 slSchI8ROdq4ZXLH6K5M2VnrvEwkx1s1Q0heBXBQFO3w6/7I3w89zIHK/wSRLWOCT3Cn
 v/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=suQTUJT95TToQZtvwJl+RSOWWo46pQcxeekooCpqVRE=;
 b=ZHGGlqD8e/NEMOrbtnh8gDNr1c/DRK/puu49LO5XfNcLtSECnA2WH6W8D13wlTNSdU
 qaFi2CDVgFruLqMCvl1Qpb0hyBWsvnrJy4NFN5HwCHYE3RlY4RrwewPVmKg0LE8WXvaU
 CyqFVyJvoC+1B9GbscDPHDyeYHdm2wmv/LJWMiqYb7/81K7l7xW/m9pobTitvnkds961
 0McozE+BOKQZXjL+0uiwJKUOwh2ouKiWjgT07eqNWTlsmTZVIAcEUOLnlt6EwZ4k58Wo
 bQk5/wmdGoRRqKnt4YwCSjaRpHzQ7pyp7WDJA9Uvry8o/Vjr7nRWcsKbNZmOYL7o67Gs
 jG9A==
X-Gm-Message-State: AOAM532l2LGuPOB1OhSExw1ykFekaG6LSVFH5lTVcGDpTxM2NmzM92H9
 m8ADB3q/IQVDyXuQKYQpyHfJIwZn/fo=
X-Google-Smtp-Source: ABdhPJz0vqh5YDNEcDycdMN9ARg89KMLgBV4wfAIgwa+5wl5vspiGMEYEGXjVQ+So4rOyxhou3mWFw==
X-Received: by 2002:a1c:61c5:: with SMTP id v188mr21841943wmb.20.1615739671508; 
 Sun, 14 Mar 2021 09:34:31 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id o7sm15723239wrs.16.2021.03.14.09.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 09:34:31 -0700 (PDT)
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
Subject: [PATCH v3 01/15] opp: Add devres wrapper for dev_pm_opp_set_clkname
Date: Sun, 14 Mar 2021 19:33:54 +0300
Message-Id: <20210314163408.22292-2-digetx@gmail.com>
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

Add devres wrapper for dev_pm_opp_set_clkname() to simplify drivers code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 27 +++++++++++++++++++++++++++
 include/linux/pm_opp.h |  6 ++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 150be4c28c99..02e46508a3a2 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2119,6 +2119,33 @@ void dev_pm_opp_put_clkname(struct opp_table *opp_table)
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
+ * This is a resource-managed variant of dev_pm_opp_set_clkname().
+ *
+ * Return: 0 on success and errorno otherwise.
+ */
+int devm_pm_opp_set_clkname(struct device *dev, const char *name)
+{
+	struct opp_table *opp_table;
+
+	opp_table = dev_pm_opp_set_clkname(dev, name);
+	if (IS_ERR(opp_table))
+		return PTR_ERR(opp_table);
+
+	return devm_add_action_or_reset(dev, devm_pm_opp_clkname_release,
+					opp_table);
+}
+EXPORT_SYMBOL_GPL(devm_pm_opp_set_clkname);
+
 /**
  * dev_pm_opp_register_set_opp_helper() - Register custom set OPP helper
  * @dev: Device for which the helper is getting registered.
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index c0371efa4a0f..0583d775aa5a 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -150,6 +150,7 @@ struct opp_table *dev_pm_opp_set_regulators(struct device *dev, const char * con
 void dev_pm_opp_put_regulators(struct opp_table *opp_table);
 struct opp_table *dev_pm_opp_set_clkname(struct device *dev, const char *name);
 void dev_pm_opp_put_clkname(struct opp_table *opp_table);
+int devm_pm_opp_set_clkname(struct device *dev, const char *name);
 struct opp_table *dev_pm_opp_register_set_opp_helper(struct device *dev, int (*set_opp)(struct dev_pm_set_opp_data *data));
 void dev_pm_opp_unregister_set_opp_helper(struct opp_table *opp_table);
 struct opp_table *devm_pm_opp_register_set_opp_helper(struct device *dev, int (*set_opp)(struct dev_pm_set_opp_data *data));
@@ -355,6 +356,11 @@ static inline struct opp_table *dev_pm_opp_set_clkname(struct device *dev, const
 
 static inline void dev_pm_opp_put_clkname(struct opp_table *opp_table) {}
 
+static inline int devm_pm_opp_set_clkname(struct device *dev, const char *name)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs)
 {
 	return ERR_PTR(-EOPNOTSUPP);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

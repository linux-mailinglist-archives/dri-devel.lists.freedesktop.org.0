Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BCF33A604
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 17:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE32989FCA;
	Sun, 14 Mar 2021 16:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5548289FC0;
 Sun, 14 Mar 2021 16:34:39 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id f12so7458916wrx.8;
 Sun, 14 Mar 2021 09:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MuP+ya1TCLfEJhgrcgilzphIjibvsMXSimlz4L+7lFI=;
 b=exUIeWl24EOjIUmfAaeS6k0OXiU4NcTd8Qy53S/aiIrFYI6/OmAsmn2xJgRSdl/BjC
 dkBbaKnGOtZpOr1AmAXK8JYrt3X5jsw6rTV30XNiCdt2WgUSOKkl7iJhf1auf6rQwsD1
 N+XNdDdaXZa3bo+WIvliwJVfj7gms69x+ZKL7ETk18rOTTF4+VZ712iPywymPerxZajH
 U7YUwD/ZHdovDcY9heblrU9AYlObKY3F4N5i/g11rSd61ztlBjDgLQPoamT0R7Rz+GBY
 wWACZlpNvox00P0MT1ApkvVV/BbqMo5vN3Nr8Ufa+wSe9IkKjJ8lEJUB0YAcxGGVQl6E
 wmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MuP+ya1TCLfEJhgrcgilzphIjibvsMXSimlz4L+7lFI=;
 b=GZMMFaGVqiz/anEhw1c71fps/clgLUJyQYdrBk1VXJmqPi+LGAPrzJ6a18icsJ8pH4
 IkPCwOKqp1fTjJ3SDrhefLEubQ5RKzyKqkp7jEdm5MKHl6DQDwrPZTYR91nNBmB5Txfp
 7DpcDot2HVqNlJYYwF8j/tCk1KBWwzcyQonu1qkWGIK+rCof7/TVnCuHE60IC36yE5Lo
 GGdimZjAyt5LiJQSRlV9t94riFmmTFBhpMExplU5T1dUOgwxNjSFJ/XDu1oHQGuOTuUW
 OGN9gvERo4bCWmvAs/0P3cZew04iMxoq3QcWFvEDE7EJ2zKATVcjkHD5kvp7n43PqCvi
 2Kwg==
X-Gm-Message-State: AOAM530IRi0SjUz3axI4kuGBycjTJpbTHq/zTW2HcIhicHSqT+aeli9p
 5Bl+pv8s5hO3cYd52I0HSiihgB4T5KU=
X-Google-Smtp-Source: ABdhPJzvVKezMVimD4xtxAVaXLby/wwTk3qiRh8onBaqhnEjl7HWG4y8DknbiYjDn9c/ALnnPRmnjw==
X-Received: by 2002:a05:6000:181b:: with SMTP id
 m27mr24206124wrh.363.1615739678029; 
 Sun, 14 Mar 2021 09:34:38 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id o7sm15723239wrs.16.2021.03.14.09.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 09:34:37 -0700 (PDT)
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
Subject: [PATCH v3 04/15] opp: Add devres wrapper for dev_pm_opp_of_add_table
Date: Sun, 14 Mar 2021 19:33:57 +0300
Message-Id: <20210314163408.22292-5-digetx@gmail.com>
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

Add devres wrapper for dev_pm_opp_of_add_table() to simplify drivers
code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/of.c       | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/pm_opp.h |  6 ++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index f480c10e6314..c582a9ca397b 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -1104,6 +1104,42 @@ static int _of_add_table_indexed(struct device *dev, int index, bool getclk)
 	return ret;
 }
 
+static void devm_pm_opp_of_table_release(void *data)
+{
+	dev_pm_opp_of_remove_table(data);
+}
+
+/**
+ * devm_pm_opp_of_add_table() - Initialize opp table from device tree
+ * @dev:	device pointer used to lookup OPP table.
+ *
+ * Register the initial OPP table with the OPP library for given device.
+ *
+ * The opp_table structure will be freed after the device is destroyed.
+ *
+ * Return:
+ * 0		On success OR
+ *		Duplicate OPPs (both freq and volt are same) and opp->available
+ * -EEXIST	Freq are same and volt are different OR
+ *		Duplicate OPPs (both freq and volt are same) and !opp->available
+ * -ENOMEM	Memory allocation failure
+ * -ENODEV	when 'operating-points' property is not found or is invalid data
+ *		in device node.
+ * -ENODATA	when empty 'operating-points' property is found
+ * -EINVAL	when invalid entries are found in opp-v2 table
+ */
+int devm_pm_opp_of_add_table(struct device *dev)
+{
+	int ret;
+
+	ret = dev_pm_opp_of_add_table(dev);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, devm_pm_opp_of_table_release, dev);
+}
+EXPORT_SYMBOL_GPL(devm_pm_opp_of_add_table);
+
 /**
  * dev_pm_opp_of_add_table() - Initialize opp table from device tree
  * @dev:	device pointer used to lookup OPP table.
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index e455b187e405..3f8894012429 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -441,6 +441,7 @@ int dev_pm_opp_of_add_table(struct device *dev);
 int dev_pm_opp_of_add_table_indexed(struct device *dev, int index);
 int dev_pm_opp_of_add_table_noclk(struct device *dev, int index);
 void dev_pm_opp_of_remove_table(struct device *dev);
+int devm_pm_opp_of_add_table(struct device *dev);
 int dev_pm_opp_of_cpumask_add_table(const struct cpumask *cpumask);
 void dev_pm_opp_of_cpumask_remove_table(const struct cpumask *cpumask);
 int dev_pm_opp_of_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask);
@@ -473,6 +474,11 @@ static inline void dev_pm_opp_of_remove_table(struct device *dev)
 {
 }
 
+static inline int devm_pm_opp_of_add_table(struct device *dev)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int dev_pm_opp_of_cpumask_add_table(const struct cpumask *cpumask)
 {
 	return -EOPNOTSUPP;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

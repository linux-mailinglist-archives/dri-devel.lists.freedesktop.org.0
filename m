Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CAD33A606
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 17:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FED89FC8;
	Sun, 14 Mar 2021 16:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9684789FC8;
 Sun, 14 Mar 2021 16:34:43 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x16so4496907wrn.4;
 Sun, 14 Mar 2021 09:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C/5Ng/DtkoydDqBvZq8AbYfbXEoAPbsENXRNj6fGs4M=;
 b=AZIjeihL2yluu7+ziQ9v+nQ1dEmp58/PiHa0qg4i1Vn3Us0fHEIXwilYfY2Mz+8lLz
 c0juj89+qh1eRLRy5OMe/Jc0YneZIEpze02hLIQDNsNBds7JdxWpqbbstGB5knFg9k6u
 4aBoy9+aqAMV/zw4Y++14Ku4isUFAILx12+GIfbpZ8ByRBABxrTKObpDvkf/ykkr2FaM
 IPxLz8UE1vQ68mW6wRIOz4EbI8tzujeA0Uu/zc1thT/j9I+8ZI0y6pR8ZqFxc+P9y8Yf
 nkHE2w3spY5YhLMok/47iL83KVGZ9r8YxpSc6TDfDdTuqNkCBpRiZrHzRt5Fz7dxuqZC
 XkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C/5Ng/DtkoydDqBvZq8AbYfbXEoAPbsENXRNj6fGs4M=;
 b=bYeUiUc29P1NL8WIFBr236iQMOCwX6F3p7k7axK89/WbKGIpzvSIhSATmpTUQdCbCI
 YCRii2jA3q3sBksAqcZvSwVkd38gfAmMVe0kRTr4L4/F8umNgzVNrXBQI3+gIGdxl493
 Bg8PmVEvW8LUtrXlZ9rtf33td6ou+6TBlz+lJJWeH4pcElq8FFhIZfxDbnG5rDidWvY8
 lebSdGGJsPSUX9nLMIlvhlu9LN87AL5FHtqutcit+OcB7Azd1FRStJrA0KVW+MC3V2XK
 GeJTdITHwhvvyVKIvdRNlGR5+P7kHplMAw5HV5+A8Xft0MWoQyQ56jAutQT1+3yoEUwF
 ivWA==
X-Gm-Message-State: AOAM5307LabFmy4fmV15mumziEdf9OV9LnJxj+BVM91Ru2nha9inmQ3z
 452qhIaBuf/N3fQW9EoX6Ic=
X-Google-Smtp-Source: ABdhPJwTslpY31/qqM5Kj4SW4qqIUgqTVjIObWqN26uqLWPcyfaojPCdZoyfNAhylicplEYulZuQuQ==
X-Received: by 2002:a5d:53c8:: with SMTP id a8mr23285997wrw.323.1615739682317; 
 Sun, 14 Mar 2021 09:34:42 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id o7sm15723239wrs.16.2021.03.14.09.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 09:34:42 -0700 (PDT)
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
Subject: [PATCH v3 06/15] opp: Change return type of devm_pm_opp_attach_genpd()
Date: Sun, 14 Mar 2021 19:33:59 +0300
Message-Id: <20210314163408.22292-7-digetx@gmail.com>
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

Make devm_pm_opp_attach_genpd() to return error code instead of
opp_table pointer in order to have return type consistent with the
other resource-managed OPP helpers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 18 ++++++------------
 include/linux/pm_opp.h |  9 +++++----
 2 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 4f44f02e6049..2076b12c039b 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2460,25 +2460,19 @@ static void devm_pm_opp_detach_genpd(void *data)
  *
  * This is a resource-managed version of dev_pm_opp_attach_genpd().
  *
- * Return: pointer to 'struct opp_table' on success and errorno otherwise.
+ * Return: 0 on success and errorno otherwise.
  */
-struct opp_table *
-devm_pm_opp_attach_genpd(struct device *dev, const char **names,
-			 struct device ***virt_devs)
+int devm_pm_opp_attach_genpd(struct device *dev, const char **names,
+			     struct device ***virt_devs)
 {
 	struct opp_table *opp_table;
-	int err;
 
 	opp_table = dev_pm_opp_attach_genpd(dev, names, virt_devs);
 	if (IS_ERR(opp_table))
-		return opp_table;
-
-	err = devm_add_action_or_reset(dev, devm_pm_opp_detach_genpd,
-				       opp_table);
-	if (err)
-		return ERR_PTR(err);
+		return PTR_ERR(opp_table);
 
-	return opp_table;
+	return devm_add_action_or_reset(dev, devm_pm_opp_detach_genpd,
+					opp_table);
 }
 EXPORT_SYMBOL_GPL(devm_pm_opp_attach_genpd);
 
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 865426b525a8..a5ae69c40ea7 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -158,7 +158,7 @@ void dev_pm_opp_unregister_set_opp_helper(struct opp_table *opp_table);
 int devm_pm_opp_register_set_opp_helper(struct device *dev, int (*set_opp)(struct dev_pm_set_opp_data *data));
 struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs);
 void dev_pm_opp_detach_genpd(struct opp_table *opp_table);
-struct opp_table *devm_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs);
+int devm_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs);
 struct dev_pm_opp *dev_pm_opp_xlate_required_opp(struct opp_table *src_table, struct opp_table *dst_table, struct dev_pm_opp *src_opp);
 int dev_pm_opp_xlate_performance_state(struct opp_table *src_table, struct opp_table *dst_table, unsigned int pstate);
 int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq);
@@ -384,10 +384,11 @@ static inline struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, cons
 
 static inline void dev_pm_opp_detach_genpd(struct opp_table *opp_table) {}
 
-static inline struct opp_table *devm_pm_opp_attach_genpd(struct device *dev,
-				const char **names, struct device ***virt_devs)
+static inline int devm_pm_opp_attach_genpd(struct device *dev,
+					   const char **names,
+					   struct device ***virt_devs)
 {
-	return ERR_PTR(-EOPNOTSUPP);
+	return -EOPNOTSUPP;
 }
 
 static inline struct dev_pm_opp *dev_pm_opp_xlate_required_opp(struct opp_table *src_table,
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

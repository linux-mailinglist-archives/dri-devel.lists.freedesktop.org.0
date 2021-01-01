Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0A52E91D2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDC7899BE;
	Mon,  4 Jan 2021 08:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E956089B8F;
 Fri,  1 Jan 2021 16:55:51 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id c22so14697775pgg.13;
 Fri, 01 Jan 2021 08:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jSgEcrho0mC0MqovR8tuPLRaUmrVqGj6HlZ4/yGfEXw=;
 b=aGS0B0vEV986rFT80IwqPLLi7pXCjlq83uYiB/Ny1tYqjEMY6hy4Bj2t6IpP98/7MB
 jTDI0EZPmkoKnm0SIZF7GlD+KNlP97eaDeIDwgj8JliXng+keDTQUK4FPNxN2rMwKRZp
 FXaB6ykASKZCOjHH3QkzgrhJqOrLGMlMtHfOn3lPx97IEwZAjn0rrY95snH5wR8MBWhr
 xx30c2reIvU8yoKAuEF2lWESTs7dZvOHmMZJ3UN9JBUieLnevCfV6NrRRu60yEKhvarI
 +Hg18B7HqMyp9yJvDGYT2OnzDYvyLR4At1f8V4CFcEU7Ykl2LDF1fdJkLJHSkINC+azE
 9PAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jSgEcrho0mC0MqovR8tuPLRaUmrVqGj6HlZ4/yGfEXw=;
 b=UGiCDXpS8GKxmGEvJWQ6CVQPGKT0MP6SIuJOtzi516YQQhQ7sRrm+0KtNewHF7Gkms
 0hdk7Xi8qIGCKyuoUrh60rQns3B5NpH9xdkbymnqoyQHqscK7/DjpIWAKeys40o5sAIJ
 ZQIaoQ3C0xYdn8qwddCQFAZUGgqw+VoVq5w3Ktx1YFDxUwSZB4u0uNHBf6tsj8U2Hanq
 0Lun4SAonyjnXEe7glewyI/87Gb+UuhcEV/52PyErYsQw+D3qkkMYlqfNlTZkLeuzR7i
 VTsQVb+ixJG9/hX0RyCxcGFmo0OjLp9QrL2MY08VdjxFKyq/GFM/OrSjBd8/T4J9zA8B
 IpGg==
X-Gm-Message-State: AOAM532RUqt1i4uA6wUEU+h7vwQMxWgdFlKlFhGL3VIaAnIUA73ZX/nN
 yMnOO5vomPHFcanN/yLpluU=
X-Google-Smtp-Source: ABdhPJx7Y5fDrI3Nw5ccpXao7TdRRHkcUsIQez9CDHxadaL27Lquw4mtPK14VUBNju5ibZV7qcGhfw==
X-Received: by 2002:a63:1401:: with SMTP id u1mr49023986pgl.229.1609520151572; 
 Fri, 01 Jan 2021 08:55:51 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.08.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 08:55:50 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com,
 krzk@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 digetx@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 yuq825@gmail.com, airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com,
 sean@poorly.run, robh@kernel.org, tomeu.vizoso@collabora.com,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 stanimir.varbanov@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, mchehab@kernel.org, lukasz.luba@arm.com,
 adrian.hunter@intel.com, ulf.hansson@linaro.org, vireshk@kernel.org,
 nm@ti.com, sboyd@kernel.org, broonie@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, rjw@rjwysocki.net,
 jcrouse@codeaurora.org, hoegsberg@google.com, eric@anholt.net,
 tzimmermann@suse.de, marijn.suijten@somainline.org, gustavoars@kernel.org,
 emil.velikov@collabora.com, jonathan@marek.ca, akhilpo@codeaurora.org,
 smasetty@codeaurora.org, airlied@redhat.com, masneyb@onstation.org,
 kalyan_t@codeaurora.org, tanmay@codeaurora.org, tiny.windzz@gmail.com,
 ddavenport@chromium.org, jsanka@codeaurora.org, rnayak@codeaurora.org,
 tongtiangen@huawei.com, miaoqinglang@huawei.com, khsieh@codeaurora.org,
 abhinavk@codeaurora.org, chandanu@codeaurora.org, groeck@chromium.org,
 varar@codeaurora.org, mka@chromium.org, harigovi@codeaurora.org,
 rikard.falkeborn@gmail.com, natechancellor@gmail.com,
 georgi.djakov@linaro.org, akashast@codeaurora.org, parashar@codeaurora.org,
 dianders@chromium.org
Subject: [PATCH 01/31] opp: Add devres wrapper for dev_pm_opp_set_clkname and
 dev_pm_opp_put_clkname
Date: Fri,  1 Jan 2021 16:54:37 +0000
Message-Id: <20210101165507.19486-2-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210101165507.19486-1-tiny.windzz@gmail.com>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add devres wrapper for dev_pm_opp_set_clkname() and
dev_pm_opp_put_clkname() to simplify driver code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/opp/core.c     | 47 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_opp.h |  9 ++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 4268eb359915..53fdf33732d5 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1948,6 +1948,53 @@ void dev_pm_opp_put_clkname(struct opp_table *opp_table)
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
+/**
+ * devm_pm_opp_put_clkname() - Releases resources blocked for clk.
+ * @dev: Device for which we do this operation.
+ * @opp_table: OPP table returned from devm_pm_opp_set_clkname().
+ */
+void devm_pm_opp_put_clkname(struct device *dev, struct opp_table *opp_table)
+{
+	devm_release_action(dev, devm_pm_opp_clkname_release, opp_table);
+}
+EXPORT_SYMBOL_GPL(devm_pm_opp_put_clkname);
+
 /**
  * dev_pm_opp_register_set_opp_helper() - Register custom set OPP helper
  * @dev: Device for which the helper is getting registered.
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 1435c054016a..3418a2874f88 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -145,6 +145,8 @@ struct opp_table *dev_pm_opp_set_regulators(struct device *dev, const char * con
 void dev_pm_opp_put_regulators(struct opp_table *opp_table);
 struct opp_table *dev_pm_opp_set_clkname(struct device *dev, const char * name);
 void dev_pm_opp_put_clkname(struct opp_table *opp_table);
+struct opp_table *devm_pm_opp_set_clkname(struct device *dev, const char *name);
+void devm_pm_opp_put_clkname(struct device *dev, struct opp_table *opp_table);
 struct opp_table *dev_pm_opp_register_set_opp_helper(struct device *dev, int (*set_opp)(struct dev_pm_set_opp_data *data));
 void dev_pm_opp_unregister_set_opp_helper(struct opp_table *opp_table);
 struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs);
@@ -326,6 +328,13 @@ static inline struct opp_table *dev_pm_opp_set_clkname(struct device *dev, const
 
 static inline void dev_pm_opp_put_clkname(struct opp_table *opp_table) {}
 
+static inline struct opp_table *devm_pm_opp_set_clkname(struct device *dev, const char *name)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
+static inline void devm_pm_opp_put_clkname(struct device *dev, struct opp_table *opp_table) {}
+
 static inline struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs)
 {
 	return ERR_PTR(-ENOTSUPP);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

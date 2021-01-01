Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA252E91D3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45584898AF;
	Mon,  4 Jan 2021 08:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E555789B95;
 Fri,  1 Jan 2021 16:56:16 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id e2so14740228pgi.5;
 Fri, 01 Jan 2021 08:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3tAUeVcIKsbnNHgonKad43l224e/4lHHdw2qIBrPq38=;
 b=FfK3KI96FFLjhzCZlFkiXR4NyaB4Q3hZrnhhwZxakVzjd9BwzCGaRpPqZv6oNDgVez
 AzpTXNaYLpi1zc7Og4G3mKtUvpsBvnJSnmXLLDblxCrHjGhhkfHk8QqHMs6YCE4OQDvs
 kkd5jxI1ZPv6vYGHG1nu8JkgsFUHoR8FDLozuAa4ilv6gRd3wyg/ZiiSN07zcOdli84A
 v1wCExU4grKxuY2R1Y0iHskae3irQznyKqa86crMVzDabGs8V/5ykCd0gLlCe2VGOMdz
 OYRkcTkAkhElq4zu0DQdfN9V+NrBDVg1vetM6iVLyM55o6oeUAkOXL7M4ruuyLg6nDWq
 NRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3tAUeVcIKsbnNHgonKad43l224e/4lHHdw2qIBrPq38=;
 b=tmWIYOkf24dRBPrGOnxzaFXprzkwNDs0ZqMmT+3bSTON72dCnKPzN+34RWaISaUUTO
 meK2R6P960TLDs3/FP/9h2LPTHD+q633CCpjVoQ+322JSudV3jUBjzDRFtk70zZyk8+o
 I+4mFt3PnRI7uy8VjfrCUDbgZLEGLDSlA+VdWaKhF0H9caX41w7nRrC/imixOiAJ0v61
 g2O/40hHy8bGnkSNi7b0nDooJtSkC3c1q+IhDB8QNQsuFpmlC458F/ei3hW9+R8Y5dTq
 OcIYxNXCTj3rHOI8jpgHUSXCBcosGsiocefMaUAT/BrxPBnKim7gfS6tjFo32ueWTMRf
 +YPQ==
X-Gm-Message-State: AOAM533FJH5lRczTa2E4tUpduVE6QoID5x8BRlNkAtcZ2nqaS4QNUi0g
 kWOjH79x6zrVufaeHpZJ5d8=
X-Google-Smtp-Source: ABdhPJzfaJQaJwc5acHIqB/Y6TtZUJCofjXaLupMrsM/ldtJkO+4jA7SGw1u8nZFUn4jpc80sgpgbA==
X-Received: by 2002:aa7:954c:0:b029:1a6:2130:db4f with SMTP id
 w12-20020aa7954c0000b02901a62130db4fmr56000791pfq.68.1609520176448; 
 Fri, 01 Jan 2021 08:56:16 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.08.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 08:56:15 -0800 (PST)
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
Subject: [PATCH 03/31] opp: Add devres wrapper for dev_pm_opp_set_supported_hw
Date: Fri,  1 Jan 2021 16:54:39 +0000
Message-Id: <20210101165507.19486-4-tiny.windzz@gmail.com>
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

Add devres wrapper for dev_pm_opp_set_supported_hw() to simplify driver
code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/opp/core.c     | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/pm_opp.h |  8 ++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 8709689a7152..6b83e373f0d8 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1674,6 +1674,44 @@ void dev_pm_opp_put_supported_hw(struct opp_table *opp_table)
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
+ * This is required only for the V2 bindings, and it enables a platform to
+ * specify the hierarchy of versions it supports. OPP layer will then enable
+ * OPPs, which are available for those versions, based on its 'opp-supported-hw'
+ * property.
+ *
+ * The opp_table structure will be freed after the device is destroyed.
+ */
+struct opp_table *devm_pm_opp_set_supported_hw(struct device *dev,
+					       const u32 *versions,
+					       unsigned int count)
+{
+	struct opp_table *opp_table;
+	int err;
+
+	opp_table = dev_pm_opp_set_supported_hw(dev, versions, count);
+	if (IS_ERR(opp_table))
+		return opp_table;
+
+	err = devm_add_action_or_reset(dev, devm_pm_opp_supported_hw_release,
+				       opp_table);
+	if (err)
+		opp_table = ERR_PTR(err);
+
+	return opp_table;
+}
+EXPORT_SYMBOL_GPL(devm_pm_opp_set_supported_hw);
+
 /**
  * dev_pm_opp_set_prop_name() - Set prop-extn name
  * @dev: Device for which the prop-name has to be set.
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 8a329247e08e..e5260fc82ba1 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -139,6 +139,7 @@ int dev_pm_opp_unregister_notifier(struct device *dev, struct notifier_block *nb
 
 struct opp_table *dev_pm_opp_set_supported_hw(struct device *dev, const u32 *versions, unsigned int count);
 void dev_pm_opp_put_supported_hw(struct opp_table *opp_table);
+struct opp_table *devm_pm_opp_set_supported_hw(struct device *dev, const u32 *versions, unsigned int count);
 struct opp_table *dev_pm_opp_set_prop_name(struct device *dev, const char *name);
 void dev_pm_opp_put_prop_name(struct opp_table *opp_table);
 struct opp_table *dev_pm_opp_set_regulators(struct device *dev, const char * const names[], unsigned int count);
@@ -301,6 +302,13 @@ static inline struct opp_table *dev_pm_opp_set_supported_hw(struct device *dev,
 
 static inline void dev_pm_opp_put_supported_hw(struct opp_table *opp_table) {}
 
+static inline struct opp_table *devm_pm_opp_set_supported_hw(struct device *dev,
+							    const u32 *versions,
+							    unsigned int count)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
 static inline struct opp_table *dev_pm_opp_register_set_opp_helper(struct device *dev,
 			int (*set_opp)(struct dev_pm_set_opp_data *data))
 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

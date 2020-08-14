Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCA7245D12
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054416E455;
	Mon, 17 Aug 2020 07:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4066EABF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:05 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t6so8081593ljk.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S8WUsWu+WDkJcn4CeG8tWfLig6GMVsRbCZOtSjwc5GA=;
 b=ReKpF9Nh4A3O2mffo48Cg8bRKlALwqgZzoJI2At2j2+5lQLElla390fe/XZrKLdYU+
 wQj8DlEEdYBcZzQn+T49smT/PhDHeTgjpMpS1MaERuF1gYFhd0lLcNskFacKhV4VVwFp
 a75irKF9g1zK8taydsdmGxosWKWUqdCvVYYYG4nWFH+fbXUqcMtfVeH/vYCk6bL0BL1b
 Nf7Ovi6hPoON3hmGi9Itsz3H31az/AuGqSgIJ8xcf68k3CTOOr/e/g24RN8Fsl9dG7qK
 5v0MCRKjYTFgNM2Ty5rQGxkxKfYoQgXycbZAA/JwKQeRIep2Lgs2krSJJbZVcKX6sbuz
 NIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S8WUsWu+WDkJcn4CeG8tWfLig6GMVsRbCZOtSjwc5GA=;
 b=oeAF0vvu00XabaNabi1VzmQW4BBnEQ+NmQTuFIO9F4DyMvFwi8VPaKvdEt4m3/wsX3
 HCEyOSGOfqKG60toE3YlZ0pefVWdomdfMIRlT/q+y94+bYnCcFwb125U2Dac6hd4LV6r
 kWMbtknJG46XkC5edhBu8UOEZBO5fC/7a+B2HpNCKocJRjvpWQyCPIydWZ5a4EBNmZ94
 Zl5yZf09pRwmzLZYq27EqOXRH/Zo5V7Rw0fKSe0V2+2+veXwbtS+TGvnNXp58Yf4WxHH
 kPtMhpPX/LDs8xJC80aRUcOdLC22xo5Sj6lH+ywSuoCXyuiB6z/ZQWUi1e4XdzxCI2Tt
 9PHQ==
X-Gm-Message-State: AOAM533cEda+Qc4F4O/MUm2l5wsBF5Z4dzBByNXKz6aDfknNxJvveVWN
 ZYpxtixqNULoV0kacw95EOg=
X-Google-Smtp-Source: ABdhPJyGDXB6vp3xne6wt6r4gyLq9ymwRWqza2AIFAfNX3uUqYlDJIshUgPgyxS5zOcVTprilhAViw==
X-Received: by 2002:a2e:8197:: with SMTP id e23mr115493ljg.406.1597363624295; 
 Thu, 13 Aug 2020 17:07:04 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:03 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v5 03/36] clk: tegra: Export Tegra20 EMC kernel symbols
Date: Fri, 14 Aug 2020 03:05:48 +0300
Message-Id: <20200814000621.8415-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're going to modularize Tegra EMC drivers and some of the EMC clk driver
symbols need to be exported, let's export them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra20-emc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra20-emc.c b/drivers/clk/tegra/clk-tegra20-emc.c
index 03bf0009a33c..dd74b8543bf1 100644
--- a/drivers/clk/tegra/clk-tegra20-emc.c
+++ b/drivers/clk/tegra/clk-tegra20-emc.c
@@ -13,6 +13,7 @@
 #include <linux/clk-provider.h>
 #include <linux/clk/tegra.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
@@ -235,6 +236,7 @@ void tegra20_clk_set_emc_round_callback(tegra20_clk_emc_round_cb *round_cb,
 		emc->cb_arg = cb_arg;
 	}
 }
+EXPORT_SYMBOL_GPL(tegra20_clk_set_emc_round_callback);
 
 bool tegra20_clk_emc_driver_available(struct clk_hw *emc_hw)
 {
@@ -291,3 +293,4 @@ int tegra20_clk_prepare_emc_mc_same_freq(struct clk *emc_clk, bool same)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(tegra20_clk_prepare_emc_mc_same_freq);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

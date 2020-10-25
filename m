Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A792987D5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED726E881;
	Mon, 26 Oct 2020 08:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E6C6E0CA
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:17:52 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id a9so9412238lfc.7
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XxBDmQPM1u3TxsC8gvQqVBRZUJtQqbbcwOXSeprhG3U=;
 b=pMuTcykNw3g9kYCpJ7OFz9qPr2VLTMUmlxgpJ1q6B+Ai4QzKza1brA2TxVsV3t3ywn
 pFOq5EcA6p+7ktWe1yLarZtj1dGRBOs8oDIb3eVD2CSYzbNW9L+wTMHRsdSsyLegSssp
 K9p79pyZq/dqu4DyqjRrAxb5jVL0tgxfyLk7e+WYTd0dSDoTsRwUh2oTZ3eGf0LYo/Em
 6GrUQGdIRxCi/ttEGpZ64bJY7pyoH8fMMdAe5yjsQu2o3QFuOG/KPBELiXgArLxCvTDY
 srhAzu5vxqZVzmfYRiZVnoQ7x14Oh4r7rPKsm34Oopf+J5G1qHuNvvopB77xWfcr3vzs
 Vcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XxBDmQPM1u3TxsC8gvQqVBRZUJtQqbbcwOXSeprhG3U=;
 b=MILuIea/p5hDRGs65+Ginp1ei+2YmyUJcPtRiPkLmoU28CFGMtQWCbKzRT7hLbboeC
 EymBApOxKtEFBWfeU4qSRggV26gkzQmdykMA/mXesMmlkI+XSYqz+hPYPl87emEZrbrb
 XHpdBhljYbH3gkA4kmwdYtZkkyrOsUIqsL/ZqKBwhGuorpkByRITlxno4th8tvljr7zE
 U8Kl2vcjR1fZc+DSggny0BbRkfU/ioCdSAmGIBk3iGQ6wQVfuSkXrWazocu1pgtR/4W/
 nq56xl6cZqX3b0WZU6z7MNBtvYFi8nW0QT5WOGQ7w6+IWtMCfxwSNnw8PqcaSlHB42Ot
 E1Og==
X-Gm-Message-State: AOAM531SeRrmDXVwG+swKf7N5Gx9NfiIHmno9OGcxCZWKVp0efLlsrFD
 UNypTedNbbwYJ2LyGSG1Xhk=
X-Google-Smtp-Source: ABdhPJzneogPL95UN/cBtkWY5gKTrzlU3UHPgIt2MzqCBff5HU8piBWYDzFE7VGhxY92HYijisvZNQ==
X-Received: by 2002:a05:6512:3455:: with SMTP id
 j21mr4440799lfr.135.1603664271160; 
 Sun, 25 Oct 2020 15:17:51 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:17:50 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 02/52] soc/tegra: fuse: Export tegra_read_ram_code()
Date: Mon, 26 Oct 2020 01:16:45 +0300
Message-Id: <20201025221735.3062-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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

The tegra_read_ram_code() is used by EMC drivers and we're going to make
these driver modular, hence this function needs to be exported.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index cee207d10024..590c862538d0 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2014, NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -90,6 +91,7 @@ u32 tegra_read_ram_code(void)
 
 	return straps >> PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT;
 }
+EXPORT_SYMBOL_GPL(tegra_read_ram_code);
 
 static const struct of_device_id apbmisc_match[] __initconst = {
 	{ .compatible = "nvidia,tegra20-apbmisc", },
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B37A2DDFA3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE5C89A83;
	Fri, 18 Dec 2020 08:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EE56E1CF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:39 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id m25so59779708lfc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vhvv1h1Ziyi3xIAcsdjZjVcJ6AYQzdZqyFUMLjoR+gU=;
 b=mCQHS9XkKqyMibnw8kWGhj0y5I5wUfHzs6EhcQAYTQrcxVGcZQ4sqpiS8Cn8Tx/Vgc
 K8vwNkiSYNNJLkRBebbt09t3sVsBqdUNSNtsPjqMLKXOGXGV4dlGjyEDXXYRM2cC+SVU
 bE7Bn38TobzyFp1dohD8XSvG7rfjlxqF8Sm5uiY7d0VEfNNCo7wJa0PKHjj81i2bPo2J
 WJzx7XbQlxIrFuM2MUM/VGJ6PIZV7KS/8a4B0rV1qmtskhY18YraI8ioH6itChj/t1k5
 +kj1PiLcFY2+E3YsGxSymTnxRSL+MsXiAZJ6U7ldnz2pCqgj8mOKqfeXFPi+Xs7hEWeL
 jjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vhvv1h1Ziyi3xIAcsdjZjVcJ6AYQzdZqyFUMLjoR+gU=;
 b=IEnQmKMV6qgn5fgceQ6XdVjnPeFmKMv8/O/LayDiP1UlFrgKxfvgmVHrb4Eirq/gmw
 f++kkUYQg/YCbVCDIob3MbMrsz0cH1qyCpgI4mpLOUCfj4aclcHlkHzbF8NhQYGHUC55
 FlEcg89wOy6IUBe3Y+ol26H1IK/t06i+xRRBL8hbiBTUSKgEh+kGLTZ5z9gidMJdapUx
 +CsO5aBt6/YGJYSIG4ChCw9m/wj+TVuKtU672MBjx+xH1UvKdWXNycMhr9CgHxYPj6Ld
 DwJXhdUDU0CARh0WcNe/blndavmZHMPrLtAtjEHbDGeb6l1tLk/tEg0IE3NeEoOZPR8D
 IKqw==
X-Gm-Message-State: AOAM532wL3cRCv5Y3cZtdjyh3B1KrJojzNKPvRmwr71ksMglDv+ev1bt
 h0M3LluDroGTerq+c8a5rXN1Jb9rpqU=
X-Google-Smtp-Source: ABdhPJwSqAw1lTij00AzVyWzgJA9yaLaIRHjYRL5G+gORDC0ff9W8dsUk7apucQlnXvHedXq3oMDVQ==
X-Received: by 2002:a2e:8512:: with SMTP id j18mr212691lji.31.1608228458488;
 Thu, 17 Dec 2020 10:07:38 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:38 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 16/48] opp: Handle missing OPP table in
 dev_pm_opp_xlate_performance_state()
Date: Thu, 17 Dec 2020 21:06:06 +0300
Message-Id: <20201217180638.22748-17-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NVIDIA Tegra SoCs have a power domains topology such that child domains
only clamp a power rail, while parent domain controls shared performance
state of the multiple child domains. In this case child's domain doesn't
need to have OPP table. Hence we want to allow children power domains to
pass performance state to the parent domain if child's domain doesn't have
OPP table.

The dev_pm_opp_xlate_performance_state() gets src_table=NULL if a child
power domain doesn't have OPP table and in this case we should pass the
performance state to the parent domain.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 625dae7a5ecb..34f7e530d941 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2255,7 +2255,7 @@ int dev_pm_opp_xlate_performance_state(struct opp_table *src_table,
 	 * and so none of them have the "required-opps" property set. Return the
 	 * pstate of the src_table as it is in such cases.
 	 */
-	if (!src_table->required_opp_count)
+	if (!src_table || !src_table->required_opp_count)
 		return pstate;
 
 	for (i = 0; i < src_table->required_opp_count; i++) {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

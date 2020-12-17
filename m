Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C305C2DDFA5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2E089A86;
	Fri, 18 Dec 2020 08:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB3A6E203
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:42 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h205so16301454lfd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FMQPVkzhrHffuF4mwShq8rfapz+oLLOiBA35EvDkN1g=;
 b=T6C/xdTyr28sjOcJqBGBh+2bCLRgFaTIcBewPv/x+1L1QOyKReuP1MfG2tkzSw/dwF
 83LYY12BDsUDtf5UsTlPOdvdoSknRLL4Ub7pCG7DrdRyrNQWwS4h2r1LZTkODsd2kCpm
 u/tYnt96D3DAW0wWnLMhHeI2ukJZsL5LRAR7Z0BKq5dc256IqLpTzp3LPwjXw+Ia/TAQ
 LRe2WyKapRKlf2YaXsf6Z3H30F5rC5i6iHfKfaF7tBIKlrsio1o5JMMvvWxaNqwdeWSd
 tDMz+vhqPBWL72wWDyYqY3O2tJDobLVBzsYu5+PxlLFQWd3q52ONqjCl1uZ2LI6KEKTH
 ixzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FMQPVkzhrHffuF4mwShq8rfapz+oLLOiBA35EvDkN1g=;
 b=jsFhsYN4BvPm2+re8JpVCj6DPcZhVwtgZacKix2CkrjD7ZC80NPf/51nH+7ZjpadT6
 UhZNHE3/2j0fQ7VVPQuOIushqqA2kg9owRSX68J5PrAmUxGY0qkEcBDkOgCuvgf/LQzs
 8nHfLDbIjNH36fw1ouFIsGy+jtvGyrOg5WCHa/NjdntpevMKEo2LuvU2d/1LtJoYlb0v
 51EU1Nm4JXst5poLfNeuZjeTd5o31l9jawd4W6pvNvB3FJlSpszKSIfzUijlkMrxOkIf
 Tj4G2Ud80BHcMpQr7sNaK5BJABVnkwgLSa29rkmPUBAvFX1VRQS8W4wAhCqWjzMg9YK8
 0Stw==
X-Gm-Message-State: AOAM532rzF3pIESvvzkXN2npfEYJMdoWXIzfRozoJtc66eQLSMsHLdOz
 Nm62kAW3kHZqAYfCegKuNgujnW7obyU=
X-Google-Smtp-Source: ABdhPJyWgcRAhgB2jbviKjj3cRVPK5uBYXP0sKAFflQv0Ic12rG9QDo0/dmYvrRqWl5AtvkglHHK6w==
X-Received: by 2002:a2e:58f:: with SMTP id 137mr196424ljf.469.1608228459627;
 Thu, 17 Dec 2020 10:07:39 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:39 -0800 (PST)
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
Subject: [PATCH v2 17/48] opp: Correct debug message in _opp_add_static_v2()
Date: Thu, 17 Dec 2020 21:06:07 +0300
Message-Id: <20201217180638.22748-18-digetx@gmail.com>
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

The debug message always prints rate=0 instead of a proper value, fix it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/of.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 3b5a4c8bc62f..1f2038a4420b 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -755,7 +755,6 @@ static struct dev_pm_opp *_opp_add_static_v2(struct opp_table *opp_table,
 		struct device *dev, struct device_node *np)
 {
 	struct dev_pm_opp *new_opp;
-	u64 rate = 0;
 	u32 val;
 	int ret;
 	bool rate_not_available = false;
@@ -772,7 +771,8 @@ static struct dev_pm_opp *_opp_add_static_v2(struct opp_table *opp_table,
 
 	/* Check if the OPP supports hardware's hierarchy of versions or not */
 	if (!_opp_is_supported(dev, opp_table, np)) {
-		dev_dbg(dev, "OPP not supported by hardware: %llu\n", rate);
+		dev_dbg(dev, "OPP not supported by hardware: %lu\n",
+			new_opp->rate);
 		goto free_opp;
 	}
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

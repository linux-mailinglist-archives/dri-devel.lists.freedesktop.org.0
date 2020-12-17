Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5AA2DDFED
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E386E064;
	Fri, 18 Dec 2020 08:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28056E1AA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:37 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id 23so59802548lfg.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyhIAorEBtf9lvlliXp3a/E9KosdNviFUVTLwzCMWu4=;
 b=KBFsuU+VjlIdBBBqzZxU8fjyUNxV2GYS1K8Z7YQLuOAUMr50erguvS8eg5lipX2IzF
 wUJXnioL5pZGD/Km96I24RKaP0oAWM4mVWYg5Lwi1t+/D5N5Jk9k/aWAJCSWNgl+6Ag9
 Ul+TTXmwIB4/L6tLNavF1vvHuiaDPvO1IYmGAGIQ6IjffbXmmXs+G+t+xYVRe1XCiLUT
 TTtBHS6GvMaXs7btcbzdBpOt1vRgkH9ELTMrtOzYa5YunqIgyj0rI6fTA1UyrDJBGKzG
 NsTRPdNroHWqtup4JrKq4hCihZ/I8rG1hzY9GLcahCmccGNQRN37v+O1tg2GPp/B1ZlZ
 I1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyhIAorEBtf9lvlliXp3a/E9KosdNviFUVTLwzCMWu4=;
 b=bw8DqPdK7DeFgL7Ml0/wWz09Om/Wy7ucHEKvbgjCrzqlS4OZoW+ari3HhfcacG78+V
 QVDvgF/0FG/fiakVKJd7ZBZSbPLfmjnj9ljnCXKsbSC0UtUeXQ96Wyu9vYiFVqXostZJ
 XhMiSMvxZ/J3pqunQ/7n9jLhSPHYWWwLG0nThpfDEEDfiJPHSNfhOQ2yHAYslK1ftT4P
 5xmPy2DfJVq0patFvrQfxE8QwJNDZTDWURKMVlA+bM4CRWJKaD08HlI4+M3n+DLDRN/a
 vQnIq3l86OXn8Y/tdDBbgR5yrs3AsWMJnNDXvMT7kgWMggl3zezCIkQ+JiYtXZTb8HQ4
 s8+g==
X-Gm-Message-State: AOAM532AyFvRIMrMoSkDHdLbuQ2JMG3BzWAZb7LdWVVmKAN/BSgCgAp1
 tsPt1MmkwR8EnFkNiVjPC8I=
X-Google-Smtp-Source: ABdhPJyLU/4FC56tDazvyGbryuQ04uANev9KjoowVlnl0s+BVYhQ5t9V+9Mz7a+xus7YmajAeqhwKw==
X-Received: by 2002:ac2:54b9:: with SMTP id w25mr1838lfk.8.1608228456153;
 Thu, 17 Dec 2020 10:07:36 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:35 -0800 (PST)
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
Subject: [PATCH v2 14/48] opp: Filter out OPPs based on availability of a
 required-OPP
Date: Thu, 17 Dec 2020 21:06:04 +0300
Message-Id: <20201217180638.22748-15-digetx@gmail.com>
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

A required OPP may not be available, and thus, all OPPs which are using
this required OPP should be unavailable too.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index d9feb7639598..3d02fe33630b 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1588,7 +1588,7 @@ int _opp_add(struct device *dev, struct dev_pm_opp *new_opp,
 	     struct opp_table *opp_table, bool rate_not_available)
 {
 	struct list_head *head;
-	int ret;
+	int i, ret;
 
 	mutex_lock(&opp_table->lock);
 	head = &opp_table->opp_list;
@@ -1615,6 +1615,15 @@ int _opp_add(struct device *dev, struct dev_pm_opp *new_opp,
 			 __func__, new_opp->rate);
 	}
 
+	for (i = 0; i < opp_table->required_opp_count && new_opp->available; i++) {
+		if (new_opp->required_opps[i]->available)
+			continue;
+
+		new_opp->available = false;
+		dev_warn(dev, "%s: OPP not supported by required OPP %pOF (%lu)\n",
+			 __func__, new_opp->required_opps[i]->np, new_opp->rate);
+	}
+
 	return 0;
 }
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

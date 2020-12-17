Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7018C2DDF8B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3CB89812;
	Fri, 18 Dec 2020 08:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F2A6E1D3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:35 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id y19so59727802lfa.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vPD7hQ8b5N25hcZTdVSAqhZrBeZE9ONbNkTdFW8v87g=;
 b=ChchZyVri0yi/O25dvPeSHNQEk3sLXfZVskKc7CN57GBdMMTmWURalf2IM6i2rgvhh
 qfcMtU+PS/OCGaJjeaVHDM2wBUNa8Tg9f7+ONq/dSM6byM/Y8iogLVMrfOj4dNFwy2Xm
 Ps6rz8w/7z9Mz8vRMGfOZ86sU3M3S0FpRWA4hoISaf7GtzBRBYpB/pOJM78wLmrasMEr
 /gb3uNc548kJHGE9V2DfBbDDkAnqUyLpzfbxhrKpEumO23OdI8D7by5pViVe1cJ16DXd
 4yhnxob5KSGfDuhxWiH1oLSuAV4B7pIQHOcN3N/ZWY1erLsW1JFmbo1HRGSDSIF6T5LI
 wT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vPD7hQ8b5N25hcZTdVSAqhZrBeZE9ONbNkTdFW8v87g=;
 b=i94ww2Y3XQvb54tzS6353ohi5mBX9dzKBg4RJTJzk6d3mmB8aQ+srERzHmTDhn79h4
 ystjX1Tqm++LzCFpT+D/CfekX4oRwEuW9sb4tRYy1+cpm5QKoKaVZKAW+6fG8f9CHB78
 FcMRsMS882YqP2eDmif2jIHqU+Z9TfXhyWIhNdyB5N6phJwGEE26svAX1Hj7kIL7simt
 qzzaNK+vlNpl0KWo97A5xtpHewpZd4oMz1Hq2hAmX5QO+BhBc2MlgCsKrE6ZdtS3tKMN
 FZADe4tXgb6ZP16mthQ87Fi4GNnSDa3zrY6eFrgOlT9Plf8rgzudnjJ8RbCAyv6Xhz3H
 fj6w==
X-Gm-Message-State: AOAM533rxHOhbjM9QeeK/a2KiziYxFHtJ5ejT25PzSFDFsRmdVrGfJlr
 OHDwqyRZ769Bf2t6xjHcGt8=
X-Google-Smtp-Source: ABdhPJzFSNM0TMMoSxcYKoyhk7r0wzOQ4M8gA685Cb16wgK+4tnur3IzXUR06VdXp1ulyFqi9mnu/A==
X-Received: by 2002:a2e:a404:: with SMTP id p4mr220062ljn.260.1608228453811;
 Thu, 17 Dec 2020 10:07:33 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:33 -0800 (PST)
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
Subject: [PATCH v2 12/48] opp: Add dev_pm_opp_get_required_pstate()
Date: Thu, 17 Dec 2020 21:06:02 +0300
Message-Id: <20201217180638.22748-13-digetx@gmail.com>
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

Add dev_pm_opp_get_required_pstate() which allows OPP users to retrieve
required performance state of a given OPP.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 22 ++++++++++++++++++++++
 include/linux/pm_opp.h | 10 ++++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 0783a4ac819a..4774701ec82d 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -145,6 +145,28 @@ unsigned int dev_pm_opp_get_level(struct dev_pm_opp *opp)
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_get_level);
 
+/**
+ * dev_pm_opp_get_required_pstate() - Gets the required performance state
+ *                                    corresponding to an available opp
+ * @opp:	opp for which performance state has to be returned for
+ * @index:	index of the required opp
+ *
+ * Return: performance state read from device tree corresponding to the
+ * required opp, else return 0.
+ */
+unsigned int dev_pm_opp_get_required_pstate(struct dev_pm_opp *opp,
+					    unsigned int index)
+{
+	if (IS_ERR_OR_NULL(opp) || !opp->available ||
+	    index >= opp->opp_table->required_opp_count) {
+		pr_err("%s: Invalid parameters\n", __func__);
+		return 0;
+	}
+
+	return opp->required_opps[index]->pstate;
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_get_required_pstate);
+
 /**
  * dev_pm_opp_is_turbo() - Returns if opp is turbo OPP or not
  * @opp: opp for which turbo mode is being verified
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index a17d92d923cc..0298b426fba3 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -98,6 +98,9 @@ unsigned long dev_pm_opp_get_freq(struct dev_pm_opp *opp);
 
 unsigned int dev_pm_opp_get_level(struct dev_pm_opp *opp);
 
+unsigned int dev_pm_opp_get_required_pstate(struct dev_pm_opp *opp,
+					    unsigned int index);
+
 bool dev_pm_opp_is_turbo(struct dev_pm_opp *opp);
 
 int dev_pm_opp_get_opp_count(struct device *dev);
@@ -188,6 +191,13 @@ static inline unsigned int dev_pm_opp_get_level(struct dev_pm_opp *opp)
 	return 0;
 }
 
+static inline
+unsigned int dev_pm_opp_get_required_pstate(struct dev_pm_opp *opp,
+					    unsigned int index)
+{
+	return 0;
+}
+
 static inline bool dev_pm_opp_is_turbo(struct dev_pm_opp *opp)
 {
 	return false;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA52843A72B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB1E6E30F;
	Mon, 25 Oct 2021 22:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCCE6E2DF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:46:03 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bp15so15177115lfb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vtFEh3DLOYLlHvOQTkSDJCzq6CQ57SdIMJKKnFVuN48=;
 b=OooE5Eeapdyj8IGR51B47FnYiOIaeLVA5B6lqBHK1NQdk2xAjkeyvZryOJAdaL5m/W
 O6Gb2UFv65vJSBuOTgyNX9uFTlQZarcezGZsaiKOEqRh2hEqq1opuMJJ9OjlFj70oW2m
 BZqZ2rTwR3RZlfxjFGZTcShNcLPJFoo3kzVLFR02R3jg6HXsZAA7eEiRN2H6dLUXCC6M
 Cj29fJ9tPwd5KG0qcwHAyKhGxXG7kLxBePa2pmAZnCqvcPXsYZf/HSPBwZUm3Urp1TNT
 VgCJXtbBewFNob6oxZ7CSl2v4ku8zgdCw2IqiJr9xl583V9Cq8TCSgMsS5cSkgQhxwgC
 G5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vtFEh3DLOYLlHvOQTkSDJCzq6CQ57SdIMJKKnFVuN48=;
 b=YKCSV8rH0bSpBccqDOqu3qKOJYIfuFaRKDTCATe3PWqtdkBstL1PbqWU9oM6CrtqB7
 pVPALxZHn0ZtxWrHeVU2xJAXyiuAAKaZyeBL8DMxhezFt7FRX6g/515ltrEqGh4wuNC/
 gfD158KMH5wQBbt1GalovPHKF5KxO2Q4MldGS1seormK/zhjETzVzxJPYKYU0+tNakxb
 UI7QoMgGUo78kl7Xjqz0i51Cvd0Ud3OLDSABZPtI0usEe6K8cHb64dE5a56zAyOfXPMU
 txS/Q+WtYKyJcFnvvUaXPDUsx97hOmhcfAfOuNm4Jw22whyl3FAhGEtM5iJNDD0z/8YX
 Ktpw==
X-Gm-Message-State: AOAM5338aMfrnxa8V9ssuCjoIa6uI7Hew3kywnXdKqjm8bWiLFygHga9
 j+pDA3AkYfeZKCJ+ZdHgTOI=
X-Google-Smtp-Source: ABdhPJxscxs5/E+RNVAzaQeYRt19KEG0ltRBScfY7uoXNg58pwqyDc3FpLwIXCvkEIDe7Z0HurnEIQ==
X-Received: by 2002:a19:e00b:: with SMTP id x11mr18671820lfg.87.1635201962032; 
 Mon, 25 Oct 2021 15:46:02 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:46:01 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v14 17/39] drm/tegra: submit: Add missing
 pm_runtime_mark_last_busy()
Date: Tue, 26 Oct 2021 01:40:10 +0300
Message-Id: <20211025224032.21012-18-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224032.21012-1-digetx@gmail.com>
References: <20211025224032.21012-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Runtime PM auto-suspension doesn't work without pm_runtime_mark_last_busy(),
add it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/submit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index 3bbd8de5711c..6d6dd8c35475 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -504,6 +504,7 @@ static void release_job(struct host1x_job *job)
 	kfree(job_data->used_mappings);
 	kfree(job_data);
 
+	pm_runtime_mark_last_busy(client->base.dev);
 	pm_runtime_put_autosuspend(client->base.dev);
 }
 
-- 
2.33.1


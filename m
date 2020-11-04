Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040642A7920
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BD96EA22;
	Thu,  5 Nov 2020 08:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9037A6E86C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:11 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id f9so190140lfq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s2xq+lt/r2Mvqw9qSWZAnUmoqhbrNvrI4eJy0ZnOQ64=;
 b=Fy4CNvg3obv1cUoJtvGJ21pgRv1s2vfQZ+17zG35XkFJhQGYivEOExVUbw2fEdaRGa
 ++APIIMcHAGfK/1E9UJY24YPYHy4O2A9bQts/vv5m93fdQ9Ty43C78419zh7Bf2Vk6r9
 eWJVZOlxAkZ9v7Ov0+UUojl1qFdIk+/oVtB43e+1brDo2GrOzQvvt5/leRClxlavjH+s
 AAp/ILGa8GQVEJSYwfOTryVzVXbkOSIpE9V4g+GcD0T8TD4yXfHl7kDjwklc+guJZO9G
 DEJIhAku8uEOKHuOLL0c0EpROBzWbTmnQkPSAJLtnb3obN2xwV8jKIKLXEQEzpvfiJ70
 cqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s2xq+lt/r2Mvqw9qSWZAnUmoqhbrNvrI4eJy0ZnOQ64=;
 b=dded35C9sEp2MlKu+xcL6HOLN7CdzLBCbswpCYD28zYRSbqg0zZSy+bzTrfX8DYDBu
 tGqqm1Zde0IfoW1S5KQMgvkN4OaMZl8GfAJkealYlD5o2ocZ8HXgITZG2wff482J+VDa
 NYACPh9wZMuZcfU9vNSfRfHGFcjjBaICZkNZHC1DRV+vpZ7vvbY6R8tnwyTbgKgS41OJ
 s4o2huY7Re+haKUGlt7G7fF9x8DJJ+lBa2knPTpO58zGVfwTwBoz0GSCVBDUR2yAqXpN
 LFxZQ03mR60PbY4fSt8xNnA0RKURbdcJ251AbgMICCGLVrE0K2KRwdC/ROGmGCYcUs3B
 C7Ng==
X-Gm-Message-State: AOAM533AiR6grAh7HPbw6NXmnNOIgdsXGTJAGY0Ud1g63vH2anpmdF98
 ALskOrfYO7EDhzh9ejJT8BY=
X-Google-Smtp-Source: ABdhPJwqoSMi1rb7vw1Ft82ab6MuGmnvmcXXmGI4LnfUQssU2WJfQ903eLKfiwjg+DKW6GcnoqGrow==
X-Received: by 2002:a19:6a07:: with SMTP id u7mr52539lfu.220.1604533509991;
 Wed, 04 Nov 2020 15:45:09 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:09 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>, Peter Chen <Peter.Chen@nxp.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH v1 10/30] regulator: Allow skipping disabled regulators in
 regulator_check_consumers()
Date: Thu,  5 Nov 2020 02:44:07 +0300
Message-Id: <20201104234427.26477-11-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104234427.26477-1-digetx@gmail.com>
References: <20201104234427.26477-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: devel@driverdev.osuosl.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add option which allows regulator_check_consumers() to skip accounting of
a disabled consumer regulators.

This new option is needed for the NVIDIA Tegra voltage couplers in order
to properly calculate a lowest possible voltage for the CORE regulator.
The requirements of a disabled consumer regulators should not be accounted
by the Tegra voltage balancers because disabled state means that hardware
is inactive. In particular disabled state shouldn't be accounted for the
consumers which belong to the CORE voltage domain, meanwhile CPU domain
should continue to account the disabled state.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/regulator/core.c                       | 12 ++++++++----
 drivers/soc/samsung/exynos-regulator-coupler.c |  2 +-
 drivers/soc/tegra/regulators-tegra20.c         |  6 +++---
 drivers/soc/tegra/regulators-tegra30.c         |  6 +++---
 include/linux/regulator/coupler.h              |  6 ++++--
 5 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index f258ded39ce0..015dcd8408d9 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -462,7 +462,8 @@ static int regulator_check_states(suspend_state_t state)
  */
 int regulator_check_consumers(struct regulator_dev *rdev,
 			      int *min_uV, int *max_uV,
-			      suspend_state_t state)
+			      suspend_state_t state,
+			      bool skip_disabled_regulators)
 {
 	struct regulator *regulator;
 	struct regulator_voltage *voltage;
@@ -476,6 +477,9 @@ int regulator_check_consumers(struct regulator_dev *rdev,
 		if (!voltage->min_uV && !voltage->max_uV)
 			continue;
 
+		if (skip_disabled_regulators && !regulator->enable_count)
+			continue;
+
 		if (*max_uV > voltage->max_uV)
 			*max_uV = voltage->max_uV;
 		if (*min_uV < voltage->min_uV)
@@ -3662,7 +3666,7 @@ static int regulator_get_optimal_voltage(struct regulator_dev *rdev,
 
 		ret = regulator_check_consumers(rdev,
 						&desired_min_uV,
-						&desired_max_uV, state);
+						&desired_max_uV, state, false);
 		if (ret < 0)
 			return ret;
 
@@ -3681,7 +3685,7 @@ static int regulator_get_optimal_voltage(struct regulator_dev *rdev,
 
 		ret = regulator_check_consumers(c_rdevs[i],
 						&tmp_min,
-						&tmp_max, state);
+						&tmp_max, state, false);
 		if (ret < 0)
 			return ret;
 
@@ -4119,7 +4123,7 @@ int regulator_sync_voltage(struct regulator *regulator)
 	if (ret < 0)
 		goto out;
 
-	ret = regulator_check_consumers(rdev, &min_uV, &max_uV, 0);
+	ret = regulator_check_consumers(rdev, &min_uV, &max_uV, 0, false);
 	if (ret < 0)
 		goto out;
 
diff --git a/drivers/soc/samsung/exynos-regulator-coupler.c b/drivers/soc/samsung/exynos-regulator-coupler.c
index 61a156b44a48..9bd99a93e3e0 100644
--- a/drivers/soc/samsung/exynos-regulator-coupler.c
+++ b/drivers/soc/samsung/exynos-regulator-coupler.c
@@ -41,7 +41,7 @@ static int regulator_get_optimal_voltage(struct regulator_dev *rdev,
 
 		ret = regulator_check_consumers(c_rdevs[i],
 						&tmp_min,
-						&tmp_max, state);
+						&tmp_max, state, false);
 		if (ret < 0)
 			return ret;
 
diff --git a/drivers/soc/tegra/regulators-tegra20.c b/drivers/soc/tegra/regulators-tegra20.c
index 8782e399a58c..8c31acb5fdc6 100644
--- a/drivers/soc/tegra/regulators-tegra20.c
+++ b/drivers/soc/tegra/regulators-tegra20.c
@@ -136,7 +136,7 @@ static int tegra20_core_rtc_update(struct tegra_regulator_coupler *tegra,
 		return err;
 
 	err = regulator_check_consumers(core_rdev, &core_min_uV, &core_max_uV,
-					PM_SUSPEND_ON);
+					PM_SUSPEND_ON, true);
 	if (err)
 		return err;
 
@@ -246,12 +246,12 @@ static int tegra20_cpu_voltage_update(struct tegra_regulator_coupler *tegra,
 		return err;
 
 	err = regulator_check_consumers(cpu_rdev, &cpu_min_uV, &cpu_max_uV,
-					PM_SUSPEND_ON);
+					PM_SUSPEND_ON, false);
 	if (err)
 		return err;
 
 	err = regulator_check_consumers(cpu_rdev, &cpu_min_uV_consumers,
-					&cpu_max_uV, PM_SUSPEND_ON);
+					&cpu_max_uV, PM_SUSPEND_ON, false);
 	if (err)
 		return err;
 
diff --git a/drivers/soc/tegra/regulators-tegra30.c b/drivers/soc/tegra/regulators-tegra30.c
index fcf824f73131..d92aafa736bc 100644
--- a/drivers/soc/tegra/regulators-tegra30.c
+++ b/drivers/soc/tegra/regulators-tegra30.c
@@ -164,7 +164,7 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 		return err;
 
 	err = regulator_check_consumers(core_rdev, &core_min_uV, &core_max_uV,
-					PM_SUSPEND_ON);
+					PM_SUSPEND_ON, true);
 	if (err)
 		return err;
 
@@ -175,12 +175,12 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	cpu_min_uV = core_min_uV - max_spread;
 
 	err = regulator_check_consumers(cpu_rdev, &cpu_min_uV, &cpu_max_uV,
-					PM_SUSPEND_ON);
+					PM_SUSPEND_ON, false);
 	if (err)
 		return err;
 
 	err = regulator_check_consumers(cpu_rdev, &cpu_min_uV_consumers,
-					&cpu_max_uV, PM_SUSPEND_ON);
+					&cpu_max_uV, PM_SUSPEND_ON, false);
 	if (err)
 		return err;
 
diff --git a/include/linux/regulator/coupler.h b/include/linux/regulator/coupler.h
index 5f86824bd117..4e076567b823 100644
--- a/include/linux/regulator/coupler.h
+++ b/include/linux/regulator/coupler.h
@@ -55,7 +55,8 @@ int regulator_coupler_register(struct regulator_coupler *coupler);
 const char *rdev_get_name(struct regulator_dev *rdev);
 int regulator_check_consumers(struct regulator_dev *rdev,
 			      int *min_uV, int *max_uV,
-			      suspend_state_t state);
+			      suspend_state_t state,
+			      bool skip_disabled_regulators);
 int regulator_check_voltage(struct regulator_dev *rdev,
 			    int *min_uV, int *max_uV);
 int regulator_get_voltage_rdev(struct regulator_dev *rdev);
@@ -75,7 +76,8 @@ static inline const char *rdev_get_name(struct regulator_dev *rdev)
 }
 static inline int regulator_check_consumers(struct regulator_dev *rdev,
 					    int *min_uV, int *max_uV,
-					    suspend_state_t state)
+					    suspend_state_t state,
+					    bool skip_disabled_regulators))
 {
 	return -EINVAL;
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

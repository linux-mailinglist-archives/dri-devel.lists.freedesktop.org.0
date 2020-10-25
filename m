Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 390CF2987EE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0C36E9EF;
	Mon, 26 Oct 2020 08:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA546E214
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:44 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id p15so7712602ljj.8
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L79iwZ0bcQ/bYNErMnkgdiSpet8EKxInzRHfHgz6Aeo=;
 b=vC9RCqqWoD5ylqvyoLyxFpJB5u2HDtHdyu+50U7XHzOuSK9/gZXYFL7FYDuL3WnDaH
 WbJxl76boqcFWLlCC1PjES5SGW+5fc1xNIK94gpfvi/rXyGTRhl0/7JYfTiDRe+7nt8E
 emUPbPNdX71A/J8LcRbIH/5c9WQxGlS7yEN0p/q/bJ5or978wHMTHaX8b6msuGA0zijw
 YCViEYBPuCks8n6SmqUGX+cmARPRHVevxDQJUbkkWzCzcfdb1wks2DBj2Z0hKLZJAhgX
 XyDyzNTi1FKWQMesk33U5DcqraGGaIbJR+WsTf9Y623ZOqten1Q4OcnHwnamB/poKsWs
 hVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L79iwZ0bcQ/bYNErMnkgdiSpet8EKxInzRHfHgz6Aeo=;
 b=iUFLhrV76KBa+9R0+foKDjSUa5FHsxmx660m+a+5JwxOzxrmkm/1QTvDlzVB+1V8dq
 Qu+4z+pDQcXTcT1ad8wOX9og/57JMWEue+aDzDiHVJnKl25VE5CfBnVg4AK7rm1v+1mv
 2bKZie+rZJpx37XRAFU/QqPSqDSSbL4M86inulBbfY4FMeqmJGuqQ6lpJgA7+HvnO1xt
 Sn3Ct35Dd9UhRYl4B38eB/AneeMG46FQcbHXQ5+DhzGrgVFVbGxnnacjzUCtlrAkXGda
 +0cHp8QclFYhDrxskfwxFySWy7/r1uSzPKBXvMYSU9iOuwtSie4L80YNsWDvb4ofnK3A
 J0yw==
X-Gm-Message-State: AOAM5322iD5J07qZbbhzWxPvrI3wamhMWc64S5wblHtCXPHyE7c7KOuV
 uqaoXUPucclo4VHWdE82rxs=
X-Google-Smtp-Source: ABdhPJwu8jgCsNIcFJ3FXu51zCJDEosGMUATemWh5TEorgxVddy3uWItefq/iD1WNFrVWVQctfRMfg==
X-Received: by 2002:a2e:910a:: with SMTP id m10mr4817770ljg.385.1603664323005; 
 Sun, 25 Oct 2020 15:18:43 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:42 -0700 (PDT)
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
Subject: [PATCH v6 48/52] PM / devfreq: tegra20: Relax Kconfig dependency
Date: Mon, 26 Oct 2020 01:17:31 +0300
Message-Id: <20201025221735.3062-49-digetx@gmail.com>
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

The Tegra EMC driver now could be compiled as a loadable kernel module.
Currently devfreq driver depends on the EMC/MC drivers in Kconfig, and
thus, devfreq is forced to be a kernel module if EMC is compiled as a
module. This build dependency could be relaxed since devfreq driver
checks MC/EMC presence on probe, allowing kernel configuration where
devfreq is a built-in driver and EMC driver is a loadable module.
This change puts Tegra20 devfreq Kconfig entry on a par with the Tegra30
devfreq entry.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index 37dc40d1fcfb..0ee36ae2fa79 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -123,7 +123,7 @@ config ARM_TEGRA_DEVFREQ
 
 config ARM_TEGRA20_DEVFREQ
 	tristate "NVIDIA Tegra20 DEVFREQ Driver"
-	depends on (TEGRA_MC && TEGRA20_EMC) || COMPILE_TEST
+	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
 	depends on COMMON_CLK
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	help
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2427B245D19
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7068B6E48F;
	Mon, 17 Aug 2020 07:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A2C6EABF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:21 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id i80so3925159lfi.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L79iwZ0bcQ/bYNErMnkgdiSpet8EKxInzRHfHgz6Aeo=;
 b=NiP4ZDbqClOIWz3kunOdbowHssHlDerKEVLkW3GcU/ITVXqORlahFtc4DpJ823T7Af
 0ENPwrfZBrqMpBHcZWNy1lsAJQe9lPJFaxz5X0U0Uw/qvjvdBB38amJO0/lRoh/2T7rc
 bmC9+TscwV6l7JaKxeBOYJz6Tw6EhIEMVnFJ1/BGO26ek3M0YvmA4qgZODGwVVve8AYs
 DAH8/tlNlcfuooDTjoXqhYxv0Bs2SDyXjAFOn8YAr5INCfa3LZ6Ccec+/mIUyvX6OBka
 lsnEFgX1MBorRQwODElFfUhPq1daWwOQQY8cx3cqLEdL4CZCfszxsgSdTtgBiuPskxcz
 lWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L79iwZ0bcQ/bYNErMnkgdiSpet8EKxInzRHfHgz6Aeo=;
 b=F5tun0VBTZyidqwb+jAftAzbvC/xx7lj97ADDRV948TYwqwyvcXIEwqYDzBnHbgQO7
 9aMkhtl8nxoDLejhCIVoxcsMdFPW504m0GVNkY+jp6Q133vz66CWzER69AxmnWKlVSru
 G/017Nds5NERfUKWrwvflEmD0Q7m60jZMnFGydln5v8xtk9ocEyTfdYrDR4hOn0GI10O
 RTdtuorZrW1k480PtpQWephFPi70R2Ur6fis9tjxB/I2KRHQooK+ieM7BuU68qitNAkM
 uXrOCeFqN1gyD0zNd/OXOtslprCzMTXB2DD6EIbsPQQYaIO5zZE5wz9d9/uymFlEjMRO
 cfUQ==
X-Gm-Message-State: AOAM531Jdnmu1SA5OVsDjFfFG+r/vAjIy3kdx3bdvfH2KDxJ+HXtS+p+
 FVdwRGgXHOeWJUdy3gkw/GI=
X-Google-Smtp-Source: ABdhPJw1OxzpVPy0ME8CmE74TISYPXIcWkGALKPr7LrdTvMm/viQPl/RwghQDZFc4M8Wqub9nLtTjg==
X-Received: by 2002:a19:c501:: with SMTP id w1mr3142820lfe.172.1597363640159; 
 Thu, 13 Aug 2020 17:07:20 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:19 -0700 (PDT)
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
Subject: [PATCH v5 17/36] PM / devfreq: tegra20: Relax Kconfig dependency
Date: Fri, 14 Aug 2020 03:06:02 +0300
Message-Id: <20200814000621.8415-18-digetx@gmail.com>
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

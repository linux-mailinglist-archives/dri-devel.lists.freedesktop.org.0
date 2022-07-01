Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 787F8562DAD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 10:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3306110F3D2;
	Fri,  1 Jul 2022 08:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDAE10F3D2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 08:20:44 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id m2so1721354plx.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oUYtq84iNGdg4Xe0/YKALbCpeBgj55K/qcb5czheU50=;
 b=YlwArJ/41k5bqIwMZiuj2szedp3s1rO7QSuQEi13s1O5Ve6bFzu2r9LarZt3O04Y9D
 PVD3yDK+9Vb0f95dKwdM+JysaoQPKDf3zise0iThezxJk79eOmrZ72/c5Rg1gCbtjVDl
 F60N2JHzziONCyalfA/wfFDCSlR8hqnvk92kRRSbAFaKwCckeWcCYXOytSRq+zImeRVe
 lfI7JPrzOCmulRfNW+KQk7bRX6SOCXgDerBmRWMomIAXhT8TLCoNxRQjAHBANqs51hrT
 iXX1rmjYKKRLhXUKxd6B3MFliSf1sdOs2RlkARJG2gMqxLz4mBo8TozUysUa0f+Xm3N4
 gDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oUYtq84iNGdg4Xe0/YKALbCpeBgj55K/qcb5czheU50=;
 b=3uUS7RZ2zun9kINdIysNZQXZpgTeUD2tyRgPaaloITSAk3VcdpXJxq3f2xYmAU6v0m
 J9QiP9IhTEdOxCPvasigCbN9dRn2MYStwE4IHiISWM554hkkK55SBWKCYOUqFF6FCD/T
 8N/pHTShEk8N3nzCcjiarX+kDqkV57ZhqqF+xDarB/H62drK2PvfFACWkz94sKUuvqVz
 fril+aTNYESyGydUSWmgVuVOsSgxI8CE938GFZIbmdpbdcTJ9Ab/B50Ep4nFy8b6BFKQ
 6C9WsjXkNwaK/eT49Icv/ci07Fcm621HOQULLm11dzIo+QNGLDbAjaFZDdQq1heomlFq
 7LIg==
X-Gm-Message-State: AJIora+tBECh7HQvvVJkG9zY6Eb3nxM1KKcn3Zj3+n94y8GJm6vJ+qEI
 DINC7boXZEQOnDs7ekqDjrD1jw==
X-Google-Smtp-Source: AGRyM1uw8CKR4s38IcPhcQa1KogQ13yRLMm2Qxe1pU/dJuysA+BJx5bL0ipnbj/Tos0q5dkbVF00/Q==
X-Received: by 2002:a17:90a:d80b:b0:1ec:9a1a:2266 with SMTP id
 a11-20020a17090ad80b00b001ec9a1a2266mr15418832pjv.7.1656663644453; 
 Fri, 01 Jul 2022 01:20:44 -0700 (PDT)
Received: from localhost ([122.172.201.58]) by smtp.gmail.com with ESMTPSA id
 ru10-20020a17090b2bca00b001e880972840sm3443768pjb.29.2022.07.01.01.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 01:20:43 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dmitry Osipenko <digetx@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ilia Lin <ilia.lin@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Mark Brown <broonie@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Qiang Yu <yuq825@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Paul <sean@poorly.run>,
 Shawn Guo <shawnguo@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Steven Price <steven.price@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH V2 00/30] OPP: Add new configuration interface:
 dev_pm_opp_set_config()
Date: Fri,  1 Jul 2022 13:49:55 +0530
Message-Id: <cover.1656660185.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
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
Cc: linux-samsung-soc@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>, linux-serial@vger.kernel.org,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

We have too many configuration specific APIs currently, six of them already,
like dev_pm_opp_set_regulators(). This makes it complex/messy for both the OPP
core and its users to manage. There is also code redundancy in these APIs, in
the way they add/manage the OPP table specific stuff.

This patch series is an attempt to simplify these interfaces by adding a single
interface, dev_pm_opp_set_config(), which replaces all the existing ones. This
series also migrates the users to the new API.

The first two patches help get the API in place, followed by patches to migrate
the end users. Once all the users are migrated, the last few patches remove the
now unused interfaces.

This is pushed here:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next

This is already tested by various folks now.

The entire patchset shall get merged via the OPP tree in 5.20-rc1, please do not
merge individual patches.

V1->V2:
- dev_pm_opp_set_config() doesn't return the OPP table anymore, but a token
  allocated with xa_alloc(). The same needs to be passed to clear-config API.
- Updated all users according to that as well.
- The clk_names interface is updated to allow multiple clocks.
- Converted few // comments to /* */.
- Added tags by few people.
- Dropped the last patch to rearrange stuff, not required anymore.

Thanks.

--
Viresh

Viresh Kumar (30):
  OPP: Track if clock name is configured by platform
  OPP: Add dev_pm_opp_set_config() and friends
  cpufreq: dt: Migrate to dev_pm_opp_set_config()
  cpufreq: imx: Migrate to dev_pm_opp_set_config()
  cpufreq: qcom-nvmem: Migrate to dev_pm_opp_set_config()
  cpufreq: sti: Migrate to dev_pm_opp_set_config()
  cpufreq: sun50i: Migrate to dev_pm_opp_set_config()
  cpufreq: tegra20: Migrate to dev_pm_opp_set_config()
  cpufreq: ti: Migrate to dev_pm_opp_set_config()
  devfreq: exynos: Migrate to dev_pm_opp_set_config()
  devfreq: sun8i: Migrate to dev_pm_opp_set_config()
  devfreq: tegra30: Migrate to dev_pm_opp_set_config()
  drm/lima: Migrate to dev_pm_opp_set_config()
  drm/msm: Migrate to dev_pm_opp_set_config()
  drm/panfrost: Migrate to dev_pm_opp_set_config()
  drm/tegra: Migrate to dev_pm_opp_set_config()
  media: venus: Migrate to dev_pm_opp_set_config()
  memory: tegra: Migrate to dev_pm_opp_set_config()
  mmc: sdhci-msm: Migrate to dev_pm_opp_set_config()
  OPP: ti: Migrate to dev_pm_opp_set_config()
  soc/tegra: Add comment over devm_pm_opp_set_clkname()
  soc/tegra: Migrate to dev_pm_opp_set_config()
  spi: qcom: Migrate to dev_pm_opp_set_config()
  serial: qcom: Migrate to dev_pm_opp_set_config()
  OPP: Remove dev_pm_opp_set_regulators() and friends
  OPP: Remove dev_pm_opp_set_supported_hw() and friends
  OPP: Remove dev_pm_opp_set_clkname() and friends
  OPP: Remove dev_pm_opp_register_set_opp_helper() and friends
  OPP: Remove dev_pm_opp_attach_genpd() and friends
  OPP: Remove dev_pm_opp_set_prop_name() and friends

 drivers/cpufreq/cpufreq-dt.c                  |  20 +-
 drivers/cpufreq/imx-cpufreq-dt.c              |  18 +-
 drivers/cpufreq/qcom-cpufreq-nvmem.c          | 109 +--
 drivers/cpufreq/sti-cpufreq.c                 |  27 +-
 drivers/cpufreq/sun50i-cpufreq-nvmem.c        |  36 +-
 drivers/cpufreq/tegra20-cpufreq.c             |  18 +-
 drivers/cpufreq/ti-cpufreq.c                  |  38 +-
 drivers/devfreq/exynos-bus.c                  |  25 +-
 drivers/devfreq/sun8i-a33-mbus.c              |   8 +-
 drivers/devfreq/tegra30-devfreq.c             |   8 +-
 drivers/gpu/drm/lima/lima_devfreq.c           |  12 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   8 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   6 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |   6 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |   6 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 +-
 drivers/gpu/drm/tegra/gr3d.c                  |   6 +-
 .../media/platform/qcom/venus/pm_helpers.c    |  18 +-
 drivers/memory/tegra/tegra124-emc.c           |  17 +-
 drivers/mmc/host/sdhci-msm.c                  |   6 +-
 drivers/opp/core.c                            | 632 ++++++++----------
 drivers/opp/opp.h                             |  23 +
 drivers/opp/ti-opp-supply.c                   |   8 +-
 drivers/soc/tegra/common.c                    |  45 +-
 drivers/soc/tegra/pmc.c                       |   8 +-
 drivers/spi/spi-geni-qcom.c                   |   6 +-
 drivers/spi/spi-qcom-qspi.c                   |   6 +-
 drivers/tty/serial/qcom_geni_serial.c         |   6 +-
 include/linux/pm_opp.h                        | 121 +---
 30 files changed, 605 insertions(+), 661 deletions(-)

-- 
2.31.1.272.g89b43f80a514


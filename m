Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F2534E2F
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 13:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B4010F419;
	Thu, 26 May 2022 11:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E7710F3F3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 11:43:24 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id c2so1236373plh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 04:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kq02GySVi94nZ9Mc+L7RCzpSrSe7oKjAYDJQaI+i1/M=;
 b=jozl4ktxfx3kr41Xwo8mDlqT0z+gvOtnOWlJyYgee9yUgxgyfuOYUr1lx4RnOCQ6/1
 EBChnizEhkGg98Qpb9CpWmqjZ9uwiJaLdKFSO74efjp/2WlLeF/PdqTf24D+LPN1P8LG
 ut0mRRmlv8336aUyZvx8kApwOfcK8sDhtM7WuIfl2MBmS6ZuL17nr1XnMweom7zSFLQr
 SU1LW9cXuv0oj342u5+FBEYK8zvWP3Ncp6alE6PlZBLutNfav0Wkn2mPAAiG73k05zRM
 KXagAGOXvyhZJWcXTLNF9MpM0OMfwxpf1lgKnc+SiFLpACDo558o3HfUfDT5kBkmCL4j
 kpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kq02GySVi94nZ9Mc+L7RCzpSrSe7oKjAYDJQaI+i1/M=;
 b=UxNns3hBX89VmQG1pXbYGmXSvmR+PRnzXfkZ/K13HUCvyneLOZbnBZVA3lbXBSTo/k
 uvGIAYfs1HjxP+rv451dZYS7CE3Yms2B6sleLL+ASPSHIcnFn4S6mAGMngF9NCvAcNH1
 cHjXzKKoW0wgqT74bDyxJxdcnrxgmjvB9FU1m/A2dCLk8dQXqJn8iwQomki6Q9wRmQ5k
 SRzvYT02mLg8kvfwvzUqai8FvEt7IiUMzINk0BdNFaeUxR70io2e4sAwZ0B7bQl+s+7B
 phTKJELquAj6NYrXFNY6KgJYwIeB6RDT3igUTA6lJY8wq0TvG+TqCPftDdfZaNNGsHzz
 QVUw==
X-Gm-Message-State: AOAM533LyxUiw1TYec7csvzxnU0feTph3ImOIMzBDPTv2V35bkc5sItj
 oM00ovp/prPoYZE2BQkMhvvZ8g==
X-Google-Smtp-Source: ABdhPJxfALbrt1KmDbthK4aKVj2I9eMN8ID458hdF4feL14JAdfjm2AEeZoz0NS/AVyWmIjpPI7ETg==
X-Received: by 2002:a17:902:7781:b0:161:c85a:8fff with SMTP id
 o1-20020a170902778100b00161c85a8fffmr37569596pll.97.1653565404194; 
 Thu, 26 May 2022 04:43:24 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa78650000000b0050dc7628137sm1320375pfo.17.2022.05.26.04.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 04:43:23 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 Dmitry Osipenko <digetx@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ilia Lin <ilia.lin@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
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
Subject: [PATCH 00/31] OPP: Add new configuration interface:
 dev_pm_opp_set_config()
Date: Thu, 26 May 2022 17:11:59 +0530
Message-Id: <cover.1653564321.git.viresh.kumar@linaro.org>
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
 Vincent Guittot <vincent.guittot@linaro.org>, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Rafael Wysocki <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mmc@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

We have too many configuration specific APIs currently, six of them already,
like dev_pm_opp_set_regulators(). This makes it complex/messy for both the OPP
core and its users to manage. There is also code redundancy in these API, in the
way they add/manage the OPP table specific stuff.

This patch series is an attempt to simplify these interfaces by adding a single
interface, dev_pm_opp_set_config(), which replaces all the existing ones. This
also migrates the users to the new API.

The first two patches help get the API in place, followed by patches to migrate
the end users. Once all the users are migrated, the last few patches remove the
now unused interfaces.

I have lightly tested this on Hikey960 for now and also getting help from
various build/boot bots, gitlab and lkp, to get these tested. It would be
helpful if someone with access to the affected platforms can give it a try.

This is pushed here:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/config

The entire patchset shall get merged via the OPP tree in 5.20-rc1, please do not
merge individual patches.

Thanks.

--
Viresh

Viresh Kumar (31):
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
  media: tegra: Migrate to dev_pm_opp_set_config()
  mmc: sdhci-msm: Migrate to dev_pm_opp_set_config()
  OPP: ti: Migrate to dev_pm_opp_set_config()
  soc/tegra: Remove the call to devm_pm_opp_set_clkname()
  soc/tegra: Migrate to dev_pm_opp_set_config()
  spi: qcom: Migrate to dev_pm_opp_set_config()
  serial: qcom: Migrate to dev_pm_opp_set_config()
  OPP: Remove dev_pm_opp_set_regulators() and friends
  OPP: Remove dev_pm_opp_set_supported_hw() and friends
  OPP: Remove dev_pm_opp_set_clkname() and friends
  OPP: Remove dev_pm_opp_register_set_opp_helper() and friends
  OPP: Remove dev_pm_opp_attach_genpd() and friends
  OPP: Remove dev_pm_opp_set_prop_name() and friends
  OPP: Rearrange dev_pm_opp_set_config() and friends

 drivers/cpufreq/cpufreq-dt.c                  |  14 +-
 drivers/cpufreq/imx-cpufreq-dt.c              |  12 +-
 drivers/cpufreq/qcom-cpufreq-nvmem.c          | 107 +---
 drivers/cpufreq/sti-cpufreq.c                 |  22 +-
 drivers/cpufreq/sun50i-cpufreq-nvmem.c        |  11 +-
 drivers/cpufreq/tegra20-cpufreq.c             |  12 +-
 drivers/cpufreq/ti-cpufreq.c                  |  38 +-
 drivers/devfreq/exynos-bus.c                  |  14 +-
 drivers/devfreq/sun8i-a33-mbus.c              |   7 +-
 drivers/devfreq/tegra30-devfreq.c             |   8 +-
 drivers/gpu/drm/lima/lima_devfreq.c           |  11 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   8 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   5 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |   5 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |   5 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 +-
 drivers/gpu/drm/tegra/gr3d.c                  |   6 +-
 .../media/platform/qcom/venus/pm_helpers.c    |  16 +-
 drivers/memory/tegra/tegra124-emc.c           |  14 +-
 drivers/mmc/host/sdhci-msm.c                  |   5 +-
 drivers/opp/core.c                            | 540 +++++++-----------
 drivers/opp/opp.h                             |   2 +
 drivers/opp/ti-opp-supply.c                   |   6 +-
 drivers/soc/tegra/common.c                    |  14 +-
 drivers/soc/tegra/pmc.c                       |   8 +-
 drivers/spi/spi-geni-qcom.c                   |   5 +-
 drivers/spi/spi-qcom-qspi.c                   |   5 +-
 drivers/tty/serial/qcom_geni_serial.c         |   5 +-
 include/linux/pm_opp.h                        | 118 ++--
 30 files changed, 444 insertions(+), 598 deletions(-)

-- 
2.31.1.272.g89b43f80a514


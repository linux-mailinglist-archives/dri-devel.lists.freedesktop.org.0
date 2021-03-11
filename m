Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D5A337D8F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 20:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1786EB86;
	Thu, 11 Mar 2021 19:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9626EB7B;
 Thu, 11 Mar 2021 19:21:38 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id s17so3610194ljc.5;
 Thu, 11 Mar 2021 11:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nr3MMopQK2U9fHQgnqesF0TFAIQZjafir6ZJocCIzyI=;
 b=MyIkaSeXkIuqBbDFC2RZN06Z7+tiTtAyEFnuG6JcB8fVDc/Sps5Y/4lD3XbsyeO4ae
 TVru7tnsGRkHH9T+lqIfziLi24bGn4Y8kTsTE9yDA1ltlFtHAtJpiks0QkaZ9aRplxPS
 5gaASxaSxYV09M2FNYhkdvW8CF+zEtfZisqi7xVpZXA/1IPDNlhxHt6m05FCcOY89lyR
 2GdG2+f4JHdOC1hDD3wwJPE/7krkXhXW5bP+CHhYBHdm3OpOYonPaVP1OLWWZ9Kwv+eU
 27iTZCIS1IVBb33goI5qAl9/7f1WShlaTr+5bUuPY/hADp7/1yeTfOzDA3lIhMeLMcrB
 kshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nr3MMopQK2U9fHQgnqesF0TFAIQZjafir6ZJocCIzyI=;
 b=C8cRnHLAhRB+ASp35flhcXTioFz9TMhRp/IOnMdv9BHXX2YGL+sTASdwMb0ZqXVK0e
 v4qZkYlfP1L8V0YM/L1CLGND5aM508xonh0nVbVbsvBo61XkkpYvrhav0q+cYOozfqh+
 15PjZpbhMODUhq4bspOu3dEOGFi0pkZgn9BMR60Bf3ZR5RaZXXG0sQBBaM9oGgD+hBZU
 6UyBmrNjZqpQnP+fQOqX56xfPSOjtZmsTKTPZhCdAoVpIfouY40qW+cMegQ0hYIcVPqh
 gI6BBxcN47Edvcgb0wMjub7qGM3Jb7hnnieJXH8m1WVaJ0V6ZBZFTAOb3fpw3JlnhwOi
 bASw==
X-Gm-Message-State: AOAM533ywp7IPsy5GfOE84TX8gWdKRBfzyvOicbN+6QSPNJW+non7EFT
 Z5JRQkYYYfmP+OuI/MXE1DQ=
X-Google-Smtp-Source: ABdhPJwV50MJdowwGjHNgx6AtXCWhwuCfX9B+Ri0kWRJuRnNED/9RtxV4BcKLyAa4veO0GRq4JAp4w==
X-Received: by 2002:a2e:9f45:: with SMTP id v5mr215188ljk.183.1615490496374;
 Thu, 11 Mar 2021 11:21:36 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id u14sm1121153lfl.40.2021.03.11.11.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 11:21:35 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v2 00/14] Introduce devm_pm_opp_* API
Date: Thu, 11 Mar 2021 22:20:51 +0300
Message-Id: <20210311192105.14998-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds resource-managed OPP API helpers and makes drivers
to use them.

Changelog:

v2: - This is a continuation of the work that was started by Yangtao Li.
      Apparently Yangtao doesn't have time to finish it, so I
      (Dmitry Osipenko) picked up the effort since these patches are
      wanted by the NVIDIA Tegra voltage-scaling series that I'm
      working on.

    - Fixed the double put of OPP resources.

    - Dropped all patches that are unrelated to OPP API. I also dropped
      the Tegra memory patch since it doesn't apply now and because I plan
      to switch all Tegra drivers soon to a common tegra-specific OPP helper
      that will use the resource-managed OPP API anyways.

    - Squashed couple patches into a single ones since there was no
      good reason to separate them.

    - Added acks that were given to a couple of v1 patches.

Yangtao Li (14):
  opp: Add devres wrapper for dev_pm_opp_set_clkname
  opp: Add devres wrapper for dev_pm_opp_set_regulators
  opp: Add devres wrapper for dev_pm_opp_set_supported_hw
  opp: Add devres wrapper for dev_pm_opp_of_add_table
  opp: Add devres wrapper for dev_pm_opp_register_notifier
  serial: qcom_geni_serial: Convert to use resource-managed OPP API
  spi: spi-geni-qcom: Convert to use resource-managed OPP API
  spi: spi-qcom-qspi: Convert to use resource-managed OPP API
  mmc: sdhci-msm: Convert to use resource-managed OPP API
  drm/msm: Convert to use resource-managed OPP API
  drm/lima: Convert to use resource-managed OPP API
  drm/panfrost: Convert to use resource-managed OPP API
  media: venus: Convert to use resource-managed OPP API
  memory: samsung: exynos5422-dmc: Convert to use resource-managed OPP
    API

 drivers/gpu/drm/lima/lima_devfreq.c           |  43 ++---
 drivers/gpu/drm/lima/lima_devfreq.h           |   2 -
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  24 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   2 -
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  31 +---
 drivers/gpu/drm/msm/dp/dp_ctrl.h              |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c           |   5 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  14 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  33 +---
 drivers/gpu/drm/panfrost/panfrost_devfreq.h   |   1 -
 .../media/platform/qcom/venus/pm_helpers.c    |  18 +--
 drivers/memory/samsung/exynos5422-dmc.c       |  13 +-
 drivers/mmc/host/sdhci-msm.c                  |  20 +--
 drivers/opp/core.c                            | 151 ++++++++++++++++++
 drivers/opp/of.c                              |  36 +++++
 drivers/spi/spi-geni-qcom.c                   |  17 +-
 drivers/spi/spi-qcom-qspi.c                   |  19 +--
 drivers/tty/serial/qcom_geni_serial.c         |  24 ++-
 include/linux/pm_opp.h                        |  34 ++++
 include/linux/qcom-geni-se.h                  |   2 -
 23 files changed, 300 insertions(+), 196 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 333E1464242
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99966E578;
	Tue, 30 Nov 2021 23:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3051A6E578
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:23:56 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id b1so57750020lfs.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2PlBPfQM0fIPfgD+Eg+BL2UvlbNYpgcqT76wWFUqmpA=;
 b=IhiDkjctiDpjxHbnPTePEH6cs4Sb4WuhVrpz85Zwqvqd6tCLmD6zz6V19CeCZRpWCK
 KsoUO8Ie1Uq+tJ80uqNbTgna6beAwXihNqOoT2f7Sa/J9CkI3um+JKbOPSFxM/Auy53F
 QykZ17Wyw1rCaHq3oAoOjo9/fCrX/t8LFVt5/29MRARsuxLAE/7h8VWNJWWBex+owHaR
 TEGQ86xA9OL6ynq5lKyUDNUOnKsjSAS9UMrbhBF9DDLwlK/qWz5L9S0Mfe0bgNh93sMO
 Om6LNDpOF7J+ITUzPfdfjT5vXlfaq3lD52oqr/reT7ok+Evh3nBuKCsU7RAyqsGR4X2Y
 yLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2PlBPfQM0fIPfgD+Eg+BL2UvlbNYpgcqT76wWFUqmpA=;
 b=kyLkDSGiLgpHy0v2byF6GxN0IboINIXyFUN0KImyTma67i8d7e5nni/8irpEu+/Wmc
 I805+Z1j20cEDV9yMfBT3PwkkmavQTrDEceRFjZI2KIujsQ4aZPz7LzMp9R4qSRSltm9
 nfpoBzJzGhiEMVTvmjoFd5a63ZuzRN5A7l9eltbJRMvIUeSYYsDwaiQK9tMh9/8n6gcM
 4JyG4gcSrDELtmIN7t4V0kaudw7FcushDkepoN6L087dhBONpqI/E9e8SKIh516KaKwe
 SY4/HjfupvsspqzG0pVQkDj/p5FPTwzbTU0Fv0Z1YA7Lrxt7UDBv5E4ciNof+r5A1NwZ
 WJEA==
X-Gm-Message-State: AOAM531wt9ylCSt6IfkXpRS5Ookxi5BJPILtFMynqBhFaocSSzPUZQJV
 Z15vHqULQruJMTKNN9Et8MM=
X-Google-Smtp-Source: ABdhPJzRwU9b8v08NykPETp8a51ns07l1w+sNj70FF8RnGaXC6YNCHneaBTf3ihfdD67mr1KG73K5Q==
X-Received: by 2002:a05:6512:1289:: with SMTP id
 u9mr2195512lfs.273.1638314634436; 
 Tue, 30 Nov 2021 15:23:54 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:23:53 -0800 (PST)
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
Subject: [PATCH v16 00/40] NVIDIA Tegra power management patches for 5.17
Date: Wed,  1 Dec 2021 02:23:07 +0300
Message-Id: <20211130232347.950-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds runtime PM support to Tegra drivers and enables core
voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.

All patches in this series are interdependent and should go via Tegra tree
for simplicity.

Changelog:

v16: - Replaced redundant "context->client" with "client" in gr2d/3d
       RPM patches, which was spotted by Michał Mirosław in v15.

     - Added new patch that consolidates the RPM management of older
       UAPI code path.

     - Added stable tag to "submit: Add missing pm_runtime_mark_last_busy()"
       patch and reordered it such that it could be backported without merge
       conflicts.

v15: - Added r-b from Ulf Hansson to "soc/tegra: Enable runtime PM during
       OPP state-syncing" patch and added extra sanity-check to this patch
       which ensures that RPM is indeed enabled.

     - Fixed double RPM-disable on unbind for drivers that used
       devm_pm_runtime_enable() + pm_runtime_force_suspend().

     - Added link with additional info to commit message of "regulators:
       Prepare for suspend" patch.

v14: - Fixed missing runtime PM syncing on removal of drivers, which was
       spotted by Ulf Hansson in v13.

     - clk-device driver now resumes RPM on system suspend instead of
       preparing clock which it backs. This was suggested by Ulf Hansson.

     - clk-device driver now syncs power domain performance unconditionally
       during driver's probe time since GENPD API allows to do this now.
       It was spotted by Ulf Hansson.

     - Added new "Enable runtime PM during OPP state-syncing" patch, which
       allows drivers to sync state at any time. Previously drivers were
       obligated to take care of enabling RPM at the "right" time.

     - Moved runtime PM initialization/uninitialization of DRM drivers that
       use host1x channel to host1x client init/deinit phase. I noticed that
       there is UAF problem because RPM-suspend callback waits until channel
       is idling and channel is already released/freed during driver's removal
       phase.

     - Added system suspend support to the new NVDEC DRM driver.

     - Added missing pm_runtime_mark_last_busy() to DRM driver.

     - Corrected VDE GENPD patch which previously made video decoder clock
       always-enabled by mistake if legacy PD code path was used. It was
       spotted while we were testing VDE on Tegra114 that doesn't support
       GENPD yet.

     - Added ack from Peter Chen to the USB patch that he gave to v13.

     - Changed OPP table names in accordance to the new naming scheme
       required by the recent core OPP binding.

     - Added 500MHz memory OPP entry used by ASUS Transformer tablets.

v13: - Fixed compile-test error reported by build bot by reverting the
       mmc/ patch to v11. The sdhci_suspend/resume_host() functions aren't
       available with the disabled CONFIG_PM_SLEEP, some code needs the
       ifdef.

     - Added last r-b from Rob Herring for the DT patches.

     - Corrected clk/ PM domain-support patch by not using the
       devm_tegra_core_dev_init_opp_table_common() helper, which I
       utilized in v12. The clk driver implements its own power domain
       state syncing and common helper shouldn't be used. This fixes driver
       probing for some clocks on some devices. It was reported by
       Svyatoslav Ryhel for PLLE OPP error on T30 Asus Transformer tablet.

v12: - Added r-b from Rob Herring to the host1x binding patch.

     - Added acks from Hans Verkuil to the video decoder patches.

     - In the v11 changelog I forgot to mention that the clk-binding
       patch was also changed with a corrected regex pattern and removed
       'clocks' sub-node. This patch needs r-b or ack too.

     - Added new "Rename 3d power domains" patch to match the DT schema
       naming requirement. Thanks to David Heidelberg for spotting this
       problem.

     - Replaced #ifdef CONFIG_PM_SLEEP with maybe_unused in the MMC patch
       to make code cleaner.

v11: - Added acks and r-b from Rob Herring, Mark Brown and Miquel Raynal
       that were given to v8.

     - Corrected order of the new memory controller reset entry in
       device-trees and host1x DT binding patch, which was requested by
       Rob Herring.

     - Switched consumer drivers to use power domain state syncing done
       by new Tegra's common OPP-initialization helper.

     - Made use of new devm_pm_runtime_enable() helper that was added to
       v5.15 kernel, where appropriate.

     - Added "fuse: Use resource-managed helpers" patch.

     - Converted Tegra20/30 clk drivers to a proper platform drivers,
       which was requested by Thierry Reding.

     - Removed clk-bulk API usage from the MMC patch, which was requested
       by Thierry Reding.

     - Changed CORE power domain name to "core" in a new patch
       "Change name of core power domain".

     - Misc small fixes for problems that I found since v8, like couple
       typos in error code paths and restored working RPM for Tegra DRM
       UAPI v1 that was removed in v8 by accident.

v9-v10: Figured out remaining GENPD API changes with Ulf Hansson and
        Viresh Kumar. The OPP-sync helper that was used in v8 isn't needed
        anymore because GENPD API now allows consumer drivers to
        init rpm_pstate of power domains.

v8: - Added new generic dev_pm_opp_sync() helper that syncs OPP state with
      hardware. All drivers changed to use it. This replaces GENPD attach_dev
      callback hacks that were used in v7.

    - Added new patch patch "soc/tegra: regulators: Prepare for suspend"
      that fixes dying Tegra20 SoC after enabling VENC power domain during
      resume from suspend. It matches to what downstream kernel does on
      suspend/resume.

    - After a second thought, I dropped patches which added RPM to memory
      drivers since hardware is always-on and RPM not needed.

    - Replaced the "dummy host1x driver" patch with new "Disable unused
      host1x hardware" patch, since it's a cleaner solution.

Dmitry Osipenko (40):
  soc/tegra: Enable runtime PM during OPP state-syncing
  soc/tegra: Add devm_tegra_core_dev_init_opp_table_common()
  soc/tegra: Don't print error message when OPPs not available
  dt-bindings: clock: tegra-car: Document new clock sub-nodes
  clk: tegra: Support runtime PM and power domain
  dt-bindings: host1x: Document OPP and power domain properties
  dt-bindings: host1x: Document Memory Client resets of Host1x, GR2D and
    GR3D
  gpu: host1x: Add initial runtime PM and OPP support
  gpu: host1x: Add host1x_channel_stop()
  drm/tegra: submit: Add missing pm_runtime_mark_last_busy()
  drm/tegra: dc: Support OPP and SoC core voltage scaling
  drm/tegra: hdmi: Add OPP support
  drm/tegra: gr2d: Support generic power domain and runtime PM
  drm/tegra: gr3d: Support generic power domain and runtime PM
  drm/tegra: vic: Stop channel on suspend
  drm/tegra: nvdec: Stop channel on suspend
  drm/tegra: submit: Remove pm_runtime_enabled() checks
  drm/tegra: Consolidate runtime PM management of older UAPI codepath
  usb: chipidea: tegra: Add runtime PM and OPP support
  bus: tegra-gmi: Add runtime PM and OPP support
  pwm: tegra: Add runtime PM and OPP support
  mmc: sdhci-tegra: Add runtime PM and OPP support
  mtd: rawnand: tegra: Add runtime PM and OPP support
  spi: tegra20-slink: Add OPP support
  media: dt: bindings: tegra-vde: Convert to schema
  media: dt: bindings: tegra-vde: Document OPP and power domain
  media: staging: tegra-vde: Support generic power domain
  soc/tegra: fuse: Reset hardware
  soc/tegra: fuse: Use resource-managed helpers
  soc/tegra: regulators: Prepare for suspend
  soc/tegra: pmc: Rename 3d power domains
  soc/tegra: pmc: Rename core power domain
  soc/tegra: pmc: Enable core domain support for Tegra20 and Tegra30
  ARM: tegra: Rename CPU and EMC OPP table device-tree nodes
  ARM: tegra: Add 500MHz entry to Tegra30 memory OPP table
  ARM: tegra: Add OPP tables and power domains to Tegra20 device-trees
  ARM: tegra: Add OPP tables and power domains to Tegra30 device-trees
  ARM: tegra: Add Memory Client resets to Tegra20 GR2D, GR3D and Host1x
  ARM: tegra: Add Memory Client resets to Tegra30 GR2D, GR3D and Host1x
  ARM: tegra20/30: Disable unused host1x hardware

 .../bindings/clock/nvidia,tegra20-car.yaml    |   37 +
 .../display/tegra/nvidia,tegra20-host1x.txt   |   53 +
 .../bindings/media/nvidia,tegra-vde.txt       |   64 -
 .../bindings/media/nvidia,tegra-vde.yaml      |  119 ++
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi    |    4 +-
 .../arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |    4 +-
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi  |    8 +-
 .../arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |    8 +-
 .../boot/dts/tegra124-peripherals-opp.dtsi    |  140 +-
 .../boot/dts/tegra20-acer-a500-picasso.dts    |    5 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi        |    5 +-
 .../boot/dts/tegra20-cpu-opp-microvolt.dtsi   |   82 +-
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi        |   82 +-
 arch/arm/boot/dts/tegra20-harmony.dts         |    3 +-
 arch/arm/boot/dts/tegra20-paz00.dts           |    3 +-
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  949 +++++++++++-
 arch/arm/boot/dts/tegra20-seaboard.dts        |    3 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi       |    3 +-
 arch/arm/boot/dts/tegra20-trimslice.dts       |    9 +
 arch/arm/boot/dts/tegra20-ventana.dts         |    1 +
 arch/arm/boot/dts/tegra20.dtsi                |  118 +-
 .../tegra30-asus-nexus7-grouper-common.dtsi   |    1 +
 ...30-asus-nexus7-grouper-memory-timings.dtsi |   12 +-
 arch/arm/boot/dts/tegra30-beaver.dts          |    1 +
 arch/arm/boot/dts/tegra30-cardhu.dtsi         |    1 +
 arch/arm/boot/dts/tegra30-colibri.dtsi        |   17 +-
 .../boot/dts/tegra30-cpu-opp-microvolt.dtsi   |  144 +-
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi        |  144 +-
 arch/arm/boot/dts/tegra30-ouya.dts            |    5 +-
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 1373 ++++++++++++++++-
 arch/arm/boot/dts/tegra30.dtsi                |  175 ++-
 drivers/bus/tegra-gmi.c                       |   50 +-
 drivers/clk/tegra/Makefile                    |    1 +
 drivers/clk/tegra/clk-device.c                |  199 +++
 drivers/clk/tegra/clk-pll.c                   |    2 +-
 drivers/clk/tegra/clk-super.c                 |    2 +-
 drivers/clk/tegra/clk-tegra20.c               |   77 +-
 drivers/clk/tegra/clk-tegra30.c               |  116 +-
 drivers/clk/tegra/clk.c                       |   75 +-
 drivers/clk/tegra/clk.h                       |    2 +
 drivers/gpu/drm/tegra/dc.c                    |   79 +
 drivers/gpu/drm/tegra/dc.h                    |    2 +
 drivers/gpu/drm/tegra/drm.c                   |   11 +-
 drivers/gpu/drm/tegra/gr2d.c                  |  174 ++-
 drivers/gpu/drm/tegra/gr3d.c                  |  353 ++++-
 drivers/gpu/drm/tegra/hdmi.c                  |   16 +-
 drivers/gpu/drm/tegra/nvdec.c                 |   43 +-
 drivers/gpu/drm/tegra/submit.c                |   14 +-
 drivers/gpu/drm/tegra/vic.c                   |   48 +-
 drivers/gpu/host1x/channel.c                  |    8 +
 drivers/gpu/host1x/debug.c                    |   15 +
 drivers/gpu/host1x/dev.c                      |  150 +-
 drivers/gpu/host1x/dev.h                      |    3 +-
 drivers/gpu/host1x/hw/channel_hw.c            |   44 +-
 drivers/gpu/host1x/intr.c                     |    3 -
 drivers/gpu/host1x/syncpt.c                   |    5 +-
 drivers/mmc/host/sdhci-tegra.c                |   81 +-
 drivers/mtd/nand/raw/tegra_nand.c             |   58 +-
 drivers/pwm/pwm-tegra.c                       |   82 +-
 drivers/soc/tegra/common.c                    |   29 +-
 drivers/soc/tegra/fuse/fuse-tegra.c           |   51 +-
 drivers/soc/tegra/fuse/fuse-tegra20.c         |   33 +-
 drivers/soc/tegra/fuse/fuse.h                 |    1 +
 drivers/soc/tegra/pmc.c                       |   14 +-
 drivers/soc/tegra/regulators-tegra20.c        |   99 ++
 drivers/soc/tegra/regulators-tegra30.c        |  122 ++
 drivers/spi/spi-tegra20-slink.c               |    9 +-
 drivers/staging/media/tegra-vde/vde.c         |   63 +-
 drivers/usb/chipidea/ci_hdrc_tegra.c          |   53 +-
 include/linux/host1x.h                        |    1 +
 include/soc/tegra/common.h                    |   15 +
 71 files changed, 4930 insertions(+), 846 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
 create mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
 create mode 100644 drivers/clk/tegra/clk-device.c

-- 
2.33.1


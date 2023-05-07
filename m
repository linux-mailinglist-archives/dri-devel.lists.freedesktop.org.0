Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6FC6FBFEE
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 09:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD3C10E33B;
	Tue,  9 May 2023 07:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D49F10E270
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:27:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDT-0001dQ-9k; Sun, 07 May 2023 18:26:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDN-001nB9-TQ; Sun, 07 May 2023 18:26:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDM-002Afe-ST; Sun, 07 May 2023 18:26:24 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: James@pengutronix.de, Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux@armlinux.org.uk>,
 Joel Stanley <joel@jms.id.au>, Sam Ravnborg <sam@ravnborg.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Rahul T R <r-ravikumar@ti.com>, Jayshri Pawar <jpawar@cadence.com>,
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Minghao Chi <chi.minghao@zte.com.cn>, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Lucas Stach <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Qiang Yu <yuq825@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Johan Hovold <johan+linaro@kernel.org>, Joel@pengutronix.de,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Liu Shixin <liushixin2@huawei.com>,
 Douglas Anderson <dianders@chromium.org>,
 Miaoqian Lin <linmq006@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Marek Vasut <marex@denx.de>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Tomi Valkeinen <tomba@kernel.org>,
 Guo Zhengkui <guozhengkui@vivo.com>, Yuan Can <yuancan@huawei.com>,
 Arnd Bergmann <arnd@arndb.de>, Liang He <windhl@126.com>,
 Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Deepak R Varma <drv@mailo.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime@cerno.tech>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Alexey Brodkin <abrodkin@synopsys.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 00/53] drm: Convert to platform remove callback returning void
Date: Sun,  7 May 2023 18:25:23 +0200
Message-Id: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=14798;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=lYC/6nt2775YYktBBe0La4Rd2LbkHx63Y8C/T7uMCDE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9DiHJvsTbW8rDzpNQDprwurMfyYCBw0QTbXz
 4sTxy3YVsuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfQ4gAKCRCPgPtYfRL+
 TviMB/9PsRD/JiXPREc6Dc3inx8IdOBOrHq6jxR5UDc/pmYqKB6+6v/3uFt5U+2QXfzV3gsSX8e
 utyLxLAFqDYkaZkXZYTsGdtJ/RE7Q2w5yAaRCF4DAu0k4iEyZr+QUUF8FNJ3xE5hkdOoD2m5qO3
 rJz4ZawyKXTCeQ9FZU/w2YIIh78VkoHyhfn+TSOxwFWnzxB4PFhfpv5yWyDiGfAci2r6guguWYZ
 Mh8yYbvfm/ULrsI3q5kZ4s3RlWdC+E9KqC4PXRn7G6vW6X/g6OGu9KA9Q4KYIcIH8EmVs6R3U4r
 WM07tmh6e12qYth7UA/lmTb00hY7H23XsjDkMxU0N7bnHX1g
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Tue, 09 May 2023 07:04:45 +0000
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
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 lima@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, NXP Linux Team <linux-imx@nxp.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, linux-sunxi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, etnaviv@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-stm32@st-md-mailman.stormreply.com,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kernel@pengutronix.de, Yongqin Liu <yongqin.liu@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

this patch series adapts the platform drivers below drivers/gpu/drm
to use the .remove_new() callback. Compared to the traditional .remove()
callback .remove_new() returns no value. This is a good thing because
the driver core doesn't (and cannot) cope for errors during remove. The
only effect of a non-zero return value in .remove() is that the driver
core emits a warning. The device is removed anyhow and an early return
from .remove() usually yields a resource leak.

By changing the remove callback to return void driver authors cannot
reasonably (but wrongly) assume any more that there happens some kind of
cleanup later.

Best regards
Uwe

Uwe Kleine-König (53):
  drm/komeda: Convert to platform remove callback returning void
  drm/arm/hdlcd: Convert to platform remove callback returning void
  drm/arm/malidp: Convert to platform remove callback returning void
  drm/armada: Convert to platform remove callback returning void
  drm/aspeed: Convert to platform remove callback returning void
  drm/atmel-hlcdc: Convert to platform remove callback returning void
  drm/bridge: cdns-dsi: Convert to platform remove callback returning
    void
  drm/bridge: display-connector: Convert to platform remove callback
    returning void
  drm/bridge: fsl-ldb: Convert to platform remove callback returning
    void
  drm/imx/imx8*: Convert to platform remove callback returning void
  drm/bridge: lvds-codec: Convert to platform remove callback returning
    void
  drm/bridge: nwl-dsi: Convert to platform remove callback returning
    void
  drm/bridge: simple-bridge: Convert to platform remove callback
    returning void
  drm/bridge: synopsys: Convert to platform remove callback returning
    void
  drm/bridge: thc63lvd1024: Convert to platform remove callback
    returning void
  drm/bridge: tfp410: Convert to platform remove callback returning void
  drm/etnaviv: Convert to platform remove callback returning void
  drm/exynos: Convert to platform remove callback returning void
  drm/fsl-dcu: Convert to platform remove callback returning void
  drm/hisilicon: Convert to platform remove callback returning void
  drm/imx/dcss: Convert to platform remove callback returning void
  drm/imx/ipuv3: Convert to platform remove callback returning void
  drm/ingenic: Convert to platform remove callback returning void
  drm/kmb: Convert to platform remove callback returning void
  drm/lima: Convert to platform remove callback returning void
  drm/logicvc: Convert to platform remove callback returning void
  drm/mcde: Convert to platform remove callback returning void
  drm/mediatek: Convert to platform remove callback returning void
  drm/mediatek: Convert to platform remove callback returning void
  drm/meson: Convert to platform remove callback returning void
  drm/msm: Convert to platform remove callback returning void
  drm/mxsfb: Convert to platform remove callback returning void
  drm/nouveau: Convert to platform remove callback returning void
  drm/omap: Convert to platform remove callback returning void
  drm/panel: Convert to platform remove callback returning void
  drm/panfrost: Convert to platform remove callback returning void
  drm/rcar-du: Convert to platform remove callback returning void
  drm/rockchip: Convert to platform remove callback returning void
  drm/shmobile: Convert to platform remove callback returning void
  drm/sprd: Convert to platform remove callback returning void
  drm/sti: Convert to platform remove callback returning void
  drm/stm: Convert to platform remove callback returning void
  drm/sun4i: Convert to platform remove callback returning void
  drm/tegra: Convert to platform remove callback returning void
  drm/tests: helpers: Convert to platform remove callback returning void
  drm/tidss: Convert to platform remove callback returning void
  drm/tilcdc: Convert to platform remove callback returning void
  drm/tiny: Convert to platform remove callback returning void
  drm/tiny: Convert to platform remove callback returning void
  drm/tve200: Convert to platform remove callback returning void
  drm/v3d: Convert to platform remove callback returning void
  drm/vc4: Convert to platform remove callback returning void
  drm/xlnx/zynqmp_dpsub: Convert to platform remove callback returning
    void

 drivers/gpu/drm/arm/display/komeda/komeda_drv.c     | 5 ++---
 drivers/gpu/drm/arm/hdlcd_drv.c                     | 5 ++---
 drivers/gpu/drm/arm/malidp_drv.c                    | 5 ++---
 drivers/gpu/drm/armada/armada_crtc.c                | 5 ++---
 drivers/gpu/drm/armada/armada_drv.c                 | 5 ++---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c             | 6 ++----
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c        | 6 ++----
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c      | 6 ++----
 drivers/gpu/drm/bridge/display-connector.c          | 6 ++----
 drivers/gpu/drm/bridge/fsl-ldb.c                    | 6 ++----
 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c         | 6 ++----
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c        | 6 ++----
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 6 ++----
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     | 6 ++----
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        | 6 ++----
 drivers/gpu/drm/bridge/lvds-codec.c                 | 6 ++----
 drivers/gpu/drm/bridge/nwl-dsi.c                    | 5 ++---
 drivers/gpu/drm/bridge/simple-bridge.c              | 6 ++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 6 ++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c       | 6 ++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c  | 6 ++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 6 ++----
 drivers/gpu/drm/bridge/thc63lvd1024.c               | 6 ++----
 drivers/gpu/drm/bridge/ti-tfp410.c                  | 6 ++----
 drivers/gpu/drm/etnaviv/etnaviv_drv.c               | 6 ++----
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c               | 5 ++---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c       | 6 ++----
 drivers/gpu/drm/exynos/exynos7_drm_decon.c          | 6 ++----
 drivers/gpu/drm/exynos/exynos_dp.c                  | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_drv.c             | 5 ++---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c             | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_fimc.c            | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c            | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_g2d.c             | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_gsc.c             | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_mic.c             | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_rotator.c         | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_scaler.c          | 6 ++----
 drivers/gpu/drm/exynos/exynos_hdmi.c                | 6 ++----
 drivers/gpu/drm/exynos/exynos_mixer.c               | 6 ++----
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c           | 6 ++----
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c        | 6 ++----
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c     | 5 ++---
 drivers/gpu/drm/imx/dcss/dcss-drv.c                 | 6 ++----
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c             | 6 ++----
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c            | 5 ++---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                 | 5 ++---
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                 | 5 ++---
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c              | 5 ++---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c        | 6 ++----
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c           | 6 ++----
 drivers/gpu/drm/ingenic/ingenic-ipu.c               | 5 ++---
 drivers/gpu/drm/kmb/kmb_drv.c                       | 5 ++---
 drivers/gpu/drm/lima/lima_drv.c                     | 5 ++---
 drivers/gpu/drm/logicvc/logicvc_drm.c               | 6 ++----
 drivers/gpu/drm/mcde/mcde_drv.c                     | 6 ++----
 drivers/gpu/drm/mcde/mcde_dsi.c                     | 6 ++----
 drivers/gpu/drm/mediatek/mtk_cec.c                  | 5 ++---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c             | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c           | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_color.c           | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c           | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_merge.c           | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c             | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c            | 6 ++----
 drivers/gpu/drm/mediatek/mtk_dp.c                   | 6 ++----
 drivers/gpu/drm/mediatek/mtk_dpi.c                  | 6 ++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c              | 6 ++----
 drivers/gpu/drm/mediatek/mtk_dsi.c                  | 6 ++----
 drivers/gpu/drm/mediatek/mtk_hdmi.c                 | 5 ++---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c             | 6 ++----
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c             | 5 ++---
 drivers/gpu/drm/meson/meson_drv.c                   | 6 ++----
 drivers/gpu/drm/meson/meson_dw_hdmi.c               | 6 ++----
 drivers/gpu/drm/msm/adreno/adreno_device.c          | 5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c             | 6 ++----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c            | 6 ++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c            | 5 ++---
 drivers/gpu/drm/msm/dp/dp_display.c                 | 6 ++----
 drivers/gpu/drm/msm/dsi/dsi.c                       | 6 ++----
 drivers/gpu/drm/msm/hdmi/hdmi.c                     | 6 ++----
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                 | 6 ++----
 drivers/gpu/drm/msm/msm_drv.c                       | 6 ++----
 drivers/gpu/drm/msm/msm_mdss.c                      | 6 ++----
 drivers/gpu/drm/mxsfb/lcdif_drv.c                   | 6 ++----
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                   | 6 ++----
 drivers/gpu/drm/nouveau/nouveau_platform.c          | 5 ++---
 drivers/gpu/drm/omapdrm/dss/dispc.c                 | 5 ++---
 drivers/gpu/drm/omapdrm/dss/dsi.c                   | 6 ++----
 drivers/gpu/drm/omapdrm/dss/dss.c                   | 6 ++----
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                 | 5 ++---
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                 | 5 ++---
 drivers/gpu/drm/omapdrm/dss/venc.c                  | 5 ++---
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c            | 9 +++------
 drivers/gpu/drm/omapdrm/omap_drv.c                  | 6 ++----
 drivers/gpu/drm/panel/panel-lvds.c                  | 6 ++----
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c         | 6 ++----
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c     | 6 ++----
 drivers/gpu/drm/panel/panel-simple.c                | 6 ++----
 drivers/gpu/drm/panfrost/panfrost_drv.c             | 5 ++---
 drivers/gpu/drm/rcar-du/rcar_cmm.c                  | 6 ++----
 drivers/gpu/drm/rcar-du/rcar_du_drv.c               | 6 ++----
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c              | 6 ++----
 drivers/gpu/drm/rcar-du/rcar_lvds.c                 | 6 ++----
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c             | 6 ++----
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c            | 6 ++----
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c     | 6 ++----
 drivers/gpu/drm/rockchip/cdn-dp-core.c              | 6 ++----
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c     | 6 ++----
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c         | 6 ++----
 drivers/gpu/drm/rockchip/inno_hdmi.c                | 6 ++----
 drivers/gpu/drm/rockchip/rk3066_hdmi.c              | 6 ++----
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c         | 6 ++----
 drivers/gpu/drm/rockchip/rockchip_lvds.c            | 6 ++----
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c        | 6 ++----
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c         | 6 ++----
 drivers/gpu/drm/shmobile/shmob_drm_drv.c            | 6 ++----
 drivers/gpu/drm/sprd/sprd_dpu.c                     | 6 ++----
 drivers/gpu/drm/sprd/sprd_drm.c                     | 5 ++---
 drivers/gpu/drm/sprd/sprd_dsi.c                     | 6 ++----
 drivers/gpu/drm/sti/sti_compositor.c                | 5 ++---
 drivers/gpu/drm/sti/sti_drv.c                       | 6 ++----
 drivers/gpu/drm/sti/sti_dvo.c                       | 5 ++---
 drivers/gpu/drm/sti/sti_hda.c                       | 5 ++---
 drivers/gpu/drm/sti/sti_hdmi.c                      | 6 ++----
 drivers/gpu/drm/sti/sti_hqvdp.c                     | 5 ++---
 drivers/gpu/drm/sti/sti_tvout.c                     | 5 ++---
 drivers/gpu/drm/stm/drv.c                           | 6 ++----
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c               | 6 ++----
 drivers/gpu/drm/sun4i/sun4i_backend.c               | 6 ++----
 drivers/gpu/drm/sun4i/sun4i_drv.c                   | 6 ++----
 drivers/gpu/drm/sun4i/sun4i_frontend.c              | 6 ++----
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c              | 6 ++----
 drivers/gpu/drm/sun4i/sun4i_tcon.c                  | 6 ++----
 drivers/gpu/drm/sun4i/sun4i_tv.c                    | 6 ++----
 drivers/gpu/drm/sun4i/sun6i_drc.c                   | 6 ++----
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c              | 6 ++----
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c               | 6 ++----
 drivers/gpu/drm/sun4i/sun8i_mixer.c                 | 6 ++----
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c              | 6 ++----
 drivers/gpu/drm/tegra/dpaux.c                       | 6 ++----
 drivers/gpu/drm/tests/drm_kunit_helpers.c           | 5 ++---
 drivers/gpu/drm/tidss/tidss_drv.c                   | 6 ++----
 drivers/gpu/drm/tilcdc/tilcdc_panel.c               | 6 ++----
 drivers/gpu/drm/tiny/arcpgu.c                       | 6 ++----
 drivers/gpu/drm/tiny/ofdrm.c                        | 6 ++----
 drivers/gpu/drm/tiny/simpledrm.c                    | 6 ++----
 drivers/gpu/drm/tve200/tve200_drv.c                 | 6 ++----
 drivers/gpu/drm/v3d/v3d_drv.c                       | 6 ++----
 drivers/gpu/drm/vc4/vc4_crtc.c                      | 5 ++---
 drivers/gpu/drm/vc4/vc4_dpi.c                       | 5 ++---
 drivers/gpu/drm/vc4/vc4_drv.c                       | 6 ++----
 drivers/gpu/drm/vc4/vc4_dsi.c                       | 6 ++----
 drivers/gpu/drm/vc4/vc4_hdmi.c                      | 5 ++---
 drivers/gpu/drm/vc4/vc4_hvs.c                       | 5 ++---
 drivers/gpu/drm/vc4/vc4_txp.c                       | 5 ++---
 drivers/gpu/drm/vc4/vc4_v3d.c                       | 5 ++---
 drivers/gpu/drm/vc4/vc4_vec.c                       | 5 ++---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                 | 6 ++----
 159 files changed, 319 insertions(+), 597 deletions(-)


base-commit: 457391b0380335d5e9a5babdec90ac53928b23b4
-- 
2.39.2


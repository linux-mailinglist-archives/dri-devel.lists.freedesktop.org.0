Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7694C4543
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 14:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B0810E1AD;
	Fri, 25 Feb 2022 13:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53D610E1AD
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 13:04:47 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id q5so7314078oij.6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 05:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qpCLiBzRlJC5XhuMltg4PH37HJYFELUnHZd9am5tLiU=;
 b=WOyGrdV+9c4MC7siBhPVli3rndAMVAIfFCaDbZH5nLP/v8STcPEw1PLV79OCMzUU//
 +JKW3cONinG9hBjFXNdctKU6E16tFiRcUiyGDFeAKz94hGhD/2w+wzaFDNMuWhDF8VMc
 MCd5ADjOB/rl0vNdp+PYAfsaU2h1iaAFEF46LEC9qTCGW2Ci7Z/bnjjdihIpZW2fb2x6
 dzonV+mSepQxNhyKkrvaja9BTc2uiNM7YWFs14AFkX1YfJqtHZgOEjpLPzdB2+VILTca
 yUr/p+kM9OlFIbaXvJL7ftsh2PzFsNyn7/j8qUNtt4c+7fnoFNiF3N+P41Rbn/lSChla
 TXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qpCLiBzRlJC5XhuMltg4PH37HJYFELUnHZd9am5tLiU=;
 b=Ktx2lIF6c35lrFSYRCcdJkD+nBWFAMIpzxZ24dOZ9JhzFQ3kioep14QY22vj/nVuKQ
 i6dNeiNECZ7kQUJXC3yRmfMRFVFMn6vs/ry+ZjYBLTUp0V4S3Ud5TBOupB8z2hCOAqcv
 iU1JxtgOH52BD3DcpL2iS06kEbMMgZB7yCMQAcqQwsCAz+x7zZYDz2uBOXLPOwqX7H2C
 0GOR6y9Rw0xkXU3W6K1qgcoUT3l4DeVW8jdu1l/X5lvKPp31I2blKVKUNuG5CE40S+/y
 3L8w8Rc0GosqLD/bE/U4GlqW7qih7Q46FRN9NwIxAMHUKY5mCZxbZhbYkk7VLxrHHLXP
 MNPg==
X-Gm-Message-State: AOAM533WGhhloI5rGOi/wY4rvJS/2R7aElYAMbuNkpY1GAr4Z5AywaTv
 r6S7h4FUXt16Cfaz7D4kqqVORhy1Cu4oexVCs9ri/Q==
X-Google-Smtp-Source: ABdhPJzIaZMqWdp+H4loCziAbw3sR72kXDohahJPhw/sRFW5q/U/TtwO1Ts+6RsQ6d49UNf23SfzdLUUI+GV5euJHEY=
X-Received: by 2002:aca:1b13:0:b0:2d4:b033:450 with SMTP id
 b19-20020aca1b13000000b002d4b0330450mr1533064oib.214.1645794286909; Fri, 25
 Feb 2022 05:04:46 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 05:04:46 -0800
MIME-Version: 1.0
In-Reply-To: <9069bd9d83653fbb286f9e8fa53827b1639d1923.camel@mediatek.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-16-granquet@baylibre.com>
 <9069bd9d83653fbb286f9e8fa53827b1639d1923.camel@mediatek.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 05:04:46 -0800
Message-ID: <CABnWg9tv5rgvLgc59PhqCFtPNL+gAVQ-LauAFG=7zuW_yV=PUA@mail.gmail.com>
Subject: Re: [PATCH v8 15/19] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
To: CK Hu <ck.hu@mediatek.com>, airlied@linux.ie, 
 angelogioacchino.delregno@collabora.com, chunfeng.yun@mediatek.com, 
 chunkuang.hu@kernel.org, daniel@ffwll.ch, deller@gmx.de, 
 jitao.shi@mediatek.com, kishon@ti.com, maarten.lankhorst@linux.intel.com, 
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de, 
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting CK Hu (2022-02-25 10:45:26)
> Hi, Guillaume:
>
> On Fri, 2022-02-18 at 15:54 +0100, Guillaume Ranquet wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> >
> > This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> >
> > It supports the mt8195, the embedded DisplayPort units. It offers
> > hot-plug-detection and DisplayPort 1.4 with up to 4 lanes.
> >
> > The driver creates a child device for the phy. The child device will
> > never exist without the parent being active. As they are sharing a
> > register range, the parent passes a regmap pointer to the child so
> > that
> > both can work with the same register range. The phy driver sets
> > device
> > data that is read by the parent to get the phy device that can be
> > used
> > to control the phy properties.
> >
> > This driver is based on an initial version by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> >
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
> >  drivers/gpu/drm/mediatek/Kconfig       |    7 +
> >  drivers/gpu/drm/mediatek/Makefile      |    2 +
> >  drivers/gpu/drm/mediatek/mtk_dp.c      | 2358
> > ++++++++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_dp_reg.h  |  568 ++++++
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c |    1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.h |    1 +
> >  6 files changed, 2937 insertions(+)
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> >
> >
>
> [snip]
>
> > +
> > +static u32 *mtk_dp_bridge_atomic_get_output_bus_fmts(struct
> > drm_bridge *bridge,
> > +                                                  struct
> > drm_bridge_state *bridge_state,
> > +                                                  struct
> > drm_crtc_state *crtc_state,
> > +                                                  struct
> > drm_connector_state *conn_state,
> > +                                                  unsigned int
> > *num_output_fmts)
> > +{
> > +     u32 *output_fmts;
> > +
> > +     *num_output_fmts = 0;
> > +     output_fmts = kcalloc(1, sizeof(*output_fmts), GFP_KERNEL);
> > +     if (!output_fmts)
> > +             return NULL;
> > +     *num_output_fmts = 1;
> > +     output_fmts[0] = MEDIA_BUS_FMT_FIXED;
> > +     return output_fmts;
> > +}
> > +
> > +static const u32 mt8195_input_fmts[] = {
> > +     MEDIA_BUS_FMT_RGB888_1X24,
> > +     MEDIA_BUS_FMT_YUV8_1X24,
> > +     MEDIA_BUS_FMT_YUYV8_1X16,
> > +};
>
> This means DPINTF output format, right? Does DPINTF switch output
> buffer format?
>
I'll circle back with mediatek engineers, as I don't have a clue here.

> > +
> > +static u32 *mtk_dp_bridge_atomic_get_input_bus_fmts(struct
> > drm_bridge *bridge,
> > +                                                 struct
> > drm_bridge_state *bridge_state,
> > +                                                 struct
> > drm_crtc_state *crtc_state,
> > +                                                 struct
> > drm_connector_state *conn_state,
> > +                                                 u32 output_fmt,
> > +                                                 unsigned int
> > *num_input_fmts)
> > +{
> > +     u32 *input_fmts;
> > +     struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> > +     struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> > +     struct drm_display_info *display_info =
> > +             &conn_state->connector->display_info;
> > +     u32 rx_linkrate;
> > +     u32 bpp;
> > +
> > +     bpp = (display_info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
> > ? 16 :
> > +
> >       24;
> > +     rx_linkrate = (u32)mtk_dp->train_info.link_rate * 27000;
> > +     *num_input_fmts = 0;
> > +     input_fmts = kcalloc(ARRAY_SIZE(mt8195_input_fmts),
> > sizeof(*input_fmts),
> > +                          GFP_KERNEL);
> > +     if (!input_fmts)
> > +             return NULL;
> > +
> > +     *num_input_fmts = ARRAY_SIZE(mt8195_input_fmts);
> > +
> > +     memcpy(input_fmts, mt8195_input_fmts,
> > +            sizeof(*input_fmts) * ARRAY_SIZE(mt8195_input_fmts));
> > +
> > +     if (((rx_linkrate * mtk_dp->train_info.lane_count) <
> > +          (mode->clock * 24 / 8)) &&
> > +         ((rx_linkrate * mtk_dp->train_info.lane_count) >
> > +          (mode->clock * 16 / 8)) &&
> > +         (display_info->color_formats & DRM_COLOR_FORMAT_YCRCB422))
> > {
> > +             kfree(input_fmts);
> > +             input_fmts = kcalloc(1, sizeof(*input_fmts),
> > GFP_KERNEL);
> > +             *num_input_fmts = 1;
> > +             input_fmts[0] = MEDIA_BUS_FMT_YUYV8_1X16;
> > +     }
> > +
> > +     return input_fmts;
> > +}
> > +
>
> [snip]
>
> > +
> > +static int mtk_dp_probe(struct platform_device *pdev)
> > +{
> > +     struct mtk_dp *mtk_dp;
> > +     struct device *dev = &pdev->dev;
> > +     int ret;
> > +     int irq_num = 0;
> > +
> > +     mtk_dp = devm_kzalloc(dev, sizeof(*mtk_dp), GFP_KERNEL);
> > +     if (!mtk_dp)
> > +             return -ENOMEM;
> > +
> > +     mtk_dp->dev = dev;
> > +
> > +     irq_num = platform_get_irq(pdev, 0);
> > +     if (irq_num < 0) {
> > +             dev_err(dev, "failed to request dp irq resource\n");
> > +             return irq_num;
> > +     }
> > +
> > +     mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
> > 1, 0);
> > +     if (IS_ERR(mtk_dp->next_bridge)) {
> > +             ret = PTR_ERR(mtk_dp->next_bridge);
> > +             dev_err_probe(dev, ret, "Failed to get bridge\n");
> > +             return ret;
> > +     }
> > +
> > +     ret = mtk_dp_dt_parse(mtk_dp, pdev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     mtk_dp_aux_init(mtk_dp);
> > +
> > +     ret = devm_request_threaded_irq(dev, irq_num, mtk_dp_hpd_event,
> > +                                     mtk_dp_hpd_event_thread,
> > +                                     IRQ_TYPE_LEVEL_HIGH,
> > dev_name(dev),
> > +                                     mtk_dp);
>
> Embedded displayport is always connected, right? Why do we need process
> hot plug? Move this to the patch of external displayport.
>
That was my initial plan, remove all the HPD related "stuff"... but something
is being done in the irq that is needed to get eDP working.
I haven't been able to retrieve the EDID with the irq removed.

As I'm not knowledgeable in this domain or on the architecture, I couldn't
get to the bottom of it with the available documentation I have.

Probably something is done in the irq for eDP that should happen outside?
I will try for v9 to remove hot plug detection entirely for the
initial eDP support.

> > +     if (ret) {
> > +             dev_err(dev, "failed to request mediatek dptx irq\n");
> > +             return -EPROBE_DEFER;
> > +     }
> > +
> > +     mutex_init(&mtk_dp->dp_lock);
>
> Why need dp_lock, please provide the case information.
>
> > +     mutex_init(&mtk_dp->edid_lock);
>
> edid_lock is necessary when irq exist.
>
> > +
> > +     platform_set_drvdata(pdev, mtk_dp);
> > +
> > +     mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-
> > dp-phy",
> > +                                                     PLATFORM_DEVID_
> > AUTO,
> > +                                                     &mtk_dp->regs,
> > +                                                     sizeof(struct
> > regmap *));
> > +     if (IS_ERR(mtk_dp->phy_dev)) {
> > +             dev_err(dev, "Failed to create device mediatek-dp-phy:
> > %ld\n",
> > +                     PTR_ERR(mtk_dp->phy_dev));
> > +             return PTR_ERR(mtk_dp->phy_dev);
> > +     }
> > +
> > +     mtk_dp_get_calibration_data(mtk_dp);
> > +
> > +     mtk_dp->phy = devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
> > +     if (IS_ERR(mtk_dp->phy)) {
> > +             dev_err(dev, "Failed to get phy: %ld\n",
> > PTR_ERR(mtk_dp->phy));
> > +             platform_device_unregister(mtk_dp->phy_dev);
> > +             return PTR_ERR(mtk_dp->phy);
> > +     }
> > +
> > +     mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
> > +     mtk_dp->bridge.of_node = dev->of_node;
> > +     mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
> > +
> > +     mtk_dp->bridge.ops =
> > +             DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> > DRM_BRIDGE_OP_HPD;
>
> DRM_BRIDGE_OP_DETECT? DRM_BRIDGE_OP_HPD?
>
> > +     drm_bridge_add(&mtk_dp->bridge);
> > +
> > +     pm_runtime_enable(dev);
> > +     pm_runtime_get_sync(dev);
> > +
> > +     return 0;
> > +}
> > +
> >
>
> [snip]
>
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> > b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> > new file mode 100644
> > index 0000000000000..79952ac30e9e6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> > @@ -0,0 +1,568 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2019 MediaTek Inc.
> > + * Copyright (c) 2021 BayLibre
> > + */
> > +#ifndef _MTK_DP_REG_H_
> > +#define _MTK_DP_REG_H_
> > +
> > +#define MTK_DP_SIP_CONTROL_AARCH32 0x82000523
> > +#define MTK_DP_SIP_ATF_VIDEO_UNMUTE 0x20
> > +#define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE 0x21
> > +
> > +#define DP_PHY_GLB_BIAS_GEN_00 0x0000
> > +#define RG_XTP_GLB_BIAS_INTR_CTRL (0x1f << 16)
> > +
> > +#define DP_PHY_GLB_DPAUX_TX 0x0008
> > +#define RG_CKM_PT0_CKTX_IMPSEL (0xf << 20)
> > +
> > +#define DP_PHY_LANE_TX_0 0x104
> > +#define RG_XTP_LN0_TX_IMPSEL_PMOS (0xf << 12)
> > +#define RG_XTP_LN0_TX_IMPSEL_NMOS (0xf << 16)
> > +
> > +#define DP_PHY_LANE_TX_1 0x204
> > +#define RG_XTP_LN1_TX_IMPSEL_PMOS (0xf << 12)
> > +#define RG_XTP_LN1_TX_IMPSEL_NMOS (0xf << 16)
> > +
> > +#define DP_PHY_LANE_TX_2 0x304
> > +#define RG_XTP_LN2_TX_IMPSEL_PMOS (0xf << 12)
> > +#define RG_XTP_LN2_TX_IMPSEL_NMOS (0xf << 16)
> > +
> > +#define DP_PHY_LANE_TX_3 0x404
> > +#define RG_XTP_LN3_TX_IMPSEL_PMOS (0xf << 12)
> > +#define RG_XTP_LN3_TX_IMPSEL_NMOS (0xf << 16)
>
> These register should be controlled by dp_phy driver?
>
> Regards,
> CK
>
> > +
> > +#define TOP_OFFSET 0x2000
> > +#define ENC0_OFFSET 0x3000
> > +#define ENC1_OFFSET 0x3200
> > +#define TRANS_OFFSET 0x3400
> > +#define AUX_OFFSET 0x3600
> > +#define SEC_OFFSET 0x4000
> > +
> >
>

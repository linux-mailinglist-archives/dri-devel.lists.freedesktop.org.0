Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0458D40F935
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 15:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010576EC7E;
	Fri, 17 Sep 2021 13:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331CC6EC7E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 13:33:53 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d6so15157299wrc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=thxagZzw84KIZ4OOL61CCF3d94ruMbQm+1MKuqIKfQU=;
 b=vakfwMKAq452jWcwHEkMrc1jMHWd5odWsm28+zIBgtWicPmIXHqid9L49iN2agn8q4
 XKwjIv05pB84gv4oQTuHzXAkpTEejLeC3IH/1DuGZmD//ySYvWsqAR1Xz1mmuEP6DM2I
 MWjLoA4YUkA/VUlO3UpTaWckmFc29zpoqSanwS7+dJWk+v+AvaNnib9R7D4UYtAgAEbG
 dwsyzIO5d7iJ4hzC/zJknHeTQDRrKY3BDgMNGJ9mDcmatRTpgvBrUqdfxjN50rHuPtU7
 WdikzgC4Su5vt8zXhiSbOT48QvafxNpkCCMsWTMVVoBhULD9j3pQ2x1lW9w95POxrVV+
 k/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=thxagZzw84KIZ4OOL61CCF3d94ruMbQm+1MKuqIKfQU=;
 b=V7pnPOGirA88dO65ckqR/iRy0L9Z0KxA38/1kDemD4XdalnX9HBOc9bp4xOHTs8sRd
 h+SR3WSNnpy4HKCyuzK3xQv5rrU9cpNom7aFMYYEXdW4gD003vulsCwD2NNyRkhCOZ2w
 Y3frg4A9qt3Wdg3oM82AV5VNc45+yAqkKim8NcpKHLQ8APVNHYRwPfXiTwrscys0JtLW
 HtUMvszssyPXXUU28wVTvm02kiXZS0kRRsIULtgT8lPT2LvzmpUYznSLakDPwHqfaVEY
 IY1+n8NPKdfEDYoj9OUpGtVM89oWC8h8pQGdbZXjddG8obC2blQdNBXKeRsmxC/8yjdq
 LXGA==
X-Gm-Message-State: AOAM531xHZkdZPWZkiTjIsOInHGcyAWSuWCD0Q+PraF/DjH2/YlR52Nf
 SsraS3lzYMv+1oTvTKcI3+N75A==
X-Google-Smtp-Source: ABdhPJx02rCVBOb8bRTCjvTGCOQ4xaR8puL9Bo0Jmuvg8uEZ9H1DqX28KWvv3/iB/pa1oCulaveHrg==
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr12006925wrw.330.1631885631689; 
 Fri, 17 Sep 2021 06:33:51 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id c135sm10830934wme.6.2021.09.17.06.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 06:33:51 -0700 (PDT)
Date: Fri, 17 Sep 2021 15:33:49 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 6/6] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <20210917133349.ijkf3nzisluynhhp@blmsp>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-7-msp@baylibre.com>
 <CAAOTY__cJMqcAieEraJ2sz4gi0Zs-aiNXz38_x7dPQea6HvYEg@mail.gmail.com>
 <20210910053614.7l2yh3e25izzlwob@blmsp>
 <CAAOTY_-gUXZnpfEC9e9HY+Sde9gw_WCe7CzEQ6d45_gW2voD6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAOTY_-gUXZnpfEC9e9HY+Sde9gw_WCe7CzEQ6d45_gW2voD6A@mail.gmail.com>
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

Hi Chun-Kuang,

On Tue, Sep 14, 2021 at 07:25:48AM +0800, Chun-Kuang Hu wrote:
> Hi, Markus:
> 
> Markus Schneider-Pargmann <msp@baylibre.com> 於 2021年9月10日 週五 下午1:36寫道：
> >
> > Hi Chun-Kuang,
> >
> > On Fri, Sep 10, 2021 at 07:37:50AM +0800, Chun-Kuang Hu wrote:
> > > Hi, Markus:
> > >
> > > Markus Schneider-Pargmann <msp@baylibre.com> 於 2021年9月7日 週二 上午3:37寫道：
> > > >
> > > > This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> > > >
> > > > It supports both functional units on the mt8195, the embedded
> > > > DisplayPort as well as the external DisplayPort units. It offers
> > > > hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> > > > to 4 lanes.
> > > >
> > > > This driver is based on an initial version by
> > > > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > > >
> > > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > > ---
> > > >
> > > > Notes:
> > > >     Changes RFC -> v1:
> > > >     - Removed unused register definitions.
> > > >     - Replaced workqueue with threaded irq.
> > > >     - Removed connector code.
> > > >     - Move to atomic_* drm functions.
> > > >     - General cleanups of the code.
> > > >     - Remove unused select GENERIC_PHY.
> > > >
> > > >  drivers/gpu/drm/mediatek/Kconfig      |    6 +
> > > >  drivers/gpu/drm/mediatek/Makefile     |    2 +
> > > >  drivers/gpu/drm/mediatek/mtk_dp.c     | 2881 +++++++++++++++++++++++++
> > > >  drivers/gpu/drm/mediatek/mtk_dp_reg.h |  580 +++++
> > > >  4 files changed, 3469 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
> > > >  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> > > >
> >
> > ...
> >
> > > > +#define TOP_OFFSET             0x2000
> > > > +#define ENC0_OFFSET            0x3000
> > > > +#define ENC1_OFFSET            0x3200
> > > > +#define TRANS_OFFSET           0x3400
> > > > +#define AUX_OFFSET             0x3600
> > > > +#define SEC_OFFSET             0x4000
> >
> > ...
> >
> > > > +
> > > > +#define DP_PHY_DIG_PLL_CTL_1                                   0x1014
> > > > +# define TPLL_SSC_EN                                           BIT(3)
> > >
> > > It seems that register 0x1000 ~ 0x1fff is to control phy and 0x2000 ~
> > > 0x4fff is to control non-phy part. For mipi and hdmi, the phy part is
> > > an independent device [1] and the phy driver is independent [2] , so I
> > > would like this phy to be an independent device.
> > >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/mediatek/mt8173.dtsi?h=v5.14
> > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/phy/mediatek?h=v5.14
> >
> > Thanks for your feedback. I looked into both mipi and hdmi phy drivers
> > that you referenced. It looks like both are really separate units in
> > their SoCs having their own registerspaces located at a completely
> > different range than the units using the phy.
> >
> > For this displayport driver, the phy registers are listed as part of the
> > (e)DP_TX unit in the datasheet. Next to the phy registers all the other
> > parts are listed as well in the same overall register ranges (see
> > above), e.g. TOP_OFFSET, ENC_OFFSET or SEC_OFFSET. Also I would like to
> > avoid splitting it up into a separate unit in the devicetree as the
> > datasheet handles it as a single unit (including the phy registers).
> 
> OK, according to the datasheet, let it to be a single device.
> 
> >
> > From a practical perspective there is also not much to these PHY
> > registers. The only things that would be done in the driver are:
> > - initializing the lane driving parameters with static values
> > - setup the bitrate
> > - enable/disable SSC
> > - do a reset
> > Exporting these four used functions over a driver boundary wouldn't help
> > clarity I think and the code probably can't be reused by any other
> > component anyways.
> 
> Use mmsys device [1] as an example. mmsys has both clock control
> function and other function including routing function. The main
> driver [2] is placed in soc folder, and the clock control part [3] is
> separated to clk folder but the clock control part just simply control
> clock gating.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/mediatek/mt8173.dtsi?h=v5.15-rc1#n992
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/mediatek/mtk-mmsys.c?h=v5.15-rc1
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/mediatek/clk-mt8173-mm.c?h=v5.15-rc1
> 
> I think many phy driver could be used only by single device driver, so
> we don't need to consider the reusability.

Thank you, I have split of a display port phy similar to the patches you
cited. I will send the next version soon.

Another short question. This series has a functional dependency on the
rest of the video pipeline, so mostly the patch series vdosys0 and
vdosys1. So I suppose the theoretical order for merging (once this
series is ready for merge) is first vdosys0/1 and dependencies and then
this displayport series, is that correct?

Thanks,
Markus

> 
> Regards,
> Chun-Kuang.
> 
> >
> > So I personally would prefer keeping it as part of the whole driver
> > because of the above mentioned reasons. What do you think?
> >
> > Thanks,
> > Markus
> >
> > >
> > > Regards,
> > > Chun-Kuang.
> > >
> > > > +
> > > > +#define DP_PHY_DIG_BIT_RATE                                    0x103C
> > > > +# define BIT_RATE_RBR                                          0
> > > > +# define BIT_RATE_HBR                                          1
> > > > +# define BIT_RATE_HBR2                                         2
> > > > +# define BIT_RATE_HBR3                                         3
> > > > +
> > > > +#define DP_PHY_DIG_SW_RST                                      0x1038
> > > > +# define DP_GLB_SW_RST_PHYD                                    BIT(0)
> > > > +
> > > > +#define MTK_DP_LANE0_DRIVING_PARAM_3                           0x1138
> > > > +#define MTK_DP_LANE1_DRIVING_PARAM_3                           0x1238
> > > > +#define MTK_DP_LANE2_DRIVING_PARAM_3                           0x1338
> > > > +#define MTK_DP_LANE3_DRIVING_PARAM_3                           0x1438
> > > > +# define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT                     0x10
> > > > +# define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT                     (0x14 << 8)
> > > > +# define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT                     (0x18 << 16)
> > > > +# define XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT                     (0x20 << 24)
> > > > +# define DRIVING_PARAM_3_DEFAULT                               (XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT | \
> > > > +                                                                XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT | \
> > > > +                                                                XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT | \
> > > > +                                                                XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT)
> > > > +
> > > > +#define MTK_DP_LANE0_DRIVING_PARAM_4                           0x113C
> > > > +#define MTK_DP_LANE1_DRIVING_PARAM_4                           0x123C
> > > > +#define MTK_DP_LANE2_DRIVING_PARAM_4                           0x133C
> > > > +#define MTK_DP_LANE3_DRIVING_PARAM_4                           0x143C
> > > > +# define XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT                     0x18
> > > > +# define XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT                     (0x1e << 8)
> > > > +# define XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT                     (0x24 << 16)
> > > > +# define XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT                     (0x20 << 24)
> > > > +# define DRIVING_PARAM_4_DEFAULT                               (XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT | \
> > > > +                                                                XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT | \
> > > > +                                                                XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT | \
> > > > +                                                                XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT)
> > > > +
> > > > +#define MTK_DP_LANE0_DRIVING_PARAM_5                           0x1140
> > > > +#define MTK_DP_LANE1_DRIVING_PARAM_5                           0x1240
> > > > +#define MTK_DP_LANE2_DRIVING_PARAM_5                           0x1340
> > > > +#define MTK_DP_LANE3_DRIVING_PARAM_5                           0x1440
> > > > +# define XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT                     0x28
> > > > +# define XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT                     (0x30 << 8)
> > > > +# define DRIVING_PARAM_5_DEFAULT                               (XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT | \
> > > > +                                                                XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT)
> > > > +
> > > > +#define MTK_DP_LANE0_DRIVING_PARAM_6                           0x1144
> > > > +#define MTK_DP_LANE1_DRIVING_PARAM_6                           0x1244
> > > > +#define MTK_DP_LANE2_DRIVING_PARAM_6                           0x1344
> > > > +#define MTK_DP_LANE3_DRIVING_PARAM_6                           0x1444
> > > > +# define XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT                    0x00
> > > > +# define XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT                    (0x04 << 8)
> > > > +# define XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT                    (0x08 << 16)
> > > > +# define XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT                    (0x10 << 24)
> > > > +# define DRIVING_PARAM_6_DEFAULT                               (XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT | \
> > > > +                                                                XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT | \
> > > > +                                                                XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT | \
> > > > +                                                                XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT)
> > > > +
> > > > +#define MTK_DP_LANE0_DRIVING_PARAM_7                           0x1148
> > > > +#define MTK_DP_LANE1_DRIVING_PARAM_7                           0x1248
> > > > +#define MTK_DP_LANE2_DRIVING_PARAM_7                           0x1348
> > > > +#define MTK_DP_LANE3_DRIVING_PARAM_7                           0x1448
> > > > +# define XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT                    0x00
> > > > +# define XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT                    (0x06 << 8)
> > > > +# define XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT                    (0x0c << 16)
> > > > +# define XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT                    (0x00 << 24)
> > > > +# define DRIVING_PARAM_7_DEFAULT                               (XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT | \
> > > > +                                                                XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT | \
> > > > +                                                                XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT | \
> > > > +                                                                XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT)
> > > > +
> > > > +#define MTK_DP_LANE0_DRIVING_PARAM_8                           0x114C
> > > > +#define MTK_DP_LANE1_DRIVING_PARAM_8                           0x124C
> > > > +#define MTK_DP_LANE2_DRIVING_PARAM_8                           0x134C
> > > > +#define MTK_DP_LANE3_DRIVING_PARAM_8                           0x144C
> > > > +# define XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT                    0x08
> > > > +# define XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT                    (0x00 << 8)
> > > > +# define DRIVING_PARAM_8_DEFAULT                               (XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
> > > > +                                                                XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
> > > > +
> > > > +#endif /*_MTK_DP_REG_H_*/
> > > > --
> > > > 2.33.0
> > > >

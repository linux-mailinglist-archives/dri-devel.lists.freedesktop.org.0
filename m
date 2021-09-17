Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B014E40FA49
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 16:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500758919F;
	Fri, 17 Sep 2021 14:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C438919F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 14:36:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 455A761212
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 14:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631889400;
 bh=LjSxj1XBlKgAPPzPlXvlhN2p+T8VSQNkZbF40pCoLRI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kdrZ9Pj+adXDgJmXm3Hg22wzUWz8fveNB9EogiJ0jdoL1POtjxq7meuGEXIBJj/8U
 UTFVJT0iJ39Yhc34lmBBjrDwirsnkIzrTDNYB4kfWq1lyvXZ5KxlGHzC/V8Ik/yVr9
 QTF9m+Usz4ToJgl0tjOuHwF3+8BwVtwvXoCJCA2V5liEXO1yMsDVON9qBi3SXX8QE3
 7hrvqZipbevMzLLqRRdhcIpXZxavskUUFFylmY14kidgc+I6oUH232TvriNq1/BjmT
 pG9XD7ASSTI4TB+DVGAOrCYd19AtoOnLBiZv/FSUCG8qchNm7H6hjldqzjJxxhC3RF
 be67l+7iDcvpA==
Received: by mail-ed1-f49.google.com with SMTP id c22so30821741edn.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 07:36:40 -0700 (PDT)
X-Gm-Message-State: AOAM5312wmusWbb3cGURq25TBtr3JYT+42TzwRDVsI4Ns7fND4ZPFkqB
 iqfHv1iE87apYHQx29kADR2EvMf25tweLyhfTw==
X-Google-Smtp-Source: ABdhPJyZvRqQ0d3E5FolvKa2G6pLvn6s/+N8iV8B5Cb9QerkwmFSK2ePOP7e8BvLitlJDfmOK+pguwuGUQWHdASNW48=
X-Received: by 2002:aa7:c617:: with SMTP id h23mr12679068edq.357.1631889398119; 
 Fri, 17 Sep 2021 07:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-7-msp@baylibre.com>
 <CAAOTY__cJMqcAieEraJ2sz4gi0Zs-aiNXz38_x7dPQea6HvYEg@mail.gmail.com>
 <20210910053614.7l2yh3e25izzlwob@blmsp>
 <CAAOTY_-gUXZnpfEC9e9HY+Sde9gw_WCe7CzEQ6d45_gW2voD6A@mail.gmail.com>
 <20210917133349.ijkf3nzisluynhhp@blmsp>
In-Reply-To: <20210917133349.ijkf3nzisluynhhp@blmsp>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 17 Sep 2021 22:36:26 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9sbCMdzjeo=fR1GWLi6mnVgqczr64J9ZqyExW=knw1KQ@mail.gmail.com>
Message-ID: <CAAOTY_9sbCMdzjeo=fR1GWLi6mnVgqczr64J9ZqyExW=knw1KQ@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] drm/mediatek: Add mt8195 DisplayPort driver
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Markus:

Markus Schneider-Pargmann <msp@baylibre.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=
=8817=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:33=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Hi Chun-Kuang,
>
> On Tue, Sep 14, 2021 at 07:25:48AM +0800, Chun-Kuang Hu wrote:
> > Hi, Markus:
> >
> > Markus Schneider-Pargmann <msp@baylibre.com> =E6=96=BC 2021=E5=B9=B49=
=E6=9C=8810=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=881:36=E5=AF=AB=E9=
=81=93=EF=BC=9A
> > >
> > > Hi Chun-Kuang,
> > >
> > > On Fri, Sep 10, 2021 at 07:37:50AM +0800, Chun-Kuang Hu wrote:
> > > > Hi, Markus:
> > > >
> > > > Markus Schneider-Pargmann <msp@baylibre.com> =E6=96=BC 2021=E5=B9=
=B49=E6=9C=887=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=883:37=E5=AF=AB=
=E9=81=93=EF=BC=9A
> > > > >
> > > > > This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> > > > >
> > > > > It supports both functional units on the mt8195, the embedded
> > > > > DisplayPort as well as the external DisplayPort units. It offers
> > > > > hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 w=
ith up
> > > > > to 4 lanes.
> > > > >
> > > > > This driver is based on an initial version by
> > > > > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > > > >
> > > > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > > > ---
> > > > >
> > > > > Notes:
> > > > >     Changes RFC -> v1:
> > > > >     - Removed unused register definitions.
> > > > >     - Replaced workqueue with threaded irq.
> > > > >     - Removed connector code.
> > > > >     - Move to atomic_* drm functions.
> > > > >     - General cleanups of the code.
> > > > >     - Remove unused select GENERIC_PHY.
> > > > >
> > > > >  drivers/gpu/drm/mediatek/Kconfig      |    6 +
> > > > >  drivers/gpu/drm/mediatek/Makefile     |    2 +
> > > > >  drivers/gpu/drm/mediatek/mtk_dp.c     | 2881 +++++++++++++++++++=
++++++
> > > > >  drivers/gpu/drm/mediatek/mtk_dp_reg.h |  580 +++++
> > > > >  4 files changed, 3469 insertions(+)
> > > > >  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
> > > > >  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> > > > >
> > >
> > > ...
> > >
> > > > > +#define TOP_OFFSET             0x2000
> > > > > +#define ENC0_OFFSET            0x3000
> > > > > +#define ENC1_OFFSET            0x3200
> > > > > +#define TRANS_OFFSET           0x3400
> > > > > +#define AUX_OFFSET             0x3600
> > > > > +#define SEC_OFFSET             0x4000
> > >
> > > ...
> > >
> > > > > +
> > > > > +#define DP_PHY_DIG_PLL_CTL_1                                   0=
x1014
> > > > > +# define TPLL_SSC_EN                                           B=
IT(3)
> > > >
> > > > It seems that register 0x1000 ~ 0x1fff is to control phy and 0x2000=
 ~
> > > > 0x4fff is to control non-phy part. For mipi and hdmi, the phy part =
is
> > > > an independent device [1] and the phy driver is independent [2] , s=
o I
> > > > would like this phy to be an independent device.
> > > >
> > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/arch/arm64/boot/dts/mediatek/mt8173.dtsi?h=3Dv5.14
> > > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/drivers/phy/mediatek?h=3Dv5.14
> > >
> > > Thanks for your feedback. I looked into both mipi and hdmi phy driver=
s
> > > that you referenced. It looks like both are really separate units in
> > > their SoCs having their own registerspaces located at a completely
> > > different range than the units using the phy.
> > >
> > > For this displayport driver, the phy registers are listed as part of =
the
> > > (e)DP_TX unit in the datasheet. Next to the phy registers all the oth=
er
> > > parts are listed as well in the same overall register ranges (see
> > > above), e.g. TOP_OFFSET, ENC_OFFSET or SEC_OFFSET. Also I would like =
to
> > > avoid splitting it up into a separate unit in the devicetree as the
> > > datasheet handles it as a single unit (including the phy registers).
> >
> > OK, according to the datasheet, let it to be a single device.
> >
> > >
> > > From a practical perspective there is also not much to these PHY
> > > registers. The only things that would be done in the driver are:
> > > - initializing the lane driving parameters with static values
> > > - setup the bitrate
> > > - enable/disable SSC
> > > - do a reset
> > > Exporting these four used functions over a driver boundary wouldn't h=
elp
> > > clarity I think and the code probably can't be reused by any other
> > > component anyways.
> >
> > Use mmsys device [1] as an example. mmsys has both clock control
> > function and other function including routing function. The main
> > driver [2] is placed in soc folder, and the clock control part [3] is
> > separated to clk folder but the clock control part just simply control
> > clock gating.
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/arch/arm64/boot/dts/mediatek/mt8173.dtsi?h=3Dv5.15-rc1#n992
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/soc/mediatek/mtk-mmsys.c?h=3Dv5.15-rc1
> > [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/clk/mediatek/clk-mt8173-mm.c?h=3Dv5.15-rc1
> >
> > I think many phy driver could be used only by single device driver, so
> > we don't need to consider the reusability.
>
> Thank you, I have split of a display port phy similar to the patches you
> cited. I will send the next version soon.
>
> Another short question. This series has a functional dependency on the
> rest of the video pipeline, so mostly the patch series vdosys0 and
> vdosys1. So I suppose the theoretical order for merging (once this
> series is ready for merge) is first vdosys0/1 and dependencies and then
> this displayport series, is that correct?

Sometimes I would apply partial reviewed patches in a series. Even
though these partial patches would not functionally work without other
patches, they are so independent and I would like to apply them to
prevent conflicts in the future. But these patches should build pass
and not break other workable function.

Regards,
Chun-Kuang.

>
> Thanks,
> Markus
>
> >
> > Regards,
> > Chun-Kuang.
> >
> > >
> > > So I personally would prefer keeping it as part of the whole driver
> > > because of the above mentioned reasons. What do you think?
> > >
> > > Thanks,
> > > Markus
> > >
> > > >
> > > > Regards,
> > > > Chun-Kuang.
> > > >
> > > > > +
> > > > > +#define DP_PHY_DIG_BIT_RATE                                    0=
x103C
> > > > > +# define BIT_RATE_RBR                                          0
> > > > > +# define BIT_RATE_HBR                                          1
> > > > > +# define BIT_RATE_HBR2                                         2
> > > > > +# define BIT_RATE_HBR3                                         3
> > > > > +
> > > > > +#define DP_PHY_DIG_SW_RST                                      0=
x1038
> > > > > +# define DP_GLB_SW_RST_PHYD                                    B=
IT(0)
> > > > > +
> > > > > +#define MTK_DP_LANE0_DRIVING_PARAM_3                           0=
x1138
> > > > > +#define MTK_DP_LANE1_DRIVING_PARAM_3                           0=
x1238
> > > > > +#define MTK_DP_LANE2_DRIVING_PARAM_3                           0=
x1338
> > > > > +#define MTK_DP_LANE3_DRIVING_PARAM_3                           0=
x1438
> > > > > +# define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT                     0=
x10
> > > > > +# define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT                     (=
0x14 << 8)
> > > > > +# define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT                     (=
0x18 << 16)
> > > > > +# define XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT                     (=
0x20 << 24)
> > > > > +# define DRIVING_PARAM_3_DEFAULT                               (=
XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT | \
> > > > > +                                                                =
XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT | \
> > > > > +                                                                =
XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT | \
> > > > > +                                                                =
XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT)
> > > > > +
> > > > > +#define MTK_DP_LANE0_DRIVING_PARAM_4                           0=
x113C
> > > > > +#define MTK_DP_LANE1_DRIVING_PARAM_4                           0=
x123C
> > > > > +#define MTK_DP_LANE2_DRIVING_PARAM_4                           0=
x133C
> > > > > +#define MTK_DP_LANE3_DRIVING_PARAM_4                           0=
x143C
> > > > > +# define XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT                     0=
x18
> > > > > +# define XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT                     (=
0x1e << 8)
> > > > > +# define XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT                     (=
0x24 << 16)
> > > > > +# define XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT                     (=
0x20 << 24)
> > > > > +# define DRIVING_PARAM_4_DEFAULT                               (=
XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT | \
> > > > > +                                                                =
XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT | \
> > > > > +                                                                =
XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT | \
> > > > > +                                                                =
XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT)
> > > > > +
> > > > > +#define MTK_DP_LANE0_DRIVING_PARAM_5                           0=
x1140
> > > > > +#define MTK_DP_LANE1_DRIVING_PARAM_5                           0=
x1240
> > > > > +#define MTK_DP_LANE2_DRIVING_PARAM_5                           0=
x1340
> > > > > +#define MTK_DP_LANE3_DRIVING_PARAM_5                           0=
x1440
> > > > > +# define XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT                     0=
x28
> > > > > +# define XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT                     (=
0x30 << 8)
> > > > > +# define DRIVING_PARAM_5_DEFAULT                               (=
XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT | \
> > > > > +                                                                =
XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT)
> > > > > +
> > > > > +#define MTK_DP_LANE0_DRIVING_PARAM_6                           0=
x1144
> > > > > +#define MTK_DP_LANE1_DRIVING_PARAM_6                           0=
x1244
> > > > > +#define MTK_DP_LANE2_DRIVING_PARAM_6                           0=
x1344
> > > > > +#define MTK_DP_LANE3_DRIVING_PARAM_6                           0=
x1444
> > > > > +# define XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT                    0=
x00
> > > > > +# define XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT                    (=
0x04 << 8)
> > > > > +# define XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT                    (=
0x08 << 16)
> > > > > +# define XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT                    (=
0x10 << 24)
> > > > > +# define DRIVING_PARAM_6_DEFAULT                               (=
XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT | \
> > > > > +                                                                =
XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT | \
> > > > > +                                                                =
XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT | \
> > > > > +                                                                =
XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT)
> > > > > +
> > > > > +#define MTK_DP_LANE0_DRIVING_PARAM_7                           0=
x1148
> > > > > +#define MTK_DP_LANE1_DRIVING_PARAM_7                           0=
x1248
> > > > > +#define MTK_DP_LANE2_DRIVING_PARAM_7                           0=
x1348
> > > > > +#define MTK_DP_LANE3_DRIVING_PARAM_7                           0=
x1448
> > > > > +# define XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT                    0=
x00
> > > > > +# define XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT                    (=
0x06 << 8)
> > > > > +# define XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT                    (=
0x0c << 16)
> > > > > +# define XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT                    (=
0x00 << 24)
> > > > > +# define DRIVING_PARAM_7_DEFAULT                               (=
XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT | \
> > > > > +                                                                =
XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT | \
> > > > > +                                                                =
XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT | \
> > > > > +                                                                =
XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT)
> > > > > +
> > > > > +#define MTK_DP_LANE0_DRIVING_PARAM_8                           0=
x114C
> > > > > +#define MTK_DP_LANE1_DRIVING_PARAM_8                           0=
x124C
> > > > > +#define MTK_DP_LANE2_DRIVING_PARAM_8                           0=
x134C
> > > > > +#define MTK_DP_LANE3_DRIVING_PARAM_8                           0=
x144C
> > > > > +# define XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT                    0=
x08
> > > > > +# define XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT                    (=
0x00 << 8)
> > > > > +# define DRIVING_PARAM_8_DEFAULT                               (=
XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
> > > > > +                                                                =
XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
> > > > > +
> > > > > +#endif /*_MTK_DP_REG_H_*/
> > > > > --
> > > > > 2.33.0
> > > > >

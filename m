Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFA8307EED
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EEF6EA1A;
	Thu, 28 Jan 2021 19:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852BE6E901
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 08:41:56 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id h11so4724080ioh.11
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 00:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mu1RhY5vdfd0PTGfJwJGRCpzx0IqBE4gizmtkvOgrag=;
 b=jkiPQtgKKFoLMfK+SFzZuQc0bycRMssH7w1bBAF7dDfG9hUkPsyg3rqsBsZ7q9bsc5
 xWGTX7X8OxS6qjRZ6u0va7mjVOemzy1AwSRTrVSqMK3wkmyfVqa4TP2sD6s12W8a/5qT
 ruHgEeJDLUy8NNS2DSVNt0qk2kjDH0SrYWz28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mu1RhY5vdfd0PTGfJwJGRCpzx0IqBE4gizmtkvOgrag=;
 b=uaOLmgx+r4Fck7m6VYN8y7IAxejEUl9X8dWfNmEw16W0RGNjkXpnxCJmfykgdrF3+F
 S+svOQViDEV616fx7QaLV9Iq6eHb+yqd5RBvMESyb+mKGiGWtwFchnEhzOnOVKWemGdB
 RACJp3Z1GoCkmus+msXvoVJQrHA0vNqz849rP2tNKUrAF50sSySNPhsX+tx3Ya0Ib4yZ
 TfkH1m+kZc9tfvXaxXxIBp6Fo6UxW6HC6mW8o87fTH64axElSfeoEZDHc58BvO3RP0GB
 pyQiOPzJR/ZA2+HpmwH7F/jFTaxTmAO/aEmYB+dr8v51kvJh3/l4o8hcfdKGv5c1Kac5
 ZspQ==
X-Gm-Message-State: AOAM5332Mcuyeb9ToBmqq9UHv3m221Cpof0Elwwh10euweRvIzZ0NTMH
 doFKDu3zy3I4aF2WxXVhYuWP7nGM8CEzaWCb9FKFiut3a2Sc+g==
X-Google-Smtp-Source: ABdhPJzZiOa3nQIoXOADguUymQXk0d1c2N5Z23LxFqwIuGzQUSONJoOQ2Z0t9YOgq72GDzGog90V2y/lROFB/q16NIY=
X-Received: by 2002:a02:aa9a:: with SMTP id u26mr12050398jai.4.1611823315806; 
 Thu, 28 Jan 2021 00:41:55 -0800 (PST)
MIME-Version: 1.0
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-8-hsinyi@chromium.org>
 <1611819766.16091.4.camel@mtksdaap41> <1611820770.1947.8.camel@mhfsdcap03>
 <1611821233.18369.4.camel@mtksdaap41> <1611821396.1947.10.camel@mhfsdcap03>
 <CAJMQK-h1_d1+SpxMC8LGPJK=X9HHoJ_ueFzV2Sq44buCiaXFUA@mail.gmail.com>
 <1611822524.23925.4.camel@mtksdaap41> <1611822729.1947.14.camel@mhfsdcap03>
In-Reply-To: <1611822729.1947.14.camel@mhfsdcap03>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 16:41:29 +0800
Message-ID: <CAJMQK-g9QRhLVM77KrTscYA74D_Kx1yxxwGN_Bk0dN2Z=Dp6Eg@mail.gmail.com>
Subject: Re: [PATCH v11 7/9] drm/mediatek: enable dither function
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 4:32 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> On Thu, 2021-01-28 at 16:28 +0800, CK Hu wrote:
> > On Thu, 2021-01-28 at 16:18 +0800, Hsin-Yi Wang wrote:
> > > On Thu, Jan 28, 2021 at 4:10 PM Yongqiang Niu
> > > <yongqiang.niu@mediatek.com> wrote:
> > > >
> > > > On Thu, 2021-01-28 at 16:07 +0800, CK Hu wrote:
> > > > > On Thu, 2021-01-28 at 15:59 +0800, Yongqiang Niu wrote:
> > > > > > On Thu, 2021-01-28 at 15:42 +0800, CK Hu wrote:
> > > > > > > Hi, Hsin-Yi:
> > > > > > >
> > > > > > > On Thu, 2021-01-28 at 15:28 +0800, Hsin-Yi Wang wrote:
> > > > > > > > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > > > > > >
> > > > > > > > for 5 or 6 bpc panel, we need enable dither function
> > > > > > > > to improve the display quality
> > > > > > > >
> > > > > > > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > > > > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 44 ++++++++++++++++++++-
> > > > > > > >  1 file changed, 43 insertions(+), 1 deletion(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > > > > > index 8173f709272be..e85625704d611 100644
> > > > > > > > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > > > > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > > > > > @@ -53,7 +53,9 @@
> > > > > > > >  #define DITHER_EN                              BIT(0)
> > > > > > > >  #define DISP_DITHER_CFG                                0x0020
> > > > > > > >  #define DITHER_RELAY_MODE                      BIT(0)
> > > > > > > > +#define DITHER_ENGINE_EN                       BIT(1)
> > > > > > > >  #define DISP_DITHER_SIZE                       0x0030
> > > > > > > > +#define DITHER_REG(idx)                                (0x100 + (idx) * 4)
> > > > > > > >
> > > > > > > >  #define LUT_10BIT_MASK                         0x03ff
> > > > > > > >
> > > > > > > > @@ -313,8 +315,48 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
> > > > > > > >  {
> > > > > > > >         struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > > > > > > >
> > > > > > > > +       bool enable = false;
> > > > > > > > +
> > > > > > > > +       /* default value for dither reg 5 to 14 */
> > > > > > > > +       const u32 dither_setting[] = {
> > > > > > > > +               0x00000000, /* 5 */
> > > > > > > > +               0x00003002, /* 6 */
> > > > > > > > +               0x00000000, /* 7 */
> > > > > > > > +               0x00000000, /* 8 */
> > > > > > > > +               0x00000000, /* 9 */
> > > > > > > > +               0x00000000, /* 10 */
> > > > > > > > +               0x00000000, /* 11 */
> > > > > > > > +               0x00000011, /* 12 */
> > > > > > > > +               0x00000000, /* 13 */
> > > > > > > > +               0x00000000, /* 14 */
> > > > > > >
> > > > > > > Could you explain what is this?
> > > > > >
> > > > > > this is dither 5 to dither 14 setting
> > > > > > this will be useless, we just need set dither 5 and dither 7 like
> > > > > > mtk_ddp_write(cmdq_pkt, 0, comp, DISP_DITHER_5);
> > > > > > mtk_ddp_write(cmdq_pkt, 0, comp, DISP_DITHER_7);
> > > > > > other value is same with hardware default value.
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > > +       };
> > > > > > > > +
> > > > > > > > +       if (bpc == 5 || bpc == 6) {
> > > > > > > > +               enable = true;
> > > > > > > > +               mtk_ddp_write(cmdq_pkt,
> > > > > > > > +                             DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
> > > > > > > > +                             DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
> > > > > > > > +                             DITHER_NEW_BIT_MODE,
> > > > > > > > +                             &priv->cmdq_reg, priv->regs, DITHER_REG(15));
> > > > > > > > +               mtk_ddp_write(cmdq_pkt,
> > > > > > > > +                             DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
> > > > > > > > +                             DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
> > > > > > > > +                             DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
> > > > > > > > +                             DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
> > > > > > >
> > > > > > > This result in 0x50505050, but previous version is 0x50504040, so this
> > > > > > > version is correct and previous version is incorrect?
> > > > > >
> > > > > > the new version set r g b 3 channel same, seams more reasonable
> > > > > >
> > > > > >
> > > > >
> > > > > So all the setting of DISP_DITHER_5, DISP_DITHER_7, DISP_DITHER_15,
> > > > > DISP_DITHER_16 is identical to mtk_dither_set(), so call
> > > > > mtk_dither_set() instead of duplication here.
> > > > >
> > > >
> > > > dither enable set in mtk_dither_set is
> > > > mtk_ddp_write(cmdq_pkt, DISP_DITHERING, comp, CFG);
> > > >
> > > > that is different 8183 and mt8192.
> > > > mt8173 dither enable in gamma is bit2
> > > > mt8183 and mt8192 dither engine enable is bit 1
> > > >
> > > >
> > >
> > > We can still call mtk_dither_set() for bpc is 5 or 6 here, though it
> > > will be set to bit2,
> > > but later in mtk_ddp_write(cmdq_pkt, enable ? DITHER_ENGINE_EN :
> > > DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG); it
> > > will be correct back to bit 1.
> > >
> > > Is this reasonable?
> >
> > Looks weird. Maybe pass some information into mtk_dither_set() to set
> > DISP_DITHERING correctly.
> >
> > I find one thing need to be fixed. CFG should be lower case.
>
> we could modify this like this:
>
> void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
>                     unsigned int cfg, u32 dither_enable, struct cmdq_pkt *cmdq_pkt)
>
>                 mtk_ddp_write(cmdq_pkt, dither_enable, comp, cfg);
>
>
>

Thanks, I'll add another flag to mtk_dither_set_common.

> >
> > Regards,
> > CK
> >
> > >
> > > > > Regards,
> > > > > CK
> > > > > > >
> > > > > > > Regards,
> > > > > > > CK
> > > > > > >
> > > > > > > > +                             &priv->cmdq_reg, priv->regs, DITHER_REG(16));
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +
> > > > > > > > +       if (enable) {
> > > > > > > > +               u32 idx;
> > > > > > > > +
> > > > > > > > +               for (idx = 0; idx < ARRAY_SIZE(dither_setting); idx++)
> > > > > > > > +                       mtk_ddp_write(cmdq_pkt, dither_setting[idx], &priv->cmdq_reg, priv->regs,
> > > > > > > > +                                     DITHER_REG(idx + 5));
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > >         mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
> > > > > > > > -       mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> > > > > > > > +        mtk_ddp_write(cmdq_pkt, enable ? DITHER_ENGINE_EN : DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static void mtk_dither_start(struct device *dev)
> > > > > > >
> > > > > > >
> > > > > >
> > > > > >
> > > > >
> > > > >
> > > >
> >
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

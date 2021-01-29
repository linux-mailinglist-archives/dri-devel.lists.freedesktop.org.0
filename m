Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE553086E2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 09:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE03B6EA9D;
	Fri, 29 Jan 2021 08:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77E36E1A2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 06:24:44 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id n2so8200713iom.7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 22:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fdJkTsg9QlUnIAnLN/MgMsR/0bzFNS4OEDx2HjTICTI=;
 b=DaP4BLsk6QESLETMI5yzpXlFJIxIWjfFE4SRMjXiEpS2L7GdeCmnAdlqfA/wLOKRwI
 2qU9SMKV6ITmkh3HEyOucBHFaRpRUXMFgWuo5suPTo53aa5sXbP1PnQ55SG+wQnNFU6i
 8Ek/SLF8oUWlPmdKNcZfkB/neWZV2GCVAOswU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fdJkTsg9QlUnIAnLN/MgMsR/0bzFNS4OEDx2HjTICTI=;
 b=dZz1bM4TOdVmqPFyQi6CYFyy+WvH3vTT3YOhDW+yYu961d1Pry5cFI00Uuhgt18Ot0
 LQfNSpWSq1Sly0n5FYKYNTxU3vlPmYSAJhQtQ9WWfVkHrCKFZkFMoiuU1KaY4smn3V20
 0i+k2Bo/d0QurdMHaX6tPM1+2F1taO32kOSEgf7gkQVruKc6tN+drv64k49AUtDCsjxx
 eueH6Qc8VuSjSKAGTeyGkOKLjTTs+oueOniKOLnsKUPJ0DOGYJrKpXy5R5sM71P55YQK
 egF9xXHZ3QSvF8fIdQr7LGKoN1qgNHGqklKLCWF1kAqX53VH0SmfGzSa/576V9r3JST8
 tjNw==
X-Gm-Message-State: AOAM5336sOdiCVsmKc4vE4KSl8Ns5yK+JgFVsnvmF5yT5pQVGOZiq78y
 vC9xu5BUnnY8WxohS5vEALDs8lfLkGvo8HiWiBuRzg==
X-Google-Smtp-Source: ABdhPJxJTAHva2F8AyL7R2uGD36xAwZUghomDXF9P40uBpjLR1/Nmwi1027a4w9d+jbPTbW5McMmNCG0d+h9avKjSqs=
X-Received: by 2002:a05:6638:138e:: with SMTP id
 w14mr2329658jad.98.1611901483908; 
 Thu, 28 Jan 2021 22:24:43 -0800 (PST)
MIME-Version: 1.0
References: <20210128112314.1304160-1-hsinyi@chromium.org>
 <20210128112314.1304160-7-hsinyi@chromium.org>
 <1611883982.5226.12.camel@mtksdaap41>
In-Reply-To: <1611883982.5226.12.camel@mtksdaap41>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 29 Jan 2021 14:24:18 +0800
Message-ID: <CAJMQK-gKKjLJ5xOAKOx5BM5dL2MxgFq72FVCfGTfzK4ZXzRJfA@mail.gmail.com>
Subject: Re: [PATCH v12 6/8] drm/mediatek: enable dither function
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Approved-At: Fri, 29 Jan 2021 08:11:32 +0000
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 9:33 AM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Hsin-Yi:
>
> On Thu, 2021-01-28 at 19:23 +0800, Hsin-Yi Wang wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> >
> > for 5 or 6 bpc panel, we need enable dither function
> > to improve the display quality
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index ac2cb25620357..6c8f246380a74 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -53,6 +53,7 @@
> >  #define DITHER_EN                            BIT(0)
> >  #define DISP_DITHER_CFG                              0x0020
> >  #define DITHER_RELAY_MODE                    BIT(0)
> > +#define DITHER_ENGINE_EN                     BIT(1)
> >  #define DISP_DITHER_SIZE                     0x0030
> >
> >  #define LUT_10BIT_MASK                               0x03ff
> > @@ -314,9 +315,19 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
> >                             unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> >  {
> >       struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > +     bool enable = (bpc == 5 || bpc == 6);
>
> I strongly believe that dither function in dither is identical to the
> one in gamma and od, and in mtk_dither_set_common(), 'bpc >=
> MTK_MIN_BPC' is valid, so I believe we need not to limit bpc to 5 or 6.
> But we should consider the case that bpc is invalid in
> mtk_dither_set_common(). Invalid case in gamma and od use different way
> to process. For gamma, dither is default relay mode, so invalid bpc
> would do nothing in mtk_dither_set_common() and result in relay mode.
> For od, it set to relay mode first, them invalid bpc would do nothing in
> mtk_dither_set_common() and result in relay mode. I would like dither,
> gamma and od to process invalid bpc in the same way. One solution is to
> set relay mode in mtk_dither_set_common() for invalid bpc.
>
> Regards,
> CK
>

I modify the mtk_dither_config() to follow:


diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index ac2cb25620357..5b7fcedb9f9a8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -53,6 +53,7 @@
 #define DITHER_EN                              BIT(0)
 #define DISP_DITHER_CFG                                0x0020
 #define DITHER_RELAY_MODE                      BIT(0)
+#define DITHER_ENGINE_EN                       BIT(1)
 #define DISP_DITHER_SIZE                       0x0030

 #define LUT_10BIT_MASK                         0x03ff
@@ -166,6 +167,8 @@ void mtk_dither_set_common(void __iomem *regs,
struct cmdq_client_reg *cmdq_reg,
                              DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
                              cmdq_reg, regs, DISP_DITHER_16);
                mtk_ddp_write(cmdq_pkt, dither_en, cmdq_reg, regs, cfg);
+       } else {
+               mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, cmdq_reg, regs, cfg);
        }
 }

@@ -315,8 +318,12 @@ static void mtk_dither_config(struct device *dev,
unsigned int w,
 {
        struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);

-       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg,
priv->regs, DISP_DITHER_SIZE);
-       mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg,
priv->regs, DISP_DITHER_CFG);
+       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+                     DISP_DITHER_SIZE);
+       mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
+                     DISP_DITHER_CFG);
+       mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_DITHER_CFG,
+                              DITHER_ENGINE_EN, cmdq_pkt);
 }

So now, not only bpc==5 or 6, but all valid bpc, dither config will
call mtk_dither_set_common() with the flag DITHER_ENGINE_EN(BIT(1)).
od config will call mtk_dither_set_common() with the flag
DISP_DITHERING(BIT(2)).
Additionally for 8173, gamma config will call mtk_dither_set_common()
with the flag DISP_DITHERING (BIT(2))

For invalid mode all of them will be DITHER_RELAY_MODE.

Just to make sure that this follows the spec? thanks

> >
> > -     mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
> > -     mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> > +     if (enable) {
> > +             mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc,
> > +                                   DISP_DITHER_CFG, DITHER_ENGINE_EN,
> > +                                   cmdq_pkt);
> > +     } else {
> > +             mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg,
> > +                           priv->regs, DISP_DITHER_CFG);
> > +     }
> > +
> > +     mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
> > +                   DISP_DITHER_SIZE);
> >  }
> >
> >  static void mtk_dither_start(struct device *dev)
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

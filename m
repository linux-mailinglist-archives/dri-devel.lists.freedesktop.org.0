Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B3650E1E1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 15:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A4F10E82F;
	Mon, 25 Apr 2022 13:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CFD10E7F1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 13:33:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C5F9B817D4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 13:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21CDC385AF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650893588;
 bh=uUdOOm568rK7RuFDvgybG0cdg/NEgZ8We82vdTXHL6I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X6ZT7zsiyniAqHXRoBvDeDPxJOkZwjC+Q1PCXuiwmT8/CtHtG/GHhswgENI6vpZsn
 Qo2hYa2v+Py4v0x0F6IBIgzffhoyoge8PrOA8wURB/9SSjQvCht9F8mTlEehD5ziut
 f3wujf23LkadumwIApsgIWQv5VTnw8cHumTpJvtsjOi/ie3fHk3gcLMFPqgn2X8QeK
 smskJHjQ78Rm4NsPAsDfFlyJDiXAaA/jafPThy/zgo3pq6/S2Ifm2nfhFS2P7C6UyG
 tw5AOd6pUdIu65wMVXaSeC7GkOj/v4ezjZ0LZfSoawAxpG7dUMcScJi8G5TbxLb8rB
 jMiIxRqaxc9EA==
Received: by mail-yb1-f181.google.com with SMTP id u33so2672258ybd.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 06:33:08 -0700 (PDT)
X-Gm-Message-State: AOAM530iqwFzU1vJsP22E2Pk0zWyvLy0Z2B87czP2m0z5HX1flhxxeyk
 UEk1dbroxOlVX1xdtNs1fPeuq3i77LOXUI2Grw==
X-Google-Smtp-Source: ABdhPJx1LinCS1pOqWEkgprmbR0KqvlB+UwCup/pn2fKM40C2TTP+BRtcH8NDydUzPiPForDxp/bLl8r9BLHa4F/ckY=
X-Received: by 2002:a25:c604:0:b0:645:d969:97a7 with SMTP id
 k4-20020a25c604000000b00645d96997a7mr12121163ybf.134.1650893587786; Mon, 25
 Apr 2022 06:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-12-nancy.lin@mediatek.com>
 <2cd07faf-e903-e55b-85c1-ce7a823ddb8b@gmail.com>
In-Reply-To: <2cd07faf-e903-e55b-85c1-ce7a823ddb8b@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 25 Apr 2022 21:32:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8Ei1e+Y==y+e7LoHBH3-SZEiz4M0SSqecRfWVMsLKH3Q@mail.gmail.com>
Message-ID: <CAAOTY_8Ei1e+Y==y+e7LoHBH3-SZEiz4M0SSqecRfWVMsLKH3Q@mail.gmail.com>
Subject: Re: [PATCH v17 11/21] drm/mediatek: add display merge start/stop API
 for cmdq support
To: Matthias Brugger <matthias.bgg@gmail.com>
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
Cc: DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, linux@roeck-us.net,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 wim@linux-watchdog.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "Nancy.Lin" <nancy.lin@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Matthias:

Matthias Brugger <matthias.bgg@gmail.com> =E6=96=BC 2022=E5=B9=B44=E6=9C=88=
22=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=887:48=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
>
>
> On 16/04/2022 04:07, Nancy.Lin wrote:
> > Add merge start/stop API for cmdq support. The ovl_adaptor merges
> > are configured with each drm plane update. Need to enable/disable
> > merge with cmdq making sure all the settings taken effect in the
> > same vblank.
> >
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 ++
> >   drivers/gpu/drm/mediatek/mtk_disp_merge.c | 20 +++++++++++++++++---
> >   2 files changed, 19 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/=
mediatek/mtk_disp_drv.h
> > index 53aa988dde3b..43a412525b75 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > @@ -66,6 +66,8 @@ void mtk_merge_stop(struct device *dev);
> >   void mtk_merge_advance_config(struct device *dev, unsigned int l_w, u=
nsigned int r_w,
> >                             unsigned int h, unsigned int vrefresh, unsi=
gned int bpc,
> >                             struct cmdq_pkt *cmdq_pkt);
> > +void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pk=
t);
> > +void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt=
);
> >
> >   void mtk_ovl_bgclr_in_on(struct device *dev);
> >   void mtk_ovl_bgclr_in_off(struct device *dev);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/dr=
m/mediatek/mtk_disp_merge.c
> > index 40da0555416d..c0d9b43b2a66 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > @@ -67,17 +67,31 @@ struct mtk_disp_merge {
> >   };
> >
> >   void mtk_merge_start(struct device *dev)
>
> Probably not my call, but wouldn't it make sense to enhance mtk_merge_sta=
rt to
> pass 'struct cmdq_pkt *cmdq_pkt' directly instead of adding this 'adapter=
'?

In [1], mtk_merge_start() should match the function prototype of
mtk_ddp_comp_funcs.start, so keep the non-cmdq interface.

static const struct mtk_ddp_comp_funcs ddp_merge =3D {
 .clk_enable =3D mtk_merge_clk_enable,
 .clk_disable =3D mtk_merge_clk_disable,
 .start =3D mtk_merge_start,
 .stop =3D mtk_merge_stop,
 .config =3D mtk_merge_config,
};

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/2022041909414=
3.9561-5-jason-jh.lin@mediatek.com/

Regards,
Chun-Kuang.

>
> In the end this is up to Chun-Kuang.
>
> Regards,
> Matthias
>
> > +{
> > +     mtk_merge_start_cmdq(dev, NULL);
> > +}
> > +
> > +void mtk_merge_stop(struct device *dev)
> >   {
> >       struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
> >
> > -     writel(MERGE_EN, priv->regs + DISP_REG_MERGE_CTRL);
> > +     mtk_merge_stop_cmdq(dev, NULL);
> >   }
> >
> > -void mtk_merge_stop(struct device *dev)
> > +void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pk=
t)
> > +{
> > +     struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
> > +
> > +     mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
> > +                   DISP_REG_MERGE_CTRL);
> > +}
> > +
> > +void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt=
)
> >   {
> >       struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
> >
> > -     writel(0x0, priv->regs + DISP_REG_MERGE_CTRL);
> > +     mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
> > +                   DISP_REG_MERGE_CTRL);
> >   }
> >
> >   static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,

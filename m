Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FD0465A1D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 00:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201ED6E9D1;
	Wed,  1 Dec 2021 23:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F606E98A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 23:58:42 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id v22so25855619qtx.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 15:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mKAVFtfRZpn9mek6iPysBIxAT9sFeNDh1PJVk69vAok=;
 b=UiQtL7PYDLYrQNpaKD6zuScFDLJgXtjIiVUSuenai/weJwHaNZGd50drPKnS644xJI
 FsIUoEA38p0/+CgS2GnR18T3SWsehh9cfFdQhsGcYNw83eEXy2yN0V551YDlQed1a5ia
 suumy0/x42VakjEbn2dWsY6UEt7ktkLXMzUVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mKAVFtfRZpn9mek6iPysBIxAT9sFeNDh1PJVk69vAok=;
 b=umpefliUfdsrhZ5vDa6DEpO6VPY58q+OUABwKpshwWLJ35tfwBsIVWiTaWjZwVDUT6
 Zoe1sEwIjvc93W87knlO6elpd1GrL8pKRjP5GGMtEPtWWWZ5Q8E2B/Wo74w7gHiNJ5HO
 dO6M3V+o3SDR720NMiHi5j0WdAm9UFK98sxB2QeeHBTg0Rl+iFTPwvb+sw83SH/bojyA
 ETx55//GdwGUvgvN0B4xd1bcVH4qX0GspQ2iJs0qkI+77Hfzm+NgolIzSGaxB8LYr+0g
 haC+LQnWujFSs8XaN3iNbZ3tiZrb9lZMjAb7ecdwcw2UzFBCFm0qSsev7VyLRMD9sb2q
 /tLw==
X-Gm-Message-State: AOAM531Y5m6FBWkdsneEnucaQ9Q0J5IPU6I8xyjv+Du2kdradMDtrPHp
 CrOjCpp6mHDH8xM0+IX0ZYje3SFgJhsM1Pd7wZvbKg==
X-Google-Smtp-Source: ABdhPJxjAowIZNevtYxc/JYBCkiAIs98qYglgiULGYpJOCGmpv/QaOf2gRWJM912xU3UVIlhW8QOcnJt6ZYIil4W+Lg=
X-Received: by 2002:a05:622a:130e:: with SMTP id
 v14mr10542855qtk.458.1638403121278; 
 Wed, 01 Dec 2021 15:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-3-yunfei.dong@mediatek.com>
 <CAC-pXoPXc=q8KPUcSfY6XZ=sLt71vDZbJV=f4SZx55Gc6VbRQw@mail.gmail.com>
In-Reply-To: <CAC-pXoPXc=q8KPUcSfY6XZ=sLt71vDZbJV=f4SZx55Gc6VbRQw@mail.gmail.com>
From: Steve Cho <stevecho@chromium.org>
Date: Wed, 1 Dec 2021 15:58:30 -0800
Message-ID: <CAC-pXoPtPb1y8c5FovXJ_T-689t_RRdyGu=54yr9BufDK+zmkw@mail.gmail.com>
Subject: Re: [PATCH v11, 02/19] media: mtk-vcodec: Align vcodec wake up
 interrupt interface
To: Yunfei Dong <yunfei.dong@mediatek.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Steve Cho <stevecho@chromium.org>

On Wed, Dec 1, 2021 at 3:55 PM Steve Cho <stevecho@chromium.org> wrote:
>
> LGTM.
>
> On Sun, Nov 28, 2021 at 7:44 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> >
> > Vdec and venc can use the same function to wake up interrupt event.
> >
> > Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 9 +--------
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h     | 8 ++++++++
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 8 --------
> >  3 files changed, 9 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index 59caf2163349..055d50e52720 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -31,13 +31,6 @@
> >  module_param(mtk_v4l2_dbg_level, int, 0644);
> >  module_param(mtk_vcodec_dbg, bool, 0644);
> >
> > -/* Wake up context wait_queue */
> > -static void wake_up_ctx(struct mtk_vcodec_ctx *ctx)
> > -{
> > -       ctx->int_cond = 1;
> > -       wake_up_interruptible(&ctx->queue);
> > -}
> > -
> >  static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
> >  {
> >         struct mtk_vcodec_dev *dev = priv;
> > @@ -69,7 +62,7 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
> >         writel((readl(vdec_misc_addr) & ~VDEC_IRQ_CLR),
> >                 dev->reg_base[VDEC_MISC] + VDEC_IRQ_CFG_REG);
> >
> > -       wake_up_ctx(ctx);
> > +       wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
>
> Assuming setting up reason doesn't change functionality.
>
> >
> >         mtk_v4l2_debug(3,
> >                         "mtk_vcodec_dec_irq_handler :wake up ctx %d, dec_done_status=%x",
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index 581522177308..1d2370608d0d 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -473,4 +473,12 @@ static inline struct mtk_vcodec_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
> >         return container_of(ctrl->handler, struct mtk_vcodec_ctx, ctrl_hdl);
> >  }
> >
> > +/* Wake up context wait_queue */
> > +static inline void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
> > +{
> > +       ctx->int_cond = 1;
> > +       ctx->int_type = reason;
> > +       wake_up_interruptible(&ctx->queue);
> > +}
> > +
> >  #endif /* _MTK_VCODEC_DRV_H_ */
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > index eed67394cf46..7c3487fb3498 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > @@ -65,14 +65,6 @@ static const struct mtk_video_fmt mtk_video_formats_capture_vp8[] =  {
> >         },
> >  };
> >
> > -/* Wake up context wait_queue */
> > -static void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
> > -{
> > -       ctx->int_cond = 1;
> > -       ctx->int_type = reason;
> > -       wake_up_interruptible(&ctx->queue);
> > -}
> > -
> >  static void clean_irq_status(unsigned int irq_status, void __iomem *addr)
> >  {
> >         if (irq_status & MTK_VENC_IRQ_STATUS_PAUSE)
> > --
> > 2.25.1
> >

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8465943D9CB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 05:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262356E581;
	Thu, 28 Oct 2021 03:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468186E581
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 03:19:45 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id j10so5292366ilu.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 20:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8iLqanegbeY/oC5IucoRrB/uNp5p6hrJTUbMi+FyPCg=;
 b=I/BQtp4v9VF9Mrf/HLCEPNJpd/6gyYZZhOoXLzv9PA68p4CmdvxV3LrV9GdRlfmrpY
 DlKSHwbewUBrYPxr7U4RR76y6oWMF7J4K18U/GFNGmhQNyQAsD/o648g3YZOZtci+FaP
 GYLoNR94SVRFEgAyk0lFT5e85rc3gjBq+25ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8iLqanegbeY/oC5IucoRrB/uNp5p6hrJTUbMi+FyPCg=;
 b=WPwfk4t9TOy2oPcrqEOsGG7+jETnnJ3c8e35jOIjtX9p4wU4mLtPWdgHedVp0Z1GxV
 Vad/BOa8fnlbvad1z5dU84iO0kMAWnexjfVeSNwCGZcGjglcIrV0dRYc4I9kKPhxCOTx
 egLLyGK1r2uK7JbMYvSfretkgldcmedrbeY17D1vEoxqtOFxJWBptKyapErDrpWdttcn
 1O4ru43Q8V1DfGHxgKy+eGhNDetYC1xiC4bl9yYw4ED7pTDAGliojwZcx0ImpggXIMgE
 QM384Mo0gRF6PsWpWajaffA4uWoDnZhAAIbYMBTVOzEPrtkrh5i81+/1r7QiTfLmqrkW
 fnWQ==
X-Gm-Message-State: AOAM531YRQ81k8744Y5eRAq0DSHQcCCw/HvHP7sJHn+TWLC1u1ML6+tf
 4+cXE/g4IC1sXCHzuMSo6xsrXIdiZpeX1w==
X-Google-Smtp-Source: ABdhPJwH5W3/6qOk7pn07QMRlBktMr0npcCmEN9F9Unl3O5RHGkqnCu7Vn9yV7XdID6Uddb0N58Pww==
X-Received: by 2002:a92:cd84:: with SMTP id r4mr1294934ilb.267.1635391183091; 
 Wed, 27 Oct 2021 20:19:43 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177])
 by smtp.gmail.com with ESMTPSA id p2sm904070ios.47.2021.10.27.20.19.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 20:19:42 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id h2so5223149ili.11
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 20:19:41 -0700 (PDT)
X-Received: by 2002:a05:6e02:687:: with SMTP id
 o7mr1270144ils.222.1635391180904; 
 Wed, 27 Oct 2021 20:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211027021857.20816-1-jason-jh.lin@mediatek.com>
 <20211027021857.20816-4-jason-jh.lin@mediatek.com>
 <CAC=S1ng2=XRV9s2t2dxQf1a2V2GsFwhfB8tRxnNDp-QD5eR_xQ@mail.gmail.com>
 <CAAOTY_9sCr-CM6WsZ6q7mtfqr9A5sNccC0bk1vq=Hdqr3rGkQw@mail.gmail.com>
In-Reply-To: <CAAOTY_9sCr-CM6WsZ6q7mtfqr9A5sNccC0bk1vq=Hdqr3rGkQw@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 28 Oct 2021 11:19:04 +0800
X-Gmail-Original-Message-ID: <CAC=S1njhuzPi6gOmGfqhtKMtDTsGPzZ7P=PoVbAviHt1o00U6w@mail.gmail.com>
Message-ID: <CAC=S1njhuzPi6gOmGfqhtKMtDTsGPzZ7P=PoVbAviHt1o00U6w@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/mediatek: Detect CMDQ execution timeout
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
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

Hi Chun-Kuang,

On Thu, Oct 28, 2021 at 7:47 AM Chun-Kuang Hu <chunkuang.hu@kernel.org> wro=
te:
>
> Hi, Fei:
>
> Fei Shao <fshao@chromium.org> =E6=96=BC 2021=E5=B9=B410=E6=9C=8827=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:32=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi Jason,
> >
> > On Wed, Oct 27, 2021 at 10:19 AM jason-jh.lin <jason-jh.lin@mediatek.co=
m> wrote:
> > >
> > > From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > >
> > > CMDQ is used to update display register in vblank period, so
> > > it should be execute in next 2 vblank. One vblank interrupt
> > > before send message (occasionally) and one vblank interrupt
> > > after cmdq done. If it fail to execute in next 3 vblank,
> > > tiemout happen.
> > >
> > > Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 20 ++++++++++++++++++--
> > >  1 file changed, 18 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_crtc.c
> > > index e23e3224ac67..dad1f85ee315 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > @@ -54,6 +54,7 @@ struct mtk_drm_crtc {
> > >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > >         struct cmdq_client              cmdq_client;
> > >         u32                             cmdq_event;
> > > +       u32                             cmdq_vblank_cnt;
> > >  #endif
> > >
> > >         struct device                   *mmsys_dev;
> > > @@ -227,7 +228,10 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(=
struct drm_crtc *crtc,
> > >  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
> > >  {
> > >         struct cmdq_cb_data *data =3D mssg;
> > > +       struct cmdq_client *cmdq_cl =3D container_of(cl, struct cmdq_=
client, client);
> > > +       struct mtk_drm_crtc *mtk_crtc =3D container_of(cmdq_cl, struc=
t mtk_drm_crtc, cmdq_client);
> > >
> > > +       mtk_crtc->cmdq_vblank_cnt =3D 0;
> > >         cmdq_pkt_destroy(data->pkt);
> > >  }
> > >  #endif
> > > @@ -483,6 +487,15 @@ static void mtk_drm_crtc_update_config(struct mt=
k_drm_crtc *mtk_crtc,
> > >                                            cmdq_handle->pa_base,
> > >                                            cmdq_handle->cmd_buf_size,
> > >                                            DMA_TO_DEVICE);
> > > +               /*
> > > +                * CMDQ command should execute in next 3 vblank.
> > > +                * One vblank interrupt before send message (occasion=
ally)
> > > +                * and one vblank interrupt after cmdq done,
> > > +                * so it's timeout after 3 vblank interrupt.
> > > +                * If it fail to execute in next 3 vblank, timeout ha=
ppen.
> > > +                */
> > > +               mtk_crtc->cmdq_vblank_cnt =3D 3;
> > > +
> > >                 mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_ha=
ndle);
> > >                 mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
> > >         }
> > > @@ -499,11 +512,14 @@ static void mtk_crtc_ddp_irq(void *data)
> > >
> > >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > >         if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.ch=
an)
> > > +               mtk_crtc_ddp_config(crtc, NULL);
> > > +       else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vb=
lank_cnt =3D=3D 0)
> > I think atomic_dec_and_test() does what you want to do here.
>
> I think this operation is not necessary to be atomic operation, and
> this statement could be reduced to
>
> else if (--mtk_crtc->cmdq_vblank_cnt =3D=3D 0)

I was thinking about using existing helpers to wrap up the counter
operations, but I agree that it's not necessary.
Just dropping the redundant check would be good enough.


>
> >
> > > +               DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\=
n",
> > > +                         drm_crtc_index(&mtk_crtc->base));
> > >  #else
> > >         if (!priv->data->shadow_register)
> > > -#endif
> > >                 mtk_crtc_ddp_config(crtc, NULL);
> > > -
> > > +#endif
> > >         mtk_drm_finish_page_flip(mtk_crtc);
> > >  }
> > >
> > > --
> > > 2.18.0
> > >

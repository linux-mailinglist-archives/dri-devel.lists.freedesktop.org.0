Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F0F8CF890
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 06:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49AF10E633;
	Mon, 27 May 2024 04:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="erv0+/TQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9662E10E633
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 04:54:50 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-48a417fd190so428658137.0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 21:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716785689; x=1717390489;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9gJOhzmspBkrZuLKBoP0mmK3YHQ3TyvOptzZlj6zm9s=;
 b=erv0+/TQgmpH2dVOOeIshm7Ds+S/8M92ur01UXEVb5u0Lz190Rt47km0Mjle7qhSrN
 42XNB384AeaYTl0UluCapxFvBMl/gqtzZAK/a4O5c8OGMGHHBITcII24kFoBX7O8dPU4
 TcJF2AiPKhsUImr7XqT2p0L/5w8EVmB39dwKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716785689; x=1717390489;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9gJOhzmspBkrZuLKBoP0mmK3YHQ3TyvOptzZlj6zm9s=;
 b=FhADwM9GFOrR5CyqoBKhbi+Y8m+wN4oskDFIB2GV23/54SJPl0FenvnuwcgMSg7USb
 pAg6WDIqXLx4uwz8NaidPHGvQowYaw5Ui3ZU6AiXgTwKPhekd25kcwhQ6bC2Yx2hXIcY
 5xKLMtm2gDhdxAfLamxblzJfjIS7xzxOgg+tn40rOHCFoJRmhWNCCA4Mciqd7YmRhgqT
 D0TJsxzMpswxfcuV86BWaTr0ImmNJdGuNEIC90iJiGMTcagrWXdixuRnmYV0l+Fw0dnz
 y2G9oZvyHvILT35NhQuIPvBfcnB9AQ4FmejT1o6I+3SkAcffbhQdRwiAIxKgyL1RfsQP
 GsdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvlvViTmMnBeVhwVDZwJRkBKrcIjWGBjW9ZoAAomi3a51bOnYUwLCTLj2Mxnj1BiDugfEmqLk1hyNPLKyBq+shCptIbpN3rJ68pQEI50Mf
X-Gm-Message-State: AOJu0YyPAKZMlqOSr4Hc0TcLC0zXcxo+uQRVYfkj1SizBcpIVmmVk6ic
 zQsMOffwmLRIKzgc6Qj6rEPsdIfMc+DvpZEP3HQjgk2MuUM42hgyvflEqtKUkPVc6+kgrHmoaZT
 OWQ==
X-Google-Smtp-Source: AGHT+IEYgnhYKRUBrTDrVtA9rsz+5HVndGfIZY5ygq5aatEcxyl7yxW5mK3ppc9PycYka2gwJYvWFA==
X-Received: by 2002:a67:e30a:0:b0:47f:684:a3f with SMTP id
 ada2fe7eead31-48a386556b2mr9053220137.25.1716785689229; 
 Sun, 26 May 2024 21:54:49 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-804cc11b0b6sm993816241.27.2024.05.26.21.54.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 May 2024 21:54:48 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-80325a42c43so1398957241.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 21:54:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUQCmc1z/O9rf+QJW9VX3wOtzHap8wTid69txJt61Tm0wWDj470Jovblyoco+g/EZTlZBRsU60qoRNOgrmyziYDISRl65Pjg37KbynvwUMA
X-Received: by 2002:a67:f88d:0:b0:48a:33af:3ba with SMTP id
 ada2fe7eead31-48a386b3a53mr7310666137.31.1716785688017; Sun, 26 May 2024
 21:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240502103848.5845-1-shawn.sung@mediatek.com>
 <20240502103848.5845-6-shawn.sung@mediatek.com>
 <CAC=S1ngUh-o107YM8zEu-ebaP7+eaO1x6SsZ6OeRxrH5YgFKxw@mail.gmail.com>
 <CAGb2v67TZSoQnEMhUNKhnbkwK2=9yCPcwnLD-iHuRp6=Y2ez2Q@mail.gmail.com>
In-Reply-To: <CAGb2v67TZSoQnEMhUNKhnbkwK2=9yCPcwnLD-iHuRp6=Y2ez2Q@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 27 May 2024 12:54:10 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhKPo5BUYJ_cHGz3OoPrWNh5eO8rhdyikLimsqSOrZ5Xg@mail.gmail.com>
Message-ID: <CAC=S1nhKPo5BUYJ_cHGz3OoPrWNh5eO8rhdyikLimsqSOrZ5Xg@mail.gmail.com>
Subject: Re: [PATCH v7 05/18] drm/mediatek: Set DRM mode configs accordingly
To: wens@kernel.org
Cc: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 "Nancy . Lin" <nancy.lin@mediatek.com>, Sean Paul <sean@poorly.run>, 
 Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, May 27, 2024 at 12:38=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Mon, May 27, 2024 at 12:34=E2=80=AFPM Fei Shao <fshao@chromium.org> wr=
ote:
> >
> > Hi Shawn,
> >
> > On Thu, May 2, 2024 at 6:39=E2=80=AFPM Shawn Sung <shawn.sung@mediatek.=
com> wrote:
> > >
> > > From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > >
> > > Set DRM mode configs limitation according to the hardware capabilitie=
s
> > > and pass the IGT checks as below:
> > >
> > > - The test "graphics.IgtKms.kms_plane" requires a frame buffer with
> > >   width of 4512 pixels (> 4096).
> > > - The test "graphics.IgtKms.kms_cursor_crc" checks if the cursor size=
 is
> > >   defined, and run the test with cursor size from 1x1 to 512x512.
> > >
> > > Please notice that the test conditions may change as IGT is updated.
> > >
> > > Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 22 ++++++++++++++++++++++
> > >  drivers/gpu/drm/mediatek/mtk_drm_drv.h |  4 ++++
> > >  2 files changed, 26 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm=
/mediatek/mtk_drm_drv.c
> > > index 8e047043202b4..c9cad3a827376 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > > @@ -294,6 +294,9 @@ static const struct mtk_mmsys_driver_data mt8188_=
vdosys0_driver_data =3D {
> > >         .conn_routes =3D mt8188_mtk_ddp_main_routes,
> > >         .num_conn_routes =3D ARRAY_SIZE(mt8188_mtk_ddp_main_routes),
> > >         .mmsys_dev_num =3D 2,
> > > +       .max_width =3D 8191,
> > > +       .min_width =3D 1,
> > > +       .min_height =3D 1,
> > >  };
> > >
> > >  static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data =
=3D {
> > > @@ -308,6 +311,9 @@ static const struct mtk_mmsys_driver_data mt8195_=
vdosys0_driver_data =3D {
> > >         .main_path =3D mt8195_mtk_ddp_main,
> > >         .main_len =3D ARRAY_SIZE(mt8195_mtk_ddp_main),
> > >         .mmsys_dev_num =3D 2,
> > > +       .max_width =3D 8191,
> > > +       .min_width =3D 1,
> > > +       .min_height =3D 1,
> > >  };
> > >
> > >  static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data=
 =3D {
> > > @@ -315,6 +321,9 @@ static const struct mtk_mmsys_driver_data mt8195_=
vdosys1_driver_data =3D {
> > >         .ext_len =3D ARRAY_SIZE(mt8195_mtk_ddp_ext),
> > >         .mmsys_id =3D 1,
> > >         .mmsys_dev_num =3D 2,
> > > +       .max_width =3D 8191,
> > > +       .min_width =3D 2, /* 2-pixel align when ethdr is bypassed */
> > > +       .min_height =3D 1,
> > >  };
> > >
> > >  static const struct of_device_id mtk_drm_of_ids[] =3D {
> > > @@ -493,6 +502,15 @@ static int mtk_drm_kms_init(struct drm_device *d=
rm)
> > >                 for (j =3D 0; j < private->data->mmsys_dev_num; j++) =
{
> > >                         priv_n =3D private->all_drm_private[j];
> > >
> > > +                       if (priv_n->data->max_width)
> > > +                               drm->mode_config.max_width =3D priv_n=
->data->max_width;
> > > +
> > > +                       if (priv_n->data->min_width)
> > > +                               drm->mode_config.min_width =3D priv_n=
->data->min_width;
> > > +
> > > +                       if (priv_n->data->min_height)
> > > +                               drm->mode_config.min_height =3D priv_=
n->data->min_height;
> > > +
> > >                         if (i =3D=3D CRTC_MAIN && priv_n->data->main_=
len) {
> > >                                 ret =3D mtk_crtc_create(drm, priv_n->=
data->main_path,
> > >                                                       priv_n->data->m=
ain_len, j,
> > > @@ -520,6 +538,10 @@ static int mtk_drm_kms_init(struct drm_device *d=
rm)
> > >                 }
> > >         }
> > >
> > > +       /* IGT will check if the cursor size is configured */
> > > +       drm->mode_config.cursor_width =3D drm->mode_config.max_width;
> > > +       drm->mode_config.cursor_height =3D drm->mode_config.max_heigh=
t;
> >
> > I think you shouldn't set the cursor size to the maximum plane size.
> > As you mentioned in the commit message, IGT tests the cursor sizes
> > from 1x1 to 512x512, so just setting them to 512 (with a macro) should
> > be enough.
> >
> > Currently this tells the userspace "the supported cursor plane size is
> > up to 4096x8191" on MT8195 and MT8188.
> > That means the userspace may allocate a buffer with 4096*8191*4 ~=3D
> > 128MB for the cursor plane in the worst case, and most of the buffer
> > will be wasted.
> > Note that the default value for DRM_CAP_CURSOR_WIDTH is 64.
> >
> > In practice, when applying this on the MT8188 Chromebook, I see the
> > userspace allocates two 64MB buffers for the cursor plane.
> > But if I limit the cursor size to 512, the userspace only allocates
> > two 1MB buffers i.e. 126MB is optimized for the DMA buffer allocation.
>
> That seems more like an issue of ChromeOS not doing the most optimal
> thing though?

I agree that we need to fix this on the ChromeOS side too, but I still
think the driver doesn't need to set the capabilities like this
because a full-screen size cursor is not practical anyway.
The default cursor plane size is just 64x64.

Regard,
Fei



>
> > Regards,
> > Fei
> >
> >
> > >
> > > +
> > >         /* Use OVL device for all DMA memory allocations */
> > >         crtc =3D drm_crtc_from_index(drm, 0);
> > >         if (crtc)
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm=
/mediatek/mtk_drm_drv.h
> > > index 78d698ede1bf8..6cfa790e8df5c 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > > @@ -46,6 +46,10 @@ struct mtk_mmsys_driver_data {
> > >         bool shadow_register;
> > >         unsigned int mmsys_id;
> > >         unsigned int mmsys_dev_num;
> > > +
> > > +       int max_width;
> > > +       int min_width;
> > > +       int min_height;
> > >  };
> > >
> > >  struct mtk_drm_private {
> > > --
> > > 2.18.0
> > >

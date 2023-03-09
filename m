Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179B86B2F3B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 22:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD58410E2B9;
	Thu,  9 Mar 2023 21:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4539310E2B7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 21:05:32 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id q189so1869534pga.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 13:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678395932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nh5PbECcDcnxj+Di/AvIm/ptzZTES5BXOO5Ff5nk+zg=;
 b=MVvF25i8lR3Vz0TroD3ZkrjDrQYUnGxQPuKXkHKnOqeFVwArY9amsl4rIwaePp1m8D
 RXdAWJ5YeUM/zH7mwnBWpFb4aDUCNJvak7R3ZsqRw0Or7+p6iNF3+2SMnNP8St7BK127
 ldtQhbCQFsI75aCWNB0uzk93HYom3MOF9EL/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678395932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nh5PbECcDcnxj+Di/AvIm/ptzZTES5BXOO5Ff5nk+zg=;
 b=PJhFUIWcXrGii5cxO2QoqWqU3QmJvT/R54xRlkLdFHWws2ne5b1Yw90nwY0R0apWXl
 KnIe/XB+fm9awhvFQwujs0imv0e/+BA9fFAsMm/s0njp9H79hcsTmu/RkNagiXMX8Dy3
 ibjR8ZUyk6rj1tIkcJ89j73hyZDtna+bgSAVpUglO6/ip4vvDzhQuC3C8EoLrwomX/ZT
 S0l+fjIJjfF8Rq0M3XZRzTEjlZQP8c9XbRgB2AJOdEknoRkFzXUMpTyqkft5mfIoLOAJ
 Fj3qIGy37JsaWGJ1Tf4Ibr1rkEOcfkPOps8Jq0ql8y8yvpiEjbKvLrxcX72jFPcXdfZA
 7Oaw==
X-Gm-Message-State: AO0yUKWtKO0aETEd4zC7aAtrDSPj1y8++iFGHyzDQlCS4IPGnpaYIXo5
 KKLf8jkruaU32DJ5DOft1MJdf77z9GXSrE+9vlG/UA==
X-Google-Smtp-Source: AK7set9pQmmwqDvT8irNYmHZqiYgLBmigycFOJraZWSQaupdAEXHJX8Tgl2r1DpJVgMteLJkXIl0iUy4AV9nn66xhwg=
X-Received: by 2002:a63:715d:0:b0:4fc:2058:fa2b with SMTP id
 b29-20020a63715d000000b004fc2058fa2bmr8308168pgn.3.1678395931674; Thu, 09 Mar
 2023 13:05:31 -0800 (PST)
MIME-Version: 1.0
References: <20230308153358.333297-1-greenjustin@chromium.org>
 <20230308153358.333297-3-greenjustin@chromium.org>
 <CAAOTY__LJPfBMkZM1XxBrrzYdnTG20RH2Yn1rCYioro9Fv+1_g@mail.gmail.com>
In-Reply-To: <CAAOTY__LJPfBMkZM1XxBrrzYdnTG20RH2Yn1rCYioro9Fv+1_g@mail.gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Thu, 9 Mar 2023 16:05:20 -0500
Message-ID: <CAHC42RdCqwO+bTbRhp45xoZaftbUFcbHZ7sBs4emL6w9cnu7GQ@mail.gmail.com>
Subject: Re: [PATCH v7 RESEND 2/3] drm/mediatek: Add support for AR30 and BA30
 overlays
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuang,
Thanks for the review! This patch was tested like the previous one, by
running Chrome on an MT8195 and looking for regressions. I'll post a
new series with the updated patch descriptions.

Regards,
Justin

On Wed, Mar 8, 2023 at 6:34=E2=80=AFPM Chun-Kuang Hu <chunkuang.hu@kernel.o=
rg> wrote:
>
> Hi, Justin:
>
> Justin Green <greenjustin@chromium.org> =E6=96=BC 2023=E5=B9=B43=E6=9C=88=
8=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:34=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > Tested using "modetest -P" on an MT8195 device.
>
> I think you could not test this when only apply the first two patches
> of this series, so move the test information to the third patch. In
> this patch, you could describe more about what and why this patch
> does. The other modification looks good to me.
>
> Regards,
> Chun-Kuang.
>
> >
> > Signed-off-by: Justin Green <greenjustin@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 33 +++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/=
mediatek/mtk_disp_ovl.c
> > index 8743c8047dc9..a6255e847104 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > @@ -41,6 +41,7 @@
> >  #define DISP_REG_OVL_RDMA_CTRL(n)              (0x00c0 + 0x20 * (n))
> >  #define DISP_REG_OVL_RDMA_GMC(n)               (0x00c8 + 0x20 * (n))
> >  #define DISP_REG_OVL_ADDR_MT2701               0x0040
> > +#define DISP_REG_OVL_CLRFMT_EXT                        0x02D0
> >  #define DISP_REG_OVL_ADDR_MT8173               0x0f40
> >  #define DISP_REG_OVL_ADDR(ovl, n)              ((ovl)->data->addr + 0x=
20 * (n))
> >  #define DISP_REG_OVL_HDR_ADDR(ovl, n)          ((ovl)->data->addr + 0x=
20 * (n) + 0x04)
> > @@ -61,6 +62,10 @@
> >                                         0 : OVL_CON_CLRFMT_RGB)
> >  #define OVL_CON_CLRFMT_RGB888(ovl)     ((ovl)->data->fmt_rgb565_is_0 ?=
 \
> >                                         OVL_CON_CLRFMT_RGB : 0)
> > +#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(ovl)     (0xFF << 4 * (ovl))
> > +#define OVL_CON_CLRFMT_BIT_DEPTH(depth, ovl)   (depth << 4 * (ovl))
> > +#define OVL_CON_CLRFMT_8_BIT                   0x00
> > +#define OVL_CON_CLRFMT_10_BIT                  0x01
> >  #define        OVL_CON_AEN             BIT(8)
> >  #define        OVL_CON_ALPHA           0xff
> >  #define        OVL_CON_VIRT_FLIP       BIT(9)
> > @@ -89,6 +94,7 @@ struct mtk_disp_ovl_data {
> >         bool supports_afbc;
> >         const u32 *formats;
> >         size_t num_formats;
> > +       bool supports_clrfmt_ext;
> >  };
> >
> >  /*
> > @@ -218,6 +224,30 @@ static void mtk_ovl_set_afbc(struct mtk_disp_ovl *=
ovl, struct cmdq_pkt *cmdq_pkt
> >                            DISP_REG_OVL_DATAPATH_CON, OVL_LAYER_AFBC_EN=
(idx));
> >  }
> >
> > +static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 for=
mat,
> > +                                 struct cmdq_pkt *cmdq_pkt)
> > +{
> > +       struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> > +       unsigned int reg;
> > +       unsigned int bit_depth =3D OVL_CON_CLRFMT_8_BIT;
> > +
> > +       if (!ovl->data->supports_clrfmt_ext)
> > +               return;
> > +
> > +       reg =3D readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
> > +       reg &=3D ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
> > +
> > +       if (format =3D=3D DRM_FORMAT_RGBA1010102 ||
> > +           format =3D=3D DRM_FORMAT_BGRA1010102 ||
> > +           format =3D=3D DRM_FORMAT_ARGB2101010)
> > +               bit_depth =3D OVL_CON_CLRFMT_10_BIT;
> > +
> > +       reg |=3D OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
> > +
> > +       mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg,
> > +                     ovl->regs, DISP_REG_OVL_CLRFMT_EXT);
> > +}
> > +
> >  void mtk_ovl_config(struct device *dev, unsigned int w,
> >                     unsigned int h, unsigned int vrefresh,
> >                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> > @@ -332,9 +362,11 @@ static unsigned int ovl_fmt_convert(struct mtk_dis=
p_ovl *ovl, unsigned int fmt)
> >                 return OVL_CON_CLRFMT_ARGB8888;
> >         case DRM_FORMAT_BGRX8888:
> >         case DRM_FORMAT_BGRA8888:
> > +       case DRM_FORMAT_BGRA1010102:
> >                 return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
> >         case DRM_FORMAT_XRGB8888:
> >         case DRM_FORMAT_ARGB8888:
> > +       case DRM_FORMAT_ARGB2101010:
> >                 return OVL_CON_CLRFMT_RGBA8888;
> >         case DRM_FORMAT_XBGR8888:
> >         case DRM_FORMAT_ABGR8888:
> > @@ -418,6 +450,7 @@ void mtk_ovl_layer_config(struct device *dev, unsig=
ned int idx,
> >                                       &ovl->cmdq_reg, ovl->regs, DISP_R=
EG_OVL_PITCH_MSB(idx));
> >         }
> >
> > +       mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
> >         mtk_ovl_layer_on(dev, idx, cmdq_pkt);
> >  }
> >
> > --
> > 2.39.1.456.gfc5497dd1b-goog
> >

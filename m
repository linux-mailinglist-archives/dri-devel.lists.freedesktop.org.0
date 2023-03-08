Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 072106B168A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 00:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9772010E766;
	Wed,  8 Mar 2023 23:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9193310E75D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 23:34:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F2543619C9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 23:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF01C433A1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 23:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678318452;
 bh=KUGDEgonlg9RXBeUOcEOHd3TUC9eBAaEXNluLsYZAao=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=au+97evzRqd78Dy4n9eVrSyu9VMiSiWPRJyoiTBcEeoptCEEghO9zy/Y+MI3UMCOO
 2WcQFeDu4snkRN28cg71IUD/vuHAHrhY4YKvcRvdg1HCpSlbfVIH9/jd3wrFg2KPpx
 zO07uC2QsSFADZnr1MZRGZhtQb8CWW53NDQSv08hJnRgre0BfxKmJyRXSK4hFF4uiR
 DJpO3tMD1iERylS7qa7l0oTJpMyyqYCBJWOZ9wr8Y3mSno86hJ/cYsBo33l/QebRKr
 iXr1eB29ci0aZtIDoxQG/c44Ycazt4RymqZ0RC5d4zXTnFw6juyVISQf7/FgIf3h0a
 hQklF5ujmYNjw==
Received: by mail-lf1-f42.google.com with SMTP id n2so66423lfb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 15:34:12 -0800 (PST)
X-Gm-Message-State: AO0yUKURQ7s/xqmwUccxuJlAYoBfi4JZK6w+L99RHPN6tcNIPrzLRq5m
 kcxU8RFGBiy/Uni2m1dAiFTIe35rswUKG92n1A==
X-Google-Smtp-Source: AK7set9jU1rJvJm8BuARSI7xDYybdRxjrachn9eWnJEyi+odkJN2cu9+DkDVO1JPavi5lB7ija2xXLVkY9O12YvKapU=
X-Received: by 2002:ac2:5de1:0:b0:4dd:af74:fe17 with SMTP id
 z1-20020ac25de1000000b004ddaf74fe17mr6129635lfq.7.1678318450861; Wed, 08 Mar
 2023 15:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20230308153358.333297-1-greenjustin@chromium.org>
 <20230308153358.333297-3-greenjustin@chromium.org>
In-Reply-To: <20230308153358.333297-3-greenjustin@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 9 Mar 2023 07:33:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY__LJPfBMkZM1XxBrrzYdnTG20RH2Yn1rCYioro9Fv+1_g@mail.gmail.com>
Message-ID: <CAAOTY__LJPfBMkZM1XxBrrzYdnTG20RH2Yn1rCYioro9Fv+1_g@mail.gmail.com>
Subject: Re: [PATCH v7 RESEND 2/3] drm/mediatek: Add support for AR30 and BA30
 overlays
To: Justin Green <greenjustin@chromium.org>
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
Cc: chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Justin:

Justin Green <greenjustin@chromium.org> =E6=96=BC 2023=E5=B9=B43=E6=9C=888=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:34=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Tested using "modetest -P" on an MT8195 device.

I think you could not test this when only apply the first two patches
of this series, so move the test information to the third patch. In
this patch, you could describe more about what and why this patch
does. The other modification looks good to me.

Regards,
Chun-Kuang.

>
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 33 +++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index 8743c8047dc9..a6255e847104 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -41,6 +41,7 @@
>  #define DISP_REG_OVL_RDMA_CTRL(n)              (0x00c0 + 0x20 * (n))
>  #define DISP_REG_OVL_RDMA_GMC(n)               (0x00c8 + 0x20 * (n))
>  #define DISP_REG_OVL_ADDR_MT2701               0x0040
> +#define DISP_REG_OVL_CLRFMT_EXT                        0x02D0
>  #define DISP_REG_OVL_ADDR_MT8173               0x0f40
>  #define DISP_REG_OVL_ADDR(ovl, n)              ((ovl)->data->addr + 0x20=
 * (n))
>  #define DISP_REG_OVL_HDR_ADDR(ovl, n)          ((ovl)->data->addr + 0x20=
 * (n) + 0x04)
> @@ -61,6 +62,10 @@
>                                         0 : OVL_CON_CLRFMT_RGB)
>  #define OVL_CON_CLRFMT_RGB888(ovl)     ((ovl)->data->fmt_rgb565_is_0 ? \
>                                         OVL_CON_CLRFMT_RGB : 0)
> +#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(ovl)     (0xFF << 4 * (ovl))
> +#define OVL_CON_CLRFMT_BIT_DEPTH(depth, ovl)   (depth << 4 * (ovl))
> +#define OVL_CON_CLRFMT_8_BIT                   0x00
> +#define OVL_CON_CLRFMT_10_BIT                  0x01
>  #define        OVL_CON_AEN             BIT(8)
>  #define        OVL_CON_ALPHA           0xff
>  #define        OVL_CON_VIRT_FLIP       BIT(9)
> @@ -89,6 +94,7 @@ struct mtk_disp_ovl_data {
>         bool supports_afbc;
>         const u32 *formats;
>         size_t num_formats;
> +       bool supports_clrfmt_ext;
>  };
>
>  /*
> @@ -218,6 +224,30 @@ static void mtk_ovl_set_afbc(struct mtk_disp_ovl *ov=
l, struct cmdq_pkt *cmdq_pkt
>                            DISP_REG_OVL_DATAPATH_CON, OVL_LAYER_AFBC_EN(i=
dx));
>  }
>
> +static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 forma=
t,
> +                                 struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> +       unsigned int reg;
> +       unsigned int bit_depth =3D OVL_CON_CLRFMT_8_BIT;
> +
> +       if (!ovl->data->supports_clrfmt_ext)
> +               return;
> +
> +       reg =3D readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
> +       reg &=3D ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
> +
> +       if (format =3D=3D DRM_FORMAT_RGBA1010102 ||
> +           format =3D=3D DRM_FORMAT_BGRA1010102 ||
> +           format =3D=3D DRM_FORMAT_ARGB2101010)
> +               bit_depth =3D OVL_CON_CLRFMT_10_BIT;
> +
> +       reg |=3D OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
> +
> +       mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg,
> +                     ovl->regs, DISP_REG_OVL_CLRFMT_EXT);
> +}
> +
>  void mtk_ovl_config(struct device *dev, unsigned int w,
>                     unsigned int h, unsigned int vrefresh,
>                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> @@ -332,9 +362,11 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_=
ovl *ovl, unsigned int fmt)
>                 return OVL_CON_CLRFMT_ARGB8888;
>         case DRM_FORMAT_BGRX8888:
>         case DRM_FORMAT_BGRA8888:
> +       case DRM_FORMAT_BGRA1010102:
>                 return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
>         case DRM_FORMAT_XRGB8888:
>         case DRM_FORMAT_ARGB8888:
> +       case DRM_FORMAT_ARGB2101010:
>                 return OVL_CON_CLRFMT_RGBA8888;
>         case DRM_FORMAT_XBGR8888:
>         case DRM_FORMAT_ABGR8888:
> @@ -418,6 +450,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigne=
d int idx,
>                                       &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
>         }
>
> +       mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
>         mtk_ovl_layer_on(dev, idx, cmdq_pkt);
>  }
>
> --
> 2.39.1.456.gfc5497dd1b-goog
>

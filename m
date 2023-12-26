Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0399681E6F5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 11:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E86F10E1A0;
	Tue, 26 Dec 2023 10:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B895B10E1A0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 10:48:57 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5e54d40cca2so25837107b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 02:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1703587736; x=1704192536;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Qv4TX+Q3LNkRer/VYBfFYjaPXdCM6iONKvmb/cRKfE=;
 b=mMyxGVxnsTlgJhmx7OcOe347wCJs4jY+vsCNry9uSB+9w10h0r7bmJhmWJkIsA0P+n
 +XPDzU+YHaARMVBi2LpgM5AVwpTSzzLG6xTtH8Z91GGSJjruMBRYuCfsgWLX28ZA8xqI
 YkOKBBCnkt/FRR4MdkHxFQY3C3yk4IUc0RwMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703587736; x=1704192536;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Qv4TX+Q3LNkRer/VYBfFYjaPXdCM6iONKvmb/cRKfE=;
 b=YX0B2SuPsuqdLJF0po9oHVD5zdXlMqF7SEJiNOZyyBZUuiufcZR3Vjxo2PISxIS4rO
 JE5muyrjHzzObcg3XtTPrVXSzFt78NpLtpyOnCcrCSTAqlvhpnc7GDRj5O6/JvSgZrdz
 m9c64qegfDEc8p1Z126KqtomyGXbGUIKejCCGNNVx5fwuwxaPkh7mP6mHD00wLS07Pin
 +5YeiBNTeMRouGm5e7mnMRNflvOmr3UzpAT6PeyQPsT227nsZfmdeT98d3MhPwb1j/fw
 egafpfsCG5w/nnSKLRLITHl+gnkCxq94PDpIlopB0BMi/n5rCxBkJeT5J/X/fj8HUyjT
 UMwA==
X-Gm-Message-State: AOJu0YzoyEnElPdMLoupMeCd1nzjxz82p/sxv46pXGZfMXW0Bz0xbNVG
 86zQPlFSdHq69VhQMjbfILSVtVOwmaUceAA9VJiFHbbu+Q==
X-Google-Smtp-Source: AGHT+IEynuE5cozov+mYg8gCjd/XrTEPvUDKJOCXpXpR0p9m/6IBIbBVZEYcVBKZbSJWVvAMHKIxzQ==
X-Received: by 2002:a05:690c:318e:b0:5e8:eaa3:b365 with SMTP id
 fd14-20020a05690c318e00b005e8eaa3b365mr1874694ywb.78.1703587735657; 
 Tue, 26 Dec 2023 02:48:55 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50]) by smtp.gmail.com with ESMTPSA id
 v12-20020ab036cc000000b007ccd27a84c2sm106235uau.7.2023.12.26.02.48.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Dec 2023 02:48:54 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-466f4be526bso326634137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 02:48:54 -0800 (PST)
X-Received: by 2002:a05:6122:4089:b0:4b6:cdd2:b553 with SMTP id
 cb9-20020a056122408900b004b6cdd2b553mr1074016vkb.13.1703587734078; Tue, 26
 Dec 2023 02:48:54 -0800 (PST)
MIME-Version: 1.0
References: <20231220135722.192080-1-angelogioacchino.delregno@collabora.com>
 <20231220135722.192080-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231220135722.192080-3-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 26 Dec 2023 18:48:18 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhNfyEWKaJZjb_G-pXpxSpXvNQd2EMJUzWWwxmC+TzSaA@mail.gmail.com>
Message-ID: <CAC=S1nhNfyEWKaJZjb_G-pXpxSpXvNQd2EMJUzWWwxmC+TzSaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/mediatek: dsi: Cleanup functions
 mtk_dsi_ps_control{_vact}()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

On Wed, Dec 20, 2023 at 9:57=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Function mtk_dsi_ps_control() is a subset of mtk_dsi_ps_control_vact():
> merge the two in one mtk_dsi_ps_control() function by adding one
> function parameter `config_vact` which, when true, writes the VACT
> related registers.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 76 +++++++++---------------------
>  1 file changed, 23 insertions(+), 53 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 23d2c5be8dbb..b618e2e31022 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -352,40 +352,6 @@ static void mtk_dsi_set_vm_cmd(struct mtk_dsi *dsi)
>         mtk_dsi_mask(dsi, DSI_VM_CMD_CON, TS_VFP_EN, TS_VFP_EN);
>  }
>
> -static void mtk_dsi_ps_control_vact(struct mtk_dsi *dsi)
> -{
> -       struct videomode *vm =3D &dsi->vm;
> -       u32 dsi_buf_bpp, ps_wc;
> -       u32 ps_bpp_mode;
> -
> -       if (dsi->format =3D=3D MIPI_DSI_FMT_RGB565)
> -               dsi_buf_bpp =3D 2;
> -       else
> -               dsi_buf_bpp =3D 3;
> -
> -       ps_wc =3D vm->hactive * dsi_buf_bpp;
> -       ps_bpp_mode =3D ps_wc;
> -
> -       switch (dsi->format) {
> -       case MIPI_DSI_FMT_RGB888:
> -               ps_bpp_mode |=3D PACKED_PS_24BIT_RGB888;
> -               break;
> -       case MIPI_DSI_FMT_RGB666:
> -               ps_bpp_mode |=3D PACKED_PS_18BIT_RGB666;
> -               break;
> -       case MIPI_DSI_FMT_RGB666_PACKED:
> -               ps_bpp_mode |=3D LOOSELY_PS_18BIT_RGB666;
> -               break;
> -       case MIPI_DSI_FMT_RGB565:
> -               ps_bpp_mode |=3D PACKED_PS_16BIT_RGB565;
> -               break;
> -       }
> -
> -       writel(vm->vactive, dsi->regs + DSI_VACT_NL);
> -       writel(ps_bpp_mode, dsi->regs + DSI_PSCTRL);
> -       writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
> -}
> -
>  static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>  {
>         u32 tmp_reg;
> @@ -417,36 +383,40 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *ds=
i)
>         writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
>  }
>
> -static void mtk_dsi_ps_control(struct mtk_dsi *dsi)
> +static void mtk_dsi_ps_control(struct mtk_dsi *dsi, bool config_vact)
>  {
> -       u32 dsi_tmp_buf_bpp;
> -       u32 tmp_reg;
> +       struct videomode *vm =3D &dsi->vm;
> +       u32 dsi_buf_bpp, ps_wc;
> +       u32 ps_bpp_mode;
> +
> +       if (dsi->format =3D=3D MIPI_DSI_FMT_RGB565)
> +               dsi_buf_bpp =3D 2;
> +       else
> +               dsi_buf_bpp =3D 3;

The same is also in mtk_dsi_config_vdo_timing(). Given this is a
cleanup series, I think it'd be a good chance to add another patch
and integrate those usages. Just a thought.  :)
>
> +
> +       ps_wc =3D vm->hactive * dsi_buf_bpp;

I noticed the "& DSI_PS_WC" part was dropped (but perhaps with awareness?).

While the outcome seems to always fall within the range of
DSI_PS_WC so we should be fine in practice, I think it doesn't hurt to
keep the value masked to save readers some time to check if this would
ever be possible to overflow and write undesired bits down the line.
WDYT?

Regardless of that, I didn't find obvious issue in this patch, so

Reviewed-by: Fei Shao <fshao@chromium.org>

Regards,
Fei




>
> +       ps_bpp_mode =3D ps_wc;
>
>         switch (dsi->format) {
>         case MIPI_DSI_FMT_RGB888:
> -               tmp_reg =3D PACKED_PS_24BIT_RGB888;
> -               dsi_tmp_buf_bpp =3D 3;
> +               ps_bpp_mode |=3D PACKED_PS_24BIT_RGB888;
>                 break;
>         case MIPI_DSI_FMT_RGB666:
> -               tmp_reg =3D LOOSELY_PS_18BIT_RGB666;
> -               dsi_tmp_buf_bpp =3D 3;
> +               ps_bpp_mode |=3D PACKED_PS_18BIT_RGB666;
>                 break;
>         case MIPI_DSI_FMT_RGB666_PACKED:
> -               tmp_reg =3D PACKED_PS_18BIT_RGB666;
> -               dsi_tmp_buf_bpp =3D 3;
> +               ps_bpp_mode |=3D LOOSELY_PS_18BIT_RGB666;
>                 break;
>         case MIPI_DSI_FMT_RGB565:
> -               tmp_reg =3D PACKED_PS_16BIT_RGB565;
> -               dsi_tmp_buf_bpp =3D 2;
> -               break;
> -       default:
>
> -               tmp_reg =3D PACKED_PS_24BIT_RGB888;
> -               dsi_tmp_buf_bpp =3D 3;
> +               ps_bpp_mode |=3D PACKED_PS_16BIT_RGB565;
>                 break;
>         }
>
> -       tmp_reg +=3D dsi->vm.hactive * dsi_tmp_buf_bpp & DSI_PS_WC;
>
> -       writel(tmp_reg, dsi->regs + DSI_PSCTRL);
> +       if (config_vact) {
> +               writel(vm->vactive, dsi->regs + DSI_VACT_NL);
> +               writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
> +       }
> +       writel(ps_bpp_mode, dsi->regs + DSI_PSCTRL);
>  }
>
>  static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
> @@ -522,7 +492,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi =
*dsi)
>         writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
>         writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
>
> -       mtk_dsi_ps_control(dsi);
> +       mtk_dsi_ps_control(dsi, false);
>  }
>
>  static void mtk_dsi_start(struct mtk_dsi *dsi)
> @@ -667,7 +637,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>         mtk_dsi_reset_engine(dsi);
>         mtk_dsi_phy_timconfig(dsi);
>
> -       mtk_dsi_ps_control_vact(dsi);
> +       mtk_dsi_ps_control(dsi, true);
>         mtk_dsi_set_vm_cmd(dsi);
>         mtk_dsi_config_vdo_timing(dsi);
>         mtk_dsi_set_interrupt_enable(dsi);
> --
> 2.43.0
>
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A18515BC66
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 11:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A746F597;
	Thu, 13 Feb 2020 10:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C796F59B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 10:11:36 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y17so5909571wrh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 02:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ksjF7yiXqkzCYnFGkiR6AVQN19nPTYSla89XvS8l2Tw=;
 b=amh5Tz5EOz149uRg+NFHeQWwEkEi32U1IXVtNh+N+McUFYUmbZKFAZOoqbUYkGngOm
 DEqBt+yZ8Lj3t11NgzMhWYDGc6vrs7UdEH/FZdMo/8ZO6v0bq48tJU+ZozMm3BoAyEBH
 DFMvsNJCrgtWwEAJ0CZW7gFRHMJRL8a0AzbR3lO9V2gNFHv99YNJkikAQviLvq/V5JKM
 3tBfwQg2r1sx0/Vo34HGt7gni9W3qycHLCu6Emkkj6TuLVRA7fhqFBJl8PVJkTQinUwM
 I0uKRI4aaQjuHYbc2t7tiibyzKyPJ+NeaTe1wtskJLIf44VZ1QJlQEiA32Pvv8i9BqWN
 Y+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ksjF7yiXqkzCYnFGkiR6AVQN19nPTYSla89XvS8l2Tw=;
 b=P1BGZE4VQh3HdMCbyjeC121I4K9SIzVmuR/4GSLrOhMoxcjd6vwuJb5JHnt37fhrKh
 68cqfB735PMdAihkj6D3dzocO3MXvgVRE6xDFROt2C0P9YVQahw1hMWPrJJxWwytNfMg
 oeT1JGyEczOZ3ioC9JyXsXS9XZS9RT77k19gTcDOihydx+H/yFleP9P1t89EY1XmGOqA
 QFsMHvSDtsZaBUJ03nAiQKUWIbpQikcJHaElMHrjIZ1IWgcOTo9EoFE29mSEKBbY9HUg
 k+0ezzfX4Z14u2pBiEkfytT0qrHwz7uA2IemnSG5R6TsGBTj/mDo+XD6FnZmRMiDHVcq
 Muhg==
X-Gm-Message-State: APjAAAUIRoO67zjkD6kXgkkWvAr0m+8sFVXmk8HRHWjPqvNXRv8tDZk9
 blKovo9iSEAok3Rr1zrnj7zR6wuZc8fgzurHBrmsPQ==
X-Google-Smtp-Source: APXvYqyiljf2syjKNxj2SOf8cb1caooNh+uZuig+1bXiBW6B6LfvuSmC2wQy2FFPRJykBw2jLxJ6TskpxsP8s5NCDCc=
X-Received: by 2002:adf:e543:: with SMTP id z3mr20296295wrm.369.1581588695370; 
 Thu, 13 Feb 2020 02:11:35 -0800 (PST)
MIME-Version: 1.0
References: <20191223074910.1030-1-chenzhihui4@huawei.com>
In-Reply-To: <20191223074910.1030-1-chenzhihui4@huawei.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Thu, 13 Feb 2020 18:11:23 +0800
Message-ID: <CAKoKPbzkfEKoqPBO2iRZFW29sKfOf4w=zyu85v5RWRP-TTqUaA@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon/hibmc: add gamma_set function
To: Zhihui Chen <chenzhihui4@huawei.com>
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
Cc: puck.chen@hisilicon.com, baowenyi@huawei.com,
 dri-devel@lists.freedesktop.org, kong.kongxinwei@hisilicon.com,
 zourongrong@gmail.com, allan.wang@siliconmotion.com
Content-Type: multipart/mixed; boundary="===============0943969441=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0943969441==
Content-Type: multipart/alternative; boundary="0000000000005e6e49059e725007"

--0000000000005e6e49059e725007
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Dec 2019 at 15:50, Zhihui Chen <chenzhihui4@huawei.com> wrote:

> add gamma_set function, and we can also use it to adjust the brightness of
> the
> display.
>
> Signed-off-by: Zhihui Chen <chenzhihui4@huawei.com>
>

Thanks for the patch.
Acked-by: Xinliang Liu <xinliang.liu@linaro.org>
Applied to drm-misc-next.


> ---
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    | 37 +++++++++++++++++++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h  |  5 +++
>  2 files changed, 42 insertions(+)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index 24de937c1cb1..f1ce6cb099d0 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -456,6 +456,42 @@ static void hibmc_crtc_disable_vblank(struct drm_crtc
> *crtc)
>                priv->mmio + HIBMC_RAW_INTERRUPT_EN);
>  }
>
> +static void hibmc_crtc_load_lut(struct drm_crtc *crtc)
> +{
> +       struct hibmc_drm_private *priv = crtc->dev->dev_private;
> +       void __iomem   *mmio = priv->mmio;
> +       u16 *r, *g, *b;
> +       unsigned int reg;
> +       int i;
> +
> +       r = crtc->gamma_store;
> +       g = r + crtc->gamma_size;
> +       b = g + crtc->gamma_size;
> +
> +       for (i = 0; i < crtc->gamma_size; i++) {
> +               unsigned int offset = i << 2;
> +               u8 red = *r++ >> 8;
> +               u8 green = *g++ >> 8;
> +               u8 blue = *b++ >> 8;
> +               u32 rgb = (red << 16) | (green << 8) | blue;
> +
> +               writel(rgb, mmio + HIBMC_CRT_PALETTE + offset);
> +       }
> +
> +       reg = readl(priv->mmio + HIBMC_CRT_DISP_CTL);
> +       reg |= HIBMC_FIELD(HIBMC_CTL_DISP_CTL_GAMMA, 1);
> +       writel(reg, priv->mmio + HIBMC_CRT_DISP_CTL);
> +}
> +
> +static int hibmc_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16
> *green,
> +                             u16 *blue, uint32_t size,
> +                             struct drm_modeset_acquire_ctx *ctx)
> +{
> +       hibmc_crtc_load_lut(crtc);
> +
> +       return 0;
> +}
> +
>  static const struct drm_crtc_funcs hibmc_crtc_funcs = {
>         .page_flip = drm_atomic_helper_page_flip,
>         .set_config = drm_atomic_helper_set_config,
> @@ -465,6 +501,7 @@ static const struct drm_crtc_funcs hibmc_crtc_funcs = {
>         .atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
>         .enable_vblank = hibmc_crtc_enable_vblank,
>         .disable_vblank = hibmc_crtc_disable_vblank,
> +       .gamma_set = hibmc_crtc_gamma_set,
>  };
>
>  static const struct drm_crtc_helper_funcs hibmc_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
> index b9e20cfcfb5a..9b7e85947113 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
> @@ -91,6 +91,9 @@
>  #define HIBMC_CRT_DISP_CTL_TIMING(x)           ((x) << 8)
>  #define HIBMC_CRT_DISP_CTL_TIMING_MASK         0x100
>
> +#define HIBMC_CTL_DISP_CTL_GAMMA(x)            ((x) << 3)
> +#define HIBMC_CTL_DISP_CTL_GAMMA_MASK          0x08
> +
>  #define HIBMC_CRT_DISP_CTL_PLANE(x)            ((x) << 2)
>  #define HIBMC_CRT_DISP_CTL_PLANE_MASK          4
>
> @@ -193,5 +196,7 @@
>  #define CRT_PLL2_HS_148MHZ                     0xB0CCCCCD
>  #define CRT_PLL2_HS_193MHZ                     0xC0872B02
>
> +#define HIBMC_CRT_PALETTE                       0x80C00
> +
>  #define HIBMC_FIELD(field, value) (field(value) & field##_MASK)
>  #endif
> --
> 2.20.1
>
>
>

--0000000000005e6e49059e725007
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 23 Dec 2019 at 15:50, Zhihui =
Chen &lt;<a href=3D"mailto:chenzhihui4@huawei.com">chenzhihui4@huawei.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">ad=
d gamma_set function, and we can also use it to adjust the brightness of th=
e<br>
display.<br>
<br>
Signed-off-by: Zhihui Chen &lt;<a href=3D"mailto:chenzhihui4@huawei.com" ta=
rget=3D"_blank">chenzhihui4@huawei.com</a>&gt;<br></blockquote><div><br></d=
iv>Thanks for the patch.<br>Acked-by: Xinliang Liu &lt;<a href=3D"mailto:xi=
nliang.liu@linaro.org">xinliang.liu@linaro.org</a>&gt;<br><div>Applied to d=
rm-misc-next.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
=C2=A0.../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c=C2=A0 =C2=A0 | 37 ++++++++=
+++++++++++<br>
=C2=A0.../gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h=C2=A0 |=C2=A0 5 +++<br>
=C2=A02 files changed, 42 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/d=
rm/hisilicon/hibmc/hibmc_drm_de.c<br>
index 24de937c1cb1..f1ce6cb099d0 100644<br>
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c<br>
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c<br>
@@ -456,6 +456,42 @@ static void hibmc_crtc_disable_vblank(struct drm_crtc =
*crtc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;mmio + HIBM=
C_RAW_INTERRUPT_EN);<br>
=C2=A0}<br>
<br>
+static void hibmc_crtc_load_lut(struct drm_crtc *crtc)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct hibmc_drm_private *priv =3D crtc-&gt;dev=
-&gt;dev_private;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem=C2=A0 =C2=A0*mmio =3D priv-&gt;mmi=
o;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 *r, *g, *b;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int reg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D crtc-&gt;gamma_store;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g =3D r + crtc-&gt;gamma_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b =3D g + crtc-&gt;gamma_size;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; crtc-&gt;gamma_size; i++) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int offset=
 =3D i &lt;&lt; 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 red =3D *r++ &gt=
;&gt; 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 green =3D *g++ &=
gt;&gt; 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 blue =3D *b++ &g=
t;&gt; 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rgb =3D (red &l=
t;&lt; 16) | (green &lt;&lt; 8) | blue;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(rgb, mmio + =
HIBMC_CRT_PALETTE + offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D readl(priv-&gt;mmio + HIBMC_CRT_DISP_CT=
L);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D HIBMC_FIELD(HIBMC_CTL_DISP_CTL_GAMMA, =
1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(reg, priv-&gt;mmio + HIBMC_CRT_DISP_CTL)=
;<br>
+}<br>
+<br>
+static int hibmc_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *gree=
n,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u16 *blue, uint32_t size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_modeset_acquire_ctx *ctx)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hibmc_crtc_load_lut(crtc);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0static const struct drm_crtc_funcs hibmc_crtc_funcs =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .page_flip =3D drm_atomic_helper_page_flip,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .set_config =3D drm_atomic_helper_set_config,<b=
r>
@@ -465,6 +501,7 @@ static const struct drm_crtc_funcs hibmc_crtc_funcs =3D=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .atomic_destroy_state =3D drm_atomic_helper_crt=
c_destroy_state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .enable_vblank =3D hibmc_crtc_enable_vblank,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .disable_vblank =3D hibmc_crtc_disable_vblank,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.gamma_set =3D hibmc_crtc_gamma_set,<br>
=C2=A0};<br>
<br>
=C2=A0static const struct drm_crtc_helper_funcs hibmc_crtc_helper_funcs =3D=
 {<br>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h b/drivers/gpu=
/drm/hisilicon/hibmc/hibmc_drm_regs.h<br>
index b9e20cfcfb5a..9b7e85947113 100644<br>
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h<br>
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h<br>
@@ -91,6 +91,9 @@<br>
=C2=A0#define HIBMC_CRT_DISP_CTL_TIMING(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0((x) &lt;&lt; 8)<br>
=C2=A0#define HIBMC_CRT_DISP_CTL_TIMING_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x100<br>
<br>
+#define HIBMC_CTL_DISP_CTL_GAMMA(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ((x) &lt;&lt; 3)<br>
+#define HIBMC_CTL_DISP_CTL_GAMMA_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
08<br>
+<br>
=C2=A0#define HIBMC_CRT_DISP_CTL_PLANE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ((x) &lt;&lt; 2)<br>
=C2=A0#define HIBMC_CRT_DISP_CTL_PLANE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 4<br>
<br>
@@ -193,5 +196,7 @@<br>
=C2=A0#define CRT_PLL2_HS_148MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xB0CCCCCD<br>
=C2=A0#define CRT_PLL2_HS_193MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xC0872B02<br>
<br>
+#define HIBMC_CRT_PALETTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x80C00<br>
+<br>
=C2=A0#define HIBMC_FIELD(field, value) (field(value) &amp; field##_MASK)<b=
r>
=C2=A0#endif<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000005e6e49059e725007--

--===============0943969441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0943969441==--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3B715BC63
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 11:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3A26E1BC;
	Thu, 13 Feb 2020 10:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905426E1BC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 10:11:14 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c84so5951466wme.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 02:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G8noP06oE5flbRJbwStPBcVZ8j5f2NhL4L0eQWnzq/A=;
 b=b/NDXWnRrZF+gu4AXftGz/4+/vr3Rq7Jo30F05uzpsTX4dU908rh4+lAatit15pb7U
 5U7BKJf+9IrgZ1loajAAyGjEc8s6T7bt3z9C/EWhNKfHfLa5e9pTvWE7IaG4CntakYhP
 iOeqL7hnSatkPr8R7uzdhFkXS84P0eSx9vmrrCfRnga3ZZjQ7XIqFEKw+U3FNKNv7HUs
 5SsExG9GovR88UFNwmEplOIvixv4YSR0CbdNt93b9xeJvMr2PtX8y3q5159tcrSkCYjP
 JRIVAdEJZ6pn4mvFhuPUhdGMXrYFJAGyFZRbrLBvpUZkWihlyB+HFXFDZWXIo51P5X04
 7N1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G8noP06oE5flbRJbwStPBcVZ8j5f2NhL4L0eQWnzq/A=;
 b=dONoiVNlNDL6/CL1C+EpGshwWjEMjq2CJESlpKQIZ4ZtUwJ+oOy0Bl+GWg41yF/OVH
 57qVV6gWHCBYoziWrz7viRcw/adm0CEJqhvJRiLvN0hOvHl6nWnwieAXVqsUwO1WaYyv
 zY1II02Y0UBKtgGTbiYRzk/AEvE2QZBK+qwiFEiw0p8iIMrOKOI8kCrZ95BUtlUQ0xUG
 EfuOY5qin2UZ2MqQyYUjdqG0aW4QhKhizxvNPqZfziu9P/uBTrhX+qjbnI8BadAH+VHa
 dEjvHG0lJ+D4DpbC/b7eBbAkyOo3ltuXCB+/83zTs0pLbcgXt/MEMpIdfO+pO4K0fzs2
 Vs2A==
X-Gm-Message-State: APjAAAX2UbhmLPfTdf9p2sWjuAEe3kD9TV9z/RdgLmEW1xJjZjljdzPx
 6JshestCJM0SzNvXrpFIz9JGIO7moWgYFGijJMu6Rg==
X-Google-Smtp-Source: APXvYqycAEXua4RiCbiHWh4wjQnJzTPqFNrLtTj9Q0WjMLr6k8fEJrAMtrV1egK9aziG9GySrlYnX2S0gNgeyiFo3ck=
X-Received: by 2002:a05:600c:291e:: with SMTP id
 i30mr5226580wmd.40.1581588673191; 
 Thu, 13 Feb 2020 02:11:13 -0800 (PST)
MIME-Version: 1.0
References: <20191220023112.2728-1-chenzhihui4@huawei.com>
In-Reply-To: <20191220023112.2728-1-chenzhihui4@huawei.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Thu, 13 Feb 2020 18:11:00 +0800
Message-ID: <CAKoKPbzFTEK=kqeHE1AaJubP5XarEPQ0T4AUYpi3JtxLU5bV3w@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon/hibmc: add DPMS on/off function
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
Cc: chenzhihui244@msn.com, puck.chen@hisilicon.com, baowenyi@huawei.com,
 dri-devel@lists.freedesktop.org, kong.kongxinwei@hisilicon.com,
 zourongrong@gmail.com, allan.wang@siliconmotion.com
Content-Type: multipart/mixed; boundary="===============0849964184=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0849964184==
Content-Type: multipart/alternative; boundary="0000000000000bf7f6059e724f22"

--0000000000000bf7f6059e724f22
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Dec 2019 at 10:31, Zhihui Chen <chenzhihui4@huawei.com> wrote:

> add DPMS function to turn on/off signal of monitor
>
> Signed-off-by: Zhihui Chen <chenzhihui4@huawei.com>
>

Thanks for the patch.
Acked-by: Xinliang Liu <xinliang.liu@linaro.org>
Applied to drm-misc-next.


> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   | 16 ++++++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h |  6 ++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index 722e369f30d4..24de937c1cb1 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -189,6 +189,20 @@ static struct drm_plane *hibmc_plane_init(struct
> hibmc_drm_private *priv)
>         return plane;
>  }
>
> +static void hibmc_crtc_dpms(struct drm_crtc *crtc, int dpms)
> +{
> +       struct hibmc_drm_private *priv = crtc->dev->dev_private;
> +       unsigned int reg;
> +
> +       reg = readl(priv->mmio + HIBMC_CRT_DISP_CTL);
> +       reg &= ~HIBMC_CRT_DISP_CTL_DPMS_MASK;
> +       reg |= HIBMC_FIELD(HIBMC_CRT_DISP_CTL_DPMS, dpms);
> +       reg &= ~HIBMC_CRT_DISP_CTL_TIMING_MASK;
> +       if (dpms == HIBMC_CRT_DPMS_ON)
> +               reg |= HIBMC_CRT_DISP_CTL_TIMING(1);
> +       writel(reg, priv->mmio + HIBMC_CRT_DISP_CTL);
> +}
> +
>  static void hibmc_crtc_atomic_enable(struct drm_crtc *crtc,
>                                      struct drm_crtc_state *old_state)
>  {
> @@ -205,6 +219,7 @@ static void hibmc_crtc_atomic_enable(struct drm_crtc
> *crtc,
>         reg |= HIBMC_CURR_GATE_DISPLAY(1);
>         hibmc_set_current_gate(priv, reg);
>         drm_crtc_vblank_on(crtc);
> +       hibmc_crtc_dpms(crtc, HIBMC_CRT_DPMS_ON);
>  }
>
>  static void hibmc_crtc_atomic_disable(struct drm_crtc *crtc,
> @@ -213,6 +228,7 @@ static void hibmc_crtc_atomic_disable(struct drm_crtc
> *crtc,
>         unsigned int reg;
>         struct hibmc_drm_private *priv = crtc->dev->dev_private;
>
> +       hibmc_crtc_dpms(crtc, HIBMC_CRT_DPMS_OFF);
>         drm_crtc_vblank_off(crtc);
>
>         hibmc_set_power_mode(priv, HIBMC_PW_MODE_CTL_MODE_SLEEP);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
> index b63a1ee15ceb..b9e20cfcfb5a 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
> @@ -68,6 +68,12 @@
>
>  #define HIBMC_CRT_DISP_CTL                     0x80200
>
> +#define HIBMC_CRT_DISP_CTL_DPMS(x)             ((x) << 30)
> +#define HIBMC_CRT_DISP_CTL_DPMS_MASK           0xc0000000
> +
> +#define HIBMC_CRT_DPMS_ON                      0
> +#define HIBMC_CRT_DPMS_OFF                     3
> +
>  #define HIBMC_CRT_DISP_CTL_CRTSELECT(x)                ((x) << 25)
>  #define HIBMC_CRT_DISP_CTL_CRTSELECT_MASK      0x2000000
>
> --
> 2.20.1
>
>
>

--0000000000000bf7f6059e724f22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 20 Dec 2019 at 10:31, Zhihui =
Chen &lt;<a href=3D"mailto:chenzhihui4@huawei.com">chenzhihui4@huawei.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">ad=
d DPMS function to turn on/off signal of monitor<br>
<br>
Signed-off-by: Zhihui Chen &lt;<a href=3D"mailto:chenzhihui4@huawei.com" ta=
rget=3D"_blank">chenzhihui4@huawei.com</a>&gt;<br></blockquote><div>=C2=A0<=
/div><div>Thanks for the patch.<br>Acked-by: Xinliang Liu &lt;<a href=3D"ma=
ilto:xinliang.liu@linaro.org">xinliang.liu@linaro.org</a>&gt;<br>Applied to=
 drm-misc-next.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
---<br>
=C2=A0drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c=C2=A0 =C2=A0| 16 +++++=
+++++++++++<br>
=C2=A0drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h |=C2=A0 6 ++++++<br>
=C2=A02 files changed, 22 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/d=
rm/hisilicon/hibmc/hibmc_drm_de.c<br>
index 722e369f30d4..24de937c1cb1 100644<br>
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c<br>
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c<br>
@@ -189,6 +189,20 @@ static struct drm_plane *hibmc_plane_init(struct hibmc=
_drm_private *priv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return plane;<br>
=C2=A0}<br>
<br>
+static void hibmc_crtc_dpms(struct drm_crtc *crtc, int dpms)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct hibmc_drm_private *priv =3D crtc-&gt;dev=
-&gt;dev_private;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int reg;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D readl(priv-&gt;mmio + HIBMC_CRT_DISP_CT=
L);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg &amp;=3D ~HIBMC_CRT_DISP_CTL_DPMS_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D HIBMC_FIELD(HIBMC_CRT_DISP_CTL_DPMS, d=
pms);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg &amp;=3D ~HIBMC_CRT_DISP_CTL_TIMING_MASK;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpms =3D=3D HIBMC_CRT_DPMS_ON)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D HIBMC_CRT_=
DISP_CTL_TIMING(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(reg, priv-&gt;mmio + HIBMC_CRT_DISP_CTL)=
;<br>
+}<br>
+<br>
=C2=A0static void hibmc_crtc_atomic_enable(struct drm_crtc *crtc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc_=
state *old_state)<br>
=C2=A0{<br>
@@ -205,6 +219,7 @@ static void hibmc_crtc_atomic_enable(struct drm_crtc *c=
rtc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg |=3D HIBMC_CURR_GATE_DISPLAY(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hibmc_set_current_gate(priv, reg);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_crtc_vblank_on(crtc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hibmc_crtc_dpms(crtc, HIBMC_CRT_DPMS_ON);<br>
=C2=A0}<br>
<br>
=C2=A0static void hibmc_crtc_atomic_disable(struct drm_crtc *crtc,<br>
@@ -213,6 +228,7 @@ static void hibmc_crtc_atomic_disable(struct drm_crtc *=
crtc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct hibmc_drm_private *priv =3D crtc-&gt;dev=
-&gt;dev_private;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hibmc_crtc_dpms(crtc, HIBMC_CRT_DPMS_OFF);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_crtc_vblank_off(crtc);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hibmc_set_power_mode(priv, HIBMC_PW_MODE_CTL_MO=
DE_SLEEP);<br>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h b/drivers/gpu=
/drm/hisilicon/hibmc/hibmc_drm_regs.h<br>
index b63a1ee15ceb..b9e20cfcfb5a 100644<br>
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h<br>
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h<br>
@@ -68,6 +68,12 @@<br>
<br>
=C2=A0#define HIBMC_CRT_DISP_CTL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x80200<br>
<br>
+#define HIBMC_CRT_DISP_CTL_DPMS(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0((x) &lt;&lt; 30)<br>
+#define HIBMC_CRT_DISP_CTL_DPMS_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00xc0000000<br>
+<br>
+#define HIBMC_CRT_DPMS_ON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
+#define HIBMC_CRT_DPMS_OFF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A03<br>
+<br>
=C2=A0#define HIBMC_CRT_DISP_CTL_CRTSELECT(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((x) &lt;&lt; 25)<br>
=C2=A0#define HIBMC_CRT_DISP_CTL_CRTSELECT_MASK=C2=A0 =C2=A0 =C2=A0 0x20000=
00<br>
<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000000bf7f6059e724f22--

--===============0849964184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0849964184==--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C687C181A15
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 14:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B176E97B;
	Wed, 11 Mar 2020 13:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434016E97B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 13:45:58 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD5AD222C3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 13:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583934358;
 bh=uW0VU9Tgnm5d1OvwMhs7EwcSnEly22Vb5pK/UpojZjQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RH40C8VsUgWzWEwUk4n3rbJczDs/+WeEtkGElHNHVs06PtsY1o6/1mB71Uo/6IhPm
 qrPJg1izzZEmgkulhTVloOmBsUOQkTZkw9YRCUZkJNSVbojTdf61rkkklgsSeuBt6z
 42VuyaytnR79wR6/cPBwYm9BC2I9w97qpXq2HmfI=
Received: by mail-ed1-f46.google.com with SMTP id b23so2942439edx.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 06:45:57 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3cqBbRJ/3R+i8AbT6uc15g4rWRSJAlZxbOYyfkhIYekUeFWmuT
 JAgxNK978w71A433kbrLQXGhNWYs67Xdw8rFHA==
X-Google-Smtp-Source: ADFU+vtugKBkHVvZ3Y7y8ha5yk612f5v8iKDTmtcw7lnaz3OPhNuV93ZDwCEGZQpOQf6jDRZMmZUyFNm22lE0FMTv0U=
X-Received: by 2002:a17:906:5ad4:: with SMTP id
 x20mr2343134ejs.293.1583934356103; 
 Wed, 11 Mar 2020 06:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200311071823.117899-1-jitao.shi@mediatek.com>
 <20200311071823.117899-7-jitao.shi@mediatek.com>
In-Reply-To: <20200311071823.117899-7-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 11 Mar 2020 21:45:43 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-s5jNYgxsNEO_E5O32N+0UiKV2Ay-5SgfONhCY6MoYSQ@mail.gmail.com>
Message-ID: <CAAOTY_-s5jNYgxsNEO_E5O32N+0UiKV2Ay-5SgfONhCY6MoYSQ@mail.gmail.com>
Subject: Re: [PATCH v13 6/6] drm/mediatek: set dpi pin mode to gpio low to
 avoid leakage current
To: Jitao Shi <jitao.shi@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0740211952=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0740211952==
Content-Type: multipart/alternative; boundary="000000000000a4a6bf05a094747a"

--000000000000a4a6bf05a094747a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jitao Shi <jitao.shi@mediatek.com> =E6=96=BC 2020=E5=B9=B43=E6=9C=8811=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:19=E5=AF=AB=E9=81=93=EF=BC=9A

> Config dpi pins mode to output and pull low when dpi is disabled.
> Aovid leakage current from some dpi pins (Hsync Vsync DE ... ).
>
>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>


> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 31 ++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 2871e68e7767..b6359e979588 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -10,7 +10,9 @@
>  #include <linux/kernel.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_gpio.h>
>  #include <linux/of_graph.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/types.h>
>
> @@ -74,6 +76,9 @@ struct mtk_dpi {
>         enum mtk_dpi_out_yc_map yc_map;
>         enum mtk_dpi_out_bit_num bit_num;
>         enum mtk_dpi_out_channel_swap channel_swap;
> +       struct pinctrl *pinctrl;
> +       struct pinctrl_state *pins_gpio;
> +       struct pinctrl_state *pins_dpi;
>         int refcount;
>         u32 pclk_sample;
>  };
> @@ -387,6 +392,9 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
>         if (--dpi->refcount !=3D 0)
>                 return;
>
> +       if (dpi->pinctrl && dpi->pins_gpio)
> +               pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
> +
>         mtk_dpi_disable(dpi);
>         clk_disable_unprepare(dpi->pixel_clk);
>         clk_disable_unprepare(dpi->engine_clk);
> @@ -411,6 +419,9 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>                 goto err_pixel;
>         }
>
> +       if (dpi->pinctrl && dpi->pins_dpi)
> +               pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> +
>         mtk_dpi_enable(dpi);
>         return 0;
>
> @@ -728,6 +739,26 @@ static int mtk_dpi_probe(struct platform_device *pde=
v)
>         of_property_read_u32(ep, "pclk-sample", &dpi->pclk_sample);
>         of_node_put(ep);
>
> +       dpi->pinctrl =3D devm_pinctrl_get(&pdev->dev);
> +       if (IS_ERR(dpi->pinctrl)) {
> +               dpi->pinctrl =3D NULL;
> +               dev_dbg(&pdev->dev, "Cannot find pinctrl!\n");
> +       }
> +       if (dpi->pinctrl) {
> +               dpi->pins_gpio =3D pinctrl_lookup_state(dpi->pinctrl,
> "sleep");
> +               if (IS_ERR(dpi->pins_gpio)) {
> +                       dpi->pins_gpio =3D NULL;
> +                       dev_dbg(&pdev->dev, "Cannot find pinctrl idle!\n"=
);
> +               }
> +               if (dpi->pins_gpio)
> +                       pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio=
);
> +
> +               dpi->pins_dpi =3D pinctrl_lookup_state(dpi->pinctrl,
> "default");
> +               if (IS_ERR(dpi->pins_dpi)) {
> +                       dpi->pins_dpi =3D NULL;
> +                       dev_dbg(&pdev->dev, "Cannot find pinctrl
> active!\n");
> +               }
> +       }
>         mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         dpi->regs =3D devm_ioremap_resource(dev, mem);
>         if (IS_ERR(dpi->regs)) {
> --
> 2.21.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--000000000000a4a6bf05a094747a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div class=3D"gmail_attr" dir=3D"ltr">Jitao Shi &lt;<a hre=
f=3D"mailto:jitao.shi@mediatek.com">jitao.shi@mediatek.com</a>&gt; =E6=96=
=BC 2020=E5=B9=B43=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=
=883:19=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb=
(204,204,204);border-left-width:1px;border-left-style:solid">Config dpi pin=
s mode to output and pull low when dpi is disabled.<br>
Aovid leakage current from some dpi pins (Hsync Vsync DE ... ).<br>
<br></blockquote><div><br></div><div><span style=3D"text-align:left;color:r=
gb(34,34,34);text-transform:none;text-indent:0px;letter-spacing:normal;font=
-family:Arial,Helvetica,sans-serif;font-size:13.33px;font-style:normal;font=
-variant:normal;font-weight:400;text-decoration:none;word-spacing:0px;displ=
ay:inline;white-space:normal;float:none;background-color:rgb(255,255,255)">=
Reviewed-by: Chun-Kuang Hu &lt;</span><a style=3D"text-align:left;color:rgb=
(17,85,204);text-transform:none;text-indent:0px;letter-spacing:normal;font-=
family:Arial,Helvetica,sans-serif;font-size:13.33px;font-style:normal;font-=
variant:normal;font-weight:400;text-decoration:underline;word-spacing:0px;w=
hite-space:normal" href=3D"mailto:chunkuang.hu@kernel.org" target=3D"_blank=
">chunkuang.hu@kernel.org</a><span style=3D"text-align:left;color:rgb(34,34=
,34);text-transform:none;text-indent:0px;letter-spacing:normal;font-family:=
Arial,Helvetica,sans-serif;font-size:13.33px;font-style:normal;font-variant=
:normal;font-weight:400;text-decoration:none;word-spacing:0px;display:inlin=
e;white-space:normal;float:none;background-color:rgb(255,255,255)">&gt;</sp=
an><b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-wid=
th:1px;border-left-style:solid">
Signed-off-by: Jitao Shi &lt;<a href=3D"mailto:jitao.shi@mediatek.com" targ=
et=3D"_blank">jitao.shi@mediatek.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/mediatek/mtk_dpi.c | 31 +++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 31 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/=
mtk_dpi.c<br>
index 2871e68e7767..b6359e979588 100644<br>
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c<br>
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c<br>
@@ -10,7 +10,9 @@<br>
=C2=A0#include &lt;linux/kernel.h&gt;<br>
=C2=A0#include &lt;linux/of.h&gt;<br>
=C2=A0#include &lt;linux/of_device.h&gt;<br>
+#include &lt;linux/of_gpio.h&gt;<br>
=C2=A0#include &lt;linux/of_graph.h&gt;<br>
+#include &lt;linux/pinctrl/consumer.h&gt;<br>
=C2=A0#include &lt;linux/platform_device.h&gt;<br>
=C2=A0#include &lt;linux/types.h&gt;<br>
<br>
@@ -74,6 +76,9 @@ struct mtk_dpi {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enum mtk_dpi_out_yc_map yc_map;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enum mtk_dpi_out_bit_num bit_num;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enum mtk_dpi_out_channel_swap channel_swap;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pinctrl *pinctrl;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pinctrl_state *pins_gpio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pinctrl_state *pins_dpi;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int refcount;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 pclk_sample;<br>
=C2=A0};<br>
@@ -387,6 +392,9 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (--dpi-&gt;refcount !=3D 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpi-&gt;pinctrl &amp;&amp; dpi-&gt;pins_gpi=
o)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl_select_stat=
e(dpi-&gt;pinctrl, dpi-&gt;pins_gpio);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtk_dpi_disable(dpi);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_disable_unprepare(dpi-&gt;pixel_clk);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_disable_unprepare(dpi-&gt;engine_clk);<br>
@@ -411,6 +419,9 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_pixel;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpi-&gt;pinctrl &amp;&amp; dpi-&gt;pins_dpi=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl_select_stat=
e(dpi-&gt;pinctrl, dpi-&gt;pins_dpi);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtk_dpi_enable(dpi);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
<br>
@@ -728,6 +739,26 @@ static int mtk_dpi_probe(struct platform_device *pdev)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of_property_read_u32(ep, &quot;pclk-sample&quot=
;, &amp;dpi-&gt;pclk_sample);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of_node_put(ep);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dpi-&gt;pinctrl =3D devm_pinctrl_get(&amp;pdev-=
&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dpi-&gt;pinctrl)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpi-&gt;pinctrl =3D=
 NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;pdev-&=
gt;dev, &quot;Cannot find pinctrl!\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpi-&gt;pinctrl) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpi-&gt;pins_gpio =
=3D pinctrl_lookup_state(dpi-&gt;pinctrl, &quot;sleep&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dpi-&gt;=
pins_gpio)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dpi-&gt;pins_gpio =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_dbg(&amp;pdev-&gt;dev, &quot;Cannot find pinctrl idle!\n&quot=
;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpi-&gt;pins_gp=
io)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pinctrl_select_state(dpi-&gt;pinctrl, dpi-&gt;pins_gpio);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpi-&gt;pins_dpi =
=3D pinctrl_lookup_state(dpi-&gt;pinctrl, &quot;default&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dpi-&gt;=
pins_dpi)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dpi-&gt;pins_dpi =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_dbg(&amp;pdev-&gt;dev, &quot;Cannot find pinctrl active!\n&qu=
ot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem =3D platform_get_resource(pdev, IORESOURCE_=
MEM, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dpi-&gt;regs =3D devm_ioremap_resource(dev, mem=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(dpi-&gt;regs)) {<br>
-- <br>
2.21.0<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank" rel=3D"noreferrer">https://lists.freedesktop.org/mailman/listin=
fo/dri-devel</a><br>
</blockquote></div></div></div>

--000000000000a4a6bf05a094747a--

--===============0740211952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0740211952==--

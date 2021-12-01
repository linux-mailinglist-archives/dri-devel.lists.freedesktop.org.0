Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 972BF4659E6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 00:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369966E8B2;
	Wed,  1 Dec 2021 23:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65A76E8B2
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 23:37:26 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id v23so33130026iom.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 15:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zo8YXEUbYGqDa79ucPwzK28jwfA/SClC+sF2TBpVPDE=;
 b=Ea3DUfbwLMjY2pACYWdt0QFA7L6siw0XP+LVHynC90QrXzUV1G8NvL8yFNPKTEru65
 fgK0cd2L93+2/0CkgrPbXC912T5yurmGAW1Q5h5COnyDYbzpcuxwjU9obQEDhd4FjLjH
 +vDq4zyM09QmCYr7FEzZR1p+o4VhU3PqZyxOynQUX0mDBjzs8bemwzH4EP5oN9z0toEk
 CavOWvPB8ODLDFR/qDAL/2R7rjapPGrkUB48Nj+FQOtcz7XdDgix5QuXvDAA5shEamnL
 PSrniCSGau+pgcwQ5R25+MorNU4hEHabf2pfRJyIACJjXigBD+7yAVUiczwgiwz3IzeV
 B4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zo8YXEUbYGqDa79ucPwzK28jwfA/SClC+sF2TBpVPDE=;
 b=SKJA5F4AfREJYMN2t4pLhPPPoWbTShymw7YunWqBt6zGl+TueSaAoLnEGBD9vzP0y3
 4265AlM+oPuEUYT49dP6MJcoCizmkkzm335CxuDDtklLsYJPt+vETeyF+E99mtzM4lPM
 1pRwHPwOrUPjYKCAQ1sjv3Yca0jI5eqCDkf/PvDcSx8rcCgb/M4R8oLVfyVSG5cr3djv
 4OWLIWE+tUoXW7feio6MkzE/ZZOyVv2TdzdNbKo9qTXXDsMExw9pQI54z/oHkeWmGOOE
 vtpKouKE7XUQS7JMKZE59rldRVVUcM19LYWzh0m1ZNoUvcSdp6WMuANG6+3xo0pZuFPK
 BdMg==
X-Gm-Message-State: AOAM533Z8tA5gzVkFFPfEVQzQAsaH3eIBVKkCh6hCLTtn2m80j2qmEaG
 74/Klif3lsZR+5d4YV7jfPdIjda0ZSuJjkSg/hOGfg==
X-Google-Smtp-Source: ABdhPJwm9mOVg8v1z2E8a2da3cA/o68X777883Yi88HBjU+qFInbHFyed6K/lWBIDBdtbSvJm+cebwtLsb5ckuOnZh0=
X-Received: by 2002:a05:6638:2512:: with SMTP id
 v18mr15038837jat.22.1638401845801; 
 Wed, 01 Dec 2021 15:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-2-yunfei.dong@mediatek.com>
In-Reply-To: <20211129034201.5767-2-yunfei.dong@mediatek.com>
From: Steve Cho <stevecho@google.com>
Date: Wed, 1 Dec 2021 15:36:50 -0800
Message-ID: <CAN0yncGA5OKGdLJwX12thgCjwQkfxc55v-d1Wfw-4qP=cF3_Pw@mail.gmail.com>
Subject: Re: [PATCH v11, 01/19] media: mtk-vcodec: Get numbers of register
 bases from DT
To: Yunfei Dong <yunfei.dong@mediatek.com>
Content-Type: multipart/alternative; boundary="00000000000005089005d21e284e"
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

--00000000000005089005d21e284e
Content-Type: text/plain; charset="UTF-8"

LGTM with few nits.

Thanks,
Steve

On Sun, Nov 28, 2021 at 7:44 PM Yunfei Dong <yunfei.dong@mediatek.com>
wrote:

> Different platform may has different numbers of register bases. Gets the
> numbers of register bases from DT (sizeof(u32) * 4 bytes for each)

Few nits.
s/platform/platforms/
s/has/have/

Btw, what is DT?

>
>
Reviewed-by: Tzung-Bi Shih<tzungbi@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 37 ++++++++++++++-----
>  1 file changed, 28 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index e6e6a8203eeb..59caf2163349 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -78,6 +78,30 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq,
> void *priv)
>         return IRQ_HANDLED;
>  }
>
> +static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
> +{
>
I see that dev is already checked before entering into this function, but
null check for dev would still be nice.


> +       struct platform_device *pdev = dev->plat_dev;
> +       int reg_num, i;
> +
> +       /* Sizeof(u32) * 4 bytes for each register base. */
> +       reg_num = of_property_count_elems_of_size(pdev->dev.of_node, "reg",
> +               sizeof(u32) * 4);
> +       if (reg_num <= 0 || reg_num > NUM_MAX_VDEC_REG_BASE) {
> +               dev_err(&pdev->dev, "Invalid register property size:
> %d\n", reg_num);
> +               return -EINVAL;
> +       }
> +
> +       for (i = 0; i < reg_num; i++) {
> +               dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
> +               if (IS_ERR(dev->reg_base[i]))
> +                       return PTR_ERR(dev->reg_base[i]);
> +
> +               mtk_v4l2_debug(2, "reg[%d] base=%p", i, dev->reg_base[i]);
> +       }
> +
> +       return 0;
> +}
> +
>  static int fops_vcodec_open(struct file *file)
>  {
>         struct mtk_vcodec_dev *dev = video_drvdata(file);
> @@ -206,7 +230,7 @@ static int mtk_vcodec_probe(struct platform_device
> *pdev)
>         struct resource *res;
>         phandle rproc_phandle;
>         enum mtk_vcodec_fw_type fw_type;
> -       int i, ret;
> +       int ret;
>
>         dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
>         if (!dev)
> @@ -238,14 +262,9 @@ static int mtk_vcodec_probe(struct platform_device
> *pdev)
>                 goto err_dec_pm;
>         }
>
> -       for (i = 0; i < NUM_MAX_VDEC_REG_BASE; i++) {
> -               dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
> -               if (IS_ERR((__force void *)dev->reg_base[i])) {
> -                       ret = PTR_ERR((__force void *)dev->reg_base[i]);
> -                       goto err_res;
> -               }
> -               mtk_v4l2_debug(2, "reg[%d] base=%p", i, dev->reg_base[i]);
> -       }
> +       ret = mtk_vcodec_get_reg_bases(dev);
> +       if (ret)
> +               goto err_res;
>
>         res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>         if (res == NULL) {
> --
> 2.25.1
>
>

--00000000000005089005d21e284e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LGTM with few nits.=C2=A0</div><div dir=
=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Thanks,<div>Steve</div>=
</div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Sun, Nov 28, 2021 at 7:44 PM Yunfei Dong &lt;<a href=
=3D"mailto:yunfei.dong@mediatek.com">yunfei.dong@mediatek.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Different plat=
form may has different numbers of register bases. Gets the<br>
numbers of register bases from DT (sizeof(u32) * 4 bytes for each)</blockqu=
ote><div>Few nits.</div><div>s/platform/platforms/</div><div>s/has/have/</d=
iv><div><br></div><div>Btw, what is DT?</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">=C2=A0<br></blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
Reviewed-by: Tzung-Bi Shih&lt;<a href=3D"mailto:tzungbi@google.com" target=
=3D"_blank">tzungbi@google.com</a>&gt;<br>
Signed-off-by: Yunfei Dong &lt;<a href=3D"mailto:yunfei.dong@mediatek.com" =
target=3D"_blank">yunfei.dong@mediatek.com</a>&gt;<br>
---<br>
=C2=A0.../platform/mtk-vcodec/mtk_vcodec_dec_drv.c=C2=A0 | 37 +++++++++++++=
+-----<br>
=C2=A01 file changed, 28 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drive=
rs/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c<br>
index e6e6a8203eeb..59caf2163349 100644<br>
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c<br>
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c<br>
@@ -78,6 +78,30 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, v=
oid *priv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return IRQ_HANDLED;<br>
=C2=A0}<br>
<br>
+static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)<br>
+{<br></blockquote><div>I see that dev is already checked before entering i=
nto this function, but null check for dev would still be nice.=C2=A0</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D dev-&gt;plat_d=
ev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int reg_num, i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Sizeof(u32) * 4 bytes for each register base=
. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_num =3D of_property_count_elems_of_size(pde=
v-&gt;dev.of_node, &quot;reg&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(u32) * 4);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_num &lt;=3D 0 || reg_num &gt; NUM_MAX_V=
DEC_REG_BASE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;Invalid register property size: %d\n&quot;, reg_num);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; reg_num; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;reg_base[i]=
 =3D devm_platform_ioremap_resource(pdev, i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dev-&gt;=
reg_base[i]))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return PTR_ERR(dev-&gt;reg_base[i]);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mtk_v4l2_debug(2, &=
quot;reg[%d] base=3D%p&quot;, i, dev-&gt;reg_base[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0static int fops_vcodec_open(struct file *file)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mtk_vcodec_dev *dev =3D video_drvdata(fi=
le);<br>
@@ -206,7 +230,7 @@ static int mtk_vcodec_probe(struct platform_device *pde=
v)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct resource *res;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 phandle rproc_phandle;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enum mtk_vcodec_fw_type fw_type;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(=
*dev), GFP_KERNEL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dev)<br>
@@ -238,14 +262,9 @@ static int mtk_vcodec_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_dec_pm;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; NUM_MAX_VDEC_REG_BASE; i++=
) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;reg_base[i]=
 =3D devm_platform_ioremap_resource(pdev, i);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR((__force=
 void *)dev-&gt;reg_base[i])) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D PTR_ERR((__force void *)dev-&gt;reg_base[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto err_res;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mtk_v4l2_debug(2, &=
quot;reg[%d] base=3D%p&quot;, i, dev-&gt;reg_base[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mtk_vcodec_get_reg_bases(dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_res;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D platform_get_resource(pdev, IORESOURCE_=
IRQ, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res =3D=3D NULL) {<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000005089005d21e284e--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9052466873
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FEB6E0E5;
	Thu,  2 Dec 2021 16:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8D16E0E5
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:39:35 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id j21so29521269ila.5
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fIICwKawn3+lmioVwV/M5GQKWPVDiFh22YtcNFyruwE=;
 b=eVgNmuHflabJKpUT1+72ibiYV/fwNhCJBl+cNGOPtlRwgZ/dN1hUZnYJO4M2lHeRmE
 Fk3GZji1PfpMfKJO8mR6Wdi1sp9NMYhaV31aN8Oi0JRNGvSowgmjnSE6EPsP6I78L1sS
 ALlpLdeTGjq/28Yv8o6ZYPx/HsRNARluYdzFLsJ/dbVyIemHniGGsBylO5XLXHO+QG4k
 4V84y9S+XCnhc8OtEqN7A23kW44feC54xCC3dZKxL5mLCXk1ylJVBEcLx9bU38iFCi2U
 fG04kvN7OmoA8S9UneCKKZq3f9AQQpPKSFjpB46QIJ6d77uPDoaDWrRahv+yqZaOOluV
 KTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fIICwKawn3+lmioVwV/M5GQKWPVDiFh22YtcNFyruwE=;
 b=K9lQhmY31m+NIsRESSLNEjl/sVWJLPVW7Qrs5TEIJqCi7MWdq332bz5dH3BSYSPKBZ
 VPOmRcfKxQp+8esqHgr0Po2pFNJz3sk/4QhgKueCulcEhApDsIPq+ead2/zJ7KdFOuLs
 C7er3o1U5HhbfU1ONienJ2gX3xwDSMDwoY2av8KN5uYlZ8Mmp2x34onadvhj3sIZsHeI
 zhBbbiKJT3stQI2LymVYh6+JpYJB/9Z+AYPDiidbrUT6B4U1Uss/zdMx8cHOs0q10cG2
 SoHk3G/Ul8KCEAiAC06LJIwRCLkYyap+xTIFf26z9/9I/H17Vs2PfUsJekX8+BY11NaL
 axZw==
X-Gm-Message-State: AOAM533EbHjGE3ULmagyMTEfj/k4Sk1azdg7CSXKNMtC2SmRHB8vVnOT
 v6qxqzlAy8TxxZBBeR9aB4Un2gfHQeK4wkuE//HFjg==
X-Google-Smtp-Source: ABdhPJymIKgc0+BQZ9x6JSeJYrlG/oz0B9qoejMrda8JgIaLmYFo5uv2/gCSyZPufVckDu6xbCshdryAI/iO1Oi62gc=
X-Received: by 2002:a05:6e02:1b01:: with SMTP id
 i1mr13665634ilv.94.1638463174713; 
 Thu, 02 Dec 2021 08:39:34 -0800 (PST)
MIME-Version: 1.0
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-2-yunfei.dong@mediatek.com>
 <CAN0yncGA5OKGdLJwX12thgCjwQkfxc55v-d1Wfw-4qP=cF3_Pw@mail.gmail.com>
 <90950d579c6613fa52500ff5f2e7602b483dcb3d.camel@mediatek.com>
In-Reply-To: <90950d579c6613fa52500ff5f2e7602b483dcb3d.camel@mediatek.com>
From: Steve Cho <stevecho@google.com>
Date: Thu, 2 Dec 2021 08:38:58 -0800
Message-ID: <CAN0yncFnrea=FHc8O4YLopXxN8WksrEDN1Z-X7VUOfcv_Y5n=Q@mail.gmail.com>
Subject: Re: [PATCH v11, 01/19] media: mtk-vcodec: Get numbers of register
 bases from DT
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
Content-Type: multipart/alternative; boundary="00000000000082414b05d22c6f29"
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

--00000000000082414b05d22c6f29
Content-Type: text/plain; charset="UTF-8"

Thanks,
Steve

On Wed, Dec 1, 2021 at 6:38 PM yunfei.dong@mediatek.com <
yunfei.dong@mediatek.com> wrote:

> Hi Steve,
>
> Thanks for your suggestion.
> On Wed, 2021-12-01 at 15:36 -0800, Steve Cho wrote:
>
> LGTM with few nits.
>
> Thanks,
> Steve
>
> On Sun, Nov 28, 2021 at 7:44 PM Yunfei Dong <yunfei.dong@mediatek.com>
> wrote:
>
> Different platform may has different numbers of register bases. Gets the
> numbers of register bases from DT (sizeof(u32) * 4 bytes for each)
>
> Few nits.
> s/platform/platforms/
> s/has/have/
>
> Fix, DT is dts.
> Btw, what is DT?
>
>
> Reviewed-by: Tzung-Bi Shih<tzungbi@google.com>
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
> I see that dev is already checked before entering into this function, but
> null check for dev would still be nice.
>
>
> Dev is never null in this function, whether it looks not very reasonable?
>
That is correct with current code. In Chromium world, reviewers still
suggest to null check in similar situations.
Up to you. It is fine with me as it is.


> Best Regards,
> Yunfei Dong
>
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
>
>

--00000000000082414b05d22c6f29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
">Thanks,<div>Steve</div></div></div></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 1, 2021 at 6:38 PM <=
a href=3D"mailto:yunfei.dong@mediatek.com">yunfei.dong@mediatek.com</a> &lt=
;<a href=3D"mailto:yunfei.dong@mediatek.com">yunfei.dong@mediatek.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div s=
tyle=3D"text-align:left;direction:ltr"><div>Hi Steve,</div><div><br></div><=
div>Thanks for your suggestion.</div><div>On Wed, 2021-12-01 at 15:36 -0800=
, Steve Cho wrote:</div><blockquote type=3D"cite" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:2px solid rgb(114,159,207);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr">LGTM with few nits.=C2=A0</div><div dir=3D"ltr"><=
br clear=3D"all"><div><div dir=3D"ltr"><div dir=3D"ltr">Thanks,<div>Steve</=
div></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sun, Nov 28, 2021 at 7:44 PM Yunfei Dong &lt;<a hr=
ef=3D"mailto:yunfei.dong@mediatek.com" target=3D"_blank">yunfei.dong@mediat=
ek.com</a>&gt; wrote:<br></div><blockquote type=3D"cite" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:2px solid rgb(114,159,207);padding-left:1ex">Di=
fferent platform may has different numbers of register bases. Gets the<br>
numbers of register bases from DT (sizeof(u32) * 4 bytes for each)<br></blo=
ckquote><div>Few nits.</div><div>s/platform/platforms/</div><div>s/has/have=
/</div><div><br></div><div>Fix, DT is dts.</div><div>Btw, what is DT?</div>=
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">=C2=A0<br>
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
div>=C2=A0</div></div></div></blockquote><div>Dev is never null in this fun=
ction, whether it looks not very reasonable?</div></div></blockquote><div>T=
hat is correct with current code. In Chromium world, reviewers still sugges=
t to null check in similar situations.=C2=A0</div><div>Up to you. It is fin=
e with me as it is.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div style=3D"text-align:left;direction:ltr"><div></=
div><div>Best Regards,</div><div>Yunfei Dong</div><blockquote type=3D"cite"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:2px solid rgb(114,159,207);p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote ty=
pe=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px solid rgb(114=
,159,207);padding-left:1ex">
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
</blockquote></div></div></blockquote></div>
</blockquote></div></div>

--00000000000082414b05d22c6f29--

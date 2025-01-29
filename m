Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411F6A22381
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 19:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A18E10E087;
	Wed, 29 Jan 2025 18:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bg0u8ocs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DF510E087
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738173621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nqyDkjvRUysrwh4PELuHmLTFtieFiuB96Vrt8jInMXw=;
 b=bg0u8ocstr+cbIGQF7AKAg3lAFWLUTqEXZ8AmBmekuwIHdduBSmhTLzmV1XlSOQ3zvLgfI
 1BTOA73bwEhfkX0g6J3pp51tPhpzlWVw3IdA0OjawcmsoSlubp1++WXjQPKEyGW+sAfz7W
 fR7yunzjQqrcENSvIpm/CpGW/hkaqgk=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-wln5E6pFOq6_d8HzXBAZbQ-1; Wed, 29 Jan 2025 13:00:19 -0500
X-MC-Unique: wln5E6pFOq6_d8HzXBAZbQ-1
X-Mimecast-MFC-AGG-ID: wln5E6pFOq6_d8HzXBAZbQ
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-e399d4ef55cso19328739276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 10:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738173618; x=1738778418;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nqyDkjvRUysrwh4PELuHmLTFtieFiuB96Vrt8jInMXw=;
 b=DvuwFNHgkN7BymPyNERtALykp55yM/MYTpqcv0ub6lNPb+SsY0485Pl9GWEXuKx44x
 xN/Dr9izYROYy5rbgLxeDnLrTfjhyqpnhrjyfUu20vLLBHlV2DwZMQyVFCZcQNy2Y87j
 3VJWHF7eYLCoNAXGXYWpC1APWDQt7yv92eYnrpFBtEva02WxBD09XDtBStfvG7VE4eJa
 bTdzQszjC66OhCl7qspe4cjGypVscjzKuX06pvdaEufDYSadhMLoLrW0KZrmuy6EvwS9
 nt90oa/XdtaQzHP1DqE+obSYDgJKc5MQgwHw2pMKEfNfZfnwgxZ/ShkiOIq2kRJVIVrT
 nZTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV1AWHKPbXM/l4k9CFlq5NLN9QuThYcEpGoPNf9ZTrCSwoI3dTwNuiq1cVqPbLkPRxeK99ZSZbvu0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdnCZ5VK/kq5yhzRYifaUgwQcrwC31qboPC0caufCPA30kRsI8
 A8J1pBGYG6A4bNk+3SeKm5g870INA3+mUwf7Hwmx4YE50meVhuL8a0CMIhyem/CMo9nOJSM+E8o
 uU46jTydrJZtnnQZGy/+/Hzsc1yOFk5n7ClONmsUGF52ibEO+fY757c0DLCRd5jzj/YvOx8lm0U
 zhvomhK7y1TDE6qCH+TB5Ypw7HZhj5ghyx1nQmYBRb
X-Gm-Gg: ASbGncvtpMNgG4GGwP56WO9rnU8wNTjBuwKf2IglnaffLs67uyPdtsGkdnOTetf6L9h
 EH6tYhVfnWljAiVybLgfkQBLhNmVLKbsIO9CQqYiaZK3JqOOhfoCJ1IYcUTA9
X-Received: by 2002:a05:690c:6b0e:b0:6ef:8c41:dee0 with SMTP id
 00721157ae682-6f7a837a551mr33579687b3.20.1738173618102; 
 Wed, 29 Jan 2025 10:00:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNwNDB7SeoR2hOqJ83NGvf+7/6aagiTUDM5yFm91TKvfpUEtQemjfCIOkHEzx0pR6XBCyUXQDsQ7LBiLTNnPI=
X-Received: by 2002:a05:690c:6b0e:b0:6ef:8c41:dee0 with SMTP id
 00721157ae682-6f7a837a551mr33578737b3.20.1738173617562; Wed, 29 Jan 2025
 10:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-13-0d1609a29587@redhat.com>
 <CAPY8ntBvJpSFhOwqBPmiN59Z0EpienEm-=M-euHdQU8XLGgXUA@mail.gmail.com>
In-Reply-To: <CAPY8ntBvJpSFhOwqBPmiN59Z0EpienEm-=M-euHdQU8XLGgXUA@mail.gmail.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 29 Jan 2025 13:00:06 -0500
X-Gm-Features: AWEUYZkNBFsPsHrKCDC5xJ-gNE5tqY69PNKeLsi61kNwK-N1agru8qUFF63-ZWw
Message-ID: <CAN9Xe3SbqYNqZzPtywWOX3Uj3a76GT7pDBwaa=YM2zWAcGj8Gg@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/vc4: move to devm_platform_ioremap_resource()
 usage
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
 Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
 John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marex@denx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, 
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HsUS6vgVSu4CRtp4hXVWOhGQvf2IBM8n_7Mg5328PX0_1738173618
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000087f3b062cdc15a4"
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

--000000000000087f3b062cdc15a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 8:18=E2=80=AFAM Dave Stevenson <
dave.stevenson@raspberrypi.com> wrote:

> Hi Anusha
>
> On Tue, 28 Jan 2025 at 22:33, Anusha Srivatsa <asrivats@redhat.com> wrote=
:
> >
> > Replace platform_get_resource_byname + devm_ioremap_resource
> > with just devm_platform_ioremap_resource()
> >
> > Used Coccinelle to do this change. SmPl patch:
> > //rule s/(devm_)platform_get_resource_byname +
> > //(devm_)ioremap/devm_platform_ioremap_resource.
> > @rule_3@
> > identifier res;
> > expression ioremap;
> > identifier pdev;
> > constant mem;
> > expression name;
> > @@
> > -struct resource *res;
> > ...
> > -res =3D platform_get_resource_byname(pdev,mem,name);
> > <...
> > -if (!res) {
> > -...
> > -}
> > ...>
> > -ioremap =3D devm_ioremap(...);
> > +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Cc: "Ma=C3=ADra Canal" <mcanal@igalia.com>
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c
> b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index
> 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..e22733f8159aa4b247a915e24a236f6=
20bae932c
> 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -2951,15 +2951,10 @@ static int vc5_hdmi_init_resources(struct
> drm_device *drm,
> >  {
> >         struct platform_device *pdev =3D vc4_hdmi->pdev;
> >         struct device *dev =3D &pdev->dev;
> > -       struct resource *res;
> >         int ret;
> >
> > -       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdm=
i");
> > -       if (!res)
> > -               return -ENODEV;
> > -
> > -       vc4_hdmi->hdmicore_regs =3D devm_ioremap(dev, res->start,
> > -                                              resource_size(res));
> > +       vc4_hdmi->hdmicore_regs =3D
> devm_platform_ioremap_resource_byname(pdev,
> > +
>  "hdmi");
>
> Whilst I totally agree with this change, why was only one of the 8
> instances of this pattern within this function updated? Is that a
> limitation in your script?
>
> https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/vc4/vc4_hdm=
i.c#L2957-L3020
>
>
Yes! looks like it is. My script is missing one set of ellipses which makes
it apply the rule only to the first appearance of the pattern. Will rectify
this. Thanks!!

Anusha

>   Dave
>
> >         if (!vc4_hdmi->hdmicore_regs)
> >                 return -ENOMEM;
> >
> >
> > --
> > 2.47.0
> >
>
>

--000000000000087f3b062cdc15a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 29,=
 2025 at 8:18=E2=80=AFAM Dave Stevenson &lt;<a href=3D"mailto:dave.stevenso=
n@raspberrypi.com">dave.stevenson@raspberrypi.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi Anusha<br>
<br>
On Tue, 28 Jan 2025 at 22:33, Anusha Srivatsa &lt;<a href=3D"mailto:asrivat=
s@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Replace platform_get_resource_byname + devm_ioremap_resource<br>
&gt; with just devm_platform_ioremap_resource()<br>
&gt;<br>
&gt; Used Coccinelle to do this change. SmPl patch:<br>
&gt; //rule s/(devm_)platform_get_resource_byname +<br>
&gt; //(devm_)ioremap/devm_platform_ioremap_resource.<br>
&gt; @rule_3@<br>
&gt; identifier res;<br>
&gt; expression ioremap;<br>
&gt; identifier pdev;<br>
&gt; constant mem;<br>
&gt; expression name;<br>
&gt; @@<br>
&gt; -struct resource *res;<br>
&gt; ...<br>
&gt; -res =3D platform_get_resource_byname(pdev,mem,name);<br>
&gt; &lt;...<br>
&gt; -if (!res) {<br>
&gt; -...<br>
&gt; -}<br>
&gt; ...&gt;<br>
&gt; -ioremap =3D devm_ioremap(...);<br>
&gt; +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);<br>
&gt;<br>
&gt; Cc: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" target=3D"=
_blank">mripard@kernel.org</a>&gt;<br>
&gt; Cc: Dave Stevenson &lt;<a href=3D"mailto:dave.stevenson@raspberrypi.co=
m" target=3D"_blank">dave.stevenson@raspberrypi.com</a>&gt;<br>
&gt; Cc: &quot;Ma=C3=ADra Canal&quot; &lt;<a href=3D"mailto:mcanal@igalia.c=
om" target=3D"_blank">mcanal@igalia.com</a>&gt;<br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 ++-------<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_=
hdmi.c<br>
&gt; index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..e22733f8159aa4b247a915=
e24a236f620bae932c 100644<br>
&gt; --- a/drivers/gpu/drm/vc4/vc4_hdmi.c<br>
&gt; +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c<br>
&gt; @@ -2951,15 +2951,10 @@ static int vc5_hdmi_init_resources(struct drm_=
device *drm,<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D vc4_=
hdmi-&gt;pdev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;=
dev;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource_byname(pdev,=
 IORESOURCE_MEM, &quot;hdmi&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!res)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV=
;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0vc4_hdmi-&gt;hdmicore_regs =3D devm_iorema=
p(dev, res-&gt;start,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vc4_hdmi-&gt;hdmicore_regs =3D devm_platfo=
rm_ioremap_resource_byname(pdev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hdmi&quot;);<br>
<br>
Whilst I totally agree with this change, why was only one of the 8<br>
instances of this pattern within this function updated? Is that a<br>
limitation in your script?<br>
<a href=3D"https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/vc=
4/vc4_hdmi.c#L2957-L3020" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/torvalds/linux/blob/master/drivers/gpu/drm/vc4/vc4_hdmi.c#L2957-L302=
0</a><br>
<br></blockquote><div><br></div><div>Yes! looks like it is. My script is mi=
ssing one set of ellipses which makes it apply the rule only to the first a=
ppearance of the pattern. Will rectify this. Thanks!!</div><div><br></div><=
div>Anusha<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 Dave<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vc4_hdmi-&gt;hdmicore_regs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
NOMEM;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; 2.47.0<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000087f3b062cdc15a4--


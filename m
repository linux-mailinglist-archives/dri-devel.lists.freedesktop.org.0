Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F67A31273
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 18:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAFA10E723;
	Tue, 11 Feb 2025 17:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gsC42Ios";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BB510E723
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 17:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739293753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6KqtiPP9cAbKw9pLfJEtjIYHOv1qD2Gmu69RxwYEKDs=;
 b=gsC42IosRwLW6MYbNT8rrgLP5obBC7Dw5O+8Ds2oWyp681u43H8XXP1MwOdPN4KmPfc+Jz
 0A0mchDl+IQgwETwL0Ar8Ab4VRYQ6w7/fp3CrJ5MitRYKsJlt8xN7FxxnEqQ6XoJfYpS8q
 J5p+aW6QFQeqY4iy1qpGfHFsJ/Uymps=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-o1H_9NS3OQeWXF426tCxdg-1; Tue, 11 Feb 2025 12:09:12 -0500
X-MC-Unique: o1H_9NS3OQeWXF426tCxdg-1
X-Mimecast-MFC-AGG-ID: o1H_9NS3OQeWXF426tCxdg
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-6f6d40a61e7so70006157b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 09:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739293751; x=1739898551;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6KqtiPP9cAbKw9pLfJEtjIYHOv1qD2Gmu69RxwYEKDs=;
 b=tiPLCCj7KaEckPQLRnbfonww/wKjgW+EPHY15U7AvsZM7Ygn07B7NIU8/GTja+HMJs
 34F7At/FU6N4MYDqACnmK7I8V7d8AxipPiSdEFnhJklujqkEk1nSJd3nciHaDoEQ7XA5
 AAlof5Z7m6qjugETNBQ9lYjVSa8Ph00aU7FXRQTvkCWPAaFOPWYkITW/Bmy+8QhEJypW
 VIQmKcmJO6JlGyXQWKSYiq9T02QvRcx7jM7Km3hEKcStGe+2uNyxng2H3HMFlLtU1PzQ
 XsFpJW/YvTi4KER81jKs3MsTcvpAtYzATf+Zelv77OCAeedTvtUj21rcwtrmS2Nz++jr
 JpVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIT1RE4cNr9sU6TqPBcuLsp1WndQ1KefQh4O+5HSwFyL6BDC9LUFXKYpaOjuYB4Og++A/PIWVUaXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZZ2nHXwmUSDmTSy0PQEOXii6XJ0H9Ui3OFqDFr08AzsVOfTl3
 jP7BLw8K7TLBQqd6nAF3B3Xb54kNK+ECrgt0C6SnvQI+pcW4c1R5mcIjwidXtheMOZOl8qdxv5o
 ETlGz0EiCBpY2WnI70OYdFq/8zbCA1RDFcCaRJXkjoCZCuEBBi/8ngfKoLepp5Wg7ci5S8P5lR2
 NWJcqj9wBKYybgequwrnFDfyTZRX6BWldRmqmO9AiM
X-Gm-Gg: ASbGncu5S1mAWFrSibuVefSVRxwLQmnb7MhR6JE9/V/DuYEux7MXhNbQKW9wW+pik2z
 hGt5t0pp60SVPXlwe2bhwfu3wl8SUpMOkLQEN4UsYfKvInVbC1W5FYNMpYVNY
X-Received: by 2002:a05:690c:620b:b0:6f7:598d:34c2 with SMTP id
 00721157ae682-6fb1f68334dmr2317517b3.24.1739293749955; 
 Tue, 11 Feb 2025 09:09:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfKa1KCPRXDPfQeav0M9USwT61j5FjOY5ty4cMA/v4gmNerkCy0F091v6rJjoChnCBHioJN5La+YrVT3vOwcs=
X-Received: by 2002:a05:690c:620b:b0:6f7:598d:34c2 with SMTP id
 00721157ae682-6fb1f68334dmr2315547b3.24.1739293748119; Tue, 11 Feb 2025
 09:09:08 -0800 (PST)
MIME-Version: 1.0
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
 <20250205-mem-cocci-newapi-v1-11-aebf2b0e2300@redhat.com>
 <20250206-hallowed-ultra-tiger-cfec8e@houat>
In-Reply-To: <20250206-hallowed-ultra-tiger-cfec8e@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 11 Feb 2025 12:08:57 -0500
X-Gm-Features: AWEUYZnpF-xtMX2zoqL1SmW6M0UxWIfNDoln_2D_Wz78SFwXrsyRItY4Zv4vDPk
Message-ID: <CAN9Xe3SpTG7r2UkN7_pH0uMXhU5u+dkWhaM9+w5VyOQZp9byNg@mail.gmail.com>
Subject: Re: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource()
 usage
To: Maxime Ripard <mripard@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
 Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
 John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, 
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SvR_pRvJ4ZIehrETJi_834WJhnKZUNeo3_gb_pZ29mI_1739293751
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000004607d062de0e274"
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

--00000000000004607d062de0e274
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 11:13=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:

> On Wed, Feb 05, 2025 at 03:08:07PM -0500, Anusha Srivatsa wrote:
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
> > <+...
> > -res =3D platform_get_resource_byname(pdev,mem,name);
> > <...
> > -if (!res) {
> > -...
> > -}
> > ...>
> > -ioremap =3D devm_ioremap(...);
> > +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
> > ...+>
> >
> > v2: Change the SmPl patch to work on multiple occurences of
> > the pattern. This also fixes the compilation error.
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Cc: Ma=C3=ADra Canal <mcanal@igalia.com>
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 55
> +++++++++++-------------------------------
> >  1 file changed, 14 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c
> b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index
> 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..066f1246dab420ee889845b0c573d80=
ce7c88595
> 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -2951,71 +2951,44 @@ static int vc5_hdmi_init_resources(struct
> drm_device *drm,
> >  {
> >       struct platform_device *pdev =3D vc4_hdmi->pdev;
> >       struct device *dev =3D &pdev->dev;
> > -     struct resource *res;
> >       int ret;
> >
> > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdmi"=
);
> > -     if (!res)
> > -             return -ENODEV;
> > -
> > -     vc4_hdmi->hdmicore_regs =3D devm_ioremap(dev, res->start,
> > -                                            resource_size(res));
> > +     vc4_hdmi->hdmicore_regs =3D
> devm_platform_ioremap_resource_byname(pdev,
> > +
>  "hdmi");
> >       if (!vc4_hdmi->hdmicore_regs)
> >               return -ENOMEM;
> >
> > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd");
> > -     if (!res)
> > -             return -ENODEV;
> > -
> > -     vc4_hdmi->hd_regs =3D devm_ioremap(dev, res->start,
> resource_size(res));
> > +     vc4_hdmi->hd_regs =3D devm_platform_ioremap_resource_byname(pdev,
> "hd");
> >       if (!vc4_hdmi->hd_regs)
> >               return -ENOMEM;
>
> I *think* that one is shared between both HDMI controllers on the
> RaspberryPi4, so we can't claim them from both instances. We should add
> a comment there to document that it's on purpose.
>
> How about vc4_hdmi->hdmicore_regs? It also has another instance
vc4_hdmi_init_resources(). Looks like that also doesnt need any converting
and shold be left as is.

Anusha

> The rest looks good.
>
> Maxime
>

--00000000000004607d062de0e274
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 6, =
2025 at 11:13=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel=
.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Wed, Feb 05, 2025 at 03:08:07PM -0500, Anusha Sr=
ivatsa wrote:<br>
&gt; Replace platform_get_resource_byname + devm_ioremap_resource<br>
&gt; with just devm_platform_ioremap_resource()<br>
&gt; <br>
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
&gt; &lt;+...<br>
&gt; -res =3D platform_get_resource_byname(pdev,mem,name);<br>
&gt; &lt;...<br>
&gt; -if (!res) {<br>
&gt; -...<br>
&gt; -}<br>
&gt; ...&gt;<br>
&gt; -ioremap =3D devm_ioremap(...);<br>
&gt; +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);<br>
&gt; ...+&gt;<br>
&gt; <br>
&gt; v2: Change the SmPl patch to work on multiple occurences of<br>
&gt; the pattern. This also fixes the compilation error.<br>
&gt; <br>
&gt; Cc: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" target=3D"=
_blank">mripard@kernel.org</a>&gt;<br>
&gt; Cc: Dave Stevenson &lt;<a href=3D"mailto:dave.stevenson@raspberrypi.co=
m" target=3D"_blank">dave.stevenson@raspberrypi.com</a>&gt;<br>
&gt; Cc: Ma=C3=ADra Canal &lt;<a href=3D"mailto:mcanal@igalia.com" target=
=3D"_blank">mcanal@igalia.com</a>&gt;<br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/vc4/vc4_hdmi.c | 55 +++++++++++-----------------=
--------------<br>
&gt;=C2=A0 1 file changed, 14 insertions(+), 41 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_=
hdmi.c<br>
&gt; index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..066f1246dab420ee889845=
b0c573d80ce7c88595 100644<br>
&gt; --- a/drivers/gpu/drm/vc4/vc4_hdmi.c<br>
&gt; +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c<br>
&gt; @@ -2951,71 +2951,44 @@ static int vc5_hdmi_init_resources(struct drm_=
device *drm,<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D vc4_hdmi-&g=
t;pdev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource_byname(pdev, IORESO=
URCE_MEM, &quot;hdmi&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!res)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0vc4_hdmi-&gt;hdmicore_regs =3D devm_ioremap(dev, =
res-&gt;start,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vc4_hdmi-&gt;hdmicore_regs =3D devm_platform_iore=
map_resource_byname(pdev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hdmi&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vc4_hdmi-&gt;hdmicore_regs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource_byname(pdev, IORESO=
URCE_MEM, &quot;hd&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!res)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0vc4_hdmi-&gt;hd_regs =3D devm_ioremap(dev, res-&g=
t;start, resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vc4_hdmi-&gt;hd_regs =3D devm_platform_ioremap_re=
source_byname(pdev, &quot;hd&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vc4_hdmi-&gt;hd_regs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
<br>
I *think* that one is shared between both HDMI controllers on the<br>
RaspberryPi4, so we can&#39;t claim them from both instances. We should add=
<br>
a comment there to document that it&#39;s on purpose.<br>
<br></blockquote><div>How about vc4_hdmi-&gt;hdmicore_regs? It also has ano=
ther instance vc4_hdmi_init_resources(). Looks like that also doesnt need a=
ny converting and shold be left as is.</div><div><br></div><div>Anusha<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
The rest looks good.<br>
<br>
Maxime<br>
</blockquote></div></div>

--00000000000004607d062de0e274--


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A283911B7
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D266EC29;
	Wed, 26 May 2021 08:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1096EC29
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:00:10 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so395459wmg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GfwRj98POsvrbO3K0pzw9bSxUUt/IU1P9BkPwlzftF8=;
 b=b4h88skHOifBGL0khktzNyQdSGiIGeZHokelOpQgjlekbTRaTTup1XEfj+jLViuWME
 TyuiXZ9BKPA1/M20Dv5KnE+tKESdBQR8YzHcDj6MD82Um/p00P+wmiglRXz9/lnqmcom
 Nu2XeaCGWa9bk8hxBS5jYkB2COb8wzUHpGAswxAIgThJAvwPC6LhJM8HTHfMyz/pnQ5/
 A+j6GNlpce1lSWhrK3arEarTIIM1XlG2IduLPq39a5qpS6U1YnwMlBb0HGOIgtPaRy4i
 ABQC+0r5LLd/ApVQMvwLCs6NCVCNlMYjW17plxeOyrjFJ6khk8V0svW+bKWkJ6twd8kl
 Bb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GfwRj98POsvrbO3K0pzw9bSxUUt/IU1P9BkPwlzftF8=;
 b=A7T9asXNhEuDzn9nSCd9VkBN3OFaA3dhjQJbCuZ2MDknXjbr8pVezjzwg4ekhKEJve
 xMe2CeDse9ToWbW6IPCD3eLPY5tmosYhsJfMZaEOvoSZpyfJ+bSYktTaUVc/eNYs1RMC
 Rx2DXZ1/EwApawujwBtmvvfREYLj4EsePCruMnHRJuZFyoXpfMgT9xwRR5MaHQrEmrTI
 d/wohMRw/RQmmuSFZ6YR4OIDA8BcxycjfkKHqgNaCDjjlrTtPY/AB8yv4dmjcbd+zc/S
 FBjU7JLUuEdNtZ/AmZ1Q/ZCZ93tNMUX6QhMAPEhpRYmv92pU5vijPHzWYOuaUe1dn6cr
 O0vw==
X-Gm-Message-State: AOAM530svaULH089HSmFmg9NiDeRUkhAFwdjwnABQxYnoH8kqyqq677a
 oDkvBLlDnIXQNDBROIegTGuRzKTAX5lLoJVgBT8=
X-Google-Smtp-Source: ABdhPJw2pqjUlSghIw3lFWImLjpOFfUI+le6BqBxaJFGfJIANc5K69qXH3ERe94ZyOcF3dnO2sNsKIrEx2UoY3Lh9mo=
X-Received: by 2002:a05:600c:3227:: with SMTP id
 r39mr27807520wmp.26.1622016008763; 
 Wed, 26 May 2021 01:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210425123607.26537-1-kevin3.tang@gmail.com>
 <20210425123607.26537-5-kevin3.tang@gmail.com>
 <20210430092249.n75to2das5m6p4zb@gilmour>
 <CAFPSGXYJxWJDo1cz+kJB8J9YayGx1hYa=04K5OJ3DHh9ifbuRQ@mail.gmail.com>
 <YKI26bZGAA+ZNLLj@8bytes.org> <bc0e3025-60bd-c6b4-117f-592dc1c1a2f0@arm.com>
In-Reply-To: <bc0e3025-60bd-c6b4-117f-592dc1c1a2f0@arm.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 26 May 2021 15:59:32 +0800
Message-ID: <CAAfSe-ughdeZ7YaVsXuWeGNq-+Q+_z+P=aeKpj957kE6d-hLmQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] drm/sprd: add Unisoc's drm display controller
 driver
To: Robin Murphy <robin.murphy@arm.com>
Content-Type: multipart/alternative; boundary="00000000000005ba6d05c3370898"
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Kevin Tang <kevin3.tang@gmail.com>, David Airlie <airlied@linux.ie>,
 Joerg Roedel <joro@8bytes.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Orson Zhai <orsonzhai@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000005ba6d05c3370898
Content-Type: text/plain; charset="UTF-8"

Hi Robin,

On Tue, 18 May 2021 at 00:35, Robin Murphy <robin.murphy@arm.com> wrote:

> On 2021-05-17 10:27, Joerg Roedel wrote:
> > On Fri, Apr 30, 2021 at 08:20:10PM +0800, Kevin Tang wrote:
> >> Cc  Robin & Joerg
> >
> > This is just some GPU internal MMU being used here, it seems. It doesn't
> > use the IOMMU core code, so no Ack needed from the IOMMU side.
>
> Except the actual MMU being used is drivers/iommu/sprd_iommu.c - this is


Yes, it is using drivers/iommu/sprd_iommu.c.


>
> just the display driver poking directly at the interrupt registers of
> its associated IOMMU instance.


Actually the display driver is poking its own interrupt registers in which
some interrupts are caused by using IOMMU, others are purely its own ones:
+/* Interrupt control & status bits */
+#define BIT_DPU_INT_DONE               BIT(0)
+#define BIT_DPU_INT_TE                 BIT(1)
+#define BIT_DPU_INT_ERR                        BIT(2)
+#define BIT_DPU_INT_UPDATE_DONE                BIT(4)
+#define BIT_DPU_INT_VSYNC              BIT(5)
+#define BIT_DPU_INT_MMU_VAOR_RD                BIT(16)
+#define BIT_DPU_INT_MMU_VAOR_WR                BIT(17)
+#define BIT_DPU_INT_MMU_INV_RD         BIT(18)
+#define BIT_DPU_INT_MMU_INV_WR         BIT(19)

From what I see in the product code, along with the information my
colleagues told me, these _INT_MMU_ interrupts only need to be dealt with
by client devices(i.e. display). IOMMU doesn't even have the INT_STS
register for some early products which we're trying to support in the
mainstream kernel.


> I still think this is wrong, and that it
> should be treated as a shared interrupt, with the IOMMU driver handling
> its own registers and reporting to the client through the standard
> report_iommu_fault() API, especially since there are apparently more
> blocks using these IOMMU instances than just the display.
>

For the next generation IOMMU, we will handle interrupts in IOMMU drivers
like you say here.
But like I explained above, we have to leave interrupt handling in the
client device driver since the IOMMU we 're using in this display device
doesn't have an INT_STS register in the IOMMU register range.

Thanks for the review,
Chunyan


> Robin.
>

--00000000000005ba6d05c3370898
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace">Hi Robin,</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, 18 May 2021 at 00:35, Robin Murp=
hy &lt;<a href=3D"mailto:robin.murphy@arm.com" target=3D"_blank">robin.murp=
hy@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 2021-05-17 10:27, Joerg Roedel wrote:<br>
&gt; On Fri, Apr 30, 2021 at 08:20:10PM +0800, Kevin Tang wrote:<br>
&gt;&gt; Cc=C2=A0 Robin &amp; Joerg<br>
&gt; <br>
&gt; This is just some GPU internal MMU being used here, it seems. It doesn=
&#39;t<br>
&gt; use the IOMMU core code, so no Ack needed from the IOMMU side.<br>
<br>
Except the actual MMU being used is <span class=3D"gmail_default" style=3D"=
font-family:monospace"></span>drivers/iommu/sprd_iommu.c - this is</blockqu=
ote><div><br></div><div><div class=3D"gmail_default" style=3D"font-family:m=
onospace">Yes, it is using <span class=3D"gmail_default"></span><span style=
=3D"font-family:Arial,Helvetica,sans-serif">drivers/iommu/sprd_iommu.c.</sp=
an></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"> <br>
just the display driver poking directly at the interrupt registers of <br>
its associated IOMMU instance. </blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-family:monospace">Actually the display dri=
ver is poking its own interrupt registers in which some interrupts are caus=
ed by using IOMMU, others are purely its own ones:</div>+/*=C2=A0<span>Inte=
rrupt</span>=C2=A0control &amp; status bits */<br>+#define BIT_DPU_INT_DONE=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>+#define B=
IT_DPU_INT_TE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
BIT(1)<br>+#define BIT_DPU_INT_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(2)<br>+#define BIT_DPU_INT_U=
PDATE_DONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(4)<br=
>+#define BIT_DPU_INT_VSYNC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 BIT(5)<br>+#define BIT_DPU_INT_MMU_VAOR_RD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 BIT(16)<br>+#define BIT_DPU_INT_MMU_VAOR_WR=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(17)<br>+#define BIT_DP=
U_INT_MMU_INV_RD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(18)<br><div class=3D"=
gmail_default" style=3D"font-family:monospace"><span style=3D"font-family:A=
rial,Helvetica,sans-serif">+#define BIT_DPU_INT_MMU_INV_WR=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BIT(19)</span></div></div><div class=3D"gmail_default" sty=
le=3D"font-family:monospace"><span style=3D"font-family:Arial,Helvetica,san=
s-serif"><br></span></div><div class=3D"gmail_default" style=3D"font-family=
:monospace"><span style=3D"font-family:Arial,Helvetica,sans-serif">From wha=
t I see in the product code, along with the information my colleagues told =
me, these _INT_MMU_ interrupts  only need to be dealt with by client device=
s(i.e. display). IOMMU doesn&#39;t even have the INT_STS register for some =
early products which we&#39;re trying to support in the mainstream kernel.<=
/span></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">I still think this is wrong, and that it <br>
should be treated as a shared interrupt, with the IOMMU driver handling <br=
>
its own registers and reporting to the client through the standard <br>
report_iommu_fault() API, especially since there are apparently more <br>
blocks using these IOMMU instances than just the display.<br></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-family:monosp=
ace">For the next generation IOMMU, we will handle interrupts in IOMMU driv=
ers like you say here.</div></div><div class=3D"gmail_default" style=3D"fon=
t-family:monospace">But like I explained above, we have to leave interrupt =
handling in the client device driver since the IOMMU we &#39;re using in th=
is display device doesn&#39;t have an INT_STS register in the IOMMU registe=
r range.</div><div class=3D"gmail_default" style=3D"font-family:monospace">=
<br></div><div class=3D"gmail_default" style=3D"font-family:monospace">Than=
ks for the review,</div><div class=3D"gmail_default" style=3D"font-family:m=
onospace">Chunyan</div><div class=3D"gmail_default" style=3D"font-family:mo=
nospace"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Robin.<br>
</blockquote></div></div>

--00000000000005ba6d05c3370898--

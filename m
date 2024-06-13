Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D22B907383
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 15:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A04810EA8D;
	Thu, 13 Jun 2024 13:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lc35jH/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FE110EA90
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 13:23:26 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-6ce533b643dso752770a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 06:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718285005; x=1718889805; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UY7+qVTCBnkic8L6HrX2KqWBFLJlyWpgMqTcC8mYb1g=;
 b=Lc35jH/Dyko7dPSsC6s/GAXZCazyoGdLNIr8k3DxqhQDz+AUIv0SAdHusKQCCf5u9Q
 wjQnDZbB1JvNXsqFSiUAeBbd+Ju2skWjVv2FfKFeT+App1C2B7UGj9611/h+KxkDTcVX
 iT3QEScCY/QIPPCrG7dos4odWTTOOwlBmiY3lwM8CCMboY3lLhUJGf0LPaHYxA81mwsk
 +wGKX+8EptqW0LqkabarM/R0rIfb189TkWsRXSYQaEe9apBveZvrKnmIMp+BYVL+3eYR
 NAIG9xhHNkFU7ErFbnaK/vxAcijJvQJeVKhDWcZnaCE2WywU+yu9U0Lo3WsprmRU+R+I
 SbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718285005; x=1718889805;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UY7+qVTCBnkic8L6HrX2KqWBFLJlyWpgMqTcC8mYb1g=;
 b=sgQL2uatA/el9obO9olVS6KciIYwsPcIIZ1zVtLnD/T2t6p0MgRasJ2U77BploBTuq
 lS9HFW/x/JOBkw7nH33wB0bm+R35REgrSeEjBPaAY4PesrVF5sCGrwO/ynxiaWf5zJ+6
 A78bNSb69RwcM17UjzbRqGGeMWN/Z1+2sNJwW5kBmTCq4j5k1v5KTsYd7wDClI2NFT2r
 7Ddr/+dgXz/i6EzH3cUnLUL0i6Qp0x9HtIupv2fENzpaQ108/pBqXaMPv0CZSIr6SM/U
 h297pj5gMpt5mrN/YZcsQagADem4j+Mpxljxn9+nvWAwL67PRwJYFRfjlNc+Oymflo3r
 6oWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA4haUxdAOQ+t/e1IQdrMH78tKFd81WViksc7Hi2pk25q5fhW0N75syOXYAuNU1AJxsA2NcmS0TI1CDFrsWBlU+Svv37/yAVALMAWsjceD
X-Gm-Message-State: AOJu0Yz01EK1AFDsDYnLOjii65XWVQlngF6EKoBhp4627DZD2sCkqY8S
 RqQNP0x7/MjHS5t0LvmFHqmLNJA9SXhZGFdmrsze45LXUu99Vv9KQ2PY1czfw3fr37D4rpJrEa+
 cTZ+vUGc+I1ZQYiG9UaGZVMxccyM=
X-Google-Smtp-Source: AGHT+IFjS6qqHBjZXHKWN1u+dasS0C5YOlgGO92F1+LaOmoGNT/BOCRy3ovZaMBx8lFhb6yb/cyp8I+kce1iGOhlNQM=
X-Received: by 2002:a17:90b:1909:b0:2bf:de54:f5b with SMTP id
 98e67ed59e1d1-2c4a762fdebmr4954256a91.18.1718285005354; Thu, 13 Jun 2024
 06:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-4-wenst@chromium.org>
 <cc5847a486a760921375f069a4f65cd29453a624.camel@imgtec.com>
 <CAGXv+5FBqcXjTc+DO8VQierzcxTYhyNxpw+AuuB4U1H_Xo6wPg@mail.gmail.com>
 <CAGXv+5HC_spBAc-t4cS+aCOQKdfWRzMkXK94HmD1Qg02ML4Uug@mail.gmail.com>
In-Reply-To: <CAGXv+5HC_spBAc-t4cS+aCOQKdfWRzMkXK94HmD1Qg02ML4Uug@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 13 Jun 2024 08:23:13 -0500
Message-ID: <CAHCN7xLHWCmeHJJY9tHFOng4EeJOqXCm9H-EA7cbABd-jogmfQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173
 GPU
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Frank Binns <Frank.Binns@imgtec.com>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 Matt Coster <Matt.Coster@imgtec.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 13, 2024 at 4:10=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Tue, Jun 4, 2024 at 12:18=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > On Fri, May 31, 2024 at 9:37=E2=80=AFPM Frank Binns <Frank.Binns@imgtec=
.com> wrote:
> > >
> > > Hi ChenYu,
> > >
> > > On Thu, 2024-05-30 at 16:35 +0800, Chen-Yu Tsai wrote:
> > > > The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
> > > > of the Series6XT GPUs, another sub-family of the Rogue family.
> > >
> > > I've added Adam Ford who sent out some DT related patches [1] for the=
 Renesas
> > > variant of GX6250 and the GX6650 (another Series6XT GPU).
> > >
> > > >
> > > > This was part of the very first few versions of the PowerVR submiss=
ion,
> > > > but was later dropped. The compatible string has been updated to fo=
llow
> > > > the new naming scheme adopted for the AXE series.
> > > >
> > > > In a previous iteration of the PowerVR binding submission [1], the
> > > > number of clocks required for the 6XT family was mentioned to be
> > > > always 3. This is also reflected here.
> > > >
> > > > [1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c7=
93a43c79c2a.camel@imgtec.com/
> > > >
> > > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > ---
> > > >  .../bindings/gpu/img,powervr-rogue.yaml       | 24 +++++++++++++++=
----
> > > >  1 file changed, 20 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogu=
e.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > > > index 256e252f8087..48aa205b66b4 100644
> > > > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > > > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > > > @@ -12,10 +12,17 @@ maintainers:
> > > >
> > > >  properties:
> > > >    compatible:
> > > > -    items:
> > > > -      - enum:
> > > > -          - ti,am62-gpu
> > > > -      - const: img,img-axe # IMG AXE GPU model/revision is fully d=
iscoverable
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - enum:
> > > > +              - mediatek,mt8173-gpu
> > > > +          # PowerVR 6XT GPU model/revision is fully discoverable
> > > > +          - const: img,powervr-6xt
> > > > +      - items:
> > > > +          - enum:
> > > > +              - ti,am62-gpu
> > > > +          # IMG AXE GPU model/revision is fully discoverable
> > > > +          - const: img,img-axe
> > >
> > > The Series6XT GPU models have differing numbers of power domains (eit=
her 2, 4 or
> > > 5). Whereas, the AXE GPUs have a single power domain, so I assume the=
re should
> > > be a related change here.
> > >
> > > The GX6250 has two power domains (lets call them A and B). There's a =
constraint
> > > that if domain B is powered then domain A must also be powered.
> > >
> > > In patch 6 [2] it's setting the power domain to MT8173_POWER_DOMAIN_M=
FG, which I
> > > believe corresponds to power domain B. I assume this works because th=
e MTK power
> > > controller driver is encoding the constraint above, meaning that when=
 we disable
> > > or enable MT8173_POWER_DOMAIN_MFG it's also disabling/enabling MT8173=
_POWER_DOMA
> > > IN_MFG_2D (domain A).
> >
> > It could also be that the power domains are split in the glue layer and=
 there
> > is some sequencing handled there. I'll reach out to MediaTek to see if =
they
> > can dig up some design specifics.
>
> Unfortunately they said they no longer have that information.
>
> > I assume you would like to see the separate power domains properly mode=
led
> > in the device tree?
>
> So how should we go about this? Adam, do you have this information for
> your platform?

In the Renesas platform, I only had to add one clock [1] and one
power-domain [2] to get the GPU to come up.  In Renesas' downstream
driver, they only use one clock, but Geert, the Renesas tree
maintainer, sent me the three clocks to assign to the 6xt graphics if
it's determined that 3 clocks are required.  In terms of the power
domain, there appear to be 2, but one is dependent on another, so
turning on the 'B' power domain turns on the 'A' power domain
automatically.  I should note that I can't get the graphics to
function, since the 6xt isn't supported yet, so there could be some
elements missing that I am unaware of.

adam

[1] - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit/drivers/clk/renesas?h=3Dnext-20240613&id=3Df7b0dfffd3e0897ca73916a0c3=
d3fb61c61df51e
[2] - https://patchwork.kernel.org/project/linux-renesas-soc/patch/20240227=
034539.193573-3-aford173@gmail.com/



>
> Thanks
> ChenYu
>
> >
> > Thanks
> > ChenYu
> >
> > > Thanks
> > > Frank
> > >
> > > [1] https://lists.freedesktop.org/archives/dri-devel/2024-February/44=
3548.html
> > > [2] https://lists.freedesktop.org/archives/dri-devel/2024-May/455833.=
html
> > >
> > > >
> > > >    reg:
> > > >      maxItems: 1
> > > > @@ -56,6 +63,15 @@ allOf:
> > > >        properties:
> > > >          clocks:
> > > >            maxItems: 1
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: img,powervr-6xt
> > > > +    then:
> > > > +      properties:
> > > > +        clocks:
> > > > +          minItems: 3
> > > >
> > > >  examples:
> > > >    - |

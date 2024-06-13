Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBEE906831
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1220F10E9B4;
	Thu, 13 Jun 2024 09:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GPRuXLY3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A514210E9B1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 09:10:54 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2e724bc466fso8212121fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718269852; x=1718874652;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0qMad1s8HI1EFGHqapCwasRBkvGmdeiF4NnLv9ZSDU4=;
 b=GPRuXLY3cK2/47Go41BelrnbY8gBbkmWTd3tUBEG3/lFalRx/GsMNPAdB6g0UDWvlG
 e/GMd/e0CfUUjZ70WBFAMUKBN143/DvEwZyoDmL9oHw3B03WPpULxmLUwiCvYeaWK650
 gibIjHfmpxiIj3D8ROe1XBELSRHL/8dguu/Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718269852; x=1718874652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0qMad1s8HI1EFGHqapCwasRBkvGmdeiF4NnLv9ZSDU4=;
 b=Y3J3hKz85q6VAkZToN3h/auvm964nsGKOc+dfG8HoRK5rRXfN2ozzPvvFrRfrG4Eep
 PaSwXJwWouvVfGMrbUg52ub1ifkGA9gzDs6MlWhN9jZtPzwfetRUllzGHFKprcR8KHRd
 CdyYyyxWE7qyDIWHrDwsajS7O1bay4r7Vt/5TY0ztLURtvkSiEc9m6kjgZWgr05zQRwf
 QRI1ck+a2hiC2snZXWBKz9ryn8O6XDcjo223pBy2WLh/lUh2j4LZBiJaANGeCLR79mXL
 4DMKg1fSXpr2lv+/tLrxrw2xhMWCtbflr2QM3vcwnkFaKWCSVJqVy1/+lWLlB36CDE62
 yxnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMGIkKLpAmMURpuu15j5hrh0Cs+yosAxmX1FyL3zOOMvMRxl/YiZstBC/jCPNI/mvUdZRH1BGc9Wc9ldF+vavO1863tNuhyks9JqyTB1t/
X-Gm-Message-State: AOJu0Yz4EJR1/PcS7tWJ9iCfrri/42P3OhJPqYTzvWFZe25GWdYlgkCR
 yaH/1DLDNSkk6n3kqtC8YWH5JRG/ihWQjF32pxJl1T5X9amDwmgeBZiY7KjHxh40cyxKbSlHFxn
 40OWRWXqf0yLTJaJmW4I8PZe0ggTI19PxFdq4
X-Google-Smtp-Source: AGHT+IFE16q+3aJZ+pDB8j2rm8rHPIGnaWtqcWZM+SpiuLNffT3VD8BSWouvI+m971OdxrGKrmk+TlmqOWpCQUtBEeQ=
X-Received: by 2002:a05:651c:19a6:b0:2eb:d77a:850c with SMTP id
 38308e7fff4ca-2ebfc8f0545mr43873481fa.4.1718269852401; Thu, 13 Jun 2024
 02:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-4-wenst@chromium.org>
 <cc5847a486a760921375f069a4f65cd29453a624.camel@imgtec.com>
 <CAGXv+5FBqcXjTc+DO8VQierzcxTYhyNxpw+AuuB4U1H_Xo6wPg@mail.gmail.com>
In-Reply-To: <CAGXv+5FBqcXjTc+DO8VQierzcxTYhyNxpw+AuuB4U1H_Xo6wPg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 13 Jun 2024 17:10:41 +0800
Message-ID: <CAGXv+5HC_spBAc-t4cS+aCOQKdfWRzMkXK94HmD1Qg02ML4Uug@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173
 GPU
To: Frank Binns <Frank.Binns@imgtec.com>, Adam Ford <aford173@gmail.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
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

On Tue, Jun 4, 2024 at 12:18=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Fri, May 31, 2024 at 9:37=E2=80=AFPM Frank Binns <Frank.Binns@imgtec.c=
om> wrote:
> >
> > Hi ChenYu,
> >
> > On Thu, 2024-05-30 at 16:35 +0800, Chen-Yu Tsai wrote:
> > > The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
> > > of the Series6XT GPUs, another sub-family of the Rogue family.
> >
> > I've added Adam Ford who sent out some DT related patches [1] for the R=
enesas
> > variant of GX6250 and the GX6650 (another Series6XT GPU).
> >
> > >
> > > This was part of the very first few versions of the PowerVR submissio=
n,
> > > but was later dropped. The compatible string has been updated to foll=
ow
> > > the new naming scheme adopted for the AXE series.
> > >
> > > In a previous iteration of the PowerVR binding submission [1], the
> > > number of clocks required for the 6XT family was mentioned to be
> > > always 3. This is also reflected here.
> > >
> > > [1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793=
a43c79c2a.camel@imgtec.com/
> > >
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > >  .../bindings/gpu/img,powervr-rogue.yaml       | 24 +++++++++++++++--=
--
> > >  1 file changed, 20 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.=
yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > > index 256e252f8087..48aa205b66b4 100644
> > > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > > @@ -12,10 +12,17 @@ maintainers:
> > >
> > >  properties:
> > >    compatible:
> > > -    items:
> > > -      - enum:
> > > -          - ti,am62-gpu
> > > -      - const: img,img-axe # IMG AXE GPU model/revision is fully dis=
coverable
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - mediatek,mt8173-gpu
> > > +          # PowerVR 6XT GPU model/revision is fully discoverable
> > > +          - const: img,powervr-6xt
> > > +      - items:
> > > +          - enum:
> > > +              - ti,am62-gpu
> > > +          # IMG AXE GPU model/revision is fully discoverable
> > > +          - const: img,img-axe
> >
> > The Series6XT GPU models have differing numbers of power domains (eithe=
r 2, 4 or
> > 5). Whereas, the AXE GPUs have a single power domain, so I assume there=
 should
> > be a related change here.
> >
> > The GX6250 has two power domains (lets call them A and B). There's a co=
nstraint
> > that if domain B is powered then domain A must also be powered.
> >
> > In patch 6 [2] it's setting the power domain to MT8173_POWER_DOMAIN_MFG=
, which I
> > believe corresponds to power domain B. I assume this works because the =
MTK power
> > controller driver is encoding the constraint above, meaning that when w=
e disable
> > or enable MT8173_POWER_DOMAIN_MFG it's also disabling/enabling MT8173_P=
OWER_DOMA
> > IN_MFG_2D (domain A).
>
> It could also be that the power domains are split in the glue layer and t=
here
> is some sequencing handled there. I'll reach out to MediaTek to see if th=
ey
> can dig up some design specifics.

Unfortunately they said they no longer have that information.

> I assume you would like to see the separate power domains properly modele=
d
> in the device tree?

So how should we go about this? Adam, do you have this information for
your platform?

Thanks
ChenYu

>
> Thanks
> ChenYu
>
> > Thanks
> > Frank
> >
> > [1] https://lists.freedesktop.org/archives/dri-devel/2024-February/4435=
48.html
> > [2] https://lists.freedesktop.org/archives/dri-devel/2024-May/455833.ht=
ml
> >
> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -56,6 +63,15 @@ allOf:
> > >        properties:
> > >          clocks:
> > >            maxItems: 1
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: img,powervr-6xt
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          minItems: 3
> > >
> > >  examples:
> > >    - |

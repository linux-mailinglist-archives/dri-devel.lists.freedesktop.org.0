Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923928FA920
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 06:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A122610E41D;
	Tue,  4 Jun 2024 04:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LQzipQbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D472B10E41D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 04:21:59 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52b82d57963so5203765e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 21:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717474918; x=1718079718;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sZTkPdaoUs8jQNyMlsxEd3PQVY77PvdNJflZvZlG4XM=;
 b=LQzipQbAgN7dvCqEzyBxWmebytzb9nxKGYDModyJrXBJQ9KNHwdAZReWGM0NHaBJLf
 PNWNKIBespI3Y8OOxDtuwIlSWHiEBDX2ZFss2nzTXf0ktNGK2Avi2LPHbxTwB5FXoe4W
 BjVwgWs+1AfKP69wsnehoib7hb2uiWnDb87Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717474918; x=1718079718;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sZTkPdaoUs8jQNyMlsxEd3PQVY77PvdNJflZvZlG4XM=;
 b=A56FLm80YLR5QHBknf8abQYgpeaHjRRhtEkWCVwbIPGUAUUnvs4d8sEBRVK7JvYlwc
 okRy/HsoviweiUs/a/GJwYCnly3IAbLIV03l9r5DlMUmGu+KRbwCIbqJjJdgWn4X7OPh
 u3THp4LszOY5uXBNCiwRtv0OGSDA/vUVYLn3SKYP5dQshywvTdT70+bQSgRcTBrLnj9X
 bRBW+gycAnjr3oV5VJYEECEm/aCAClYuXa4KoAUV7NMylZRm8IBEGFLI7fzKiRY+WKyE
 iCBOwnt5kg9lDeWNWx1djDEvGovqqHUSLD61I33rCThbdGAczv41Tjl5q4a0X4pUsirn
 /e3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8wiSWFvT7WmDEVE4mAG6TL3wz1gPRGWrBDvVXL7KbSClp8OM2ooTqcXUbmh8BMq687Rl+ZHbpPM19/g4JiV1zw3lBurz+P8MTXuS/zKBO
X-Gm-Message-State: AOJu0YyOk/C/yNyrefmgMHQ9ZKkcm3Hw4fFAzBTD0Gve/yMY05A24qH9
 d9U4qTNy6mUR7I2mAlMI4FZfV7xoDHa+4UlQEixQkHaBhGTHuLYMQqKvAOIIWst2LLahJ5csocc
 x9X2EUzHPFdbaXECtTWRciDm7h58AaAkez6pA
X-Google-Smtp-Source: AGHT+IGDgg2+V5eJ8x467mxNrV7nhwIMgXm1gR49RnrnhPkROZN8HdeL71iXvR/Wj+N6cLD7tGCc7y6sYjgN44bSwNQ=
X-Received: by 2002:a19:5f53:0:b0:51d:5f0b:816f with SMTP id
 2adb3069b0e04-52b89590e7cmr5639078e87.15.1717474917527; Mon, 03 Jun 2024
 21:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-4-wenst@chromium.org>
 <cc5847a486a760921375f069a4f65cd29453a624.camel@imgtec.com>
 <CAHCN7xJ7X9_yNJa7-HyU=FzN2G1cV8i9R+PoTHm-DKyiOPenUQ@mail.gmail.com>
In-Reply-To: <CAHCN7xJ7X9_yNJa7-HyU=FzN2G1cV8i9R+PoTHm-DKyiOPenUQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 4 Jun 2024 12:21:46 +0800
Message-ID: <CAGXv+5GeWpBaFw89KsKyQi4t+Wjh=+58UQ7hyPaLM6pwGELiVA@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173
 GPU
To: Adam Ford <aford173@gmail.com>
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

On Fri, May 31, 2024 at 10:25=E2=80=AFPM Adam Ford <aford173@gmail.com> wro=
te:
>
> On Fri, May 31, 2024 at 8:37=E2=80=AFAM Frank Binns <Frank.Binns@imgtec.c=
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
>
> Thanks for including me.
>
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
> >
>
> In the cover letter of this series, it was noted that the GPU
> enumerates, but it doesn' fully function yet.  This is also the case
> for both of the Renesas variants I have been testing, and I was nicely
> asked to postpone my series until the driver was closer to being
> ready.

Yeah. Frank laid out the current state of GX6250 support and future plans
in his reply to the clk driver patch.

> Even if the driver isn't ready yet, it would be nice to move the
> bindings forward.

Agreed. It would be nice to have an agreed upon set of bindings. We
can then move our downstream stuff comply with it.


Thanks
ChenYu

> adam
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

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1018D647A
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 16:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D8210E21E;
	Fri, 31 May 2024 14:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YTyJGUEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F39710E4C4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 14:25:11 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2bfb6668ad5so1642734a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 07:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717165511; x=1717770311; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FvrZTCq64hB5lHJheyU2TPKqgbbvFWSIbyIIWaCcr6w=;
 b=YTyJGUEIggH7DZuT5uTbYiILewDLNDn7xC1W+aMKybtB5In+D4G21H3GjRFXq8aKrK
 zBd0QcCozQkac1Nwk3Tx1uYBp3dwVBEbsJmsOI/D17A80/jPtxfJsWrh9ilFHxU3ODx4
 1B34KUsppvYIUZKgbxImMzm6ODMef9dnOwK/FE/PtbSXTt6C8qHl0jtGT2pubA8uV7sI
 AopF2rAe2ayM3o+FPK5QSYm+BCUkuJXvrigPUvwPcFC4xL4/NtzeEPTF8YvEsXGAkEYF
 61q0Vr0zXGETSCvBxP4s5hfNgt39bcQ5LYkv66kWjrl/d0h/t8i9IK0sMjLH9kkA93w3
 PVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717165511; x=1717770311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FvrZTCq64hB5lHJheyU2TPKqgbbvFWSIbyIIWaCcr6w=;
 b=sD6nTjiPh9UG0b/nx1S4IYsll0TEShZSyzMQGVVg1aHrgu5XFOgb38QpHrguXkSfQq
 6uaCPGDp96u7WwdNvkCV7cxT5q7Dy20Dqi6leGrHX82/Fd2vngAtNq4RkChkdBwVttmf
 dvuKW8Y5+88mG1ePF4Xm181y9RSioHpbjrmTg02zodYDhOathvBv0jPCkHX18g4FRDfI
 XxBx+hzTbMMpiLAmTJOdrujLBIYfgHu7HSqhtoxqJ2kqNP6NAf3800NZ6ehlOUmvtDD/
 epU6l0e7+PAjUMSheYCKJpgYJEon3doM+H/IpIjC2lph+ifrhdTu5vZoau0N6PsibVma
 gDqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4xbD2Tt+5W8GXNCE9mUHrYWt76GobJD2ltAXo30EmCWMNK2J766sOGVJFWgYKwU+zAqRZkfX4CK1txZExx4ZZ7Ua3RjvNI3z5oTCn8fFl
X-Gm-Message-State: AOJu0Yx2z/E0EdJoyk0M+7e20I6nqZkgc8eum2F8bPmo1f6ZEu5uTi7u
 Ycid6pGDVycXjpBwiPlsM/cedv25ye7ro7imcQJsFDejTYpMHuRUvbfvcG0b1bap5ijyzZ0orVa
 dqQS/IxxYAKKcbRuqRF2x4Plf2yw=
X-Google-Smtp-Source: AGHT+IGLbXNCTP7kEEDSMq48BUCNTcGq4/Bj168zhaicbZLEfBju50BxyoEC44nEYY/K5zSXtSoOZMn4twkyQ+dOxks=
X-Received: by 2002:a17:90b:2282:b0:2bd:fa57:b361 with SMTP id
 98e67ed59e1d1-2c1dc56fce1mr1799546a91.11.1717165510580; Fri, 31 May 2024
 07:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-4-wenst@chromium.org>
 <cc5847a486a760921375f069a4f65cd29453a624.camel@imgtec.com>
In-Reply-To: <cc5847a486a760921375f069a4f65cd29453a624.camel@imgtec.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 31 May 2024 09:24:56 -0500
Message-ID: <CAHCN7xJ7X9_yNJa7-HyU=FzN2G1cV8i9R+PoTHm-DKyiOPenUQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173
 GPU
To: Frank Binns <Frank.Binns@imgtec.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 Matt Coster <Matt.Coster@imgtec.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "wenst@chromium.org" <wenst@chromium.org>,
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

On Fri, May 31, 2024 at 8:37=E2=80=AFAM Frank Binns <Frank.Binns@imgtec.com=
> wrote:
>
> Hi ChenYu,
>
> On Thu, 2024-05-30 at 16:35 +0800, Chen-Yu Tsai wrote:
> > The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
> > of the Series6XT GPUs, another sub-family of the Rogue family.
>
> I've added Adam Ford who sent out some DT related patches [1] for the Ren=
esas
> variant of GX6250 and the GX6650 (another Series6XT GPU).
>

Thanks for including me.

> >
> > This was part of the very first few versions of the PowerVR submission,
> > but was later dropped. The compatible string has been updated to follow
> > the new naming scheme adopted for the AXE series.
> >
> > In a previous iteration of the PowerVR binding submission [1], the
> > number of clocks required for the 6XT family was mentioned to be
> > always 3. This is also reflected here.
> >
> > [1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a4=
3c79c2a.camel@imgtec.com/
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  .../bindings/gpu/img,powervr-rogue.yaml       | 24 +++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > index 256e252f8087..48aa205b66b4 100644
> > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > @@ -12,10 +12,17 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - ti,am62-gpu
> > -      - const: img,img-axe # IMG AXE GPU model/revision is fully disco=
verable
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8173-gpu
> > +          # PowerVR 6XT GPU model/revision is fully discoverable
> > +          - const: img,powervr-6xt
> > +      - items:
> > +          - enum:
> > +              - ti,am62-gpu
> > +          # IMG AXE GPU model/revision is fully discoverable
> > +          - const: img,img-axe
>
> The Series6XT GPU models have differing numbers of power domains (either =
2, 4 or
> 5). Whereas, the AXE GPUs have a single power domain, so I assume there s=
hould
> be a related change here.
>
> The GX6250 has two power domains (lets call them A and B). There's a cons=
traint
> that if domain B is powered then domain A must also be powered.
>
> In patch 6 [2] it's setting the power domain to MT8173_POWER_DOMAIN_MFG, =
which I
> believe corresponds to power domain B. I assume this works because the MT=
K power
> controller driver is encoding the constraint above, meaning that when we =
disable
> or enable MT8173_POWER_DOMAIN_MFG it's also disabling/enabling MT8173_POW=
ER_DOMA
> IN_MFG_2D (domain A).
>

In the cover letter of this series, it was noted that the GPU
enumerates, but it doesn' fully function yet.  This is also the case
for both of the Renesas variants I have been testing, and I was nicely
asked to postpone my series until the driver was closer to being
ready.

Even if the driver isn't ready yet, it would be nice to move the
bindings forward.

adam

> Thanks
> Frank
>
> [1] https://lists.freedesktop.org/archives/dri-devel/2024-February/443548=
.html
> [2] https://lists.freedesktop.org/archives/dri-devel/2024-May/455833.html
>
> >
> >    reg:
> >      maxItems: 1
> > @@ -56,6 +63,15 @@ allOf:
> >        properties:
> >          clocks:
> >            maxItems: 1
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: img,powervr-6xt
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 3
> >
> >  examples:
> >    - |

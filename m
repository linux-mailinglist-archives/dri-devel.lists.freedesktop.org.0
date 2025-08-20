Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6116B2D3B0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 07:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE4610E345;
	Wed, 20 Aug 2025 05:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pt7SPwMu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DBE10E345
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 05:39:49 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3b9ba300cb9so372080f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 22:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755668388; x=1756273188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ccknhVRPHaFFv1IUxfvlWqkKeJThBY2h9VPsCt/mOXA=;
 b=Pt7SPwMuI+G2w53+JOGrg7dHdo6Jj+cgmPCxYrMbUSQ4mVzjLooGrPbxJq+hKGtk5r
 lTksUC1mF+WnLBdO4CyZOuBWvIabXoMDC4smHIq5UoCz4O7QPZGhd5ZH2d98Sbto0MVA
 CyD3zo2Y5vN6lD/rpkmhh9Yx7xQ8wO9eYwK4mFd2+o9jqx4vCPZixI61BWNAiCjkMBJr
 TH3NBqNOYc2Wkw8tMp1eckOiOXlSdS2FFl4oW7TKXw4IC8ecpNzaMymodGQhZVvXoiql
 Oqh5xVwDDE3BhQmQ+nJykUzQx47FDLTy+2+dnE8gL+aD1pETjC/+2zfxpkNKuYgB/TTi
 4RJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755668388; x=1756273188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ccknhVRPHaFFv1IUxfvlWqkKeJThBY2h9VPsCt/mOXA=;
 b=OL9amavLHjec3NhKApJQKz2295oJC12e6lz6idjVosI7wy+KXx7VOqqMlTSpW9Owx1
 B9MQ290ragMjdTDlVxEkEBYL4UuOWMVk2PEV8NUUcqHsLp/cZVXiEQTpauBDhKdy3uQh
 +/PXA+Cln//Yqu0UobzSOLNYQmYIHZowYvuRLZmjsjpqVbHCipT1FAhgg85hiNVxsztZ
 ycazA9UW3LbdO8a052hNZodVMoulvl7ESjw3RJ+6uOP+8V3cVQFDwkxafJGx65XwAnbW
 rlAzD0yFM0lUgfRPJJ+AV2QfcsAXcdyc4NPgfuuPu/KLj1TjloTOFX0/oaks+SLMFI8F
 L1ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeyWj9CxLEXu2x9jK9NfhIVV/ONpiYnei7QROcVroB1ZUplw5i+GQR7UWpL5ioXld4jUPOkQCqNP4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtsQT2KZCeXDgThv9JXswd/+dlxkeaYIxb73Lg8AcolZfvUr7l
 z+8MKUBPO+8FvqKKoWUf7DOowjWpjQoeHgCYXA43KPkDxHLRVKx2aAgixXn4IF7qDupcgE2Edj1
 JNticNImWXVmoGZcnpBy0fKedHclq49I=
X-Gm-Gg: ASbGncu6kkyi5LTFN8DFLdI9uDSS9GYmpV5qy0NlZBsk+QWhL+kLD3j7Lql2zTgtNNG
 Em6VUaI7Ye/fDreLNBgC2GnVqeaDyzQCBacT6lnlPzNS0fOxlh7s0vQWGSdSHOhtmtEXMoaxVlU
 /E8hpRYEUhnsW9uXw2xCzYPfNjRUt4/o7NoyHNXefZGLcJUZ7v85lw84FRPRZhOrZO76df+0W2D
 eFgtvxW
X-Google-Smtp-Source: AGHT+IHwCiiCNR7psLFhYIIVfqt8gU87v84Q5qmwWq0pKLvUVOdRq92tkYNwCIUAaI04l/H3wpVbXTn8JTp3UCxiUZw=
X-Received: by 2002:adf:8b05:0:b0:3c3:ae31:717e with SMTP id
 ffacd0b85a97d-3c3ae317631mr152960f8f.4.1755668387612; Tue, 19 Aug 2025
 22:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-18-clamor95@gmail.com>
 <20250819203007.GA1266319-robh@kernel.org>
In-Reply-To: <20250819203007.GA1266319-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 20 Aug 2025 08:39:36 +0300
X-Gm-Features: Ac12FXzWZ_Nd9h62ySrEyXbVbvxJKlW0WeyZsHY-B28WzAACkjTJONuBotQYEIA
Message-ID: <CAPVz0n2tsE3FHAz7sbdwkWaRQtmXJ5wNg8vvb2B9k8iYuyvUQQ@mail.gmail.com>
Subject: Re: [PATCH v1 17/19] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, 
 Charan Pedumuru <charan.pedumuru@gmail.com>, linux-media@vger.kernel.org, 
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
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

=D0=B2=D1=82, 19 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 23:3=
0 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Aug 19, 2025 at 03:16:29PM +0300, Svyatoslav Ryhel wrote:
> > Document CSI hw block found in Tegra20 and Tegra30 SoC.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra210-csi.yaml    | 78 +++++++++++++++----
> >  1 file changed, 63 insertions(+), 15 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra210-csi.yaml
> > index fa07a40d1004..a5669447a33b 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-c=
si.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-c=
si.yaml
> > @@ -16,30 +16,78 @@ properties:
> >
> >    compatible:
> >      enum:
> > +      - nvidia,tegra20-csi
> > +      - nvidia,tegra30-csi
> >        - nvidia,tegra210-csi
> >
> >    reg:
> >      maxItems: 1
> >
> > -  clocks:
> > -    items:
> > -      - description: module clock
> > -      - description: A/B lanes clock
> > -      - description: C/D lanes clock
> > -      - description: E lane clock
> > -      - description: test pattern generator clock
> > -
> > -  clock-names:
> > -    items:
> > -      - const: csi
> > -      - const: cilab
> > -      - const: cilcd
> > -      - const: cile
> > -      - const: csi_tpg
> > +  clocks: true
> > +  clock-names: true
> >
> >    power-domains:
> >      maxItems: 1
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra20-csi
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: module clock
> > +
> > +        clock-names:
> > +          items:
> > +            - const: csi
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra30-csi
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: module clock
> > +            - description: PAD A clock
> > +            - description: PAD B clock
> > +
> > +        clock-names:
> > +          items:
> > +            - const: csi
> > +            - const: csia_pad
> > +            - const: csib_pad
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra210-csi
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: module clock
> > +            - description: A/B lanes clock
> > +            - description: C/D lanes clock
> > +            - description: E lane clock
> > +            - description: test pattern generator clock
> > +
> > +        clock-names:
> > +          items:
> > +            - const: csi
> > +            - const: cilab
> > +            - const: cilcd
> > +            - const: cile
> > +            - const: csi_tpg
> > +
>
> This is longer that what's the same. I think this should be a separate
> schema doc.
>

CSI hw block configuration is similar between generations, the main
difference is the amount of clocks routed. Not sure if it is worth it
to create duplicates with sole difference in number of clocks used.

> Rob

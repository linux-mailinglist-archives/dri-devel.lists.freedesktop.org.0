Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13F88D5B6E
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 09:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5524C10E653;
	Fri, 31 May 2024 07:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="k10XI+Em";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0234911253E
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 07:29:19 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52b03d66861so1827444e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 00:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717140558; x=1717745358;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7AuBpLgSZMEBo2XzwoYxF5FL6n7LRJe6EeX7UzHv+C4=;
 b=k10XI+EmEP1L2Yfxl+HKZPIkeVw8fUHOqoBsq3GWSbChU7XXC5xK8OyMSakIm5YJ8Y
 fhomKJxFzgltLtKjproikSuYvIxC/AzQ8I9vbUUNQG1NNkH2YE4MoXhDmrCkFQnE8Tt6
 MHqAZzhdLfn16FiDWwr3enGDyGLi9MyiX4fAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717140558; x=1717745358;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7AuBpLgSZMEBo2XzwoYxF5FL6n7LRJe6EeX7UzHv+C4=;
 b=k/o1ETs5SkZGAy+K5bCjNofs/At04LwSSkIXXmDHDZ4j4x9jG4HUUy2/72lfAMYJir
 9tISkJN7Vs862NqhJA10fyn3zXdKxxH2hKfEvPKyMRJNHzFuEbjtDXlrYrxgnDLTjW4m
 W/NoAVVvTZZWYUJRTzwNeeBuhyhk5Q9gJF2tzsJUDZ9gOTsiV3vhOggGHtyrWNTGRsQx
 M1MbAHwcUZOyGOUXrrwoUrNx1O3IQpx3xh36BYNTTuBX1/PNYNYD1l/f/QWfl5mPtaUH
 I6yUVxsKBqaXK9DZopljAOSZtQ3vWc7gPPGHGLk5Kwr0IE72uGJL16uoyKGbPaBDlRzF
 gbtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTJaWcuUD5IYoupCNA1vu1tEAuTrobLCT1orKPcnaByh7DnXsIajsrZFYf2WIK4FNvYmuJGJVZRHjrfBHf0+/mHqqnXYs+C1tWWc89aT1U
X-Gm-Message-State: AOJu0YzqH2OLCWIt67dyuHNBfpdCcVrpkIxJVow11qP/OCsL9EGfQouM
 LcpSR2mPQ0lVtBeClHIEzupFK0+rlZO9bPuj/YsEHAeH9wcDGK/YEe5aSHpGviKUhYRAOxYHU7Y
 Op/RIZAgjSke6xmN8llWO48RlIZvIjUu4ZUyc
X-Google-Smtp-Source: AGHT+IHG9cIqzvXzXFVSJ3u+mefhmJEYsDfRGLlyDYP+0F7chk9Cih1xUPNaF4GQKusTGlZd76NQwOCqr1Bnfxqn4zw=
X-Received: by 2002:a05:6512:2029:b0:52b:8455:a9df with SMTP id
 2adb3069b0e04-52b896b8210mr483694e87.34.1717140557358; Fri, 31 May 2024
 00:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-2-wenst@chromium.org>
 <20240530-revisit-profanity-889f1bcae21a@spud>
In-Reply-To: <20240530-revisit-profanity-889f1bcae21a@spud>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 31 May 2024 15:29:06 +0800
Message-ID: <CAGXv+5F=AEE7t=YQ0hNGtV9rbVBm75D=ftJdZKwD_JmUW9gQWQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: mediatek: Add mt8173 mfgtop
To: Conor Dooley <conor@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
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

On Thu, May 30, 2024 at 11:43=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, May 30, 2024 at 04:35:00PM +0800, Chen-Yu Tsai wrote:
> > The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
> > in the datasheet, that contains clock gates, some power sequence signal
> > delays, and other unknown registers that get toggled when the GPU is
> > powered on.
> >
> > The clock gates are exposed as clocks provided by a clock controller,
> > while the power sequencing bits are exposed as one singular power domai=
n.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  .../clock/mediatek,mt8173-mfgtop.yaml         | 71 +++++++++++++++++++
> >  include/dt-bindings/clock/mt8173-clk.h        |  7 ++
> >  2 files changed, 78 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt=
8173-mfgtop.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8173-mf=
gtop.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.=
yaml
> > new file mode 100644
> > index 000000000000..03c3c1f8cf75
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.ya=
ml
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/clock/mediatek,mt8173-mfgtop.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT8173 MFG TOP controller
> > +
> > +maintainers:
> > +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.co=
m>
> > +
> > +description:
> > +  The MFG TOP glue layer controls various signals going to the MFG (GP=
U)
> > +  block on the MT8173.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8173-mfgtop
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 4
>
> minItems is not needed when minItems =3D=3D maxItems.

Ack.

> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: sys
> > +      - const: mem
> > +      - const: core
> > +      - const: clk26m
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  '#power-domain-cells':
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - '#clock-cells'
> > +  - '#power-domain-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +        #include <dt-bindings/clock/mt8173-clk.h>
> > +        #include <dt-bindings/power/mt8173-power.h>
> > +
> > +        mfgtop: clock-controller@13fff000 {
>
> The label here is used, so drop it.

Assume you mean _not_ used. Dropping. :D

> Otherwise,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FD4712D50
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 21:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1FE10E023;
	Fri, 26 May 2023 19:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A16310E023
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 19:24:34 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1b01d912924so5455545ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 12:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685129074; x=1687721074;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8F+V6OXXzxlqAeAQ2S6nVyckBmSNTRDJrN1SofTqjrw=;
 b=l0fvbyeOvzjhchm1f7BpPbYg1pvfRRBID8i4AaBQVgNK/2dgA3qoG7g5mCHUhLU8+v
 Naau0mLrjmenMYJxaZXr9pxWiulhsH0h/63lg+sJHR9cVIQ793td2LmKq5Y9GxWyEUkb
 LipYNGnex7vUfFUlCG9h9zXip6tqGL8zUof1xss0MPjoWgdEd656+rI+60EOrC93/LBm
 odro18Sd0VWRrX/F2R7sfy4eaeJytZX8W1viq7FYKsATiKrMT7sHi7R222JYVsuTy6oV
 7aV2Q4WMxUTa1mHVof2Z5f7YF9slphVcUIEtTn/FUKXJz7xhu4YxHErPPvxpwj5DQvwH
 3Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685129074; x=1687721074;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8F+V6OXXzxlqAeAQ2S6nVyckBmSNTRDJrN1SofTqjrw=;
 b=KGFn2vYQAvlyEgMjB4o6lo/aOUm6YyPYTuK3ut8OjJBtPq4Xo/CTIdZhh8XMkJ8P12
 1AEoxZNvZ/HHSTVbL+z86i7GnC1w0G6yQcWXHUAW2YlQKLBVccnJ2YTVdHZR8xLI3uWu
 i+MKk9n7L5B45sxWgyL+bdRXh4w29BTXzeeJ1vUptUaBptLeoIUGyyxobKGF92yilDE8
 yFO0vIXzqlSgK1V1fARx77Bm2aZodV7BVoJ1g48VLGn95q4i8lufTSQ2FcC0cJ2k7sHK
 zvDYSyUft2Z2mHTZZoMK7rVy6YA5bMLdBa8ceZcnQrrmsC22aXo4YLt189O8KgDRYNMJ
 yWCA==
X-Gm-Message-State: AC+VfDztYwGaN/HjY7dST68MU/LOQapncg25BJwASWiV72IDwvXf9jvu
 NjUEd8ADdrEIZGHkwA8lFzScdv+NhUjx9wduS9E=
X-Google-Smtp-Source: ACHHUZ5Aq9OT6SrKipriSxgDG/MKDVlnUMLqDL/khDIN89awyhwqpZYdgZodTSy7yiHuDKfAL/ibrOQy5o71MeAlngM=
X-Received: by 2002:a17:902:f550:b0:1ac:4a41:d38d with SMTP id
 h16-20020a170902f55000b001ac4a41d38dmr3398196plf.51.1685129073567; Fri, 26
 May 2023 12:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230526030559.326566-1-aford173@gmail.com>
 <20230526030559.326566-8-aford173@gmail.com>
 <20230526-cabana-humble-81e44944e378@spud>
In-Reply-To: <20230526-cabana-humble-81e44944e378@spud>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 26 May 2023 14:24:21 -0500
Message-ID: <CAHCN7xJdfO4+q071sur7wpVg+gU_Fzw9zfXvM9NDBFCN=Axiog@mail.gmail.com>
Subject: Re: [PATCH V8 7/7] dt-bindings: bridge: samsung-dsim: Make some flags
 optional
To: Conor Dooley <conor@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 26, 2023 at 1:19=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> Adam, Neil,
>
> I meant to get to this earlier today, but broken CI got in the way...
>
> On Thu, May 25, 2023 at 10:05:59PM -0500, Adam Ford wrote:
> > In the event a device is connected to the samsung-dsim
> > controller that doesn't support the burst-clock, the
> > driver is able to get the requested pixel clock from the
> > attached device or bridge.  In these instances, the
> > samsung,burst-clock-frequency isn't needed, so remove
> > it from the required list.
> >
> > The pll-clock frequency can be set by the device tree entry
> > for samsung,pll-clock-frequency, but in some cases, the
> > pll-clock may have the same clock rate as sclk_mipi clock.
> > If they are equal, this flag is not needed since the driver
> > will use the sclk_mipi rate as a fallback.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> >  .../bindings/display/bridge/samsung,mipi-dsim.yaml       | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,m=
ipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mi=
pi-dsim.yaml
> > index 9f61ebdfefa8..360fea81f4b6 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsi=
m.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsi=
m.yaml
> > @@ -70,7 +70,9 @@ properties:
> >    samsung,burst-clock-frequency:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description:
> > -      DSIM high speed burst mode frequency.
> > +      DSIM high speed burst mode frequency when connected to devices
> > +      that support burst mode. If absent, the driver will use the pixe=
l
> > +      clock from the attached device or bridge.
>
> I'd rather this description did not say anything about drivers.
> How about:
>         If absent, the pixel clock from the attached device or bridge
>         will be used instead.

That makes sense.  I can do that.

"DSIM high speed burst mode frequency (optional). If absent, the pixel
clock from the attached device or bridge will be used instead."

> Or perhaps "must be used"? Ditto below.

"Must be" implies to me that the user needs to set something.  Are you
ok with the proposed suggestion above?
>
> Description aside, the removal seems to be backwards compatible - but
> can every device that this binding supports work using an "attached
> device or bridge", or are these properties going to be required for
> certain compatibles?

From what I can tell, the assumption is that the DSIM driver was
expecting it to attach to panels in the past.  With the additional
patch series, the DSIM can attach to bridge parts without a hard-coded
set of clocks.  I don't expect the existing Exynos devices to change,
but I also don't know what would preclude those SoC's from attaching
to a bridge should someone want to design a new product around them.

I'll wait a couple days for more feedback and send patch V2 with just
this patch since the rest of the series has been applied to the drm
branch.

adam

>
> Thanks,
> Conor.
>
> >
> >    samsung,esc-clock-frequency:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -80,7 +82,8 @@ properties:
> >    samsung,pll-clock-frequency:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description:
> > -      DSIM oscillator clock frequency.
> > +      DSIM oscillator clock frequency. If absent, the driver will
> > +      use the clock frequency of sclk_mipi.
> >
> >    phys:
> >      maxItems: 1
> > @@ -134,9 +137,7 @@ required:
> >    - compatible
> >    - interrupts
> >    - reg
> > -  - samsung,burst-clock-frequency
> >    - samsung,esc-clock-frequency
> > -  - samsung,pll-clock-frequency
> >
> >  allOf:
> >    - $ref: ../dsi-controller.yaml#
> > --
> > 2.39.2
> >

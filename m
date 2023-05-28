Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774E5713B80
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 20:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6ED10E0E1;
	Sun, 28 May 2023 18:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116DF10E0E1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 18:14:22 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-256712e2be3so467982a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 11:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685297662; x=1687889662;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KylLFO78aG85tFCA5dfgDJk9LDpZhsbsPaumEd9VTYQ=;
 b=dljeEtgXM7OWMKJz5q2ffWr4AzsROAeTGEpXJFO5tmLPoipmiKFrsu52RpFHS17llJ
 trraqNJOi0jewEQMzjIKlOS4ZMhc3DHUk2LaWMAEE605RJu0vamfp+OX6UwGYZerHQRH
 SSbadMRH5N5GOVwgUCeUYBiU0a+VMcoA3JmTYQcdg/UPsbVS8R8+qRjk7jf+Xxrihn/a
 6pKEb4cAlxKCKIlPUp3M1pyLSTeo5F+8DVu9N/uFHHoAu8Bx+GlNZ7LoAhq1XaMxvq1d
 AJJjmpg/m7eRUgr67TYmKGbBDG7BgxT8EXyOPltqTeEd24rwitHW6dAPIOX9aggZhsTf
 0l/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685297662; x=1687889662;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KylLFO78aG85tFCA5dfgDJk9LDpZhsbsPaumEd9VTYQ=;
 b=ffIoY9ebefGC0v4MbmmFWX1Hb6CEf+1i89OAPX/g9aHip3fHJOD1uXQUwELBq58cl7
 1TwGYtS7msAURDozGb4ljXxhch/xGv45BepfGiA5f7uzGOFeZp7DBkAnjoB60Dcg2gqh
 o4NdjrCP9yHGXajDRzsStxmUr1/zjT/FLx+SprcU6xHV86HDV9iMYcVLAwoIHF7MU4Ao
 dhzOZq8+QuvpyF4bx+PqzkwDOvCH2mn73qljlyjwvnCXsX19AFsJvSc8Xn06NopvmNgL
 qZ20hhRGmyi8gJBN9aWt6HblmUfwP948A+zGuuwjjP4fhpgYsidYeYxmQJIEbf6XD2m7
 jaDA==
X-Gm-Message-State: AC+VfDyGD4djxQHv4h0aZX6QO+nPJqly0CDfQM8N+uc4DopN6ub7lvW3
 T+lfcQeXtLrKGfAwNn4Cyhqix71UuqafiMVa5gk=
X-Google-Smtp-Source: ACHHUZ5rZHZVsQ7sM0uVNgsj9/lGptUCRRcH11dVAV7DRFVkW0y7/XGyIu5h1rC5D3P0L69OKDYf7jIgLbHzPjDpTqI=
X-Received: by 2002:a17:902:9b84:b0:1ae:5914:cbec with SMTP id
 y4-20020a1709029b8400b001ae5914cbecmr9237690plp.10.1685297661614; Sun, 28 May
 2023 11:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230528132727.3933-1-aford173@gmail.com>
 <CAMty3ZB=XfMr7k31yHzZ+YHFxT0ifCbmR4+s5yw+YgTSJE0Jxg@mail.gmail.com>
In-Reply-To: <CAMty3ZB=XfMr7k31yHzZ+YHFxT0ifCbmR4+s5yw+YgTSJE0Jxg@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 28 May 2023 13:14:10 -0500
Message-ID: <CAHCN7xLUEYY0ZWVCO8SZSkPj8um7hj3uOtyyt+iWGLkc_XXdxw@mail.gmail.com>
Subject: Re: [PATCH V2] dt-bindings: bridge: samsung-dsim: Make some flags
 optional
To: Jagan Teki <jagan@amarulasolutions.com>
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
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 28, 2023 at 8:34=E2=80=AFAM Jagan Teki <jagan@amarulasolutions.=
com> wrote:
>
> On Sun, May 28, 2023 at 6:57=E2=80=AFPM Adam Ford <aford173@gmail.com> wr=
ote:
> >
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
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > V2:  Split from driver series.  Re-word updates for burst
> > and pll-clock frequency.
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,m=
ipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mi=
pi-dsim.yaml
> > index 9f61ebdfefa8..06b6c44d4641 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsi=
m.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsi=
m.yaml
> > @@ -70,7 +70,9 @@ properties:
> >    samsung,burst-clock-frequency:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description:
> > -      DSIM high speed burst mode frequency.
> > +      DSIM high speed burst mode frequency.  If absent,
> > +      the pixel clock from the attached device or bridge
> > +      will be used instead.
> >
> >    samsung,esc-clock-frequency:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -80,7 +82,8 @@ properties:
> >    samsung,pll-clock-frequency:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description:
> > -      DSIM oscillator clock frequency.
> > +      DSIM oscillator clock frequency. If absent, the clock frequency
> > +      of sclk_mipi will be used instead.
>
> Maybe this explicit comment won't require as it is not listed in "require=
d"

I mostly listed it here to explain why it's being removed from the
required list and what happens if it's missing.
>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>

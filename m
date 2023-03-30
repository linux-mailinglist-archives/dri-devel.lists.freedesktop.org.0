Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF06D0CFC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 19:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E560E10EF61;
	Thu, 30 Mar 2023 17:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C50010EF61
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 17:38:00 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-544f7c176easo367801377b3.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 10:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680197879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0XDB6bTe9xJuphUqwevJuf9q/6RlzAPG9D8j9n2M9eI=;
 b=OjP+fHOJg/qk/BlFRiLShClpzDz5RIhfJx4oJR+J6AEhaszRz0Q5mEaxRpZkd5ocUU
 Pydm4D7geWRHXotQWusDrJeDK239l9eTmD3nH+hbdF/E+kATlZQpMPIukTeVxq0iU8Zt
 zs7csmBHA4HWxFkMZzcYDKsCymsF4Jr3u9Og0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680197879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0XDB6bTe9xJuphUqwevJuf9q/6RlzAPG9D8j9n2M9eI=;
 b=p7Iq6/hpk/USH0pwnMhYBROOVfz2eM8Zu07fAIF4JIUeII1nzdQw/Q6INPq2iVE4FH
 EY7Twh1PikiBKBAaUq5iaouRGAjcjc2uLsHL2s/sm9bgzmM00EvBazCEU8yzqRanQweU
 u24wCmQYRutP8BZrYxdDG6hTNLNDjn6fQ/l1nbkVzD3Op9FuYg+BYrMnQop8aunbu7Iq
 sz3RIvGlZ46cLqUvX0HxqLdMiomCrkBjhVHnIIXe+KQAcroyvS7eWRdLhDaHH9kRVX+T
 4zTkBcCo2XGPZ7cpRxJ//k6e9u8TOm8QE2NGsK9Cqp0m3E8tbXezsRA+QeSeOz7U3Y96
 42xg==
X-Gm-Message-State: AAQBX9egLuYO//vuVl5oVU32xcLv7FRwvN0j9Dj8PQ0yyz8n0+iG7L2/
 ufZ9kQrRODEc7kDq9wFYGrBPr3jBTjf85cgDXh7SMQ==
X-Google-Smtp-Source: AKy350bck9a7Ac/7Hxwga/BHJXtbB6f6e+9uTSHoWqisMz7/ZongXR2S56Glacab1PDzNjzatDBkzP3s/3oiG7MFHD4=
X-Received: by 2002:a81:ad04:0:b0:52e:e095:d840 with SMTP id
 l4-20020a81ad04000000b0052ee095d840mr800164ywh.0.1680197879519; Thu, 30 Mar
 2023 10:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230330101752.429804-1-francesco@dolcini.it>
 <20230330101752.429804-2-francesco@dolcini.it>
 <CAMty3ZAQPEnCgj9r+tsuqiOzRzHPnKSEXcDqE7LKHH16Zu2Wvw@mail.gmail.com>
 <ZCWkdc+x0LXDSohj@francesco-nb.int.toradex.com>
In-Reply-To: <ZCWkdc+x0LXDSohj@francesco-nb.int.toradex.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 30 Mar 2023 23:07:47 +0530
Message-ID: <CAMty3ZDwj5OuBzTBHrBitS0qD8QEv8=80YR2zZLDnL_nrmd3fg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: bridge: sn65dsi83: Add DSI
 video mode
To: Francesco Dolcini <francesco@dolcini.it>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 8:32=E2=80=AFPM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> On Thu, Mar 30, 2023 at 07:56:26PM +0530, Jagan Teki wrote:
> > On Thu, Mar 30, 2023 at 3:48=E2=80=AFPM Francesco Dolcini <francesco@do=
lcini.it> wrote:
> > >
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > >
> > > SN65DSI8[34] device supports burst video mode and non-burst video mod=
e
> > > with sync events or with sync pulses packet transmission as described=
 in
> > > the DSI specification.
> > >
> > > Add property to select the expected mode, this allows for example to
> > > select a mode that is compatible with the DSI host interface.
> > >
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > ---
> > >  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml  | 8 ++++++=
++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65=
dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.=
yaml
> > > index 48a97bb3e2e0..ebee16726b02 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.y=
aml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.y=
aml
> > > @@ -35,6 +35,14 @@ properties:
> > >    vcc-supply:
> > >      description: A 1.8V power supply (see regulator/regulator.yaml).
> > >
> > > +  dsi-video-mode:
> > > +    description: |
> > > +      0 - burst-mode
> > > +      1 - non-burst with sync event
> > > +      2 - non-burst with sync pulse
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [0, 1, 2]
> >
> > I'm thinking this can go to dsi common code since the video modes are
> > common across all controllers and make the core initialize the default
> > and update if any sink devices are willing to change the modes. Sound
> > like a big move but worth useful.
>
> Not sure I understood where do you want to move this.

Yes, it can be new may be
Documentation/devicetree/bindings/display/dsi-device.yaml

>
> In any case this is something about the display side of the DSI video
> connection, with the bridge as a special case, not about the controller.
> To my understanding the controller is supposed to support all the modes.

Yes, that is what I'm saying. DSI sink will send this mode via
mode_flags and the controller act accordingly.  The point here is
these modes are generic across all DSI sink devices so having common
bindings can make it easy for all devices to use. As I said it can be
new, but worth trying - anyway let's see how others are commenting on
this.

Thanks,
Jagan.

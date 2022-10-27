Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D421460EE47
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 05:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB56410E16F;
	Thu, 27 Oct 2022 03:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927EE10E12E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 03:02:13 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id kt23so860082ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 20:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o7rZB0XkIEpMEFuMSp0Bun4m+5RdGa/e8szfl96xuHA=;
 b=BhR7keRnd6nNVcTPc6uP/UfMdItmQBDN3OgAvYm84DLnUQUx2nSWo36hM9XkVlyz7p
 sMccyN4uJd8+nq0eRGaLB5NEM1SCMU1J20AHsAtSP5MSwQKHy5z9+JQ+iLSgQl4AQh+Z
 AFDPsDoo6gH2ZwsqAg5yXOj8KXEw/NdJhu7j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o7rZB0XkIEpMEFuMSp0Bun4m+5RdGa/e8szfl96xuHA=;
 b=ApzdmnsoiLg3NceOPNg2StpovRcw02oIJth1sHEYALykxhBDYzV60GVb4tD9SkTy60
 pxNM9GzvoQ3eXgpegS22eWHtUikKcfzfXHGcmrrcKYMwH7kqopEvwIJI94FWU5eysdvb
 D9oyt2xfqk54lLzt0KICQktC85OSGAUV0Ot4tzLjKtxgpwXTBpcVgF+Q6f3gkVTb8oHW
 W3ixyGfozT9q1ABcX6LiWvKUiNl34mAs/dajvJAwnyAoW+KRbXhrkLXCoO1uvQQ22m9+
 Nus29LiAq1Kbm/SV/QZtI0gb0OytSzKZV2Z5cis4RR1iWDZ/U+3wUDcI+sZQKfzacgsZ
 PgwA==
X-Gm-Message-State: ACrzQf1xK8DTUigOyCYZVAJLk8E/P8dVEbABYlcVwhfz3H0Sx8TVXj8Y
 7DCEcg/Lrt45oajjrfsj80NeU37umgwfktgjV6XfdA==
X-Google-Smtp-Source: AMsMyM7v5VDtQldWHY7LbSYnX2W9FTr8ZklLCzWu0mW/aBtFjD2a7olumY4PHY7WMeG7WNGNmqJbTF1s6/aVBFGYq9E=
X-Received: by 2002:a17:906:9b90:b0:78d:9704:752 with SMTP id
 dd16-20020a1709069b9000b0078d97040752mr38598911ejc.695.1666839732130; Wed, 26
 Oct 2022 20:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221019093215.8204-1-allen.chen@ite.com.tw>
 <20221019093215.8204-2-allen.chen@ite.com.tw>
 <20221024163748.GA1874793-robh@kernel.org>
 <58b1b01c1f494c3e8a54890ad8a7cdb8@ite.com.tw>
In-Reply-To: <58b1b01c1f494c3e8a54890ad8a7cdb8@ite.com.tw>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 27 Oct 2022 11:02:00 +0800
Message-ID: <CAEXTbpdHkd3KfOkwLt63QhHheqEJuWyRLWiNzD1i4a1rbUabnQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
To: allen.chen@ite.com.tw
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
Cc: Kenneth.Hung@ite.com.tw, jernej.skrabec@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Jau-Chih.Tseng@ite.com.tw,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, jonas@kwiboo.se,
 Hermes.Wu@ite.com.tw, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Allen,

On Thu, Oct 27, 2022 at 9:09 AM <allen.chen@ite.com.tw> wrote:
>
> Hi rob
>
> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, October 25, 2022 12:38 AM
> To: Allen Chen (=E9=99=B3=E6=9F=8F=E5=AE=87) <allen.chen@ite.com.tw>
> Cc: Pin-Yen Lin <treapking@chromium.org>; Jau-Chih Tseng (=E6=9B=BE=E6=98=
=AD=E6=99=BA) <Jau-Chih.Tseng@ite.com.tw>; Hermes Wu (=E5=90=B3=E4=BD=B3=E5=
=AE=8F) <Hermes.Wu@ite.com.tw>; Kenneth Hung (=E6=B4=AA=E5=AE=B6=E5=80=AB) =
<Kenneth.Hung@ite.com.tw>; Andrzej Hajda <andrzej.hajda@intel.com>; Neil Ar=
mstrong <narmstrong@baylibre.com>; Robert Foss <robert.foss@linaro.org>; La=
urent Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kw=
iboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>; David Airlie <airlied@=
linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Krzysztof Kozlowski <krzysztof.=
kozlowski+dt@linaro.org>; open list:DRM DRIVERS <dri-devel@lists.freedeskto=
p.org>; open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicet=
ree@vger.kernel.org>; open list <linux-kernel@vger.kernel.org>
> Subject: Re: [PATCH v5 1/2] dt-bindings: it6505: add properties to restri=
ct output bandwidth
>
> On Wed, Oct 19, 2022 at 05:32:13PM +0800, allen wrote:
> > From: allen chen <allen.chen@ite.com.tw>
> >
> > Add properties to restrict dp output data-lanes and clock.
> >
> > Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> > Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> > ---
> >  .../bindings/display/bridge/ite,it6505.yaml   | 89 +++++++++++++++++--
> >  1 file changed, 83 insertions(+), 6 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > index 833d11b2303a7..8e607b6929fc9 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > @@ -52,9 +52,70 @@ properties:
> >      maxItems: 1
> >      description: extcon specifier for the Power Delivery
> >
> > -  port:
> > -    $ref: /schemas/graph.yaml#/properties/port
> > -    description: A port node pointing to DPI host port node
>
> No existing users you are breaking? The commit msg should explain.
>
> =3D=3D> There are no it6505 users in community.

I would say, currently there are no "upstream" users. So, no existing
users to break.

The term "community" is a bit vague and broad.

Regards,
Pin-yen

> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: A port node pointing to DPI host port node
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              link-frequencies:
> > +                minItems: 1
> > +                maxItems: 1
> > +                description: Allowed max link frequencies in Hz
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: Video port for DP output
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              data-lanes:
> > +                oneOf:
> > +                  - minItems: 1
> > +                    maxItems: 1
> > +                    uniqueItems: true
> > +                    items:
> > +                      enum:
> > +                        - 0
> > +                        - 1
> > +                    description: For one lane operation.
> > +
> > +                  - minItems: 2
> > +                    maxItems: 2
> > +                    uniqueItems: true
> > +                    items:
> > +                      enum:
> > +                        - 0
> > +                        - 1
> > +                    description: For two lanes operation.
> > +
> > +                  - minItems: 4
> > +                    maxItems: 4
> > +                    uniqueItems: true
> > +                    items:
> > +                      enum:
> > +                        - 0
> > +                        - 1
> > +                        - 2
> > +                        - 3
> > +                    description: For four lanes operation.
>
> I would do just:
>
> data-lanes:
>   minItems: 1
>   items:
>     - enum: [ 0, 1 ]
>     - const: 1
>     - const: 2
>     - const: 3
>
> It does allow 3 lanes, but I don't think that's a big deal. What it does =
doesn't allow is any order and yours does.
>
> Rob

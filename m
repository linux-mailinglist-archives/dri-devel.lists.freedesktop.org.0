Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E49265702D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 23:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B503D10E17F;
	Tue, 27 Dec 2022 22:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034F810E17F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 22:16:58 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id 6so6902142pfz.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 14:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2nz+0xpf/FwZYsXl34br/szBrwNJc+k2jQRK/lfXtjA=;
 b=DGJa8SlxJIzUxSfemShBGXpsL8Wtha+pI2wuXtLL7AR7v+4qQd674pnUjr1j9rT5YQ
 9RBVW0r7ExG9qO7tsSokHH20t1t/ANRvfv7fjA131WDL+3iy6OfGL64zCunszN2D0zia
 stbXzFNdb32jdP2PF48udsdQ8diDRq5maFn7fc634Lq31D2wycikbpQK/x9K4cUROHHH
 yLe+gtESc5XkCzV4idqKAsTr4pUI92YTCA/54oRKoHR5Sj1sQ16ZsOxKESKub69V2lyj
 9Q462b7tBeueWmkti8A+1lsu/4qP9Z91tbfiwMs32MQMjDBUU901KFrGor8Qoz32Kk6S
 ookw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2nz+0xpf/FwZYsXl34br/szBrwNJc+k2jQRK/lfXtjA=;
 b=lNgZKl20lYtELppui6t2ATYLwjN/HGqV0y3I6kFK8tjglRp29DgjEqPLkg6S9qrujs
 b2MN2szopdJ4r2afSYy5JlQuIL7CB4fu2Bsphq833rVvwSFyVnqT7Uf/v8kNG+0vfGvy
 jONrdgIB8gLste9o1E3tSiY4sUAZ2jnqab3OIfmh1Y+ffOz3YUffGmCZXrfiSL+BfJSN
 9Naqpioh8pgauK4D8eMHWiMK5g4LpLsOg8o6fNA7Wd94boLmnRfNpYE6WdATdBu4BJjP
 ltl2svzizmFywr5oxFETZ/1+TFUEjrPytYnrAmcr+bursLLHppqvs5yu910MixAY+I0Q
 mFzA==
X-Gm-Message-State: AFqh2koynG7Fplf85c0ALY9IRj4Vw1U/wrqbRQRnsbeI+Kd3jKFWopLR
 MEy7NRuny58ERwXrCQzsuUfQ+0DaWFqr9SVnjK1uNg==
X-Google-Smtp-Source: AMrXdXtezi5rDNeB0Nbw47Kco1JdQdNlIn5BXcEJuJPLNDYS047a83X3tjrfItS0VtvqbaZrvwHSUqxzmDB29aes3lY=
X-Received: by 2002:a63:1e66:0:b0:47c:c502:3713 with SMTP id
 p38-20020a631e66000000b0047cc5023713mr1287923pgm.28.1672179418571; Tue, 27
 Dec 2022 14:16:58 -0800 (PST)
MIME-Version: 1.0
References: <20221227110335.2923359-1-javierm@redhat.com>
 <20221227110335.2923359-2-javierm@redhat.com>
 <CAMty3ZAaHKJ21D8mE=HU3D3KOGAiZ7vfmW_Hgc-E5JO5S+tMNA@mail.gmail.com>
 <CABxcv=kwtk21UbOwaV4tq=BpPsrYmnTrzuhybjbknipqk5R-fA@mail.gmail.com>
 <CAMty3ZDESyJoWMO_BgHzUJN=hLV0dH6y=3B9ogOsSUvaTMqarQ@mail.gmail.com>
In-Reply-To: <CAMty3ZDESyJoWMO_BgHzUJN=hLV0dH6y=3B9ogOsSUvaTMqarQ@mail.gmail.com>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Tue, 27 Dec 2022 23:16:46 +0100
Message-ID: <CABxcv=mFzuUq0-PQ8H3N0Sxmzg+z1v_uwhUe0jcH2++NDQRR0w@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: Add Himax HX8394 panel
 controller
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Robert Mader <robert.mader@posteo.de>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>, Sam Ravnborg <sam@ravnborg.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 27, 2022 at 8:37 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Wed, Dec 28, 2022 at 12:58 AM Javier Martinez Canillas
> <javier@dowhile0.org> wrote:
> >
> > Hello Jagan,
> >
> > On Tue, Dec 27, 2022 at 7:16 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > [...]
> >
> > > > +allOf:
> > > > +  - $ref: panel-common.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      # HannStar HSD060BHW4 5.99" 720x1440 TFT LCD panel
> > > > +      - hannstar,hsd060bhw4
> > >
> > > Parent controller can have a compatible where the associated panels
> > > will be enum list.
> > >
> >
> > I'm not sure to follow what you meant. Could you please elaborate?
>
> compatible:
>     items:
>       - enum:
>           - hannstar,hsd060bhw4
>       - const: himax,hx8394
>
> himax,hx8394 is the actual controller and is denoted as fallback compatible.
>

I see. Do you have an example of a panel controller that does this? I
don't see that much value in doing this since you want the DTS to
describe the actual HW and so want the panel I believe.

But also there isn't an of_device_id entry for this fallback
controller compatible string. Feel free to propose that as a follow-up
if you think it is worth doing so.

Best regards,
Javier

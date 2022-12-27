Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B02656E67
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 20:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF0C10E334;
	Tue, 27 Dec 2022 19:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49C610E334
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 19:37:20 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-43ea87d0797so195739427b3.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 11:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TDuSRMT7LeuW6RQ7N+xypX5CPMcCsvqhVlnHymvmVtI=;
 b=rEZX25ycDQZ1thQanMnm+pHbQa936C7pegvTyeEJbbP0xHMpnpylJ/PxzJHrDDGqCm
 uh9TvIADFBvJpo0yFkZgHkBkdDfpmVSAU+FKksylfr1HrbmquN5Wff0v1DclOXJ3uGpM
 LZddDRee3hQpJtoqDzbXQ2IXnexVIDhN9FgN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TDuSRMT7LeuW6RQ7N+xypX5CPMcCsvqhVlnHymvmVtI=;
 b=AXm0TMB6nlelUSq3Go05Hy/A0Kpm3CuFMokcbAVQP3ij//m7Tq9YZ5sOfCzoUZ6/ea
 Lsg27uh6xlZZ0kyfoKMwPa5vtQbj84Vo4y+Ytv1jdYyywDZKD3EYaeJSLy6j/T1eVm2r
 DgLf6Fj401sdkWklv6E9su4EPbvx1fAj+qBFu32Hu2YY9egfVOliZ1vmWmJ1IU3ByQ2B
 kUaBPRich/N5lQTxfkm/4Ll9FXpexf4f3mYTryFLs5/iCo4D0LMkhDOYcQ0k2nME0urz
 DENeDdh3utyBtmlPB3FCIKbxxikahjyVrsdcIJt/xEbcm2kFiCzauYf27QvVC7ZrapY3
 Fmew==
X-Gm-Message-State: AFqh2kqiy4nwYRAdrv8t18j1v9O2erpfNtA/4CNjs40qTwnXLMg5QfU3
 5zjrlQkFAZ7zEF+wmMcvgh7GQitDMBVQENinZSYmMg==
X-Google-Smtp-Source: AMrXdXtk1VEXi6sU/cPZRwXTFvEyMW0TOBsoND8twqKnIwU8PKZUmc1bpUOjkUgxf0ckeok/mCZ824hGpaMayafFoCw=
X-Received: by 2002:a0d:ff86:0:b0:47a:a05b:7d0d with SMTP id
 p128-20020a0dff86000000b0047aa05b7d0dmr859893ywf.230.1672169839892; Tue, 27
 Dec 2022 11:37:19 -0800 (PST)
MIME-Version: 1.0
References: <20221227110335.2923359-1-javierm@redhat.com>
 <20221227110335.2923359-2-javierm@redhat.com>
 <CAMty3ZAaHKJ21D8mE=HU3D3KOGAiZ7vfmW_Hgc-E5JO5S+tMNA@mail.gmail.com>
 <CABxcv=kwtk21UbOwaV4tq=BpPsrYmnTrzuhybjbknipqk5R-fA@mail.gmail.com>
In-Reply-To: <CABxcv=kwtk21UbOwaV4tq=BpPsrYmnTrzuhybjbknipqk5R-fA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 28 Dec 2022 01:07:08 +0530
Message-ID: <CAMty3ZDESyJoWMO_BgHzUJN=hLV0dH6y=3B9ogOsSUvaTMqarQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: Add Himax HX8394 panel
 controller
To: Javier Martinez Canillas <javier@dowhile0.org>
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

On Wed, Dec 28, 2022 at 12:58 AM Javier Martinez Canillas
<javier@dowhile0.org> wrote:
>
> Hello Jagan,
>
> On Tue, Dec 27, 2022 at 7:16 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> [...]
>
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      # HannStar HSD060BHW4 5.99" 720x1440 TFT LCD panel
> > > +      - hannstar,hsd060bhw4
> >
> > Parent controller can have a compatible where the associated panels
> > will be enum list.
> >
>
> I'm not sure to follow what you meant. Could you please elaborate?

compatible:
    items:
      - enum:
          - hannstar,hsd060bhw4
      - const: himax,hx8394

himax,hx8394 is the actual controller and is denoted as fallback compatible.

Jagan.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E70658B3D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 10:54:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2E188784;
	Thu, 29 Dec 2022 09:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928AF10E255
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 09:54:00 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id 192so20031739ybt.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 01:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+yOD3yNpp4Sg8yVPxedVVEWiPubXWdIpWJ3m/jNQjH0=;
 b=dQ6fcikk6vSdmKrU4eLNH7HDLeidwKolv/8H1oeAG7B3pwfbe/kHq+/7rbE/BKd+RA
 n+mqeyGKLCphg6xq4Oz5tF6OBBE4Q1JQFKzdIxXoilNO4y4H0hyxMzb+9L1169fnqqy3
 un6K0fBFwKRxCBklBsCzB3FI2vkT89pN/4fyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+yOD3yNpp4Sg8yVPxedVVEWiPubXWdIpWJ3m/jNQjH0=;
 b=p8Q7qBrqdKmJlEt9g3od89l7dExEjMO3+mfFGrI52I2A1veNGUEsgibKjJRphWvEzP
 qHxTLyXV/bqzvEdBWoaW6OznIzAwgV8O63i+rPxxM209D/QXD/mbqHQtyReV4hOeIhuL
 HphM63w6JiQFwowqcqIyLExQZL4HHBxcMnqBGwZXoBE5/q0deiXH9fX0bv8mPjK8CN/v
 j+nOxX+2L1ksgu3Tj4VqxoAGzV9/m29/1MR269kDV7WUIDMSaKru6Ztwtjrl0npEQHLN
 BNnljYyCRV/+dFzIJi+Dj/Sf/x5MwQpJcQ7HQzNU3QaiMKIIcDOxP9P7dY3TQK5uQMdW
 P1vg==
X-Gm-Message-State: AFqh2kq7bja0xMCmAVv1eje7RpTCAFpdpNWIpY1DNgsXzcDeVsqXKzam
 EOCS7n0O7JBOk1XuaVYJBKGdb0LILIwGJGcjv+a0Gw==
X-Google-Smtp-Source: AMrXdXuoA9vvADI0ga1A0rofeM2WbLDlgYQM51CNwbZv9FCgQQSqThlpYZEU3IL66FDhwNeWBldubTZDmOBxovx8eek=
X-Received: by 2002:a25:cc82:0:b0:6f9:bd14:f0b4 with SMTP id
 l124-20020a25cc82000000b006f9bd14f0b4mr3559292ybf.408.1672307639746; Thu, 29
 Dec 2022 01:53:59 -0800 (PST)
MIME-Version: 1.0
References: <20221227110335.2923359-1-javierm@redhat.com>
 <20221227110335.2923359-2-javierm@redhat.com>
 <CAMty3ZAaHKJ21D8mE=HU3D3KOGAiZ7vfmW_Hgc-E5JO5S+tMNA@mail.gmail.com>
 <CABxcv=kwtk21UbOwaV4tq=BpPsrYmnTrzuhybjbknipqk5R-fA@mail.gmail.com>
 <CAMty3ZDESyJoWMO_BgHzUJN=hLV0dH6y=3B9ogOsSUvaTMqarQ@mail.gmail.com>
 <CABxcv=mFzuUq0-PQ8H3N0Sxmzg+z1v_uwhUe0jcH2++NDQRR0w@mail.gmail.com>
In-Reply-To: <CABxcv=mFzuUq0-PQ8H3N0Sxmzg+z1v_uwhUe0jcH2++NDQRR0w@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 29 Dec 2022 15:23:48 +0530
Message-ID: <CAMty3ZDJEx6J6xtbAVyO61vSKeW_7F-xWk5yvkwKvHNc1oyykA@mail.gmail.com>
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

On Wed, Dec 28, 2022 at 3:46 AM Javier Martinez Canillas
<javier@dowhile0.org> wrote:
>
> On Tue, Dec 27, 2022 at 8:37 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > On Wed, Dec 28, 2022 at 12:58 AM Javier Martinez Canillas
> > <javier@dowhile0.org> wrote:
> > >
> > > Hello Jagan,
> > >
> > > On Tue, Dec 27, 2022 at 7:16 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > [...]
> > >
> > > > > +allOf:
> > > > > +  - $ref: panel-common.yaml#
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      # HannStar HSD060BHW4 5.99" 720x1440 TFT LCD panel
> > > > > +      - hannstar,hsd060bhw4
> > > >
> > > > Parent controller can have a compatible where the associated panels
> > > > will be enum list.
> > > >
> > >
> > > I'm not sure to follow what you meant. Could you please elaborate?
> >
> > compatible:
> >     items:
> >       - enum:
> >           - hannstar,hsd060bhw4
> >       - const: himax,hx8394
> >
> > himax,hx8394 is the actual controller and is denoted as fallback compatible.
> >
>
> I see. Do you have an example of a panel controller that does this? I
> don't see that much value in doing this since you want the DTS to
> describe the actual HW and so want the panel I believe.

Yes, but the Panel needs to be built on top of the display IC so the
actual parent here is the display IC and the panel is sub-HW.  This is
what usually follows, here are some reference bindings.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml

Jagan.

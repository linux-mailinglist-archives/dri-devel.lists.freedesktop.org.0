Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13412AC5CC3
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 00:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B1110E554;
	Tue, 27 May 2025 22:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AGcYNmxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA00910E0CC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 22:05:08 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a36e0d22c1so2586377f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 15:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748383507; x=1748988307; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KG8BjnFz725w+RJTFOBJ8/xx3WkWJOjksuYHfHNSoPA=;
 b=AGcYNmxulZcpMVDDrcruuNo3sACZdZC8Z5GgTe/Pto1My/xPC1jmNdpYGBErgPqx6L
 QhZxjRIOP1xE5O1tlzDYBM2RCAQUhM0TEek4wc2plAcWZZPOq3050b60D5CFEdzXsqzl
 CGyNQinxwASF1UrDMk4wi+HgQeEQbP0aKSFyscCXVUSGBBIcjHCNZnjlQKL6OMQnN+fK
 8vVH+TTMewDiElBcMaewkydPqXhp6zwozgVJIFAHtBKhX3zngcVrqCdLEZHEott+GCHt
 e0rTHQS7KmUOzSl4ym54WeUvrYNSQoCjoEtjqBrxZMIk87X5heEQqMOkJyksP5TbR2Gt
 d6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748383507; x=1748988307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KG8BjnFz725w+RJTFOBJ8/xx3WkWJOjksuYHfHNSoPA=;
 b=OUV7QuHlixp4glWvCSWGr7jHeeIzWxeQ1apCSp5QuJitvNoAqY98onPPQkxzFu2wKh
 qp10edGgS9vRR6R+V2X03pCrBzsZrQ/aqR+S7UAwvzEHGs9sYJddclnrUtbKMAGm7ZDG
 VEFaDPxZKfCZTopmuXeTsIjqHmbmPV8Kkmp2B4/nZf3B5ioBcUAounkXqVuyD7hM9/B7
 B/8UcYXxK5aNf4KlEiCrL/8gS40SO55NeavQCOGUHeArRMNOJ6vJy3CwmBk4dBCgPQGP
 B9H44k6SyGXIVak5g8LFmLoxD0Pw+PdJOaFINM2mO4c+/1/iVpSIl8NpZ8bwWLybwTRg
 GVJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx9HAAImTX3jKxG1YM5bW4i8nTHac2qqwyGau4epUd4oRi8RWNiwumHjv4L0e54NdeM1WyKXOMd6g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygtKnYhSkV+VTBObX9CmaQtOGKKlzWx6xhFpNxWgS9YbdjgAlW
 b6/LeeD5dLtF6uh+Ptt0XaUzQvNf/Fnw99jG9dYJG7NcUmk6vuZaXSJK368RrhWleXOcAWMIS+x
 TsuSAFZo/iJMMoLmYOOT5J0FcuyyYLsY=
X-Gm-Gg: ASbGnctZKK60EZ6Ss7UqiLijWkPw1BrbYPdD2AvNUhGbcKN5ZIOPWLZ+8uXVyaIPPrD
 Af6nGWmPYEEyKh8QWoECnkRpI78eECHAFFp8muSfFb13MaBelt/ENjC5hzCfqfHH4KhJoZcyMQu
 IvOLWrqIYiOPSNTCTPdfFqvRXfXgOINt8D1QSTEGAdRkczyal6N4XvHgsyHc6KdATSVQ==
X-Google-Smtp-Source: AGHT+IGWzHwVyMPWLupHxdlIZ7x8pSXYNOI5yOCN63qH5VjrNlj/jeGAmW+KftK3jzltxm09oZuPLSrF0CmPFP7qfnA=
X-Received: by 2002:a05:6000:430b:b0:3a4:d13b:4aaa with SMTP id
 ffacd0b85a97d-3a4d13b4c6emr10639950f8f.5.1748383506671; Tue, 27 May 2025
 15:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdU__dxi4wvS3ikBQefM7uwWWK0bCcHv=TL-Td678pEi9Q@mail.gmail.com>
In-Reply-To: <CAMuHMdU__dxi4wvS3ikBQefM7uwWWK0bCcHv=TL-Td678pEi9Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 May 2025 23:04:40 +0100
X-Gm-Features: AX0GCFvzEXrNrs8pB60A-DbmcANSH2AumZoYJ7_LJzs0X887u5z28IVnMfYtap8
Message-ID: <CA+V-a8u7PBz31L+b=x8+B_yXCRzOC351PArw02rx+yYNidT2OQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Hi Geert,

Thank you for the review.

On Fri, May 23, 2025 at 3:58=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to that=
 of
> > the RZ/G2L SoC. While the LINK registers are the same for both SoCs, th=
e
> > D-PHY registers differ. Additionally, the number of resets for DSI on
> > RZ/V2H(P) is two compared to three on the RZ/G2L.
> >
> > To accommodate these differences, a SoC-specific
> > `renesas,r9a09g057-mipi-dsi` compatible string has been added for the
> > RZ/V2H(P) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > @@ -14,16 +14,17 @@ description: |
> >    RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, w=
ith
> >    up to four data lanes.
> >
> > -allOf:
> > -  - $ref: /schemas/display/dsi-controller.yaml#
> > -
> >  properties:
> >    compatible:
> > -    items:
> > +    oneOf:
> >        - enum:
> > -          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> > -          - renesas,r9a07g054-mipi-dsi # RZ/V2L
> > -      - const: renesas,rzg2l-mipi-dsi
> > +          - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
>
> Nit: I would add the new entry after all the old entries, to preserve
> sort order (by part number).
>
I'll move that later to preserve the sort order in the next version.

Cheers,
Prabhakar

> > +
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> > +              - renesas,r9a07g054-mipi-dsi # RZ/V2L
> > +          - const: renesas,rzg2l-mipi-dsi
> >
> >    reg:
> >      maxItems: 1
>
> The rest LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

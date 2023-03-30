Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6056CFD75
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D36510ED1E;
	Thu, 30 Mar 2023 07:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E5010ED1E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:55:38 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id b18so22443692ybp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 00:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680162937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8TRAXBRH6vuNDmz4+Ct5vgKbo/mRjVW2gW1RnB3gDdg=;
 b=TYnTo8X28PQN/bpZVTbpJIirV8lHodZlY8A0dbT1xp3tSgoMVv6qmx7oSoQnauJ4Px
 2BEx1WulTod+AN0I4AlznepNZBjtBfgGzxaajHZ2uShUx1sirLZ5IjrYm2yUXHLoYkNi
 OCVvhvgFNWXn2SgSUxT9FoSDH2uLn1GPSFrio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680162937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8TRAXBRH6vuNDmz4+Ct5vgKbo/mRjVW2gW1RnB3gDdg=;
 b=WOc9PQRan3IKIxDqYPZ3b72KOywa/0la0nSjYCwmZO8ZH1JN2jgPR85/djkTyY4w3F
 W4zTvzf71S6GOXof6T/PpubJVjF4Xv1oA+JnLB3/5DX/e7apAm74EA2OrmyyKtNqSgru
 3CY4ObFWG8iKv9ows8P95wn/P1HPk9qa2qSqdS54fvujYFze1beksgGEoj30XVkWhOm2
 oJ8ai6Z8xp/z6DiLRIBKzSiUhxQ+YFeyBv91KMHf3ir9rWwFO+ufZosVgXqAoxkRu5aw
 ZpFs3wue8AxmU/QqL7I+bwk5HGDivQFbFVOxtUIDKP3HtAIX3xRcp0baKW2GakO6ipft
 O8Tg==
X-Gm-Message-State: AAQBX9dUk1rTjZVf2U4iibHX4fzb6cPuqruRzxchayG9sLBedr3AixDS
 PDtDk3IXS7kv7rOjrXJboUx+6iRda3z+4rr+DBr4XA==
X-Google-Smtp-Source: AKy350bxyUd9g6l4vGryZzbI7Jfljfwd11D0eLMkzSrJUJiOJ/KA63QBnHaVdrHOYG2aLouktTsZ0y9EkQu3jaiYmv4=
X-Received: by 2002:a05:6902:920:b0:b76:ae61:b68b with SMTP id
 bu32-20020a056902092000b00b76ae61b68bmr11595302ybb.5.1680162937296; Thu, 30
 Mar 2023 00:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230329144155.699196-1-festevam@gmail.com>
 <ff66c8b9-c7f7-1eb2-c730-4812b7ff6824@linaro.org>
In-Reply-To: <ff66c8b9-c7f7-1eb2-c730-4812b7ff6824@linaro.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 30 Mar 2023 13:25:25 +0530
Message-ID: <CAMty3ZBHvR8OxgNgKG--TA_LQF41vjPiruHx-Pw2PwbjNKMFog@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: exynos: dsim: Add
 'lane-polarities'
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: marex@denx.de, neil.armstrong@linaro.org, Fabio Estevam <festevam@denx.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 1:08=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 29/03/2023 16:41, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > The Samsung DSIM IP block allows the inversion of the clock and
> > data lanes.
> >
> > Add an optional property called 'lane-polarities' that describes the
> > polarities of the MIPI DSI clock and data lanes.
> >
> > This is property is useful for properly describing the hardware
> > when the board designer decided to switch the polarities of the MIPI DS=
I
> > clock and/or data lanes.
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > ---
> >  .../devicetree/bindings/display/exynos/exynos_dsim.txt      | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_ds=
im.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> > index 2a5f0889ec32..65ed8ef7aed7 100644
> > --- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> > +++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> > @@ -29,6 +29,12 @@ Required properties:
> >
> >  Optional properties:
> >    - power-domains: a phandle to DSIM power domain node
> > +  - lane-polarities: Array that describes the polarities of the clock =
and data lanes.
> > +    1: inverted polarity
> > +    0: normal polarity
> > +    The first entry corresponds to the clock lanes. Subsequent entries=
 correspond to the data lanes.
> > +    Example of a 4-lane system with only the clock lanes inverted:
> > +    lane-polarities =3D <1 0 0 0 0>;
>
> First, please convert to DT schema.

I have a previous iteration of this conversion. Can I resend it on top
of drm-misc-next?
https://lore.kernel.org/all/20210704090230.26489-9-jagan@amarulasolutions.c=
om/

Jagan.

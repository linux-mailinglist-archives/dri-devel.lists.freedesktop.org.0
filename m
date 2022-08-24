Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DE659F8B4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 13:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA3C10E110;
	Wed, 24 Aug 2022 11:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0D710E160
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 11:40:23 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id w19so32993540ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 04:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=pxKLfOME1R0KZZACiredgYsYKfw4h1/06Dg8Bmv9RjQ=;
 b=DBL6LzztEwGp8X1U8me4Py7MxcKtdBb9YWUi/PURCPdr8iaMAQDC8JC3zxz4qqE0/m
 bKiS9swMJ0I5nPY+WOf/aR2SgT5kiL8AiQEtdNwGVF8bxhUe+HlKjaVE6uQdl5UELpDi
 nOqrp5TCMAWdBs5o5nfC1rfU5e2qXs5dmOvk9/Gd5R+3FZ/hFX5nFrXLNuh4R7eCVAqi
 FCD5iN/WHnPKHbnfzWuSN5G0k1/px6vzxcTx4TMMx7qF3sPYp0G+KwZA99xomnl42Zmg
 JZ7XnaY5aKCjIc5pKnlLhwWDnsYB0uqJ+gTcJALUtFK0Nclz4q/LUoSWJvtnF87WM0Di
 VwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=pxKLfOME1R0KZZACiredgYsYKfw4h1/06Dg8Bmv9RjQ=;
 b=D8AiiC5jaxTQwLZgb7US2GdSXjTiN8gOeUBNvcJ68WAuGZYSYdG5xBO6qMtxXK6a8Q
 F7zCHdAKc5cleJSrDVxn3gnWye5qDFGJJuFcNu3AautvdVgLKxvklrCeGRHa1FreMcEJ
 wt2pRsOO/PHD9+3lGOuXfBMSo24JX1tOzeDEzqJu2h024GurdGaFGH4FhPThuA9mB3Z0
 jjdP+eUJ52IY5kDicCwpDBZoE83fqctTcyc1DPEU0x/DuwWeyS3Hdn94pJoc3BpA8rGg
 u6sz+zo/6UxpGdvm2b+GNi/F6CDOKr2gN1DgVRTDsRKvrCfvUpI/+NZ0Lcm+rCjepzUw
 +VNw==
X-Gm-Message-State: ACgBeo3FIlW6l18W+/J0UeEvW5b6omz9pfLhNSRaPFBp3URbsvzdrzNX
 /R1GWU/c5FTyXgfzpGz8ROjFXMkY7YBe1IVvQHY=
X-Google-Smtp-Source: AA6agR5Ns6sE/CX5NmrAoDfd3/1lrF0pkxRUfma+oBjhnH3A3CDYJX/3W1+0CRi4pSmkQBkj4rL/neE5GM78cX+RuJ8=
X-Received: by 2002:a17:906:e9b:b0:730:a6a1:9fc9 with SMTP id
 p27-20020a1709060e9b00b00730a6a19fc9mr2623390ejf.601.1661341220971; Wed, 24
 Aug 2022 04:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220823122117.15757-1-yuanjilin@cdjrlc.com>
 <48f4a56f-0586-9e9d-c121-6309be65b803@arm.com>
In-Reply-To: <48f4a56f-0586-9e9d-c121-6309be65b803@arm.com>
From: Inki Dae <daeinki@gmail.com>
Date: Wed, 24 Aug 2022 20:39:44 +0900
Message-ID: <CAAQKjZNPBDwEwjL7+rYTvfm7eQ85feXW1rr_P3VCERn3fPPfjQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fix repeated words in comments
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Jilin Yuan <yuanjilin@cdjrlc.com>,
 Dave Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 krzysztof.kozlowski@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

2022=EB=85=84 8=EC=9B=94 23=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 10:37, =
Robin Murphy <robin.murphy@arm.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 2022-08-23 13:21, Jilin Yuan wrote:
> >   Delete the redundant word 'next'.
>
>  From the context, I'm not sure it is redundant - as far as I can tell
> this comment seems to be describing a sequence of 3 commands, where
> "current" is the first, "next" is the second, and "next next" implies
> the third. The whole comment could certainly be reworded more clearly,
> but as it stands I suspect a replacement like s/next next/next+1/ is
> more likely to be correct.
>

"next next" is correct. :) As you said, "next next" could be reworded
more clearly. As of now, the original sentence could make it
confusing.

Thanks,
Inki Dae

> Robin.
>
> > Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> > ---
> >   drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/=
exynos/exynos_drm_g2d.c
> > index 471fd6c8135f..4f9edca66632 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > @@ -1195,7 +1195,7 @@ int exynos_g2d_set_cmdlist_ioctl(struct drm_devic=
e *drm_dev, void *data,
> >        * If don't clear SFR registers, the cmdlist is affected by regis=
ter
> >        * values of previous cmdlist. G2D hw executes SFR clear command =
and
> >        * a next command at the same time then the next command is ignor=
ed and
> > -      * is executed rightly from next next command, so needs a dummy c=
ommand
> > +      * is executed rightly from next command, so needs a dummy comman=
d
> >        * to next command of SFR clear command.
> >        */
> >       cmdlist->data[cmdlist->last++] =3D G2D_SOFT_RESET;

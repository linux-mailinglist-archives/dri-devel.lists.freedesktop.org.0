Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A259ABF6C7
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 15:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11E510F7A5;
	Wed, 21 May 2025 13:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bmddWd+x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D20112822
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 13:03:34 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3a3758b122cso1782985f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747832613; x=1748437413; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wxUCNKcIAtTYLrDekvN1ZxlXpxO8icS4vzE5Gw13lAc=;
 b=bmddWd+xZSb9f1hUbC20axBHsEyVmFk5A5TN/M7k/qtU6OpElYWr/GmimHrtvE28E7
 gRY2JXafGpGLbRynU50ZmlQIIV785VBsIjNVm09x1tng/AdXcXOCzcDftWTjv6KO40B0
 o5Rqpu/aoLJimttqKAqyG4ezeMw0n/bouVT8hGMV3dz1dOCCR9A0ZZGztz4OVqsg82Dc
 Vdi2YKnjC2Qb8D91lF0Kl6XFohFxKv+INE8cMLQa6j9Bi9TzYK9A1ln5UH8aMIhjWge+
 dMxPVxKK5YAFiHxf54UbWG9rOPeBIEbb76v2hah6Sl/Wgv6hEGkeZP4oRZnKnSXh/EZE
 +9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747832613; x=1748437413;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wxUCNKcIAtTYLrDekvN1ZxlXpxO8icS4vzE5Gw13lAc=;
 b=gy31h/Tm9aZUxd9KnpQ+rZtZMZJxLbx9qufMYpQTeRFtvt+3X2i4N89wHrmKr2Htuk
 kBRJ02L8v0ieLLNvNYGpJc/5AAm6DsyXJasyxIpwORp+Tokw096p9PMuQRK0K1a6ex+F
 NDILoWiEjX3Wnx237h+oyhuIDRGT1PEfBkZqZo1seJzEoW+rRqUnUyWtY1qVYFflm91X
 uf3pIAfQXEyVGeFtq85bxzDwVX7rvIA9U+fNhipUOMb4OKFXKt31lEnU3YlZgq0PK3t2
 RnQtw8aOfJE/JfPSD6r3nBQMT1A9y67dQZkmMdyjXIcNwEb9ZSQcmaAcYAZhT0Sft+G4
 Ba2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn2He89DmXSHTPZvCD4BWjqXkePcFQDLZLbFYY790lIIfL2le5IE5xtdL65/t7zc0C7b+ztCsfPB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvrFxU8rxJn+z2Od3oGn1sG4juzteR6IziLAw6QSUyVhQhV/nd
 4iswPIVL7mgMLnK9OJQZRm0Rl3q9S/adnAAeNifna8jG1aLib35aJ9B17qe1xmDogSuNtua4JrH
 q/SEDZ2EJoBvKSE7q1/P5EfAEui0TNpw=
X-Gm-Gg: ASbGncuTy6sm2e9H0//gUeDSTiqBeLVMaJMbelyZNAH2E4ox2w7DqvcV7OJVIZzQspj
 Gng5Lx0cSdDSqMac204PCrinoyHfqDLDuBeSf83besJtAg44gj5GayuJWlwTokyeP6ZDqWR955L
 ELPktTppx/ruMVtCZz9tQS49eWhPs=
X-Google-Smtp-Source: AGHT+IF/naWSKz9Iv0UJNgBSgjeRcEZZGj46F7Ju4nJrrYSa1meUmDtFjbIVglIeqEAVFZYHjaKdytI2+lWr5HTtIkE=
X-Received: by 2002:a05:6000:1a88:b0:3a3:63d3:36a7 with SMTP id
 ffacd0b85a97d-3a363d33916mr16104984f8f.33.1747832612802; Wed, 21 May 2025
 06:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250520140514.GD13321@pendragon.ideasonboard.com>
In-Reply-To: <20250520140514.GD13321@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 21 May 2025 14:03:05 +0100
X-Gm-Features: AX0GCFvSCItvyC7zSPBsFZ7h_B5ndgyUu6UlDl1R2XH7TowgSYTkizcIkSlL3n0
Message-ID: <CA+V-a8vn46BLWyn0DCp-6h3eZD8ef+r7vLCy6vkfkyehdM8d7g@mail.gmail.com>
Subject: Re: [PATCH v5 04/12] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ
 calculation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Laurent,

Thank you for the review.

On Tue, May 20, 2025 at 3:05=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Mon, May 12, 2025 at 07:23:22PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Simplify the high-speed clock frequency (HSFREQ) calculation by removin=
g
> > the redundant multiplication and division by 8. The updated equation:
> >
> >     hsfreq =3D (mode->clock * bpp) / (dsi->lanes);
>
> You can drop the parentheses around the second factor. You can actuall
> drop all prentheses.
>
Agreed, I will drop the parentheses.

> >
> > produces the same result while improving readability and clarity.
> >
> > Additionally, update the comment to clarify the relationship between HS
> > clock bit frequency, HS byte clock frequency, and HSFREQ.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v4->v5:
> > - No changes
> >
> > v3->v4:
> > - No changes
> >
> > v2->v3:
> > - No changes
> >
> > v1->v2:
> > - Added Reviewed-by tag from Biju
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index ec8baecb9ba5..c5f698cd74f1 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -277,10 +277,10 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mi=
pi_dsi *dsi,
> >        *       hsclk: DSI HS Byte clock frequency (Hz)
> >        *       lanes: number of data lanes
> >        *
> > -      * hsclk(bit) =3D hsclk(byte) * 8
> > +      * hsclk(bit) =3D hsclk(byte) * 8 =3D hsfreq
> >        */
> >       bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > -     hsfreq =3D (mode->clock * bpp * 8) / (8 * dsi->lanes);
> > +     hsfreq =3D (mode->clock * bpp) / dsi->lanes;
>
> You can drop the parentheses here too.
>
OK, I'll drop the parentheses.

Cheers,
Prabhakar

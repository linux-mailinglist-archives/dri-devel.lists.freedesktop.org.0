Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939D9A683FF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 04:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56B910E0E9;
	Wed, 19 Mar 2025 03:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BZcyf38X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B49310E0E9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 03:54:49 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-86ba07fe7a4so5526672241.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 20:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742356488; x=1742961288; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dFWVWI+PpPHLAY/181byB09plfh1Tntlt/fFkm++uLE=;
 b=BZcyf38X36+rJnoSzbUwrU7ThqBrWCcjcNBXV6Td+GYFwQRuXzdK106gt2hpDG3VJ4
 lPijGcvvFupLrEq2Axf/fNN/Tr8CUr8fhSCgpChi6Dk2HMjjrS1iSzR/u+fULdpLNODW
 5T55NtkUVPrCMBOsvMy7c98SLQYd5+KoimqM5Ri00UaPiIECvnALtmOYPaQF3RdNmts5
 YDqMQZQW/bk/sD8RFReTNF5d0ZPYLqTMIgawn2N0cOCe4Ls6Wpmx16arbNkhsoGkwU5+
 qmfeQDziIbb9wyKsObuo3/dE1J+6fO6yM2X4aVbsbtsXQySRCqonV80C08caFlCrklEC
 eEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742356488; x=1742961288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dFWVWI+PpPHLAY/181byB09plfh1Tntlt/fFkm++uLE=;
 b=mHFwOKZBsPHFHxNxcLvY63ggxLUw5NwMvc89BgzQm9fJMcInukPasV3iW1sSB9a+Lo
 X1NBtYRYLaTvdcKcy+LcpePjo4D1Q3x5BhWC0BB9fTeOQ/BKBe8ImlrimookXg5L7IO5
 FJ+/OAya+v3/NapJNaGYRxlWOyLryouy4qzTi537txptWw/21gND+7V8bBMi/aZJrBdy
 uhsr2N5zAYrowiLfi4HFutpUouBFutEVebTQWLJtpF3skfCQxRBumw1iPXrLUZa7+RDC
 PQXrhPfsSN2LMgHQjJjB6nAN0OHuDCs5ZlVLKsQGs6wS+6jUabkf5WLvOtTlhIEXD/wo
 3clA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDJKv5j+0S0eHwIt4PafQiRMcYRGaHNZ2oePUkcW3OuhcNdNG3Ky7V0tvNaaYXmcoOpOkRQsjg5C0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJzoX/uT6EzQrU5uvUQRBTyRptJAfx2ku5k4m+2PhvpguJhn0G
 fud7VVHwkR2d1Pr6gtCquJtGq8hvD6cS6yf7E392Zs0yU0Chy+RGHcUE2yylSD89TEKx3Isf9Zh
 esCD0vQu3cjpp1K6VMw+85+s1Dns=
X-Gm-Gg: ASbGncu4w8hqRf+zrDA4UmTv9zihqGuc+PaZwq8J6f+yEMoumI0GZ2Ttw3Y66uPsmSP
 XyoKiRafssVDqn16gshrYuvF7q+r8fecEHP08j0TALJOVc8sF0ZtBzwc0WP49e1Xj4L6c2Zyn3o
 bUySdAawZVAllImyQkl5KRSdz6QfBHuZ+FFyVYzsx0BmPJqFyur8gUN1/1ug==
X-Google-Smtp-Source: AGHT+IEqv3kQJ6Pv+jUD/aIdBwf8rIlXorR/MdjQVCohA4Hqv+zI7ioRlnfkexCPs1hThHfGycIxsg2ejvSJwK4+dMI=
X-Received: by 2002:a05:6102:e11:b0:4c1:9288:906c with SMTP id
 ada2fe7eead31-4c4ec6725e3mr802044137.9.1742356488628; Tue, 18 Mar 2025
 20:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250228144531epcas5p217fab73da682601a89e208fff5a3775e@epcas5p2.samsung.com>
 <20250228140257.75045-1-anindya.sg@samsung.com>
In-Reply-To: <20250228140257.75045-1-anindya.sg@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Wed, 19 Mar 2025 12:54:37 +0900
X-Gm-Features: AQ5f1JqEqLZIcxY8_7ZoD8rrNjASTanZyk3nVh9C9jMdKFDiJELGTcF_x0O4DlY
Message-ID: <CAAQKjZMH=hJ5V6s7jPSju61jRM6mXZvu8qJYoG9HFZv-DFPh=g@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fixed a spelling error
To: Anindya Sundar Gayen <anindya.sg@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 aswani.reddy@samsung.com
Content-Type: multipart/alternative; boundary="00000000000093b3bf0630a9fb4d"
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

--00000000000093b3bf0630a9fb4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Merged.

Thanks,
Inki Dae

2025=EB=85=84 2=EC=9B=94 28=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 11:45, =
Anindya Sundar Gayen <anindya.sg@samsung.com>=EB=8B=98=EC=9D=B4
=EC=9E=91=EC=84=B1:

> Corrected a spelling mistake in the exynos_drm_fimd driver to improve cod=
e
> readability. No functional changes were made.
>
> Signed-off-by: Anindya Sundar Gayen <anindya.sg@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 1ad87584b1c2..c394cc702d7d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -731,7 +731,7 @@ static void fimd_win_set_pixfmt(struct fimd_context
> *ctx, unsigned int win,
>         /*
>          * Setting dma-burst to 16Word causes permanent tearing for very
> small
>          * buffers, e.g. cursor buffer. Burst Mode switching which based =
on
> -        * plane size is not recommended as plane size varies alot toward=
s
> the
> +        * plane size is not recommended as plane size varies a lot
> towards the
>          * end of the screen and rapid movement causes unstable DMA, but
> it is
>          * still better to change dma-burst than displaying garbage.
>          */
> --
> 2.17.1
>
>
>

--00000000000093b3bf0630a9fb4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">Merged.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D=
"auto">Inki Dae</div></div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">2025=EB=85=84 2=EC=9B=94 28=EC=
=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 11:45, Anindya Sundar Gayen &lt;<a hr=
ef=3D"mailto:anindya.sg@samsung.com">anindya.sg@samsung.com</a>&gt;=EB=8B=
=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Co=
rrected a spelling mistake in the exynos_drm_fimd driver to improve code<br=
>
readability. No functional changes were made.<br>
<br>
Signed-off-by: Anindya Sundar Gayen &lt;<a href=3D"mailto:anindya.sg@samsun=
g.com" target=3D"_blank" rel=3D"noreferrer">anindya.sg@samsung.com</a>&gt;<=
br>
---<br>
=C2=A0drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exy=
nos/exynos_drm_fimd.c<br>
index 1ad87584b1c2..c394cc702d7d 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
@@ -731,7 +731,7 @@ static void fimd_win_set_pixfmt(struct fimd_context *ct=
x, unsigned int win,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Setting dma-burst to 16Word causes perm=
anent tearing for very small<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* buffers, e.g. cursor buffer. Burst Mode=
 switching which based on<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * plane size is not recommended as plane size =
varies alot towards the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * plane size is not recommended as plane size =
varies a lot towards the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* end of the screen and rapid movement ca=
uses unstable DMA, but it is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* still better to change dma-burst than d=
isplaying garbage.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div>

--00000000000093b3bf0630a9fb4d--

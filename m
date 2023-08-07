Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21CA772A9F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE8810E2B5;
	Mon,  7 Aug 2023 16:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DA810E2B4;
 Mon,  7 Aug 2023 16:26:28 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1bc479cc815so3685303fac.1; 
 Mon, 07 Aug 2023 09:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691425588; x=1692030388;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e+y0EPgsXPYGqDhgU0ly4Js9jdJ8CVWq1QGImohPTzg=;
 b=U26wNKBXF4TXIYytCM7pRJjJtOffhyxeALBgdZu6WaxOb8+SG/25jUDmFTbHxPnyYZ
 lt+MTlSgweJIXIdbjj//oJAVAAywyV+zHEN+wq/ySVgOIhApxP4nYF82RnxmVytwABe2
 U0wFcJ4GJ9mzWAVr3wAMUrXw6qMWXGszMsUXm73xSHZFxB7Ywv+QXEnbZGYoYdJSLDR9
 Xp3jqle9ZgMQ0TG3RdtJCvPSKvQ8+WxhZdhFl3FGhly7/4aQXf5vyHTnXqTfNsQSz2D5
 FytNZmrc2ncRWZ7zshSAzaIh4nDHaEhcX7qwm8NnGVBBrMgUi19I9XVs8lU1kKTKBpwg
 2Oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425588; x=1692030388;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e+y0EPgsXPYGqDhgU0ly4Js9jdJ8CVWq1QGImohPTzg=;
 b=irBYZp1xpjgzRosu3jE2+tYwcczcQYISinc5pC+MGUNvh5xN3GBYfoAIgIvIwAOvBc
 sGnI/axWygt5FKlJPxQkgIsu4FW+Qv5JA30Bg4Gu/L7es2S331y4bcXuD9VtNEkd2r1p
 K4oHoftPGIs7pXp4gczoHkLxUo2fXt2eguNZ8z4vU8PVOYqPlQXKD+q/XKAJyssThGz8
 nYvb66G6AoIlFk8S2mGGg36+HFPB0m9jgnAlLQuefmmQsgYDfbVMQ1Zh6B81ifbX5cgh
 k6hR8ntoPpU8aOE648a82uQ7RQ1NlR8r0ys9BQ2PT/flKxY0nAVMf0cZnfwvVl+TSL0e
 Oh/Q==
X-Gm-Message-State: AOJu0YzfNHX6l9RlHCUuM0bLzDrkKvmBlA2DtLTpjl8pSyLFjtIjqlFp
 Q1ACMHt9rQr6xWIXIa8yEBQEVINjAW/dTLmWfgg=
X-Google-Smtp-Source: AGHT+IHtXN34eo/D+WLHPMKn8uFbvoUL7yxU34VnYFA/V9sKmSdzupmYHvysUFwQ9U2POQsuhyD6WyVpyFJMVk+Tctw=
X-Received: by 2002:a05:6870:c087:b0:1bb:8ab6:6642 with SMTP id
 c7-20020a056870c08700b001bb8ab66642mr11612014oad.8.1691425587807; Mon, 07 Aug
 2023 09:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230801030334.5069-1-sunran001@208suo.com>
In-Reply-To: <20230801030334.5069-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:26:16 -0400
Message-ID: <CADnq5_OVqaYzv6_y20axW+dmx1+_x9M9A29R8dKnM8rVNjh-=g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm/powerplay/hwmgr/ppevvmath: Clean up errors in
 ppevvmath.h
To: Ran Sun <sunran001@208suo.com>
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 31, 2023 at 11:03=E2=80=AFPM Ran Sun <sunran001@208suo.com> wro=
te:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: return is not a function, parentheses are not required
> ERROR: space required after that ',' (ctx:VxV)
> ERROR: space required before the open parenthesis '('
> ERROR: need consistent spacing around '-' (ctx:WxV)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h b/drivers=
/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h
> index dac29fe6cfc6..6f54c410c2f9 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h
> @@ -166,7 +166,7 @@ static fInt fNaturalLog(fInt value)
>
>         error_term =3D fAdd(fNegativeOne, value);
>
> -       return (fAdd(solution, error_term));
> +       return fAdd(solution, error_term);
>  }
>
>  static fInt fDecodeLinearFuse(uint32_t fuse_value, fInt f_min, fInt f_ra=
nge, uint32_t bitlength)
> @@ -230,7 +230,7 @@ static fInt ConvertToFraction(int X) /*Add all range =
checking here. Is it possib
>  static fInt fNegate(fInt X)
>  {
>         fInt CONSTANT_NEGONE =3D ConvertToFraction(-1);
> -       return (fMultiply(X, CONSTANT_NEGONE));
> +       return fMultiply(X, CONSTANT_NEGONE);
>  }
>
>  static fInt Convert_ULONG_ToFraction(uint32_t X)
> @@ -382,14 +382,14 @@ static int ConvertBackToInteger (fInt A) /*THIS is =
the function that will be use
>
>         scaledDecimal.full =3D uGetScaledDecimal(A);
>
> -       fullNumber =3D fAdd(scaledDecimal,scaledReal);
> +       fullNumber =3D fAdd(scaledDecimal, scaledReal);
>
>         return fullNumber.full;
>  }
>
>  static fInt fGetSquare(fInt A)
>  {
> -       return fMultiply(A,A);
> +       return fMultiply(A, A);
>  }
>
>  /* x_new =3D x_old - (x_old^2 - C) / (2 * x_old) */
> @@ -447,7 +447,7 @@ static fInt fSqrt(fInt num)
>
>         } while (uAbs(error) > 0);
>
> -       return (x_new);
> +       return x_new;
>  }
>
>  static void SolveQuadracticEqn(fInt A, fInt B, fInt C, fInt Roots[])
> @@ -459,7 +459,7 @@ static void SolveQuadracticEqn(fInt A, fInt B, fInt C=
, fInt Roots[])
>         f_CONSTANT100 =3D ConvertToFraction(100);
>         f_CONSTANT10 =3D ConvertToFraction(10);
>
> -       while(GreaterThan(A, f_CONSTANT100) || GreaterThan(B, f_CONSTANT1=
00) || GreaterThan(C, f_CONSTANT100)) {
> +       while (GreaterThan(A, f_CONSTANT100) || GreaterThan(B, f_CONSTANT=
100) || GreaterThan(C, f_CONSTANT100)) {
>                 A =3D fDivide(A, f_CONSTANT10);
>                 B =3D fDivide(B, f_CONSTANT10);
>                 C =3D fDivide(C, f_CONSTANT10);
> @@ -515,7 +515,7 @@ static int uGetScaledDecimal (fInt A) /*Converts the =
fractional portion to whole
>                 dec[i] =3D tmp / (1 << SHIFT_AMOUNT);
>                 tmp =3D tmp - ((1 << SHIFT_AMOUNT)*dec[i]);
>                 tmp *=3D 10;
> -               scaledDecimal =3D scaledDecimal + dec[i]*uPow(10, PRECISI=
ON - 1 -i);
> +               scaledDecimal =3D scaledDecimal + dec[i]*uPow(10, PRECISI=
ON - 1 - i);
>         }
>
>         return scaledDecimal;
> --
> 2.17.1
>

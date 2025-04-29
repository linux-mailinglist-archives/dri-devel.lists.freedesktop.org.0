Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E720AA1900
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 20:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA4E10E462;
	Tue, 29 Apr 2025 18:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SM7gOipH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0C110E0D2;
 Tue, 29 Apr 2025 18:06:29 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-301a8b7398cso845620a91.1; 
 Tue, 29 Apr 2025 11:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745949988; x=1746554788; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cH/uQx6QUmR06WXEWjtQjaJrBZIsX8Ks6Q8cT1OIeyI=;
 b=SM7gOipHrWjry1LbadXZFyVTcw5XB+EoI6RqmqwXJjAwXSZD6sB4Cu9Twk8xhxdsqr
 +Xjw/FzU8ma5Cy6Bt2SBmL9qf/nd6/J6jX90yn3aCLi8rcG4EejC7lutlY6LTLTknmkU
 JGH8FkWXuthWs/TNxs/jVBwVHSYtmMwsWCIGJoZEHNS7ywW+vyvBuLvDMC7xte7D12Ej
 5WFvc4HEoQB3ht02132vnEbW3kxIQw+Wbl7ZMBxcckslLNaIerM2yB1i0tKvFUoEv8HD
 b25ByTYP46dLhegC+UgvqCLQky55/3sOM7Oe69fKQIHjo3MZHmJV6c9+OiLJUOWIDdSj
 VD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745949988; x=1746554788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cH/uQx6QUmR06WXEWjtQjaJrBZIsX8Ks6Q8cT1OIeyI=;
 b=Z2/Uyjm0whqJcmyHsEcYC0bFQLdmPiemh6CCrncO+mV6LHyhvOe6y1OQOVkxLoVtjj
 5ef0zADOyeip1AeLvXv2e7Ecn5Zx/3BLbAGx5ydtZ7qVvOd/dE3HwNcdpOugwdYMv+Z5
 j1rh17HIH7JQn8IgVqhyl9dgcQRPhMcr9yiknf6hzBfWXOImTQno0rCm1uXoLhOTj9T4
 UfO+5/usN2CThfuGcc71WadyizzTudfFWgDmRBd44AB3ECMVMZi9pqkdKWnhb3+yhVC9
 L9M2vw8U7Pt+gbEBg04NJ/s22zElK5CjcLX0iQ3SwPG8dMSuPUcQUlgXs/u5PjmXyXca
 iZJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6jzI1gHKXnfZ5DRQd7PkjOj80kwJbti9txUjM/6OHVX3Y7/tJOttYmGvN3pbBJIH3g178TmK8@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsfoFioFuPb/pKVd8semcxO1BfJR2gS1APYqkEQDyfAdvjqdLw
 WU88iPZqfHAdmpXMnA9d9/t7YH09A4wgu6lI27jAVv5a8HepmESExDIBiwZIGv3ZcKfC+i9anSd
 iXnXiPP91liLhKdppJY9CN5zPdl7Iyg==
X-Gm-Gg: ASbGncs+gDswGmVkiBjhgkxRuXAbaRksM2YU+QiB5q+PzoVhOUR/BBqDio+aNS8PPYk
 CXhczmIr8wbl6tSvrALydMAnt/AL9Qp1LRZ6f+s0nQsgLKddbe8Cw2ZIqOD22//lzSbhKlgLbNo
 ZodBEdpBao7g2Np4Vw2Qc24g==
X-Google-Smtp-Source: AGHT+IFLbWuOec+SIqz2/rrxcLdbfZeENx5vdxS6Oww2CAOLDDXrBDUcAqQa/S9kCYSzU7jWRi/LfoTxCCW8GxNxO3g=
X-Received: by 2002:a17:90b:4c08:b0:304:eacf:8bba with SMTP id
 98e67ed59e1d1-30a33355332mr36839a91.4.1745949988475; Tue, 29 Apr 2025
 11:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250428213401.752738-1-harry.wentland@amd.com>
In-Reply-To: <20250428213401.752738-1-harry.wentland@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Apr 2025 14:06:17 -0400
X-Gm-Features: ATxdqUGqK_rLy5H-AD1WtzkVAmSXX7uCILO9v3tntGqYFWxNfTJxnCbQJxxnhRo
Message-ID: <CADnq5_PXbkF8FBOPnG8a1K4ez+LduxJWa30ONPEpydNeK++t+A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Don't check for NULL divisor in fixpt
 code
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 Linus Torvalds <torvalds@linux-foundation.org>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>
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

On Mon, Apr 28, 2025 at 5:43=E2=80=AFPM Harry Wentland <harry.wentland@amd.=
com> wrote:
>
> [Why]
> We check for a NULL divisor but don't act on it.
> This check does nothing other than throw a warning.
> It does confuse static checkers though:
> See https://lkml.org/lkml/2025/4/26/371
>
> [How]
> Drop the ASSERTs in both DC and SPL variants.
>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>

Maybe add Fixes tags for the original patches which added these?

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c   | 5 -----
>  drivers/gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c | 4 ----
>  2 files changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c b/drivers=
/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> index 88d3f9d7dd55..452206b5095e 100644
> --- a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> @@ -51,8 +51,6 @@ static inline unsigned long long complete_integer_divis=
ion_u64(
>  {
>         unsigned long long result;
>
> -       ASSERT(divisor);
> -
>         result =3D div64_u64_rem(dividend, divisor, remainder);
>
>         return result;
> @@ -213,9 +211,6 @@ struct fixed31_32 dc_fixpt_recip(struct fixed31_32 ar=
g)
>          * @note
>          * Good idea to use Newton's method
>          */
> -
> -       ASSERT(arg.value);
> -
>         return dc_fixpt_from_fraction(
>                 dc_fixpt_one.value,
>                 arg.value);
> diff --git a/drivers/gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c b/drive=
rs/gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c
> index 52d97918a3bd..ebf0287417e0 100644
> --- a/drivers/gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c
> @@ -29,8 +29,6 @@ static inline unsigned long long spl_complete_integer_d=
ivision_u64(
>  {
>         unsigned long long result;
>
> -       SPL_ASSERT(divisor);
> -
>         result =3D spl_div64_u64_rem(dividend, divisor, remainder);
>
>         return result;
> @@ -196,8 +194,6 @@ struct spl_fixed31_32 spl_fixpt_recip(struct spl_fixe=
d31_32 arg)
>          * Good idea to use Newton's method
>          */
>
> -       SPL_ASSERT(arg.value);
> -
>         return spl_fixpt_from_fraction(
>                 spl_fixpt_one.value,
>                 arg.value);
> --
> 2.49.0
>

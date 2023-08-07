Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8EF772C74
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18ABC10E334;
	Mon,  7 Aug 2023 17:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE1A10E334;
 Mon,  7 Aug 2023 17:14:40 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1bf08ca187cso3525834fac.3; 
 Mon, 07 Aug 2023 10:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428479; x=1692033279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bWD6TxvdwSAH/B9jUxdL6rJdTRaVEm9tb0ibIt4x1Y4=;
 b=AQH7GqBt/UT+Q1k+/kh20XyTPgdDGza18M0j8AVGijLPA7XvfvjiKyi7JIKWUsv3lt
 fkWVLoAXk9SB6IKJjCgTMDTg4TiumV37XFx3n3uqS6VayjEpgOZbM8c7Pq2/mKCtgDEa
 aeJZjnUkxVaSfiq9nf3SkuCOrqhAZhs8D+O/YW29zzRuHcgs1zY3YsubQ9jz3Rfm7+2f
 kZJ213yEGjGjYgUFK79NZK7CrZRUf6lsbK9Z0XzsV8wcPnwPmaOdqp9NaT6UxrwYNkZt
 shn/XTI+c4MxxbWAtGvb3mCsDgPavYWAO5W/lWiOxj0wfHbhj9asvWgUQxN1VxiYKvNT
 uu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428479; x=1692033279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bWD6TxvdwSAH/B9jUxdL6rJdTRaVEm9tb0ibIt4x1Y4=;
 b=B7yOPtvtlNrX90u4yKNBpL2zvz6VLiyQF6snASlp8v+t3YjZbaMa3Y+FZ0PFFZdlUe
 VWk6mz86XaK3ti0wTeV8dB+6cIvbmLb01Q73etKPlFMpJOi/IOwUWybI/sqeD2gQfB5+
 hWaZiacDhrnL1KkuKBeJS97rYyZEiEGgc3LO6r86NL91t+3t9evlL5rHyrFU0ygorT6a
 GTbQs5Nt4/La+tdeB3q2eXyga3I4Bxl7SWPZenGNu51NHtMuAoB9Fsy1+fhS2pjXzOK4
 SCXACbUzSkA6Nr1+DJ5/8Uxy+Dy7KMzqy97a57ZvbghRkEUB8uL2LoS160laO55PbEFt
 sv7w==
X-Gm-Message-State: AOJu0YxVf69FtV0/HSTdffTyFUiz9gY4axibvSCPnPN66cR2rhPCFPX7
 Z6SzW7IqxbbL2HxQ5ct/ERd5I66rXTiUnqEdSHI=
X-Google-Smtp-Source: AGHT+IE+ptLVBkibVh5g1Pp3F+dxRftBDAb7kEDscU/+Vga6QjAdNv9SbXnNPKKp77IsK5KFrgqzXxisWYrLw4tvEGU=
X-Received: by 2002:a05:6870:6392:b0:1b3:d457:f27a with SMTP id
 t18-20020a056870639200b001b3d457f27amr12770303oap.50.1691428479622; Mon, 07
 Aug 2023 10:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230802061635.11243-1-sunran001@208suo.com>
In-Reply-To: <20230802061635.11243-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:14:28 -0400
Message-ID: <CADnq5_PwxZ1-0K=AR7DTdZb6vuTT66h_Op5hVnRW_VAqHP3bng@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Clean up errors in dcn10_dpp_dscl.c
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Aug 2, 2023 at 2:16=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: else should follow close brace '}'
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c b/driv=
ers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
> index 7e140c35a0ce..5ca9ab8a76e8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
> @@ -197,8 +197,7 @@ static void dpp1_dscl_set_lb(
>                         DITHER_EN, 0, /* Dithering enable: Disabled */
>                         INTERLEAVE_EN, lb_params->interleave_en, /* Inter=
leave source enable */
>                         LB_DATA_FORMAT__ALPHA_EN, lb_params->alpha_en); /=
* Alpha enable */
> -       }
> -       else {
> +       } else {
>                 /* DSCL caps: pixel data processed in float format */
>                 REG_SET_2(LB_DATA_FORMAT, 0,
>                         INTERLEAVE_EN, lb_params->interleave_en, /* Inter=
leave source enable */
> --
> 2.17.1
>

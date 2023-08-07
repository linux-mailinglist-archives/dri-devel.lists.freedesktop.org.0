Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91315772BD5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AD710E2FF;
	Mon,  7 Aug 2023 16:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114DF10E2FF;
 Mon,  7 Aug 2023 16:58:24 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1bb58b4c513so3520883fac.0; 
 Mon, 07 Aug 2023 09:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691427503; x=1692032303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wdIDxHlj3CBjEs4/nbCl29OQGxlIEXIjwPDyccsPxDE=;
 b=andONpF4M/88tEP2nqehwpuHN7tQ3fImuVgkX8eWzlSKV2lc/RwxoVl8VmJ+UYCnEg
 A2m1Ix+2Imf1UdtHZTL34HJOrtIUX8TNly1xld4iUVqveSQTyAL0SpGbSyMyKC/Uc0XR
 WMQcMQmwirnQz84Hq7m2G40WowDjwGoTNP6yPVsDsx5AYXS0tooNBAq4onubGWjhCwT9
 Q89Dt3yomRLyYM7myoltbdOy8uqHFGj90EojIyg7S915cS/qFabiUvF8qaHJz3RJf/sB
 4qZADKs9BFyKsxUCmS90fa0pVMHQ4hSK9/cb3WJlRqO1nmtmgj1zmzIKPZI/mcy9Hjv9
 iqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691427503; x=1692032303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wdIDxHlj3CBjEs4/nbCl29OQGxlIEXIjwPDyccsPxDE=;
 b=FTaDD9T/2wnfA4SIx5+r4AZYiBr4qZVPTUnTGBC108kHb+xA2djYfkkkH1rMyVUFOK
 zCd0YrNoTWw8B86B3u9rrhDteJLDxuCjo8SNCiMUsOmeGdeaVBo4AWs/psMJ8b0W1i0O
 JPuHRDdYxUlOp5SscYdOmj0VqOnvmN974SXWK8UfcTpadEkVQHqgQhuVcxdpEI0/PrSK
 jAM1rgDiSKIEUzLdbPMPG4GQ335bYTP229FApZhdhpOwHX+5M7OMAaljQG7sZ+upFcJh
 w9HgVa9ZwnjxJYotyD7ZnFCbfYzBVfDvYYwL+ti1XDJlcMzSGISOhffZLqcb6Kl9BgZH
 ZOPw==
X-Gm-Message-State: AOJu0YzfBT2+AoYKo/e9PMGMYTJ6YZSK1dP895eJd4NuQU2oQ7uzLBbe
 zTPdDc+ALtsvXBcYW5WjAhjfqgMviSvbAUmyxSA=
X-Google-Smtp-Source: AGHT+IFTGh7xGv1PL5QDFuVB2WyIhIetxgTZttc29LRUs6RK4LBIlMq8AQYuQjrD5hikB7bp3y/QblOCIXCtkrvwk+g=
X-Received: by 2002:a05:6870:5694:b0:1bf:1246:4e8c with SMTP id
 p20-20020a056870569400b001bf12464e8cmr13106946oao.11.1691427503318; Mon, 07
 Aug 2023 09:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230802013818.8766-1-sunran001@208suo.com>
In-Reply-To: <20230802013818.8766-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:58:12 -0400
Message-ID: <CADnq5_O6nh6jxUWhvf_ZTyfDzrFWqLCpO6mkasxw02c__oCYag@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in pp_thermal.h
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

On Tue, Aug 1, 2023 at 9:38=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/inc/pp_thermal.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/pp_thermal.h b/drivers/=
gpu/drm/amd/pm/powerplay/inc/pp_thermal.h
> index f7c41185097e..2003acc70ca0 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/inc/pp_thermal.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/inc/pp_thermal.h
> @@ -25,14 +25,12 @@
>
>  #include "power_state.h"
>
> -static const struct PP_TemperatureRange __maybe_unused SMU7ThermalWithDe=
layPolicy[] =3D
> -{
> +static const struct PP_TemperatureRange __maybe_unused SMU7ThermalWithDe=
layPolicy[] =3D {
>         {-273150,  99000, 99000, -273150, 99000, 99000, -273150, 99000, 9=
9000},
>         { 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000,=
 120000},
>  };
>
> -static const struct PP_TemperatureRange __maybe_unused SMU7ThermalPolicy=
[] =3D
> -{
> +static const struct PP_TemperatureRange __maybe_unused SMU7ThermalPolicy=
[] =3D {
>         {-273150,  99000, 99000, -273150, 99000, 99000, -273150, 99000, 9=
9000},
>         { 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000,=
 120000},
>  };
> --
> 2.17.1
>

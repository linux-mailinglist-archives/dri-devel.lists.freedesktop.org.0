Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B063925B2
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 05:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101836EE07;
	Thu, 27 May 2021 03:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E776EE07;
 Thu, 27 May 2021 03:57:38 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so3144099otp.11; 
 Wed, 26 May 2021 20:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PjGMU2eJY7MAduIGnouTTmy3o2skeXkndWNlCEoNBuQ=;
 b=PTTEEebu/8sQ5ioSNf7911tKuN2wGLLQfH2cQNi0CzqN/ETQH+TsFzI1H25ulvzWQg
 6dLO5o51zMJlGzOzwReSjuFhd+6mUsKx1lkVOYOsnCoE0qOAzzget65iz7HXv3RAc/k4
 8PNoyifj2yNi2rMu8fmGSAyMpKeGwmLwcVfGGqApcdge2vt2altFTs51yH8iD03t6SGq
 vB2MVnygFqkZe5qx+6RmjA5NIsPU6g2O8MJmzUfFoLScITDaarOMdOh4RDbTbrPokdH9
 eBnjHb9PElXrztbqidvTP0SHjKhwb2+jjDXJOlcLF7yXz72zGxRF3v9qs5bZ5+kyAHSZ
 pC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PjGMU2eJY7MAduIGnouTTmy3o2skeXkndWNlCEoNBuQ=;
 b=d//GdbC0fx4TU2trNxzCMPnUowvyjcwnEXm8fjN1sjeUfPU9gROkWBN+PzZB5Y/dlw
 G99F6nvqrjmPfWQMPpVnpYUprKiseBE0o4ncfulG2k8DegZiAHHcb6tCc+hz3xOqiZAL
 TpZgk1XFGFoShyJCR9WNKrwgd5Bm4JOvo/DD9hO6nxHyGhTE/D1xOXch0evKhc7VEuRu
 FcfnioSNcNybEuk5/m6xa8JCJztjZH1ERaItRhv+pB7d6JN+H3M7Yt/E6gYWVHmPQkgL
 662g406DZ2vLqZ5df6QU6TRrEhm80jALnkIvKfH6fmNB5Q12vW4IIXn3DmUbvGEgbnvP
 knUQ==
X-Gm-Message-State: AOAM530LYiUd8SZL6qkYvSseAQ+lCF3KvVQ6G28yJzhUlOVWCwZ2ae9a
 xkte/nGFHUVxRJ/mXEK1tg7wNpxKZJ8KoT8aRJA=
X-Google-Smtp-Source: ABdhPJxl3eiIdARqk0LBovOakNpsqVIr2PbwJ9p56brQbaisMJonCXUkm68X8Ga/Zma/B50jfTWsbguJeMWeeB9pAZY=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr1255345otl.132.1622087857923; 
 Wed, 26 May 2021 20:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-11-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-11-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 May 2021 23:57:27 -0400
Message-ID: <CADnq5_OteJ0ZZSKqbZ-j3KD7kGajoEyq-F7=VFbruvgxRQC6yQ@mail.gmail.com>
Subject: Re: [PATCH 10/34] drm/amd/display/dc/bios/bios_parser: Fix formatting
 and misnaming issues
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 26, 2021 at 4:47 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser.c:997: warning=
: expecting prototype for get_ss_info_from_table(). Prototype was for get_s=
s_info_from_tbl() instead
>  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser.c:1562: warnin=
g: expecting prototype for BiosParserObject(). Prototype was for bios_parse=
r_get_ss_entry_number() instead
>  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser.c:1739: warnin=
g: expecting prototype for get_ss_entry_number_from_internal_ss_info_table_=
V3_1(). Prototype was for get_ss_entry_number_from_internal_ss_info_tbl_V3_=
1() instead
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/=
gpu/drm/amd/display/dc/bios/bios_parser.c
> index c67d21a5ee52f..9b8ea6e9a2b96 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> @@ -979,7 +979,7 @@ static enum bp_result get_ss_info_from_internal_ss_in=
fo_tbl_V2_1(
>         struct spread_spectrum_info *info);
>
>  /**
> - * get_ss_info_from_table
> + * get_ss_info_from_tbl
>   * Get spread sprectrum information from the ASIC_InternalSS_Info Ver 2.=
1 or
>   * SS_Info table from the VBIOS
>   * There can not be more than 1 entry for  ASIC_InternalSS_Info Ver 2.1 =
or
> @@ -1548,7 +1548,7 @@ static uint32_t get_ss_entry_number_from_ss_info_tb=
l(
>         uint32_t id);
>
>  /**
> - * BiosParserObject::GetNumberofSpreadSpectrumEntry
> + * bios_parser_get_ss_entry_number
>   * Get Number of SpreadSpectrum Entry from the ASIC_InternalSS_Info tabl=
e from
>   * the VBIOS that match the SSid (to be converted from signal)
>   *
> @@ -1725,7 +1725,7 @@ static uint32_t get_ss_entry_number_from_internal_s=
s_info_tbl_v2_1(
>         return 0;
>  }
>  /**
> - * get_ss_entry_number_from_internal_ss_info_table_V3_1
> + * get_ss_entry_number_from_internal_ss_info_tbl_V3_1
>   * Get Number of SpreadSpectrum Entry from the ASIC_InternalSS_Info tabl=
e of
>   * the VBIOS that matches id
>   *
> --
> 2.31.1
>

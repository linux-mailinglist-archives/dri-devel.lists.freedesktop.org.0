Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2C936E0A2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 22:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061406EC3D;
	Wed, 28 Apr 2021 20:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DBF6EC3D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 20:59:02 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 w6-20020a4a9d060000b02901f9175244e7so2081329ooj.9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 13:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G2OBzAUD24UfNgtHAYfTaV3vaIuaS43o5GiN5Oy1s58=;
 b=UK1m/XrNQZo+3/3qtTnm4bEdWY1wrjgQbNrEdxxm78JbP7qjX6F8Mo+Jh2utBLJs+V
 xZm+3y54er/qgAaO3CV/7rv0fLMB2zm0XHwbq8+T2sDaOu5y3DQghr34MenzS4tgMGGm
 KEelbBBxAUu640F9lRkhVtbUfakZ1lyioq3aZMm7q3rw2jxDH9+EAyT8reNcXngNX2NI
 0/7wbQRmPDYcS2uWbAImkXvkarazfm6qJejS8kQh17xz3j2ZbjBH+3z+H1+SfU8oeKG5
 Om3lyx7SXWqjES3J1Lnu5qTUM4dvurXmkAM8KIIPK4BeFqezE9OyIYlUOI1U369D8XXi
 LGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G2OBzAUD24UfNgtHAYfTaV3vaIuaS43o5GiN5Oy1s58=;
 b=eSBG9Oq8PRBemobUb0CdiikRwaugMLHTCkO/ODaJEK+IFezbyEaEY9qxEUTL8SzYz/
 QNuzTMcJO9jIYzp4RndPwVSY7suszEoq1dkT2XkT7PpyIr7zhAgvYxYHN7SwqOvVqfk6
 4YoHNg8vU3VXOT6FOPzKfxJYRc1BELRk0GrmIrrZHcKxUrZ6meHjk2CgWYAWtwzVlXI1
 kYEFUH8LaPZaMRIUctJNv05sqvOATEMBE+yKCePNoJrmBhcn3KG6TE0XHK3o3NT8cCIH
 TQ/2AdlqQxca/iL1GRhR62o6hFgQekP3UB/Y+0DgYYZe/vWsCk17geVqCOXkdh3BHhra
 K94g==
X-Gm-Message-State: AOAM532smhEzS83pVGRJfHfuEdu7vcPQ4RO/kLRy6P02+4rh+VeuOnqX
 0H+hCBAt/7mGfANalue0TvMVZO+dkp8ZtRZOXVHDoveTN0ZS3g==
X-Google-Smtp-Source: ABdhPJw7do/ZENdIPKEBfaUuFGzuehuvgTNWpJ19CkZly4rxrP+LmDVtQWpjiD2YfJ4XZtOdv1o87KSDtXU7A/xwnLc=
X-Received: by 2002:a4a:800d:: with SMTP id x13mr24537879oof.61.1619643542189; 
 Wed, 28 Apr 2021 13:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210424221900.9725-1-fmdefrancesco@gmail.com>
In-Reply-To: <20210424221900.9725-1-fmdefrancesco@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Apr 2021 16:58:51 -0400
Message-ID: <CADnq5_PqyyyY6rpX_Q+=H+ukhvgttgC9cOzXgzFt-Rv7jPamUA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/pm/powerplay/hwmgr: Fix kernel-doc syntax in
 documentation
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 outreachy-kernel@googlegroups.com, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 24, 2021 at 6:19 PM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> Fixed kernel-doc syntax errors in documentation of functions.
>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Applied.  Thanks!

Alex

> ---
>
> Changes from v1: Reword both the subject and the log message
>
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> index b1038d30c8dc..f503e61faa60 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> @@ -275,7 +275,7 @@ static const ATOM_VOLTAGE_OBJECT_V3 *atomctrl_lookup_voltage_type_v3(
>  }
>
>  /**
> - * atomctrl_get_memory_pll_dividers_si().
> + * atomctrl_get_memory_pll_dividers_si
>   *
>   * @hwmgr:           input parameter: pointer to HwMgr
>   * @clock_value:     input parameter: memory clock
> @@ -328,7 +328,7 @@ int atomctrl_get_memory_pll_dividers_si(
>  }
>
>  /**
> - * atomctrl_get_memory_pll_dividers_vi().
> + * atomctrl_get_memory_pll_dividers_vi
>   *
>   * @hwmgr:                 input parameter: pointer to HwMgr
>   * @clock_value:           input parameter: memory clock
> @@ -1104,7 +1104,7 @@ int atomctrl_calculate_voltage_evv_on_sclk(
>  }
>
>  /**
> - * atomctrl_get_voltage_evv_on_sclk gets voltage via call to ATOM COMMAND table.
> + * atomctrl_get_voltage_evv_on_sclk: gets voltage via call to ATOM COMMAND table.
>   * @hwmgr:              input: pointer to hwManager
>   * @voltage_type:       input: type of EVV voltage VDDC or VDDGFX
>   * @sclk:               input: in 10Khz unit. DPM state SCLK frequency
> @@ -1144,7 +1144,7 @@ int atomctrl_get_voltage_evv_on_sclk(
>  }
>
>  /**
> - * atomctrl_get_voltage_evv gets voltage via call to ATOM COMMAND table.
> + * atomctrl_get_voltage_evv: gets voltage via call to ATOM COMMAND table.
>   * @hwmgr:              input: pointer to hwManager
>   * @virtual_voltage_id: input: voltage id which match per voltage DPM state: 0xff01, 0xff02.. 0xff08
>   * @voltage:          output: real voltage level in unit of mv
> --
> 2.31.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

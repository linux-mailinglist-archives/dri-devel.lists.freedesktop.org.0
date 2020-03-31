Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFBD1998B2
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 16:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B18E898EE;
	Tue, 31 Mar 2020 14:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D733C898EE;
 Tue, 31 Mar 2020 14:38:00 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a25so26344660wrd.0;
 Tue, 31 Mar 2020 07:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JADBVi0J5qz93W24U2adaMbSQmHxVLtGj9kUvlZL2mw=;
 b=XmopI/9Zqw6A9PeSefGPxVNIf13LCLwxUSam19fXeD6vfy791BKxHimSDr32VJzf/8
 rKgighSLhiTQU1LCvs2ivINb6lMYeUcFcAxS2ynCRIpkG6svgzKb50yvqoDL/o4d6ooI
 y/5yE4Xc955YWoBlO7roQssDgYkuuHfEHz+6DtKQTD9rXkAnu3nUJNASV+a3Qdy9gil5
 XWBD2lPkz/6fhe8yQ5uWBSVzXYqFgZuQhvONxqSF1/oTqlWq++gZXoUP5jw8yqBaDIX+
 0vTQ4f9KXxNICfpP0ytUZ9wlg9iBXEfPa7ae7lTRW+92ZgeyJ/slLwmkmNLQJ4zwZY21
 6k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JADBVi0J5qz93W24U2adaMbSQmHxVLtGj9kUvlZL2mw=;
 b=KI0wd/1cDZIvObA4YPHTBhke9W7PBf0DaSiRDy8fXkCBYm0UJCh9dLxj1jHjfPIqfZ
 HG7JoEvW2kbHmaNkBNQs+eU5e/Uvu7RuOBpX5TQyVChswANaYlRHLkKSWsAda134A8Ez
 59x+FZWeZfp11hDMY4M2W77BtITbld6mUz8FfZ/UVIIX6tOaDby6029W0bvpvObeqMO3
 5tEGJIzam54zM7ee4wJ154nzOWGTUi3u6gyRjbhSyohpuBFfyUifF17rzuzVmWqSjokJ
 kZlcS7baW0AbVh7zQFEPyJ8aDhkbp1w+4UFArUHyr61Gy8VD6s61BE79oajmV6y4WoWW
 zrgA==
X-Gm-Message-State: ANhLgQ0Abi3lp6pLEJH0eWG8KoPo+XDocP4HQZ8nSj2fKt6Cx6x5hoVp
 3DvZ4j6y0ewuPe6HHahPOcHvbx8PacJxeY+orCg=
X-Google-Smtp-Source: ADFU+vtePjXgkDVvMEpbaF955pZevqw5shIxAyv4Oc72hqk5QsXUDeMDs3KNVqrgcy6TGXOdcybhz8cwW/YAwLtQn34=
X-Received: by 2002:adf:f50d:: with SMTP id q13mr21374343wro.374.1585665479545; 
 Tue, 31 Mar 2020 07:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200330221614.7661-1-natechancellor@gmail.com>
In-Reply-To: <20200330221614.7661-1-natechancellor@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 Mar 2020 10:37:48 -0400
Message-ID: <CADnq5_NQKDHmaVsyEMFcwEcGbo9QCHoC5cZ_3DOO8wNY2e_LDA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix 64-bit division error on 32-bit
 platforms in mod_freesync_build_vrr_params
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 3:38 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> When building arm32 allyesconfig,
>
> ld.lld: error: undefined symbol: __aeabi_uldivmod
> >>> referenced by freesync.c
> >>>               gpu/drm/amd/display/modules/freesync/freesync.o:(mod_freesync_build_vrr_params) in archive drivers/built-in.a
> >>> did you mean: __aeabi_uidivmod
> >>> defined in: arch/arm/lib/lib.a(lib1funcs.o)
>
> Use div_u64 in the two locations that do 64-bit divisior, which both
> have a u64 dividend and u32 divisor.
>
> Fixes: 349a370781de ("drm/amd/display: LFC not working on 2.0x range monitors")
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/modules/freesync/freesync.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> index 8911f01671aa..c33454a9e0b4 100644
> --- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> +++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> @@ -761,10 +761,10 @@ void mod_freesync_build_vrr_params(struct mod_freesync *mod_freesync,
>
>         // If a monitor reports exactly max refresh of 2x of min, enforce it on nominal
>         rounded_nominal_in_uhz =
> -                       ((nominal_field_rate_in_uhz + 50000) / 100000) * 100000;
> +                       div_u64(nominal_field_rate_in_uhz + 50000, 100000) * 100000;
>         if (in_config->max_refresh_in_uhz == (2 * in_config->min_refresh_in_uhz) &&
>                 in_config->max_refresh_in_uhz == rounded_nominal_in_uhz)
> -               min_refresh_in_uhz = nominal_field_rate_in_uhz / 2;
> +               min_refresh_in_uhz = div_u64(nominal_field_rate_in_uhz, 2);
>
>         if (!vrr_settings_require_update(core_freesync,
>                         in_config, (unsigned int)min_refresh_in_uhz, (unsigned int)max_refresh_in_uhz,
> --
> 2.26.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

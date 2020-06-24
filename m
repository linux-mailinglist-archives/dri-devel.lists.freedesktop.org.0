Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D1207725
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08856EB8F;
	Wed, 24 Jun 2020 15:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2F46E1B3;
 Wed, 24 Jun 2020 15:16:40 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l2so1411926wmf.0;
 Wed, 24 Jun 2020 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=34hmditf+vhlxJcmEFkZgWoC7pJeDEW0sX6340LuRHw=;
 b=QAVF2FGrKfQudyBRkn3UEh/QzSSNVI0DOwlhIyVt7j4OWP0Q1EKpaZB7h08BZ34SL5
 xOPUwta5fN7soRtWRKATYZPdLsezxlnLx3C0yP1njOkEOzi5vwQ1wVWsSFYl46UQmRhx
 zTRbOaYgkfnwfMea/9aKyEZMcMEW3De25mZvgPzrdK5mCyi9yvuFwNz7toArk1ExXQGr
 vqzqH9txAcCm0C96sFblR42GmoxJWnINnyVmRpWtXXZ0fR2wTjyAkgdvpiYyxX6KbeWp
 9Y5MzCGn0FT1gQPQ1kvcOhDRGpeAcA5WLfAy9ClOcUCzgBrD76MCrjQM1IcW5VIxPfCx
 GAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=34hmditf+vhlxJcmEFkZgWoC7pJeDEW0sX6340LuRHw=;
 b=XNu3Le4owVVT/5ldcluYxzFmMkaWY8IVx/SG5pMfebCay0A/V7zWXzRDG2uCKZlVJA
 J6hvSzqkgkUB5p4GsI7sjmCva96aEv840Qa5TMAy7aGR1zT7mniPQ8xH/xtgATY0y5v/
 ouAR7/xRPVQPwGRCpZnEpVbksBSOE8G27eOS+P1T+zjFLcfKLHUpj1gE9jPr6msh3w/7
 VSzR03kztWFdv0tBGgQ9Pwdx8PohJ4CjvgTigmTKIhDZpMkCO4fsI8NUTVOISwQnktux
 ddybiM2+CEwn1JB6+lyKgFeYDGN2NBqQTuGOjPTPULiJAooYmFTACYUtS8JJEIw+Grw0
 aLSQ==
X-Gm-Message-State: AOAM530kNbO4rGHmPaBtgRqU+/W4iR5EgAcs01GNmiYDS3xBMC0J+Ezg
 rSC462xuqr57iDmMMSUbN/5Sn4dosCQt+9tK7Ec=
X-Google-Smtp-Source: ABdhPJy1qPZlkbkex+2mcQ3H0P1rh2BMF6aNpxBKJx6viXiD5LP/TMlDpplYwy2FDejjx7BYrjXNvarY9HUElDbSf5M=
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr30880941wmy.79.1593011798868; 
 Wed, 24 Jun 2020 08:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200624145418.7794-1-colin.king@canonical.com>
In-Reply-To: <20200624145418.7794-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 Jun 2020 11:16:27 -0400
Message-ID: <CADnq5_PySz6YWOMM4kosC_B83i+jsPKmf0puMt3sw2C-hExa3Q@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: ensure 0 is returned for success in
 jpeg_v2_5_wait_for_idle
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 10:54 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> In the cases where adev->jpeg.num_jpeg_inst is zero or the condition
> adev->jpeg.harvest_config & (1 << i) is always non-zero the variable
> ret is never set to an error condition and the function returns
> an uninitialized value in ret.  Since the only exit condition at
> the end if the function is a success then explicitly return
> 0 rather than a potentially uninitialized value in ret.

We should actually never hit this condition in practice because the
driver won't initialize this module if all of the instances are
harvested, but better safe than sorry.  Applied.

Thanks,

Alex

>
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 14f43e8f88c5 ("drm/amdgpu: move JPEG2.5 out from VCN2.5")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
> index f74262a22a16..7a51c615d22d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
> @@ -462,7 +462,7 @@ static int jpeg_v2_5_wait_for_idle(void *handle)
>                         return ret;
>         }
>
> -       return ret;
> +       return 0;
>  }
>
>  static int jpeg_v2_5_set_clockgating_state(void *handle,
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

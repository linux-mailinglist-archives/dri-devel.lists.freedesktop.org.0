Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4351BE278
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 17:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897EB6E47A;
	Wed, 29 Apr 2020 15:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28416E47A;
 Wed, 29 Apr 2020 15:23:26 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k12so2483680wmj.3;
 Wed, 29 Apr 2020 08:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ty18jkh7zkBHOD6czGW8SkI58aj/+4PBnyEc+GD/orI=;
 b=tus7bxqLbV6hNyOMoOR6rWwDXhsBMRK+6jioSAfK0KlwrSwSOr0fmUyBIRvGaBMJ3D
 J+JlxtgqA3bkzn5APaglpsmiIS6twFCJ3AGHR5NZDxsBKV4m7NcmKV4qvCZkCiCLHj0F
 wVoQWAC+k03amUFqge3cecu7wfI7kFyy9QCAe9F0i/n0P6dtZnLi+UdaSFW/3XXvzdXs
 TUbRmLQoCXCdOo1JndE/p4Fgcxzj2LoOcuMtDw1VvF15eL/AOqIuI98VYfVmRkbb39Db
 n62qJSCybrymus8vXGkZZxI/36eSFoxKIoJO96tDCyBieKuVk79quKpuUGc0iTWLojHU
 Mn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ty18jkh7zkBHOD6czGW8SkI58aj/+4PBnyEc+GD/orI=;
 b=bo3zIxYjSAHJuVryfhjJMx81B+/fGwwMWdRFMd4YTD6H9/vZFbN01lrsZGPyCCJvEm
 1Np9qrTlVtvyOSicMnjS+vACz5GC5eYGFTU+zfAwprM+iPlDVOvDHVUtZmqpOdSMODHj
 toSUdD55cY7A7DxHuCXX72pbWWGqsLxBJiXEG0mJUu5yMcRXTKk+5e7ocaDUTXmB5ppQ
 tj6O8vIAWk5YZ6LKJ4sLclS7QweM14Nyfu2zMcEDqjA8VR6ck/s8U55/dcJg+ZVVO3nO
 9UOuqer/THQvOBu88PkspuOBh+J0cflLsAle8R56lb5Yj+SvR4KX5wbrtcRA/N6wCl0U
 yfTA==
X-Gm-Message-State: AGi0PuaL8lzOQY+iJOHZS8+Hkn4JX5u1j/YZnUm5A3v6uBxLEaHW5gVC
 56CzICtxMDmCsTyc2SUataGeiFvjViUnFxtmKcM=
X-Google-Smtp-Source: APiQypIiNPHG4tyU4vIdIHmmJj7Iq3g5WXyRokunvJVlTuVMH/ieeXBCWNyF731wp2ksSFgu4BuTKHLynCFHmZpLiIs=
X-Received: by 2002:a7b:cc8e:: with SMTP id p14mr3795755wma.70.1588173804710; 
 Wed, 29 Apr 2020 08:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200428063101.25556-1-yanaijie@huawei.com>
In-Reply-To: <20200428063101.25556-1-yanaijie@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Apr 2020 11:23:13 -0400
Message-ID: <CADnq5_MR5ZmcGXi70KAoqpHthhzCsyJfH4ZaXvjVDO5z9CLD3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove duplicate assignment of
 dcn21_funcs members
To: Jason Yan <yanaijie@huawei.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 28, 2020 at 8:46 AM Jason Yan <yanaijie@huawei.com> wrote:
>
> Fix the following coccicheck warning:
>
> drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c:31:51-52:
> exit_optimized_pwr_state: first occurrence line 86, second occurrence
> line 92
> drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c:31:51-52:
> optimize_pwr_state: first occurrence line 85, second occurrence line 91
> drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c:31:51-52:
> set_cursor_attribute: first occurrence line 71, second occurrence line
> 89
> drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c:31:51-52:
> set_cursor_position: first occurrence line 70, second occurrence line 88
> drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c:31:51-52:
> set_cursor_sdr_white_level: first occurrence line 72, second occurrence
> line 90
>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c
> index 8410a6305a9a..fe64bcb49456 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c
> @@ -85,11 +85,6 @@ static const struct hw_sequencer_funcs dcn21_funcs = {
>         .optimize_pwr_state = dcn21_optimize_pwr_state,
>         .exit_optimized_pwr_state = dcn21_exit_optimized_pwr_state,
>         .get_vupdate_offset_from_vsync = dcn10_get_vupdate_offset_from_vsync,
> -       .set_cursor_position = dcn10_set_cursor_position,
> -       .set_cursor_attribute = dcn10_set_cursor_attribute,
> -       .set_cursor_sdr_white_level = dcn10_set_cursor_sdr_white_level,
> -       .optimize_pwr_state = dcn21_optimize_pwr_state,
> -       .exit_optimized_pwr_state = dcn21_exit_optimized_pwr_state,
>         .power_down = dce110_power_down,
>  };
>
> --
> 2.21.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

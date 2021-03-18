Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B461C33FD8F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 04:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFE16E878;
	Thu, 18 Mar 2021 03:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D873E6E89F;
 Thu, 18 Mar 2021 03:10:08 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id l79so375708oib.1;
 Wed, 17 Mar 2021 20:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hQttFW1C06IjLp+yLCYHr9yAyp/8boQfWdvRpg9aqas=;
 b=j+V6eiKGG2VjOHFs8wnpC7+raQP+TbyQPcX/6o2YbdbGSLuXoq9j8nK5IOJ4GR7YLR
 4ZFjt0pkrCHiOqgnq4XsWKZDsUYRRiV6NrcrBDMGWkZZALNumhET7LpOI4/X84/Kvkqy
 0rSSY2rgqIVKepPCYfvyYsV7IUAjHLbHfn9vaLVUqPqMMCX8gNF6hFgkPKWtiUxRiw3M
 AIvow+LbItQccZ5GF1Z00xWted2Bkj0M93XVqYsSn/RxYhABMqAwYgyykuDAHt6/r3XH
 tiKXMrpMlmZzB3/+HHc8LgjksHM5mPMz7E5EnqjMezp3zN7mia2rufpeUH9MOsXs201w
 l7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hQttFW1C06IjLp+yLCYHr9yAyp/8boQfWdvRpg9aqas=;
 b=hJpWnHQgGLx+LsqvB2Yq24razmCDdN/CM9AIU31L6Uko1IFUaUgyZfPDdxA9TxYAYj
 XQvzG4/VHSmVGXa3dZRgMkcBo+BfVt9lzG6UGFc4MjpRfhO56mG8s8aa0ipm3C24jKHc
 +uk85THvliWDlENGQDEnKYdVdu1sZhL+HgdbaHyGSPn+mSoKYEsBTCA1W2Na5W5pq9rU
 iSMPPuQYcOqN90NO88yRCz7Hyh1MtgagpAIL8hImm1rbEaJ9oNOWVJRY7nAQcjlWMuuS
 pQKEs/GZjtxfbt/tnt7gq5IBsyEqFlJF7C10E8zR/wu5vfr0FYCkTDAzO+nSoBPUfpo7
 9T/g==
X-Gm-Message-State: AOAM530rR4Q3AaUeQJfGNiEys7UqjPEa0zmXWIIcDRhWFPxSLPyC4h3K
 nUgqusxVfbqBMrSP7wXqq7dr+qbTYtFKmWS+Q78=
X-Google-Smtp-Source: ABdhPJyLqFby/dx5Ecblmd8XvGAAgX2S0LkgPnrJooV+IuiaHmQehvbBSIpfwwzzzu+cwk+n3BPZr0cFZvPIAnOwLjU=
X-Received: by 2002:aca:af10:: with SMTP id y16mr1501636oie.120.1616037008216; 
 Wed, 17 Mar 2021 20:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <1615882129-14822-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1615882129-14822-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 Mar 2021 23:09:57 -0400
Message-ID: <CADnq5_Or=P-cfjRo2vMURnoay20SAhD_SKY8pvtCiK1J3b5+eg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove unnecessary conversion to bool
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 16, 2021 at 4:09 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c:721:65-70: WARNING:
> conversion to bool not needed here.
>
> ./drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c:1139:67-72: WARNING:
> conversion to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
> index 6e864b1..434d3c4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
> @@ -718,7 +718,7 @@ bool dpp3_program_blnd_lut(
>                 next_mode = LUT_RAM_B;
>
>         dpp3_power_on_blnd_lut(dpp_base, true);
> -       dpp3_configure_blnd_lut(dpp_base, next_mode == LUT_RAM_A ? true:false);
> +       dpp3_configure_blnd_lut(dpp_base, next_mode == LUT_RAM_A);
>
>         if (next_mode == LUT_RAM_A)
>                 dpp3_program_blnd_luta_settings(dpp_base, params);
> @@ -1136,7 +1136,7 @@ bool dpp3_program_shaper(
>         else
>                 next_mode = LUT_RAM_A;
>
> -       dpp3_configure_shaper_lut(dpp_base, next_mode == LUT_RAM_A ? true:false);
> +       dpp3_configure_shaper_lut(dpp_base, next_mode == LUT_RAM_A);
>
>         if (next_mode == LUT_RAM_A)
>                 dpp3_program_shaper_luta_settings(dpp_base, params);
> --
> 1.8.3.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

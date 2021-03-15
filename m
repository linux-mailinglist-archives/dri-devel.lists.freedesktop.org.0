Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DB033C590
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 19:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9BE89124;
	Mon, 15 Mar 2021 18:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DDC89003;
 Mon, 15 Mar 2021 18:27:31 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id w195so28806934oif.11;
 Mon, 15 Mar 2021 11:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YBq3gzSWM4PAYPU03bItAvmuL/jkDE66lmjkbZXjRp8=;
 b=an85zbY+atXgMmpRQQBVfLZXYZx7DbYuH6si3dsaJ4RZ750Mj6Pj9AV8KmzMw8NoBm
 c/6EqiaKL3RPUCd55n0wSCiRx68GVJECcqxYEexFcnhJ2QSIqSKjD/5zZAklkIHyRrd6
 zdb/qGWJL4AtNo0AkKQ4GSqDRNBV4m6edi9Z3YAYZm0v5zJgWW/B/eX7Dk574k4pxXNE
 Q2UPBuzzhaummRHcKdd/AI1MXXqogFcfZHpGxMw3pxfWNkCTb6LiLosFs79FAi/Wdnn0
 REWTqaTseDkF6WuhlPrDigCc9L4gB6Q8waiklbrWRchYn8lCd9/4iKfA04y1LUNKi+JF
 KnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YBq3gzSWM4PAYPU03bItAvmuL/jkDE66lmjkbZXjRp8=;
 b=iXDv6E8qIqbu/vyITPGWSJzUbnyU8Xw7HorbDeuJt5pwfklpOHXCAvfRLpWL8apyQG
 bR4S3mfLxHD1MnbEnQhYutsD76lSwQcPcKGONiFjIQjSdn9eU0CaTXBXaUHKMNLRpiMu
 5CB2qGlUzUOkl+8two9CpMDuV2XBCgIv0y1kvvsFGZPUvlDUmFGDcK/faaVNs+ko6bnB
 ZO8ASESoQwowW9882eAoei4edwT+nTdxGIRgWwGMO6OTBiNVacZgV48l1oomeTB4qG5P
 eNWL5CzNWzxnnai3SShYh2+hg7VhFsjw2ilbGgzIOzCAzD1jL2B6ROJzHAj9thr20qm2
 jrNg==
X-Gm-Message-State: AOAM532jU6Y+JUQPwRlCc/BB/zrGFxp2z3UVufKGONdQ+aSKgzLRCBAE
 dYz23JMwYWVidzn/WNyOOhPoVVrhebmSVFsTOatar8+Q
X-Google-Smtp-Source: ABdhPJzUvNXxxTNXCmAj+6pzsw62g0KyCooJD4yymr3eHweuglmQ2mI2iPUzEuPjQMKBqm+SAgUsJOzl+wwI9LYJLSU=
X-Received: by 2002:aca:af10:: with SMTP id y16mr331070oie.120.1615832850600; 
 Mon, 15 Mar 2021 11:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <1615796522-21363-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1615796522-21363-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Mar 2021 14:27:19 -0400
Message-ID: <CADnq5_MEqZZV1qRWzJM0PefBjCAnEDODzgrXn_8C3qzWqmZJYA@mail.gmail.com>
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

Applied.  Thanks!

Alex

On Mon, Mar 15, 2021 at 4:22 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c:358:69-74: WARNING:
> conversion to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> index 3e6f760..e153109 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> @@ -355,7 +355,7 @@ void mpc3_set_output_gamma(
>                 next_mode = LUT_RAM_A;
>
>         mpc3_power_on_ogam_lut(mpc, mpcc_id, true);
> -       mpc3_configure_ogam_lut(mpc, mpcc_id, next_mode == LUT_RAM_A ? true:false);
> +       mpc3_configure_ogam_lut(mpc, mpcc_id, next_mode == LUT_RAM_A);
>
>         if (next_mode == LUT_RAM_A)
>                 mpc3_program_luta(mpc, mpcc_id, params);
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

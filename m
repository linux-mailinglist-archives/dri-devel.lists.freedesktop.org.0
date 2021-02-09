Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 913233156F7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 20:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C376E0C5;
	Tue,  9 Feb 2021 19:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D886E0C5;
 Tue,  9 Feb 2021 19:41:17 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id i3so9818176oif.1;
 Tue, 09 Feb 2021 11:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DXoXX9t+fJ8x0y0o3oj+Ni+Q4UjyYGDDZmio3Vrqotk=;
 b=gC4VvFIYtHmzre1Gnuqb+O2KVzUhmSdr96r/12PS0RHwTh3y/Cl65SGWUwymg1dfSc
 0RILw3MlzO7nC82fJMVvzCTTaq4xATaZgPq81u1azvY6Ko0DD/2G6m4ncjBofq29X/at
 GzJBaxR7qdEJpGe1jG1hjZTbvAYG0DIhOfEnkjFDXhKlCendp9nSIglkzk2tMN1kKAlx
 o6Abxl6lLWSTwtigKbR8ZCdioVXVhLz8hxT/LAmyk6dt3qQnmgFuZwXRYJFfEM74aKxM
 tUilAcY3BPqv4h8a+Ok9O4w+RK6iewPK0epvVgRlgSCSkSwV5XmO59Ud0z5ZS8CJWh05
 tUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DXoXX9t+fJ8x0y0o3oj+Ni+Q4UjyYGDDZmio3Vrqotk=;
 b=MJpfRl5VWeCuOaobPwFQrxzU+5t6YKx/Px8lP0s/7qAyfJXQe/KaP/78dyMpbLYGed
 GpnO5uToLiWuPFBvh+NqSKGx+falxkEyTTVQmnPQCMmPTdRz9WcIhuQ+ReLAnkvkTRam
 e7yNYcWH61DTdJNFo4ZZXs/Kr5Syfcey2iYgGHMXpBvywPQAEEiRTpOmfjkw0SG80LEU
 PsJQ4Pcv3hf+Rk2xp0PQHXrMncgAvn5tofp1PjtDpoIEz36j85fJt75YWP2AvfcJJDS8
 0hScZUKbjp9Dhb6fGVEvI2QXtZFpW4Uc5BXGCMp3gN38RfdUD9sUELaOyBOpE+x9Xllw
 /Bzg==
X-Gm-Message-State: AOAM532lt94vja5312hu45uZUoeUNtILW76NI/X5xX4UFx3xeiZ0w/f4
 C3O0wnd9mYf8qjLp5icuGGp/TYUIyQU0+e2NZZ8=
X-Google-Smtp-Source: ABdhPJyi8YAv3Mr94sjJIKowedWyGeiZtBKiNpp2j7n3eofNp2+Ob1AqBzjl96BXSvyOAQ8g+Ay8MPEWa4Qc0NozfRM=
X-Received: by 2002:aca:c786:: with SMTP id x128mr3540978oif.120.1612899676846; 
 Tue, 09 Feb 2021 11:41:16 -0800 (PST)
MIME-Version: 1.0
References: <1612780168-83989-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1612780168-83989-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 Feb 2021 14:41:06 -0500
Message-ID: <CADnq5_PguFm7Qo2i1dqCAwLAWYhq68m-wdSx8B5LGUVmMbS3pw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Simplify bool comparison
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

On Mon, Feb 8, 2021 at 5:29 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warning:
>
> ./drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h:319:11-23:
> WARNING: Comparison to bool.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h
> index ffd3769..316301f 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h
> @@ -309,9 +309,9 @@ static inline bool should_set_clock(bool safe_to_lower, int calc_clk, int cur_cl
>  static inline bool should_update_pstate_support(bool safe_to_lower, bool calc_support, bool cur_support)
>  {
>         if (cur_support != calc_support) {
> -               if (calc_support == true && safe_to_lower)
> +               if (calc_support && safe_to_lower)
>                         return true;
> -               else if (calc_support == false && !safe_to_lower)
> +               else if (!calc_support && !safe_to_lower)
>                         return true;
>         }
>
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

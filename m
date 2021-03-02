Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C832A932
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 19:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2188C6E252;
	Tue,  2 Mar 2021 18:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369AC6E252;
 Tue,  2 Mar 2021 18:22:04 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id b8so20902119oti.7;
 Tue, 02 Mar 2021 10:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0V4NppJX6K9gT+Ur7cLKD7613ioC61Z7I5irbavVEYA=;
 b=qZefZTyNlgwXtOJORNJkek/yKCs0FmZ9ALgW1by4vpG5bJAQfZq3eomusKgQ8/z2mx
 8LD5RIo89t0oMYXgZKB/8fczTMZrkgHwPLF3nqN402fRBaDGwsxF1zBjtZhp0flog0+Z
 v7ggvwi5ltm0QKKv31ayWCzdiVMEvRFKNC+2i9CqyN3W/F1Nsz3eOTJ4mcTKXTKmIHh5
 t2gorb9E8bsOjMG2l5Tkgx++aJqiv0G2G/Er0RGhvKwYiXimecwOg4OvUfQRyPGqkFz9
 6n2QJI9sJKmejbKwoEK/iVCcv0xjIv2lcard5q/7OFPnKzSiPYiJ7wlbxxB7tO788EYF
 zZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0V4NppJX6K9gT+Ur7cLKD7613ioC61Z7I5irbavVEYA=;
 b=ff5poQAmTJGCCH0ZO14wTYJfmKo53Qos4uMW7rYTO8+gvzUDYKOnXt/2Yd7I4qeYlv
 9h0An5NsOq9yWDMyEDLdPrsw3C522vkPxpFKASH4508qsT4uaBKPFvinuOMls8MxSUbm
 z7dfqfYpQZWhxUC4ymWYtdquEBkWV4mk/FNDn1Qw77k6ZSm4m7on8LFB3St7WmLkzrKg
 IY9/IIl0HyFBosPb3yNTQQ/5YnfCr1KHjmtYAASMrqRZ4h3VZsapuTdNPMX5IGGo/wGX
 pK//EbQmNcRRUxtCbh6tCSZR4sCu4Q5npWZTo6i4RHjWdNeK6hC1terMsoWhvAeakFDM
 emhw==
X-Gm-Message-State: AOAM531NThXtVm53DIvTpM8tKIyLDzC6X6Ww0Qj0CRCrE5Lg6e9cFyzf
 Om7BFuH7L+jL9gv1rkzL2h7LSg39mmEWknE8dfk=
X-Google-Smtp-Source: ABdhPJw/O9H/z+8HtBNlXU2R7NoSuNGK2lWWhXxmL6qIo44ysXAjAd/0dli43h1o0mtYbmCSY7UnIUQZyTODGiJkNjg=
X-Received: by 2002:a05:6830:408f:: with SMTP id
 x15mr832415ott.132.1614709323593; 
 Tue, 02 Mar 2021 10:22:03 -0800 (PST)
MIME-Version: 1.0
References: <1614581387-14843-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1614581387-14843-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Mar 2021 13:21:52 -0500
Message-ID: <CADnq5_MvyeR83qQM8+jqkg63QxYkZeRG5jpA1w7p7+5n4mcD_A@mail.gmail.com>
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

On Mon, Mar 1, 2021 at 1:50 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c:298:33-38:
> WARNING: conversion to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
> index 3398540..fbefbba 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
> @@ -295,7 +295,7 @@ bool dpp3_program_gamcor_lut(
>         cm_helper_program_gamcor_xfer_func(dpp_base->ctx, params, &gam_regs);
>
>         dpp3_program_gammcor_lut(dpp_base, params->rgb_resulted, params->hw_points_num,
> -                       next_mode == LUT_RAM_A ? true:false);
> +                                next_mode == LUT_RAM_A);
>
>         //select Gamma LUT to use for next frame
>         REG_UPDATE(CM_GAMCOR_CONTROL, CM_GAMCOR_SELECT, next_mode == LUT_RAM_A ? 0:1);
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

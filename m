Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA50326971
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 22:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991726EE36;
	Fri, 26 Feb 2021 21:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA3B6EE38;
 Fri, 26 Feb 2021 21:28:46 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id 40so2038637otu.0;
 Fri, 26 Feb 2021 13:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k0FQBH3XZRWaOEVdA/TaIzgXzrKxsUm8rwjI33W19Xo=;
 b=ulH6diblgdIknIaJzStXLEnNMmRTYNNeQtO4iHIMd4VzYKb5VvExX8hjLev31N9TKm
 7H/jkB0x6hbwcbBHoYcj+/Q9g4aeNgiHROw/yuQFrUzLvsTFilnXVm5YgQM6psNjAYgE
 oam7aoCc/pErNv0iVJF9d/Z6X1POWJ08ASKMieRCrrhiTq0e6k2HtynAcQ7iHoOhKugh
 XqQaOXSVUt7poktCQ3v0GWLjvV45jNunoKYLPlyM8AUaj3LKwHeo7IKWw2EbzRXbETCg
 ikbgwbjMtnuVp7I+tZGMmXi4LmIJD27z2Egk4CZmfjdn/Mu38p1TXBs28Yrnqr9o5Gm3
 XpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0FQBH3XZRWaOEVdA/TaIzgXzrKxsUm8rwjI33W19Xo=;
 b=a5/+KCfESfBUsMpOhUGNjlC4izAaRAq+cjjFcTRfVuICfYJQHQjGiiCtOlqxoxHkN/
 NCc0AWEqHI08DSn9qcw4cXsXZgx2+R6SDr9ugZ/FAF6C8fv170ACYoohDk+8SRjoLAa5
 TQMiVs94d0yhVh0zqoZcoRM32VpBSGMIJ4DxxGPPi0Os0+xIUmBTxzurkNAzA6n/4Daa
 p4XlYYpc9n4bhoUJcxNEfxDrkN4v/zGCeqTmBrSP+gUJQ6SxV72EikoVwXFC4U1VmxY0
 yxqGbhI6qibOiWK4mndFs35Nta6Xcd2TsiZfUHSBa6p2NK7UL4g5IM4Qoau0buN7NSS2
 Tijg==
X-Gm-Message-State: AOAM532mefmvMjZU30l7HWYAEBe2qvJtNQnoOUi7MSVC/7JAQIlNCOtr
 8pOY7xgphB0JP15ZvIcauOG0194LdSh4LNO0jws=
X-Google-Smtp-Source: ABdhPJxeL1KhiiGw9G2A8daWBoi5NfRH+ResQd71t1cyA3TwtcRMdEOCybZypc2hTXvt/2T6PoxQ0GDGLIPgpa55rfg=
X-Received: by 2002:a9d:760a:: with SMTP id k10mr3929555otl.23.1614374925511; 
 Fri, 26 Feb 2021 13:28:45 -0800 (PST)
MIME-Version: 1.0
References: <1614331036-110338-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1614331036-110338-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 26 Feb 2021 16:28:34 -0500
Message-ID: <CADnq5_M7hfiHW8jOv+bAcQ9kVOY3EJibGLSUPW2eB3=aPBVLVA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm/swsmu: Remove unnecessary conversion to bool
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 26, 2021 at 4:17 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c:924:47-52:
> WARNING: conversion to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> index af73e14..2382438 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> @@ -921,7 +921,7 @@ static bool sienna_cichlid_is_support_fine_grained_dpm(struct smu_context *smu,
>         dpm_desc = &pptable->DpmDescriptor[clk_index];
>
>         /* 0 - Fine grained DPM, 1 - Discrete DPM */
> -       return dpm_desc->SnapToDiscrete == 0 ? true : false;
> +       return dpm_desc->SnapToDiscrete == 0;
>  }
>
>  static bool sienna_cichlid_is_od_feature_supported(struct smu_11_0_7_overdrive_table *od_table,
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

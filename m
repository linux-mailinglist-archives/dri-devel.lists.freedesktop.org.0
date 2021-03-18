Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07EB33FD93
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 04:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FDF6E088;
	Thu, 18 Mar 2021 03:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736E46E087;
 Thu, 18 Mar 2021 03:11:57 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id x135so866281oia.9;
 Wed, 17 Mar 2021 20:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jug9lt2096iTFzdoAmqpuHgFfgrRXiyduMJw3GtK8p8=;
 b=DrhRzLOcGsAX3P72JbSKtzPAMjwFFO1Y4Ab6lZPUyB8sFejZRzxyi0tSYQdSz6J1RR
 svsVqtyj9GenOvMFGO8nzfd/2CbxFBP+GtKL6/N1CuFxzwjA1MvgquXf3/AENPcBVtBa
 7DA43Fc5y0B2aVRIYCSpmUi11e+hwpAUpsy6XSJ0iMU1Q7wY/CBHS23D9BJsd6WeAItn
 QdG0ULYIQfEcCGzhzHHcxiX7s70ZR30dARQnEhYBYQa9ByHvWhQrR5VBBPGvCBqWA7Zd
 LHdrBsOh45ANhff14lf9TfeznHi0aRebEjfg6PLyx56t/XRT3foIb8aURhgIoq1ISI2x
 aVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jug9lt2096iTFzdoAmqpuHgFfgrRXiyduMJw3GtK8p8=;
 b=aKjQ+xUxoXsD+I/nmsf9DQRezDyIcK4snDqFHHcs4NQ7fXkvLTqubviAwnU1C4Ur5Y
 NiXDIzIbkqpt+dls4nDMn2CP5VRjD/XXQax0Y0CQZJ22zuAm7T465e9kAcx0A3cbankk
 eksYYEXSGZ1+MRFnjobcC0p+XNPx7rHhgmZHjQT3m/WMjo5wjUPMP4RP5pV6PgBFTB5g
 VyGRnYj+rFMexyfiZrROEnd805sj7L9NHhvdUVp55otppZz098DID++kJdFjoF0bKxdU
 ffB+JoX426QWxWTY9vftMwcvRl5Gst7VAcQsb/SpoyarJuqLMaQDJk/1frJP3TJZrrpq
 LblA==
X-Gm-Message-State: AOAM531iokGpKYQyJRnLqfVwPA9dmL5vr7BSQ+ntNpEPD25ivYTMp7Xh
 nI+/5kdTpHKOVMZ6SUx1xSy0i+xOzbaHfuh1mOA=
X-Google-Smtp-Source: ABdhPJzHuFKutJ2cmVAWC7ZqCumYXV3yTyCSCiUT12R+iMCXFfOdIbucig+gbaD6BaFQuznCzIDYFyBfUs9ktO+F3h4=
X-Received: by 2002:aca:4748:: with SMTP id u69mr1416178oia.5.1616037116859;
 Wed, 17 Mar 2021 20:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <1616035012-88614-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1616035012-88614-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 Mar 2021 23:11:45 -0400
Message-ID: <CADnq5_O+3EQHN8uw14HsPNm9rijveXd=W1Q+18sS_4cGNvA_3w@mail.gmail.com>
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

On Wed, Mar 17, 2021 at 10:37 PM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c:220:65-70:
> WARNING: conversion to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied.  Thanks.  In general, you can just roll up most these bool
conversion patches into larger patches; no need to fix them all one at
a time.

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c
> index 8593145..3fe9e41 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c
> @@ -217,7 +217,7 @@ static bool dwb3_program_ogam_lut(
>         else
>                 next_mode = LUT_RAM_A;
>
> -       dwb3_configure_ogam_lut(dwbc30, next_mode == LUT_RAM_A ? true : false);
> +       dwb3_configure_ogam_lut(dwbc30, next_mode == LUT_RAM_A);
>
>         if (next_mode == LUT_RAM_A)
>                 dwb3_program_ogam_luta_settings(dwbc30, params);
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

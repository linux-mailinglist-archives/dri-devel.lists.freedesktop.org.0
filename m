Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AADFA1797FA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 19:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E696EB5B;
	Wed,  4 Mar 2020 18:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C746EB5A;
 Wed,  4 Mar 2020 18:34:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x3so170859wmj.1;
 Wed, 04 Mar 2020 10:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8DRq31dVT2gcFH3XXRtqpgig/7H0t/mX4ebDUqxQJAM=;
 b=K2zkK61c2TNW7EUI2Xo/xumazBlU352yLQ8Je3IUqoaUeb9Fj5WXxGXfTelu0rxweA
 ObkurjlXbq7kKvzJnlUaYK6MV23HpRq6o1fADQJq2vWs3oshVhduVquYNUyMlbMYahbR
 PJNMcUIuLJjo0nH4eGvCiHgv9H88OuZBtXnHYx0c6QNe8ti5T6nUJumoJ+iaU1oYEtW/
 4XVPJyD7oyY/uIF7GI9fhE0iAysskUb+HW/wCTDhfvCkO9CtdEV+kJ3CdqWGoIK5RDyh
 H9wNzAlUkJ+wFWngJvKmHcfSdLHeWE2EDmbaKbD+6zLEyJl9mQmr7XeO58/PNZ/OR9Y9
 rjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8DRq31dVT2gcFH3XXRtqpgig/7H0t/mX4ebDUqxQJAM=;
 b=rv9OzcGJhuCXl+RXFAi5ebaCvYNAkMWECKWMRaWTbR1aZVefL3+I79ctLtSoq2vSb+
 sqD8dJkSB00bQgYLZTWhpQpMAGbF7ZQOgBwZHB/pnQJLDLoDhPkZfgMmf/10zEnQGV2U
 qHFbhg8tDba9vKgWuhwoLbStjEvoS9OuFM7aHxZ1eCjGAInq0Z/AgE0Cx2OWjJ5WxIM4
 6HnYYanUJ3CRRgF65xT3CJ3pyDDnBgUBw0EpwNdq1char3hdWiCSsW+ftxpPelSNP/DB
 S4csECIjJFIp5dHjS4eVYk0y+fUVZy8RszMowSrFuZ2x3KskndqCvxwHddD6yOnvrVD0
 0d+w==
X-Gm-Message-State: ANhLgQ0ClbLkRGFo7CjP6KzRSJOPXmwDYbWhe3Z8fj+/yan2l3cQj2v3
 orrn23QIL842Wa6J0ZdRPBNjEl0WNftrg8DXa2U=
X-Google-Smtp-Source: ADFU+vuqsD45qASCZnH8XxkPs5xXkVU9VR6SGpBNUzkMJaS9wuU7zXFDdGM4NqqOgbJGLMQvM56J9z4ljMWTDVqqPO4=
X-Received: by 2002:a05:600c:286:: with SMTP id 6mr4934184wmk.56.1583346897405; 
 Wed, 04 Mar 2020 10:34:57 -0800 (PST)
MIME-Version: 1.0
References: <20200302224217.22590-1-natechancellor@gmail.com>
In-Reply-To: <20200302224217.22590-1-natechancellor@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 Mar 2020 13:34:46 -0500
Message-ID: <CADnq5_Me3VGP=WfDuSfwC705b_XVENyn6q9SRU7=pXW-2xEdvg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove pointless NULL checks in
 dmub_psr_copy_settings
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 2, 2020 at 5:43 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:31: warning:
> address of 'pipe_ctx->plane_res' will always evaluate to 'true'
> [-Wpointer-bool-conversion]
>         if (!pipe_ctx || !&pipe_ctx->plane_res || !&pipe_ctx->stream_res)
>                          ~ ~~~~~~~~~~^~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:56: warning:
> address of 'pipe_ctx->stream_res' will always evaluate to 'true'
> [-Wpointer-bool-conversion]
>         if (!pipe_ctx || !&pipe_ctx->plane_res || !&pipe_ctx->stream_res)
>                                                   ~ ~~~~~~~~~~^~~~~~~~~~
> 2 warnings generated.
>
> As long as pipe_ctx is not NULL, the address of members in this struct
> cannot be NULL, which means these checks will always evaluate to false.
>
> Fixes: 4c1a1335dfe0 ("drm/amd/display: Driverside changes to support PSR in DMCUB")
> Link: https://github.com/ClangBuiltLinux/linux/issues/915
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Applied.  Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> index 2c932c29f1f9..a9e1c01e9d9b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> @@ -144,7 +144,7 @@ static bool dmub_psr_copy_settings(struct dmub_psr *dmub,
>                 }
>         }
>
> -       if (!pipe_ctx || !&pipe_ctx->plane_res || !&pipe_ctx->stream_res)
> +       if (!pipe_ctx)
>                 return false;
>
>         // First, set the psr version
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A985A164A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 18:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6F610E0FA;
	Thu, 25 Aug 2022 16:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FAB10E0FA;
 Thu, 25 Aug 2022 16:01:16 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-11d7a859b3aso14242292fac.4; 
 Thu, 25 Aug 2022 09:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=RFEbXp9j8ztzn5cw3OPjC4jXsY7xL35PN1g35X+7I4Y=;
 b=ZRxR/uF+SzZ8HHYwG6JXygFtqmhUYCqnImfzdss+e9H5X/1+Gq2wuyaHAwkKUzl9z0
 czXfEC1I6Z2k5he21+fKBp3CGytw6TnQbseFpV3PWN+bnCgGSztWfnr4jq1Rm5W3kLiT
 mrMRtOlZ0S2fbKUqReZ3Lb+rKbNfmsxPuLk9XWjhRdW3INOyjMNlMuccQ9L5oFSi7MV2
 kiIN/w807oVnrekP40R/fSiVUIj8YkY5yM1/NQd+orLnPh4PwbU6s3PN6VHQg0BSQMPc
 9TboOqIMr7dMbWmHGGfDT0rN0DeKFXwwD0DiAplin4oMLij5tUb3LLOVr8vAGHS87AD4
 vEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=RFEbXp9j8ztzn5cw3OPjC4jXsY7xL35PN1g35X+7I4Y=;
 b=mfZf5TakNK11eOhTydSefSGU7HHKL+4bNb+8nsuDJqGp3sH86DTJNqvvpFGFSuYABl
 zF3rBZRfxDfiuLl7XQ1cqikoaYDy5/H9YWZAN3DbTvfZ1VbJ/iF9lOb4PPtbetANCFis
 eBSfXkRXHtrvQKSp9e5kGzN2bYl8AU2wC8GJ+V6ul00v1SWQcSr6QExdt0Q5ndRa2XMw
 rAkUxkejzGDYN4FMVivJL5X5AViKHgCj90tZfBbFceH+kurfDzCClsD+2pLz0ynYRoPJ
 LBsLKLZz07//OOMHr02cTmu4a+xCden8eB70Y56HEMgLWFwhmOS1pPsIS3Y+L0/n4Jum
 d+Xw==
X-Gm-Message-State: ACgBeo1jle+k7uLI+MRyFlE6A9VGJqjWJ4vg9VBCNP8aVIDloWCxwBnt
 xNqvQdS9VNhhF/XCi+p5IrUDY3h46xjeLIooXPA=
X-Google-Smtp-Source: AA6agR5pTBtN+TEDkLbLrHdtSxKwurpwFad1aQD5kTena4GH/G1DjdDZtYCyJJ1W5pYrWkLgNH3oUhDWlaZQujmF8iU=
X-Received: by 2002:a05:6870:3484:b0:11e:4465:3d9b with SMTP id
 n4-20020a056870348400b0011e44653d9bmr703328oah.46.1661443275620; Thu, 25 Aug
 2022 09:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220823070047.20930-1-bernard@vivo.com>
In-Reply-To: <20220823070047.20930-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Aug 2022 12:01:04 -0400
Message-ID: <CADnq5_Ond9WHx46E=zK-j1V08LC_f+29_b0mybaqxwWweigDNw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: remove possible condition with no effect (if ==
 else)
To: Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Joshua Aberback <joshua.aberback@amd.com>, amd-gfx@lists.freedesktop.org,
 zhaojunkui2008@126.com, Leo Li <sunpeng.li@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, Samson Tam <Samson.Tam@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, Alex Hung <alex.hung@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Martin Leung <martin.leung@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Aug 23, 2022 at 3:01 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> This patch fix cocci warning:
> drivers/gpu/drm/amd/display/dc/core/dc.c:3335:2-4: WARNING:
> possible condition with no effect (if == else).
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index aeecca68dea7..2d4c44083d79 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -3332,13 +3332,8 @@ static void commit_planes_for_stream(struct dc *dc,
>                 /* Since phantom pipe programming is moved to post_unlock_program_front_end,
>                  * move the SubVP lock to after the phantom pipes have been setup
>                  */
> -               if (should_lock_all_pipes && dc->hwss.interdependent_update_lock) {
> -                       if (dc->hwss.subvp_pipe_control_lock)
> -                               dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
> -               } else {
> -                       if (dc->hwss.subvp_pipe_control_lock)
> -                               dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
> -               }
> +               if (dc->hwss.subvp_pipe_control_lock)
> +                       dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
>                 return;
>         }
>
> --
> 2.33.1
>

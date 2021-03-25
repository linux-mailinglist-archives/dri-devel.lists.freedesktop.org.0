Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 069A03496A6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 17:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0602C6EDB7;
	Thu, 25 Mar 2021 16:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91AE6EDB7;
 Thu, 25 Mar 2021 16:20:19 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so2475324ote.6; 
 Thu, 25 Mar 2021 09:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nKSvJqqCSOUWkfe9wp2hDPqZTk4vnfocDfcAMR4Vm+Q=;
 b=PJ+dIGwPBoDt8A8ZBrrIVeJ1YEjzTdCsvTzh9qCm2Er+JYs/6S4fW+prmrmciobLKv
 JODdSTqcuj4NC+Bj3Jh2+DdIr2Ya72cirr7niem9/ZaAHHUuxQJsZIBmfe2XOk4qn10Z
 Nz4lemvKSh4rbEjKfGvOagLFf6H1xTpfHVhRf7rXDYmPUPRcWYLWWTtW/a14CaZdhlw9
 4xVOFNIH06ZI1bl5jM0k7rGElTHs9BvkHbB4GDfuAot9Uod7icNjnpmFgAiJbxPtk0yD
 OHcbcQXVsPXYVvWh2jzM83t6Hih7NhkkF9OAf99TqAgylXh6hjVXJv4RMIAhHQAhP5Zd
 yfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nKSvJqqCSOUWkfe9wp2hDPqZTk4vnfocDfcAMR4Vm+Q=;
 b=T1UdOqMCfbVPfwjy0b2xv1eFU9hfx3fSAloy7xR4nc73Lat+Ga2AvAFfr5dzxJWrGE
 YnxGKcWjqZXXgbCJouVuZV8XSCwJUMD/vsLoTSy7o7ESFUOhsaKP4LludeqXYMX0CjRF
 pYuVXx1adutk0P9kFLCMvODjtFPRsVpgPFJRgOt/i4qdLyCe2iK5leto0HSw+Lsztqz2
 Xx+I65UmAAieiT64PvC9J/0uRqJvbI23/4gVyGBCJLbKg+aYEDBGMnY3mmpTRDhlyW+6
 pGg8ogldZv8t4imzEQ8gGhaGIEXYZt28k2Dbn7sNqy4lQJxKpJVYlVR/FGtcIlqi29vR
 atYA==
X-Gm-Message-State: AOAM530Q0SchUY1oSIWHWbfyLieqISMOH9QVSqyyqBs32ukOPwHiW8R6
 pKnFyJc91t9P9BAMJJKO6tkqhVaa7KpFI+HiIi0=
X-Google-Smtp-Source: ABdhPJyXwhh06sg9aV4xoHnYaSylDmhJiN65tLIbqli12fQ2hDikxnf4JYo1asQjFyT4k/QSfjw3wcvPaZdS1DaQQJY=
X-Received: by 2002:a9d:663:: with SMTP id 90mr6047157otn.311.1616689219092;
 Thu, 25 Mar 2021 09:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <1616577461-18556-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1616577461-18556-1-git-send-email-tiantao6@hisilicon.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Mar 2021 12:20:08 -0400
Message-ID: <CADnq5_Mp-v5nFwABkABOux8M8vO_G+6j9oA_uVG2KQsVNdRFUw@mail.gmail.com>
Subject: Re: [PATCH drm/amdgpu 0/2] Convert sysfs sprintf/snprintf family to
 sysfs_emit
To: Tian Tao <tiantao6@hisilicon.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Wed, Mar 24, 2021 at 5:17 AM Tian Tao <tiantao6@hisilicon.com> wrote:
>
> Use the generic sysfs_emit() function to take place of
> snprintf/scnprintf, to avoid buffer overrun.
>
> Tian Tao (2):
>   drm/amdgpu: Convert sysfs sprintf/snprintf family to sysfs_emit
>   drm/amd/pm: Convert sysfs sprintf/snprintf family to sysfs_emit
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  8 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  |  6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c      |  8 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 32 +++++-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c     |  4 +-
>  drivers/gpu/drm/amd/amdgpu/df_v3_6.c         |  2 +-
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c           | 88 ++++++++++++++--------------
>  9 files changed, 73 insertions(+), 79 deletions(-)
>
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

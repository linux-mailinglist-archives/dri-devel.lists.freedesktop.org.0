Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB690402D6E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 19:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6EE6E075;
	Tue,  7 Sep 2021 17:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0B26E075;
 Tue,  7 Sep 2021 17:06:08 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id 6so13614588oiy.8;
 Tue, 07 Sep 2021 10:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LvLnME+IjjXBdlapd7qwu3ckCRmUspxnvArgV5vhrZs=;
 b=p7bvjkWXysVTS4dKlzkBHNI0Mh2Ex6LJErKRsDYC6PVaIdcwIhfzGMNcrVeAvjcB2N
 lPjSwJBCVFki7J736XxBScmH+iYS31DmnOhzzHcq+Yrql2ayrSwZprAv3+CImVQSQVCQ
 psPhSwmoRy0mL7JL4baFLy0N5j4thDzc/tRP2ooL7dF7FFtRCVI4fGbNjrKgzP29Nwal
 BTpKD44nZRaJRiNT6o/tqQzfFxbUi1TKdMNL/cj5LpMvVNKwKK4+UCmfO/FU9Fa3Z22n
 GYhUyvfOQim9/RaYGbZsfFOElPt2QDnQVQkkHEaJJzLSTqlgovAAl4l0CJaGhCJio3D9
 R8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LvLnME+IjjXBdlapd7qwu3ckCRmUspxnvArgV5vhrZs=;
 b=Te/M2OenNYQAyBmE3b8KtiK08eyOJvXJBFpLRKORvqfGvXsQV/0d9QsYKXOUnAyX4V
 z2wnC66/N/6htL+pnPhj6tcSixK+Ry6IjEh3eyHENNhTX7sYoA1QjFutO4E8eTrBgMd9
 Zu/5INdqnqOQs8PXs6linBNtYK84Jx10kFw1BAhz6OGuEO/4Tuqe++MKmgpHBtePWAsQ
 TadyNwt61M29lhWFsXcbAWLb4SJJ16/0fRf1jt1tR6HVsKTWQx2iSCI9rN4TXnvCmiS1
 KcrBwl4Zs32WnWqhHZgkdMO3FVc5LZhQcRoodwax87x4pFwPfbRbsmAyt2txov2B1jm/
 8JoA==
X-Gm-Message-State: AOAM532jLFggfVW7hvT2X8C1rxc8GZVjNe3wokbRQaMK3gpq+vHT+Vrt
 qQMwSSdDGRrfL7nZXUKzOHHWmfh1+q+BpGZlsfg=
X-Google-Smtp-Source: ABdhPJx3mbR9TZRmahMq3/ZF7VUfLVN5NKyz2LJ9Td2mGx+cyp97pCLl0NghVieRW05ckB4pOBB81dxwCcF4itvsl08=
X-Received: by 2002:a05:6808:483:: with SMTP id z3mr3622068oid.5.1631034367521; 
 Tue, 07 Sep 2021 10:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210907110913.15499-1-colin.king@canonical.com>
In-Reply-To: <20210907110913.15499-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Sep 2021 13:05:56 -0400
Message-ID: <CADnq5_PsA5KsH5D2=-GKLgq2HQ-_5x=-0SJF3htvKEzK5cKVYQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/ci_dpm: Remove redundant initialization of
 variables hi_sidd, lo_sidd
To: Colin King <colin.king@canonical.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 xinhui pan <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Sep 7, 2021 at 7:09 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variables hi_sidd and lo_sidd are being initialized with a values
> that are never read, they are being updated later on. The assignments
> are redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/radeon/ci_dpm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
> index f0cfb58da467..ac006bed4743 100644
> --- a/drivers/gpu/drm/radeon/ci_dpm.c
> +++ b/drivers/gpu/drm/radeon/ci_dpm.c
> @@ -390,8 +390,7 @@ static int ci_min_max_v_gnbl_pm_lid_from_bapm_vddc(struct radeon_device *rdev)
>  static int ci_populate_bapm_vddc_base_leakage_sidd(struct radeon_device *rdev)
>  {
>         struct ci_power_info *pi = ci_get_pi(rdev);
> -       u16 hi_sidd = pi->smc_powertune_table.BapmVddCBaseLeakageHiSidd;
> -       u16 lo_sidd = pi->smc_powertune_table.BapmVddCBaseLeakageLoSidd;
> +       u16 hi_sidd, lo_sidd;
>         struct radeon_cac_tdp_table *cac_tdp_table =
>                 rdev->pm.dpm.dyn_state.cac_tdp_table;
>
> --
> 2.32.0
>

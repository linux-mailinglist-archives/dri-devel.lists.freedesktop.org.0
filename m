Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB8123D18E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 22:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3059B6E837;
	Wed,  5 Aug 2020 20:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FDD6E837;
 Wed,  5 Aug 2020 20:02:37 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d190so6872710wmd.4;
 Wed, 05 Aug 2020 13:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qqgHHRDh2vam44aFxeq1w53pSFB4MdPrZe7uyWVRU6U=;
 b=Ob7LksjGa0aZs2m01xbQZdVjIWBzhBxbIOyXY5wpaHYumy35R2/Jv8jZWVZ++3BKf2
 hbZouCFEhcSFaNgLZEmqKDJiNxTgD46KyhqMEqUalUOcuI/8iBBDsNAv1f9LSypu0+HV
 O5/kvAwENGSK9+4OBYUEi9pLhLYQ0QVhqVkttLF2wuXk3TwpFIuZ1RFcQmG2dmQChgMB
 qFhISD8aO0poYqPAWIRk5VRv6b66jvSXJ45koP/z4TFift2V9l8c+AVQB5+565M9vO28
 9y80Te71+/12ch6t06IdmFVUxwMpFcBb8lsDqFnnOvZ9bRjpwR4fZQ8009W3GfRiK/z6
 BHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qqgHHRDh2vam44aFxeq1w53pSFB4MdPrZe7uyWVRU6U=;
 b=PngGusYqWjEV6dzGeuzoiqxbbzs6aEeD2WU3jglVOW2Do2VgwQFCe98j77XPSp47PB
 uPCEFKjVcCTMYSqe3xtS5SKK+4soYVEQOtRsRJALy3uNB78N/3EkzE2a2BjXGdQqUvpI
 Oqdqk15v62D7x/XnjDmW67kOmiz4debExkkNJ49g1OePgo+ilMmtusXp5l2SIC5j+r0/
 4GqVXfWua/AsmAW5J1FloynZKedWaI9/YKWHPkGDngldQw9IEB7wOvU0aUU5YvTPIof0
 KNeR58BlhqOdcS/yv8IdUehe9vxu8OBGaU3OsIqZMn9gJ/VtQy6INH3Kz32vD6uaCYja
 WWPA==
X-Gm-Message-State: AOAM530WobswVWrQ/ANV65Z7KLPJxOt05nU62EYEjT2LB/a78/fwBtxr
 +96hJoa6hUmjkC+idgsZFAVXWCkHGA5XNrPV9ao=
X-Google-Smtp-Source: ABdhPJz8P1i0SoHVl3LdWEDNvULJHbQrR0s6lAMUuSfOi8apEVNdiVwkn2blV5Qoc4Yy6j5Bas5Un5bqPKqZ9LY5RrY=
X-Received: by 2002:a1c:f70a:: with SMTP id v10mr4648351wmh.39.1596657756225; 
 Wed, 05 Aug 2020 13:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200805121527.19157-1-colin.king@canonical.com>
In-Reply-To: <20200805121527.19157-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 5 Aug 2020 16:02:25 -0400
Message-ID: <CADnq5_OCQGCEwXN8=74AJck=ctAhbRp_0Hvb1B1hyqA_+3N0ZQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: fix spelling mistake "paramter" ->
 "parameter"
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 5, 2020 at 8:15 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a dev_warn message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index b72aeeb0a226..16e23f053361 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1201,7 +1201,7 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
>
>         if (amdgpu_num_kcq > 8 || amdgpu_num_kcq < 0) {
>                 amdgpu_num_kcq = 8;
> -               dev_warn(adev->dev, "set kernel compute queue number to 8 due to invalid paramter provided by user\n");
> +               dev_warn(adev->dev, "set kernel compute queue number to 8 due to invalid parameter provided by user\n");
>         }
>
>         return 0;
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

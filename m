Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D251119B53A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 20:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F797898C2;
	Wed,  1 Apr 2020 18:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D497E89823;
 Wed,  1 Apr 2020 18:16:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id i19so830726wmb.0;
 Wed, 01 Apr 2020 11:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BBfUFSmU8zvUnDHqRC5Mz8a2y8QFA/TqUJ1aNUh3AOs=;
 b=XDN9Lw4VT7+8iCHmEh0XU2gv3/ozIxXfd+MR1/SDI305t46ys2PDgbzeKaBYcN4rUk
 fRrkEy0muuSv0VEPcm0VyLhjBG2AB0mvGWxTxfEyW0NlFxvNz575aMEYM6cKDJ2FqHqb
 kP/0EUngflH4WTqE/GHfWBgC7rHFPCseoKaul+RgXxXJYJG7+rIG5sXnFgda1UG5ET3y
 t0yJSCysR6ZF+CoK2kcYjyBY0g7PoJyn+RdSDLKWGxTNQ8c01mqmEiTizuZ1KCGcnv3L
 WvwQZdgHQSN/k0mRsfbAWtvjsLisbSvGKeuexz1hs27OUFNlgHL6anKL9r/65zvHLWh7
 2QZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BBfUFSmU8zvUnDHqRC5Mz8a2y8QFA/TqUJ1aNUh3AOs=;
 b=tvpvJk4ykeCWXy2m6jYFp7wZjV6zqX0wOVYojxkYSIYhgv3e3U5FIw6GiiMbHLg4sg
 0C4MjHUwVGPpRVOgzJyoxTIHl5toksGro3EY+D2ksHvhHMj42FT1jphneRuD8YzEUdzf
 vJXrvGXSGhTsRsQlnQNT1RGKnqRAWQjShbOoU8hgaQc+AfdN4d0Oo3fGejR2PS22oDge
 ecWBul1Pdxm0mR6kkapamT7o67Iiq1eTbLEXimB4ZPCcar3ChBZ+n5vn+kWVbXP0IC0u
 4m40HuZchCLyrMqQ5RRujs3QzlSVj+8IW0rbSqY4hRG5g32SZVOsEpUCRjNsGqLtEZx0
 rgCw==
X-Gm-Message-State: AGi0PuaPuASUQhC+t9TyuRs9lq9SNHLxcQJqKyGZvn3raDf6aqS1TPQe
 erRIMC65VID7XjcSHJG+KLL5oXSs8SrXwEuMQBk=
X-Google-Smtp-Source: APiQypJ7+9mjMttUBHn6NWR20sM60GQuCanYIuty4mLmSFnz8TD2ROhWoUQ+0V8GY/ltD/73QWIeNZwVmN+k4F1tII4=
X-Received: by 2002:a1c:2842:: with SMTP id o63mr5497490wmo.73.1585764994404; 
 Wed, 01 Apr 2020 11:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200401163545.263372-1-colin.king@canonical.com>
In-Reply-To: <20200401163545.263372-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 1 Apr 2020 14:16:22 -0400
Message-ID: <CADnq5_OZ2Wfqpby69aTXy1OCE25ncMNZ=PqZh=jN7gX1s1h2ew@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu/vcn: fix spelling mistake "fimware" ->
 "firmware"
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 1, 2020 at 12:35 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a dev_err error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 328b6ceb80de..d653a18dcbc3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -187,7 +187,7 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>                                 PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM, &adev->vcn.inst[i].fw_shared_bo,
>                                 &adev->vcn.inst[i].fw_shared_gpu_addr, &adev->vcn.inst[i].fw_shared_cpu_addr);
>                 if (r) {
> -                       dev_err(adev->dev, "VCN %d (%d) failed to allocate fimware shared bo\n", i, r);
> +                       dev_err(adev->dev, "VCN %d (%d) failed to allocate firmware shared bo\n", i, r);
>                         return r;
>                 }
>         }
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8852473635
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 21:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89E789875;
	Mon, 13 Dec 2021 20:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBE58981B;
 Mon, 13 Dec 2021 20:42:14 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id t23so24794599oiw.3;
 Mon, 13 Dec 2021 12:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/0lgHFxH4NOvcyQo5yJWjY3w7PbD1WWXM/YVPa8itvI=;
 b=hU2DJJQ8muOc8zcpqpBRVpXnn9pX7veM6RJmq6sTZk3OkIUkaCMN4tz9FkyjvNJY5d
 1TFPF8+NZIY8Z4fqijcBpoBPUkhUQZqCwz6bTDyMfRicZY64bN6cdWpX6qE+M10kNaOS
 zfR8ymbPwhPQL67MPAImKFbyoHVy3Ig1Ut+H7J/cYJO+FOXmXA86OQrpfruPAIrmt93D
 4SiioiPz8k3Qx8AtQsavZAtV+EBZHUeZWxwDnQ8KHX0w94NilEb0skLdXc4gmwOVEYTV
 MOc9P+qtjzKdZ/SAKSgV8rmzsFLX3NiXliPBjNsvrwpFEUj+D5yjyyoq2pflLQz3aluq
 6oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/0lgHFxH4NOvcyQo5yJWjY3w7PbD1WWXM/YVPa8itvI=;
 b=Ja9ODwCY6sxT0zxqw7aIboO0qXdHNEcysA+21JCrPddS/t5lkSDJCOONWYVUhDFAsu
 Mp4vy3xiQPGTM86QEHAPuqeWCrREDqb+gupERRy30bbGWzrlVdS90HJBI93NOCqTd9Wa
 pVdZkBnDSnXkratw8phy3PMhBjl/9e9XmBfZyunjs8aajtVK4bn863Rme2XjIauAISB5
 i87M8FizDrBqsMjsfz5y3hw4Nvhxs2a+DT+trc+7059Dyd6eGCA9XTsSjbn/oR06XVtz
 q+atEsTId9UgStdkIpg6zILTthmRqQx041K1Ce0K9mF3RKVYKSa3UvKQTS2XOEURdB+c
 9kqg==
X-Gm-Message-State: AOAM530SdrWAu/b2FqKlOZ4tMoiNXkSiL776gXRDgmKl/OV0rZ9Fucpx
 KyTYXaU1bqJ0kYW6r0PXw0kAOJkFdgUn5pIV5uQ=
X-Google-Smtp-Source: ABdhPJzZ2ZJAiOrS7pArtgR2E9oKMmLyx7zGubLBF4xGRfAZAMwS15L9gA7Fwyg5UniIYDY9at3fYU8/wzYqStG2A2s=
X-Received: by 2002:a05:6808:68f:: with SMTP id
 k15mr28482046oig.5.1639428133344; 
 Mon, 13 Dec 2021 12:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20211209015823.409947-1-chi.minghao@zte.com.cn>
In-Reply-To: <20211209015823.409947-1-chi.minghao@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Dec 2021 15:42:02 -0500
Message-ID: <CADnq5_MEf3o6GVEkD5gQYgp4CMwogm=mVZFLquUEbRfjp3wh6Q@mail.gmail.com>
Subject: Re: [PATCH] drm:amdgpu:remove unneeded variable
To: CGEL <cgel.zte@gmail.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Zeal Robot <zealci@zte.com.cm>, Oak Zeng <Oak.Zeng@amd.com>,
 xinhui pan <Xinhui.Pan@amd.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, chi.minghao@zte.com.cn, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 John Clements <john.clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Dec 9, 2021 at 11:56 AM <cgel.zte@gmail.com> wrote:
>
> From: chiminghao <chi.minghao@zte.com.cn>
>
> return value form directly instead of
> taking this in another redundant variable.
>
> Reported-by: Zeal Robot <zealci@zte.com.cm>
> Signed-off-by: chiminghao <chi.minghao@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.c | 5 +----
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c     | 6 ++----
>  2 files changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.c
> index 5cf142e849bb..fb92f827eeb7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.c
> @@ -37,12 +37,9 @@
>  long amdgpu_kms_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
>         unsigned int nr = DRM_IOCTL_NR(cmd);
> -       int ret;
>
>         if (nr < DRM_COMMAND_BASE)
>                 return drm_compat_ioctl(filp, cmd, arg);
>
> -       ret = amdgpu_drm_ioctl(filp, cmd, arg);
> -
> -       return ret;
> +       return amdgpu_drm_ioctl(filp, cmd, arg);
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index cb82404df534..269a7b04b7e7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -1742,7 +1742,7 @@ static int gmc_v9_0_hw_init(void *handle)
>  {
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>         bool value;
> -       int r, i;
> +       int i;
>
>         /* The sequence of these two function calls matters.*/
>         gmc_v9_0_init_golden_registers(adev);
> @@ -1777,9 +1777,7 @@ static int gmc_v9_0_hw_init(void *handle)
>         if (adev->umc.funcs && adev->umc.funcs->init_registers)
>                 adev->umc.funcs->init_registers(adev);
>
> -       r = gmc_v9_0_gart_enable(adev);
> -
> -       return r;
> +       return gmc_v9_0_gart_enable(adev);
>  }
>
>  /**
> --
> 2.25.1
>

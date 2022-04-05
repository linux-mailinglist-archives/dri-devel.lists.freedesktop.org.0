Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7192C4F33DD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 15:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DCB10E8FB;
	Tue,  5 Apr 2022 13:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CDD10E8F8;
 Tue,  5 Apr 2022 13:23:49 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-d6ca46da48so14311878fac.12; 
 Tue, 05 Apr 2022 06:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ScfzVYhoR0LHfyaru7LJ12VrLihpLGnKs+dyoaqZBU=;
 b=bwM7MQ2CaERMuk5JUO51JviRs0GLe4rNKdBujPdlUJBzMHbt83Xm1/BfCx2S/bGpkt
 YAi4FwH9eRFr2dxMt51ZgG7+C31WBhBvTjqU00QRQBbH1NDRlVYSh6TmLsSrrJCiDjkp
 Mw34VPzQNst68DPRw25PP5suiV8z1xnnYlAQA0ZwO7U1/TEZ5jGaoUeG4pC5keRlIxYo
 +/n31B07cpDqvUTsSLHD23wv93GjPx0EqFEwA04V5LEVy7aFc+l7KRDV7XkQtwUs77wD
 yEvxY1cgO1wvyAD4uNRkIBQIDpML2g8ayWb9E1WxSFQJ1NF2wtJYumNNgb5/GIwu8kLy
 SuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ScfzVYhoR0LHfyaru7LJ12VrLihpLGnKs+dyoaqZBU=;
 b=x+QDaTzzkmixcAiBjwcWtuzNyLpvplKHepXFk9+me6jXrkCE5D0YYBHLCjS/QcbWjE
 ibNiw9Qj9c7eUxBk73Fu9Blwy2PhF0W8zAG5uL/TdbaIztJDArPv9AaLS0oI5VkJDyoP
 yp+JcW0Y6ES39kExtz5NyNlH1M0rE3KIaLEr0VnqlycYg5C4twNhSIwYaF0qBdjuo+Yw
 WV4W4EB7dFL1j0Ra3zAeiWZSabi5P3/anrYNP1eXQKDYGiIbgkchY0u0zGtBl14VUQXV
 v2ty6DWVmmm6XHCIBb2qeh2u2Kg693gSxzC365wzXmblkREsaEDct4xNXnyjqIpKZIFk
 zowQ==
X-Gm-Message-State: AOAM530CjfMsW78p7wEmQ54U2dIyiNurYz/aidPQ5GJE2ufhQ3I+a1fN
 3pF00kQ7lDycfd25kS1hFUszjYlPhV9zci3VSBe7ZGt7
X-Google-Smtp-Source: ABdhPJxsuNcRKCVnvwc6SiCT2E01/8qtrsJ9bRYQ6b3xCmhFmyTyi6bLE+dqO1fRo6Uwjo4tbwo9zjJTJQl8jycO/hg=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr1416658oaa.200.1649165029203; Tue, 05
 Apr 2022 06:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220401025930.16365-1-guozhengkui@vivo.com>
In-Reply-To: <20220401025930.16365-1-guozhengkui@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Apr 2022 09:23:38 -0400
Message-ID: <CADnq5_O5K60qP5Khgz7Ja+5yiHHt=juBNBj5o=+AK5CJwyjRRA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: simplify if-if to if-else
To: Guo Zhengkui <guozhengkui@vivo.com>
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
Cc: David Airlie <airlied@linux.ie>, zhengkui_guo@outlook.com, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Mar 31, 2022 at 11:00 PM Guo Zhengkui <guozhengkui@vivo.com> wrote:
>
> Replace `if (!ret)` with `else` for simplification.
>
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
> ---
>  drivers/gpu/drm/radeon/radeon_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
> index c67b6ddb29a4..e765abcb3b01 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -1629,7 +1629,7 @@ int radeon_pm_late_init(struct radeon_device *rdev)
>                         ret = device_create_file(rdev->dev, &dev_attr_power_method);
>                         if (ret)
>                                 DRM_ERROR("failed to create device file for power method\n");
> -                       if (!ret)
> +                       else
>                                 rdev->pm.sysfs_initialized = true;
>                 }
>         }
> --
> 2.20.1
>

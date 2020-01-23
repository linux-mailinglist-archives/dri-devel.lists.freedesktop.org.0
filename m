Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E2A147340
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 22:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D586FE74;
	Thu, 23 Jan 2020 21:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFCB6FE74;
 Thu, 23 Jan 2020 21:39:11 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d16so4865421wre.10;
 Thu, 23 Jan 2020 13:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YcgCOt08ESne+tYHU6zwz+Uk0GGpvUG34jW5hND2KP8=;
 b=q0KRmVU2sUjnBvb4qvh2OEJINZpXn9noQIvxIE69SLeV/GEO/eu1lzkAlV/+zuW6wB
 wpiBZQyCrtBKdMJ5QWE6RhC3Fh6nPl3vXmESKni5iyNkfF1PaVFBTNpAg86lcjSaWh69
 mdbNe4Zs1rBH2AANOpEnTbwQCcgFGfAJ4tFW4LoG4EorFH9340W2ImqDS7E433CvOfYc
 /1s+k3mc8znMZ6jQNoHtmUxBV+FDlES4Rotwrqz6/wtJdw0naYJlpdU/tpkz8Us7noyw
 MSsus3NVQuh/jbqDN6HF4IfSBN2QiVokCpm89hhpgrmA/5dmsDw13hB42R1EemZQwUdW
 P+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YcgCOt08ESne+tYHU6zwz+Uk0GGpvUG34jW5hND2KP8=;
 b=gxn30qfDv+CoTe8Q9XJF2j2PM0CL3M43QDrDrumSXdUbt8z2qtf/4q2/aZxoQv8Cxb
 ihf36Tew0+xSDZV8B4AZcUEc+LWgNh+mdyq6oFNczT2ufv81Mdto9lWgalIUcvYg1Lqs
 xAEJhgbyttjoi2vyPX4z5rvK5R3oo/V7A+/ZWvJXfOv+/+OGbatqf+3MpEBVSiNwDNl5
 dygb/RWovZXi7YZ7qPhCwOrHxHX0a+YEM+xxw2H7bKpobi8R+CTATfb40XCR1hHjzg2v
 RKyqx0ZwtUqYQkPlPbbs+fLSg+HGL3WLkCvMa+QzGHo9b/0NeU7RFIp23sxdk6C56301
 EOXg==
X-Gm-Message-State: APjAAAVsUt6dZoCXc4r3ACFFVho17ZhBGslRn77wJOcrP0gJx4ueyhSS
 Zf3PwmFVn+Px+a6IAJj7duF11iaqWqV7feoM8Ekwvw==
X-Google-Smtp-Source: APXvYqwyoTgYy4ctf0PLUzPnRY8IPNUxXoBdOgVGKMbrmgEQQz7/8JgA9GdcqM2NRA60zyf9FJXevk5qAuK+53xj0IE=
X-Received: by 2002:a5d:5491:: with SMTP id h17mr106054wrv.374.1579815550332; 
 Thu, 23 Jan 2020 13:39:10 -0800 (PST)
MIME-Version: 1.0
References: <20200123002216.2832146-1-colin.king@canonical.com>
In-Reply-To: <20200123002216.2832146-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 Jan 2020 16:38:57 -0500
Message-ID: <CADnq5_PxfM2i0BxpKtOUeL2+hxLUbwocyWNmd9qzXnOesJfuWg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: fix spelling mistake "to" -> "too"
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
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 22, 2020 at 7:22 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a DRM_ERROR message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index ceb0dbf685f1..59ddba137946 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -652,7 +652,7 @@ static int amdgpu_vce_cs_reloc(struct amdgpu_cs_parser *p, uint32_t ib_idx,
>
>         if ((addr + (uint64_t)size) >
>             (mapping->last + 1) * AMDGPU_GPU_PAGE_SIZE) {
> -               DRM_ERROR("BO to small for addr 0x%010Lx %d %d\n",
> +               DRM_ERROR("BO too small for addr 0x%010Lx %d %d\n",
>                           addr, lo, hi);
>                 return -EINVAL;
>         }
> --
> 2.24.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

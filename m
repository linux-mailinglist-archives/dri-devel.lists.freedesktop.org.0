Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0575F0E18
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 16:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E9610ED3F;
	Fri, 30 Sep 2022 14:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C2210ED2D;
 Fri, 30 Sep 2022 14:53:37 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id w13so4959728oiw.8;
 Fri, 30 Sep 2022 07:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=A87k8WDg0ONqkh4Zud4QDSem4Mlz6bv/9WZlMY4L08E=;
 b=qRXRJDH8/RGWLLBew3/BOPeKItpzuzLS954gUBGGISRKeh8cImELLpSOFmL6MRBhik
 YRxWaEcFxwq0CUu6Q2AdvMDZwbU6r7Jvo4efP01+46/xKQn2IScGuBwsdFlOGtlag1FK
 tvwjRiWYw5MOIpLlqmMPjjLerRQC7hu9Fcx6s0Gj7TKMi1fGzWLLgzJITyRYMlAREVIj
 pXETqA70nDm09lPpA4NfAS3ONX5WU28swbQp0DoWzT+Jp1xzWY8y2T9NeLMatgZbCn8q
 /QIzt9i73ofp22+QdqSf+6xe5nL2dFDsbMxDpZXobsQtgnXUEFZzqvAgnHUup2pISx4D
 XDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=A87k8WDg0ONqkh4Zud4QDSem4Mlz6bv/9WZlMY4L08E=;
 b=OB4fOt4/Otb4jDy5XPFhxiib+CkgMokwmV8alKWCBFnfHyUNU5GzVWe+Y8YB6R9bhI
 fV2vOdUmuhR+UeFQ0ptKGQaaNe/lLroJrk6/M8FbXHhWlJTRXBeYC4yyKhLc+C4ZleS9
 1Y0uQ+N+LCKZj2P92kWadR0Sa/qSkT0A/46SZyJ5tfQ+WwO9L+m7DNq9xGdBoC7/ucPh
 Xg37yIHOdijUEeR264wWbEdobwWw4tMChnbjqj5ZZDMEuIs7KY77a9NnPqRhXPSDkfhT
 fR+KqvuXJkqa5us+FTUKkaeIkDZPFC3QldtdZOT2+OFZ/jw9izEkq/3+DYJ7U4SWyc3R
 EScQ==
X-Gm-Message-State: ACrzQf05p0gAVIjshik/jT7/1ddpW+DhkFoqYyEZeKG0W+GkEETj8cLg
 P4PLR7BPhO3JHIdtsq+frDtPRS+rEuPkpLKa+O5D0NiK
X-Google-Smtp-Source: AMsMyM6bh/cW8dszboRbbJ2SL2c5L0ySp/GiIMmhTe21AkhtUCYwcxBtZSVItCT3oP9ZxBLAY1TrsqmyezJOJQpdY74=
X-Received: by 2002:a05:6808:2194:b0:350:cb3d:ecd2 with SMTP id
 be20-20020a056808219400b00350cb3decd2mr9938241oib.46.1664549616325; Fri, 30
 Sep 2022 07:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220929142015.746674-1-yangyingliang@huawei.com>
In-Reply-To: <20220929142015.746674-1-yangyingliang@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 Sep 2022 10:53:24 -0400
Message-ID: <CADnq5_M6MtPxu1qsYE_biDXXTshe9Ur65s5Hd4jQAjqhd-q_0w@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu/sdma: add missing release_firmware() in
 amdgpu_sdma_init_microcode()
To: Yang Yingliang <yangyingliang@huawei.com>
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
Cc: alexander.deucher@amd.com, Likun.Gao@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks.

On Thu, Sep 29, 2022 at 10:04 AM Yang Yingliang
<yangyingliang@huawei.com> wrote:
>
> In some error path in amdgpu_sdma_init_microcode(), release_firmware() is
> not called, the memory allocated in request_firmware() will be leaked,
> calling amdgpu_sdma_destroy_inst_ctx() which calls release_firmware() to
> avoid memory leak.
>
> Fixes: 60704abdddd9 ("drm/amdgpu: add function to init SDMA microcode")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> index 3949b7e3907f..43cf8632cc1a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> @@ -222,8 +222,10 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
>                 adev->sdma.instance[instance].fw->data;
>         version_major = le16_to_cpu(header->header_version_major);
>
> -       if ((duplicate && instance) || (!duplicate && version_major > 1))
> -               return -EINVAL;
> +       if ((duplicate && instance) || (!duplicate && version_major > 1)) {
> +               err = -EINVAL;
> +               goto out;
> +       }
>
>         err = amdgpu_sdma_init_inst_ctx(&adev->sdma.instance[instance]);
>         if (err)
> @@ -272,7 +274,7 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
>                                 ALIGN(le32_to_cpu(sdma_hdr->ctl_ucode_size_bytes), PAGE_SIZE);
>                         break;
>                 default:
> -                       return -EINVAL;
> +                       err = -EINVAL;
>                 }
>         }
>
> --
> 2.25.1
>

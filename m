Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D23A62F3BE1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 22:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7449889B96;
	Tue, 12 Jan 2021 21:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B85D89B96
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 21:38:58 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id n26so86637eju.6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 13:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K2g/lofkLNpYAo5R4xKAIFFNdcfKgqHN3EJid5jfeOI=;
 b=Q3m23Md2P0kVau3JbdVmFjFjRrl2ihFft0IEyxqChzaRUqfgWuME4iJ5v+DRczHgP0
 qSj54nFplVMjCwpGrHKkCQqTfBkgpaQoR2NwDghgapfwV2N+KdbS35XO1Rz1hNsEkJhW
 NmYVw4yiIWt4ilrRZPPhVYtspREAfqS5lEo62Yqw3zujhs8yFH2OtXiwhwZS1htZD5u2
 X7NAi9RIAUT1npu+Zq6jifiyNttm/96BNZZPJnfw4qTHprIxkZZ6O9WKJ3OplDhhoQa3
 /DkSL5bTPUwDC+UoR/TvdVmVjfBqLv+0wpsXpna7PQ4/daXmm67Z6q60oJmCuFYmA/l0
 thWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K2g/lofkLNpYAo5R4xKAIFFNdcfKgqHN3EJid5jfeOI=;
 b=TVr6XmI/RG1Rvcmqu5xNjhsGrTEZTYoObKwtJFuMn1BChnihzAc938JgVyiPEazpGJ
 cne8JEmcg3gRIHrWctFq2NhF8MHp7rm+vS0MkEIlp8Vl3ZX9lQsvc7JsIVJcNxy3cvCj
 QKzyi8+030ZW3WsUZiQ7cWHWw/Kgq01f0Qhv3GyNB7bINg3wpGQ3otmJgbQPqFmmwA4a
 aASlWUx97nf2jC6z1c63R9yfft86/xDIHjPtzpBmxX6yLmySFa+TtEvCWVlUrcWenejn
 xWNmbyH5+dI9i8T+YIZ/VRCG/qoGgKNROAR4uFwqsQ5JNQRJ0ERo1oJMpQ57kGbkIYlM
 f1ew==
X-Gm-Message-State: AOAM533spQK1JUejrOL6Xc7A8+rID02DThl0brsBQWbQQ3fAfuyR+DEB
 EHcj2l2X0trt/mMqlwITYrmm1X494WJd8Wjl+v6dN5z4
X-Google-Smtp-Source: ABdhPJy5GEkdgqU4aVK8U6KLUy/0yCBCnBC/mOvVbWTKTPvzof8y/5/F+8zkugnhZkHBBEksS1BFkriOrAx5gjY83uI=
X-Received: by 2002:a17:906:a015:: with SMTP id
 p21mr594097ejy.49.1610487536737; 
 Tue, 12 Jan 2021 13:38:56 -0800 (PST)
MIME-Version: 1.0
References: <20210112174633.77125-1-nirmoy.das@amd.com>
In-Reply-To: <20210112174633.77125-1-nirmoy.das@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 16:38:45 -0500
Message-ID: <CADnq5_OmyiR8HaYDw4S9wH_JjFc_zzkaV33tqEOegNVRgZfU5w@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: Remove unused variable
To: Nirmoy Das <nirmoy.das@amd.com>
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
Cc: Christian Koenig <Christian.Koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 12:46 PM Nirmoy Das <nirmoy.das@amd.com> wrote:
>
> Remove unused space_needed variable.
>
> Fixes: 453f617a30a ("drm/amdgpu: Resize BAR0 to the maximum available size, even if it doesn't cover VRAM")
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 348ac678a230..5888367b1000 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1106,7 +1106,6 @@ void amdgpu_device_wb_free(struct amdgpu_device *adev, u32 wb)
>   */
>  int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
>  {
> -       u64 space_needed = roundup_pow_of_two(adev->gmc.real_vram_size);
>         int rbar_size = pci_rebar_bytes_to_size(adev->gmc.real_vram_size);
>         struct pci_bus *root;
>         struct resource *res;
> --
> 2.29.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

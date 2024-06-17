Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 793B290BBB8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 22:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C103410E1D3;
	Mon, 17 Jun 2024 20:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="w9fPs9mI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6CD10E1D3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 20:07:01 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dfea5f628e9so5312584276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1718654820; x=1719259620;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y+S+WCSVEed6tsfqkigseDtdhLEH2SOhRikD4ajyrrY=;
 b=w9fPs9mIPkOAzYzfpM7aEOgX3GTRblywGFF5ZWz7/wWphCoSKcGK9FNjxrNQqplG1U
 eHQWTQL1vj3wx0EBDofFNqjJedOhVgJPJfCwvh5LkvCk3O8l+t7J6h0PbJMGDRnreuKf
 jkX4MVjESRnxGOEFPWTLNiwfOK/bs5zQli1FWS57b0P1sSWdJBSkOOi8Og8u7ZE4Ugkz
 D3AZedpVx13IJFgdqCeok2uYwjGngHNxS7uQbB4Z3124qFM+SYhRH7MF5iS349+oM/Vh
 4C1bjSneWSkrJQ7bVV4sTFrm5tkDKz2VbBzEZEEvjN0ntk+6R/59SzrnyUorCKPlw7gk
 U9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718654820; x=1719259620;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y+S+WCSVEed6tsfqkigseDtdhLEH2SOhRikD4ajyrrY=;
 b=M0rGvRPpE3zyGaDQCuG0AnE+ZRy+sWe7ofQKvJGj9tNQnTXfM1w1uub4YMvNh6kT4t
 HJx4wtwUTMPXp6dQVy3P1jvkJzCXw94SZ4/Kzrt2asZfWmpDRsmqyNP+NKryWfZRz+1O
 e7IalYodNbQl9h1SjHBT1ipq940QffNBhmGsG+0kFYBo+fixEkWftiMyv/X/f4IVGl8t
 sscicX8LuHMXwfaAxYaErH40PTRarm7qWBHccF7vSZDNetjNbIxxCDNX60aT+vVnIOLh
 h/Wo3URqbPNNrpXpak5trwlGzQOzcZSCb/criZgGW4kDAVEomHcp4dCX3+2nC/uD2KzX
 cqbw==
X-Gm-Message-State: AOJu0YzqhSbTQWih5+5ylnlsDLTQK0hNGmT1B+XEWqSc9gycill6Etmy
 FRhVVkwkWEaLv1Bp6C/eIswyXnMTJqhMNXFH0efaiMaC0FKFdBIlI5YgWluHb9SZCGl2OkE8HPo
 E6ve0KbyiJcUHwRTh+wLzD5TGr+3MTLvi8Km7
X-Google-Smtp-Source: AGHT+IHbfFzG1PMoKSOu0wsrR2lao+du4GTQOpKNfFw8MAVjkQUuBP2FdqO3MjvpkOV3SdgtXZPmNJEgDGnlnILVeTU=
X-Received: by 2002:a05:6902:523:b0:dfb:e86:9ded with SMTP id
 3f1490d57ef6-dff153d79fdmr9205731276.38.1718654819715; Mon, 17 Jun 2024
 13:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240611093441.200910-1-carsten.haitzler@foss.arm.com>
 <20240614114602.3187710-1-carsten.haitzler@foss.arm.com>
In-Reply-To: <20240614114602.3187710-1-carsten.haitzler@foss.arm.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 17 Jun 2024 13:06:47 -0700
Message-ID: <CABdmKX3N_Wb7AF=t86SGREH_3Dx1tWO3++vmmr46L-5MNTw7+w@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Fix alignment of temporary stack ioctl buffers
To: carsten.haitzler@foss.arm.com
Cc: dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
 christian.koenig@amd.com, Felix.Kuehling@amd.com, alexander.deucher@amd.com, 
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jun 14, 2024 at 4:47=E2=80=AFAM <carsten.haitzler@foss.arm.com> wro=
te:
>
> From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
>
> In a few places (core drm + AMD kfd driver), the ioctl handling uses a
> temporary 128 byte buffer on the stack to copy to/from user. ioctl data
> can have structs with types of much larger sizes than a byte and a
> system may require alignment of types in these. At the same time the
> compiler may align a char buf to something else as it has no idea that
> this buffer is used for storing structs with such alignment
> requirements. At a minimum putting in alignment information as an
> attribute should be a warning in future if an architecture that needs
> more alignment appears.
>
> This was discovered while implementing capability ABI support in Linux
> on ARM's Morello CPU (128 bit capability "pointers" in userspace, with
> a 64bit non-capability kernel (hybrid) setup). In this, userspace
> ioctl structs now had to transport capabilities that needed 16 byte
> alignment, but the kernel was not putting these data buffers on that
> alignment boundary.
>
> Currently the largest type that is needed is a u64 so the alignment
> only asks for that.
>
> Signed-off-by: Carsten Haitzler <carsten.haitzler@foss.arm.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

> ---
>  drivers/dma-buf/dma-heap.c               | 2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 2 +-
>  drivers/gpu/drm/drm_ioctl.c              | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 84ae708fafe7..8fa68b8a9b60 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -126,7 +126,7 @@ static unsigned int dma_heap_ioctl_cmds[] =3D {
>  static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
>                            unsigned long arg)
>  {
> -       char stack_kdata[128];
> +       _Alignas(u64) char stack_kdata[128];
>         char *kdata =3D stack_kdata;
>         unsigned int kcmd;
>         unsigned int in_size, out_size, drv_size, ksize;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_chardev.c
> index fdf171ad4a3c..201a5c0227ec 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -3236,7 +3236,7 @@ static long kfd_ioctl(struct file *filep, unsigned =
int cmd, unsigned long arg)
>         amdkfd_ioctl_t *func;
>         const struct amdkfd_ioctl_desc *ioctl =3D NULL;
>         unsigned int nr =3D _IOC_NR(cmd);
> -       char stack_kdata[128];
> +       _Alignas(u64) char stack_kdata[128];
>         char *kdata =3D NULL;
>         unsigned int usize, asize;
>         int retcode =3D -EINVAL;
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index e368fc084c77..77a88b597c0b 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -767,7 +767,7 @@ long drm_ioctl(struct file *filp,
>         drm_ioctl_t *func;
>         unsigned int nr =3D DRM_IOCTL_NR(cmd);
>         int retcode =3D -EINVAL;
> -       char stack_kdata[128];
> +       _Alignas(u64) char stack_kdata[128];
>         char *kdata =3D NULL;
>         unsigned int in_size, out_size, drv_size, ksize;
>         bool is_driver_ioctl;
> --
> 2.25.1
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1959A0BE32
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 18:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82D910E73A;
	Mon, 13 Jan 2025 17:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AhGl0lSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393CC10E733;
 Mon, 13 Jan 2025 17:00:30 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2ee94a2d8d0so950284a91.2; 
 Mon, 13 Jan 2025 09:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736787630; x=1737392430; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PbCZdzZQB8fOgM5lm3EVuRvwh/5DKW/szxC/ujNMdug=;
 b=AhGl0lSLYIs1K5pQvegQ/ggmbHVX1SAd1FbeLPgFQndefxeGbAicp4Yd+k3q6Z3+u0
 GG6RbzxErzjrY7g54U00Alx9drZY9/tgth/KC6plmfJu9myau72ICKrZcX8PDqsmu/uF
 kraZjNiptgEVhwqRduZgRZRg5Bz82X19nzWg3iKskYgAddHedY+VLuwCw0GU5jcis+ht
 DfBvhDGPE0XBNxnb2T9QM7AmbhC+u/AvgxcjB/WB3sb9dBxdyVYNEWIoIQFsaEHUZ7BO
 fGsf10rfZdQI8gN7BcQSmb59lQAYg7Qm6Y4BNCPpYbu+lGUmSpA4vp+xHeJlavMAC9kk
 eoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736787630; x=1737392430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PbCZdzZQB8fOgM5lm3EVuRvwh/5DKW/szxC/ujNMdug=;
 b=MkFvoG3oo7lLLGcnkb+G41QOTaoLM0m9B8ne5bw3nEWm8qLbpdZhP1NbvT0Bi/nV41
 iwMrvqUgewP4WJ49QAXmtLvkyxrTkZCF/oS4iFNlHMMn7uoMGtYN+qdnV385OhDS1pRV
 LExyTTrCyDkMyXeAnmiGxVgPIkj69D33K9n0XHpaM4HCvY2yBgdnGXy6fvxFTFIaGrYX
 MCj/tqzCKZjFA0/tGi0RligifQSauU6DrfOY/y0mFuixLFU2LXiuBmkTiDkZjc8q6HoL
 9nYsPQ8zEtiBTOYwta00vxTcbr43E7qSf/DjaK1+MrCV4r5CD/PFnhP9fRVO28wQbfyx
 KY6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRV4eyw98DvARfTRnovFFUT1FmUv56oB/SO18wWm49RON0z0bBaIm6JGo5eOf+7TU60jcQypXn@lists.freedesktop.org,
 AJvYcCWr5bvjQLj2Ipi+5dEva9XDkJkVyFK/ugw8XHoSu3xoPWiE4telWeGqbYifrHXGTxwIUrYYBm5+bfOE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvT0Ae+UJrrIX98JLYJXUegk55klIAydmMBetuUo/TLG7HCHOH
 kqFk1xA56vTaBSDaOXtBIv19yvYT9Qt3YgPDY2JSPgL/0jLocuLKoswCjUhgpMGh/N3Adbgmjvj
 8sDaeNVvF8hgeASgWpIJf2333K+lvHw==
X-Gm-Gg: ASbGnctVuYaHzaprrKjx7/LAoPsdvD4SWnEXvhQ9A6eySBEcrAuka2GVHZQmg4yMZt+
 hC8MLpqIdzA5mIuVXX3Dpdn8Un6fCMR/csz2guw==
X-Google-Smtp-Source: AGHT+IFBfOrslAMlo9J6W9grm47b3hcHW7H2w5I5rWuqurqPDRwmUKCccmufyMFPYfJDVTLs5Y3aOGMChBuGCtU9CIE=
X-Received: by 2002:a17:90a:d645:b0:2f4:f7f8:f70b with SMTP id
 98e67ed59e1d1-2f5490fafb1mr12280361a91.5.1736787629456; Mon, 13 Jan 2025
 09:00:29 -0800 (PST)
MIME-Version: 1.0
References: <20250112134103.72081-1-linux@treblig.org>
In-Reply-To: <20250112134103.72081-1-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Jan 2025 12:00:18 -0500
X-Gm-Features: AbW1kvZufvjWWQRieZ02twwrQaygQOkpqrBifoPH_-7W1kFXo627zREr6GxyUZ0
Message-ID: <CADnq5_PBFGnTwfCqMQRTa+uD+mrXmSrAjC_5Gp9VLbwr8tkuzg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Remove unused functions
To: linux@treblig.org
Cc: Felix.Kuehling@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Applied.  Thanks!

Alex

On Sun, Jan 12, 2025 at 9:39=E2=80=AFAM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> kfd_device_by_pci_dev(), kfd_get_pasid_limit() and kfd_set_pasid_limit()
> have been unused since 2023's
> commit c99a2e7ae291 ("drm/amdkfd: drop IOMMUv2 support")
>
> Remove them.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_pasid.c    | 24 -----------------------
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h     |  3 ---
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 18 -----------------
>  3 files changed, 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_pasid.c b/drivers/gpu/drm/amd=
/amdkfd/kfd_pasid.c
> index e3b250918f39..8896426e0556 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_pasid.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_pasid.c
> @@ -28,30 +28,6 @@
>  static unsigned int pasid_bits =3D 16;
>  static bool pasids_allocated; /* =3D false */
>
> -bool kfd_set_pasid_limit(unsigned int new_limit)
> -{
> -       if (new_limit < 2)
> -               return false;
> -
> -       if (new_limit < (1U << pasid_bits)) {
> -               if (pasids_allocated)
> -                       /* We've already allocated user PASIDs, too late =
to
> -                        * change the limit
> -                        */
> -                       return false;
> -
> -               while (new_limit < (1U << pasid_bits))
> -                       pasid_bits--;
> -       }
> -
> -       return true;
> -}
> -
> -unsigned int kfd_get_pasid_limit(void)
> -{
> -       return 1U << pasid_bits;
> -}
> -
>  u32 kfd_pasid_alloc(void)
>  {
>         int r =3D amdgpu_pasid_alloc(pasid_bits);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/=
amdkfd/kfd_priv.h
> index 9e5ca0b93b2a..0b5979b29bbc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -1086,8 +1086,6 @@ struct kfd_process *kfd_lookup_process_by_pid(struc=
t pid *pid);
>  /* PASIDs */
>  int kfd_pasid_init(void);
>  void kfd_pasid_exit(void);
> -bool kfd_set_pasid_limit(unsigned int new_limit);
> -unsigned int kfd_get_pasid_limit(void);
>  u32 kfd_pasid_alloc(void);
>  void kfd_pasid_free(u32 pasid);
>
> @@ -1137,7 +1135,6 @@ struct kfd_topology_device *kfd_topology_device_by_=
proximity_domain_no_lock(
>                                                 uint32_t proximity_domain=
);
>  struct kfd_topology_device *kfd_topology_device_by_id(uint32_t gpu_id);
>  struct kfd_node *kfd_device_by_id(uint32_t gpu_id);
> -struct kfd_node *kfd_device_by_pci_dev(const struct pci_dev *pdev);
>  static inline bool kfd_irq_is_from_node(struct kfd_node *node, uint32_t =
node_id,
>                                         uint32_t vmid)
>  {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/=
amd/amdkfd/kfd_topology.c
> index 9476e30d6baa..a9bc9ab7e31d 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -108,24 +108,6 @@ struct kfd_node *kfd_device_by_id(uint32_t gpu_id)
>         return top_dev->gpu;
>  }
>
> -struct kfd_node *kfd_device_by_pci_dev(const struct pci_dev *pdev)
> -{
> -       struct kfd_topology_device *top_dev;
> -       struct kfd_node *device =3D NULL;
> -
> -       down_read(&topology_lock);
> -
> -       list_for_each_entry(top_dev, &topology_device_list, list)
> -               if (top_dev->gpu && top_dev->gpu->adev->pdev =3D=3D pdev)=
 {
> -                       device =3D top_dev->gpu;
> -                       break;
> -               }
> -
> -       up_read(&topology_lock);
> -
> -       return device;
> -}
> -
>  /* Called with write topology_lock acquired */
>  static void kfd_release_topology_device(struct kfd_topology_device *dev)
>  {
> --
> 2.47.1
>

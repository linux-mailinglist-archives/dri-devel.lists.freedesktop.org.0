Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007BBB4FC0A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA3110E707;
	Tue,  9 Sep 2025 13:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nnIZyyT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E0F10E705
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:06:33 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-24498e93b8fso11005325ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 06:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757423193; x=1758027993; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TCRhKSwPG7CAUIvZCPIlLSCZ3YprR/xiUPz/bvHEoWk=;
 b=nnIZyyT9Ce657fehbZ8fCiyYSe0EVoSMwlDo36kvqafnNhRFpdfcRWMHSqbHowGilf
 D84M0z011aRLuODgWDsuFjkP7K38lJyIKet/zgw+cit0uJKL2gJ13AIRZTWTg4VJAD9L
 WWnD1SWtmD6GogZFrdWP5ls0fWy0v7SmvEpvF1EMumIpqnhV0z0GouSDAWodyY/KFt3w
 uaJf4jCSRw2mR00yQtan+CBaZxNJOf4HxDheJRgS42ct9Ygb2iXgYr2lCLlK/BiW5kZy
 70bgs9n08kCodzdpDcUVPAWAd4LhDZzDOkiv8oVQe3xn7B03dOT8cmugMkSNuSHcYj93
 LwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757423193; x=1758027993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TCRhKSwPG7CAUIvZCPIlLSCZ3YprR/xiUPz/bvHEoWk=;
 b=TZ2EB1xbJspzObHsCKEybKSz+ZsK0OQpLShSrVeymYdxaX7LYpn+siAVramsl94AJM
 0rR+vJQT6bIjCewayyw3dvTfOTF3GgFg5JBwcSc/3NmovPzufBVfxsNfy1JMfXuvhSys
 3Lxcl+KLqCnNlSglbTNOhmLhat58u57ZUiTDhv0HzCuCW1UXRnpNK/VURkeGmSte5LGj
 n8UrfbNDj/Js6nzD2Lrst/ff2i5SGz+vRh0+ftYcvlSrhKVzQ0M82S4aqdb73M5wJdCl
 NsfChpj+ui/MQuRwvBo+jvyiGw5hmQOeRXYrQFHKZARVVh7GLPtgLXq1YuSQEjFq2spF
 azJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUREsoqlA1/4NpUK8EtIA8yg1MpENZemxYJViY6ZbGhDkSlzU7pfD8dI+5e2LUeJWFJ9LWM0RPwhUY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI9CHU++bKfA4meC58iE6W2F6Es9cppXmy+Kmax4YotevFGTho
 kQWy766o1vZZVQ92g5TLVmP2uwmCgBoAVIwGIr4QLr9wDy2MvGBVwTFI1atS8k8TNAvLehc2xJB
 mLHMr5Zt6VWneU9WG1oS66543CLsO0JM=
X-Gm-Gg: ASbGnctpfohWRtxiWSXFfOD2MBVcnlNOV56fQGkLViq9KtViMODhbzJ9876S7MdPpJJ
 6N2MpbhD9MBrYX/cHYTUZtU2J91+fR36/tSyJrMeL+RPC19ts78YyXT3gNF2ahbDFuDv0mop/Wa
 OzXeqJlFApjgn3q7AceoPBUU8bjjbb6xaXf9NrAY7odFnjuGy35OlOjALotKTcaPYtSrrkeIQu3
 /XYMSI=
X-Google-Smtp-Source: AGHT+IHa8baY6Pl1flgTs6pP2dTZu9WNTAlY3N3JvHJNZ3zkp6rEoHwCNUfHmb5TxMZbd3mIXJZz9XbwZBZNyfQuoI8=
X-Received: by 2002:a17:902:8ec5:b0:24d:5f38:ab67 with SMTP id
 d9443c01a7336-2517653b8f5mr64653695ad.11.1757423192955; Tue, 09 Sep 2025
 06:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250908213156.565861-2-thorsten.blum@linux.dev>
In-Reply-To: <20250908213156.565861-2-thorsten.blum@linux.dev>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 Sep 2025 09:06:21 -0400
X-Gm-Features: Ac12FXwSeHW2KQ319aeqOCaDVZwYWCXWouptpaWLQeAEdAJOVtD4BE9k9jsqKMo
Message-ID: <CADnq5_PwxJ5ErFrMzAo1ocK=rQi81G9iLMPpPM9T51_txrp3yg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Replace kzalloc + copy_from_user with
 memdup_user
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
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

Applied.  thanks!

Alex

On Mon, Sep 8, 2025 at 5:49=E2=80=AFPM Thorsten Blum <thorsten.blum@linux.d=
ev> wrote:
>
> Replace kzalloc() followed by copy_from_user() with memdup_user() to
> improve and simplify kfd_ioctl_set_cu_mask().
>
> Return early if an error occurs and remove the obsolete 'out' label.
>
> No functional changes intended.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_chardev.c
> index 828a9ceef1e7..5d58a7bf309a 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -521,15 +521,10 @@ static int kfd_ioctl_set_cu_mask(struct file *filp,=
 struct kfd_process *p,
>                 cu_mask_size =3D sizeof(uint32_t) * (max_num_cus/32);
>         }
>
> -       minfo.cu_mask.ptr =3D kzalloc(cu_mask_size, GFP_KERNEL);
> -       if (!minfo.cu_mask.ptr)
> -               return -ENOMEM;
> -
> -       retval =3D copy_from_user(minfo.cu_mask.ptr, cu_mask_ptr, cu_mask=
_size);
> -       if (retval) {
> +       minfo.cu_mask.ptr =3D memdup_user(cu_mask_ptr, cu_mask_size);
> +       if (IS_ERR(minfo.cu_mask.ptr)) {
>                 pr_debug("Could not copy CU mask from userspace");
> -               retval =3D -EFAULT;
> -               goto out;
> +               return PTR_ERR(minfo.cu_mask.ptr);
>         }
>
>         mutex_lock(&p->mutex);
> @@ -538,7 +533,6 @@ static int kfd_ioctl_set_cu_mask(struct file *filp, s=
truct kfd_process *p,
>
>         mutex_unlock(&p->mutex);
>
> -out:
>         kfree(minfo.cu_mask.ptr);
>         return retval;
>  }
> --
> 2.51.0
>

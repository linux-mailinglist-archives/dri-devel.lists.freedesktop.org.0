Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF9FB02627
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 23:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2689210E2DF;
	Fri, 11 Jul 2025 21:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zaf+I6XL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE92110E135;
 Fri, 11 Jul 2025 21:11:11 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b3510c22173so373403a12.0; 
 Fri, 11 Jul 2025 14:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752268271; x=1752873071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Id33Mh0yn//Z70R8X33hXzajTyy941nJMPZubqNqXg=;
 b=Zaf+I6XLkr3S5zOzZUoBSi+hy+mzo4qjh1mr2x0d2wfgIb5U+T1Ni1yF0KJxCdqzlp
 EVj2WZGCf5H82J9M5L9gvhM74ZAxkK+PywzI4LNC60RfWmgm1PmgBXOKAy0puJVHCNaj
 iCJpcz17i/xGa/lDzLDwLoO21NQWvDamZUDw+DWc14FUkX7tMxEmJsreG+wbhpMNlO6S
 P8s343nCNVEiUR8DqklBl0kd+1cI7KMosHCnFmqvs9oK5Jv5WRSiqWtzOV4LbEThuW/1
 kaTHuQZvy9/ZD0s1QQrJFXFaZYBXLsUJS6YzUD5wZIxwCKxiLxxMJDRdccyIfwqgdNmm
 Y5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752268271; x=1752873071;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Id33Mh0yn//Z70R8X33hXzajTyy941nJMPZubqNqXg=;
 b=WVed0EOgqlCycP830qBdMxzQpWwQXF785VIYFmtGVzvep9P7PRp4eVbTy9Hyqf1XUN
 PSZ1qCYtfu9Oom1PpBNlq3Ok0W5rJG4B04PoAOx+khhxsUcCqTGCNRJX546mBrQq+2/t
 khuxmY9qin21S2Dg6DuR04Wv9yC4nhyPO3GJ96xd40F+jgOlSijbM6gMOZzStz1I4cgg
 YvlJ1oDAT0rO8kq9kqpmaBir6Qf3jrP5Q5DFigKdl/tmsCjAf9tc4P02ziwsd9JqkaH6
 j5FK1gyQ673jGPRNIEn0/LAlzNXuCeaRlQ6SpT1tKti7H/z8Mg/1lEaYEAtMEexpWHnb
 S8Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsnqJ/9Xc7Sc5wjV42r7ah7AJECGQqcQMNh/nmoYT9GicTdxfGcrRaIxDzWxNnyfyIM02fTk2q@lists.freedesktop.org,
 AJvYcCWczKD/RikKOCuqwm+eLAP5a3JhdBEKRi7t/2MPgTheMNpSOYzd6BG5eR5z/m43sO7Dmmbl2e/blrOT@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywa5fTIc1IxIgZpb8f3rOJpzVPVOpXQUHZWYVPlvudLY+NO1KZX
 TNSUGWf4W1YbbLQZYyd/yTx5BPpbp90eqg5Ixg055Eq5YknrFJLj91iOV4uesE13++9tlAc4pif
 BuEluk0F08LOxW/lm2FhMOT4DYxMe6pM=
X-Gm-Gg: ASbGncvELUy6HcruTAGV6TCPmRFl0lu46hCtbHW80WTmSjs97jLS0ZoYEqSk628izpC
 QNpXnglNZAS9XPqeBgMSHbAXWZkrWTzY7NZLKCIwGL/AB+1+W6oTUC8yFd60XBhDtROA8BMQxCT
 0M1TdDFodptpDYVdCSO/X6R2FWjbZYNYcRV0l9wP0gAeejZa3/JFWI7klGPs8uHJzOs4ThazGI4
 cgzihdj
X-Google-Smtp-Source: AGHT+IGpJSVp1KJC67mP9tYUlD7o9SFm9SGP4FrEtk5U5U6aBHi9jNnu7oPx4ia9y9djde5+J/vRTWXyDwi9eXTEhj0=
X-Received: by 2002:a17:90a:e7d0:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-31c4cd1cd40mr2250510a91.7.1752268271234; Fri, 11 Jul 2025
 14:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <366557fa7ca8173fd78c58336986ca56953369b9.1752087753.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <366557fa7ca8173fd78c58336986ca56953369b9.1752087753.git.christophe.jaillet@wanadoo.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 11 Jul 2025 17:10:59 -0400
X-Gm-Features: Ac12FXwGI8TSVukgGWSUQp6H1YscPS-pE-fH7frUdLlnr1VDrWuzrJq-3B0vZ2Y
Message-ID: <CADnq5_MX6jkkgKTTkZY=M9btZPdVmSSs9siEJ9E8b=tz21MCZw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix missing unlocking in an error path in
 amdgpu_userq_create()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Wed, Jul 9, 2025 at 3:28=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If kasprintf() fails, some mutex still need to be released to avoid locki=
ng
> issue, as already done in all other error handling path.
>
> Fixes: c03ea34cbf88 ("drm/amdgpu: add support of debugfs for mqd informat=
ion")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

@Christian Koenig @Sunil Khatri can you pick this up for drm-misc?

Thanks,

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_userq.c
> index 513bbc543f40..bce97318965c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -520,8 +520,10 @@ amdgpu_userq_create(struct drm_file *filp, union drm=
_amdgpu_userq *args)
>         }
>
>         queue_name =3D kasprintf(GFP_KERNEL, "queue-%d", qid);
> -       if (!queue_name)
> -               return -ENOMEM;
> +       if (!queue_name) {
> +               r =3D -ENOMEM;
> +               goto unlock;
> +       }
>
>         /* Queue dentry per client to hold MQD information   */
>         queue->debugfs_queue =3D debugfs_create_dir(queue_name, filp->deb=
ugfs_client);
> --
> 2.50.0
>

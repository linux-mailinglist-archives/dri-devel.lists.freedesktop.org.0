Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3431B50175
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 17:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B5B10E7A7;
	Tue,  9 Sep 2025 15:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lHIEMLcr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BFF10E7A9
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 15:35:28 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-24b14d062acso11237965ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 08:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757432128; x=1758036928; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b8GWkB9syykE4BVjFSTAYOdo22xPuq6rOAVZtxlTsOY=;
 b=lHIEMLcrVss/4o5wxBC8zB7vhKAt3W8vWw3qTNYQsFNTI8bVagTurCWiyo7SHlMGFx
 CHq4Lbm5/pok64sZGbpFujSgxrbfb512dA6IM1Q71rQV/knJmIIe9O1phd8PbXtqrc71
 sl/q0SN2qHWWZ6nIM7RrfkRc0XDlJTW8uafeFc0k2FofF9yVfkBX0iY/wH+q+neKhpsM
 x2sIj8Y5P860ntSpXx7qdON1pRumvw1HsSfUIjp5SwCtP0I7UpHsFcvSE7QxfqNgFDMn
 e49HekfGRJCPrY0a+y3g6mVYpmvcP/2piEAe8Zb2iZ6SJyzBdVnZGXPiEMaTeqnAtN9W
 /DhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757432128; x=1758036928;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b8GWkB9syykE4BVjFSTAYOdo22xPuq6rOAVZtxlTsOY=;
 b=qfQ228V9/dX2oFNxCOTppQtDhH+aBRrze9YneHynSPU493ZYtazbx71/0vYZhwb1x4
 Hn7FET6RyYkcA/ujwf6AKF4gsGg2Wh/wlNqlLjQQ5Tg/vcnSa87za0hjrJVGCeXQT5b4
 CL7P94rU5B2i0oWosoLV+zjphltyMG0xxsK0TJCNhd6ncQYi7Ju/Gk8UetuqOZjjBTik
 07+0Na/FGx6eY3W0XMNRO9g5YSKl+aYSu8hGce6Smv1ZoaeQa+UB+SUXUyS3x24xEGMV
 KSp631LWQOCQuizfUQjXFLeBQbaTTv32XAZDakloQoTvmjMK3MMtj3RbDOSMNRRvSwIc
 uNkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkcyzl98LETryUlYhjHkAeey/MlLt57YmQLToJzr/a8/huIx17hUGDsbhrB/M318kPi7/+9Ry7SlA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysWNS9WlWiNaNOe9oPzu3ZE8XQaGwaAseioEkG5V7uxb0A8+2X
 GazO8LA4RBTqP9go+jUcLZ2eauo+ceuqKf7bdA/cYNmTSozYx5XcylIKG9DnKD0HcjiXqSdRCW6
 DK787NDevRkarxVhz4xwBRFmqt6xTf8w=
X-Gm-Gg: ASbGncueb/uqvPi23nOT6jXrMA8jD/9UOnUNcYz6BLARDPlG8K+YKuAMSnkYN3y3kb6
 gKMdRHF4WNtYwpwjy0BCGgrxILZv8aA55eh6XfsMOl6KL+ffRbkufUVM5t/issIuyMHTWTgCt7H
 51jhb8hIux+V2ACFKnMan1Y9GSNzvefDvdst0GlySN1MvOeolUZbeo78w8jZcqUJsXfLvdQFIey
 IiRLsA=
X-Google-Smtp-Source: AGHT+IENnQgx9GOpffswO6V15fGtrHaA0nF3KXNRPZySzd62PQEvFKMKh8Wvce7O5KirXBk04iY+MZAgHeWms3DCyOs=
X-Received: by 2002:a17:902:cec3:b0:24c:7bc8:a51c with SMTP id
 d9443c01a7336-25172e31d9cmr94477925ad.9.1757432127744; Tue, 09 Sep 2025
 08:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250909151146.760450-2-thorsten.blum@linux.dev>
In-Reply-To: <20250909151146.760450-2-thorsten.blum@linux.dev>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 Sep 2025 11:35:16 -0400
X-Gm-Features: Ac12FXzaPUWMuCN-x-hshy0CTAfSQd8c0YMhaAvVwkLYzaetb5wApp6nywvJXYE
Message-ID: <CADnq5_MFDZdJg3XFFw9+tWB=_LP47PwE3HXgPK=sryOx+_0wGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Replace kmalloc + copy_from_user with
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

Applied.  Thanks!

Alex

On Tue, Sep 9, 2025 at 11:29=E2=80=AFAM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> Replace kmalloc() followed by copy_from_user() with memdup_user() to
> improve and simplify kfd_criu_restore_queue().
>
> No functional changes intended.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  .../amd/amdkfd/kfd_process_queue_manager.c    | 22 +++++--------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/dri=
vers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index 7fbb5c274ccc..70c17a12cadf 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -1004,13 +1004,9 @@ int kfd_criu_restore_queue(struct kfd_process *p,
>         if (*priv_data_offset + sizeof(*q_data) > max_priv_data_size)
>                 return -EINVAL;
>
> -       q_data =3D kmalloc(sizeof(*q_data), GFP_KERNEL);
> -       if (!q_data)
> -               return -ENOMEM;
> -
> -       ret =3D copy_from_user(q_data, user_priv_ptr + *priv_data_offset,=
 sizeof(*q_data));
> -       if (ret) {
> -               ret =3D -EFAULT;
> +       q_data =3D memdup_user(user_priv_ptr + *priv_data_offset, sizeof(=
*q_data));
> +       if (IS_ERR(q_data)) {
> +               ret =3D PTR_ERR(q_data);
>                 goto exit;
>         }
>
> @@ -1022,15 +1018,9 @@ int kfd_criu_restore_queue(struct kfd_process *p,
>                 goto exit;
>         }
>
> -       q_extra_data =3D kmalloc(q_extra_data_size, GFP_KERNEL);
> -       if (!q_extra_data) {
> -               ret =3D -ENOMEM;
> -               goto exit;
> -       }
> -
> -       ret =3D copy_from_user(q_extra_data, user_priv_ptr + *priv_data_o=
ffset, q_extra_data_size);
> -       if (ret) {
> -               ret =3D -EFAULT;
> +       q_extra_data =3D memdup_user(user_priv_ptr + *priv_data_offset, q=
_extra_data_size);
> +       if (IS_ERR(q_extra_data)) {
> +               ret =3D PTR_ERR(q_extra_data);
>                 goto exit;
>         }
>
> --
> 2.51.0
>

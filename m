Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737D378729C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 16:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E483C10E56D;
	Thu, 24 Aug 2023 14:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC6710E545;
 Thu, 24 Aug 2023 14:55:40 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3a88e1a5286so635429b6e.3; 
 Thu, 24 Aug 2023 07:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692888940; x=1693493740;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jbbb7aX/AkCc7cpA2XwQxu9e8hXKfl+ISvse/qujzGg=;
 b=gVxr9oIQtnsCOCNnMwke1KphBWQ4KPbmg9wClsiNDuhk39u2HDqFOprhDbrQ35Ij60
 +gYjV0SvB4AWSHYE+iKgSUR2WRw6QmIO3EbQFP0alvL+jyI1mZ1CnxOjAdUaYgSYhE1l
 hego1hdv3IBVMuqZFptNb+mALPzg4ZoL18jRUWYiELiJLLQylndbA9Q6MAbyEKoEqjXf
 fgD4B9rnfARzfNSX5OEfj2BkxfvVc6sgpbKe/VqbbwgbT6yl4S2CQ8g8Nt96AGRJCL5L
 SjD/v8uUrQs4UcvtapeILd0tI7ZdPDmLJf0uLNm2DGdwb/1qCUvyAZzhYvoMNCLDn151
 uI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692888940; x=1693493740;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jbbb7aX/AkCc7cpA2XwQxu9e8hXKfl+ISvse/qujzGg=;
 b=BYxtPS25rcDCv22vUN+DDuZI5t+2Ov4eAN6kfT0jZpDVRdl+CsvNAEFTpKg6G1Qhb4
 JyfQdnM1Fb+608Xc9sReGjmuqQV5lovXdXu8cdzZ38HhMEqy4ww9yl5it0eeWPa3M3S+
 4WjTLto4fxwtxtjNxm2tyvS6/HiINCC0t0/Cygz9++KR2WvbdMyob3gAOj5gvtRxFs8R
 jNXEespE8wH+vNOJbsnauCG6ul/koLNRBY8PiQRXo/9vRA64Y9IzMON38HyxcCiEcz+7
 qr0orglOLtIK4LtS1jvP82oOSItlPZ8ERTbhkqrGr4sYL9pVBQeRtpb6WbhZG6sRwz1M
 DvUQ==
X-Gm-Message-State: AOJu0YyVxGEo6WrPG/GyyD/Otuj0umobFdXDB7DDwIizHxdfnk3gdU+Z
 lO12MkDWGykckikf3MGEaBZqODGAfxZlqsatfUU=
X-Google-Smtp-Source: AGHT+IHFrvyvkxJtRo6wF6qRXhH37rfIWRuLntVdyovafjrkWNWzmzu2++kD4BRzIqoQe8pwwnaMQR/q0nyPXZERQ18=
X-Received: by 2002:a54:4d9b:0:b0:3a7:55f2:552d with SMTP id
 y27-20020a544d9b000000b003a755f2552dmr15331218oix.58.1692888939948; Thu, 24
 Aug 2023 07:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-18-lee@kernel.org>
In-Reply-To: <20230824073710.2677348-18-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Aug 2023 10:55:28 -0400
Message-ID: <CADnq5_MethMGBe2n4kfeGEhuh_aHZkUsu-yD9zWSR+iB+ZFZag@mail.gmail.com>
Subject: Re: [PATCH 17/20] drm/amd/amdgpu/amdgpu_ras: Increase buffer size to
 account for all possible values
To: Lee Jones <lee@kernel.org>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Aug 24, 2023 at 3:38=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c: In function =E2=80=98amdgpu_ras=
_sysfs_create=E2=80=99:
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1406:20: warning: =E2=80=98_err_=
count=E2=80=99 directive output may be truncated writing 10 bytes into a re=
gion of size between 1 and 32 [-Wformat-truncation=3D]
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1405:9: note: =E2=80=98snprintf=
=E2=80=99 output between 11 and 42 bytes into a destination of size 32
>
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ras.h
> index ffb49b2d533ad..7999d202c9bc5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
> @@ -436,7 +436,7 @@ struct amdgpu_ras {
>  };
>
>  struct ras_fs_data {
> -       char sysfs_name[32];
> +       char sysfs_name[48];
>         char debugfs_name[32];
>  };
>
> --
> 2.42.0.rc1.204.g551eb34607-goog
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708326BF27C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5C610EF8A;
	Fri, 17 Mar 2023 20:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D1D10E41B;
 Fri, 17 Mar 2023 20:28:47 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 p11-20020a9d454b000000b0069d8eb419f9so3093425oti.4; 
 Fri, 17 Mar 2023 13:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679084926;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t6aACPxqUIkT43mYqyKmb1AfW+xFiyWxFJZz7u1wr14=;
 b=BK2YPfUrlvlvCpE5wWvAfGtxE42u5BfYuYZKVaciH8+4uYZX7GpPrMm5mb3PdJLbUz
 0774aS4o9dju6/pZU36KHlOLsF5K4eToLOJiVXf5BA0PMHLjv1wT0O2pUsLEBscc4g0Y
 AfsQq2/KaseSDEszHEAAENK8J/FWWaCXSU0P1pz8ufCWcBVmO+aZqsF95D1alcQCdKrg
 W5GYP8U7J2OSnnqpGNbIcQGFfdFsjNbptLkaw59Dk1TehddL+K66J6YaXh0BeqewrWa3
 7S2ssuFwzZ7L1p0lvjeuqdAtQAw81dy9M1IUhQyMV0j+55Y7WT9Lx1Oc+EhkeVMyDbBK
 9bTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679084926;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t6aACPxqUIkT43mYqyKmb1AfW+xFiyWxFJZz7u1wr14=;
 b=Fv8O2Nqoob9YLUpkoj0gFNygNT6E4OnfOQt1hNZmWcbWAF34Mcsxc7ewmM3/aNbsHA
 fpLjsLYmlkWG+hF+rcXTXY+nUWoewElGkjP+TjWUaHnXJCWACnZS/3LB2cZhQ6rUJEqi
 GQe7vd6XuS6/ZiQAHXeol863BNNu0eVwKJrunARlLxgf7djsHU43JKZv9R8U1tVq4wB9
 nkzmiX8uS1O4mCxrG0kYIIDFAPu9PEStQNL36PCaLqd8/CkJXsndZmO4PAlvN5mdC2XO
 J4q9RDrJtQvEhOtIC9YahMx5sK6RBnD42oM4VArvXAsfdhgSwEib/m8wIMOFmEoGXdgN
 yNoQ==
X-Gm-Message-State: AO0yUKXyy65hQmsPJzyUfBSnc/8zS5IVCqywzS5KScyYCX5dXBRLvC2I
 qOel0c8tzLgNAHZXchsO9/IPolpsHqPOxhswJtE=
X-Google-Smtp-Source: AK7set89ivnYrpU/9WVegkro6qNkp52C0d5j3e3YbnZDjwyaG5GuwZIaR6q+pX0wiaVxWqyxhvnZYJZ/su7IHQ8TtIs=
X-Received: by 2002:a05:6830:1e38:b0:69b:af37:6f9a with SMTP id
 t24-20020a0568301e3800b0069baf376f9amr315445otr.3.1679084926751; Fri, 17 Mar
 2023 13:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-20-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-20-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:28:35 -0400
Message-ID: <CADnq5_NhOpGd0rG_TVFFfZsk9aFy6Lu+nJ87TdTKAubkXpomXw@mail.gmail.com>
Subject: Re: [PATCH 19/37] drm/amd/pm/swsmu/smu11/vangogh_ppt: Provide a
 couple of missing parameter descriptions
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Li Ma <li.ma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Mar 17, 2023 at 4:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:2381: warning=
: Function parameter or member 'residency' not described in 'vangogh_get_gf=
xoff_residency'
>  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:2399: warning=
: Function parameter or member 'entrycount' not described in 'vangogh_get_g=
fxoff_entrycount'
>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Li Ma <li.ma@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/g=
pu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> index 4590374251f3b..7433dcaa16e04 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> @@ -2389,6 +2389,7 @@ static u32 vangogh_set_gfxoff_residency(struct smu_=
context *smu, bool start)
>   * vangogh_get_gfxoff_residency
>   *
>   * @smu: amdgpu_device pointer
> + * @residency: placeholder for return value
>   *
>   * This function will be used to get gfxoff residency.
>   *
> @@ -2407,6 +2408,7 @@ static u32 vangogh_get_gfxoff_residency(struct smu_=
context *smu, uint32_t *resid
>   * vangogh_get_gfxoff_entrycount - get gfxoff entry count
>   *
>   * @smu: amdgpu_device pointer
> + * @entrycount: placeholder for return value
>   *
>   * This function will be used to get gfxoff entry count
>   *
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>

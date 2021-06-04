Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B79539BE71
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 19:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230526F640;
	Fri,  4 Jun 2021 17:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82C56F629;
 Fri,  4 Jun 2021 17:19:28 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 q20-20020a4a6c140000b029024915d1bd7cso745551ooc.12; 
 Fri, 04 Jun 2021 10:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LOI6wvAzaGYd8kqemXzTNGyTEREL1+gKJT9TY9+po4w=;
 b=PMcm+m0QV24OruZ57oXcb0P09vCXAE854+eIezs8Cw/sfSmzAtpUDumAIIYi+cUcI+
 IEWQtAH9uMev8my+b3douUqO5tOzJVqEXv/uQHkXsuCDoqNT7NbDayA7+JkWhNydGnYw
 uMFh5/Ivcz2xP9/w+8Q40almV/q9QgS8hl628EfbQ3z8YVD5iLbodf9zhUEKpJgSHXz2
 8DoFf/hMk9QvMJoHC5l5GT2G8iYcDjejZ7ovMsFl0GHQUWgABYC1zXy8fKWUS4qs6p7p
 x5ilIm9KjCG6US2OZR/9auwGnom2efnTN3kmV482IcSJmVf8+hxI6kOBEymNjj993xjw
 wu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LOI6wvAzaGYd8kqemXzTNGyTEREL1+gKJT9TY9+po4w=;
 b=JTozIZrPq8/8fj4YIXe12r0VtYXPhhbMeh4P5QvC0ARtVvd6oczFnun5n0i+arCxd9
 E4uCblK/GpQXQyfiDcJUSenpgEDFiBsTOz93Hk/5zVIV5yJdG7alz7+zZPLqtIdHsgyn
 eEYuAOSxNqe821HkXxYEoejWBqB1MRyZ0ok9Ke7X5h+6RM2dyrFim0wQZ4WxczCOmT0j
 hWtYUH+Zo6stsx4uWB/Po2u/oTHAE5Lh4hmRl8uJ0vJ9BEA2GggJovnM3JIb/NNlIfJI
 UQDMJpgwIGfkTNgT00lZXk3ppaM6146JpQJYyatIfa7XgrHJqNcm2u2MDcsvz7BzV4to
 w1Vw==
X-Gm-Message-State: AOAM533MD5LqugajD4TP1mp6ukhCF2gI66nOW6orHr1PY6HtqR0TiliR
 DozrT2SpJF60Sg/9AvC/uCaQ8lqSz3bjgE/y5z8=
X-Google-Smtp-Source: ABdhPJybHagCp5avGzAYCedTNRzoZD7xTPDNemYCX6J7vz75/ba1WW5jrhOpgCd+WTXOur81Mdd2tG+fUa4gkeWfjHs=
X-Received: by 2002:a4a:8c09:: with SMTP id u9mr4402516ooj.72.1622827168120;
 Fri, 04 Jun 2021 10:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <87o8cnfr3s.wl-chenli@uniontech.com>
 <87im2ufhyz.wl-chenli@uniontech.com>
 <0689a006-a0a2-698a-12d8-cb11156e469a@gmail.com>
 <877djacbfx.wl-chenli@uniontech.com>
 <c4941cb6-8c40-aad1-e61a-2786ba1ab225@gmail.com>
 <871r9ic9a7.wl-chenli@uniontech.com>
In-Reply-To: <871r9ic9a7.wl-chenli@uniontech.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Jun 2021 13:19:17 -0400
Message-ID: <CADnq5_ODqHuBxXQJfmxvG1sJpf6pQfhGvNnEXWbC+Lav4cexgw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] radeon: fix coding issues reported from sparse
To: Chen Li <chenli@uniontech.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Jun 4, 2021 at 7:53 AM Chen Li <chenli@uniontech.com> wrote:
>
>
> Also fix some coding issues reported from sparse.
>
> Signed-off-by: Chen Li <chenli@uniontech.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/radeon/radeon_uvd.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon=
/radeon_uvd.c
> index dfa9fdbe98da..85a1f2c31749 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -152,9 +152,11 @@ int radeon_uvd_init(struct radeon_device *rdev)
>
>                         rdev->uvd.fw_header_present =3D true;
>
> -                       family_id =3D le32_to_cpu(hdr->ucode_version) & 0=
xff;
> -                       version_major =3D (le32_to_cpu(hdr->ucode_version=
) >> 24) & 0xff;
> -                       version_minor =3D (le32_to_cpu(hdr->ucode_version=
) >> 8) & 0xff;
> +                       family_id =3D (__force u32)(hdr->ucode_version) &=
 0xff;
> +                       version_major =3D (le32_to_cpu((__force __le32)(h=
dr->ucode_version))
> +                                                        >> 24) & 0xff;
> +                       version_minor =3D (le32_to_cpu((__force __le32)(h=
dr->ucode_version))
> +                                                        >> 8) & 0xff;
>                         DRM_INFO("Found UVD firmware Version: %u.%u Famil=
y ID: %u\n",
>                                  version_major, version_minor, family_id)=
;
>
> @@ -791,17 +793,17 @@ int radeon_uvd_get_create_msg(struct radeon_device =
*rdev, int ring,
>                 return r;
>
>         /* stitch together an UVD create msg */
> -       writel(cpu_to_le32(0x00000de4), &msg[0]);
> +       writel((__force u32)cpu_to_le32(0x00000de4), &msg[0]);
>         writel(0x0, (void __iomem *)&msg[1]);
> -       writel(cpu_to_le32(handle), &msg[2]);
> +       writel((__force u32)cpu_to_le32(handle), &msg[2]);
>         writel(0x0, &msg[3]);
>         writel(0x0, &msg[4]);
>         writel(0x0, &msg[5]);
>         writel(0x0, &msg[6]);
> -       writel(cpu_to_le32(0x00000780), &msg[7]);
> -       writel(cpu_to_le32(0x00000440), &msg[8]);
> +       writel((__force u32)cpu_to_le32(0x00000780), &msg[7]);
> +       writel((__force u32)cpu_to_le32(0x00000440), &msg[8]);
>         writel(0x0, &msg[9]);
> -       writel(cpu_to_le32(0x01b37000), &msg[10]);
> +       writel((__force u32)cpu_to_le32(0x01b37000), &msg[10]);
>         for (i =3D 11; i < 1024; ++i)
>                 writel(0x0, &msg[i]);
>
> @@ -827,9 +829,9 @@ int radeon_uvd_get_destroy_msg(struct radeon_device *=
rdev, int ring,
>                 return r;
>
>         /* stitch together an UVD destroy msg */
> -       writel(cpu_to_le32(0x00000de4), &msg[0]);
> -       writel(cpu_to_le32(0x00000002), &msg[1]);
> -       writel(cpu_to_le32(handle), &msg[2]);
> +       writel((__force u32)cpu_to_le32(0x00000de4), &msg[0]);
> +       writel((__force u32)cpu_to_le32(0x00000002), &msg[1]);
> +       writel((__force u32)cpu_to_le32(handle), &msg[2]);
>         writel(0x0, &msg[3]);
>         for (i =3D 4; i < 1024; ++i)
>                 writel(0x0, &msg[i]);
> --
> 2.31.1
>
>
>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

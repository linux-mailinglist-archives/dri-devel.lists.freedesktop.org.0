Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E113999D614
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 20:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA6B10E060;
	Mon, 14 Oct 2024 18:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SIxBXtiP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA9F10E060;
 Mon, 14 Oct 2024 18:04:19 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-7ea535890e0so288295a12.2; 
 Mon, 14 Oct 2024 11:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728929059; x=1729533859; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bvhwh3gLG6gcnOHuIbpfqhWVaibVg9c2c2Ldevdyqjw=;
 b=SIxBXtiPMy9dHTSopK9CGFM9SLf/CezuGmG0YH6bQrpaNt57V7F1WhBXsk3V2goQ25
 iNKQM1p9SzlqWX0selH9WDnp01/QzMQi3iLLb8U67xU0dozfkQHTZojVZQM5T7xKxUxF
 hdJPzvzVU7pLqvyG2F6LXHL2T/wzXK0frJ4dvmY4U5KqGYyGRoU+MVpZeUaI8iLftjte
 ZGmOVtmN7gH7Vuj14AxJ8bcshwVPyLPRWb0AKTSf+hxcQ26Mj+SPsJ0Dho+p12yrVZXl
 TLFza9tRIVWyVWZMeH2Ih0I8Qg6iHhlvxeS5IUCC5IyuzJ8ygfUriWsRaw5UmGgyvXB7
 H1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728929059; x=1729533859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bvhwh3gLG6gcnOHuIbpfqhWVaibVg9c2c2Ldevdyqjw=;
 b=Qrr3o5DwpK3QXBxMXgwwTDjZadGAVEAQY1A0nOL6hrE7+hLBkd/bCcGIDkHtalBu8/
 gbKNLVZSBWegvQ0QGmW+ZPU2i1qRZqDsceoQoyfPiO6YZe7nVmtTvfPPg1A8zfV/SHOF
 V2i2mnQKAOo6LjkgINYqwe03lV6adBqMw9MHO5d1P5SUiMsFUTypcu8lbtE006S4teFD
 N5jQdwuyf9GEu58Vvknlr/p0Nhd6EZbH4Dg6lyOK2jbjMvilp9nnnlyzR8djGnwVXOxm
 9hPYv6Iot6+1GOv8dIwLi8fNCYMw1+f3exGlB98fm/lMtxuYna/hwO3U7aF8gLcCGkFb
 MdRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZZX+WiqelVifA4Ui4mAlVbqc2FTCuq+Blma3EBurqnPo2tKoiASyuvHK2EuOhLl5yqFCkJdS3@lists.freedesktop.org,
 AJvYcCX1tStemh0QOcdpCGOK9REKxlgl5tNSJD9n732fOif7OQano44iFkiintJsoTivqx9UnsaJR3BPrrBM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwGg2QggIoBKWK6Bn49b880FiWEq8ws61jAYyXd/5JMwQSlgOr
 5TAdnfAtcXVhgAaMNdT+JXPDXVQ3F0U553hnTqNTedIa23nqdYeYpgjgrKeINfWkXPnKeGVS8Ln
 waAMZIBfmXvoe93zkaxVzhUmM4tdO+w==
X-Google-Smtp-Source: AGHT+IGQSiVAhq5p2Nni7Nqi5xdR7AQXxhYJRI8o2X32oWs0TAqQmtICSbeIENaqYKnuwO6PNosi2vKWXoxwvpo5zSg=
X-Received: by 2002:a17:90b:318:b0:2e2:a70a:f107 with SMTP id
 98e67ed59e1d1-2e2f0a11479mr6745183a91.1.1728929058628; Mon, 14 Oct 2024
 11:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <f3cf409f-2b04-444f-88f0-9b4cfe290667@stanley.mountain>
 <a1acb975-c29e-4c90-b7a9-5f50478ab946@amd.com>
In-Reply-To: <a1acb975-c29e-4c90-b7a9-5f50478ab946@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Oct 2024 14:04:06 -0400
Message-ID: <CADnq5_M-Ccu8cN-aSx=Xu3+mSCx7HV1H8JftJk277u7qvCLXvw@mail.gmail.com>
Subject: Re: [PATCH next] drm/amdgpu: Fix off by one in
 current_memory_partition_show()
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

On Thu, Oct 10, 2024 at 11:18=E2=80=AFPM Lazar, Lijo <lijo.lazar@amd.com> w=
rote:
>
>
>
> On 10/11/2024 12:05 AM, Dan Carpenter wrote:
> > The >=3D ARRAY_SIZE() should be > ARRAY_SIZE() to prevent an out of
> > bounds read.
> >
> > Fixes: 012be6f22c01 ("drm/amdgpu: Add sysfs interfaces for NPS mode")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
>
> Thanks,
> Lijo
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_gmc.c
> > index ddf716d27f3a..75c9291ac3eb 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> > @@ -1199,7 +1199,7 @@ static ssize_t current_memory_partition_show(
> >       enum amdgpu_memory_partition mode;
> >
> >       mode =3D adev->gmc.gmc_funcs->query_mem_partition_mode(adev);
> > -     if ((mode > ARRAY_SIZE(nps_desc)) ||
> > +     if ((mode >=3D ARRAY_SIZE(nps_desc)) ||
> >           (BIT(mode) & AMDGPU_ALL_NPS_MASK) !=3D BIT(mode))
> >               return sysfs_emit(buf, "UNKNOWN\n");
> >

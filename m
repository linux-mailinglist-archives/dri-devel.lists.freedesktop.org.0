Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1975D966352
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 15:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038B010E7A2;
	Fri, 30 Aug 2024 13:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UBLfq6Of";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE2910E0A5;
 Fri, 30 Aug 2024 13:46:07 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2020430b139so1606475ad.1; 
 Fri, 30 Aug 2024 06:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725025567; x=1725630367; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ifpCQeP2cumNf3KquMi5xFhz4u6doTwHEPxrybMpp+E=;
 b=UBLfq6OffeA3yo12XJFjpLyax0tuk48Kp6eq6qdCBMCQut+0GS5+hxI7pe9iUcfkVt
 xsaiNKVvsZM6Ue0JLn/eNydFoCbIDiTJ98Mp3lDCr1QoSbjaHyyPGaBpkvPy7AKLkhsv
 xBPRZ27zQiL4kxwHJI5p1pBBK5ApMMpk3rDuMqKbdcuycuseUpPnMHO8OybwSXwqcqSU
 Jh9wZuRQH8/P15LuXrHCfJYDutByf8qnvW8sdmy6G45vo/4fl3TL+c8A2gK9Evo+5kcA
 MXj4tseqyW9/dNWV+BaC4i4wrSF97G86SD3nKkVLGjZZk6keoYR1q6+JR/SSqokBBNNX
 RhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725025567; x=1725630367;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ifpCQeP2cumNf3KquMi5xFhz4u6doTwHEPxrybMpp+E=;
 b=FCr0InD1Z4vOn2CWxTXghB2KNLDu8pMl/UCwb0A3MUyx/2NDcedGdSfvN55ARq9sAV
 izNZI9VVEIv7fE4LcnuRz1g3wFcEZHn59Z+9wG2ChNVYW/O0uc/wO25aYfCZbd80xyQQ
 Ye+3IPQ/HUzoWNStDu5Vlke5XiLCAkHrWOiQn1+/ijlDxj9EfQDvzCdihIco1NWp7Qmf
 Gnw6zpE9hBACP2E/ODok6CXyB/SgrweFtytIfqEzP+DkHLfweuSxBSJc2HMhjYJV4Pb/
 PqKFiK9kUPBzNpjYa4Oj2yiXPIrCmhzeaI+ANa5ppuQEsSTwXHVC0tBKyTwZs+9l/PiV
 aB7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5P4BFD5A7+BE69xmQTZpZccXCBZns6YMkeoOoYehxXzp0eMs2fuegDKNJ/T7lBlQ7QvqvvRiHnw==@lists.freedesktop.org,
 AJvYcCVROuLDlwzv+5pwG/8Gm3M/F4l3QkO7TKrak1vQG6EEfn3cmEQmYvsCr3redrWU3MuNTVgif54x@lists.freedesktop.org,
 AJvYcCVutHZ8IUk0xZL7jZ+nA4Qjr+K08l3uvwhSBgu6tVw8AnxNjaou4yQ5cgwWBVJYRHjlUY8/UC4FX9AK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJiXgMsTTHxzjLTGiq2l3QJCOl6HgnrjpY10n0ZHCiCHugASB3
 I1l7efl4q1CBliXQKJhTPZ18pT3h3nMIMiY86U2MVi3E354cn3QRU7AY6BBndUGMeFoqXgdjVp/
 eYnQe6q02te1i3tlAyVhIZaQzk8M=
X-Google-Smtp-Source: AGHT+IF5Bv6WaeQVgx6+6WiJxNlzOFFDKTePFL/dXi1F74yXRFY3KwXprcz/ekS9nHS3kcSzssaEqNkdG0sya8S6eJE=
X-Received: by 2002:a17:903:18b:b0:202:35aa:c1c with SMTP id
 d9443c01a7336-20527a66cf4mr13338925ad.7.1725025566988; Fri, 30 Aug 2024
 06:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240830012216.603623-1-lizetao1@huawei.com>
 <20240830012216.603623-4-lizetao1@huawei.com>
In-Reply-To: <20240830012216.603623-4-lizetao1@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 Aug 2024 09:45:55 -0400
Message-ID: <CADnq5_N98gB4BopT+XbPCahOZJxe2aDfm8wbK5DZbUAaUivD=g@mail.gmail.com>
Subject: Re: [PATCH -next 3/3] drm/amdgpu: use clamp() in nvkm_volt_map()
To: Li Zetao <lizetao1@huawei.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, kherbst@redhat.com, lyude@redhat.com, 
 dakr@redhat.com, felix.kuehling@amd.com, zhenguo.yin@amd.com, 
 srinivasan.shanmugam@amd.com, shashank.sharma@amd.com, Jesse.Zhang@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
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

The patch title prefix should say drm/nouveau.

Alex

On Fri, Aug 30, 2024 at 3:15=E2=80=AFAM Li Zetao <lizetao1@huawei.com> wrot=
e:
>
> When it needs to get a value within a certain interval, using clamp()
> makes the code easier to understand than min(max()).
>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/volt/base.c
> index a17a6dd8d3de..803b98df4858 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c
> @@ -142,7 +142,7 @@ nvkm_volt_map(struct nvkm_volt *volt, u8 id, u8 temp)
>                         return -ENODEV;
>                 }
>
> -               result =3D min(max(result, (s64)info.min), (s64)info.max)=
;
> +               result =3D clamp(result, (s64)info.min, (s64)info.max);
>
>                 if (info.link !=3D 0xff) {
>                         int ret =3D nvkm_volt_map(volt, info.link, temp);
> --
> 2.34.1
>

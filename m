Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 711B6924734
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 20:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E563D10E2C8;
	Tue,  2 Jul 2024 18:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MJhdJBEL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B6510E28A;
 Tue,  2 Jul 2024 18:20:14 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-81011c142ffso181508241.3; 
 Tue, 02 Jul 2024 11:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719944414; x=1720549214; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cmw7KLpqC5sHFcBw/YtYXedNSjR/K2nv2vMyO3PED/w=;
 b=MJhdJBELWlxJAJFxi5en1eKjB7PHuJzHfwbuWKCQrjLQSZZv4QehucPYpIiXCcTg/L
 5WaOS8W/RS21ygfqkWwyRMkY27mpNwWJ1fWB42g2ZFzVXJpbAFb9ptiOO+uvL014MX/J
 +hmafkrar++Z0Q0GLXJkylZvq+Cy7eX1z9cH0K5fTWucbtjg53Zbw4o6lDxd5SBRy7g8
 of3/3B7/6ozgbRUYSzNqrBTn6ButUSCMXApwl7lf3ZpKKqMJhI53ggLy3ssiJmVKG9G1
 ifVW4wLbnNzCEREN9Cf8WSys9FUYewaEKGQ01Bfddj4izUtvuDadbVQwGNBmKDxm4mYv
 mgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719944414; x=1720549214;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cmw7KLpqC5sHFcBw/YtYXedNSjR/K2nv2vMyO3PED/w=;
 b=OC9JnU4JgQqk99grFN4NCbq/fgQWOT77N40EBnpd+7M9WtHwMbTfYSKXHKkvsDLAdi
 bBOWuTN2GboAhP+Ph4vP20uFUw8igmQkjwZIKrN7feGbz2ikCVsNbcrG8IAazxECMqBH
 70QY65i+cqIniorij2d864hFgHIAfh+537rMtFQn87DloWkVPHlkD7mcPkG9OcFHDaxk
 vX3br3ckH9Aq3/BAlAIQwhJ91xevK9vpzk1ZnYWO54ZQqCvzbcHfF2Yv0q4Xv7dp8C0I
 U7AjQn2pig3SEwD/6graDOhN9hsqE3zjvHbitAR2jBAi5vsNLAbmeU871YPTQvQqoEQh
 fZig==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9O6mKcVzDfFtdNmHDrgt8Z2ky61UQll+K4y5RmEHe7EkyrtB+080u3jObogvwM8eGDpNgogbzuGXZrEs4//l9460HBsp5Uc3JZybMyabJ
X-Gm-Message-State: AOJu0Yw/Sgq4FTkIB4j9WCVxomcSVej7xaYZMVsd4yKncmHAH5jKxX1X
 tT2S4updZauy8thw8faYbLFBsY7fhRVwSmVgQYpLxXThESndCWUOGsrxAsae6bduL8jjt4XGV2O
 7P8O5W8VfHfk5gbkJb/NJURBrwTM=
X-Google-Smtp-Source: AGHT+IEQ5BsMFWZ5hSXd66lnuCuKmGxBkNSc5Eib8fIqIIhMywdcFt8DNObMVeQdyw74P6xdKueGutP9xYt7mpqbdug=
X-Received: by 2002:a05:6122:2899:b0:4ea:edfb:8d89 with SMTP id
 71dfb90a1353d-4f2a56dd66cmr10762195e0c.12.1719944413430; Tue, 02 Jul 2024
 11:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240702173048.2286044-1-rajneesh.bhardwaj@amd.com>
 <20240702173048.2286044-2-rajneesh.bhardwaj@amd.com>
In-Reply-To: <20240702173048.2286044-2-rajneesh.bhardwaj@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Jul 2024 14:20:01 -0400
Message-ID: <CADnq5_MU-j1sBYn-7dzvEKF73VBc=bcYOYY0AcbPjrJnKB24Zg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/ttm: Make ttm shrinkers NUMA aware
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Cc: amd-gfx@lists.freedesktop.org, felix.kuehling@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com
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

+ dri-devel

On Tue, Jul 2, 2024 at 1:40=E2=80=AFPM Rajneesh Bhardwaj
<rajneesh.bhardwaj@amd.com> wrote:
>
> Otherwise the nid is always passed as 0 during memory reclaim so
> make TTM shrinkers NUMA aware.
>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_poo=
l.c
> index cc27d5c7afe8..f93ac9089a60 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -812,7 +812,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>                             &ttm_pool_debugfs_shrink_fops);
>  #endif
>
> -       mm_shrinker =3D shrinker_alloc(0, "drm-ttm_pool");
> +       mm_shrinker =3D shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool=
");
>         if (!mm_shrinker)
>                 return -ENOMEM;
>
> --
> 2.34.1
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC62187B2E6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 21:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4504210EBA1;
	Wed, 13 Mar 2024 20:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bz5RKK4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDFC10E53C;
 Wed, 13 Mar 2024 20:28:41 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-5dbcfa0eb5dso173746a12.3; 
 Wed, 13 Mar 2024 13:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710361720; x=1710966520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wLdMGTHjCZxVafTtMVCntax7k5CZGdoW/l4AHdOa5ds=;
 b=Bz5RKK4qjKAFOqE1UyQCINUc062K0K7Zljb3L7pRA8WXWv3SefkEXdkw+pGuf0Qu7W
 NfI3mZwD8B6kevN+0ehyYC3nGJxfbYkweLKcUbXqWlGA0/BXstwSC8+DjbZOnE4RGTrC
 MBJ6FsmFNz2I25j5YQ5KiAQodKZLEor4/GcCAPE2UzNxb1mbBROa1qOLciAyIPvU2/Wk
 S7dGYSbS7XMgrdWM6Osy9TW55PNFCW5774zs/KzsQtAX2LWl6Q7GrO5RCXqPmYu8Ycg6
 136SuWkfghdtO6ohhSr9PoU5BFnuVW0D1Kgc/akra2GTHeZ/4S+lcTmA+AGnEKuGoZNX
 SuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710361720; x=1710966520;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wLdMGTHjCZxVafTtMVCntax7k5CZGdoW/l4AHdOa5ds=;
 b=kWOi3Yw3/N3guVIX6jI/6hMFSyxI8PN/rZ3t3dbDuSk6Ka5zSWS1OkfIHapHr89niO
 huY6Tr9vq1QAvrtzVzHPE5L9zrIr9xhQCtl7faQaP43GQXRMqjMnBEzUtYu1GiFF/cUX
 texG7Qb1ulVHJre0y0WeyWJXwUhdIBYG2dBMmCkApfqaktU1S+P9ZJfLXqWJzmXVNDm9
 LFlyO4DiZpiV3zhSR41bmLkGsxA2NujnEUzGfVqPDCQGNRtUtiH+m3O1RZ3sgIlsR+2z
 KZIf3rrYiOET4CUCIIHJB6UHn8EGP/qBasBKQez81QiXRA9T6BOsMnGyXkMGbpaq+0DE
 9D4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7OZQsp1ZMxoOQQhvgLTH6ylV5rh+BrV2JAe8ZmjsdH0WFp1D+qfQhGzrG204rKDwM8kTcJIhll9SN2Ae/N6+94EgIRn2ikNJ2bFATSpfaAWaTyrnKDVoOdtVLwWSkUMDolrII4t5oTJHl7GDPGQ==
X-Gm-Message-State: AOJu0YxEPRfpzgDjMI02rRGuvt1/wP+VaeEWT9pdCOa75Vs2Rw3Cocjl
 uoqa3fPYi9ew/QAaBEDO8pUHaav7LTh8SmgTbUfMXtd5gQbjV7cpYTWvuHYTA7eBieFTWNHVcTF
 F5AXQpr2RG9fhOmhWfkSSU426SIc=
X-Google-Smtp-Source: AGHT+IHfe0f72cKVDWfwCyw15sU3YqepXYlm+0OC2iqUlzAtqVE4ia7J9pxtUhgmCGnF6l6pP0qMzmV3PFRhKJ+ct9I=
X-Received: by 2002:a17:90b:3c0c:b0:29b:b1b5:13f2 with SMTP id
 pb12-20020a17090b3c0c00b0029bb1b513f2mr6940943pjb.4.1710361720286; Wed, 13
 Mar 2024 13:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240312124148.257067-1-sunil.khatri@amd.com>
In-Reply-To: <20240312124148.257067-1-sunil.khatri@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 13 Mar 2024 16:28:28 -0400
Message-ID: <CADnq5_O-cyDkNLznZpvnZtz15Mi1_rkigirG80BmYJprP_udnw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: add the IP information of the soc
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
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

On Tue, Mar 12, 2024 at 8:41=E2=80=AFAM Sunil Khatri <sunil.khatri@amd.com>=
 wrote:
>
> Add all the IP's information on a SOC to the
> devcoredump.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_reset.c
> index a0dbccad2f53..611fdb90a1fc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -196,6 +196,25 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset,=
 size_t count,
>                            coredump->reset_task_info.process_name,
>                            coredump->reset_task_info.pid);
>
> +       /* GPU IP's information of the SOC */
> +       if (coredump->adev) {
> +               drm_printf(&p, "\nIP Information\n");
> +               drm_printf(&p, "SOC Family: %d\n", coredump->adev->family=
);
> +               drm_printf(&p, "SOC Revision id: %d\n", coredump->adev->r=
ev_id);
> +
> +               for (int i =3D 0; i < coredump->adev->num_ip_blocks; i++)=
 {
> +                       struct amdgpu_ip_block *ip =3D
> +                               &coredump->adev->ip_blocks[i];
> +                       drm_printf(&p, "IP type: %d IP name: %s\n",
> +                                  ip->version->type,
> +                                  ip->version->funcs->name);
> +                       drm_printf(&p, "IP version: (%d,%d,%d)\n\n",
> +                                  ip->version->major,
> +                                  ip->version->minor,
> +                                  ip->version->rev);
> +               }
> +       }

I think the IP discovery table would be more useful.  Either walk the
adev->ip_versions structure, or just include the IP discovery binary.

Alex

> +
>         if (coredump->ring) {
>                 drm_printf(&p, "\nRing timed out details\n");
>                 drm_printf(&p, "IP Type: %d Ring Name: %s\n",
> --
> 2.34.1
>

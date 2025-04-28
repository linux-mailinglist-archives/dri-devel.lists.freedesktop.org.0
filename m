Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0316BA9F73A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 19:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4FD10E62A;
	Mon, 28 Apr 2025 17:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WcRN6WWz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7419F10E62A;
 Mon, 28 Apr 2025 17:24:22 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b0ec7f3a205so296162a12.3; 
 Mon, 28 Apr 2025 10:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745861062; x=1746465862; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=INPGmSyDHw0Hci05cxLMn7U7sEbxuZfILHMHNUoIxUc=;
 b=WcRN6WWzwftjgKb06prgw22znK61pXmLNFCcGObKMPLDKqY+j/0DaKcFpm4yXqXO/Q
 rG4OU+VrLyma2NRapOdnohjv3mjx9cG7tbNPMjsyUgFrr68hiDrBlW6EriyaRtXcV23p
 9kfIN+LB6nKtqK3wMFMTP+0813BFzxxldcpBobkdvGfhr6Wbpct51hLiSO00xzuZlGCA
 uaYfZGESJtfzIYgvq7OK30VgtlmB7tIgEbIDHRMGsgk50+zi+lqOgxsPD3LWA+MaCl4K
 LnaOk+uSHXimOv+b5LE3wYCeYPFi25F1Gx94XbtOl+arpxM31oqfSLtZJMjmwM37zCZJ
 jPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745861062; x=1746465862;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=INPGmSyDHw0Hci05cxLMn7U7sEbxuZfILHMHNUoIxUc=;
 b=k2clUQgUshto3UP91PyWWa572uvwhaSQKjeEFFEJCO6HURwvnIHVi7ImKrnWaDLSIO
 zej3piJTnt9hJmmQsTIk5tq+pFJTWOTzk6PmAATvmwEFHHPvNyIW3+Mu2P3nXKGY2h1A
 eH39/zqP8wtqkLdYohiysJYfzZYdfDr3J/5u3JGstyujYJqsCPQl0uNRiYn9iA8jFFaw
 bHxiBfKuvAJmK/EyW/q6hEcwzfdPxOYVWAyjS0xzRS1w+es1A2uopz8Q/x7GnBWk5EZV
 l78Vwid3W9U83bria3r9XaOYsGbgg2IfZWTp+JdOMeidEXcV+yuBQK0RFqMX4T4D71hC
 WPqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwHqQVumlNtja780W8JysHvHDFlqRUXkK96jLLiqz91nag284Nz6JM5xOFPQih+Pf7faBrxiCZ@lists.freedesktop.org,
 AJvYcCVJdSKpaipGjBWsOVaim/WLnOzHVSjCxNT4lUA2MzQz1XG1bd/jOWmy4j1pZo5jYx5VFE+H1S6jt/oZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrTDwVsbm1MckvmC89VKRabvsuFpmVi8eQXYMdc+Mp1ix0hrH9
 tcJ1U/dhMp1eNtaZOxmmPJlUoZEbOmP1161Jq5KGLg9uAR0wzUuPaqSquAaCsG9dT0MMbkDWRGt
 kmhKGwyWd7M3hvSkx6iitrF3MoUo=
X-Gm-Gg: ASbGncsyYd3kzDB/e0EVwutI1wuiBMyGbUUtL4iY7LuhylPDoyFBW/Y4bjzWmKRMyxQ
 6eU7Re/Nb/+KMnzie76t7t4BObGwzetGEi7YbUeFQdoTBQ4I+o527qqTupUOpl4SoX8KDk0awAy
 +RmfXboIxxzquknu5c4ahyYw==
X-Google-Smtp-Source: AGHT+IGI4dG+E4VqxqZ/2zqOevZMvd8JbWfsZtmogHBB/ac3zneJDZPbgHIYYSPv/A0I4M8+YbDyL2bg8RamjxME+vg=
X-Received: by 2002:a17:90b:4d08:b0:304:eacf:8bba with SMTP id
 98e67ed59e1d1-30a220c9efdmr82082a91.4.1745861061905; Mon, 28 Apr 2025
 10:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250427094536.353823-1-prosunofficial@gmail.com>
In-Reply-To: <20250427094536.353823-1-prosunofficial@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Apr 2025 13:24:10 -0400
X-Gm-Features: ATxdqUG902PaZ2_GkfPHyzXrIbWWpjppF29w4YxeLUnuum7hhoMvXjdzHTE-n9Q
Message-ID: <CADnq5_N8_VjK17iWMp2q3p5QHtHM7wH1HmX7qLPoL6e2WS_kRQ@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/amdgpu: use string choice helpers
To: R Sundar <prosunofficial@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>, Tim Huang <Tim.Huang@amd.com>,
 "Jesse . zhang @ amd . com" <Jesse.zhang@amd.com>, 
 Boyuan Zhang <boyuan.zhang@amd.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, 
 Peyton Lee <peytolee@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>
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

On Sun, Apr 27, 2025 at 5:46=E2=80=AFAM R Sundar <prosunofficial@gmail.com>=
 wrote:
>
> Use string choice helpers for better readability.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202503222049.sUXL3q6w-lkp@intel.com/
> Signed-off-by: R Sundar <prosunofficial@gmail.com>
> ---
>
> Reported in linux repository.
>
> cocci warnings: (new ones prefixed by >>)
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:311:49-70: opportunity for str=
_true_false(vpe -> collaborate_mode)
>
> vim +311 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
>
> for linux-next:
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vpe.c
> index 121ee17b522b..442d137e0fed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> @@ -317,7 +317,7 @@ static int vpe_early_init(struct amdgpu_ip_block *ip_=
block)
>         vpe_set_ring_funcs(adev);
>         vpe_set_regs(vpe);
>
> -       dev_info(adev->dev, "VPE: collaborate mode %s", vpe->collaborate_=
mode ? "true" : "false");
> +       dev_info(adev->dev, "VPE: collaborate mode %s", str_true_false(vp=
e->collaborate_mode));

I'm not opposed to this change if there is a general initiative to
convert everyone over to using this for some useful reason, but I
personally don't think it helps readability at all.  If anything it
makes it worse in my opinion.

Alex

>
>         return 0;
>  }
> --
> 2.34.1
>

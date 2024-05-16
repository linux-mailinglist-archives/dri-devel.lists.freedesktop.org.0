Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C497D8C7D75
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 21:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F9E10E3ED;
	Thu, 16 May 2024 19:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XG2sCeUX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9804F10E31C;
 Thu, 16 May 2024 19:49:50 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-5d3907ff128so488179a12.3; 
 Thu, 16 May 2024 12:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715888990; x=1716493790; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMYV96lYb81BflDXHkzjhpZxuga4YZNOpQVldb0+fDk=;
 b=XG2sCeUXKQ/feHowW+35pnqcrvrEdo6aC69VO34yYaX69ZdRGAIsrYQe+vkRMKlGaN
 xAZmzlPc9hey26J9x1uFz2WW+jWjXuBCsfVkouffmPAJErYj8XgQx6ldcOT1yWNcRMq5
 ODlZxVekvboEs0B0tLXy8MkhK5UXZAvGyA9JSihbS7Ki0ZKiDfl9cLMX30j1Aa+kiZZV
 dVkbjKiz4o+NqGAUApJ+vkCeWjaLhS085bSr0HRLXLQlPFHcRdeTlLbW1SVoB+avHL4e
 meeJUG/udDYcO42vJjIQGzWiiCITzoIvA+fwX3gqrp0rHYz8IzX+MOyAaSMqXIUCzE3h
 zMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715888990; x=1716493790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dMYV96lYb81BflDXHkzjhpZxuga4YZNOpQVldb0+fDk=;
 b=aGObVwybzrzvlHe76Zr07SSN+PlxizlbjX06QkcNc3Ntmn0oQQF50jYLbTqHh4TyKO
 lKyeidgdC0cL9RdE/y19X2tltV+QEpq+8NHciC3XSbkdJKHFxoa+WZRX/mUzlEFrC+wY
 Pq3ZFjmSuGeB18mMPAvJyvKXadmnEzZzg6fmeyy+BFwxdqB1lRYiIBxbZDKA7mjK7X2K
 TrHRhExb0S3HHgOaIJwz1cP20YR0dZfAorJUE3U7uZeI8dMS1du3YIeS0R3UOgSlFG3o
 P34GsfJuqB6ygp9wdVnU2HHDhtnw+6SH83PRDmGHR6I3USnAbSAUndrc1AcFPislciXM
 h2SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFHrm/rrKRp8kxa1KrUc+AwZRrWMO8LPT5C8ACP5zXI6U/HzN6W0zDJcqQaJtmPta+7QBJM3elV9oPqV7pPSAPsRzv2neZO+hrX2hONeVEGC8BKspHmdDxmAH9NdEEDoed0FQ2Ydi1Q/hDJL7yTg==
X-Gm-Message-State: AOJu0Ywt7AmHhwOH/O/ccD7hfdmK+tALV2m0e1v+BBWUKq3caIZMRwF+
 W8+MgVXiY/3sXykKdIFeY1nw34zHuwxxtgHTjc05/P8q6EMu2qc8EecJyA3jg778UU6QXWO6xfc
 7/qqv5YVZ53edZeQbf4b4XOgedqY=
X-Google-Smtp-Source: AGHT+IHO2r9iV0Nf/KnfJsuujjZdu5xgf0GlYWTa/Z8VQoPXq9yH0ZDUJNDMTE3Cvh901LrugzbFcE7ixusomO+K8Yc=
X-Received: by 2002:a17:90a:a38c:b0:2ad:fed5:e639 with SMTP id
 98e67ed59e1d1-2b6cc4502b9mr22341481a91.9.1715888989916; Thu, 16 May 2024
 12:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240516115721.1.I8d413e641239c059d018d46cc569048b813a5d9b@changeid>
In-Reply-To: <20240516115721.1.I8d413e641239c059d018d46cc569048b813a5d9b@changeid>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 May 2024 15:49:38 -0400
Message-ID: <CADnq5_PGfjJMvER2o+z3niTPjdq8vMuHfzyr7OYC40LNyqkWmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove GC HW IP 9.3.0 from noretry=1
To: Tim Van Patten <timvp@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, alexander.deucher@amd.com, 
 prathyushi.nangia@amd.com, Tim Van Patten <timvp@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Ikshwaku Chauhan <ikshwaku.chauhan@amd.com>, Le Ma <le.ma@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Shaoyun.liu" <Shaoyun.liu@amd.com>, 
 Shiwu Zhang <shiwu.zhang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, 
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

Applied.  Thanks!

Alex

On Thu, May 16, 2024 at 3:46=E2=80=AFPM Tim Van Patten <timvp@chromium.org>=
 wrote:
>
> From: Tim Van Patten <timvp@google.com>
>
> The following commit updated gmc->noretry from 0 to 1 for GC HW IP
> 9.3.0:
>
>     commit 5f3854f1f4e2 ("drm/amdgpu: add more cases to noretry=3D1")
>
> This causes the device to hang when a page fault occurs, until the
> device is rebooted. Instead, revert back to gmc->noretry=3D0 so the devic=
e
> is still responsive.
>
> Fixes: 5f3854f1f4e2 ("drm/amdgpu: add more cases to noretry=3D1")
> Signed-off-by: Tim Van Patten <timvp@google.com>
> ---
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gmc.c
> index be4629cdac049..bff54a20835f1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -876,7 +876,6 @@ void amdgpu_gmc_noretry_set(struct amdgpu_device *ade=
v)
>         struct amdgpu_gmc *gmc =3D &adev->gmc;
>         uint32_t gc_ver =3D amdgpu_ip_version(adev, GC_HWIP, 0);
>         bool noretry_default =3D (gc_ver =3D=3D IP_VERSION(9, 0, 1) ||
> -                               gc_ver =3D=3D IP_VERSION(9, 3, 0) ||
>                                 gc_ver =3D=3D IP_VERSION(9, 4, 0) ||
>                                 gc_ver =3D=3D IP_VERSION(9, 4, 1) ||
>                                 gc_ver =3D=3D IP_VERSION(9, 4, 2) ||
> --
> 2.45.0.rc1.225.g2a3ae87e7f-goog
>

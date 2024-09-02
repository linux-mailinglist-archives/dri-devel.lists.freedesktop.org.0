Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AE3968CF1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 19:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A1910E38B;
	Mon,  2 Sep 2024 17:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D/g9IzBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A7210E384;
 Mon,  2 Sep 2024 17:47:01 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-20549ca1fe3so3066055ad.1; 
 Mon, 02 Sep 2024 10:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725299221; x=1725904021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f5dsshy/c+kaWBmpWBBqZVmXiicMNvJuoJNc+L9CI4k=;
 b=D/g9IzBAarTB30d9y8Oev+ApAAaKCuvcrb1z36TySs61+1D8h/+y4SCkVKOypXGYXy
 epI16WCX9mlu0Z0WMCCo77fzQzNDmRdEqLvaYVNvYBZg9/sFLlaFyehBd53/cOCNO/Dw
 05MarmE/DWxC0hI2A3oFZUlDG2gmS5VWJWKoRHXapv0uKIAZKYFOY7Kh3iGPRKXKfkvC
 rsmhpmuRnJgwzwaZpmGZpS/LnYBOpwBHpTKDX9nX6q++l2ZW+8ZoWvfDonnlzjP2JQIx
 NREe1QBInVTzRd8eOJnKz146mpdto2VDNAN9qAPd947+P8Ge110C8I0b231gJX6YF4Gp
 YhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725299221; x=1725904021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f5dsshy/c+kaWBmpWBBqZVmXiicMNvJuoJNc+L9CI4k=;
 b=VYzd5LBj8ctWwdekKiw39/1+v2lzulwTl2S0w/aghH2xJIeAupL/lVteJpx7JEzOxx
 eHQ/1Eb65jqqIErZL4fuQfjLYo68nksMGU90XeYkhiCJ3Mjim1yNGSp2wuAEp04L4+JG
 06GxgInP0gY71tO6lMrxlDgKT+NhWTDMmk6i4+Rl4B/NQYK3gcSxlvnXhSHvQaT8T1+l
 cAJ/RwXHK//nylo3LssNVM+htqZz8QDrZUTqjQmnrwaBH7Mh1bwp835PWX/X67hyzZOG
 e63cJMcqIqTS4Keey8bR169157fWu9Mmo43YjTZ4wU78GNAS2Ocs0MwmKqXc4D7xuOUc
 EEdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZoFiU9828LG3tEpkfJTckBUnMDoE+m2zPmb8IKNRF9UOO5TqlNycqQG+laFIECb2JOUhr6jYkMKEe@lists.freedesktop.org,
 AJvYcCWv4eZVlYbh3GhhonW8sTiOS9rZ/sCwVO1KyyqU/83nRiQydRjVThwsgamXnBh1EAtdVDILqd5L@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycLWEbFcSdnRlbCedUkSJhT1HVU0qETf9cw17cguYKV6jXW0ej
 Y8xLHgMd2/+8xzxSnGg4sMjm24N8wvK62032asOxSZxV8aUgQvh6r+z5bFdQqhSoNKaycn5IrqN
 2RavCJGH+rG7DtugLEk09UHUUbwI=
X-Google-Smtp-Source: AGHT+IHLPLQSiXJyGvUinhSNLnatd1UsY5FyvVDChDU2kqJ0Yp0NfNjYZj4NYw97xpqV/8VKDLtnj4VfPHj0wFRji9A=
X-Received: by 2002:a17:902:ce8b:b0:205:76f3:fc22 with SMTP id
 d9443c01a7336-20576f3fe16mr25817525ad.3.1725299220657; Mon, 02 Sep 2024
 10:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240830072708.128502-1-yaolu@kylinos.cn>
In-Reply-To: <20240830072708.128502-1-yaolu@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Sep 2024 13:46:49 -0400
Message-ID: <CADnq5_MmsZQynuYPz64UL0jCE3E80MU86RNR4+rM9yGtDqOWgQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: enable gfxoff quirk on HP 705G4
To: Lu Yao <yaolu@kylinos.cn>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 sunil.khatri@amd.com, Prike.Liang@amd.com, Felix.Kuehling@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, liupeng01@kylinos.cn
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

On Fri, Aug 30, 2024 at 3:27=E2=80=AFAM Lu Yao <yaolu@kylinos.cn> wrote:
>
> From: Peng Liu <liupeng01@kylinos.cn>
>
> Enabling gfxoff quirk results in perfectly usable
> graphical user interface on HP 705G4 DM with R5 2400G.
>
> Without the quirk, X server is completely unusable as
> every few seconds there is gpu reset due to ring gfx timeout.
>
> Signed-off-by: Peng Liu <liupeng01@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v9_0.c
> index 2929c8972ea7..bd17e32b432d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -1301,6 +1301,8 @@ static const struct amdgpu_gfxoff_quirk amdgpu_gfxo=
ff_quirk_list[] =3D {
>         { 0x1002, 0x15dd, 0x1002, 0x15dd, 0xc6 },
>         /* Apple MacBook Pro (15-inch, 2019) Radeon Pro Vega 20 4 GB */
>         { 0x1002, 0x69af, 0x106b, 0x019a, 0xc0 },
> +       /* HP 705G4 DM with R5 2400G */
> +       { 0x1002, 0x15dd, 0x103c, 0x8464, 0xd6},
>         { 0, 0, 0, 0, 0 },
>  };
>
> --
> 2.25.1
>

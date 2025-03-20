Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64858A6A79A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 14:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7E110E3A7;
	Thu, 20 Mar 2025 13:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fW/lA2jO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB19B10E0B6;
 Thu, 20 Mar 2025 13:51:45 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2ff5f2c5924so173830a91.2; 
 Thu, 20 Mar 2025 06:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742478704; x=1743083504; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b7erTFxl9qbF0cki4kWlzFBXfpGMesZ1fGg6yms+cYk=;
 b=fW/lA2jOX/8maO9PcGKDx+9kBSELmKH1Bn0jwJYwsbgmaYXWNCVLYoBEZdIe+VFien
 sfEa3D/9gVpEAVSp3tD32Vu4nQPp4cGNc3QKApQ/bODJVELDcXZx8GrB1xTKe+asCASm
 blrh7wOf8sWONql5PuRBaldJNQ3JaIEaH0VioubTuD9D/kLyMJPQS+m+/oe1fjXrgKC7
 3DsMFx8pNSWSaK9ebIzjfb6dd18usJobI+dVgggLc62ISP4W7r33fgQBFzoNVlaZMr/o
 hPekz3V0xbLm2Q+PgR29cD/1DjjMkGVQex+Jc6I92nRIFHMRWuodCLNyumPFFxqBIkgK
 jzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742478704; x=1743083504;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b7erTFxl9qbF0cki4kWlzFBXfpGMesZ1fGg6yms+cYk=;
 b=FCwSmq9ZjrXQFdJJBzWa8dEQBNSYCYhONVAcspN8NpExLCLMBj8sq/H9YFx8lcvTeh
 Wz4kkq+iDdthPexxwvG4ABV5AF0y/styy3XbTUkpLYUDcrZEjbE+K5OF6hwJgdMSw78J
 HLXKHjU0LgF90dXDLZvsZvS5DmwjtOO3vu1Q8qAsSouVaL0rBBgxr863QS4WyXKSQ+eb
 E4O9Dl+L8d8WW6mVCJZpAxkoClOejK/EnyYj8o6OE/cTseciWI+x+3OqYbayRRSDMRFa
 6Af7bR9Qobw+E09c3vOiNjeZP/bn6scXA3rY+NUUXuudujmkVpMdz/mUAZzxCJxF1nqw
 VdbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY9t9U6NDQVNifyUsRDeiE0tmbfu1pvpAdE5aWZHQcbWPznGlZqXrTEVWFpsNgiRyebdzs4bNzwB3K@lists.freedesktop.org,
 AJvYcCWStkZIRhNLnNmEa+7Bt2n1HavP0eLZmDMfJDsmavcA2QnDyVkIRus103VpoIBWp6iUe+qg6KHn@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuGSJouLI+VHjqyOzIWui3dM+3QOhCArlZkmzhVORICPpszDgP
 B17xqXc0AcDBp34GO/oYoBSMdESbMuovgLxgj22BeSEZijcrQiSG9pn2mE6F1XQ7pG6r5ke2yoK
 hCN/1kGD8UXT7Ad5mktKYsgb59rDCS1zp
X-Gm-Gg: ASbGncvuc/8PbN5dZWOhEIhv6yiWIBBL8R+HLTRawCAZ2vkpDWlWuASmlrolS9LoHX9
 lmKMUc7WDuNSLgtk/R0+1XU4OkJSKXDggMpLCPJN2xHNTFiketYyBHlXt7mRvvWPb46EuRtZ6aC
 R6kh2YIQbh/9kASiryZpNe+sF7Yg==
X-Google-Smtp-Source: AGHT+IGZ29ppi8Q/aHl9D3R4X6WxrguirTGL8EmINroDy/P9gN71N9O3DW5RQlxvvWM4c3ickYedZNAqyE1REFlIFYk=
X-Received: by 2002:a17:90b:3e84:b0:2ff:7970:d2bd with SMTP id
 98e67ed59e1d1-301bfc8e80cmr3858419a91.5.1742478704558; Thu, 20 Mar 2025
 06:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250320093517.5247-1-arefev@swemel.ru>
In-Reply-To: <20250320093517.5247-1-arefev@swemel.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 Mar 2025 09:51:32 -0400
X-Gm-Features: AQ5f1Jqe4I4M1h-_f5WGteQV-BugVutwvAg74TEnxpanzpsPBBbz6fU0OuNFIlY
Message-ID: <CADnq5_O+TMVD0B28Q6CgzhAi1aDR5ofjogE18HDXrJOJ1XwbDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm/smu11: Prevent division by zero
To: Denis Arefev <arefev@swemel.ru>
Cc: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lijo Lazar <lijo.lazar@amd.com>, 
 Ma Jun <Jun.Ma2@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
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

On Thu, Mar 20, 2025 at 9:11=E2=80=AFAM Denis Arefev <arefev@swemel.ru> wro=
te:
>
> The user can set any speed value.
> If speed is greater than UINT_MAX/8, division by zero is possible.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 1e866f1fe528 ("drm/amd/pm: Prevent divide by zero")
> Signed-off-by: Denis Arefev <arefev@swemel.ru>

Thanks.  While you are at it, can you fix up all of the other fan
speed cases?  I quick grep shows:
drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c:    tach_period =3D 60 * xclk
* 10000 / (8 * speed);
drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c:    tach_period
=3D 60 * crystal_clock_freq * 10000 / (8 * speed);
drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_thermal.c:
tach_period =3D 60 * crystal_clock_freq * 10000 / (8 * speed);
drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_thermal.c:
tach_period =3D 60 * crystal_clock_freq * 10000 / (8 * speed);
drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c:    tach_period =3D 60
* crystal_clock_freq * 10000 / (8 * speed);
drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:    tach_period =3D 60 *
crystal_clock_freq * 10000 / (8 * speed);
drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c:    tach_period =3D 60 *
crystal_clock_freq * 10000 / (8 * speed);

Thanks,

Alex

> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu=
/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> index 189c6a32b6bd..54229b991858 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> @@ -1200,7 +1200,7 @@ int smu_v11_0_set_fan_speed_rpm(struct smu_context =
*smu,
>         uint32_t crystal_clock_freq =3D 2500;
>         uint32_t tach_period;
>
> -       if (speed =3D=3D 0)
> +       if (!speed || speed > UINT_MAX/8)
>                 return -EINVAL;
>         /*
>          * To prevent from possible overheat, some ASICs may have require=
ment
> --
> 2.43.0
>

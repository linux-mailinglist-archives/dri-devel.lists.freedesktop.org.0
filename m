Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CA3832069
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 21:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CA110E165;
	Thu, 18 Jan 2024 20:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF96B10E165;
 Thu, 18 Jan 2024 20:20:26 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-210b8ec47b3so49035fac.1; 
 Thu, 18 Jan 2024 12:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705609166; x=1706213966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PhrU9+2Wos2GEkaqWKGdWBeUMi5dBl1aaYQCU5q6qoM=;
 b=PjPM7l/IRtyHQCHa+HwRgPvaGKqcKqRdN1eATby4fxlkbB8TK8v5AYrtAY7uYadZPa
 CGkhAohBadtLTouBcYVe0duEogm+HmvbCD3//FocS7somOkhDcyos4H3kdLu1cpF8HyQ
 TFCuIqs168r3ZFzpw/UD4l/YnRWJ7XBDhLQKzgM4fxM1Az3S+aCI7M6sgqTHsbbmuLqj
 fjE4wfrSBwecMNjDf60Gv+GvOqhNouc6mdvbQ6H9hS9Tp0Usm3ehvBxzC+EXq0+//iFX
 vjFsWsQN3X2S127FxfbyTWJiE5ZMCyZOBycj70pA2ZopuBjNrTsJr1ZHQCvuMReg6/hL
 9ZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705609166; x=1706213966;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PhrU9+2Wos2GEkaqWKGdWBeUMi5dBl1aaYQCU5q6qoM=;
 b=sdgvMwM4Wo44tkklwYpxHzA7DtWnExYhHiTc4BZG+KCip8E+gcmfN5oCkzuj16i15g
 /OigEkBeRQmG+0QBxin/tuWB3uoiorwNC363StO3DngFhQBQUljWsjNP1ZNyUnG7JKTj
 zZYUOvzPHyKKDXrPLw6wkXDcVPm0Gi/OIsACi6a8RyEWfWKTAcgBQ5eCYWsBQL7VNmJD
 kF89DfZugyEOdBLAvC10cRYexsxxKYLLUlmZqqXbN9VMZ9DLzeIdR4sUDXOeUiyMh9Gw
 dDZY2kBMNkz1iRaxa0uXHqde8WtG+Ku/i7bEUEvgbIoI/+AgU2OUV5E2LdUO5M7fcD4u
 bApw==
X-Gm-Message-State: AOJu0YwMjaBdfm0EvNMBb9ytJcb8mjR6gnsqgJorx2/wvuKs4891T6Jz
 Plcl1Ij1e9IZJ5nkAD0BBfQ+K3p+3XuxUjOQhBhIuryAq/oumtdPHRU8iUCzOyVR16JZI3mtLEK
 oa2UWp1Gp3IQq6FvnJryXm7Hu6F8=
X-Google-Smtp-Source: AGHT+IHFyv8JqhpnsV52YeCOupboqAMIhZ7qnurgiXLv38ZMbl3Qakmyl9cU6t4jDjiVrNmsHVfPoHNnEZ8KnSXh8dE=
X-Received: by 2002:a05:6871:7827:b0:206:cbc8:1001 with SMTP id
 oy39-20020a056871782700b00206cbc81001mr1533751oac.92.1705609166241; Thu, 18
 Jan 2024 12:19:26 -0800 (PST)
MIME-Version: 1.0
References: <20240117144436.10930-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20240117144436.10930-1-n.zhandarovich@fintech.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Jan 2024 15:19:14 -0500
Message-ID: <CADnq5_MFLxNcKnvT6gr1RBiBoQrnynqQmo9kyKD86+_7pHa4TQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: remove dead code in ni_mc_load_microcode()
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
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
Cc: lvc-project@linuxtesting.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 3:52=E2=80=AFAM Nikita Zhandarovich
<n.zhandarovich@fintech.ru> wrote:
>
> Inside the if block with (running =3D=3D 0), the checks for 'running'
> possibly being non-zero are redundant. Remove them altogether.
>
> This change is similar to the one authored by Heinrich Schuchardt
> <xypron.glpk@gmx.de> in commit
> ddbbd3be9679 ("drm/radeon: remove dead code, si_mc_load_microcode (v2)")
>
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool Svace.
>
> Fixes: 0af62b016804 ("drm/radeon/kms: add ucode loader for NI")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>

Applied both of your patches.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/ni.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/ni.c b/drivers/gpu/drm/radeon/ni.c
> index 927e5f42e97d..8eac8c090433 100644
> --- a/drivers/gpu/drm/radeon/ni.c
> +++ b/drivers/gpu/drm/radeon/ni.c
> @@ -624,7 +624,7 @@ static const u32 cayman_io_mc_regs[BTC_IO_MC_REGS_SIZ=
E][2] =3D {
>  int ni_mc_load_microcode(struct radeon_device *rdev)
>  {
>         const __be32 *fw_data;
> -       u32 mem_type, running, blackout =3D 0;
> +       u32 mem_type, running;
>         u32 *io_mc_regs;
>         int i, ucode_size, regs_size;
>
> @@ -659,11 +659,6 @@ int ni_mc_load_microcode(struct radeon_device *rdev)
>         running =3D RREG32(MC_SEQ_SUP_CNTL) & RUN_MASK;
>
>         if ((mem_type =3D=3D MC_SEQ_MISC0_GDDR5_VALUE) && (running =3D=3D=
 0)) {
> -               if (running) {
> -                       blackout =3D RREG32(MC_SHARED_BLACKOUT_CNTL);
> -                       WREG32(MC_SHARED_BLACKOUT_CNTL, 1);
> -               }
> -
>                 /* reset the engine and set to writable */
>                 WREG32(MC_SEQ_SUP_CNTL, 0x00000008);
>                 WREG32(MC_SEQ_SUP_CNTL, 0x00000010);
> @@ -689,9 +684,6 @@ int ni_mc_load_microcode(struct radeon_device *rdev)
>                                 break;
>                         udelay(1);
>                 }
> -
> -               if (running)
> -                       WREG32(MC_SHARED_BLACKOUT_CNTL, blackout);
>         }
>
>         return 0;

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF5FA3F82F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6C310EA87;
	Fri, 21 Feb 2025 15:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cHtUflbu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960B910E074;
 Fri, 21 Feb 2025 15:14:21 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2fc288da33eso566719a91.0; 
 Fri, 21 Feb 2025 07:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740150861; x=1740755661; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pfuxV1/a1iOlBYIh1qZOG17fTs3BvOvrUMe6IW7OLwg=;
 b=cHtUflbul9IXhq8E4AFZfXG7VqdLCYj6vrDqTZ3LGUoALDoZmTwr9a5Aj47UAv3SRy
 Vo+iowEZsZ35w4dEduSQj1TGyB8L4bM0VezttKh8Fz0qrcRMpBRUI3k8hxsrz9LokBEF
 eF6nqWwJWZoK1EVu+QbIDFXs4jWM3gS+SH2MD4m4SbfFPLGD4ErtVtQXlZn8E0ePx1FW
 Asxkq6bbPUvZXnZdaI5tPsq0S+s9Xcli1pEqHEF67GYnCDJNxBGQERlLABYNji0YFezL
 5a0kEn3TyZZjpdKNl2tQr3v4fmj6PiciyX15xudjpZQJ8LHtT84WVESqJVkMLhWmgXwM
 FmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740150861; x=1740755661;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pfuxV1/a1iOlBYIh1qZOG17fTs3BvOvrUMe6IW7OLwg=;
 b=Lf5hnF0FTSfVzasrB8Gsp0k7QA/jlRbsRZGb1hrEoStL+tT9EO9VQC3AP+0fERdNvD
 XUFFeIClIqBRQcA+ExomcMNU57zXeIrW8DLr7n4Bwf5lL1NK6z+4IJk+XbnguycHF2HJ
 tC9AeKMLTCHX40Tjo7pTfHEW4iBAsV5YjsomqtVWN1vmn1yUEWNXS1LzFq6NJubsZoco
 BtnabbBt1y1ipFKGcAZIsc/vNQVeqKA+rMb0ef3mhQCHhm+yiXju5RfdOKgONTUXoJ02
 Zg5nHCG+IFYAyQMA6sS9N8S7TaZu/SYPHW/lbjNKXOw4UPj4t5hfvqD0rAW5ZTuGMCcd
 KlcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULZ+JUwH+5zorEIySY/dby5dCxxgh4X05AIgguoY1MRlDC2VNkqgjsFnKzgVSzsxQ4gbAkEqqbvx7F@lists.freedesktop.org,
 AJvYcCVW6/yCnmfwgTdcFcwMoAzaga0PHhhuovgDF81DXmP9QIWf8QqHlobiHLXBvaU8Dby1XW1B3ZeJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsCl3oglDlwvfqsU5I5fajwr3uf67rY7z17O/RWvF/F3vLDsKh
 M1sbaxJQX/Cn38SFZDp0RdlsVi+CqS5zSQtA1qPcNkpc+a3XSmziIGaSRuA+2W/lZ2jby9tGEdv
 auzta86SRUc1G4Lvathzq7CAjtao=
X-Gm-Gg: ASbGnctpdghF5cD2KYIaFubcXE/QKmhdYBpHpash+LOFTRfz8CJAX5vL/jJX2EGcajs
 MZNe24bPJUsBqQvcuf4AuY5875eplGoKe920wNnh5ZAeaHcAg0JoMYbkSKEUC/9K5JcFpu71WUK
 I+eHKzets=
X-Google-Smtp-Source: AGHT+IEibl4fc95czZrJ4RgjP2PVjpAMh5E+9z87AN8A6HGQUPD765UBJ1i70Y4tZ/mfnjgzkJ/UPsVt1W+kY8JBFCA=
X-Received: by 2002:a17:90b:3907:b0:2fc:f63:4b6a with SMTP id
 98e67ed59e1d1-2fce75f086bmr2217993a91.0.1740150861088; Fri, 21 Feb 2025
 07:14:21 -0800 (PST)
MIME-Version: 1.0
References: <20250220064050.686-1-vulab@iscas.ac.cn>
In-Reply-To: <20250220064050.686-1-vulab@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Feb 2025 10:14:08 -0500
X-Gm-Features: AWEUYZlIX0qqP3tQtVUCU2K3fHzr-Gp8foCznDfOxPvXltvgscdn0oDEaXfnBjE
Message-ID: <CADnq5_PLNRJarsrJ9i9Q166Yj50CN2sJZSR5uOfokjNUhYDx1g@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Add error handlings for r420 cp errata
 initiation
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
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

On Thu, Feb 20, 2025 at 1:41=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> In r420_cp_errata_init(), the RESYNC information is stored even
> when the Scratch register is not correctly allocated.
>
> Change the return type of r420_cp_errata_init() from void to int
> to propagate errors to the caller. Add error checking after
> radeon_scratch_get() to ensure RESYNC information is stored
> to an allocated address. Log an error message and return the
> error code immediately when radeon_scratch_get() fails.
> Additionally, handle the return value of r420_cp_errata_init() in
> r420_startup() to log an appropriate error message and propagate
> the error if initialization fails.
>
> Fixes: 62cdc0c20663 ("drm/radeon/kms: Workaround RV410/R420 CP errata (V3=
)")
> Cc: stable@vger.kernel.org # 2.6.33+
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/radeon/r420.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r420.=
c
> index 9a31cdec6415..67c55153cba8 100644
> --- a/drivers/gpu/drm/radeon/r420.c
> +++ b/drivers/gpu/drm/radeon/r420.c
> @@ -204,7 +204,7 @@ static void r420_clock_resume(struct radeon_device *r=
dev)
>         WREG32_PLL(R_00000D_SCLK_CNTL, sclk_cntl);
>  }
>
> -static void r420_cp_errata_init(struct radeon_device *rdev)
> +static int r420_cp_errata_init(struct radeon_device *rdev)

You changed the function signature, but you didn't adjust the function
behavior to match.

Alex

>  {
>         int r;
>         struct radeon_ring *ring =3D &rdev->ring[RADEON_RING_TYPE_GFX_IND=
EX];
> @@ -215,7 +215,11 @@ static void r420_cp_errata_init(struct radeon_device=
 *rdev)
>          * The proper workaround is to queue a RESYNC at the beginning
>          * of the CP init, apparently.
>          */
> -       radeon_scratch_get(rdev, &rdev->config.r300.resync_scratch);
> +       r =3D radeon_scratch_get(rdev, &rdev->config.r300.resync_scratch)=
;
> +       if (r) {
> +               DRM_ERROR("failed to get scratch reg (%d).\n", r);
> +               return r;
> +       }
>         r =3D radeon_ring_lock(rdev, ring, 8);
>         WARN_ON(r);
>         radeon_ring_write(ring, PACKET0(R300_CP_RESYNC_ADDR, 1));
> @@ -290,8 +294,11 @@ static int r420_startup(struct radeon_device *rdev)
>                 dev_err(rdev->dev, "failed initializing CP (%d).\n", r);
>                 return r;
>         }
> -       r420_cp_errata_init(rdev);
> -
> +       r =3D r420_cp_errata_init(rdev);
> +       if (r) {
> +               dev_err(rdev->dev, "failed initializing CP errata workaro=
und (%d).\n", r);
> +               return r;
> +       }
>         r =3D radeon_ib_pool_init(rdev);
>         if (r) {
>                 dev_err(rdev->dev, "IB initialization failed (%d).\n", r)=
;
> --
> 2.42.0.windows.2
>

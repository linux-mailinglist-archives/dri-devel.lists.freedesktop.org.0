Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD5AAB3C7A
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 17:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4DF10E433;
	Mon, 12 May 2025 15:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JeJAWfgZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0F210E440;
 Mon, 12 May 2025 15:43:17 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b1f2a3bf3c8so457726a12.1; 
 Mon, 12 May 2025 08:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747064597; x=1747669397; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5DCiZAB2+AHNjbQHgMhnHuF9a/a/vBov8+0bK91zfOc=;
 b=JeJAWfgZLLPHNrpfSuSnsWrq8LmOUgaYP65q7DG+PAC2JMoiCPygCy/km3M0Ghu2oB
 mpgIyXK5XkGwPqrfE66UQ5M74ggET9kJYLqWqKkpM6FOfUg6vqFATQFW3S/Ssf9fZRFs
 c8sBd4SQXSHT5FcO9JSV8QLVbeqr7yGHffKtxfsKw8Yp3IoyY1cJ3au/2hNlY/O/M3CX
 7sIuxHTzwbXG/NVxycaY7EHX9UpzYabS2kQ/WraDa2YRXTEKif0xTEZ1dqlM2oPdHNk+
 aey5r5FOJEBsKaCjd1GRpHiN7NI5ERHE4mbkysvCtZaSy44YQyZiYSia+oJCqJybYgxe
 LfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747064597; x=1747669397;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5DCiZAB2+AHNjbQHgMhnHuF9a/a/vBov8+0bK91zfOc=;
 b=cdEwoVKBXcJXtb5lytV4D3P7SxKRHz6D2hvB/M1uyMHOuMS2NmunzoMdw/L/BqLo6U
 70yym8SBXf1PmDbFHql2q/08VIqFugB5VKepekZK729yeIepWicLCNvT0L33kqsawChq
 KsAczUb4qQlwMqU1iXKQsBif9E89ulKaHP5imNIH4KmebeWB2It9FSui21JT7ZLDpFeo
 /uwYBwQ8etN7KwMRrjFiKNfBF8ixgP7eYud17KPcIsdH/U+GrSBdZTh4Yv2j+bRtAA/S
 AeZZuG2w+4jMcKfhPG8bPkbhOtzXGLb0N4CPsDTXdq48Oc1vPK+osap+DmJmDrJCudJP
 cpRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpYXdujZvDzhcmfHgWCCp6Nn4C9BR+b6qNBf6nK4W6lKdf7kuU0MQZ+lWBeEXfjYUJW//BzSZY@lists.freedesktop.org,
 AJvYcCXEx+5iJxvNz8uIXR8j0+557xkla+V84BZTB+0WDvSDW4MbAArf+20YnLNHvYLD52RI/YHeBXLV0ZE0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznJs84zs5w8G+ceJsiMJrbwSErMpIf8ANQpaTAEBF86iQpAZgL
 hhqFunw6WfCJHpTuQC2O2y5kAA1ZGehcpt8z/PcI5ExhoaHDHEnMhmAkOkDXGnlKWzvUWA0A+pL
 5W9dNa2kgsjIeysuWtQY9JBxMltg=
X-Gm-Gg: ASbGncteDCYGK6wHJ/wSDArwytkeZncNzulLcrEOJThg37CYspCrlpoSEEwakU03joj
 qMp3OwAwqdIBGHw53ccsJVCTiwRJ82CFSYcUUUtSKxQ/ySO0jcLn995O4SjFjTBhaLOqyXmy85d
 SMNcNvk5GT6duaiMUw7jhN3ra8nmtxra0y73BjWrLO1p8=
X-Google-Smtp-Source: AGHT+IGyMJ8boT1OFIvqC4soG2njSbaP6iXkHsGtYUMXF8XKSrBuXCei4FSoQXyHUvyDr/sou0DRoMYWlQQaeCeGr4M=
X-Received: by 2002:a17:902:ecd1:b0:224:1001:6777 with SMTP id
 d9443c01a7336-22fc8b402b1mr80871515ad.4.1747064597255; Mon, 12 May 2025
 08:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250418002117.130612-1-linux@treblig.org>
 <20250418002117.130612-3-linux@treblig.org>
 <ab85b3c9-46cc-4148-9de5-dcaabea130ea@wanadoo.fr> <aCCQKkg6e3yPZmSU@gallifrey>
In-Reply-To: <aCCQKkg6e3yPZmSU@gallifrey>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 12 May 2025 11:43:05 -0400
X-Gm-Features: AX0GCFtL2FloAcVeybWAmvQ0Iyx-tNCGmRDlrrcYLXe0z65NAcyir1zr9TU8zg0
Message-ID: <CADnq5_PECpX173wZOPV8VASyoQhDWkJnqvsh61zGwsiZqmNMBw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/radeon: Remove unused radeon_doorbell_free
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alexander.deucher@amd.com, 
 harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Sun, May 11, 2025 at 8:13=E2=80=AFAM Dr. David Alan Gilbert
<linux@treblig.org> wrote:
>
> * Christophe JAILLET (christophe.jaillet@wanadoo.fr) wrote:
> > Le 18/04/2025 =C3=A0 02:21, linux@treblig.org a =C3=A9crit :
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > >
> > > radeon_doorbell_free() was added in 2013 by
> > > commit 75efdee11b5d ("drm/radeon: implement simple doorbell page
> > > allocator")
> > > but never used.
> >
> > Hi,
> >
> > I think than instead of being removed, it should be used in the error
> > handling path of cik_init() and in cik_fini().
>
> OK, here's an RFC that builds; but if I understand correctly only
> some devices run this code, and I'm not sure mine does;
>
> Thoughts?
>
> Dave
>
> From 15b3830b4ee3eb819f86198dcbc596428f9ee0d0 Mon Sep 17 00:00:00 2001
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> Date: Sun, 11 May 2025 02:35:41 +0100
> Subject: [RFC PATCH] drm/radeon/cik: Clean up doorbells
>
> Free doorbells in the error paths of cik_init and in cik_fini.
>
> Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/radeon/cik.c | 38 ++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index 11a492f21157..3caa5a100f97 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -8548,7 +8548,7 @@ int cik_suspend(struct radeon_device *rdev)
>   */
>  int cik_init(struct radeon_device *rdev)
>  {
> -       struct radeon_ring *ring;
> +       struct radeon_ring *ring, *ringCP1, *ringCP2;

I'd prefer ring_cp1 and ring_cp2 for readability.

>         int r;
>
>         /* Read BIOS */
> @@ -8623,19 +8623,22 @@ int cik_init(struct radeon_device *rdev)
>         ring->ring_obj =3D NULL;
>         r600_ring_init(rdev, ring, 1024 * 1024);
>
> -       ring =3D &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
> -       ring->ring_obj =3D NULL;
> -       r600_ring_init(rdev, ring, 1024 * 1024);
> -       r =3D radeon_doorbell_get(rdev, &ring->doorbell_index);
> +       ringCP1 =3D &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
> +       ringCP2 =3D &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
> +       ringCP1->ring_obj =3D NULL;
> +       ringCP2->ring_obj =3D NULL;
> +       ringCP1->doorbell_index =3D RADEON_MAX_DOORBELLS;
> +       ringCP2->doorbell_index =3D RADEON_MAX_DOORBELLS;
> +
> +       r600_ring_init(rdev, ringCP1, 1024 * 1024);
> +       r =3D radeon_doorbell_get(rdev, &ringCP1->doorbell_index);
>         if (r)
>                 return r;
>
> -       ring =3D &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
> -       ring->ring_obj =3D NULL;
> -       r600_ring_init(rdev, ring, 1024 * 1024);
> -       r =3D radeon_doorbell_get(rdev, &ring->doorbell_index);
> +       r600_ring_init(rdev, ringCP2, 1024 * 1024);
> +       r =3D radeon_doorbell_get(rdev, &ringCP2->doorbell_index);
>         if (r)
> -               return r;
> +               goto out;
>
>         ring =3D &rdev->ring[R600_RING_TYPE_DMA_INDEX];
>         ring->ring_obj =3D NULL;
> @@ -8653,7 +8656,7 @@ int cik_init(struct radeon_device *rdev)
>
>         r =3D r600_pcie_gart_init(rdev);
>         if (r)
> -               return r;
> +               goto out;
>
>         rdev->accel_working =3D true;
>         r =3D cik_startup(rdev);

I think you can drop the doorbells in the error case for cik_startup()
as well since they won't be used in that case.

Alex

> @@ -8678,10 +8681,16 @@ int cik_init(struct radeon_device *rdev)
>          */
>         if (!rdev->mc_fw && !(rdev->flags & RADEON_IS_IGP)) {
>                 DRM_ERROR("radeon: MC ucode required for NI+.\n");
> -               return -EINVAL;
> +               r =3D -EINVAL;
> +               goto out;
>         }
>
>         return 0;
> +
> +out:
> +       radeon_doorbell_free(rdev, ringCP1->doorbell_index);
> +       radeon_doorbell_free(rdev, ringCP2->doorbell_index);
> +       return r;
>  }
>
>  /**
> @@ -8695,6 +8704,7 @@ int cik_init(struct radeon_device *rdev)
>   */
>  void cik_fini(struct radeon_device *rdev)
>  {
> +       struct radeon_ring *ring;
>         radeon_pm_fini(rdev);
>         cik_cp_fini(rdev);
>         cik_sdma_fini(rdev);
> @@ -8708,6 +8718,10 @@ void cik_fini(struct radeon_device *rdev)
>         radeon_ib_pool_fini(rdev);
>         radeon_irq_kms_fini(rdev);
>         uvd_v1_0_fini(rdev);
> +       ring =3D &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
> +       radeon_doorbell_free(rdev, ring->doorbell_index);
> +       ring =3D &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
> +       radeon_doorbell_free(rdev, ring->doorbell_index);
>         radeon_uvd_fini(rdev);
>         radeon_vce_fini(rdev);
>         cik_pcie_gart_fini(rdev);
> --
> 2.49.0
>
>
> --
>  -----Open up your eyes, open up your mind, open up your code -------
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/

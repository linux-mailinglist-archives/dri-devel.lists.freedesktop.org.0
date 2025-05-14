Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32DCAB6E00
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 16:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2828210E277;
	Wed, 14 May 2025 14:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fXOjCNRs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEF310E22B;
 Wed, 14 May 2025 14:19:54 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7376e00c0a2so886463b3a.3; 
 Wed, 14 May 2025 07:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747232394; x=1747837194; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCWsXRxmXy6QdMutDWOCFJCtCkw/mbPHpF2mtN1WEno=;
 b=fXOjCNRsZWAobJpe5UvSYHgLc4j4SAo9/wft0+/0QE/hG+kRJuqr9glgDvoaogZdTC
 7MqJ0O1wxPJ5Kc1meSOYiJusCf2rYTXGuENeq67gIGubVbcGx12XkM6J2YUt3WQXZ+Vj
 9bAE0p6HKq3qcyBeAu4iIRG0rp8VrPwFPcChPYhEGVTF/uZ++uWVSMa5gVMUTDdhs9JX
 o0Uc2+usIA8Dpa2xrDL9DIz80RWl7/gIU7Kam0JbgmvmECDB2FYr427+vr0bBwh0orwS
 iIzwa8vwMw2wqgSkLSQ4dlWJQcnJ88O1F8KKwuHBCte/q/Y5CoZACTF8KCIrB2ZWNYnC
 vssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747232394; x=1747837194;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UCWsXRxmXy6QdMutDWOCFJCtCkw/mbPHpF2mtN1WEno=;
 b=kHGu7DY0PUISyrLdxVgDBkrjFyNIaHyCX5jisGhHYmmaBMN9qaGiwWedJWoLYWWYp2
 IgZXF669qYsgTGCS/YP5TXuZlh1Ugpmc5UYm4BL6fPRLwdh8Nrjr+TB63y8uhhITHcAK
 BqnxHzkNcxWtv2a7pLBG226kjktulj/CTgzc/4EAHfLCr4yoBUnX8cAynfLz1ThYE2H0
 bg254yNt/XMUtZEhsv2iK4DCMQ4RNUYC2Hnk28kw5+TE63RRy02BiyW1wcdWO1d62+Nh
 fz9zPVtf0uc0i3Xt4Mk7FwBuWDW3dlDKhHuhfsj7OXtvpR/gG1sVSiMGZleJizm8J3SD
 nGHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnbTIjHp6leZtB3rZNMwSQFmFS8pQNgxU2QtMr/EMQRoxEFMj7V6E9KvdLFLphPIBbyCj7Ac2w@lists.freedesktop.org,
 AJvYcCXBkVjAvq2nV7Av1a2OKS+n+LiCGDgSTgkX7SicvkiRkfMQs2bPKxl5tasiBr1Uouw3dVPuiivgZQWf@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1CVxIFkLdC2vRNWWK2DZpsTjuMfTHSZdYaVIbAc5GotdkhgAf
 /Kq/1bZuH1cRS/UQ46lnrffTGoap2me/RkRlxBTW+pkfJNKvReEZIHSSf8R49rkG6SPOsvqPymd
 uugwUeE31rnhu07VRXyUCj5azEgI=
X-Gm-Gg: ASbGncsP9mnuemb/uFlcAXJATqaqU2e22/06K+VQdz6x+iV9b6vm4iShoJcXRtxGAZc
 bhW9eX9SS8ML/GWdZCpWhpYewzIiJRbiESw5lTQvio8iBqOe+BdFNaZNwXT8YJRyrynwolfudeU
 ruH0CCLJfWazhLdbsmdDLhh8FYFoeJ1/jo
X-Google-Smtp-Source: AGHT+IFmSfpurhemLwc+ZOF8rZWME7jh33OjnpZDBlz8vLnAa0zqEy2lMLnutVH+y3PAEEspBAxozniI7M430eNACkY=
X-Received: by 2002:a17:903:2f8d:b0:224:88c:9255 with SMTP id
 d9443c01a7336-2319810fdf6mr22460295ad.3.1747232394295; Wed, 14 May 2025
 07:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250514011610.136607-1-linux@treblig.org>
In-Reply-To: <20250514011610.136607-1-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 May 2025 10:19:42 -0400
X-Gm-Features: AX0GCFvKCnzC_zdkgna2rr71SSUfv7aXR8OPd3gdZJqS1dVizK6WKhUHuuj4ZSc
Message-ID: <CADnq5_PK-orH987qxNkArVFWEW2hE5UrRhX7oR2J4+4dAH=wGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/cik: Clean up doorbells
To: linux@treblig.org
Cc: alexander.deucher@amd.com, christophe.jaillet@wanadoo.fr, 
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

On Tue, May 13, 2025 at 9:53=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> Free doorbells in the error paths of cik_init and in cik_fini.
>
> Build tested only.
>
> Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied.  Thanks!

Alex

> ---
> RFC->v1
>   Renamed ringCP[12]->ring_cp[12]
>   Cleaned up doorbells in cik_startup failure case
>
>  drivers/gpu/drm/radeon/cik.c | 42 +++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index 11a492f21157..51a3e0fc2f56 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -8548,7 +8548,7 @@ int cik_suspend(struct radeon_device *rdev)
>   */
>  int cik_init(struct radeon_device *rdev)
>  {
> -       struct radeon_ring *ring;
> +       struct radeon_ring *ring, *ring_cp1, *ring_cp2;
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
> +       ring_cp1 =3D &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
> +       ring_cp2 =3D &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
> +       ring_cp1->ring_obj =3D NULL;
> +       ring_cp2->ring_obj =3D NULL;
> +       ring_cp1->doorbell_index =3D RADEON_MAX_DOORBELLS;
> +       ring_cp2->doorbell_index =3D RADEON_MAX_DOORBELLS;
> +
> +       r600_ring_init(rdev, ring_cp1, 1024 * 1024);
> +       r =3D radeon_doorbell_get(rdev, &ring_cp1->doorbell_index);
>         if (r)
>                 return r;
>
> -       ring =3D &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
> -       ring->ring_obj =3D NULL;
> -       r600_ring_init(rdev, ring, 1024 * 1024);
> -       r =3D radeon_doorbell_get(rdev, &ring->doorbell_index);
> +       r600_ring_init(rdev, ring_cp2, 1024 * 1024);
> +       r =3D radeon_doorbell_get(rdev, &ring_cp2->doorbell_index);
>         if (r)
> -               return r;
> +               goto out;
>
>         ring =3D &rdev->ring[R600_RING_TYPE_DMA_INDEX];
>         ring->ring_obj =3D NULL;
> @@ -8653,12 +8656,16 @@ int cik_init(struct radeon_device *rdev)
>
>         r =3D r600_pcie_gart_init(rdev);
>         if (r)
> -               return r;
> +               goto out;
>
>         rdev->accel_working =3D true;
>         r =3D cik_startup(rdev);
>         if (r) {
>                 dev_err(rdev->dev, "disabling GPU acceleration\n");
> +               radeon_doorbell_free(rdev, ring_cp1->doorbell_index);
> +               radeon_doorbell_free(rdev, ring_cp2->doorbell_index);
> +               ring_cp1->doorbell_index =3D RADEON_MAX_DOORBELLS;
> +               ring_cp2->doorbell_index =3D RADEON_MAX_DOORBELLS;
>                 cik_cp_fini(rdev);
>                 cik_sdma_fini(rdev);
>                 cik_irq_fini(rdev);
> @@ -8678,10 +8685,16 @@ int cik_init(struct radeon_device *rdev)
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
> +       radeon_doorbell_free(rdev, ring_cp1->doorbell_index);
> +       radeon_doorbell_free(rdev, ring_cp2->doorbell_index);
> +       return r;
>  }
>
>  /**
> @@ -8695,6 +8708,7 @@ int cik_init(struct radeon_device *rdev)
>   */
>  void cik_fini(struct radeon_device *rdev)
>  {
> +       struct radeon_ring *ring;
>         radeon_pm_fini(rdev);
>         cik_cp_fini(rdev);
>         cik_sdma_fini(rdev);
> @@ -8708,6 +8722,10 @@ void cik_fini(struct radeon_device *rdev)
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

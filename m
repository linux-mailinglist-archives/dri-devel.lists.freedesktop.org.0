Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D432CAE86C7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 16:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1765E10E744;
	Wed, 25 Jun 2025 14:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZXjRawg1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DE810E742;
 Wed, 25 Jun 2025 14:41:11 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-312efc384fcso937987a91.3; 
 Wed, 25 Jun 2025 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750862471; x=1751467271; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lu5oUiavdQkZJLBux8bj7ZE1cpoU9zj5JJzDzDi2sjk=;
 b=ZXjRawg1GgUxmbzYyBcn4ktxzksJT+X57dlsfM/PGyim0Mpv9hu2bx7u/2WHdblDU4
 Ivv1YZaJKbdwwP9H2fiyD0YFkHg3e157zEPscl1mUigGO7nXfOL4PuGy96lcplPME8Ex
 hdrge01HcF9hPR2bLwxzLUp3UWwGrnPmlxM+k/BkMedd/nc8EyO2EH1lCc2hikjvyCgg
 bF8ft/UQDm/YMOoHjVy8qjqivO7owJESq/d8PRzgnj/UF8GspHv7NNxFNP5/YOOb5dF+
 e5AAEjp3wR5pP7vDKVgoXUVH0E9gCzXenwgpTVrxPJQtDOrkxqgOY9KZtQ3WJD9h5vSN
 pvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750862471; x=1751467271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lu5oUiavdQkZJLBux8bj7ZE1cpoU9zj5JJzDzDi2sjk=;
 b=ZB9+m62V5+E0fKTqTdobodxTqB/iOD8FxYw+ycD7nrUq5IM8o7eBBU0TJ1Ld1SJmG8
 sNtQoKYWF1cF8Eb6pMawBxphzjHPYpf8SIfjfScPB6GBRNgI62UXHVRG2ax8rCrp9SHJ
 0Ssr3upy5Am0ZyOltuC1WvDZSCFviA1zndKPHhZfizGm7f7ZJWODFW+eBz6LyuzVrO3r
 atJClC1+cIxotjTL7+CDluYFhHGUOacp+hg/kN0U0ZW4AHBj9uti8QCNefwW5TXxR0po
 aluHaFgeWaC7ZnNzb+mU0lQCBF2qI438sS8tKUH88BoTjo5p3xJOBd/ld49+4UhdyaOD
 FO5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3DhtuMryvOiW0fLV8EjK1TeUKP9NAhgPruKvCuq1xMsqkOcQ78fvsSZny/MlxHwxO1Jo6OTAf6X4I@lists.freedesktop.org,
 AJvYcCXn9YM3HbiN4qa39Xx84l3JXr7wEbt3SgXEvyyaPlFcUyK8jfh9W6mwbkpW8DCN1M8AwKs43SrT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTNaUeDz+l3++ESmrmYWAtF1Fjf7ZlzzTMTCW83LZ9DT9uwQbF
 ybUeO/8wMtgD+sh5sAmHqa5QY3dymW/9m/Ot5lirBEaST+d+i6aZLY1i7Uc+t3jsc72TxoXkuw2
 mTamZOP+aJd2Q0RiTfHZU9yDWdxPdAVI=
X-Gm-Gg: ASbGncvEyeCXitQwgo1NftGIo7q3oSZjgUXNPQMVyN2BO6HtewqeJRQXQbTYr23CSlj
 aFZC46SAU7fLEZXP2GHeUQ3Ezbvt+kamtJTMICHbj1BsOnUtz2g7VAYmpzRRaSy6k4+g7KbCIPL
 3G2u+gZFUSwgJ6l8/qVts+tdeRQSsft3qylYUs7ovz9IZK
X-Google-Smtp-Source: AGHT+IHadyQR/HZ3pPHSZknX/K7vL2y/CWV3PGa+FeKMl8cI/3Fs4WIMokIKDxHEc4Ux8qeYTO7Q17rAKABE9wRA/ZM=
X-Received: by 2002:a17:90b:35c6:b0:311:488:f506 with SMTP id
 98e67ed59e1d1-315f26b869fmr1807111a91.6.1750862470763; Wed, 25 Jun 2025
 07:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250625084314.414044-1-tzimmermann@suse.de>
 <1f6b8e22-8608-4026-a306-3b4d38fb8027@amd.com>
In-Reply-To: <1f6b8e22-8608-4026-a306-3b4d38fb8027@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Jun 2025 10:40:58 -0400
X-Gm-Features: AX0GCFu2ss00rKDDOoN8VI0e-rOG-ZiWa3DSfgfqrTyh33BNhVSbv6s9MdQzIoI
Message-ID: <CADnq5_N1b59pmKJY1kH=j76a8w6_Bnpyu_V3ZdCJnb1v-kBgLw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/amd: Avoid using import_attach directly
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@gmail.com, 
 simona@ffwll.ch, sumit.semwal@linaro.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Wed, Jun 25, 2025 at 7:25=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 25.06.25 10:42, Thomas Zimmermann wrote:
> > The field import_attach of struct drm_gem_object is often only
> > required by PRIME code. In other places, replace its use with
> > clearer alternatives.
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for the enti=
re series.
>

Thomas,

Feel free to take them via whatever tree makes sense if you have
further work that depends on these, otherwise, let me know and I can
pick them up.

Alex

> >
> > v2:
> > - keep amdgpu_bo_print_info() as-is (Christian)
> >
> > Thomas Zimmermann (2):
> >   drm/amdgpu: Test for imported buffers with drm_gem_is_imported()
> >   drm/amdgpu: Use dma_buf from GEM object instance
> >
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  2 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  4 ++--
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  5 ++---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 10 +++++-----
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  2 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  6 +++---
> >  6 files changed, 14 insertions(+), 15 deletions(-)
> >
>

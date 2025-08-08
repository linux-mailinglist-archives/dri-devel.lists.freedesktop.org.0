Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA82B1EBD9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 17:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B207510E962;
	Fri,  8 Aug 2025 15:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bjOx2nIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B9310E0CF;
 Fri,  8 Aug 2025 15:28:24 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-24286ed452fso3124815ad.1; 
 Fri, 08 Aug 2025 08:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754666904; x=1755271704; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xaFrKONgoeL4lo44H8m0yP1sT0L2wqE/7af3cuPE8mM=;
 b=bjOx2nIoL1/GdEfIXWpP3OCy4Yr1dsNhb9yBHvEvdpyFZwzODzdvWxSLGfDzjM0YwT
 4ylC9nTK78WlUVmlAlF/6wJ+aYH62Ya3bqkUrU9z352pLBz02ArzdZwWBezvYSMhggri
 MtAMlJW05RaGMKETcqXW0/GglMZ5MNSRIaCDappFHCljuJiaxsJyFV1xxL+NJKajscNy
 ufWsi3ugjJCGcaFrqCf4p8xkWFH6d28VUIjoIlehvMyh3oOFJBB2oiSMEScmPSBAukPn
 SRtof48v0vamfUmg9qVU7NMMoMuyg82KYcZCr4TLyWDCsD2z4bH5HtQXeeiC89jpLqXM
 jnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754666904; x=1755271704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xaFrKONgoeL4lo44H8m0yP1sT0L2wqE/7af3cuPE8mM=;
 b=hi1wV8rNTD+aOOAE9S9nX3J4godLxoLhxuE0MxiG5Gx/WCoPlb3We9f764vnGR6rSI
 gATpcy41pMlwMN+HWD4XwfXGiNC+13T5nj3Wum3xGp9e9WZWMSsP3vwr1ABhdVunEWUy
 Q1tDS4caK0EcHNfqaiAy72kX1hFnhe/omhnxCoChVLL8Qe88wW4i1cPJGZoMObzO70dH
 HXlxhqb9esafGXh6VjaNCxBCx+zbnrXopiZO1UdOYtKod4LpD1smDGxi4e3bCMXMPy3m
 Lk5mbEKITIrHU5m5P+We3B1PVf+ebpLic9WTCwkBTNvTSgwmHNSRWrMG9TyjG6VGRy4M
 veVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMLidq6YEXXrh+FweEcwbnEuEgXsR5B+8Jmbcek3/9w5R0yAaJzZNl4iTKPb84DFLxIA9kmLTG@lists.freedesktop.org,
 AJvYcCX4i3p6Wu921u00W06d3749zP51FYD/WLBjSj0yYPgpeLMOGjy0CVD99Acxwe3KhvtbnJCZKzLdZdeI@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1Tr07thgsr0nOPhDl0AryKBtt2UDJB83lWxiCNhGzBWbpZ6C9
 hMONB5tb2il8AT2ItsT8C5IY0OL0Q6Pxrn7Yv2Vx/eO/qUqRvV4b188y/9YwwpIcLhhl+QMbjNA
 SIn9SHfjZ8K5PDvjgczEJqDZd6IGtII8=
X-Gm-Gg: ASbGnctFOJtgWLVIA6kPAYfwTsRpl3SSh7eNUKpuD3EAsvbi5QW66tRU1U1n/JrTR1t
 mnrp8DkfGLTwNw+AIeQz0Y8VAipnK+fR8sPuxvxC2kkHTnu3nQ1wDJNGEvMpy+V+vhPC+ZoK6Ja
 668/hLT8oIPwsNLkVfn27xDGiGPV+jaiu8lf8sg2b7KfTWw0nxbvgrpPl78ql2F5uz/8CgN4ujA
 v1b3E8=
X-Google-Smtp-Source: AGHT+IFzRj3NfvXhNRMeD3rfS4OdzgKDkzQX8MeXfQwdZ7fG5fJW/ZicXqdjPbYU0XmStRk+Dm+B6kak+q+dt9nZcq4=
X-Received: by 2002:a17:903:18c:b0:240:3e41:57a3 with SMTP id
 d9443c01a7336-242c19a673fmr25580745ad.0.1754666903728; Fri, 08 Aug 2025
 08:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250806-amdgpu_typo-v1-1-b5a3cb84ce26@uniontech.com>
 <6e5b5c47-a97c-4757-ac0d-361c91fd5819@amd.com>
In-Reply-To: <6e5b5c47-a97c-4757-ac0d-361c91fd5819@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Aug 2025 11:28:12 -0400
X-Gm-Features: Ac12FXzCfzGrH3JJl3Jc7p_DPcZK5W4BmsxzZKT8lvCDvMABrJkVyay7b_pzNV4
Message-ID: <CADnq5_MXNfXfjKZo6VRXk8xBr=TRbQzHGq2-7HyHuBcCtF+KPA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix incorrect comment format
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: cryolitia@uniontech.com, Alex Deucher <alexander.deucher@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 wangyuli@uniontech.com, zhanjun@uniontech.com, guanwentao@uniontech.com
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

On Wed, Aug 6, 2025 at 8:38=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 06.08.25 05:34, Cryolitia PukNgae via B4 Relay wrote:
> > From: Cryolitia PukNgae <cryolitia@uniontech.com>
> >
> > Comments should not have a leading plus sign.
>
> Good catch, potentially a left over from a merge conflict or similar.
>
> >
> > Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c b/drivers/gpu/drm/a=
md/amdgpu/nbio_v7_4.c
> > index d5002ff931d841994ca2c70cdf5b989f5b3c59d6..860bc5cb03c81b5346743b5=
fb46a7dcbe5a201a4 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> > @@ -151,9 +151,9 @@ static void nbio_v7_4_sdma_doorbell_range(struct am=
dgpu_device *adev, int instan
> >                *   BIF_SDMA0_DOORBELL_RANGE:  0x3bc0
> >                *   BIF_SDMA1_DOORBELL_RANGE:  0x3bc4
> >                *   BIF_SDMA2_DOORBELL_RANGE:  0x3bd8
> > -+             *   BIF_SDMA4_DOORBELL_RANGE:
> > -+             *     ARCTURUS:  0x3be0
> > -+             *     ALDEBARAN: 0x3be4
> > +              *   BIF_SDMA4_DOORBELL_RANGE:
> > +              *     ARCTURUS:  0x3be0
> > +              *     ALDEBARAN: 0x3be4
> >                */
> >               if (adev->asic_type =3D=3D CHIP_ALDEBARAN && instance =3D=
=3D 4)
> >                       reg =3D instance + 0x4 + 0x1 +
> >
> > ---
> > base-commit: 6bcdbd62bd56e6d7383f9e06d9d148935b3c9b73
> > change-id: 20250806-amdgpu_typo-80869b122c36
> >
> > Best regards,
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8956B72090F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 20:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E3C10E5F7;
	Fri,  2 Jun 2023 18:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F4810E5F0;
 Fri,  2 Jun 2023 18:23:12 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-557f3159a34so1058341eaf.2; 
 Fri, 02 Jun 2023 11:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685730190; x=1688322190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wPPbGQG2A4DDUN/YGohD/TGb1d9QQtBg0RaPc36PrpY=;
 b=AunarUqlKHvr+qASkx7HSnX5+ALP5AnzOCGrhpN5es4q/5pZ/tlGc1ZrAAHeQzU8+s
 +iXgmXC2VcRkjLjiRCIRPPgTU073LvEu3vC2X/Dlrc09bzkOA5aWaBWURbERw8c4N67Q
 v0eEg2f2ISKwtfwrG3emylwy1i+Bf7sClBCumE1rPKhWlKhxTUvDWXpobioBMn/uwcop
 4WIrcbA8kVCZ1Qz0Vmax+GvABOP/Au9xydNS9cYmCgUg4H3EPvPQ2+Ngx3/tWapGZWZq
 5yFOfr2pBik8CtRqq21aVtn3yW5JBcVcqTb4+MWbxu4YsCWvgDnueCIE3hKr+FievzvL
 ZtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685730190; x=1688322190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wPPbGQG2A4DDUN/YGohD/TGb1d9QQtBg0RaPc36PrpY=;
 b=YQqMYRMTVyc5XXXWyBhoeXaoO4bA306up8Ya7w0ADmUoyopZhE0zBsN+lYRHl/0YT2
 8/qlr/7IqAIGlx2RRDCsBuo/wg4lejR4ryiyEEPLrgH1s339XH/Roo0fJR4UlBCt5Lol
 LSBWZKHX3B82/xLZb3LmVrvbHObBqqvGJ6bQ3o+shkbg8ihCYl9jQh6vW9Vf447xLaq4
 yy0v1Qrnq3JDyLPjT4dr+kDYAapoymWMibmjIV0u3Spzzx+I6ndlvu1/QEHNgpFYLXJQ
 E0o+gzDbk4OCL/P/UPH+/sjBQijhtgM8sVlZR75JTaf+QLj6QFl28lidJ3uObYW319Ye
 Xqcw==
X-Gm-Message-State: AC+VfDy0IDvMpE/ssKSryw1ou5pVDZUowJHjNP01oLIqp9E8xjMunwGe
 Z1cCJo4gyYk5fpxeoqXm/ylboPJIF/Kdp2/IN+I=
X-Google-Smtp-Source: ACHHUZ61GfoJyGVd2+JIiM4DBsjSxXhMgTpekrg/Fdyp9NPDJGlMxEPGKsqQRVnqsaPc5Tz6IfL7/5sXfJTo8OwU9Ak=
X-Received: by 2002:a4a:2cc2:0:b0:555:48c0:cc63 with SMTP id
 o185-20020a4a2cc2000000b0055548c0cc63mr5624308ooo.2.1685730190624; Fri, 02
 Jun 2023 11:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230601224419.2392422-1-olvaffe@gmail.com>
 <0e55585d-d6d7-b9ac-aed5-8df56895e209@amd.com>
In-Reply-To: <0e55585d-d6d7-b9ac-aed5-8df56895e209@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 2 Jun 2023 14:22:59 -0400
Message-ID: <CADnq5_MEZU=wD+wXdt+x0_LJS6y=PqkMLw7qD7yFk8ObR0k0-Q@mail.gmail.com>
Subject: Re: [PATCH v3] amdgpu: validate offset_in_bo of drm_amdgpu_gem_va
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Philip Yang <Philip.Yang@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Mukul Joshi <mukul.joshi@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jammy Zhou <Jammy.Zhou@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Danijel Slivka <danijel.slivka@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!


Alex

On Fri, Jun 2, 2023 at 7:43=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 02.06.23 um 00:44 schrieb Chia-I Wu:
> > This is motivated by OOB access in amdgpu_vm_update_range when
> > offset_in_bo+map_size overflows.
> >
> > v2: keep the validations in amdgpu_vm_bo_map
> > v3: add the validations to amdgpu_vm_bo_map/amdgpu_vm_bo_replace_map
> >      rather than to amdgpu_gem_va_ioctl
> >
> > Fixes: 9f7eb5367d00 ("drm/amdgpu: actually use the VM map parameters")
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm.c
> > index 22f9a65ca0fc7..76d57bc7ac620 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -1434,14 +1434,14 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev=
,
> >       uint64_t eaddr;
> >
> >       /* validate the parameters */
> > -     if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK ||
> > -         size =3D=3D 0 || size & ~PAGE_MASK)
> > +     if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK || size & ~PAGE_MAS=
K)
> > +             return -EINVAL;
> > +     if (saddr + size <=3D saddr || offset + size <=3D offset)
> >               return -EINVAL;
> >
> >       /* make sure object fit at this offset */
> >       eaddr =3D saddr + size - 1;
> > -     if (saddr >=3D eaddr ||
> > -         (bo && offset + size > amdgpu_bo_size(bo)) ||
> > +     if ((bo && offset + size > amdgpu_bo_size(bo)) ||
> >           (eaddr >=3D adev->vm_manager.max_pfn << AMDGPU_GPU_PAGE_SHIFT=
))
> >               return -EINVAL;
> >
> > @@ -1500,14 +1500,14 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_devi=
ce *adev,
> >       int r;
> >
> >       /* validate the parameters */
> > -     if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK ||
> > -         size =3D=3D 0 || size & ~PAGE_MASK)
> > +     if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK || size & ~PAGE_MAS=
K)
> > +             return -EINVAL;
> > +     if (saddr + size <=3D saddr || offset + size <=3D offset)
> >               return -EINVAL;
> >
> >       /* make sure object fit at this offset */
> >       eaddr =3D saddr + size - 1;
> > -     if (saddr >=3D eaddr ||
> > -         (bo && offset + size > amdgpu_bo_size(bo)) ||
> > +     if ((bo && offset + size > amdgpu_bo_size(bo)) ||
> >           (eaddr >=3D adev->vm_manager.max_pfn << AMDGPU_GPU_PAGE_SHIFT=
))
> >               return -EINVAL;
> >
>

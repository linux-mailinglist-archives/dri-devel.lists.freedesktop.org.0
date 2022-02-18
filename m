Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D53C14BBDB3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 17:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AE110E1F0;
	Fri, 18 Feb 2022 16:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7603210E549;
 Fri, 18 Feb 2022 16:40:59 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id q5so3655997oij.6;
 Fri, 18 Feb 2022 08:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rNaBJ9SnSvmZZKSwg6WQat2Owwd2UUbUCqyH0KfuOto=;
 b=kXIJR1VVI1XhgIIaZUlneyHM3X3buYUA7XCemDc9ucaRmzz8ONqODjfD63dgA6Uz7I
 JGCLsNIzj3TPe5u1rRwE7I68n2NOLP8cG6cwwBxaWpD/7/KQhulAy3aIdVRFiKKnPJRL
 F9Mtdrd19Av4GRUz4BmSedmdWtTATBar25fZBre2drr7cYkUcyBVCa6NzVK1Rmlu/8Az
 z5zRG45WCjs7wfcixIQyjPRUaXkrjU9eWBKPjwHdldM02m2y/h64+PWaFXnPpu9BdrZL
 3aOc8ZXdk7cm7clD5BWUDnP9//zj0zjQ+Zsaw/tZxX9oAPon8I3MG1N89RXSQaxntURb
 Jpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rNaBJ9SnSvmZZKSwg6WQat2Owwd2UUbUCqyH0KfuOto=;
 b=tK0NblFoKTLt/oHAhBsI8eV+KV6WD4elyZs4Wj0ErVX/HRuihcw4+YN9rLK+4T/HpL
 V9RNlRVdz0+V/7QIWZkTAC/290Bcc+/4i4hcy59h6vMN4h74/w84w+L5ePdl6+Q7dtb4
 Q+d3+jYob26xEDrpHMHzYChuYYp/G2yRCWqPk9C/yxt/hGdzzffbV5wyfoxWfAbRr5VK
 H5L7qBXWTbba0MforlBzzXL3PF/LBmHN7Gu1fn9clhttG4+EYFfcZ9K6etinnUlFHs/X
 xCjAJhcXeIjvx0TwjexXaDMNVQ3etKm59b/Es3Q+/f5RXPMHFqQdY9LGNi7IFzD6kqDy
 P5vw==
X-Gm-Message-State: AOAM531P3ilGG6PicOUnKz2mQxrTN53piHJaNF+IzHAg2WK3yWnD+1Xc
 u69qyvTAUZiOGn4Td32k77LT0Tkxg0KoKEBOZ1U=
X-Google-Smtp-Source: ABdhPJxGdJJUhTI3XRP5VaihJS7Seu7yXxagtZb6DliIInQyt6iXbc8RzCTpzgqxNG88jJEeiR1ivtOfCwh5hfuFLo8=
X-Received: by 2002:a05:6808:f8b:b0:2ce:6ee7:2c99 with SMTP id
 o11-20020a0568080f8b00b002ce6ee72c99mr5655117oiw.199.1645202458758; Fri, 18
 Feb 2022 08:40:58 -0800 (PST)
MIME-Version: 1.0
References: <20220218075727.2737623-1-davidgow@google.com>
 <20220218075727.2737623-2-davidgow@google.com>
 <ef8eee23-ba8c-e76a-d32d-68658841708d@amd.com>
In-Reply-To: <ef8eee23-ba8c-e76a-d32d-68658841708d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Feb 2022 11:40:47 -0500
Message-ID: <CADnq5_Nxjq6+8k1bjs3LJfTzXgX1YRd0-=Fd55224V3_nOshAg@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/amdgpu: Fix compilation under UML
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: X86 ML <x86@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-rdma <linux-rdma@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
 Jeff Dike <jdike@addtoit.com>, Randy Dunlap <rdunlap@infradead.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-um@lists.infradead.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 kunit-dev@googlegroups.com, Anton Ivanov <anton.ivanov@cambridgegreys.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 11:39 AM Felix Kuehling <felix.kuehling@amd.com> wr=
ote:
>
>
> Am 2022-02-18 um 02:57 schrieb David Gow:
> > From: Randy Dunlap <rdunlap@infradead.org>
> >
> > cpuinfo_x86 and its associated macros are not available under ARCH=3Dum=
,
> > even though CONFIG_X86_64 is defined.
> >
> > This patch (and discussion) were originally posted here:
> > https://lkml.org/lkml/2022/1/24/1547
> >
> > This produces the following build errors:
> > ../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1556:9: note: in=
 expansion of macro =E2=80=98cpu_data=E2=80=99
> >    return cpu_data(first_cpu_of_numa_node).apicid;
> >           ^~~~~~~~
> > ../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1560:1: error: c=
ontrol reaches end of non-void function [-Werror=3Dreturn-type]
> >
> > ../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c: In function =E2=80=
=98kfd_fill_iolink_info_for_cpu=E2=80=99:
> > ../arch/um/include/asm/processor-generic.h:103:19: error: called object=
 is not a function or function pointer
> >   #define cpu_data (&boot_cpu_data)
> >                    ~^~~~~~~~~~~~~~~
> > ../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1688:27: note: in ex=
pansion of macro =E2=80=98cpu_data=E2=80=99
> >    struct cpuinfo_x86 *c =3D &cpu_data(0);
> >                             ^~~~~~~~
> > ../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1691:7: error: deref=
erencing pointer to incomplete type =E2=80=98struct cpuinfo_x86=E2=80=99
> >    if (c->x86_vendor =3D=3D X86_VENDOR_AMD)
> >         ^~
> > ../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1691:23: error: =E2=
=80=98X86_VENDOR_AMD=E2=80=99 undeclared (first use in this function); did =
you mean =E2=80=98X86_VENDOR_ANY=E2=80=99?
> >    if (c->x86_vendor =3D=3D X86_VENDOR_AMD)
> >                         ^~~~~~~~~~~~~~
> >                         X86_VENDOR_ANY
> >
> > ../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c: In function =E2=80=
=98kfd_create_vcrat_image_cpu=E2=80=99:
> > ../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1742:11: warning: un=
used variable =E2=80=98entries=E2=80=99 [-Wunused-variable]
> >    uint32_t entries =3D 0;
> >
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: David Gow <davidgow@google.com>
> > ---
> >   drivers/gpu/drm/amd/amdkfd/kfd_crat.c     | 6 +++---
> >   drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 2 +-
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/am=
d/amdkfd/kfd_crat.c
> > index 9624bbe8b501..b1e2d117be3d 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> > @@ -1682,7 +1682,7 @@ static int kfd_fill_mem_info_for_cpu(int numa_nod=
e_id, int *avail_size,
> >       return 0;
> >   }
> >
> > -#ifdef CONFIG_X86_64
> > +#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
>
> I don't think it makes sense to compile a hardware device driver in a
> UML config. Instead of scattering UML #ifdefs through our code, I would
> recommend adding this to Kconfig:
>
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -254,7 +254,7 @@ source "drivers/gpu/drm/radeon/Kconfig"
>
>   config DRM_AMDGPU
>          tristate "AMD GPU"
> -       depends on DRM && PCI && MMU
> +       depends on DRM && PCI && MMU && !UML
>          select FW_LOADER
>          select DRM_KMS_HELPER
>          select DRM_SCHED
>
> That would address patch 2 of this series as well.

I agree.  Otherwise, we are always going to be chasing these issues.

Alex

>
> Regards,
>    Felix
>
>
> >   static int kfd_fill_iolink_info_for_cpu(int numa_node_id, int *avail_=
size,
> >                               uint32_t *num_entries,
> >                               struct crat_subtype_iolink *sub_type_hdr)
> > @@ -1741,7 +1741,7 @@ static int kfd_create_vcrat_image_cpu(void *pcrat=
_image, size_t *size)
> >       struct crat_subtype_generic *sub_type_hdr;
> >       int avail_size =3D *size;
> >       int numa_node_id;
> > -#ifdef CONFIG_X86_64
> > +#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
> >       uint32_t entries =3D 0;
> >   #endif
> >       int ret =3D 0;
> > @@ -1806,7 +1806,7 @@ static int kfd_create_vcrat_image_cpu(void *pcrat=
_image, size_t *size)
> >                       sub_type_hdr->length);
> >
> >               /* Fill in Subtype: IO Link */
> > -#ifdef CONFIG_X86_64
> > +#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
> >               ret =3D kfd_fill_iolink_info_for_cpu(numa_node_id, &avail=
_size,
> >                               &entries,
> >                               (struct crat_subtype_iolink *)sub_type_hd=
r);
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/dr=
m/amd/amdkfd/kfd_topology.c
> > index 948fbb39336e..b38fc530ffe2 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> > @@ -1552,7 +1552,7 @@ static int kfd_cpumask_to_apic_id(const struct cp=
umask *cpumask)
> >       first_cpu_of_numa_node =3D cpumask_first(cpumask);
> >       if (first_cpu_of_numa_node >=3D nr_cpu_ids)
> >               return -1;
> > -#ifdef CONFIG_X86_64
> > +#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
> >       return cpu_data(first_cpu_of_numa_node).apicid;
> >   #else
> >       return first_cpu_of_numa_node;

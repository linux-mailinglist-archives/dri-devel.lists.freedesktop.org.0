Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC2892F44C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 05:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD71610E038;
	Fri, 12 Jul 2024 03:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jOv1ke1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBFE10E038
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 03:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720753976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXY/sZpO06n+Rdcmg5Em3FyGZZSOlUrDiJ4rTK+vojA=;
 b=jOv1ke1rDH2TAwQEBORqbNaj3C9fBblJxVihhQLiq1Dyx/RqYLU4mfq9QPioY+9WuxVn/Q
 bCgmgNFVOZISmdMDTUeRbUuRaFxfxrHxbAoX0gI98C34RWe4/FTtorZtiKqMC8hC13QiS5
 i3nP0qiFMaGqkC5EE7cog3JVBzCKwlQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-YCC4uzUoPWOess2HZR4tSQ-1; Thu, 11 Jul 2024 23:12:54 -0400
X-MC-Unique: YCC4uzUoPWOess2HZR4tSQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2c9015b0910so1965295a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 20:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720753974; x=1721358774;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BXY/sZpO06n+Rdcmg5Em3FyGZZSOlUrDiJ4rTK+vojA=;
 b=KARwSBgZmmJzHJQ25pofE8d0skfjyhdysuBFVvvKaAJmwmWzkoYxKFP4GrFhsdIkOC
 opLWKCdLt7QNjmg5bcQrSu5kOrjhxbL/rcVsBUPg4ixlfMSaTxo+YLjlYoAUiBULCfWL
 GqdjxbUOZu0QyCBDzQx0N/x8hQeaDTcgMXr+dON2MxFuLzwQUGgrRZ1AQc2OU9buNE5o
 aKkXu+mgQZh+A+IfGF+9GXPBjIyZGrQofpPC0fv2T6PxcVJdUzm+uDIMF/ZOSUEZNBXH
 +HqgzeR3cyfhU6HYOUorrwDUdx6+kYTXPs/BRtxvSwjZRObPlaU6Su0+30o1htMQ8GBu
 gtsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx/FlB36KytVqfl+qXkbOK5/YJbfdT8KDrXWOSMFES4awJIaBdBBhQV+or5xEr+GtN55aitC3pghs1hvIzOqt+YTV6nHUCMLGleqmfc3f0
X-Gm-Message-State: AOJu0YyDXcNFqz8p7oEPH1CdtlSmSgign8OkaTsQQwk0pEXPrHZ57Poc
 aBn2hjEl9Ll1f+69dQrlrilUYCd4PxZQ4+NMOs96gp5C+k4LPOUW68sOdcMb5KN3DYAcfQu2hX8
 1fRse+vean2xwssC9zExoWRuFdqFFxysCb0EnkMrf59nyVI7dOYhC9McwhSQ6DlN6DOMeuEv7KJ
 dEhX65Di8B78gJYeQc51bdsPmE1jOEFrzZXo2Cu0u1
X-Received: by 2002:a17:90b:1bc3:b0:2c8:2236:e2c3 with SMTP id
 98e67ed59e1d1-2cac509b515mr2201882a91.17.1720753973690; 
 Thu, 11 Jul 2024 20:12:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtAK2n6iWFwX5bM16eYpsf4GlrruFMJ7fNUbwgy0bcVCD8qdJ7sxCfFWVabHQR0P0ve6dq9fYfAk7ofO0SHvs=
X-Received: by 2002:a17:90b:1bc3:b0:2c8:2236:e2c3 with SMTP id
 98e67ed59e1d1-2cac509b515mr2201859a91.17.1720753973198; Thu, 11 Jul 2024
 20:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240701191319.087b227e@canb.auug.org.au>
 <20240701171901.GA882812@thelio-3990X>
 <20240712122843.312313a4@canb.auug.org.au>
In-Reply-To: <20240712122843.312313a4@canb.auug.org.au>
From: David Airlie <airlied@redhat.com>
Date: Fri, 12 Jul 2024 13:12:41 +1000
Message-ID: <CAMwc25oaX1K1Co0vSsN1H3busBLH9xA3-f4OAHZXN4iB4_d=gg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Fri, Jul 12, 2024 at 12:28=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> On Mon, 1 Jul 2024 10:19:01 -0700 Nathan Chancellor <nathan@kernel.org> w=
rote:
> >
> > On Mon, Jul 01, 2024 at 07:13:19PM +1000, Stephen Rothwell wrote:
> > >
> > > After merging the drm tree, today's linux-next build (powerpc
> > > allyesconfig) failed like this:
> > >
> > > In file included from arch/powerpc/include/asm/mmu.h:144,
> > >                  from arch/powerpc/include/asm/paca.h:18,
> > >                  from arch/powerpc/include/asm/current.h:13,
> > >                  from include/linux/sched.h:12,
> > >                  from include/linux/ratelimit.h:6,
> > >                  from include/linux/dev_printk.h:16,
> > >                  from include/linux/device.h:15,
> > >                  from include/linux/dma-mapping.h:8,
> > >                  from drivers/gpu/drm/omapdrm/omap_gem.c:7:
> > > drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_pin_tiler':
> > > arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long u=
nsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536'=
 to '0' [-Werror=3Doverflow]
> > >    25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
> > >       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > drivers/gpu/drm/omapdrm/omap_gem.c:758:42: note: in expansion of macr=
o 'PAGE_SIZE'
> > >   758 |                                          PAGE_SIZE);
> > >       |                                          ^~~~~~~~~
> > > drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_init':
> > > arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long u=
nsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536'=
 to '0' [-Werror=3Doverflow]
> > >    25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
> > >       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > drivers/gpu/drm/omapdrm/omap_gem.c:1504:65: note: in expansion of mac=
ro 'PAGE_SIZE'
> > >  1504 |                         block =3D tiler_reserve_2d(fmts[i], w=
, h, PAGE_SIZE);
> > >       |                                                              =
   ^~~~~~~~~
> > > cc1: all warnings being treated as errors
> > >
> > > Exposed by commit
> > >
> > >   dc6fcaaba5a5 ("drm/omap: Allow build with COMPILE_TEST=3Dy")
> > >
> > > PowerPC 64 bit uses 64k pages.
> > >
> > > I have reverted that commit for today.
> >
> > FWIW, I sent a patch to address this in a bit of a more targeted manner
> > over a week ago:
> >
> > https://lore.kernel.org/20240620-omapdrm-restrict-compile-test-to-sub-6=
4kb-page-size-v1-1-5e56de71ffca@kernel.org/
> >
> > Although somehow, I left off Ville from that patch :/
>
> I am still reverting that commit (as of yesterday, the failure still
> occurs) ...

I'll merge this directly to drm-next today.

Dave.


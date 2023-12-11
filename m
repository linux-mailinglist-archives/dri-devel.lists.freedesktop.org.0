Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ECD80C486
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E7C10E376;
	Mon, 11 Dec 2023 09:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B5B10E376
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:26:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E4298B80CAB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A052C433C9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702286797;
 bh=5zVbh23hz6Y8xRrWFF1CYPSTPIlaTvC7m4+9b2s5s6w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iGs3oDLvMUTO74Wi/5YqGX+ltYQgT1R2G/WiVNbxliJJPiax1+4+bx42w9WYY6Lai
 nZjnqFzgJ6felPhFiVTnbALIqTje371DtNYCt46gd91pmNUhG6dPwbPv6eJ3/UcsUz
 bXBiVDfdBSoZQ10rlKIZtQ6q5F1uDWqewT2EUtq7mrOExzfF7MmOa4lED0l6uxWdkL
 vqihqUpqkaNXbOWZoCHM+cKxSMyRcaR7EwwSDgbMoAd5CBWLc01nc5ghbqQkBHDKmV
 tyGLNcHhOMZZP9Sjuxqd0xAHpPPeumHgp6DN0csVz66+oO0omfiYLNCRxm0tGX650i
 dQ8pAByk/i/lg==
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-548f853fc9eso5924305a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 01:26:37 -0800 (PST)
X-Gm-Message-State: AOJu0Ywo7taFpMBy6Y/6zvyUCla2C3jISHLLDTCgaQA7wUyZhZyf+sRI
 mq5BkEcSZiULVY4LduC3PP4AyeJZInbqfb+MmqQ=
X-Google-Smtp-Source: AGHT+IEs8ExR9DJuBkyegM7JDEtu0yCZcXIjmmGnj0X4e4F+Bt8hHzLsnFVUhkSaXleNYQByu3ctAY2v/HY4aJ1xc9c=
X-Received: by 2002:a50:cb87:0:b0:54a:f72d:38bb with SMTP id
 k7-20020a50cb87000000b0054af72d38bbmr1232154edi.36.1702286795747; Mon, 11 Dec
 2023 01:26:35 -0800 (PST)
MIME-Version: 1.0
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
 <878r61gmuw.fsf@minerva.mail-host-address-is-not-set>
 <CAAhV-H4ZBZpSUYVqvNsBqXU8xPw-=jwJLALgWHOqQNwkwKr2fg@mail.gmail.com>
 <8734w9gku0.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <8734w9gku0.fsf@minerva.mail-host-address-is-not-set>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 11 Dec 2023 17:26:22 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6eUwo7VTOL1H9s4=rYFYiZBkVKi5KDXMM0gjP=uDr5Hw@mail.gmail.com>
Message-ID: <CAAhV-H6eUwo7VTOL1H9s4=rYFYiZBkVKi5KDXMM0gjP=uDr5Hw@mail.gmail.com>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jaak Ristioja <jaak@ristioja.ee>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Javier,

On Mon, Dec 11, 2023 at 5:17=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Huacai Chen <chenhuacai@kernel.org> writes:
>
> > Hi, Javier,
> >
> > On Mon, Dec 11, 2023 at 4:33=E2=80=AFPM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> >>
> >> Huacai Chen <chenhuacai@kernel.org> writes:
> >>
> >> Hello Huacai,
> >>
> >> > Hi, Javier,
> >> >
> >> > On Wed, Nov 8, 2023 at 4:24=E2=80=AFPM Javier Martinez Canillas
> >> > <javierm@redhat.com> wrote:
> >> >>
> >> >> Hello,
> >> >>
> >> >> On Wed, Nov 8, 2023 at 9:14=E2=80=AFAM Thomas Zimmermann <tzimmerma=
nn@suse.de> wrote:
> >> >> >
> >> >> > Hi,
> >> >> >
> >> >>
> >> >> [...]
> >> >>
> >> >> >
> >> >> > Relying on linking order is just as unreliable. The usual workaro=
und is
> >> >> > to build native drivers as modules. But first, please investigate=
 where
> >> >> > the current code fails.
> >> >> >
> >> >>
> >> >> I fully agree with Thomas here. This is just papering over the issu=
e.
> >> >>
> >> >> I'll read the lengthy thread now to see if I can better understand
> >> >> what's going on here.
> >> > Have you understood enough now? I really don't want the original pat=
ch
> >> > to be reverted.
> >> >
> >>
> >> I discussed this with Thomas but we didn't fully understand what was g=
oing
> >> on. In theory, it should work since the native driver should disable s=
ysfb
> >> and remove the registered platform device. But it seems that this does=
 not
> >> happen for Jaak and others who reported the same issue.
> >>
> >> Something that we noticed is that PCI fixups happen in fs_initcall_syn=
c()
> >> and since the sysfb_init() should happen after the PCI subsystem for E=
FI
> >> quirks, we think that at least should be moved after that initcall lev=
el.
> >>
> >> That means rootfs_initcall() onwards, and that takes it almost at the =
same
> >> before your patch. The safest would be to move sysfb_init() to initcal=
l
> >> device_initcall_sync() and make sure that happens after all the native=
 DRM
> >> drivers, since module_init() happens at device_initcall().
> >>
> >> I think that Thomas meant to send a patch to do that change.
> > Thank you very much. I guess things may be like this:
> > i915 init at first, then simpledrm init in parallel and finished
> > before i915 call sysfb_disable(), so in my previous reply I provide a
> > debug patch for Jaak to see what happens.
> >
>
> Yes, specially with async probing although neither i915 nor simpledrm use
> it right now AFAICT.
>
> Is still unclear to me what's going on in this particular case, although
> moving it to device_initcall_sync() seems to be the correct thing to do
> regardless of this issue.
But that cannot "make the screen display as early as possible". Maybe
we can wait for Jaak's result.

Huacai

>
> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>

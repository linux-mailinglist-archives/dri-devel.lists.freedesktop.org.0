Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D302B80C402
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FAB10E366;
	Mon, 11 Dec 2023 09:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBD310E366
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:12:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 81FAACE0F74
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1400C433C9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702285917;
 bh=dViKBOxJle4PNTpPEqJQFBwcGeJctkrIZYrUKbFR+/U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fQ1ef7G9XIaR5bwPOo13Afq5rWee44XujFuWapaOq4KAH8MHTNLQ1QAuy5PWFTd0v
 Yrrn3CA/16Y6E6k6LKx1on46596JkF9JRkBTKSqCAlel2gQ1a+xIKexI+2RPwP7w1H
 dJyMTqpsOig7sDyTsJUUROwM4aSjy4XJojH7/qIb+FNnsVaRfRY3sq+6Bu7lkk1bFp
 jJ04iyfyO1hdPd1l/bVAV94Ion9QV2Uf6xTPW4Y5jnpJZrJGxdiNelbR8a6NyTEUE8
 sxfgySHRgjWyne+fY4EPTbPPhfJzlGNaL1gdHuYHxAjNSP972JNj+Ubs+Mn2kWi7nI
 kDxgn6+osVpsQ==
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-9e1021dbd28so559611666b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 01:11:56 -0800 (PST)
X-Gm-Message-State: AOJu0YwCYO5gFi8BKlxQjQqn1FvCIwuonWJAwHN0tubapsO/LrnRoIG+
 pFDJG2fm0s53eFFt1Q36uV3aEOR/eAnOmfhwChU=
X-Google-Smtp-Source: AGHT+IGoWhdl65N6kZMmwJEMNNI9KMqXg/nOJym/XhL/A5r/nNYhYMuDpGfBWLApT581UU0VBqXfWGcNriaXtROOwT4=
X-Received: by 2002:a17:906:fb88:b0:a1d:2281:58c3 with SMTP id
 lr8-20020a170906fb8800b00a1d228158c3mr1984526ejb.146.1702285915207; Mon, 11
 Dec 2023 01:11:55 -0800 (PST)
MIME-Version: 1.0
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
 <878r61gmuw.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <878r61gmuw.fsf@minerva.mail-host-address-is-not-set>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 11 Dec 2023 17:11:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4ZBZpSUYVqvNsBqXU8xPw-=jwJLALgWHOqQNwkwKr2fg@mail.gmail.com>
Message-ID: <CAAhV-H4ZBZpSUYVqvNsBqXU8xPw-=jwJLALgWHOqQNwkwKr2fg@mail.gmail.com>
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

On Mon, Dec 11, 2023 at 4:33=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Huacai Chen <chenhuacai@kernel.org> writes:
>
> Hello Huacai,
>
> > Hi, Javier,
> >
> > On Wed, Nov 8, 2023 at 4:24=E2=80=AFPM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> >>
> >> Hello,
> >>
> >> On Wed, Nov 8, 2023 at 9:14=E2=80=AFAM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
> >> >
> >> > Hi,
> >> >
> >>
> >> [...]
> >>
> >> >
> >> > Relying on linking order is just as unreliable. The usual workaround=
 is
> >> > to build native drivers as modules. But first, please investigate wh=
ere
> >> > the current code fails.
> >> >
> >>
> >> I fully agree with Thomas here. This is just papering over the issue.
> >>
> >> I'll read the lengthy thread now to see if I can better understand
> >> what's going on here.
> > Have you understood enough now? I really don't want the original patch
> > to be reverted.
> >
>
> I discussed this with Thomas but we didn't fully understand what was goin=
g
> on. In theory, it should work since the native driver should disable sysf=
b
> and remove the registered platform device. But it seems that this does no=
t
> happen for Jaak and others who reported the same issue.
>
> Something that we noticed is that PCI fixups happen in fs_initcall_sync()
> and since the sysfb_init() should happen after the PCI subsystem for EFI
> quirks, we think that at least should be moved after that initcall level.
>
> That means rootfs_initcall() onwards, and that takes it almost at the sam=
e
> before your patch. The safest would be to move sysfb_init() to initcall
> device_initcall_sync() and make sure that happens after all the native DR=
M
> drivers, since module_init() happens at device_initcall().
>
> I think that Thomas meant to send a patch to do that change.
Thank you very much. I guess things may be like this:
i915 init at first, then simpledrm init in parallel and finished
before i915 call sysfb_disable(), so in my previous reply I provide a
debug patch for Jaak to see what happens.

Huacai

>
> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>

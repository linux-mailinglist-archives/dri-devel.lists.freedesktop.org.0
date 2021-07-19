Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4E23CCE42
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 09:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4E789D2F;
	Mon, 19 Jul 2021 07:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E477D89D2F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 07:11:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2941611CB
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 07:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626678664;
 bh=Pn/1Cj/0aZG99zqoi3ZzrECnvCBXU+18iWFv6gPyfSM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bCW39FLNMP4SZgn5kgvw/weq+kRv4VAQe9Yl0X9IvGIET79Sv111ytlAfkeuQCy4+
 0auxQNNbNpcDAZM+M+AmJAooC2j7JGbdI3GtyMeTbXItwsz/o3MvlXVKYKvsrfzlAe
 7jHJ2Y7UFFpuEjHACQP7iXhobcygebdszESwk7tiR9tZGSToYXOe/f2ZQKwNNJfA4T
 +WCaVuZ0r1K+eAHklgZ9MhZRHNmWZ65VuHQGHPiQOXyTpeXTvB+DriDAI2568NkFB7
 ZTzq+bOFDk5gzVRiYpdiUuhKiM1fPVCQmHVYae8dSOnQ9xq1yNQaNcSvPR2uHEf6hh
 XHmrehB38snjQ==
Received: by mail-ot1-f43.google.com with SMTP id
 s2-20020a0568301e02b02904ce2c1a843eso6763304otr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 00:11:04 -0700 (PDT)
X-Gm-Message-State: AOAM533I+HCOknxlMF0do6PsZgpoVqBzYe6kl1VcoB86rmbKDds9ca0+
 XuTas3HdqB9AO+mQRj5ENldvnR+VlzWdYD+kqU8=
X-Google-Smtp-Source: ABdhPJwdHFS1KJDwdJGVFAPZ7EQmJ/6+hWchGT5fri4AF+nsIVeMNNoeRd43R/6tIlkpHhDM1d09UMCoJxuAR70rmFo=
X-Received: by 2002:a05:6830:34a6:: with SMTP id
 c38mr5088922otu.108.1626678663841; 
 Mon, 19 Jul 2021 00:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210625130947.1803678-1-javierm@redhat.com>
 <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
 <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
 <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
In-Reply-To: <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 19 Jul 2021 09:10:52 +0200
X-Gmail-Original-Message-ID: <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
Message-ID: <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-efi <linux-efi@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>, Borislav Petkov <bp@suse.de>,
 Albert Ou <aou@eecs.berkeley.edu>, Hans de Goede <hdegoede@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Jul 2021 at 04:59, Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 15 Jul 2021 at 18:11, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Hi
> >
> > Am 13.07.21 um 18:59 schrieb Javier Martinez Canillas:
> > > On 6/25/21 3:09 PM, Javier Martinez Canillas wrote:
> > >> The simplefb and simpledrm drivers match against a "simple-framebuffer"
> > >> device, but for aarch64 this is only registered when using Device Trees
> > >> and there's a node with a "simple-framebuffer" compatible string.
> > >>
> > >> There is no code to register a "simple-framebuffer" platform device when
> > >> using EFI instead. In fact, the only platform device that's registered in
> > >> this case is an "efi-framebuffer", which means that the efifb driver is
> > >> the only driver supported to have an early console with EFI on aarch64.
> > >>
> > >> The x86 architecture platform has a Generic System Framebuffers (sysfb)
> > >> support, that register a system frambuffer platform device. It either
> > >> registers a "simple-framebuffer" for the simple{fb,drm} drivers or legacy
> > >> VGA/EFI FB devices for the vgafb/efifb drivers.
> > >>
> > >> The sysfb is generic enough to be reused by other architectures and can be
> > >> moved out of the arch/x86 directory to drivers/firmware, allowing the EFI
> > >> logic used by non-x86 architectures to be folded into sysfb as well.
> > >>
> > >
> > > Any more comments on this series? It would be nice for this to land so the
> > > simpledrm driver could be used on aarch64 EFI systems as well.
> > >
> > > The patches have already been acked by x86 and DRM folks.
> >
> > Time to get this merged, I'd say. People are asking for these patches
> > already.
>
> Can we just merge via drm-misc and make sure the acks are present and
> I'll deal with the fallout if any.
>

Fine with me. Could you stick it on a separate branch so I can double
check whether there are any issues wrt the EFI tree?

Thanks,
Ard.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3097D6D0C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 15:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5FC10E0F4;
	Wed, 25 Oct 2023 13:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21F310E0F4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 13:23:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1A6376216B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 13:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7D6C4339A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 13:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698240228;
 bh=BnyLZkN8HPaoEa+9mhcdWcCu6A52+NScdGK0Vg7qgAQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oZTA4R/RlFXRpDOG93t/Wjc4bMnef4emJPQRbpg7w1EpvCuqTs2L4IH+Gtp2Msqfq
 XOxiR8MBdkG1RM73evp4b2IqSBpVZQeIPD149m0OJSOjdgCXnuY/qzbY2XBquFg4zV
 LMtA0ZNrVPluMj2jVH98FlW7agJod+b9adRLx8Qaq64YXDfl+AMLtP2lW2bEKNdAMU
 E5GzUyuBgtEfwcfZk9PoZq4lHMvVGdEoP7yrJkSooAlvSYMyQh0TuX4TY1ZPgjuEdy
 PWfR4QgrAmRFvolLLIbjOf40BJQTgrOm/sn1tzGG+bP2n+XX8nLgr1LNTyFnk4SeBW
 QXTtqF2hWJvJw==
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-53e3e7e478bso8711490a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 06:23:47 -0700 (PDT)
X-Gm-Message-State: AOJu0YwNb7pQ5Un/BKEc8TKLedMh0joOiwkM3xT9mMs9WF/XritmklqI
 c9qIsW75gIObdoo0LKsjDdYW06BRzQ4B5aE9laM=
X-Google-Smtp-Source: AGHT+IGXymEeKpSsdINwJcNnPFy8h6gn4zw5QvqoaRVTS4/sHHHu/xTcUggx3iZBWoNy+MabCvis6Jc0SFzRyDvBbQI=
X-Received: by 2002:a17:907:3183:b0:9bd:7f40:caa5 with SMTP id
 xe3-20020a170907318300b009bd7f40caa5mr9862959ejb.77.1698240226278; Wed, 25
 Oct 2023 06:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
 <31bdf7b1-0ed9-4217-b459-1d857e53120b@leemhuis.info>
 <CAAhV-H7fRpykesVUEyaTpVnFiGwpP+fPbtdrp6JwfgD=bDp06Q@mail.gmail.com>
 <CAAhV-H7XCmbgS=N4-SE8FnASAws8hnDRZsQJgXE+dwyARaqzNw@mail.gmail.com>
 <ZSO9uArAtsPMPeTP@debian.me>
 <CAAhV-H5GbidUx8YanUc7S9oGqBkDd53xeT=2O4aCuX7KpM-+8A@mail.gmail.com>
 <c9b79a69-bdc1-4457-900d-709a15d99568@leemhuis.info>
 <CAAhV-H4qQW_fOdkTxmT1xbvo4LOapzw_tOw7Kma47xmh0PvpPA@mail.gmail.com>
 <ZTWoDSPxGO-ApR4r@P70.localdomain>
 <82f1b533-3bd8-4418-843a-718d9a6b5786@leemhuis.info>
In-Reply-To: <82f1b533-3bd8-4418-843a-718d9a6b5786@leemhuis.info>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 25 Oct 2023 21:23:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5DH3Oj3ttSpa_k6jUdZ+0_pMwgoaqUTGGFr46j7DMXRw@mail.gmail.com>
Message-ID: <CAAhV-H5DH3Oj3ttSpa_k6jUdZ+0_pMwgoaqUTGGFr46j7DMXRw@mail.gmail.com>
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
To: Thorsten Leemhuis <regressions@leemhuis.info>
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jaak Ristioja <jaak@ristioja.ee>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Evan Preston <x.arch@epreston.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 25, 2023 at 6:08=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Javier, Dave, Sima,
>
> On 23.10.23 00:54, Evan Preston wrote:
> > On 2023-10-20 Fri 05:48pm, Huacai Chen wrote:
> >> On Fri, Oct 20, 2023 at 5:35=E2=80=AFPM Linux regression tracking (Tho=
rsten
> >> Leemhuis) <regressions@leemhuis.info> wrote:
> >>> On 09.10.23 10:54, Huacai Chen wrote:
> >>>> On Mon, Oct 9, 2023 at 4:45=E2=80=AFPM Bagas Sanjaya <bagasdotme@gma=
il.com> wrote:
> >>>>> On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Chen wrote:
> >>>>>> On Tue, Sep 26, 2023 at 10:31=E2=80=AFPM Huacai Chen <chenhuacai@k=
ernel.org> wrote:
> >>>>>>> On Tue, Sep 26, 2023 at 7:15=E2=80=AFPM Linux regression tracking=
 (Thorsten
> >>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>>>>>> On 13.09.23 14:02, Jaak Ristioja wrote:
> >>>>>>>>>
> >>>>>>>>> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated In=
tel HD
> >>>>>>>>> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a=
 blank
> >>>>>>>>> screen after boot until the display manager starts... if it doe=
s start
> >>>>>>>>> at all. Using the nomodeset kernel parameter seems to be a work=
around.
> >>>>>>>>>
> >>>>>>>>> I've bisected this to commit 60aebc9559492cea6a9625f514a8041717=
e3a2e4
> >>>>>>>>> ("drivers/firmware: Move sysfb_init() from device_initcall to
> >>>>>>>>> subsys_initcall_sync").
> >>>>>>>>
> >>>>>> As confirmed by Jaak, disabling DRM_SIMPLEDRM makes things work fi=
ne
> >>>>>> again. So I guess the reason:
> >>>
> >>> Well, this to me still looks a lot (please correct me if I'm wrong) l=
ike
> >>> regression that should be fixed, as DRM_SIMPLEDRM was enabled beforeh=
and
> >>> if I understood things correctly. Or is there a proper fix for this
> >>> already in the works and I just missed this? Or is there some good
> >>> reason why this won't/can't be fixed?
> >>
> >> DRM_SIMPLEDRM was enabled but it didn't work at all because there was
> >> no corresponding platform device. Now DRM_SIMPLEDRM works but it has a
> >> blank screen. Of course it is valuable to investigate further about
> >> DRM_SIMPLEDRM on Jaak's machine, but that needs Jaak's effort because
> >> I don't have a same machine.
>
> Side note: Huacai, have you tried working with Jaak to get down to the
> real problem? Evan, might you be able to help out here?
No, Jaak has no response after he 'fixed' his problem by disabling SIMPLEDR=
M.

>
> But I write this mail for a different reason:
>
> > I am having the same issue on a Lenovo Thinkpad P70 (Intel
> > Corporation HD Graphics 530 (rev 06), Intel(R) Core(TM) i7-6700HQ).
> > Upgrading from Linux 6.4.12 to 6.5 and later results in only a blank
> > screen after boot and a rapidly flashing device-access-status
> > indicator.
>
> This additional report makes me wonder if we should revert the culprit
> (60aebc9559492c ("drivers/firmware: Move sysfb_init() from
> device_initcall to subsys_initcall_sync") [v6.5-rc1]). But I guess that
> might lead to regressions for some users? But the patch description says
> that this is not a common configuration, so can we maybe get away with th=
at?
From my point of view, this is not a regression, 60aebc9559492c
doesn't cause a problem, but exposes a problem. So we need to fix the
real problem (SIMPLEDRM has a blank screen on some conditions). This
needs Jaak or Evan's help.

Huacai
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> >>>>>> When SIMPLEDRM takes over the framebuffer, the screen is blank (do=
n't
> >>>>>> know why). And before 60aebc9559492cea6a9625f ("drivers/firmware: =
Move
> >>>>>> sysfb_init() from device_initcall to subsys_initcall_sync") there =
is
> >>>>>> no platform device created for SIMPLEDRM at early stage, so it see=
ms
> >>>>>> also "no problem".
> >>>>> I don't understand above. You mean that after that commit the platf=
orm
> >>>>> device is also none, right?
> >>>> No. The SIMPLEDRM driver needs a platform device to work, and that
> >>>> commit makes the platform device created earlier. So, before that
> >>>> commit, SIMPLEDRM doesn't work, but the screen isn't blank; after th=
at
> >>>> commit, SIMPLEDRM works, but the screen is blank.
> >>>>
> >>>> Huacai
> >>>>>
> >>>>> Confused...
> >>>>>
> >>>>> --
> >>>>> An old man doll... just what I always wanted! - Clara
> >>>>
> >>>>
> >
> >

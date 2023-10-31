Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A63977DCCCE
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 13:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1279D10E47D;
	Tue, 31 Oct 2023 12:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9FB10E47D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 12:18:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0A4CBB80ECB
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 12:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64EBEC433C9
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 12:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698754683;
 bh=+07EIdZzApKtvodl/APXonDCzegu5yRYYAndOuglU3Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JhRu3R8VaNTiInn8hLaSfS1Gs6sGSF9ntO2za+/VJ0IkjwAAkvHBWQPm+ihOmUjb7
 VdbBdwVvX6Xlalhm4w9b7pF1gle+0iQOAudadZdiY5GM3x5uPtMmYOwFw9iMbL80Zx
 7itKmsyGHrKv56OfENB64o6jgfqZfADRY6opfIgGhINQ5QrcSIgsd3gqAtPS4Q+sKI
 bHk2zPgIsVKng/HTIvr0klsOKEx9b/RWNJdVf65u1EU5qgcrv64nbt9A80+g9a2M9v
 5y1X84kYs0zQ33m40vXz3AGeaLjN6KVN8oUEJfBsqn61yDyHTdpIodhqGxjRlYC7FC
 Ps/kBtNtD5ppQ==
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso836240466b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 05:18:03 -0700 (PDT)
X-Gm-Message-State: AOJu0YyaCzOcwtyOtzvj2u05PkgbfiPe8ACDJbx0Rg7Isw5vAZeNOjWa
 Aizs4ON0wVCqjpH9z037Ur3pup3FlLpyg3odITY=
X-Google-Smtp-Source: AGHT+IEUyC50HI4SBbvFRIsBS2tkEZDUrTMVdws+u+gRrQJccqgLqe+zPJt91ueb+OCWKgegYZyb+/rcSQGIqibYB2Y=
X-Received: by 2002:a17:907:da0:b0:9bd:a73a:7a0d with SMTP id
 go32-20020a1709070da000b009bda73a7a0dmr12467189ejc.13.1698754681849; Tue, 31
 Oct 2023 05:18:01 -0700 (PDT)
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
 <CAAhV-H5DH3Oj3ttSpa_k6jUdZ+0_pMwgoaqUTGGFr46j7DMXRw@mail.gmail.com>
 <ba16ad66-4b35-4fb4-b4e6-1d785f260eea@ristioja.ee>
 <CAAhV-H64AKdGoHnVLLOYXznpr_aq1jC_TUYXFQRdOjoBxanxkw@mail.gmail.com>
 <c3bb7983-86e4-424e-aadd-e82a0cb6ef37@ristioja.ee>
 <CAAhV-H7UTnTWQeT_qo7VgBczaZo37zjosREr16H8DsLi21XPqQ@mail.gmail.com>
In-Reply-To: <CAAhV-H7UTnTWQeT_qo7VgBczaZo37zjosREr16H8DsLi21XPqQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 31 Oct 2023 20:17:49 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7fJS3-3_hqA4BUdH+q5EG6wSmEoPpO-fUZn5h35O=6OA@mail.gmail.com>
Message-ID: <CAAhV-H7fJS3-3_hqA4BUdH+q5EG6wSmEoPpO-fUZn5h35O=6OA@mail.gmail.com>
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
To: Jaak Ristioja <jaak@ristioja.ee>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Evan Preston <x.arch@epreston.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jaak and Evan,

On Sun, Oct 29, 2023 at 9:42=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Sat, Oct 28, 2023 at 7:06=E2=80=AFPM Jaak Ristioja <jaak@ristioja.ee> =
wrote:
> >
> > On 26.10.23 03:58, Huacai Chen wrote:
> > > Hi, Jaak,
> > >
> > > On Thu, Oct 26, 2023 at 2:49=E2=80=AFAM Jaak Ristioja <jaak@ristioja.=
ee> wrote:
> > >>
> > >> On 25.10.23 16:23, Huacai Chen wrote:
> > >>> On Wed, Oct 25, 2023 at 6:08=E2=80=AFPM Thorsten Leemhuis
> > >>> <regressions@leemhuis.info> wrote:
> > >>>>
> > >>>> Javier, Dave, Sima,
> > >>>>
> > >>>> On 23.10.23 00:54, Evan Preston wrote:
> > >>>>> On 2023-10-20 Fri 05:48pm, Huacai Chen wrote:
> > >>>>>> On Fri, Oct 20, 2023 at 5:35=E2=80=AFPM Linux regression trackin=
g (Thorsten
> > >>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> > >>>>>>> On 09.10.23 10:54, Huacai Chen wrote:
> > >>>>>>>> On Mon, Oct 9, 2023 at 4:45=E2=80=AFPM Bagas Sanjaya <bagasdot=
me@gmail.com> wrote:
> > >>>>>>>>> On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Chen wrote:
> > >>>>>>>>>> On Tue, Sep 26, 2023 at 10:31=E2=80=AFPM Huacai Chen <chenhu=
acai@kernel.org> wrote:
> > >>>>>>>>>>> On Tue, Sep 26, 2023 at 7:15=E2=80=AFPM Linux regression tr=
acking (Thorsten
> > >>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> > >>>>>>>>>>>> On 13.09.23 14:02, Jaak Ristioja wrote:
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integra=
ted Intel HD
> > >>>>>>>>>>>>> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) result=
s in a blank
> > >>>>>>>>>>>>> screen after boot until the display manager starts... if =
it does start
> > >>>>>>>>>>>>> at all. Using the nomodeset kernel parameter seems to be =
a workaround.
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>> I've bisected this to commit 60aebc9559492cea6a9625f514a8=
041717e3a2e4
> > >>>>>>>>>>>>> ("drivers/firmware: Move sysfb_init() from device_initcal=
l to
> > >>>>>>>>>>>>> subsys_initcall_sync").
> > >>>>>>>>>>>>
> > >>>>>>>>>> As confirmed by Jaak, disabling DRM_SIMPLEDRM makes things w=
ork fine
> > >>>>>>>>>> again. So I guess the reason:
> > >>>>>>>
> > >>>>>>> Well, this to me still looks a lot (please correct me if I'm wr=
ong) like
> > >>>>>>> regression that should be fixed, as DRM_SIMPLEDRM was enabled b=
eforehand
> > >>>>>>> if I understood things correctly. Or is there a proper fix for =
this
> > >>>>>>> already in the works and I just missed this? Or is there some g=
ood
> > >>>>>>> reason why this won't/can't be fixed?
> > >>>>>>
> > >>>>>> DRM_SIMPLEDRM was enabled but it didn't work at all because ther=
e was
> > >>>>>> no corresponding platform device. Now DRM_SIMPLEDRM works but it=
 has a
> > >>>>>> blank screen. Of course it is valuable to investigate further ab=
out
> > >>>>>> DRM_SIMPLEDRM on Jaak's machine, but that needs Jaak's effort be=
cause
> > >>>>>> I don't have a same machine.
> > >>>>
> > >>>> Side note: Huacai, have you tried working with Jaak to get down to=
 the
> > >>>> real problem? Evan, might you be able to help out here?
> > >>> No, Jaak has no response after he 'fixed' his problem by disabling =
SIMPLEDRM.
> > >>>
> > >>
> > >> I'm sorry, what was it exactly you want me to do? Please be mindful =
that
> > >> I'm not familiar with the internals of the Linux kernel and DRI, and=
 it
> > >> might sometimes take weeks before I have time to work and respond on=
 this.
> > > It doesn't matter. I hope you can do some experiments to investigate
> > > deeper. The first experiment you can do is enabling SIMPLEFB (i.e.
> > > CONFIG_FB_SIMPLE) instead of SIMPLEDRM (CONFIG_DRM_SIMPLEDRM) to see
> > > whether there is also a blank screen. If no blank screen, that
> > > probably means SIMPLEDRM has a bug, if still blank screen, that means
> > > the firmware may pass wrong screen information.
> >
> > Testing with 6.5.9 I get a blank screen with CONFIG_DRM_SIMPLEDRM=3Dy a=
nd
> > get no blank screen with CONFIG_FB_SIMPLE=3Dy and CONFIG_DRM_SIMPLEDRM =
unset.
> CONFIG_FB_SIMPLE and  CONFIG_DRM_SIMPLEDRM use the same device created
> by sysfb_init(). Since FB_SIMPLE works fine, I think the real problem
> is that DRM_SIMPLEDRM has a bug. The next step is to enable
> CONFIG_DRM_SIMPLEDRM and trace its initialization. In detail, adding
> some printk() in simpledrm_probe() and its sub-routines to see where
> the driver fails. The output of these printk() can be seen by the
> 'dmesg' command after boot.
I need your help. I tried with my laptop (ThinkPad E490, Intel Core
i3-8145U, UHD Graphics 620) but I can't reproduce your problem. So
please patch your 6.5.x kernel with this temporary patch [1], then
build a "bad kernel" with SIMPLEDRM enabled. And after booting your
machine with this "bad kernel", please give me the dmesg output. Thank
you very much.

[1] http://ddns.miaomiaomiao.top:9000/download/kernel/patch-6.5.9


Huacai

>
> Huacai
>
> >
> > Jaak
> >
> > >
> > > Huacai
> > >
> > >>
> > >> Jaak
> > >>
> > >>>>
> > >>>> But I write this mail for a different reason:
> > >>>>
> > >>>>> I am having the same issue on a Lenovo Thinkpad P70 (Intel
> > >>>>> Corporation HD Graphics 530 (rev 06), Intel(R) Core(TM) i7-6700HQ=
).
> > >>>>> Upgrading from Linux 6.4.12 to 6.5 and later results in only a bl=
ank
> > >>>>> screen after boot and a rapidly flashing device-access-status
> > >>>>> indicator.
> > >>>>
> > >>>> This additional report makes me wonder if we should revert the cul=
prit
> > >>>> (60aebc9559492c ("drivers/firmware: Move sysfb_init() from
> > >>>> device_initcall to subsys_initcall_sync") [v6.5-rc1]). But I guess=
 that
> > >>>> might lead to regressions for some users? But the patch descriptio=
n says
> > >>>> that this is not a common configuration, so can we maybe get away =
with that?
> > >>>   From my point of view, this is not a regression, 60aebc9559492c
> > >>> doesn't cause a problem, but exposes a problem. So we need to fix t=
he
> > >>> real problem (SIMPLEDRM has a blank screen on some conditions). Thi=
s
> > >>> needs Jaak or Evan's help.
> > >>>
> > >>> Huacai
> > >>>>
> > >>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker=
' hat)
> > >>>> --
> > >>>> Everything you wanna know about Linux kernel regression tracking:
> > >>>> https://linux-regtracking.leemhuis.info/about/#tldr
> > >>>> If I did something stupid, please tell me, as explained on that pa=
ge.
> > >>>>
> > >>>>>>>>>> When SIMPLEDRM takes over the framebuffer, the screen is bla=
nk (don't
> > >>>>>>>>>> know why). And before 60aebc9559492cea6a9625f ("drivers/firm=
ware: Move
> > >>>>>>>>>> sysfb_init() from device_initcall to subsys_initcall_sync") =
there is
> > >>>>>>>>>> no platform device created for SIMPLEDRM at early stage, so =
it seems
> > >>>>>>>>>> also "no problem".
> > >>>>>>>>> I don't understand above. You mean that after that commit the=
 platform
> > >>>>>>>>> device is also none, right?
> > >>>>>>>> No. The SIMPLEDRM driver needs a platform device to work, and =
that
> > >>>>>>>> commit makes the platform device created earlier. So, before t=
hat
> > >>>>>>>> commit, SIMPLEDRM doesn't work, but the screen isn't blank; af=
ter that
> > >>>>>>>> commit, SIMPLEDRM works, but the screen is blank.
> > >>>>>>>>
> > >>>>>>>> Huacai
> > >>>>>>>>>
> > >>>>>>>>> Confused...
> > >>>>>>>>>
> > >>>>>>>>> --
> > >>>>>>>>> An old man doll... just what I always wanted! - Clara
> > >>>>>>>>
> > >>>>>>>>
> > >>>>>
> > >>>>>
> > >>
> >

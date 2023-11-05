Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1527E1356
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 13:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E4410E108;
	Sun,  5 Nov 2023 12:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C025E10E108
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 12:40:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C04D260C0A
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 12:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2323C433D9
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 12:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699188018;
 bh=UlRvN1XW4imDj5hB5w4pH9EFySsWe4m678JLij106MY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=e0Sqcsla1lp118ajyAU3s50PVm8wMNyTOZqPBFMVBxLaM+QgIVYUy68tFgRmSE0N9
 4jSg3DUmfaoqG/uk9nnZ4kMC99dEEXZ552WpX9PBke7NUyCqYS0i6jBSuatGRcXci4
 AnbSAlpCII3Om5FSnxmef4n3PjYYwJgZsbiqrZC8iNF9eB/8pxzdJAk84gE8VFMDJs
 cx9YVuJwjzqwqKcbNk0B7lDBToppxNweQ9hTFW8bCKBD/EShtNITsZ6JRQHivNy/0t
 mgGgI42H2GgKbMKm9JdQnFTIwhPF9MDDAx+datSBm5/M4M19n6tACKEH9AEsS4VfXv
 9I/4/2RvxGqLQ==
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-9d2d8343dc4so526958366b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Nov 2023 04:40:18 -0800 (PST)
X-Gm-Message-State: AOJu0YyuTHXx7n99jEEi13QEu8HZqLwo6mdNSvQcaKDTfN0NWiYLVkPi
 4wx10b5pyQ6j7zokNI2PqPspqY7yHxyNmlud314=
X-Google-Smtp-Source: AGHT+IH6UvdsgqPbx1F9mdadLQFo/mjU6ogqiP23s0xOM0o6HCSWBAF42Rz2wcAy7wvE1ELeZvhPXk8dLNDQnlyx464=
X-Received: by 2002:a17:906:478a:b0:9be:e278:4d47 with SMTP id
 cw10-20020a170906478a00b009bee2784d47mr12268596ejc.27.1699188017004; Sun, 05
 Nov 2023 04:40:17 -0800 (PST)
MIME-Version: 1.0
References: <CAAhV-H5DH3Oj3ttSpa_k6jUdZ+0_pMwgoaqUTGGFr46j7DMXRw@mail.gmail.com>
 <ba16ad66-4b35-4fb4-b4e6-1d785f260eea@ristioja.ee>
 <CAAhV-H64AKdGoHnVLLOYXznpr_aq1jC_TUYXFQRdOjoBxanxkw@mail.gmail.com>
 <c3bb7983-86e4-424e-aadd-e82a0cb6ef37@ristioja.ee>
 <CAAhV-H7UTnTWQeT_qo7VgBczaZo37zjosREr16H8DsLi21XPqQ@mail.gmail.com>
 <CAAhV-H7fJS3-3_hqA4BUdH+q5EG6wSmEoPpO-fUZn5h35O=6OA@mail.gmail.com>
 <31ed0db1-9398-4c46-a391-fc644ec49268@ristioja.ee>
 <CAAhV-H4MekBgYZ1nJ-M7bnpo3bczOMcTanij18ACCALz2svjQQ@mail.gmail.com>
 <ZUSJDG82vzbuyFEY@P70.localdomain>
 <CAAhV-H6GyOnTOm6b8Xp=ySctyE-T905WKDUS2AZuqnEyzM7ZEg@mail.gmail.com>
 <ZUWtTuIcMwwCWg7z@P70.localdomain>
In-Reply-To: <ZUWtTuIcMwwCWg7z@P70.localdomain>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 5 Nov 2023 20:40:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7wnjac1Znr2yh8S2bGwuxF1RRGp=cn9oracrWm6y5VVQ@mail.gmail.com>
Message-ID: <CAAhV-H7wnjac1Znr2yh8S2bGwuxF1RRGp=cn9oracrWm6y5VVQ@mail.gmail.com>
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
To: Evan Preston <x.arch@epreston.net>
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jaak Ristioja <jaak@ristioja.ee>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Evan,

On Sat, Nov 4, 2023 at 10:50=E2=80=AFAM Evan Preston <x.arch@epreston.net> =
wrote:
>
> Hi Huacai,
>
> On 2023-11-03 Fri 02:36pm, Huacai Chen wrote:
> > Hi, Evan,
> >
> > On Fri, Nov 3, 2023 at 1:54=E2=80=AFPM Evan Preston <x.arch@epreston.ne=
t> wrote:
> > >
> > > Hi Huacai,
> > >
> > > On 2023-11-02 Thu 08:38pm, Huacai Chen wrote:
> > > > Hi, Jaak,
> > > >
> > > > On Wed, Nov 1, 2023 at 7:52=E2=80=AFPM Jaak Ristioja <jaak@ristioja=
.ee> wrote:
> > > > >
> > > > > On 31.10.23 14:17, Huacai Chen wrote:
> > > > > > Hi, Jaak and Evan,
> > > > > >
> > > > > > On Sun, Oct 29, 2023 at 9:42=E2=80=AFAM Huacai Chen <chenhuacai=
@kernel.org> wrote:
> > > > > >>
> > > > > >> On Sat, Oct 28, 2023 at 7:06=E2=80=AFPM Jaak Ristioja <jaak@ri=
stioja.ee> wrote:
> > > > > >>>
> > > > > >>> On 26.10.23 03:58, Huacai Chen wrote:
> > > > > >>>> Hi, Jaak,
> > > > > >>>>
> > > > > >>>> On Thu, Oct 26, 2023 at 2:49=E2=80=AFAM Jaak Ristioja <jaak@=
ristioja.ee> wrote:
> > > > > >>>>>
> > > > > >>>>> On 25.10.23 16:23, Huacai Chen wrote:
> > > > > >>>>>> On Wed, Oct 25, 2023 at 6:08=E2=80=AFPM Thorsten Leemhuis
> > > > > >>>>>> <regressions@leemhuis.info> wrote:
> > > > > >>>>>>>
> > > > > >>>>>>> Javier, Dave, Sima,
> > > > > >>>>>>>
> > > > > >>>>>>> On 23.10.23 00:54, Evan Preston wrote:
> > > > > >>>>>>>> On 2023-10-20 Fri 05:48pm, Huacai Chen wrote:
> > > > > >>>>>>>>> On Fri, Oct 20, 2023 at 5:35=E2=80=AFPM Linux regressio=
n tracking (Thorsten
> > > > > >>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> > > > > >>>>>>>>>> On 09.10.23 10:54, Huacai Chen wrote:
> > > > > >>>>>>>>>>> On Mon, Oct 9, 2023 at 4:45=E2=80=AFPM Bagas Sanjaya =
<bagasdotme@gmail.com> wrote:
> > > > > >>>>>>>>>>>> On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Che=
n wrote:
> > > > > >>>>>>>>>>>>> On Tue, Sep 26, 2023 at 10:31=E2=80=AFPM Huacai Che=
n <chenhuacai@kernel.org> wrote:
> > > > > >>>>>>>>>>>>>> On Tue, Sep 26, 2023 at 7:15=E2=80=AFPM Linux regr=
ession tracking (Thorsten
> > > > > >>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> > > > > >>>>>>>>>>>>>>> On 13.09.23 14:02, Jaak Ristioja wrote:
> > > > > >>>>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>>>> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570=
 (Integrated Intel HD
> > > > > >>>>>>>>>>>>>>>> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500=
U) results in a blank
> > > > > >>>>>>>>>>>>>>>> screen after boot until the display manager star=
ts... if it does start
> > > > > >>>>>>>>>>>>>>>> at all. Using the nomodeset kernel parameter see=
ms to be a workaround.
> > > > > >>>>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>>>> I've bisected this to commit 60aebc9559492cea6a9=
625f514a8041717e3a2e4
> > > > > >>>>>>>>>>>>>>>> ("drivers/firmware: Move sysfb_init() from devic=
e_initcall to
> > > > > >>>>>>>>>>>>>>>> subsys_initcall_sync").
> > > > > >>>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>> As confirmed by Jaak, disabling DRM_SIMPLEDRM makes=
 things work fine
> > > > > >>>>>>>>>>>>> again. So I guess the reason:
> > > > > >>>>>>>>>>
> > > > > >>>>>>>>>> Well, this to me still looks a lot (please correct me =
if I'm wrong) like
> > > > > >>>>>>>>>> regression that should be fixed, as DRM_SIMPLEDRM was =
enabled beforehand
> > > > > >>>>>>>>>> if I understood things correctly. Or is there a proper=
 fix for this
> > > > > >>>>>>>>>> already in the works and I just missed this? Or is the=
re some good
> > > > > >>>>>>>>>> reason why this won't/can't be fixed?
> > > > > >>>>>>>>>
> > > > > >>>>>>>>> DRM_SIMPLEDRM was enabled but it didn't work at all bec=
ause there was
> > > > > >>>>>>>>> no corresponding platform device. Now DRM_SIMPLEDRM wor=
ks but it has a
> > > > > >>>>>>>>> blank screen. Of course it is valuable to investigate f=
urther about
> > > > > >>>>>>>>> DRM_SIMPLEDRM on Jaak's machine, but that needs Jaak's =
effort because
> > > > > >>>>>>>>> I don't have a same machine.
> > > > > >>>>>>>
> > > > > >>>>>>> Side note: Huacai, have you tried working with Jaak to ge=
t down to the
> > > > > >>>>>>> real problem? Evan, might you be able to help out here?
> > > > > >>>>>> No, Jaak has no response after he 'fixed' his problem by d=
isabling SIMPLEDRM.
> > > > > >>>>>>
> > > > > >>>>>
> > > > > >>>>> I'm sorry, what was it exactly you want me to do? Please be=
 mindful that
> > > > > >>>>> I'm not familiar with the internals of the Linux kernel and=
 DRI, and it
> > > > > >>>>> might sometimes take weeks before I have time to work and r=
espond on this.
> > > > > >>>> It doesn't matter. I hope you can do some experiments to inv=
estigate
> > > > > >>>> deeper. The first experiment you can do is enabling SIMPLEFB=
 (i.e.
> > > > > >>>> CONFIG_FB_SIMPLE) instead of SIMPLEDRM (CONFIG_DRM_SIMPLEDRM=
) to see
> > > > > >>>> whether there is also a blank screen. If no blank screen, th=
at
> > > > > >>>> probably means SIMPLEDRM has a bug, if still blank screen, t=
hat means
> > > > > >>>> the firmware may pass wrong screen information.
> > > > > >>>
> > > > > >>> Testing with 6.5.9 I get a blank screen with CONFIG_DRM_SIMPL=
EDRM=3Dy and
> > > > > >>> get no blank screen with CONFIG_FB_SIMPLE=3Dy and CONFIG_DRM_=
SIMPLEDRM unset.
> > > > > >> CONFIG_FB_SIMPLE and  CONFIG_DRM_SIMPLEDRM use the same device=
 created
> > > > > >> by sysfb_init(). Since FB_SIMPLE works fine, I think the real =
problem
> > > > > >> is that DRM_SIMPLEDRM has a bug. The next step is to enable
> > > > > >> CONFIG_DRM_SIMPLEDRM and trace its initialization. In detail, =
adding
> > > > > >> some printk() in simpledrm_probe() and its sub-routines to see=
 where
> > > > > >> the driver fails. The output of these printk() can be seen by =
the
> > > > > >> 'dmesg' command after boot.
> > > > > > I need your help. I tried with my laptop (ThinkPad E490, Intel =
Core
> > > > > > i3-8145U, UHD Graphics 620) but I can't reproduce your problem.=
 So
> > > > > > please patch your 6.5.x kernel with this temporary patch [1], t=
hen
> > > > > > build a "bad kernel" with SIMPLEDRM enabled. And after booting =
your
> > > > > > machine with this "bad kernel", please give me the dmesg output=
. Thank
> > > > > > you very much.
> > > > > >
> > > > > > [1] http://ddns.miaomiaomiao.top:9000/download/kernel/patch-6.5=
.9
> > > > >
> > > > > I'm unable to download it. Can you please send it by e-mail?
> > > > I'm sorry, please download from attachment.
> > >
> > > When applying this patch the first hunk (drivers/firmware/sysfb.c) fa=
ils for
> > > me with 6.5.9.  Attempting to load the 6.5.9 kernel without this patc=
h
> > > produces no dmesg output on my machine.
> > You copy-paste the patch? If you download it directly it can be
> > applied successfully, I think.
>
> The patch downloaded from your URL applies successfully.  However, I stil=
l
> see no dmesg output using the patched 6.5.9 kernel.  'journalctl -k -b al=
l'
> shows no dmesg output from any 6.5.x boots, only from 6.4.12 boots.
Thank you for your testing. Since you cannot boot to GUI successfully
as Jaak, you may have some troubles with getting the dmesg output. But
you can try to use "systemd.unit=3Dmulti-user.target" boot parameters.
In this way you may boot to the login: prompt and then you can get
dmesg output. Or if you still fail, you may use 'jornalctl -k -b -1'
to get the previous dmesg output with 6.4.12.

Hi, Jaak,

Have you tested? I think you can successfully get a dmesg output with my pa=
tch.

>
> Evan
>
> >
> > Huacai
> >
> > >
> > > Evan
> > >
> > > >
> > > > Huacai
> > > >
> > > > >
> > > > > Jaak
> > > > >
> > > > > >
> > > > > >
> > > > > > Huacai
> > > > > >
> > > > > >>
> > > > > >> Huacai
> > > > > >>
> > > > > >>>
> > > > > >>> Jaak
> > > > > >>>
> > > > > >>>>
> > > > > >>>> Huacai
> > > > > >>>>
> > > > > >>>>>
> > > > > >>>>> Jaak
> > > > > >>>>>
> > > > > >>>>>>>
> > > > > >>>>>>> But I write this mail for a different reason:
> > > > > >>>>>>>
> > > > > >>>>>>>> I am having the same issue on a Lenovo Thinkpad P70 (Int=
el
> > > > > >>>>>>>> Corporation HD Graphics 530 (rev 06), Intel(R) Core(TM) =
i7-6700HQ).
> > > > > >>>>>>>> Upgrading from Linux 6.4.12 to 6.5 and later results in =
only a blank
> > > > > >>>>>>>> screen after boot and a rapidly flashing device-access-s=
tatus
> > > > > >>>>>>>> indicator.
> > > > > >>>>>>>
> > > > > >>>>>>> This additional report makes me wonder if we should rever=
t the culprit
> > > > > >>>>>>> (60aebc9559492c ("drivers/firmware: Move sysfb_init() fro=
m
> > > > > >>>>>>> device_initcall to subsys_initcall_sync") [v6.5-rc1]). Bu=
t I guess that
> > > > > >>>>>>> might lead to regressions for some users? But the patch d=
escription says
> > > > > >>>>>>> that this is not a common configuration, so can we maybe =
get away with that?
> > > > > >>>>>>    From my point of view, this is not a regression, 60aebc=
9559492c
> > > > > >>>>>> doesn't cause a problem, but exposes a problem. So we need=
 to fix the
> > > > > >>>>>> real problem (SIMPLEDRM has a blank screen on some conditi=
ons). This
> > > > > >>>>>> needs Jaak or Evan's help.
> > > > > >>>>>>
> > > > > >>>>>> Huacai
> > > > > >>>>>>>
> > > > > >>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regressio=
n tracker' hat)
> > > > > >>>>>>> --
> > > > > >>>>>>> Everything you wanna know about Linux kernel regression t=
racking:
> > > > > >>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
> > > > > >>>>>>> If I did something stupid, please tell me, as explained o=
n that page.
> > > > > >>>>>>>
> > > > > >>>>>>>>>>>>> When SIMPLEDRM takes over the framebuffer, the scre=
en is blank (don't
> > > > > >>>>>>>>>>>>> know why). And before 60aebc9559492cea6a9625f ("dri=
vers/firmware: Move
> > > > > >>>>>>>>>>>>> sysfb_init() from device_initcall to subsys_initcal=
l_sync") there is
> > > > > >>>>>>>>>>>>> no platform device created for SIMPLEDRM at early s=
tage, so it seems
> > > > > >>>>>>>>>>>>> also "no problem".
> > > > > >>>>>>>>>>>> I don't understand above. You mean that after that c=
ommit the platform
> > > > > >>>>>>>>>>>> device is also none, right?
> > > > > >>>>>>>>>>> No. The SIMPLEDRM driver needs a platform device to w=
ork, and that
> > > > > >>>>>>>>>>> commit makes the platform device created earlier. So,=
 before that
> > > > > >>>>>>>>>>> commit, SIMPLEDRM doesn't work, but the screen isn't =
blank; after that
> > > > > >>>>>>>>>>> commit, SIMPLEDRM works, but the screen is blank.
> > > > > >>>>>>>>>>>
> > > > > >>>>>>>>>>> Huacai
> > > > > >>>>>>>>>>>>
> > > > > >>>>>>>>>>>> Confused...
> > > > > >>>>>>>>>>>>
> > > > > >>>>>>>>>>>> --
> > > > > >>>>>>>>>>>> An old man doll... just what I always wanted! - Clar=
a
> > > > > >>>>>>>>>>>
> > > > > >>>>>>>>>>>
> > > > > >>>>>>>>
> > > > > >>>>>>>>
> > > > > >>>>>
> > > > > >>>
> > > > >
> > >
> > >

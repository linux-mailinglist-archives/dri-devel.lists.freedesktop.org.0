Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4967DFF35
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 07:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82DA10E064;
	Fri,  3 Nov 2023 06:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A293710E064
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 06:36:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E00CE6152D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 06:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ECA6C433D9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698993415;
 bh=uGFIe74ep8DudwxIo3EhJhTyvWFwIB7jua7bjSCIcVQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bVqdP7wYxD/+mfgI8o4q2okqrApZzo/HhdONohcbEKuFqBaI2JGdFU3SsroSEZN5y
 9IX3fFnZHtB1oSuFTlqyUjlxz1fszzH8IdN4HZaVpK8V01jOyJcCghR2OgAoibg+L3
 opW3G36Ns30BcsFWgB97qVvacjoyivNZyAsrNhKhgFhalBWrcH00SGvDTIGWCwcqr+
 6H1YjFFvb8zS7F/7XZe2AjN+lhRR3iJ+xEgXIMvpgMuUoa71NXj3Ta40hXWbnEEP/o
 ut0MHCBSevuAC9NDFS7/adn6tSva6T2QwcjXnpReiEqXTy3xG2mTcjmzvb9I4TGuZv
 y1DSfTEq/nilQ==
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-9d2e7726d5bso258351766b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 23:36:55 -0700 (PDT)
X-Gm-Message-State: AOJu0YyoQIxeIadi1mYvPvOh/jte44UgW4UFJIM5ng3FHowkTTuVW1v5
 JIibonRKNDrNqaJodnlTpc/zSG26WMFpQ4garpU=
X-Google-Smtp-Source: AGHT+IH2wBy6C2v47QiEh+/oIl5NyvvXKljpz9IZdiO0ck4H9/hLyqt4SMvbZndPDC38Xsxq6wwIJ7eYInuD9Wn0Y/U=
X-Received: by 2002:a17:907:a08a:b0:9c7:db3:8b36 with SMTP id
 hu10-20020a170907a08a00b009c70db38b36mr5915977ejc.74.1698993413600; Thu, 02
 Nov 2023 23:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <ZTWoDSPxGO-ApR4r@P70.localdomain>
 <82f1b533-3bd8-4418-843a-718d9a6b5786@leemhuis.info>
 <CAAhV-H5DH3Oj3ttSpa_k6jUdZ+0_pMwgoaqUTGGFr46j7DMXRw@mail.gmail.com>
 <ba16ad66-4b35-4fb4-b4e6-1d785f260eea@ristioja.ee>
 <CAAhV-H64AKdGoHnVLLOYXznpr_aq1jC_TUYXFQRdOjoBxanxkw@mail.gmail.com>
 <c3bb7983-86e4-424e-aadd-e82a0cb6ef37@ristioja.ee>
 <CAAhV-H7UTnTWQeT_qo7VgBczaZo37zjosREr16H8DsLi21XPqQ@mail.gmail.com>
 <CAAhV-H7fJS3-3_hqA4BUdH+q5EG6wSmEoPpO-fUZn5h35O=6OA@mail.gmail.com>
 <31ed0db1-9398-4c46-a391-fc644ec49268@ristioja.ee>
 <CAAhV-H4MekBgYZ1nJ-M7bnpo3bczOMcTanij18ACCALz2svjQQ@mail.gmail.com>
 <ZUSJDG82vzbuyFEY@P70.localdomain>
In-Reply-To: <ZUSJDG82vzbuyFEY@P70.localdomain>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 3 Nov 2023 14:36:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6GyOnTOm6b8Xp=ySctyE-T905WKDUS2AZuqnEyzM7ZEg@mail.gmail.com>
Message-ID: <CAAhV-H6GyOnTOm6b8Xp=ySctyE-T905WKDUS2AZuqnEyzM7ZEg@mail.gmail.com>
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

On Fri, Nov 3, 2023 at 1:54=E2=80=AFPM Evan Preston <x.arch@epreston.net> w=
rote:
>
> Hi Huacai,
>
> On 2023-11-02 Thu 08:38pm, Huacai Chen wrote:
> > Hi, Jaak,
> >
> > On Wed, Nov 1, 2023 at 7:52=E2=80=AFPM Jaak Ristioja <jaak@ristioja.ee>=
 wrote:
> > >
> > > On 31.10.23 14:17, Huacai Chen wrote:
> > > > Hi, Jaak and Evan,
> > > >
> > > > On Sun, Oct 29, 2023 at 9:42=E2=80=AFAM Huacai Chen <chenhuacai@ker=
nel.org> wrote:
> > > >>
> > > >> On Sat, Oct 28, 2023 at 7:06=E2=80=AFPM Jaak Ristioja <jaak@ristio=
ja.ee> wrote:
> > > >>>
> > > >>> On 26.10.23 03:58, Huacai Chen wrote:
> > > >>>> Hi, Jaak,
> > > >>>>
> > > >>>> On Thu, Oct 26, 2023 at 2:49=E2=80=AFAM Jaak Ristioja <jaak@rist=
ioja.ee> wrote:
> > > >>>>>
> > > >>>>> On 25.10.23 16:23, Huacai Chen wrote:
> > > >>>>>> On Wed, Oct 25, 2023 at 6:08=E2=80=AFPM Thorsten Leemhuis
> > > >>>>>> <regressions@leemhuis.info> wrote:
> > > >>>>>>>
> > > >>>>>>> Javier, Dave, Sima,
> > > >>>>>>>
> > > >>>>>>> On 23.10.23 00:54, Evan Preston wrote:
> > > >>>>>>>> On 2023-10-20 Fri 05:48pm, Huacai Chen wrote:
> > > >>>>>>>>> On Fri, Oct 20, 2023 at 5:35=E2=80=AFPM Linux regression tr=
acking (Thorsten
> > > >>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> > > >>>>>>>>>> On 09.10.23 10:54, Huacai Chen wrote:
> > > >>>>>>>>>>> On Mon, Oct 9, 2023 at 4:45=E2=80=AFPM Bagas Sanjaya <bag=
asdotme@gmail.com> wrote:
> > > >>>>>>>>>>>> On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Chen wr=
ote:
> > > >>>>>>>>>>>>> On Tue, Sep 26, 2023 at 10:31=E2=80=AFPM Huacai Chen <c=
henhuacai@kernel.org> wrote:
> > > >>>>>>>>>>>>>> On Tue, Sep 26, 2023 at 7:15=E2=80=AFPM Linux regressi=
on tracking (Thorsten
> > > >>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> > > >>>>>>>>>>>>>>> On 13.09.23 14:02, Jaak Ristioja wrote:
> > > >>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (In=
tegrated Intel HD
> > > >>>>>>>>>>>>>>>> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) r=
esults in a blank
> > > >>>>>>>>>>>>>>>> screen after boot until the display manager starts..=
. if it does start
> > > >>>>>>>>>>>>>>>> at all. Using the nomodeset kernel parameter seems t=
o be a workaround.
> > > >>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>> I've bisected this to commit 60aebc9559492cea6a9625f=
514a8041717e3a2e4
> > > >>>>>>>>>>>>>>>> ("drivers/firmware: Move sysfb_init() from device_in=
itcall to
> > > >>>>>>>>>>>>>>>> subsys_initcall_sync").
> > > >>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>> As confirmed by Jaak, disabling DRM_SIMPLEDRM makes thi=
ngs work fine
> > > >>>>>>>>>>>>> again. So I guess the reason:
> > > >>>>>>>>>>
> > > >>>>>>>>>> Well, this to me still looks a lot (please correct me if I=
'm wrong) like
> > > >>>>>>>>>> regression that should be fixed, as DRM_SIMPLEDRM was enab=
led beforehand
> > > >>>>>>>>>> if I understood things correctly. Or is there a proper fix=
 for this
> > > >>>>>>>>>> already in the works and I just missed this? Or is there s=
ome good
> > > >>>>>>>>>> reason why this won't/can't be fixed?
> > > >>>>>>>>>
> > > >>>>>>>>> DRM_SIMPLEDRM was enabled but it didn't work at all because=
 there was
> > > >>>>>>>>> no corresponding platform device. Now DRM_SIMPLEDRM works b=
ut it has a
> > > >>>>>>>>> blank screen. Of course it is valuable to investigate furth=
er about
> > > >>>>>>>>> DRM_SIMPLEDRM on Jaak's machine, but that needs Jaak's effo=
rt because
> > > >>>>>>>>> I don't have a same machine.
> > > >>>>>>>
> > > >>>>>>> Side note: Huacai, have you tried working with Jaak to get do=
wn to the
> > > >>>>>>> real problem? Evan, might you be able to help out here?
> > > >>>>>> No, Jaak has no response after he 'fixed' his problem by disab=
ling SIMPLEDRM.
> > > >>>>>>
> > > >>>>>
> > > >>>>> I'm sorry, what was it exactly you want me to do? Please be min=
dful that
> > > >>>>> I'm not familiar with the internals of the Linux kernel and DRI=
, and it
> > > >>>>> might sometimes take weeks before I have time to work and respo=
nd on this.
> > > >>>> It doesn't matter. I hope you can do some experiments to investi=
gate
> > > >>>> deeper. The first experiment you can do is enabling SIMPLEFB (i.=
e.
> > > >>>> CONFIG_FB_SIMPLE) instead of SIMPLEDRM (CONFIG_DRM_SIMPLEDRM) to=
 see
> > > >>>> whether there is also a blank screen. If no blank screen, that
> > > >>>> probably means SIMPLEDRM has a bug, if still blank screen, that =
means
> > > >>>> the firmware may pass wrong screen information.
> > > >>>
> > > >>> Testing with 6.5.9 I get a blank screen with CONFIG_DRM_SIMPLEDRM=
=3Dy and
> > > >>> get no blank screen with CONFIG_FB_SIMPLE=3Dy and CONFIG_DRM_SIMP=
LEDRM unset.
> > > >> CONFIG_FB_SIMPLE and  CONFIG_DRM_SIMPLEDRM use the same device cre=
ated
> > > >> by sysfb_init(). Since FB_SIMPLE works fine, I think the real prob=
lem
> > > >> is that DRM_SIMPLEDRM has a bug. The next step is to enable
> > > >> CONFIG_DRM_SIMPLEDRM and trace its initialization. In detail, addi=
ng
> > > >> some printk() in simpledrm_probe() and its sub-routines to see whe=
re
> > > >> the driver fails. The output of these printk() can be seen by the
> > > >> 'dmesg' command after boot.
> > > > I need your help. I tried with my laptop (ThinkPad E490, Intel Core
> > > > i3-8145U, UHD Graphics 620) but I can't reproduce your problem. So
> > > > please patch your 6.5.x kernel with this temporary patch [1], then
> > > > build a "bad kernel" with SIMPLEDRM enabled. And after booting your
> > > > machine with this "bad kernel", please give me the dmesg output. Th=
ank
> > > > you very much.
> > > >
> > > > [1] http://ddns.miaomiaomiao.top:9000/download/kernel/patch-6.5.9
> > >
> > > I'm unable to download it. Can you please send it by e-mail?
> > I'm sorry, please download from attachment.
>
> When applying this patch the first hunk (drivers/firmware/sysfb.c) fails =
for
> me with 6.5.9.  Attempting to load the 6.5.9 kernel without this patch
> produces no dmesg output on my machine.
You copy-paste the patch? If you download it directly it can be
applied successfully, I think.

Huacai

>
> Evan
>
> >
> > Huacai
> >
> > >
> > > Jaak
> > >
> > > >
> > > >
> > > > Huacai
> > > >
> > > >>
> > > >> Huacai
> > > >>
> > > >>>
> > > >>> Jaak
> > > >>>
> > > >>>>
> > > >>>> Huacai
> > > >>>>
> > > >>>>>
> > > >>>>> Jaak
> > > >>>>>
> > > >>>>>>>
> > > >>>>>>> But I write this mail for a different reason:
> > > >>>>>>>
> > > >>>>>>>> I am having the same issue on a Lenovo Thinkpad P70 (Intel
> > > >>>>>>>> Corporation HD Graphics 530 (rev 06), Intel(R) Core(TM) i7-6=
700HQ).
> > > >>>>>>>> Upgrading from Linux 6.4.12 to 6.5 and later results in only=
 a blank
> > > >>>>>>>> screen after boot and a rapidly flashing device-access-statu=
s
> > > >>>>>>>> indicator.
> > > >>>>>>>
> > > >>>>>>> This additional report makes me wonder if we should revert th=
e culprit
> > > >>>>>>> (60aebc9559492c ("drivers/firmware: Move sysfb_init() from
> > > >>>>>>> device_initcall to subsys_initcall_sync") [v6.5-rc1]). But I =
guess that
> > > >>>>>>> might lead to regressions for some users? But the patch descr=
iption says
> > > >>>>>>> that this is not a common configuration, so can we maybe get =
away with that?
> > > >>>>>>    From my point of view, this is not a regression, 60aebc9559=
492c
> > > >>>>>> doesn't cause a problem, but exposes a problem. So we need to =
fix the
> > > >>>>>> real problem (SIMPLEDRM has a blank screen on some conditions)=
. This
> > > >>>>>> needs Jaak or Evan's help.
> > > >>>>>>
> > > >>>>>> Huacai
> > > >>>>>>>
> > > >>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tr=
acker' hat)
> > > >>>>>>> --
> > > >>>>>>> Everything you wanna know about Linux kernel regression track=
ing:
> > > >>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
> > > >>>>>>> If I did something stupid, please tell me, as explained on th=
at page.
> > > >>>>>>>
> > > >>>>>>>>>>>>> When SIMPLEDRM takes over the framebuffer, the screen i=
s blank (don't
> > > >>>>>>>>>>>>> know why). And before 60aebc9559492cea6a9625f ("drivers=
/firmware: Move
> > > >>>>>>>>>>>>> sysfb_init() from device_initcall to subsys_initcall_sy=
nc") there is
> > > >>>>>>>>>>>>> no platform device created for SIMPLEDRM at early stage=
, so it seems
> > > >>>>>>>>>>>>> also "no problem".
> > > >>>>>>>>>>>> I don't understand above. You mean that after that commi=
t the platform
> > > >>>>>>>>>>>> device is also none, right?
> > > >>>>>>>>>>> No. The SIMPLEDRM driver needs a platform device to work,=
 and that
> > > >>>>>>>>>>> commit makes the platform device created earlier. So, bef=
ore that
> > > >>>>>>>>>>> commit, SIMPLEDRM doesn't work, but the screen isn't blan=
k; after that
> > > >>>>>>>>>>> commit, SIMPLEDRM works, but the screen is blank.
> > > >>>>>>>>>>>
> > > >>>>>>>>>>> Huacai
> > > >>>>>>>>>>>>
> > > >>>>>>>>>>>> Confused...
> > > >>>>>>>>>>>>
> > > >>>>>>>>>>>> --
> > > >>>>>>>>>>>> An old man doll... just what I always wanted! - Clara
> > > >>>>>>>>>>>
> > > >>>>>>>>>>>
> > > >>>>>>>>
> > > >>>>>>>>
> > > >>>>>
> > > >>>
> > >
>
>

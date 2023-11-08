Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223947E4F2A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 03:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9B910E36B;
	Wed,  8 Nov 2023 02:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45F710E6F8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 02:52:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DC6BAB81A8F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 02:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316C0C433C7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 02:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699411945;
 bh=nc57CPCPeivqPzU7jPLtJAMiVDSdp0ukbOz7hMGShOA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VJv+PL7wrraXqRvpzcRCCzOiL/gCWoQdb+dQ5xuLUfiGkjW2QbN8//lQdpAXUnHVv
 3Xo+23yLzvcjrtp6khKp8TpolvcltSSDdUrlr09xbO2quMzFV+47slOObiVq+nb2jX
 uTr89lgDn6X9G2oNIntP2RVtug6sPkgfrFTppeZ1TssAjPMNIK7q9hQ2mOi6tUrLfB
 rJncbTKRI4f334oVDDb3kmZQ8B2T6Fh+qiJbt7vuygUJDep/FEbeU7mvOAU6REWgdy
 Lm4/GWz5RpG0dwSh2w0DaFLaaexyIKn40CIBzFpBdmKlkQZ3ORjn5fK/Yo3+JCrCct
 xPyvC8tV7cpTQ==
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-9df8d0c556eso476026066b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 18:52:25 -0800 (PST)
X-Gm-Message-State: AOJu0Yyt081uZPPxEUywxPLudOvp0XOUxtnsVfx8zDmokxmvF7D4eDcE
 pgENi9Oe3skm4K5Q5xIVJhNXx58UC6x838LT5tQ=
X-Google-Smtp-Source: AGHT+IFH7iRDeO3r4jRwu31hr2IEdrhyxeaRRvpPfVWnsfKkEAFR2uj846oUsiA4T9CdK93TBux3+tdBgNSux7gOwdU=
X-Received: by 2002:a17:906:7955:b0:9bf:d70b:986a with SMTP id
 l21-20020a170906795500b009bfd70b986amr367323ejo.13.1699411943570; Tue, 07 Nov
 2023 18:52:23 -0800 (PST)
MIME-Version: 1.0
References: <31ed0db1-9398-4c46-a391-fc644ec49268@ristioja.ee>
 <CAAhV-H4MekBgYZ1nJ-M7bnpo3bczOMcTanij18ACCALz2svjQQ@mail.gmail.com>
 <ZUSJDG82vzbuyFEY@P70.localdomain>
 <CAAhV-H6GyOnTOm6b8Xp=ySctyE-T905WKDUS2AZuqnEyzM7ZEg@mail.gmail.com>
 <ZUWtTuIcMwwCWg7z@P70.localdomain>
 <CAAhV-H7wnjac1Znr2yh8S2bGwuxF1RRGp=cn9oracrWm6y5VVQ@mail.gmail.com>
 <51add74a-1d1a-493d-bb50-fccdad11b22c@ristioja.ee>
 <CAAhV-H7nhkvLoDMwQDwNEhykZANGMq-Qrzip48qYzgQs1fNUgA@mail.gmail.com>
 <be82874b-d41b-4547-9ab5-dac9a5ddfeaf@ristioja.ee>
 <CAAhV-H6zjW3XzDWP1_Hu-owBPLyJVB-_V3z9bMtOgubp1p5kZA@mail.gmail.com>
 <ZUlNbpo_l8JYDdlu@P70.localdomain>
In-Reply-To: <ZUlNbpo_l8JYDdlu@P70.localdomain>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 8 Nov 2023 10:52:12 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4hkx0BJ-Y6rNCNgDw_yr4S7uDcTV_249EK-4AbqU5BDg@mail.gmail.com>
Message-ID: <CAAhV-H4hkx0BJ-Y6rNCNgDw_yr4S7uDcTV_249EK-4AbqU5BDg@mail.gmail.com>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jaak Ristioja <jaak@ristioja.ee>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Thorsten and Jaak,

On Tue, Nov 7, 2023 at 4:32=E2=80=AFAM Evan Preston <x.arch@epreston.net> w=
rote:
>
> Hi Huacai,
>
> On 2023-11-06 Mon 10:22pm, Huacai Chen wrote:
> > On Mon, Nov 6, 2023 at 9:49=E2=80=AFPM Jaak Ristioja <jaak@ristioja.ee>=
 wrote:
> > >
> > > On 06.11.23 04:15, Huacai Chen wrote:
> > > > Hi, Jaak and Evan,
> > > >
> > > > On Mon, Nov 6, 2023 at 12:28=E2=80=AFAM Jaak Ristioja <jaak@ristioj=
a.ee> wrote:
> > > >>
> > > >> On 05.11.23 14:40, Huacai Chen wrote:
> > > >>> Hi, Evan,
> > > >>>
> > > >>> On Sat, Nov 4, 2023 at 10:50=E2=80=AFAM Evan Preston <x.arch@epre=
ston.net> wrote:
> > > >>>>
> > > >>>> Hi Huacai,
> > > >>>>
> > > >>>> On 2023-11-03 Fri 02:36pm, Huacai Chen wrote:
> > > >>>>> Hi, Evan,
> > > >>>>>
> > > >>>>> On Fri, Nov 3, 2023 at 1:54=E2=80=AFPM Evan Preston <x.arch@epr=
eston.net> wrote:
> > > >>>>>>
> > > >>>>>> Hi Huacai,
> > > >>>>>>
> > > >>>>>> On 2023-11-02 Thu 08:38pm, Huacai Chen wrote:
> > > >>>>>>> Hi, Jaak,
> > > >>>>>>>
> > > >>>>>>> On Wed, Nov 1, 2023 at 7:52=E2=80=AFPM Jaak Ristioja <jaak@ri=
stioja.ee> wrote:
> > > >>>>>>>>
> > > >>>>>>>> On 31.10.23 14:17, Huacai Chen wrote:
> > > >>>>>>>>> Hi, Jaak and Evan,
> > > >>>>>>>>>
> > > >>>>>>>>> On Sun, Oct 29, 2023 at 9:42=E2=80=AFAM Huacai Chen <chenhu=
acai@kernel.org> wrote:
> > > >>>>>>>>>>
> > > >>>>>>>>>> On Sat, Oct 28, 2023 at 7:06=E2=80=AFPM Jaak Ristioja <jaa=
k@ristioja.ee> wrote:
> > > >>>>>>>>>>>
> > > >>>>>>>>>>> On 26.10.23 03:58, Huacai Chen wrote:
> > > >>>>>>>>>>>> Hi, Jaak,
> > > >>>>>>>>>>>>
> > > >>>>>>>>>>>> On Thu, Oct 26, 2023 at 2:49=E2=80=AFAM Jaak Ristioja <j=
aak@ristioja.ee> wrote:
> > > >>>>>>>>>>>>>
> > > >>>>>>>>>>>>> On 25.10.23 16:23, Huacai Chen wrote:
> > > >>>>>>>>>>>>>> On Wed, Oct 25, 2023 at 6:08=E2=80=AFPM Thorsten Leemh=
uis
> > > >>>>>>>>>>>>>> <regressions@leemhuis.info> wrote:
> > > >>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>> Javier, Dave, Sima,
> > > >>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>> On 23.10.23 00:54, Evan Preston wrote:
> > > >>>>>>>>>>>>>>>> On 2023-10-20 Fri 05:48pm, Huacai Chen wrote:
> > > >>>>>>>>>>>>>>>>> On Fri, Oct 20, 2023 at 5:35=E2=80=AFPM Linux regre=
ssion tracking (Thorsten
> > > >>>>>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> > > >>>>>>>>>>>>>>>>>> On 09.10.23 10:54, Huacai Chen wrote:
> > > >>>>>>>>>>>>>>>>>>> On Mon, Oct 9, 2023 at 4:45=E2=80=AFPM Bagas Sanj=
aya <bagasdotme@gmail.com> wrote:
> > > >>>>>>>>>>>>>>>>>>>> On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai=
 Chen wrote:
> > > >>>>>>>>>>>>>>>>>>>>> On Tue, Sep 26, 2023 at 10:31=E2=80=AFPM Huacai=
 Chen <chenhuacai@kernel.org> wrote:
> > > >>>>>>>>>>>>>>>>>>>>>> On Tue, Sep 26, 2023 at 7:15=E2=80=AFPM Linux =
regression tracking (Thorsten
> > > >>>>>>>>>>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> > > >>>>>>>>>>>>>>>>>>>>>>> On 13.09.23 14:02, Jaak Ristioja wrote:
> > > >>>>>>>>>>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>>>>>>>>> Upgrading to Linux 6.5 on a Lenovo ThinkPad =
L570 (Integrated Intel HD
> > > >>>>>>>>>>>>>>>>>>>>>>>> Graphics 620 (rev 02), Intel(R) Core(TM) i7-=
7500U) results in a blank
> > > >>>>>>>>>>>>>>>>>>>>>>>> screen after boot until the display manager =
starts... if it does start
> > > >>>>>>>>>>>>>>>>>>>>>>>> at all. Using the nomodeset kernel parameter=
 seems to be a workaround.
> > > >>>>>>>>>>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>>>>>>>>> I've bisected this to commit 60aebc9559492ce=
a6a9625f514a8041717e3a2e4
> > > >>>>>>>>>>>>>>>>>>>>>>>> ("drivers/firmware: Move sysfb_init() from d=
evice_initcall to
> > > >>>>>>>>>>>>>>>>>>>>>>>> subsys_initcall_sync").
> > > >>>>>>>>>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>>>>>> As confirmed by Jaak, disabling DRM_SIMPLEDRM m=
akes things work fine
> > > >>>>>>>>>>>>>>>>>>>>> again. So I guess the reason:
> > > >>>>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>>> Well, this to me still looks a lot (please correct=
 me if I'm wrong) like
> > > >>>>>>>>>>>>>>>>>> regression that should be fixed, as DRM_SIMPLEDRM =
was enabled beforehand
> > > >>>>>>>>>>>>>>>>>> if I understood things correctly. Or is there a pr=
oper fix for this
> > > >>>>>>>>>>>>>>>>>> already in the works and I just missed this? Or is=
 there some good
> > > >>>>>>>>>>>>>>>>>> reason why this won't/can't be fixed?
> > > >>>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>> DRM_SIMPLEDRM was enabled but it didn't work at all=
 because there was
> > > >>>>>>>>>>>>>>>>> no corresponding platform device. Now DRM_SIMPLEDRM=
 works but it has a
> > > >>>>>>>>>>>>>>>>> blank screen. Of course it is valuable to investiga=
te further about
> > > >>>>>>>>>>>>>>>>> DRM_SIMPLEDRM on Jaak's machine, but that needs Jaa=
k's effort because
> > > >>>>>>>>>>>>>>>>> I don't have a same machine.
> > > >>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>> Side note: Huacai, have you tried working with Jaak t=
o get down to the
> > > >>>>>>>>>>>>>>> real problem? Evan, might you be able to help out her=
e?
> > > >>>>>>>>>>>>>> No, Jaak has no response after he 'fixed' his problem =
by disabling SIMPLEDRM.
> > > >>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>
> > > >>>>>>>>>>>>> I'm sorry, what was it exactly you want me to do? Pleas=
e be mindful that
> > > >>>>>>>>>>>>> I'm not familiar with the internals of the Linux kernel=
 and DRI, and it
> > > >>>>>>>>>>>>> might sometimes take weeks before I have time to work a=
nd respond on this.
> > > >>>>>>>>>>>> It doesn't matter. I hope you can do some experiments to=
 investigate
> > > >>>>>>>>>>>> deeper. The first experiment you can do is enabling SIMP=
LEFB (i.e.
> > > >>>>>>>>>>>> CONFIG_FB_SIMPLE) instead of SIMPLEDRM (CONFIG_DRM_SIMPL=
EDRM) to see
> > > >>>>>>>>>>>> whether there is also a blank screen. If no blank screen=
, that
> > > >>>>>>>>>>>> probably means SIMPLEDRM has a bug, if still blank scree=
n, that means
> > > >>>>>>>>>>>> the firmware may pass wrong screen information.
> > > >>>>>>>>>>>
> > > >>>>>>>>>>> Testing with 6.5.9 I get a blank screen with CONFIG_DRM_S=
IMPLEDRM=3Dy and
> > > >>>>>>>>>>> get no blank screen with CONFIG_FB_SIMPLE=3Dy and CONFIG_=
DRM_SIMPLEDRM unset.
> > > >>>>>>>>>> CONFIG_FB_SIMPLE and  CONFIG_DRM_SIMPLEDRM use the same de=
vice created
> > > >>>>>>>>>> by sysfb_init(). Since FB_SIMPLE works fine, I think the r=
eal problem
> > > >>>>>>>>>> is that DRM_SIMPLEDRM has a bug. The next step is to enabl=
e
> > > >>>>>>>>>> CONFIG_DRM_SIMPLEDRM and trace its initialization. In deta=
il, adding
> > > >>>>>>>>>> some printk() in simpledrm_probe() and its sub-routines to=
 see where
> > > >>>>>>>>>> the driver fails. The output of these printk() can be seen=
 by the
> > > >>>>>>>>>> 'dmesg' command after boot.
> > > >>>>>>>>> I need your help. I tried with my laptop (ThinkPad E490, In=
tel Core
> > > >>>>>>>>> i3-8145U, UHD Graphics 620) but I can't reproduce your prob=
lem. So
> > > >>>>>>>>> please patch your 6.5.x kernel with this temporary patch [1=
], then
> > > >>>>>>>>> build a "bad kernel" with SIMPLEDRM enabled. And after boot=
ing your
> > > >>>>>>>>> machine with this "bad kernel", please give me the dmesg ou=
tput. Thank
> > > >>>>>>>>> you very much.
> > > >>>>>>>>>
> > > >>>>>>>>> [1] http://ddns.miaomiaomiao.top:9000/download/kernel/patch=
-6.5.9
> > > >>>>>>>>
> > > >>>>>>>> I'm unable to download it. Can you please send it by e-mail?
> > > >>>>>>> I'm sorry, please download from attachment.
> > > >>>>>>
> > > >>>>>> When applying this patch the first hunk (drivers/firmware/sysf=
b.c) fails for
> > > >>>>>> me with 6.5.9.  Attempting to load the 6.5.9 kernel without th=
is patch
> > > >>>>>> produces no dmesg output on my machine.
> > > >>>>> You copy-paste the patch? If you download it directly it can be
> > > >>>>> applied successfully, I think.
> > > >>>>
> > > >>>> The patch downloaded from your URL applies successfully.  Howeve=
r, I still
> > > >>>> see no dmesg output using the patched 6.5.9 kernel.  'journalctl=
 -k -b all'
> > > >>>> shows no dmesg output from any 6.5.x boots, only from 6.4.12 boo=
ts.
> > > >>> Thank you for your testing. Since you cannot boot to GUI successf=
ully
> > > >>> as Jaak, you may have some troubles with getting the dmesg output=
. But
> > > >>> you can try to use "systemd.unit=3Dmulti-user.target" boot parame=
ters.
> > > >>> In this way you may boot to the login: prompt and then you can ge=
t
> > > >>> dmesg output. Or if you still fail, you may use 'jornalctl -k -b =
-1'
> > > >>> to get the previous dmesg output with 6.4.12.
> > > >>>
> > > >>> Hi, Jaak,
> > > >>>
> > > >>> Have you tested? I think you can successfully get a dmesg output =
with my patch.
> > > >>
> > > >> Yes, just tested it, here I think are the relevant parts from a dm=
esg
> > > >> produced with CONFIG_DRM_SIMPLEDRM and the patch provided by Huaca=
i:
> > > >>
> > > >> ...
> > > >> [    2.909625] sysfb 1
> > > >> [    2.909627] sysfb 2
> > > >> ...
> > > >> [    2.951477] ACPI: bus type drm_connector registered
> > > >> [    2.952096] i915 0000:00:02.0: [drm] VT-d active for gfx access
> > > >> [    2.952105] resource: resource sanity check: requesting [mem
> > > >> 0x00000000e0000000-0x00000000efffffff], which spans more than BOOT=
FB
> > > >> [mem 0xe0000000-0xe012bfff]
> > > >> [    2.952111] caller i915_ggtt_init_hw+0x88/0x120 mapping multipl=
e BARs
> > > >> [    2.952138] i915 0000:00:02.0: [drm] Using Transparent Hugepage=
s
> > > >> [    2.953204] Loading firmware: i915/kbl_dmc_ver1_04.bin
> > > >> [    2.953485] i915 0000:00:02.0: [drm] Finished loading DMC firmw=
are
> > > >> i915/kbl_dmc_ver1_04.bin (v1.4)
> > > >> ...
> > > >> [    4.142075] [drm] Initialized i915 1.6.0 20201103 for 0000:00:0=
2.0 on
> > > >> minor 0
> > > >> [    4.144269] ACPI: video: Video Device [GFX0] (multi-head: yes  =
rom:
> > > >> no  post: no)
> > > >> [    4.144414] input: Video Bus as
> > > >> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/inpu=
t4
> > > >> [    4.144580] [drm] Initialized vgem 1.0.0 20120112 for vgem on m=
inor 1
> > > >> [    4.144590] usbcore: registered new interface driver udl
> > > >> [    4.144603] T: probe 1
> > > >> [    4.144605] T: create 1
> > > >> [    4.144610] T: create 2
> > > >> [    4.144611] T: create 3a-1
> > > >> [    4.144613] T: create 3a-2
> > > >> [    4.144614] T: create 3a-3
> > > >> [    4.144616] T: create 3a-4
> > > >> [    4.144618] T: create 4
> > > >> [    4.144619] T: create 5
> > > >> [    4.144621] simple-framebuffer simple-framebuffer.0: [drm] disp=
lay
> > > >> mode=3D{"": 60 18432 640 640 640 640 480 480 480 480 0x40 0x0}
> > > >> [    4.144628] simple-framebuffer simple-framebuffer.0: [drm]
> > > >> framebuffer format=3DXR24 little-endian (0x34325258), size=3D640x4=
80,
> > > >> stride=3D2560 byte
> > > >> [    4.144633] T: create 6b-1
> > > >> [    4.144635] T: create 6b-2
> > > >> [    4.144637] simple-framebuffer simple-framebuffer.0: [drm] usin=
g I/O
> > > >> memory framebuffer at [mem 0xe0000000-0xe012bfff flags 0x200]
> > > >> [    4.144643] T: create 6b-3
> > > >> [    4.144660] T: create 6b-4
> > > >> [    4.144662] T: create 7
> > > >> [    4.144673] T: create 8
> > > >> [    4.144676] T: create 9
> > > >> [    4.144678] T: create 10
> > > >> [    4.144681] T: create 11
> > > >> [    4.144685] T: create 12
> > > >> [    4.144689] T: probe 2
> > > >> [    4.144728] [drm] Initialized simpledrm 1.0.0 20200625 for
> > > >> simple-framebuffer.0 on minor 2
> > > >> [    4.144732] T: probe 3
> > > >> [    4.145905] Console: switching to colour frame buffer device 80=
x30
> > > >> [    4.150437] simple-framebuffer simple-framebuffer.0: [drm] fb0:
> > > >> simpledrmdrmfb frame buffer device
> > > >> [    4.150766] T: probe 4
> > > >> [    4.151218] loop: module loaded
> > > >> [    4.154434] i915 0000:00:02.0: [drm] fb1: i915drmfb frame buffe=
r device
> > > >> ...
> > > >> [   44.630789] simple-framebuffer simple-framebuffer.0: swiotlb bu=
ffer
> > > >> is full (sz: 1310720 bytes), total 32768 (slots), used 0 (slots)
> > > >> ...
> > > >>
> > > >> The last message might be due to the display manager starting up.
> > > >>
> > > >> Hope it helps.
> > > > Thank you for your testing. Jaak's problem seems related to the
> > > > initialization order, you can try to modify drivers/gpu/drm/Makefil=
e,
> > > > move
> > > >
> > > > obj-y                  +=3D tiny/
> > > >
> > > > to between these two lines
> > > >
> > > > obj-$(CONFIG_DRM_SCHED) +=3D scheduler/
> > > > obj-$(CONFIG_DRM_RADEON)+=3D radeon/
> > > >
> > > > then build a new 6.5.x kernel to see whether your problem is resolv=
ed.
> > >
> > > Yes, this seems to have resolved it.
> > Hi, Jaak,
> >
> > Thank you very much, and I hope this also solves Evan's problem.
>
> I still get a blank screen if I modify drivers/gpu/drm/Makefile to move t=
he
> order of 'tiny'.
>
> >
> > Hi, Javier,
> >
> > I think I have mostly found the root cause. DRM_SIMPLEDRM has no bugs,
> > Jaak's problem is due to the initialization order of drivers, and this
> > order depends on the Makefile.
> >
> > FB_SIMPLE is before native DRM drivers (e.g. i915, radeon, amdgpu, and
> > so on), but DRM_SIMPLEDRM is after them. Thus, if Jaak uses FB_SIMPLE,
> > I915 will takeover FB_SIMPLE, then no problem; and if Jaak uses
> > DRM_SIMPLEDRM, DRM_SIMPLEDRM will try to takeover I915, but fails to
> > work.
> >
> > So, when I move the "tiny" directory before i915, the problem is
> > solved. But the new problem is: is it acceptable to solve this problem
> > by adjusting Makefile?
> >
> > Huacai
I have propose a patch to fix this problem:
https://lore.kernel.org/dri-devel/20231108024613.2898921-1-chenhuacai@loong=
son.cn/T/#u

Huacai

> >
> > >
> > > Jaak
> > >
> > > >
> > > > Evan's problem seems a little strange, could you please give me you=
r
> > > > config files of both 6.4.12 and 6.5.x? And you can also try the abo=
ve
> > > > method to see if anything changes.
>
> I'll send you my config files.
>
> > > >
> > > > Huacai
> > > >
> > > >>
> > > >> J
> > > >>
> > > >>>
> > > >>>>
> > > >>>> Evan
> > > >>>>
> > > >>>>>
> > > >>>>> Huacai
> > > >>>>>
> > > >>>>>>
> > > >>>>>> Evan
> > > >>>>>>
> > > >>>>>>>
> > > >>>>>>> Huacai
> > > >>>>>>>
> > > >>>>>>>>
> > > >>>>>>>> Jaak
> > > >>>>>>>>
> > > >>>>>>>>>
> > > >>>>>>>>>
> > > >>>>>>>>> Huacai
> > > >>>>>>>>>
> > > >>>>>>>>>>
> > > >>>>>>>>>> Huacai
> > > >>>>>>>>>>
> > > >>>>>>>>>>>
> > > >>>>>>>>>>> Jaak
> > > >>>>>>>>>>>
> > > >>>>>>>>>>>>
> > > >>>>>>>>>>>> Huacai
> > > >>>>>>>>>>>>
> > > >>>>>>>>>>>>>
> > > >>>>>>>>>>>>> Jaak
> > > >>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>> But I write this mail for a different reason:
> > > >>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>> I am having the same issue on a Lenovo Thinkpad P70 =
(Intel
> > > >>>>>>>>>>>>>>>> Corporation HD Graphics 530 (rev 06), Intel(R) Core(=
TM) i7-6700HQ).
> > > >>>>>>>>>>>>>>>> Upgrading from Linux 6.4.12 to 6.5 and later results=
 in only a blank
> > > >>>>>>>>>>>>>>>> screen after boot and a rapidly flashing device-acce=
ss-status
> > > >>>>>>>>>>>>>>>> indicator.
> > > >>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>> This additional report makes me wonder if we should r=
evert the culprit
> > > >>>>>>>>>>>>>>> (60aebc9559492c ("drivers/firmware: Move sysfb_init()=
 from
> > > >>>>>>>>>>>>>>> device_initcall to subsys_initcall_sync") [v6.5-rc1])=
. But I guess that
> > > >>>>>>>>>>>>>>> might lead to regressions for some users? But the pat=
ch description says
> > > >>>>>>>>>>>>>>> that this is not a common configuration, so can we ma=
ybe get away with that?
> > > >>>>>>>>>>>>>>      From my point of view, this is not a regression, =
60aebc9559492c
> > > >>>>>>>>>>>>>> doesn't cause a problem, but exposes a problem. So we =
need to fix the
> > > >>>>>>>>>>>>>> real problem (SIMPLEDRM has a blank screen on some con=
ditions). This
> > > >>>>>>>>>>>>>> needs Jaak or Evan's help.
> > > >>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>> Huacai
> > > >>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regre=
ssion tracker' hat)
> > > >>>>>>>>>>>>>>> --
> > > >>>>>>>>>>>>>>> Everything you wanna know about Linux kernel regressi=
on tracking:
> > > >>>>>>>>>>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
> > > >>>>>>>>>>>>>>> If I did something stupid, please tell me, as explain=
ed on that page.
> > > >>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>>>>>> When SIMPLEDRM takes over the framebuffer, the =
screen is blank (don't
> > > >>>>>>>>>>>>>>>>>>>>> know why). And before 60aebc9559492cea6a9625f (=
"drivers/firmware: Move
> > > >>>>>>>>>>>>>>>>>>>>> sysfb_init() from device_initcall to subsys_ini=
tcall_sync") there is
> > > >>>>>>>>>>>>>>>>>>>>> no platform device created for SIMPLEDRM at ear=
ly stage, so it seems
> > > >>>>>>>>>>>>>>>>>>>>> also "no problem".
> > > >>>>>>>>>>>>>>>>>>>> I don't understand above. You mean that after th=
at commit the platform
> > > >>>>>>>>>>>>>>>>>>>> device is also none, right?
> > > >>>>>>>>>>>>>>>>>>> No. The SIMPLEDRM driver needs a platform device =
to work, and that
> > > >>>>>>>>>>>>>>>>>>> commit makes the platform device created earlier.=
 So, before that
> > > >>>>>>>>>>>>>>>>>>> commit, SIMPLEDRM doesn't work, but the screen is=
n't blank; after that
> > > >>>>>>>>>>>>>>>>>>> commit, SIMPLEDRM works, but the screen is blank.
> > > >>>>>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>>>> Huacai
> > > >>>>>>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>>>>> Confused...
> > > >>>>>>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>>>>> --
> > > >>>>>>>>>>>>>>>>>>>> An old man doll... just what I always wanted! - =
Clara
> > > >>>>>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>
> > > >>>>>>>>>>>
> > > >>>>>>>>
> > > >>>>>>
> > > >>>>>>
> > > >>
> > >

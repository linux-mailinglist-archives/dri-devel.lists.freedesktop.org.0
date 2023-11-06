Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE47E1887
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 03:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D535310E251;
	Mon,  6 Nov 2023 02:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05E710E251
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 02:15:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 55425B80B54
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 02:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6ACC433C7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 02:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699236952;
 bh=h5gWl5Q0bZXzm1YCwlvjxTCjksXTl6xwqfIP0HmbW7Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fTolnndtB3if2Bhw3WPoOWoo4SsCsmOP9/bRP9wmTHNf9C20cN9yCxyrsL5yo3LPX
 BTXBH3JG7+yuh9iZD8Fkv84JKheoUdl/OgMKawpxrLMo1YTyoIqlIDSKZz7JQO5bm1
 ifhdMIW2zKsOi2rdHgFGHrPLjKY/HN94bXkllBg7rNxCqM2c6nROIAamUNdXDdiJ35
 eReJjYvy2Brv0l9q7ApRkQo07cvnRgmF0CRKsJZiilfaDeV+LoUPuI7UK2Q+SXxntr
 b4S3fWRkBQrphct681wLf57L5lRWiTow+O2ysjMKp7eLGGqY4GHnuIAAl56rGeinXl
 3RGP/RTOWSyzg==
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-9a58dbd5daeso603757366b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Nov 2023 18:15:52 -0800 (PST)
X-Gm-Message-State: AOJu0YyDQQ+NEy8LuD6CQpCKpr1e25f6sR3xBRaGWnb4fOgsKkTp1+vW
 dKcUlGOkjFynBAmWQ8jX872JBSC7dcYifQgHGt4=
X-Google-Smtp-Source: AGHT+IGctUB49kwwGNkb+gq4lE2Nm3YUgBhHfwn7jJ2aYf7eCn7H6h7cFOeIrzDCxBXIhwL8iZOMVX2q1EP7UtWDdCI=
X-Received: by 2002:a17:907:84a:b0:9be:c2cd:aa29 with SMTP id
 ww10-20020a170907084a00b009bec2cdaa29mr10598664ejb.77.1699236951067; Sun, 05
 Nov 2023 18:15:51 -0800 (PST)
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
 <CAAhV-H7wnjac1Znr2yh8S2bGwuxF1RRGp=cn9oracrWm6y5VVQ@mail.gmail.com>
 <51add74a-1d1a-493d-bb50-fccdad11b22c@ristioja.ee>
In-Reply-To: <51add74a-1d1a-493d-bb50-fccdad11b22c@ristioja.ee>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 6 Nov 2023 10:15:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7nhkvLoDMwQDwNEhykZANGMq-Qrzip48qYzgQs1fNUgA@mail.gmail.com>
Message-ID: <CAAhV-H7nhkvLoDMwQDwNEhykZANGMq-Qrzip48qYzgQs1fNUgA@mail.gmail.com>
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

On Mon, Nov 6, 2023 at 12:28=E2=80=AFAM Jaak Ristioja <jaak@ristioja.ee> wr=
ote:
>
> On 05.11.23 14:40, Huacai Chen wrote:
> > Hi, Evan,
> >
> > On Sat, Nov 4, 2023 at 10:50=E2=80=AFAM Evan Preston <x.arch@epreston.n=
et> wrote:
> >>
> >> Hi Huacai,
> >>
> >> On 2023-11-03 Fri 02:36pm, Huacai Chen wrote:
> >>> Hi, Evan,
> >>>
> >>> On Fri, Nov 3, 2023 at 1:54=E2=80=AFPM Evan Preston <x.arch@epreston.=
net> wrote:
> >>>>
> >>>> Hi Huacai,
> >>>>
> >>>> On 2023-11-02 Thu 08:38pm, Huacai Chen wrote:
> >>>>> Hi, Jaak,
> >>>>>
> >>>>> On Wed, Nov 1, 2023 at 7:52=E2=80=AFPM Jaak Ristioja <jaak@ristioja=
.ee> wrote:
> >>>>>>
> >>>>>> On 31.10.23 14:17, Huacai Chen wrote:
> >>>>>>> Hi, Jaak and Evan,
> >>>>>>>
> >>>>>>> On Sun, Oct 29, 2023 at 9:42=E2=80=AFAM Huacai Chen <chenhuacai@k=
ernel.org> wrote:
> >>>>>>>>
> >>>>>>>> On Sat, Oct 28, 2023 at 7:06=E2=80=AFPM Jaak Ristioja <jaak@rist=
ioja.ee> wrote:
> >>>>>>>>>
> >>>>>>>>> On 26.10.23 03:58, Huacai Chen wrote:
> >>>>>>>>>> Hi, Jaak,
> >>>>>>>>>>
> >>>>>>>>>> On Thu, Oct 26, 2023 at 2:49=E2=80=AFAM Jaak Ristioja <jaak@ri=
stioja.ee> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> On 25.10.23 16:23, Huacai Chen wrote:
> >>>>>>>>>>>> On Wed, Oct 25, 2023 at 6:08=E2=80=AFPM Thorsten Leemhuis
> >>>>>>>>>>>> <regressions@leemhuis.info> wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Javier, Dave, Sima,
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> On 23.10.23 00:54, Evan Preston wrote:
> >>>>>>>>>>>>>> On 2023-10-20 Fri 05:48pm, Huacai Chen wrote:
> >>>>>>>>>>>>>>> On Fri, Oct 20, 2023 at 5:35=E2=80=AFPM Linux regression =
tracking (Thorsten
> >>>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>>>>>>>>>>>>>> On 09.10.23 10:54, Huacai Chen wrote:
> >>>>>>>>>>>>>>>>> On Mon, Oct 9, 2023 at 4:45=E2=80=AFPM Bagas Sanjaya <b=
agasdotme@gmail.com> wrote:
> >>>>>>>>>>>>>>>>>> On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Chen =
wrote:
> >>>>>>>>>>>>>>>>>>> On Tue, Sep 26, 2023 at 10:31=E2=80=AFPM Huacai Chen =
<chenhuacai@kernel.org> wrote:
> >>>>>>>>>>>>>>>>>>>> On Tue, Sep 26, 2023 at 7:15=E2=80=AFPM Linux regres=
sion tracking (Thorsten
> >>>>>>>>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>>>>>>>>>>>>>>>>>>> On 13.09.23 14:02, Jaak Ristioja wrote:
> >>>>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>>>> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (=
Integrated Intel HD
> >>>>>>>>>>>>>>>>>>>>>> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U)=
 results in a blank
> >>>>>>>>>>>>>>>>>>>>>> screen after boot until the display manager starts=
... if it does start
> >>>>>>>>>>>>>>>>>>>>>> at all. Using the nomodeset kernel parameter seems=
 to be a workaround.
> >>>>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>>>> I've bisected this to commit 60aebc9559492cea6a962=
5f514a8041717e3a2e4
> >>>>>>>>>>>>>>>>>>>>>> ("drivers/firmware: Move sysfb_init() from device_=
initcall to
> >>>>>>>>>>>>>>>>>>>>>> subsys_initcall_sync").
> >>>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> As confirmed by Jaak, disabling DRM_SIMPLEDRM makes t=
hings work fine
> >>>>>>>>>>>>>>>>>>> again. So I guess the reason:
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Well, this to me still looks a lot (please correct me if=
 I'm wrong) like
> >>>>>>>>>>>>>>>> regression that should be fixed, as DRM_SIMPLEDRM was en=
abled beforehand
> >>>>>>>>>>>>>>>> if I understood things correctly. Or is there a proper f=
ix for this
> >>>>>>>>>>>>>>>> already in the works and I just missed this? Or is there=
 some good
> >>>>>>>>>>>>>>>> reason why this won't/can't be fixed?
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> DRM_SIMPLEDRM was enabled but it didn't work at all becau=
se there was
> >>>>>>>>>>>>>>> no corresponding platform device. Now DRM_SIMPLEDRM works=
 but it has a
> >>>>>>>>>>>>>>> blank screen. Of course it is valuable to investigate fur=
ther about
> >>>>>>>>>>>>>>> DRM_SIMPLEDRM on Jaak's machine, but that needs Jaak's ef=
fort because
> >>>>>>>>>>>>>>> I don't have a same machine.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Side note: Huacai, have you tried working with Jaak to get =
down to the
> >>>>>>>>>>>>> real problem? Evan, might you be able to help out here?
> >>>>>>>>>>>> No, Jaak has no response after he 'fixed' his problem by dis=
abling SIMPLEDRM.
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> I'm sorry, what was it exactly you want me to do? Please be m=
indful that
> >>>>>>>>>>> I'm not familiar with the internals of the Linux kernel and D=
RI, and it
> >>>>>>>>>>> might sometimes take weeks before I have time to work and res=
pond on this.
> >>>>>>>>>> It doesn't matter. I hope you can do some experiments to inves=
tigate
> >>>>>>>>>> deeper. The first experiment you can do is enabling SIMPLEFB (=
i.e.
> >>>>>>>>>> CONFIG_FB_SIMPLE) instead of SIMPLEDRM (CONFIG_DRM_SIMPLEDRM) =
to see
> >>>>>>>>>> whether there is also a blank screen. If no blank screen, that
> >>>>>>>>>> probably means SIMPLEDRM has a bug, if still blank screen, tha=
t means
> >>>>>>>>>> the firmware may pass wrong screen information.
> >>>>>>>>>
> >>>>>>>>> Testing with 6.5.9 I get a blank screen with CONFIG_DRM_SIMPLED=
RM=3Dy and
> >>>>>>>>> get no blank screen with CONFIG_FB_SIMPLE=3Dy and CONFIG_DRM_SI=
MPLEDRM unset.
> >>>>>>>> CONFIG_FB_SIMPLE and  CONFIG_DRM_SIMPLEDRM use the same device c=
reated
> >>>>>>>> by sysfb_init(). Since FB_SIMPLE works fine, I think the real pr=
oblem
> >>>>>>>> is that DRM_SIMPLEDRM has a bug. The next step is to enable
> >>>>>>>> CONFIG_DRM_SIMPLEDRM and trace its initialization. In detail, ad=
ding
> >>>>>>>> some printk() in simpledrm_probe() and its sub-routines to see w=
here
> >>>>>>>> the driver fails. The output of these printk() can be seen by th=
e
> >>>>>>>> 'dmesg' command after boot.
> >>>>>>> I need your help. I tried with my laptop (ThinkPad E490, Intel Co=
re
> >>>>>>> i3-8145U, UHD Graphics 620) but I can't reproduce your problem. S=
o
> >>>>>>> please patch your 6.5.x kernel with this temporary patch [1], the=
n
> >>>>>>> build a "bad kernel" with SIMPLEDRM enabled. And after booting yo=
ur
> >>>>>>> machine with this "bad kernel", please give me the dmesg output. =
Thank
> >>>>>>> you very much.
> >>>>>>>
> >>>>>>> [1] http://ddns.miaomiaomiao.top:9000/download/kernel/patch-6.5.9
> >>>>>>
> >>>>>> I'm unable to download it. Can you please send it by e-mail?
> >>>>> I'm sorry, please download from attachment.
> >>>>
> >>>> When applying this patch the first hunk (drivers/firmware/sysfb.c) f=
ails for
> >>>> me with 6.5.9.  Attempting to load the 6.5.9 kernel without this pat=
ch
> >>>> produces no dmesg output on my machine.
> >>> You copy-paste the patch? If you download it directly it can be
> >>> applied successfully, I think.
> >>
> >> The patch downloaded from your URL applies successfully.  However, I s=
till
> >> see no dmesg output using the patched 6.5.9 kernel.  'journalctl -k -b=
 all'
> >> shows no dmesg output from any 6.5.x boots, only from 6.4.12 boots.
> > Thank you for your testing. Since you cannot boot to GUI successfully
> > as Jaak, you may have some troubles with getting the dmesg output. But
> > you can try to use "systemd.unit=3Dmulti-user.target" boot parameters.
> > In this way you may boot to the login: prompt and then you can get
> > dmesg output. Or if you still fail, you may use 'jornalctl -k -b -1'
> > to get the previous dmesg output with 6.4.12.
> >
> > Hi, Jaak,
> >
> > Have you tested? I think you can successfully get a dmesg output with m=
y patch.
>
> Yes, just tested it, here I think are the relevant parts from a dmesg
> produced with CONFIG_DRM_SIMPLEDRM and the patch provided by Huacai:
>
> ...
> [    2.909625] sysfb 1
> [    2.909627] sysfb 2
> ...
> [    2.951477] ACPI: bus type drm_connector registered
> [    2.952096] i915 0000:00:02.0: [drm] VT-d active for gfx access
> [    2.952105] resource: resource sanity check: requesting [mem
> 0x00000000e0000000-0x00000000efffffff], which spans more than BOOTFB
> [mem 0xe0000000-0xe012bfff]
> [    2.952111] caller i915_ggtt_init_hw+0x88/0x120 mapping multiple BARs
> [    2.952138] i915 0000:00:02.0: [drm] Using Transparent Hugepages
> [    2.953204] Loading firmware: i915/kbl_dmc_ver1_04.bin
> [    2.953485] i915 0000:00:02.0: [drm] Finished loading DMC firmware
> i915/kbl_dmc_ver1_04.bin (v1.4)
> ...
> [    4.142075] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on
> minor 0
> [    4.144269] ACPI: video: Video Device [GFX0] (multi-head: yes  rom:
> no  post: no)
> [    4.144414] input: Video Bus as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input4
> [    4.144580] [drm] Initialized vgem 1.0.0 20120112 for vgem on minor 1
> [    4.144590] usbcore: registered new interface driver udl
> [    4.144603] T: probe 1
> [    4.144605] T: create 1
> [    4.144610] T: create 2
> [    4.144611] T: create 3a-1
> [    4.144613] T: create 3a-2
> [    4.144614] T: create 3a-3
> [    4.144616] T: create 3a-4
> [    4.144618] T: create 4
> [    4.144619] T: create 5
> [    4.144621] simple-framebuffer simple-framebuffer.0: [drm] display
> mode=3D{"": 60 18432 640 640 640 640 480 480 480 480 0x40 0x0}
> [    4.144628] simple-framebuffer simple-framebuffer.0: [drm]
> framebuffer format=3DXR24 little-endian (0x34325258), size=3D640x480,
> stride=3D2560 byte
> [    4.144633] T: create 6b-1
> [    4.144635] T: create 6b-2
> [    4.144637] simple-framebuffer simple-framebuffer.0: [drm] using I/O
> memory framebuffer at [mem 0xe0000000-0xe012bfff flags 0x200]
> [    4.144643] T: create 6b-3
> [    4.144660] T: create 6b-4
> [    4.144662] T: create 7
> [    4.144673] T: create 8
> [    4.144676] T: create 9
> [    4.144678] T: create 10
> [    4.144681] T: create 11
> [    4.144685] T: create 12
> [    4.144689] T: probe 2
> [    4.144728] [drm] Initialized simpledrm 1.0.0 20200625 for
> simple-framebuffer.0 on minor 2
> [    4.144732] T: probe 3
> [    4.145905] Console: switching to colour frame buffer device 80x30
> [    4.150437] simple-framebuffer simple-framebuffer.0: [drm] fb0:
> simpledrmdrmfb frame buffer device
> [    4.150766] T: probe 4
> [    4.151218] loop: module loaded
> [    4.154434] i915 0000:00:02.0: [drm] fb1: i915drmfb frame buffer devic=
e
> ...
> [   44.630789] simple-framebuffer simple-framebuffer.0: swiotlb buffer
> is full (sz: 1310720 bytes), total 32768 (slots), used 0 (slots)
> ...
>
> The last message might be due to the display manager starting up.
>
> Hope it helps.
Thank you for your testing. Jaak's problem seems related to the
initialization order, you can try to modify drivers/gpu/drm/Makefile,
move

obj-y                  +=3D tiny/

to between these two lines

obj-$(CONFIG_DRM_SCHED) +=3D scheduler/
obj-$(CONFIG_DRM_RADEON)+=3D radeon/

then build a new 6.5.x kernel to see whether your problem is resolved.

Evan's problem seems a little strange, could you please give me your
config files of both 6.4.12 and 6.5.x? And you can also try the above
method to see if anything changes.

Huacai

>
> J
>
> >
> >>
> >> Evan
> >>
> >>>
> >>> Huacai
> >>>
> >>>>
> >>>> Evan
> >>>>
> >>>>>
> >>>>> Huacai
> >>>>>
> >>>>>>
> >>>>>> Jaak
> >>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> Huacai
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Huacai
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Jaak
> >>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> Huacai
> >>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> Jaak
> >>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> But I write this mail for a different reason:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> I am having the same issue on a Lenovo Thinkpad P70 (Intel
> >>>>>>>>>>>>>> Corporation HD Graphics 530 (rev 06), Intel(R) Core(TM) i7=
-6700HQ).
> >>>>>>>>>>>>>> Upgrading from Linux 6.4.12 to 6.5 and later results in on=
ly a blank
> >>>>>>>>>>>>>> screen after boot and a rapidly flashing device-access-sta=
tus
> >>>>>>>>>>>>>> indicator.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> This additional report makes me wonder if we should revert =
the culprit
> >>>>>>>>>>>>> (60aebc9559492c ("drivers/firmware: Move sysfb_init() from
> >>>>>>>>>>>>> device_initcall to subsys_initcall_sync") [v6.5-rc1]). But =
I guess that
> >>>>>>>>>>>>> might lead to regressions for some users? But the patch des=
cription says
> >>>>>>>>>>>>> that this is not a common configuration, so can we maybe ge=
t away with that?
> >>>>>>>>>>>>     From my point of view, this is not a regression, 60aebc9=
559492c
> >>>>>>>>>>>> doesn't cause a problem, but exposes a problem. So we need t=
o fix the
> >>>>>>>>>>>> real problem (SIMPLEDRM has a blank screen on some condition=
s). This
> >>>>>>>>>>>> needs Jaak or Evan's help.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Huacai
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression =
tracker' hat)
> >>>>>>>>>>>>> --
> >>>>>>>>>>>>> Everything you wanna know about Linux kernel regression tra=
cking:
> >>>>>>>>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
> >>>>>>>>>>>>> If I did something stupid, please tell me, as explained on =
that page.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> When SIMPLEDRM takes over the framebuffer, the screen=
 is blank (don't
> >>>>>>>>>>>>>>>>>>> know why). And before 60aebc9559492cea6a9625f ("drive=
rs/firmware: Move
> >>>>>>>>>>>>>>>>>>> sysfb_init() from device_initcall to subsys_initcall_=
sync") there is
> >>>>>>>>>>>>>>>>>>> no platform device created for SIMPLEDRM at early sta=
ge, so it seems
> >>>>>>>>>>>>>>>>>>> also "no problem".
> >>>>>>>>>>>>>>>>>> I don't understand above. You mean that after that com=
mit the platform
> >>>>>>>>>>>>>>>>>> device is also none, right?
> >>>>>>>>>>>>>>>>> No. The SIMPLEDRM driver needs a platform device to wor=
k, and that
> >>>>>>>>>>>>>>>>> commit makes the platform device created earlier. So, b=
efore that
> >>>>>>>>>>>>>>>>> commit, SIMPLEDRM doesn't work, but the screen isn't bl=
ank; after that
> >>>>>>>>>>>>>>>>> commit, SIMPLEDRM works, but the screen is blank.
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> Huacai
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> Confused...
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> --
> >>>>>>>>>>>>>>>>>> An old man doll... just what I always wanted! - Clara
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>
> >>>>
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFB780BFE7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 04:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19E010E32C;
	Mon, 11 Dec 2023 03:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D4F10E328
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 03:31:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8FECCCE0E6D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 03:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A847C433D9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 03:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702265515;
 bh=nBe3pEi89nVjE6KQG6aHPAjI1wb4AF5WzZ3K3ixFswQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EVRaNPpN8meKEGbONouFfFwsKzcpntAoxwBOaQCArXeT4Xk0uCzotRKDN+Z/a9RwX
 hO/CFMun3pvphMD80tS05uYswJ8gTCE9dRvQ6CW7siJARs9VVB3LBYY/jRtyjBKgUX
 oe0eivVfqUOSajOMzoX6Adhg/DsSkliayJkNQg2js1ShPUvvwJh8ycUUBk/fxgiMkZ
 MXirjVT9VjEfMOeVkFTosbuzQVk6F30c4oBp/56bBnpKDo365P8+UbDy5uY/6n6HBp
 zztkPa/ov2+woWHvRIOhGhcJQIAk2cKTjDlWqLWQoFufegsm6lhxvtE9O9gvOi90HF
 YvvPqceWH8tmQ==
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40c1e3ea2f2so43212435e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 19:31:55 -0800 (PST)
X-Gm-Message-State: AOJu0YwctRME9fLQ32HuD/B9FxwSTiRs/L5wNWu/w0NMHFNIckdKZUFR
 cI5J1nMOMGT3C/LAgtaxkb/dilfr7lYw0xxeZQc=
X-Google-Smtp-Source: AGHT+IGIFmmJNy3d9paomMpD+h5JSfKYZE2rsyet2O28wrF9VeiU7gHn4WwyHTZMP5eKCthkpm9u09jG1A+TSeajS1I=
X-Received: by 2002:a5d:68cb:0:b0:334:b31e:d400 with SMTP id
 p11-20020a5d68cb000000b00334b31ed400mr2632534wrw.92.1702265513542; Sun, 10
 Dec 2023 19:31:53 -0800 (PST)
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
 <CAAhV-H7nhkvLoDMwQDwNEhykZANGMq-Qrzip48qYzgQs1fNUgA@mail.gmail.com>
 <be82874b-d41b-4547-9ab5-dac9a5ddfeaf@ristioja.ee>
In-Reply-To: <be82874b-d41b-4547-9ab5-dac9a5ddfeaf@ristioja.ee>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 11 Dec 2023 11:31:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5eXM7FNzuRCMthAziG_jg75XwQV3grpw=sdyJ-9GXgvA@mail.gmail.com>
Message-ID: <CAAhV-H5eXM7FNzuRCMthAziG_jg75XwQV3grpw=sdyJ-9GXgvA@mail.gmail.com>
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Evan Preston <x.arch@epreston.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jaak,

On Mon, Nov 6, 2023 at 9:49=E2=80=AFPM Jaak Ristioja <jaak@ristioja.ee> wro=
te:
>
> On 06.11.23 04:15, Huacai Chen wrote:
> > Hi, Jaak and Evan,
> >
> > On Mon, Nov 6, 2023 at 12:28=E2=80=AFAM Jaak Ristioja <jaak@ristioja.ee=
> wrote:
> >>
> >> On 05.11.23 14:40, Huacai Chen wrote:
> >>> Hi, Evan,
> >>>
> >>> On Sat, Nov 4, 2023 at 10:50=E2=80=AFAM Evan Preston <x.arch@epreston=
.net> wrote:
> >>>>
> >>>> Hi Huacai,
> >>>>
> >>>> On 2023-11-03 Fri 02:36pm, Huacai Chen wrote:
> >>>>> Hi, Evan,
> >>>>>
> >>>>> On Fri, Nov 3, 2023 at 1:54=E2=80=AFPM Evan Preston <x.arch@epresto=
n.net> wrote:
> >>>>>>
> >>>>>> Hi Huacai,
> >>>>>>
> >>>>>> On 2023-11-02 Thu 08:38pm, Huacai Chen wrote:
> >>>>>>> Hi, Jaak,
> >>>>>>>
> >>>>>>> On Wed, Nov 1, 2023 at 7:52=E2=80=AFPM Jaak Ristioja <jaak@ristio=
ja.ee> wrote:
> >>>>>>>>
> >>>>>>>> On 31.10.23 14:17, Huacai Chen wrote:
> >>>>>>>>> Hi, Jaak and Evan,
> >>>>>>>>>
> >>>>>>>>> On Sun, Oct 29, 2023 at 9:42=E2=80=AFAM Huacai Chen <chenhuacai=
@kernel.org> wrote:
> >>>>>>>>>>
> >>>>>>>>>> On Sat, Oct 28, 2023 at 7:06=E2=80=AFPM Jaak Ristioja <jaak@ri=
stioja.ee> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> On 26.10.23 03:58, Huacai Chen wrote:
> >>>>>>>>>>>> Hi, Jaak,
> >>>>>>>>>>>>
> >>>>>>>>>>>> On Thu, Oct 26, 2023 at 2:49=E2=80=AFAM Jaak Ristioja <jaak@=
ristioja.ee> wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> On 25.10.23 16:23, Huacai Chen wrote:
> >>>>>>>>>>>>>> On Wed, Oct 25, 2023 at 6:08=E2=80=AFPM Thorsten Leemhuis
> >>>>>>>>>>>>>> <regressions@leemhuis.info> wrote:
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Javier, Dave, Sima,
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> On 23.10.23 00:54, Evan Preston wrote:
> >>>>>>>>>>>>>>>> On 2023-10-20 Fri 05:48pm, Huacai Chen wrote:
> >>>>>>>>>>>>>>>>> On Fri, Oct 20, 2023 at 5:35=E2=80=AFPM Linux regressio=
n tracking (Thorsten
> >>>>>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>>>>>>>>>>>>>>>> On 09.10.23 10:54, Huacai Chen wrote:
> >>>>>>>>>>>>>>>>>>> On Mon, Oct 9, 2023 at 4:45=E2=80=AFPM Bagas Sanjaya =
<bagasdotme@gmail.com> wrote:
> >>>>>>>>>>>>>>>>>>>> On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Che=
n wrote:
> >>>>>>>>>>>>>>>>>>>>> On Tue, Sep 26, 2023 at 10:31=E2=80=AFPM Huacai Che=
n <chenhuacai@kernel.org> wrote:
> >>>>>>>>>>>>>>>>>>>>>> On Tue, Sep 26, 2023 at 7:15=E2=80=AFPM Linux regr=
ession tracking (Thorsten
> >>>>>>>>>>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>>>>>>>>>>>>>>>>>>>>> On 13.09.23 14:02, Jaak Ristioja wrote:
> >>>>>>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>>>>>> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570=
 (Integrated Intel HD
> >>>>>>>>>>>>>>>>>>>>>>>> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500=
U) results in a blank
> >>>>>>>>>>>>>>>>>>>>>>>> screen after boot until the display manager star=
ts... if it does start
> >>>>>>>>>>>>>>>>>>>>>>>> at all. Using the nomodeset kernel parameter see=
ms to be a workaround.
> >>>>>>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>>>>>> I've bisected this to commit 60aebc9559492cea6a9=
625f514a8041717e3a2e4
> >>>>>>>>>>>>>>>>>>>>>>>> ("drivers/firmware: Move sysfb_init() from devic=
e_initcall to
> >>>>>>>>>>>>>>>>>>>>>>>> subsys_initcall_sync").
> >>>>>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>>> As confirmed by Jaak, disabling DRM_SIMPLEDRM makes=
 things work fine
> >>>>>>>>>>>>>>>>>>>>> again. So I guess the reason:
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> Well, this to me still looks a lot (please correct me =
if I'm wrong) like
> >>>>>>>>>>>>>>>>>> regression that should be fixed, as DRM_SIMPLEDRM was =
enabled beforehand
> >>>>>>>>>>>>>>>>>> if I understood things correctly. Or is there a proper=
 fix for this
> >>>>>>>>>>>>>>>>>> already in the works and I just missed this? Or is the=
re some good
> >>>>>>>>>>>>>>>>>> reason why this won't/can't be fixed?
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> DRM_SIMPLEDRM was enabled but it didn't work at all bec=
ause there was
> >>>>>>>>>>>>>>>>> no corresponding platform device. Now DRM_SIMPLEDRM wor=
ks but it has a
> >>>>>>>>>>>>>>>>> blank screen. Of course it is valuable to investigate f=
urther about
> >>>>>>>>>>>>>>>>> DRM_SIMPLEDRM on Jaak's machine, but that needs Jaak's =
effort because
> >>>>>>>>>>>>>>>>> I don't have a same machine.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Side note: Huacai, have you tried working with Jaak to ge=
t down to the
> >>>>>>>>>>>>>>> real problem? Evan, might you be able to help out here?
> >>>>>>>>>>>>>> No, Jaak has no response after he 'fixed' his problem by d=
isabling SIMPLEDRM.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> I'm sorry, what was it exactly you want me to do? Please be=
 mindful that
> >>>>>>>>>>>>> I'm not familiar with the internals of the Linux kernel and=
 DRI, and it
> >>>>>>>>>>>>> might sometimes take weeks before I have time to work and r=
espond on this.
> >>>>>>>>>>>> It doesn't matter. I hope you can do some experiments to inv=
estigate
> >>>>>>>>>>>> deeper. The first experiment you can do is enabling SIMPLEFB=
 (i.e.
> >>>>>>>>>>>> CONFIG_FB_SIMPLE) instead of SIMPLEDRM (CONFIG_DRM_SIMPLEDRM=
) to see
> >>>>>>>>>>>> whether there is also a blank screen. If no blank screen, th=
at
> >>>>>>>>>>>> probably means SIMPLEDRM has a bug, if still blank screen, t=
hat means
> >>>>>>>>>>>> the firmware may pass wrong screen information.
> >>>>>>>>>>>
> >>>>>>>>>>> Testing with 6.5.9 I get a blank screen with CONFIG_DRM_SIMPL=
EDRM=3Dy and
> >>>>>>>>>>> get no blank screen with CONFIG_FB_SIMPLE=3Dy and CONFIG_DRM_=
SIMPLEDRM unset.
> >>>>>>>>>> CONFIG_FB_SIMPLE and  CONFIG_DRM_SIMPLEDRM use the same device=
 created
> >>>>>>>>>> by sysfb_init(). Since FB_SIMPLE works fine, I think the real =
problem
> >>>>>>>>>> is that DRM_SIMPLEDRM has a bug. The next step is to enable
> >>>>>>>>>> CONFIG_DRM_SIMPLEDRM and trace its initialization. In detail, =
adding
> >>>>>>>>>> some printk() in simpledrm_probe() and its sub-routines to see=
 where
> >>>>>>>>>> the driver fails. The output of these printk() can be seen by =
the
> >>>>>>>>>> 'dmesg' command after boot.
> >>>>>>>>> I need your help. I tried with my laptop (ThinkPad E490, Intel =
Core
> >>>>>>>>> i3-8145U, UHD Graphics 620) but I can't reproduce your problem.=
 So
> >>>>>>>>> please patch your 6.5.x kernel with this temporary patch [1], t=
hen
> >>>>>>>>> build a "bad kernel" with SIMPLEDRM enabled. And after booting =
your
> >>>>>>>>> machine with this "bad kernel", please give me the dmesg output=
. Thank
> >>>>>>>>> you very much.
> >>>>>>>>>
> >>>>>>>>> [1] http://ddns.miaomiaomiao.top:9000/download/kernel/patch-6.5=
.9
> >>>>>>>>
> >>>>>>>> I'm unable to download it. Can you please send it by e-mail?
> >>>>>>> I'm sorry, please download from attachment.
> >>>>>>
> >>>>>> When applying this patch the first hunk (drivers/firmware/sysfb.c)=
 fails for
> >>>>>> me with 6.5.9.  Attempting to load the 6.5.9 kernel without this p=
atch
> >>>>>> produces no dmesg output on my machine.
> >>>>> You copy-paste the patch? If you download it directly it can be
> >>>>> applied successfully, I think.
> >>>>
> >>>> The patch downloaded from your URL applies successfully.  However, I=
 still
> >>>> see no dmesg output using the patched 6.5.9 kernel.  'journalctl -k =
-b all'
> >>>> shows no dmesg output from any 6.5.x boots, only from 6.4.12 boots.
> >>> Thank you for your testing. Since you cannot boot to GUI successfully
> >>> as Jaak, you may have some troubles with getting the dmesg output. Bu=
t
> >>> you can try to use "systemd.unit=3Dmulti-user.target" boot parameters=
.
> >>> In this way you may boot to the login: prompt and then you can get
> >>> dmesg output. Or if you still fail, you may use 'jornalctl -k -b -1'
> >>> to get the previous dmesg output with 6.4.12.
> >>>
> >>> Hi, Jaak,
> >>>
> >>> Have you tested? I think you can successfully get a dmesg output with=
 my patch.
> >>
> >> Yes, just tested it, here I think are the relevant parts from a dmesg
> >> produced with CONFIG_DRM_SIMPLEDRM and the patch provided by Huacai:
> >>
> >> ...
> >> [    2.909625] sysfb 1
> >> [    2.909627] sysfb 2
> >> ...
> >> [    2.951477] ACPI: bus type drm_connector registered
> >> [    2.952096] i915 0000:00:02.0: [drm] VT-d active for gfx access
> >> [    2.952105] resource: resource sanity check: requesting [mem
> >> 0x00000000e0000000-0x00000000efffffff], which spans more than BOOTFB
> >> [mem 0xe0000000-0xe012bfff]
> >> [    2.952111] caller i915_ggtt_init_hw+0x88/0x120 mapping multiple BA=
Rs
> >> [    2.952138] i915 0000:00:02.0: [drm] Using Transparent Hugepages
> >> [    2.953204] Loading firmware: i915/kbl_dmc_ver1_04.bin
> >> [    2.953485] i915 0000:00:02.0: [drm] Finished loading DMC firmware
> >> i915/kbl_dmc_ver1_04.bin (v1.4)
> >> ...
> >> [    4.142075] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 =
on
> >> minor 0
> >> [    4.144269] ACPI: video: Video Device [GFX0] (multi-head: yes  rom:
> >> no  post: no)
> >> [    4.144414] input: Video Bus as
> >> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input4
> >> [    4.144580] [drm] Initialized vgem 1.0.0 20120112 for vgem on minor=
 1
> >> [    4.144590] usbcore: registered new interface driver udl
> >> [    4.144603] T: probe 1
> >> [    4.144605] T: create 1
> >> [    4.144610] T: create 2
> >> [    4.144611] T: create 3a-1
> >> [    4.144613] T: create 3a-2
> >> [    4.144614] T: create 3a-3
> >> [    4.144616] T: create 3a-4
> >> [    4.144618] T: create 4
> >> [    4.144619] T: create 5
> >> [    4.144621] simple-framebuffer simple-framebuffer.0: [drm] display
> >> mode=3D{"": 60 18432 640 640 640 640 480 480 480 480 0x40 0x0}
> >> [    4.144628] simple-framebuffer simple-framebuffer.0: [drm]
> >> framebuffer format=3DXR24 little-endian (0x34325258), size=3D640x480,
> >> stride=3D2560 byte
> >> [    4.144633] T: create 6b-1
> >> [    4.144635] T: create 6b-2
> >> [    4.144637] simple-framebuffer simple-framebuffer.0: [drm] using I/=
O
> >> memory framebuffer at [mem 0xe0000000-0xe012bfff flags 0x200]
> >> [    4.144643] T: create 6b-3
> >> [    4.144660] T: create 6b-4
> >> [    4.144662] T: create 7
> >> [    4.144673] T: create 8
> >> [    4.144676] T: create 9
> >> [    4.144678] T: create 10
> >> [    4.144681] T: create 11
> >> [    4.144685] T: create 12
> >> [    4.144689] T: probe 2
> >> [    4.144728] [drm] Initialized simpledrm 1.0.0 20200625 for
> >> simple-framebuffer.0 on minor 2
> >> [    4.144732] T: probe 3
> >> [    4.145905] Console: switching to colour frame buffer device 80x30
> >> [    4.150437] simple-framebuffer simple-framebuffer.0: [drm] fb0:
> >> simpledrmdrmfb frame buffer device
> >> [    4.150766] T: probe 4
> >> [    4.151218] loop: module loaded
> >> [    4.154434] i915 0000:00:02.0: [drm] fb1: i915drmfb frame buffer de=
vice
> >> ...
> >> [   44.630789] simple-framebuffer simple-framebuffer.0: swiotlb buffer
> >> is full (sz: 1310720 bytes), total 32768 (slots), used 0 (slots)
> >> ...
> >>
> >> The last message might be due to the display manager starting up.
> >>
> >> Hope it helps.
> > Thank you for your testing. Jaak's problem seems related to the
> > initialization order, you can try to modify drivers/gpu/drm/Makefile,
> > move
> >
> > obj-y                  +=3D tiny/
> >
> > to between these two lines
> >
> > obj-$(CONFIG_DRM_SCHED) +=3D scheduler/
> > obj-$(CONFIG_DRM_RADEON)+=3D radeon/
> >
> > then build a new 6.5.x kernel to see whether your problem is resolved.
>
> Yes, this seems to have resolved it.
Adjusting Makefile is unacceptable from the maintainer's view, but I
really don't want the original patch to be reverted.

So, could you please test with the below patch (keep the original
order in Makefile) and then give me the dmesg output?

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 561be8feca96..cc2e39fb98f5 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -350,21 +350,29 @@ int
aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const
char *na
        resource_size_t base, size;
        int bar, ret =3D 0;

-       if (pdev =3D=3D vga_default_device())
+       printk("DEBUG: remove 1\n");
+
+       if (pdev =3D=3D vga_default_device()) {
+               printk("DEBUG: primary =3D true\n");
                primary =3D true;
+       }

-       if (primary)
+       if (primary) {
+               printk("DEBUG: disable sysfb\n");
                sysfb_disable();
+       }

        for (bar =3D 0; bar < PCI_STD_NUM_BARS; ++bar) {
                if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
                        continue;

+               printk("DEBUG: remove 2\n");
                base =3D pci_resource_start(pdev, bar);
                size =3D pci_resource_len(pdev, bar);
                aperture_detach_devices(base, size);
        }

+       printk("DEBUG: remove 3\n");
        /*
         * If this is the primary adapter, there could be a VGA device
         * that consumes the VGA framebuffer I/O range. Remove this

[1]  https://lore.kernel.org/lkml/170222766284.86103.11020060769330721008@l=
eemhuis.info/T/#u

Huacai

>
> Jaak
>
> >
> > Evan's problem seems a little strange, could you please give me your
> > config files of both 6.4.12 and 6.5.x? And you can also try the above
> > method to see if anything changes.
> >
> > Huacai
> >
> >>
> >> J
> >>
> >>>
> >>>>
> >>>> Evan
> >>>>
> >>>>>
> >>>>> Huacai
> >>>>>
> >>>>>>
> >>>>>> Evan
> >>>>>>
> >>>>>>>
> >>>>>>> Huacai
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Jaak
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Huacai
> >>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> Huacai
> >>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> Jaak
> >>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> Huacai
> >>>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Jaak
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> But I write this mail for a different reason:
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> I am having the same issue on a Lenovo Thinkpad P70 (Int=
el
> >>>>>>>>>>>>>>>> Corporation HD Graphics 530 (rev 06), Intel(R) Core(TM) =
i7-6700HQ).
> >>>>>>>>>>>>>>>> Upgrading from Linux 6.4.12 to 6.5 and later results in =
only a blank
> >>>>>>>>>>>>>>>> screen after boot and a rapidly flashing device-access-s=
tatus
> >>>>>>>>>>>>>>>> indicator.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> This additional report makes me wonder if we should rever=
t the culprit
> >>>>>>>>>>>>>>> (60aebc9559492c ("drivers/firmware: Move sysfb_init() fro=
m
> >>>>>>>>>>>>>>> device_initcall to subsys_initcall_sync") [v6.5-rc1]). Bu=
t I guess that
> >>>>>>>>>>>>>>> might lead to regressions for some users? But the patch d=
escription says
> >>>>>>>>>>>>>>> that this is not a common configuration, so can we maybe =
get away with that?
> >>>>>>>>>>>>>>      From my point of view, this is not a regression, 60ae=
bc9559492c
> >>>>>>>>>>>>>> doesn't cause a problem, but exposes a problem. So we need=
 to fix the
> >>>>>>>>>>>>>> real problem (SIMPLEDRM has a blank screen on some conditi=
ons). This
> >>>>>>>>>>>>>> needs Jaak or Evan's help.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Huacai
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regressio=
n tracker' hat)
> >>>>>>>>>>>>>>> --
> >>>>>>>>>>>>>>> Everything you wanna know about Linux kernel regression t=
racking:
> >>>>>>>>>>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
> >>>>>>>>>>>>>>> If I did something stupid, please tell me, as explained o=
n that page.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>>> When SIMPLEDRM takes over the framebuffer, the scre=
en is blank (don't
> >>>>>>>>>>>>>>>>>>>>> know why). And before 60aebc9559492cea6a9625f ("dri=
vers/firmware: Move
> >>>>>>>>>>>>>>>>>>>>> sysfb_init() from device_initcall to subsys_initcal=
l_sync") there is
> >>>>>>>>>>>>>>>>>>>>> no platform device created for SIMPLEDRM at early s=
tage, so it seems
> >>>>>>>>>>>>>>>>>>>>> also "no problem".
> >>>>>>>>>>>>>>>>>>>> I don't understand above. You mean that after that c=
ommit the platform
> >>>>>>>>>>>>>>>>>>>> device is also none, right?
> >>>>>>>>>>>>>>>>>>> No. The SIMPLEDRM driver needs a platform device to w=
ork, and that
> >>>>>>>>>>>>>>>>>>> commit makes the platform device created earlier. So,=
 before that
> >>>>>>>>>>>>>>>>>>> commit, SIMPLEDRM doesn't work, but the screen isn't =
blank; after that
> >>>>>>>>>>>>>>>>>>> commit, SIMPLEDRM works, but the screen is blank.
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> Huacai
> >>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>> Confused...
> >>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>> --
> >>>>>>>>>>>>>>>>>>>> An old man doll... just what I always wanted! - Clar=
a
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>
> >>
>

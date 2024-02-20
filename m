Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB9385BB31
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 12:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6C610E38C;
	Tue, 20 Feb 2024 11:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H3o+tSb/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F1410E385
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 11:58:51 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-6e4741b23d7so902161b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 03:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708430331; x=1709035131; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q+DL0TDfgMPK+9E8Bz9tp/9hEyPowlOU3A05yiRowOY=;
 b=H3o+tSb/Jo4j9zRUmoZK440fsXfcCuja4n4YKqgfemcNajmns8fqUGM362FKVyRDQo
 Ccde/vZoZK6HZg2YzigABe3FHfSNI2Cf2/mY4Ow21Ttbns0/lpr3YWysbii/fH7Iq8oE
 x+v7U6vxqtCxHyOCqqHfTE+U+Hi0ys5/a/3NbsqW7qXBjKh7PkcrKZKJZGI5Qq+/vAb0
 d98q04yI0zG007GVMoN4CW5zxKOJDmZHmy0+rNbmBxiZJ88mD3SMgsu+pIhx5V5LNGV1
 GKRvU/7e3/aKTi8KH6ngksV5DEwyHe55fJ/7pdHucySn2Cj/W1BSm43DtetdMMsWuji+
 nxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708430331; x=1709035131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q+DL0TDfgMPK+9E8Bz9tp/9hEyPowlOU3A05yiRowOY=;
 b=Gzxbjn/w8v9YqnTb5SLQ+MDlJlVWh4rDmD1aFJaAYxOdq2TsDIKb0N8qEsUi3u4waU
 Uk/APKdpYDwGZk80NEXNPXii9NpPdmzWlyHud5vyojWOS5t3EmWlRvCnEyGU6hTgbvuf
 ssg53ZPSuUVFWDkNxySkhAE9tmacfpyBGyDVGpjb+ceeXjlPYfQafvKMSP0Nutzb1V54
 wq3JqerzlGhACqQ6BkEaXynIUfHiVYHCDgi1d4cNhMzMJsH7reswDlrcEnnrhNiI2xmW
 bl16zpfM1673LpW6OVFGVybLtwLLC80M+BH7JJvLI/u12dkZ0X8+0wOFNh2VdUdCLrJ/
 4kTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn2Px4Ad9N+bvDYgiynzE5GCMtVwfcdsw8ocZIsDJR/6Fk75n1vaoqitPYgoX58c6t+OmoUFiaLHkdlmcByl77SK5SgGJrowJM0e+p5rZe
X-Gm-Message-State: AOJu0YxQgOXumP7ue36vxZIYZuMj3WXFyC9HDYVAbnDbWRMLQ8Pr0Gdt
 I9MTmtvkYbXxiMK4G0X3Z3atygdmoy5m9YOmoDlFRrwgReVpY55GaTrBR3t5rYCkvAzCGoC2RFH
 KO29iWLhPdehPJ0/+gOlJBy6YmKA=
X-Google-Smtp-Source: AGHT+IHDxyqezqnOE6STx2Scl75lujobBwRB5UHjEzbFhOE/JRP9PYxrhWkSrKPuIhMGDCqYYnUTfS0IFAiuxlL7998=
X-Received: by 2002:a05:6a20:6009:b0:19e:9c5f:d01d with SMTP id
 r9-20020a056a20600900b0019e9c5fd01dmr11323186pza.19.1708430331202; Tue, 20
 Feb 2024 03:58:51 -0800 (PST)
MIME-Version: 1.0
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
 <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
 <CAHCN7xKffJ29zyjoJVAcy3b_d=-zkFzbL=URj4yWJWzYvRdB_Q@mail.gmail.com>
 <TYCPR01MB11269CBE8429A31DE5002A5A5864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <nzrkujogauvn262ucxippwidyub6ikcohcjpbpn4hzj7rymctm@4owntgrmcquf>
 <TYCPR01MB11269CBAA20275E11D9AD6500864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <wxwad77x2mxhhwdsbgiytzn6x54t4sywodjhzefwldo277njiz@ru7z54wxgelu>
 <CAHCN7xJi-6W6x+OJmkNwOX45SM4WHD5zkN42ZOp8ZxFnp3YL5w@mail.gmail.com>
 <1ff513b9-d4fd-4663-b46b-bb9662e3881c@imgtec.com>
 <CAHCN7xJ0TTS_-PA3Ox_RCpfyHJFk-s=-zs8W1Zm3dQTUAoqbpg@mail.gmail.com>
 <f2b2671e-5acc-4dec-9c2e-3c9cd2e1f19e@imgtec.com>
 <CAHCN7xJAfg8+8KWsXNu+QT2swByH=Oc4seK4Gin2NEvS=pV2uw@mail.gmail.com>
In-Reply-To: <CAHCN7xJAfg8+8KWsXNu+QT2swByH=Oc4seK4Gin2NEvS=pV2uw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 20 Feb 2024 05:58:39 -0600
Message-ID: <CAHCN7xK3Y5JgQ_cNWt-SzKEakTLOpKLxbjAxuykBDaErRdcZ-w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Frank Binns <Frank.Binns@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sarah Walker <Sarah.Walker@imgtec.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Nishanth Menon <nm@ti.com>, 
 Marek Vasut <marek.vasut@mailbox.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 20, 2024 at 5:26=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Tue, Feb 20, 2024 at 3:21=E2=80=AFAM Matt Coster <Matt.Coster@imgtec.c=
om> wrote:
> >
> > Hi Adam,
> >
> > On 19/02/2024 20:38, Adam Ford wrote:
> > > On Mon, Feb 19, 2024 at 3:00=E2=80=AFAM Matt Coster <Matt.Coster@imgt=
ec.com> wrote:
> > >>
> > >> Hi Adam,
> > >>
> > >> On 18/02/2024 23:26, Adam Ford wrote:
> > >>> On Fri, Feb 16, 2024 at 8:14=E2=80=AFAM Maxime Ripard <mripard@kern=
el.org> wrote:
> > >>>>
> > >>>> On Fri, Feb 16, 2024 at 09:13:14AM +0000, Biju Das wrote:
> > >>>>> Hi Maxime Ripard,
> > >>>>>
> > >>>>>> -----Original Message-----
> > >>>>>> From: Maxime Ripard <mripard@kernel.org>
> > >>>>>> Sent: Friday, February 16, 2024 9:05 AM
> > >>>>>> Subject: Re: RE: [PATCH v2] drm/imagination: DRM_POWERVR should =
depend on
> > >>>>>> ARCH_K3
> > >>>>>>
> > >>>>>> On Fri, Feb 16, 2024 at 08:47:46AM +0000, Biju Das wrote:
> > >>>>>>> Hi Adam Ford,
> > >>>>>>>
> > >>>>>>>> -----Original Message-----
> > >>>>>>>> From: Adam Ford <aford173@gmail.com>
> > >>>>>>>> Sent: Thursday, February 15, 2024 11:36 PM
> > >>>>>>>> Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should de=
pend
> > >>>>>>>> on
> > >>>>>>>> ARCH_K3
> > >>>>>>>>
> > >>>>>>>> On Thu, Feb 15, 2024 at 11:22=E2=80=AFAM Adam Ford <aford173@g=
mail.com> wrote:
> > >>>>>>>>>
> > >>>>>>>>> On Thu, Feb 15, 2024 at 11:10=E2=80=AFAM Adam Ford <aford173@=
gmail.com>
> > >>>>>> wrote:
> > >>>>>>>>>>
> > >>>>>>>>>> On Thu, Feb 15, 2024 at 10:54=E2=80=AFAM Geert Uytterhoeven
> > >>>>>>>>>> <geert@linux-m68k.org> wrote:
> > >>>>>>>>>>>
> > >>>>>>>>>>> Hi Maxime,
> > >>>>>>>>>>>
> > >>>>>>>>>>> On Thu, Feb 15, 2024 at 5:18=E2=80=AFPM Maxime Ripard
> > >>>>>>>>>>> <mripard@kernel.org>
> > >>>>>>>> wrote:
> > >>>>>>>>>>>> On Thu, Feb 15, 2024 at 01:50:09PM +0100, Geert Uytterhoev=
en
> > >>>>>>>> wrote:
> > >>>>>>>>>>>>> Using the Imagination Technologies PowerVR Series 6 GPU
> > >>>>>>>>>>>>> requires a proprietary firmware image, which is currently
> > >>>>>>>>>>>>> only available for Texas Instruments K3 AM62x SoCs.  Henc=
e
> > >>>>>>>>>>>>> add a dependency on ARCH_K3, to prevent asking the user
> > >>>>>>>>>>>>> about this driver when configuring a kernel without Texas
> > >>>>>>>>>>>>> Instruments K3
> > >>>>>>>> Multicore SoC support.
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> This wasn't making sense the first time you sent it, and n=
ow
> > >>>>>>>>>>>> that commit log is just plain wrong. We have firmwares for
> > >>>>>>>>>>>> the G6110, GX6250, GX6650, BXE-4-32, and BXS-4-64 models,
> > >>>>>>>>>>>> which can be found on (at least) Renesas, Mediatek,
> > >>>>>>>>>>>> Rockchip, TI and StarFive, so across three
> > >>>>>>>>>>>
> > >>>>>>>>>>> I am so happy to be proven wrong!
> > >>>>>>>>>>> Yeah, GX6650 is found on e.g. R-Car H3, and GX6250 on e.g.
> > >>>>>>>>>>> R-Car M3-
> > >>>>>>>> W.
> > >>>>>>>>>>>
> > >>>>>>>>>>>> architectures and 5 platforms. In two months.
> > >>>>>>>>>>>
> > >>>>>>>>>>> That sounds like great progress, thanks a lot!
> > >>>>>>>>>>>
> > >>>>>>>>>> Geert,
> > >>>>>>>>>>
> > >>>>>>>>>>> Where can I find these firmwares? Linux-firmware[1] seems t=
o
> > >>>>>>>>>>> lack all but the original K3 AM62x one.
> > >>>>>>>>>>
> > >>>>>>>>>> I think PowerVR has a repo [1], but the last time I checked =
it,
> > >>>>>>>>>> the BVNC for the firmware didn't match what was necessary fo=
r
> > >>>>>>>>>> the GX6250 on the RZ/G2M.  I can't remember what the
> > >>>>>>>>>> corresponding R-Car3 model is.  I haven't tried recently bec=
ause
> > >>>>>>>>>> I was told more documentation for firmware porting would be
> > >>>>>>>>>> delayed until everything was pushed into the kernel and Mesa=
.
> > >>>>>>>>>> Maybe there is a better repo and/or newer firmware somewhere=
 else.
> > >>>>>>>>>>
> > >>>>>>>>> I should have doubled checked the repo contents before I sent=
 my
> > >>>>>>>>> last e-mail , but it appears the firmware  [2] for the RZ/G2M=
,
> > >>>>>>>>> might be present now. I don't know if there are driver update=
s
> > >>>>>>>>> necessary. I checked my e-mails, but I didn't see any
> > >>>>>>>>> notification, or I would have tried it earlier.  Either way, =
thank
> > >>>>>>>>> you Frank for adding it.  I'll try to test when I have some t=
ime.
> > >>>>>>>>>
> > >>>>>>>>
> > >>>>>>>> I don't have the proper version of Mesa setup yet, but for wha=
t it's
> > >>>>>>>> worth, the firmware loads without error, and it doesn't hang.
> > >>>>>>>
> > >>>>>>> Based on [1] and [2],
> > >>>>>>>
> > >>>>>>> kmscube should work on R-Car as it works on RZ/G2L with panfros=
t as
> > >>>>>>> earlier version of RZ/G2L which uses drm based on RCar-Du, late=
r changed
> > >>>>>> to rzg2l-du.
> > >>>>>>
> > >>>>>> IIRC, the mesa support isn't there yet for kmscube to start.
> > >>>>>
> > >>>>> What about glmark2? I tested glmark2 as well.
> > >>>>
> > >>>> It's not really a matter of kmscube itself, but the interaction wi=
th the
> > >>>> compositor entirely. You can run a headless vulkan rendering, but =
an
> > >>>> application that renders to a window won't work.
> > >>>
> > >>> I have made a little progress.  I have Ubuntu running on an RZ/G2M
> > >>> (Rogue GX6250) with a device tree configuring the GPU and the GPU
> > >>> loads with firmware.
> > >>>
> > >>>   powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.45.2.=
58_v1.fw
> > >>>   powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)
> > >>>   [drm] Initialized powervr 1.0.0 20230904 for fd000000.gpu on mino=
r 0
> > >>>
> > >>> drmdevice lists card0 and renderD128
> > >>> --- Checking the number of DRM device available ---
> > >>> --- Devices reported 2 ---
> > >>> --- Retrieving devices information (PCI device revision is ignored)=
 ---
> > >>> device[0]
> > >>> +-> available_nodes 0x05
> > >>> +-> nodes
> > >>> |   +-> nodes[0] /dev/dri/card0
> > >>> |   +-> nodes[2] /dev/dri/renderD128
> > >>> +-> bustype 0002
> > >>> |   +-> platform
> > >>> |       +-> fullname /soc/gpu@fd000000
> > >>> +-> deviceinfo
> > >>>     +-> platform
> > >>>         +-> compatible
> > >>>                     renesas,r8a774a1-gpu
> > >>>                     img,img-axe
> > >>>
> > >>> There is more to this dump, but it seems to repeat. I wanted to sho=
w
> > >>> that it seems like it's trying to work.
> > >>>
> > >>> I think I need to modify the powervr code in mesa to recognize the
> > >>> renesas,r8a774a1-gpu and associate it with the rcar-du, but I am no=
t
> > >>> sure, and I am hoping someone might be able to provide some guidanc=
e,
> > >>> since I think I am missing something somewhere. I modified
> > >>> pvr_device.c in the mesa driver to attempt do this:
> > >>>
> > >>> /* This is the list of supported DRM render/display driver configs.=
 */
> > >>> static const struct pvr_drm_device_config pvr_drm_configs[] =3D {
> > >>>    DEF_CONFIG("mediatek,mt8173-gpu", "mediatek-drm"),
> > >>>    DEF_CONFIG("ti,am62-gpu", "ti,am625-dss"),
> > >>>    DEF_CONFIG("renesas,r8a774a1-gpu", "rcar-du"),
> > >>> };
> > >>>
> > >>> When I run modetest -M rcar-du, I can see the encoders and connecto=
rs
> > >>> and I can display test patterns, so the rcar-du is working.
> > >>>
> > >>> I built Mesa 24.0.1 with the following options:
> > >>>
> > >>> meson setup builddir -Dvulkan-drivers=3Dimagination-experimental
> > >>> -Dimagination-srv=3Dtrue -Dtools=3Dall -Dgallium-drivers=3Dzink,kms=
ro,swrast
> > >>>
> > >>> I have tried to set PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 the Mesa
> > >>> documentation for the powerVR, and I have exported the variable for
> > >>> VK_ICD_FILENAMES to point to the powervr json file.
> > >>>
> > >>> when I try to run glmark2-drm, I was expecting the GL reddered to b=
e
> > >>> the powervr, but it keeps using the
> > >>> GL_RENDERER:    llvmpipe (LLVM 15.0.7, 128 bits)
> > >>>
> > >>> I realize this driver is still in its infancy, but I was hoping
> > >>> someone could give me some guidance to let me know if the work to d=
o
> > >>> is on the Mesa side or the rcar-du driver side, or something else.
> > >>>
> > >>> I rebuilt both libdrm and mesa.  While I don't get any errors, I al=
so
> > >>> don't get the hardware acceleration I was hoping for.
> > >>>
> > >>> I even tried  PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1
> > >>> MESA_LOADER_DRIVER_OVERRIDE=3Dzink MESA_DEBUG=3Dcontect glmark2-drm
> > >>>
> > >>> ...but it only renders with llvmpipe
> > >>>
> > >>>     glmark2 2023.01
> > >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > >>>     OpenGL Information
> > >>>     GL_VENDOR:      Mesa
> > >>>     GL_RENDERER:    llvmpipe (LLVM 15.0.7, 128 bits)
> > >>>     GL_VERSION:     4.5 (Compatibility Profile) Mesa 24.0.1
> > >>>     Surface Config: buf=3D32 r=3D8 g=3D8 b=3D8 a=3D8 depth=3D32 ste=
ncil=3D0 samples=3D0
> > >>>     Surface Size:   3840x2160 fullscreen
> > >>>
> > >>>
> > >>> I am not as familiar with the Mesa side, but if I can get this work=
ing
> > >>> to a point where something is rendered, even if it's not 100%
> > >>> compliant, I'd like to push patches to the kernel and/or Mesa if
> > >>> necessary.
> > >>>
> > >>> adam
> > >>>
> > >>>
> > >>>
> > >>>
> > >>>>
> > >>>> Maxime
> > >>
> > >> I suggest you try running Vulkan demos (we use Sascha Willems=E2=80=
=99 [1])
> > >> instead of GL at this stage. Support for Zink is currently under hea=
vy
> > >> development so you may have trouble differentiating between issues w=
ith
> > >> your kernel changes and the incompleteness in Mesa.
> > >
> > > I hacked the look-up-tables in the Mesa PowerVR driver to match the
> > > values of the other GX6250. I know there must be some minor
> > > differences, but I don't know what they are right now.
> >
> > In case you missed my other email, we have device info for the GX6250
> > variant you=E2=80=99re using in [2]. I=E2=80=99ve been informed that br=
anch should be
> > usable as-is =E2=80=93 can you give that a try?
>
> I did  migrate to the branch you referenced and remove my hacked
> lookup-table, but I get similar results.
>
> >
> > > I also had to tweak   src/imagination/vulkan/pvr_device.c again to th=
e
> > > following:
> > >   DEF_CONFIG("renesas,r8a774a1-gpu", "renesas,du-r8a774a1"),
> >
> > Ah yes, not perfectly as-is then. These lines (pvr_drm_configs) declare
> > the pairing of GPU to display hardware. You=E2=80=99ll still need this =
tweak.

Should I push this tweak to gitlab?  I think there are a few other
Renesas SoC's that have the same GX6250 GPU.

> >
> > > I am not positive that is the correct thing to do, but with that, I
> > > can now run vulkaninfo.
> > > I know that it's not fully Vulkan compliant yet, but it appears there
> > > is some progress:
> > >
> > > Layers: count =3D 2
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > VK_LAYER_MESA_device_select (Linux device selection layer) Vulkan
> > > version 1.3.211, layer version 1:
> > >         Layer Extensions: count =3D 0
> > >         Devices: count =3D 2
> > >                 GPU id =3D 0 (Imagination PowerVR Rogue GX6250)
> > >                 Layer-Device Extensions: count =3D 0
> > >
> > >                 GPU id =3D 1 (llvmpipe (LLVM 15.0.7, 128 bits))
> > >                 Layer-Device Extensions: count =3D 0
> > >
> > > VK_LAYER_MESA_overlay (Mesa Overlay layer) Vulkan version 1.3.211,
> > > layer version 1:
> > >         Layer Extensions: count =3D 0
> > >         Devices: count =3D 2
> > >                 GPU id =3D 0 (Imagination PowerVR Rogue GX6250)
> > >                 Layer-Device Extensions: count =3D 0
> > >
> > >                 GPU id =3D 1 (llvmpipe (LLVM 15.0.7, 128 bits))
> > >                 Layer-Device Extensions: count =3D 0
> > >
> > >
> > > I then tried to redndr with vkgears, but it didn't redner.  When I ru=
n
> > > vkgears, I get the following:
> > >
> > > LAYER:            Searching for layer manifest files
> > > LAYER:               In following locations:
> > > LAYER:                  /home/aford/.config/vulkan/implicit_layer.d
> > > LAYER:                  /etc/xdg/xdg-ubuntu/vulkan/implicit_layer.d
> > > LAYER:                  /etc/xdg/vulkan/implicit_layer.d
> > > LAYER:                  /etc/vulkan/implicit_layer.d
> > > LAYER:                  /home/aford/.local/share/vulkan/implicit_laye=
r.d
> > > LAYER:                  /usr/share/ubuntu/vulkan/implicit_layer.d
> > > LAYER:                  /usr/share/gnome/vulkan/implicit_layer.d
> > > LAYER:                  /usr/local/share/vulkan/implicit_layer.d
> > > LAYER:                  /usr/share/vulkan/implicit_layer.d
> > > LAYER:                  /var/lib/snapd/desktop/vulkan/implicit_layer.=
d
> > > LAYER:               Found the following files:
> > > LAYER:
> > > /usr/share/vulkan/implicit_layer.d/VkLayer_MESA_device_select.json
> > > LAYER:            Searching for layer manifest files
> > > LAYER:               In following locations:
> > > LAYER:                  /home/aford/.config/vulkan/explicit_layer.d
> > > LAYER:                  /etc/xdg/xdg-ubuntu/vulkan/explicit_layer.d
> > > LAYER:                  /etc/xdg/vulkan/explicit_layer.d
> > > LAYER:                  /etc/vulkan/explicit_layer.d
> > > LAYER:                  /home/aford/.local/share/vulkan/explicit_laye=
r.d
> > > LAYER:                  /usr/share/ubuntu/vulkan/explicit_layer.d
> > > LAYER:                  /usr/share/gnome/vulkan/explicit_layer.d
> > > LAYER:                  /usr/local/share/vulkan/explicit_layer.d
> > > LAYER:                  /usr/share/vulkan/explicit_layer.d
> > > LAYER:                  /var/lib/snapd/desktop/vulkan/explicit_layer.=
d
> > > LAYER:               Found the following files:
> > > LAYER:
> > > /usr/share/vulkan/explicit_layer.d/VkLayer_MESA_overlay.json
> > > ERROR:            loader_validate_instance_extensions: Instance
> > > extension VK_KHR_wayland_surface not supported by available ICDs or
> > > enabled layers.
> > > Failed to create Vulkan instance.
> > >
> > > I have tried running in X.org mode instead of Wayland, but I get a
> > > different set of errors:
> >
> > We haven=E2=80=99t been testing with window systems yet =E2=80=93 can y=
ou try building
> > the Sascha Willems demos [1] with -DUSE_D2D_WSI=3DON and try running
> > triangle?
>
> I didn't realize you hadn't tried window systems yet.
>
> I'll give that a try.  I appreciate the suggestions.
>
> adam
> >
> > Matt

Matt,

I cloned and built the repo you suggested with  -DUSE_D2D_WSI=3DON, and
cmake threw a warning:

CMake Warning (dev) at
/usr/share/cmake-3.27/Modules/FindPackageHandleStandardArgs.cmake:438
(message):
  The package name passed to `find_package_handle_standard_args` (WAYLAND)
  does not match the name of the calling package (Wayland).  This can lead =
to
  problems in calling code that expects `find_package` result variables
  (e.g., `_FOUND`) to follow a certain pattern.
Call Stack (most recent call first):

I then built with make and executed the triangle demo with the following du=
mp:

INFO | LAYER:     Insert instance layer "VK_LAYER_MESA_device_select"
(libVkLayer_MESA_device_select.so)
LAYER:            vkCreateInstance layer callstack setup to:
LAYER:               <Application>
LAYER:                 ||
LAYER:               <Loader>
LAYER:                 ||
LAYER:               VK_LAYER_MESA_device_select
LAYER:                       Type: Implicit
LAYER:                           Disable Env Var:  NODEVICE_SELECT
LAYER:                       Manifest:
/usr/share/vulkan/implicit_layer.d/VkLayer_MESA_device_select.json
LAYER:                       Library:  libVkLayer_MESA_device_select.so
LAYER:                 ||
LAYER:               <Drivers>
WARNING:          terminator_CreateInstance: Failed to CreateInstance
in ICD 2.  Skipping ICD.
WARNING:          terminator_CreateInstance: Failed to CreateInstance
in ICD 5.  Skipping ICD.
MESA: error: Render device '/dev/dri/renderD128' has no compatible
display device.
DEBUG:            Copying old device 0 into new device 0
DEBUG:            Copying old device 1 into new device 1
DEBUG:            Copying old device 0 into new device 0
DEBUG:            Copying old device 1 into new device 1
DEBUG:            Copying old device 0 into new device 0
DEBUG:            Copying old device 1 into new device 1
INFO | LAYER:     Failed to find vkGetDeviceProcAddr in layer
"libVkLayer_MESA_device_select.so"
LAYER:            vkCreateDevice layer callstack setup to:
LAYER:               <Application>
LAYER:                 ||
LAYER:               <Loader>
LAYER:                 ||
LAYER:               <Device>
LAYER:                   Using "Imagination PowerVR Rogue GX6250" with
driver: "/usr/lib/aarch64-linux-gnu/libvulkan_powervr_mesa.so"
Validation error: Incorrect coeff register usage list.

/* USC program */

Aborted (core dumped)

When the renderD128 has no compatible display device, does that mean
there is more I should have done to somehow connect the rcar-du to the
GX6250?

> >
> > [2]: https://gitlab.freedesktop.org/imagination/mesa/-/tree/dev/devinfo
> >
> > > [ 11102.013] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
> > > [ 11102.014] (II) Module fbdevhw: vendor=3D"X.Org Foundation"
> > > [ 11102.014]    compiled for 1.21.1.7, module version =3D 0.0.2
> > > [ 11102.014]    ABI class: X.Org Video Driver, version 25.2
> > > [ 11102.015] (II) FBDEV(0): using default device
> > > [ 11102.016] (II) modeset(G0): using drv /dev/dri/card1
> > > [ 11102.016] (EE)
> > > Fatal server error:
> > > or all framebuffer devices
> > > [ 11102.016] (EE)
> > > [ 11102.017] (EE)
> > > Please consult the The X.Org Foundation support at http://wiki.x.org =
 for help.
> > >
> > > I think I am close.
> > >
> > > adam
> > >>
> > >> Matt
> > >>
> > >> [1]: https://github.com/SaschaWillems/Vulkan

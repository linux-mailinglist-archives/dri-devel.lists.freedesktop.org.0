Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3FC8D77A7
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 21:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7FA10E10E;
	Sun,  2 Jun 2024 19:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CTs1utTN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174E410E012
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 19:53:15 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2c1def9b4b3so1619230a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 12:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717357994; x=1717962794; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UuSghiq8SaCg3ud3aa4rAF/eySXtLIOaJJyM/31nKFM=;
 b=CTs1utTNV5X3yZNAs2wXaUuiR02gDeK0d6r9u0yDtIay2SbRAW1O7ygOh0+2w5ustf
 N45a3or32POL+ZKyaCYB+VLEsWrCDgMjjBGytPsXyXxCRifnruDWl0bGHw/gFYPA1Fc/
 Vm4B82GplLzUjUkbXqriPPw6jjWukJaod7hWDFL/UW5nST0aAamPUcwVg6gyrDBtUp3o
 0FpaCjcGiuBH7qguPDE5PaAKVxht0mGGu6yYpi8lc0pwKSAo4kH60PHkOi1Uxa6d6ETl
 CjSMH5dDIBwudelTrtF7x/8PJAvLTcErpLfb5qkDcX7ZldthwPi+Ba1PMNv3X1P54OPy
 18yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717357994; x=1717962794;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UuSghiq8SaCg3ud3aa4rAF/eySXtLIOaJJyM/31nKFM=;
 b=Vr+s7OZ1DRXHegjlErwG6dQR44ws1hQuQET5OjIIiDE0letRRuIeIus2exQbzkKIb4
 fkPpFfRtSM0pF1uFgBHQJTdKG5h8/CpWdfxBiijfJFoBxEz2fS0HHDA6pATVJSulJZYj
 GvZxiogNKN0vUZv6gEpTjtiIzCtpiyLip1oMjJQWm+LztyHn0ZTEY8QVK9U+5kZNvJR1
 aU67qgK3ZEw/ooDbHa64rnFPyNJtSidZre6yPiWNAJA993oolE5S/wQiyAcEdjZMKZEa
 x1aCymFFq90gwJ2DziZyQ6XhuWZR4ID2CN1bingqLk242gFH4JJ70lAszFfQt2NN0W9B
 Ebew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk0tH8xV7Rv69T+sLJ7iYJjymBtUOFM1hVdZAeSW9g8EJR1L706G0tM+yTQ6twYORMcBeJrHNZLPddIwqwanmnvcbByhjwSsy66Y40+8co
X-Gm-Message-State: AOJu0Yyp1fo1+2+1ZYmCo6Pcm9PcH0u5zOmza7HbmWemAujFGCVTNflU
 jjdrm3O0DOf4Sg0W/OLi2yCcY6S3mrEJ4fYDxL1XiTgyaiW77req08RT0zjA1MuuGeMg8jn1goY
 ntrrqzuXTB7ZCiyp8aPDROCwY09Y=
X-Google-Smtp-Source: AGHT+IGemgSPCqE+RSELEEyWjH50VnNtRDxvMwDUF8scQjGECuoEjEItfdM6PaQqn7WcTPDj7GNxr32qK2YSPfzhM+c=
X-Received: by 2002:a17:90a:ac03:b0:2c0:29d5:350b with SMTP id
 98e67ed59e1d1-2c1dc5d8a49mr6091450a91.48.1717357993692; Sun, 02 Jun 2024
 12:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org>
 <CAGXv+5FSDiZQDq21DnqaNVWLEU8JOR++7+BZLdON2Gp5+YyDrw@mail.gmail.com>
 <d4a97a657330d50d14cb93954e8b243489bb51ef.camel@imgtec.com>
In-Reply-To: <d4a97a657330d50d14cb93954e8b243489bb51ef.camel@imgtec.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 2 Jun 2024 14:53:02 -0500
Message-ID: <CAHCN7x+-2_nCSXABGupFmwo6PrFRuLWP1Lfm_sTwxkyX1gnPnA@mail.gmail.com>
Subject: Re: [PATCH 0/6] powervr: MT8173 GPU support
To: Frank Binns <Frank.Binns@imgtec.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 Matt Coster <Matt.Coster@imgtec.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "wenst@chromium.org" <wenst@chromium.org>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
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

On Fri, May 31, 2024 at 6:23=E2=80=AFAM Frank Binns <Frank.Binns@imgtec.com=
> wrote:
>
> Hi ChenYu,
>
> On Fri, 2024-05-31 at 12:00 +0800, Chen-Yu Tsai wrote:
> > On Thu, May 30, 2024 at 4:35=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> > > Hi everyone,
> > >
> > > This series enables the PowerVR GPU found in the MT8173 SoC, found in
> > > some Chromebooks.
>
> Thank you for the patches, I'm really happy to see these!
>
> > >
> > > This version is different from the initial powervr driver submission =
[1]
> > > in that it splits out the GPU glue layer support out of the powervr
> > > driver and into a separate clock and power domain driver. The glue co=
de
> > > is otherwise the same, and also the same as found in the ChromeOS
> > > kernels, with some extra comments and macro names added where possibl=
e.
> > >
> > > Patch 1 adds a binding for the glue layer, called mfgtop. The glue la=
yer
> > > contains clock and power controls for the GPU.
> > >
> > > Patch 2 adds a driver for the glue layer.
> > >
> > > Patch 3 adds an entry for the MT8173 GPU and 6XT series to the PowerV=
R
> > > binding.
> > >
> > > Patch 4 adds an entry for the PowerVR 6XT series GPU to the driver.
> > >
> > > Patch 5 corrects the clock for the GPU (called MFG) power domain.
> > >
> > > Patch 6 adds device nodes for the GPU and glue layer to the MT8173 dt=
si
> > > file.
> > >
> > > Patch 2 and 6 depend on patch 1 to build. I suppose some common
> > > immutable tree would be needed from the MediaTek maintainers.
> > >
> > > The kernel driver successfully probes the hardware and loads the
> > > "rogue_4.40.2.51_v1.fw" firmware provided by Imagination Technologies=
 [2].
> > > Userspace was tested with Mesa 24.0.8 from Debian Trixie rebuilt with
> > > the powervr vulkan driver enabled. `vulkaninfo` gives some informatio=
n
> > > about the GPU (attached at the end), but running the `triangle` examp=
le
> > > from the Sascha Willems demos [3] with -DUSE_D2D_WSI=3DON as recommen=
ded [4]
> > > failed with:
> > >
> > >     Can't find a display and a display mode!
> > >
> > > Same program worked correctly on a BeaglePlay and displayed a color
> > > gradient triangle. Not sure what went wrong here.
> >
> > Frank mentioned over IRC that giving `triangle` a screen resolution wou=
ld
> > make it work, and it did! Thanks Frank!
>
> No problem :)
>
> I've not dug into the display mode issue, but I'm wondering if it happens
> because there isn't a mode flagged as the preferred mode.
>
> >
> > OTOH I'm getting some extra warnings not seen on the BeaglePlay:
> >
> >     MESA: error: No hard coded passthrough rta vertex shader.
> > Returning empty shader.
> >     MESA: warning: ../src/imagination/vulkan/pvr_job_context.c:71:
> > FINISHME: Missing reset support for brn51764
> >     MESA: warning: ../src/imagination/vulkan/pvr_job_context.c:74:
> > FINISHME: Missing reset support for brn58839
> >     MESA: warning: ../src/imagination/vulkan/pvr_border.c:104:
> > FINISHME: Devices without tpu_border_colour_enhanced require entries
> > for compressed formats to be stored in the table pre-compressed.
> >
> > I also get a constant stream of kernel error messages, all the same:
> >
> >     powervr 13000000.gpu: [drm] Received unknown FWCCB command 2abc0069
> >
> > And the first few frames seem to flicker. (Though that could also be th=
e
> > display driver that's at fault.)
>
> The unknown commands are related to the GPU locking up, presumably becaus=
e bad
> jobs are being submitted, likely due to missing bits of support for the
> Series6XT GPUs in the Vulkan driver / compiler. The unknown commands are =
the
> firmware notifying the host that the GPU has been reset. The GPU resets w=
ould
> explain the flickering you're seeing.

For what it's worth the GX6250 on my Renesas board appears to behave
the same way. I Used a different branch, but applied the patches to
support the BVNC.  I then tweaked it for my Renesas hardware.   I ran
vkd3d-gears, and I get several frames before it glitched out and
reappeared.

adam

>
> Thanks
> Frank
>
> >
> >
> > For reference, on the BeaglePlay I see:
> >
> >     MESA: error: No hard coded idfwdf program. Returning empty program.
> >     MESA: error: No hard coded passthrough vertex shader. Returning
> > empty shader.
> >     MESA: warning:
> > ../src/imagination/vulkan/pvr_descriptor_set.c:1073: FINISHME: Entry
> > tracker for allocations?
> >
> >
> > Regards
> > ChenYu
> >
> >
> > > Anyway, please have a look and test.
> > >
> > >
> > > Thanks
> > > ChenYu
> > >
> > > [1] https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.w=
alker@imgtec.com/
> > > [2] https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/=
powervr
> > > [3] https://github.com/SaschaWillems/Vulkan
> > > [4] https://lore.kernel.org/dri-devel/f2b2671e-5acc-4dec-9c2e-3c9cd2e=
1f19e@imgtec.com/
> > >
> > > Chen-Yu Tsai (6):
> > >   dt-bindings: clock: mediatek: Add mt8173 mfgtop
> > >   clk: mediatek: Add mt8173-mfgtop driver
> > >   dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
> > >   drm/imagination: Add compatible string entry for Series6XT
> > >   arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
> > >   arm64: dts: mediatek: mt8173: Add GPU device nodes
> > >
> > >  .../clock/mediatek,mt8173-mfgtop.yaml         |  71 ++++++
> > >  .../bindings/gpu/img,powervr-rogue.yaml       |  24 +-
> > >  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  26 +-
> > >  drivers/clk/mediatek/Kconfig                  |   9 +
> > >  drivers/clk/mediatek/Makefile                 |   1 +
> > >  drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 240 ++++++++++++++++=
++
> > >  drivers/gpu/drm/imagination/pvr_drv.c         |   1 +
> > >  include/dt-bindings/clock/mt8173-clk.h        |   7 +
> > >  8 files changed, 374 insertions(+), 5 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,=
mt8173-mfgtop.yaml
> > >  create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c
> > >
> > >
> > > base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
> > >
> > > Vulkan info output:
> > >
> > > WARNING: [Loader Message] Code 0 : terminator_CreateInstance: Receive=
d return code -3 from call to vkCreateInstance in ICD /usr/lib/aarch64-linu=
x-gnu/libvulkan_virtio.so. Skipping this driver.
> > > 'DISPLAY' environment variable not set... skipping surface info
> > > ERROR: [../src/panfrost/vulkan/panvk_device.c:386] Code 0 : WARNING: =
panvk is not a conformant vulkan implementation, pass PAN_I_WANT_A_BROKEN_V=
ULKAN_DRIVER=3D1 if you know what you're doing. (VK_ERROR_INCOMPATIBLE_DRIV=
ER)
> > > MESA: error: No hard coded idfwdf program. Returning empty program.
> > > MESA: error: No hard coded passthrough rta vertex shader. Returning e=
mpty shader.
> > > MESA: error: No hard coded passthrough vertex shader. Returning empty=
 shader.
> > > MESA: warning: ../src/imagination/vulkan/pvr_job_context.c:71: FINISH=
ME: Missing reset support for brn51764
> > > MESA: warning: ../src/imagination/vulkan/pvr_job_context.c:74: FINISH=
ME: Missing reset support for brn58839
> > > MESA: warning: ../src/imagination/vulkan/pvr_border.c:104: FINISHME: =
Devices without tpu_border_colour_enhanced require entries for compressed f=
ormats to be stored in the table pre-compressed.
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > VULKANINFO
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > Vulkan Instance Version: 1.3.280
> > >
> > >
> > > Instance Extensions: count =3D 23
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > >         VK_EXT_acquire_drm_display             : extension revision 1
> > >         VK_EXT_acquire_xlib_display            : extension revision 1
> > >         VK_EXT_debug_report                    : extension revision 1=
0
> > >         VK_EXT_debug_utils                     : extension revision 2
> > >         VK_EXT_direct_mode_display             : extension revision 1
> > >         VK_EXT_display_surface_counter         : extension revision 1
> > >         VK_EXT_surface_maintenance1            : extension revision 1
> > >         VK_EXT_swapchain_colorspace            : extension revision 4
> > >         VK_KHR_device_group_creation           : extension revision 1
> > >         VK_KHR_display                         : extension revision 2=
3
> > >         VK_KHR_external_fence_capabilities     : extension revision 1
> > >         VK_KHR_external_memory_capabilities    : extension revision 1
> > >         VK_KHR_external_semaphore_capabilities : extension revision 1
> > >         VK_KHR_get_display_properties2         : extension revision 1
> > >         VK_KHR_get_physical_device_properties2 : extension revision 2
> > >         VK_KHR_get_surface_capabilities2       : extension revision 1
> > >         VK_KHR_portability_enumeration         : extension revision 1
> > >         VK_KHR_surface                         : extension revision 2=
5
> > >         VK_KHR_surface_protected_capabilities  : extension revision 1
> > >         VK_KHR_wayland_surface                 : extension revision 6
> > >         VK_KHR_xcb_surface                     : extension revision 6
> > >         VK_KHR_xlib_surface                    : extension revision 6
> > >         VK_LUNARG_direct_driver_loading        : extension revision 1
> > >
> > > Layers: count =3D 2
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > VK_LAYER_MESA_device_select (Linux device selection layer) Vulkan ver=
sion 1.3.211, layer version 1:
> > >         Layer Extensions: count =3D 0
> > >         Devices: count =3D 2
> > >                 GPU id =3D 0 (Imagination PowerVR Rogue GX6250)
> > >                 Layer-Device Extensions: count =3D 0
> > >
> > >                 GPU id =3D 1 (llvmpipe (LLVM 17.0.6, 128 bits))
> > >                 Layer-Device Extensions: count =3D 0
> > >
> > > VK_LAYER_MESA_overlay (Mesa Overlay layer) Vulkan version 1.3.211, la=
yer version 1:
> > >         Layer Extensions: count =3D 0
> > >         Devices: count =3D 2
> > >                 GPU id =3D 0 (Imagination PowerVR Rogue GX6250)
> > >                 Layer-Device Extensions: count =3D 0
> > >
> > >                 GPU id =3D 1 (llvmpipe (LLVM 17.0.6, 128 bits))
> > >                 Layer-Device Extensions: count =3D 0
> > >
> > > Device Properties and Extensions:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > GPU0:
> > > VkPhysicalDeviceProperties:
> > > ---------------------------
> > >         apiVersion        =3D 1.0.274 (4194578)
> > >         driverVersion     =3D 24.0.8 (100663304)
> > >         vendorID          =3D 0x1010
> > >         deviceID          =3D 0x6250
> > >         deviceType        =3D PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU
> > >         deviceName        =3D Imagination PowerVR Rogue GX6250
> > >         pipelineCacheUUID =3D 6ddf30eb-d118-41f1-455f-580ae751c27b
> > >
> > > VkPhysicalDeviceLimits:
> > > -----------------------
> > >         maxImageDimension1D                             =3D 8192
> > >         maxImageDimension2D                             =3D 8192
> > >         maxImageDimension3D                             =3D 2048
> > >         maxImageDimensionCube                           =3D 8192
> > >         maxImageArrayLayers                             =3D 2048
> > >         maxTexelBufferElements                          =3D 65536
> > >         maxUniformBufferRange                           =3D 134217728
> > >         maxStorageBufferRange                           =3D 134217728
> > >         maxPushConstantsSize                            =3D 256
> > >         maxMemoryAllocationCount                        =3D 429496729=
5
> > >         maxSamplerAllocationCount                       =3D 429496729=
5
> > >         bufferImageGranularity                          =3D 0x0000000=
1
> > >         sparseAddressSpaceSize                          =3D 0x4000000=
000
> > >         maxBoundDescriptorSets                          =3D 4
> > >         maxPerStageDescriptorSamplers                   =3D 32
> > >         maxPerStageDescriptorUniformBuffers             =3D 64
> > >         maxPerStageDescriptorStorageBuffers             =3D 36
> > >         maxPerStageDescriptorSampledImages              =3D 48
> > >         maxPerStageDescriptorStorageImages              =3D 8
> > >         maxPerStageDescriptorInputAttachments           =3D 8
> > >         maxPerStageResources                            =3D 224
> > >         maxDescriptorSetSamplers                        =3D 256
> > >         maxDescriptorSetUniformBuffers                  =3D 256
> > >         maxDescriptorSetUniformBuffersDynamic           =3D 8
> > >         maxDescriptorSetStorageBuffers                  =3D 256
> > >         maxDescriptorSetStorageBuffersDynamic           =3D 8
> > >         maxDescriptorSetSampledImages                   =3D 256
> > >         maxDescriptorSetStorageImages                   =3D 256
> > >         maxDescriptorSetInputAttachments                =3D 256
> > >         maxVertexInputAttributes                        =3D 16
> > >         maxVertexInputBindings                          =3D 16
> > >         maxVertexInputAttributeOffset                   =3D 65535
> > >         maxVertexInputBindingStride                     =3D 214748364=
8
> > >         maxVertexOutputComponents                       =3D 128
> > >         maxTessellationGenerationLevel                  =3D 0
> > >         maxTessellationPatchSize                        =3D 0
> > >         maxTessellationControlPerVertexInputComponents  =3D 0
> > >         maxTessellationControlPerVertexOutputComponents =3D 0
> > >         maxTessellationControlPerPatchOutputComponents  =3D 0
> > >         maxTessellationControlTotalOutputComponents     =3D 0
> > >         maxTessellationEvaluationInputComponents        =3D 0
> > >         maxTessellationEvaluationOutputComponents       =3D 0
> > >         maxGeometryShaderInvocations                    =3D 0
> > >         maxGeometryInputComponents                      =3D 0
> > >         maxGeometryOutputComponents                     =3D 0
> > >         maxGeometryOutputVertices                       =3D 0
> > >         maxGeometryTotalOutputComponents                =3D 0
> > >         maxFragmentInputComponents                      =3D 128
> > >         maxFragmentOutputAttachments                    =3D 8
> > >         maxFragmentDualSrcAttachments                   =3D 0
> > >         maxFragmentCombinedOutputResources              =3D 52
> > >         maxComputeSharedMemorySize                      =3D 16384
> > >         maxComputeWorkGroupCount: count =3D 3
> > >                 65536
> > >                 65536
> > >                 65536
> > >         maxComputeWorkGroupInvocations                  =3D 512
> > >         maxComputeWorkGroupSize: count =3D 3
> > >                 512
> > >                 512
> > >                 64
> > >         subPixelPrecisionBits                           =3D 8
> > >         subTexelPrecisionBits                           =3D 8
> > >         mipmapPrecisionBits                             =3D 8
> > >         maxDrawIndexedIndexValue                        =3D 429496729=
5
> > >         maxDrawIndirectCount                            =3D 214748364=
8
> > >         maxSamplerLodBias                               =3D 16
> > >         maxSamplerAnisotropy                            =3D 1
> > >         maxViewports                                    =3D 1
> > >         maxViewportDimensions: count =3D 2
> > >                 8192
> > >                 8192
> > >         viewportBoundsRange: count =3D 2
> > >                 -16384
> > >                 16384
> > >         viewportSubPixelBits                            =3D 0
> > >         minMemoryMapAlignment                           =3D 64
> > >         minTexelBufferOffsetAlignment                   =3D 0x0000001=
0
> > >         minUniformBufferOffsetAlignment                 =3D 0x0000000=
4
> > >         minStorageBufferOffsetAlignment                 =3D 0x0000000=
4
> > >         minTexelOffset                                  =3D -8
> > >         maxTexelOffset                                  =3D 7
> > >         minTexelGatherOffset                            =3D -8
> > >         maxTexelGatherOffset                            =3D 7
> > >         minInterpolationOffset                          =3D -0.5
> > >         maxInterpolationOffset                          =3D 0.5
> > >         subPixelInterpolationOffsetBits                 =3D 4
> > >         maxFramebufferWidth                             =3D 8192
> > >         maxFramebufferHeight                            =3D 8192
> > >         maxFramebufferLayers                            =3D 2048
> > >         framebufferColorSampleCounts: count =3D 4
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_2_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >                 SAMPLE_COUNT_8_BIT
> > >         framebufferDepthSampleCounts: count =3D 4
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_2_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >                 SAMPLE_COUNT_8_BIT
> > >         framebufferStencilSampleCounts: count =3D 4
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_2_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >                 SAMPLE_COUNT_8_BIT
> > >         framebufferNoAttachmentsSampleCounts: count =3D 4
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_2_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >                 SAMPLE_COUNT_8_BIT
> > >         maxColorAttachments                             =3D 8
> > >         sampledImageColorSampleCounts: count =3D 4
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_2_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >                 SAMPLE_COUNT_8_BIT
> > >         sampledImageIntegerSampleCounts: count =3D 4
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_2_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >                 SAMPLE_COUNT_8_BIT
> > >         sampledImageDepthSampleCounts: count =3D 4
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_2_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >                 SAMPLE_COUNT_8_BIT
> > >         sampledImageStencilSampleCounts: count =3D 4
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_2_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >                 SAMPLE_COUNT_8_BIT
> > >         storageImageSampleCounts: count =3D 4
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_2_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >                 SAMPLE_COUNT_8_BIT
> > >         maxSampleMaskWords                              =3D 1
> > >         timestampComputeAndGraphics                     =3D false
> > >         timestampPeriod                                 =3D 0
> > >         maxClipDistances                                =3D 8
> > >         maxCullDistances                                =3D 8
> > >         maxCombinedClipAndCullDistances                 =3D 8
> > >         discreteQueuePriorities                         =3D 2
> > >         pointSizeRange: count =3D 2
> > >                 1
> > >                 511
> > >         lineWidthRange: count =3D 2
> > >                 0.0625
> > >                 16
> > >         pointSizeGranularity                            =3D 0.0625
> > >         lineWidthGranularity                            =3D 0.0625
> > >         strictLines                                     =3D false
> > >         standardSampleLocations                         =3D true
> > >         optimalBufferCopyOffsetAlignment                =3D 0x0000000=
4
> > >         optimalBufferCopyRowPitchAlignment              =3D 0x0000000=
4
> > >         nonCoherentAtomSize                             =3D 0x0000000=
1
> > >
> > > VkPhysicalDeviceSparseProperties:
> > > ---------------------------------
> > >         residencyStandard2DBlockShape            =3D false
> > >         residencyStandard2DMultisampleBlockShape =3D false
> > >         residencyStandard3DBlockShape            =3D false
> > >         residencyAlignedMipSize                  =3D false
> > >         residencyNonResidentStrict               =3D false
> > >
> > > VkPhysicalDeviceTexelBufferAlignmentPropertiesEXT:
> > > --------------------------------------------------
> > >         storageTexelBufferOffsetAlignmentBytes       =3D 0x00000010
> > >         storageTexelBufferOffsetSingleTexelAlignment =3D true
> > >         uniformTexelBufferOffsetAlignmentBytes       =3D 0x00000010
> > >         uniformTexelBufferOffsetSingleTexelAlignment =3D false
> > >
> > > VkPhysicalDeviceTimelineSemaphorePropertiesKHR:
> > > -----------------------------------------------
> > >         maxTimelineSemaphoreValueDifference =3D 18446744073709551615
> > >
> > > Device Extensions: count =3D 20
> > >         VK_EXT_external_memory_dma_buf        : extension revision 1
> > >         VK_EXT_host_query_reset               : extension revision 1
> > >         VK_EXT_private_data                   : extension revision 1
> > >         VK_EXT_scalar_block_layout            : extension revision 1
> > >         VK_EXT_texel_buffer_alignment         : extension revision 1
> > >         VK_EXT_tooling_info                   : extension revision 1
> > >         VK_KHR_bind_memory2                   : extension revision 1
> > >         VK_KHR_copy_commands2                 : extension revision 1
> > >         VK_KHR_external_fence                 : extension revision 1
> > >         VK_KHR_external_fence_fd              : extension revision 1
> > >         VK_KHR_external_memory                : extension revision 1
> > >         VK_KHR_external_memory_fd             : extension revision 1
> > >         VK_KHR_external_semaphore             : extension revision 1
> > >         VK_KHR_external_semaphore_fd          : extension revision 1
> > >         VK_KHR_format_feature_flags2          : extension revision 2
> > >         VK_KHR_get_memory_requirements2       : extension revision 1
> > >         VK_KHR_image_format_list              : extension revision 1
> > >         VK_KHR_swapchain                      : extension revision 70
> > >         VK_KHR_timeline_semaphore             : extension revision 2
> > >         VK_KHR_uniform_buffer_standard_layout : extension revision 1
> > >
> > > VkQueueFamilyProperties:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > >         queueProperties[0]:
> > >         -------------------
> > >                 minImageTransferGranularity =3D (1,1,1)
> > >                 queueCount                  =3D 2
> > >                 queueFlags                  =3D QUEUE_GRAPHICS_BIT | =
QUEUE_COMPUTE_BIT | QUEUE_TRANSFER_BIT
> > >                 timestampValidBits          =3D 0
> > >                 present support             =3D false
> > >
> > > VkPhysicalDeviceMemoryProperties:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > memoryHeaps: count =3D 1
> > >         memoryHeaps[0]:
> > >                 size   =3D 1752969216 (0x687c3000) (1.63 GiB)
> > >                 flags: count =3D 1
> > >                         MEMORY_HEAP_DEVICE_LOCAL_BIT
> > > memoryTypes: count =3D 1
> > >         memoryTypes[0]:
> > >                 heapIndex     =3D 0
> > >                 propertyFlags =3D 0x0007: count =3D 3
> > >                         MEMORY_PROPERTY_DEVICE_LOCAL_BIT
> > >                         MEMORY_PROPERTY_HOST_VISIBLE_BIT
> > >                         MEMORY_PROPERTY_HOST_COHERENT_BIT
> > >                 usable for:
> > >                         IMAGE_TILING_OPTIMAL:
> > >                                 color images
> > >                                 FORMAT_D16_UNORM
> > >                                 FORMAT_D32_SFLOAT
> > >                                 FORMAT_S8_UINT
> > >                                 FORMAT_D24_UNORM_S8_UINT
> > >                                 (non-sparse)
> > >                         IMAGE_TILING_LINEAR:
> > >                                 color images
> > >                                 (non-sparse)
> > >
> > > VkPhysicalDeviceFeatures:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > >         robustBufferAccess                      =3D true
> > >         fullDrawIndexUint32                     =3D true
> > >         imageCubeArray                          =3D true
> > >         independentBlend                        =3D false
> > >         geometryShader                          =3D false
> > >         tessellationShader                      =3D false
> > >         sampleRateShading                       =3D true
> > >         dualSrcBlend                            =3D false
> > >         logicOp                                 =3D false
> > >         multiDrawIndirect                       =3D true
> > >         drawIndirectFirstInstance               =3D true
> > >         depthClamp                              =3D true
> > >         depthBiasClamp                          =3D true
> > >         fillModeNonSolid                        =3D false
> > >         depthBounds                             =3D false
> > >         wideLines                               =3D true
> > >         largePoints                             =3D true
> > >         alphaToOne                              =3D false
> > >         multiViewport                           =3D false
> > >         samplerAnisotropy                       =3D false
> > >         textureCompressionETC2                  =3D true
> > >         textureCompressionASTC_LDR              =3D false
> > >         textureCompressionBC                    =3D false
> > >         occlusionQueryPrecise                   =3D false
> > >         pipelineStatisticsQuery                 =3D false
> > >         vertexPipelineStoresAndAtomics          =3D true
> > >         fragmentStoresAndAtomics                =3D true
> > >         shaderTessellationAndGeometryPointSize  =3D false
> > >         shaderImageGatherExtended               =3D false
> > >         shaderStorageImageExtendedFormats       =3D true
> > >         shaderStorageImageMultisample           =3D false
> > >         shaderStorageImageReadWithoutFormat     =3D true
> > >         shaderStorageImageWriteWithoutFormat    =3D false
> > >         shaderUniformBufferArrayDynamicIndexing =3D true
> > >         shaderSampledImageArrayDynamicIndexing  =3D true
> > >         shaderStorageBufferArrayDynamicIndexing =3D true
> > >         shaderStorageImageArrayDynamicIndexing  =3D true
> > >         shaderClipDistance                      =3D false
> > >         shaderCullDistance                      =3D false
> > >         shaderFloat64                           =3D false
> > >         shaderInt64                             =3D true
> > >         shaderInt16                             =3D true
> > >         shaderResourceResidency                 =3D false
> > >         shaderResourceMinLod                    =3D false
> > >         sparseBinding                           =3D false
> > >         sparseResidencyBuffer                   =3D false
> > >         sparseResidencyImage2D                  =3D false
> > >         sparseResidencyImage3D                  =3D false
> > >         sparseResidency2Samples                 =3D false
> > >         sparseResidency4Samples                 =3D false
> > >         sparseResidency8Samples                 =3D false
> > >         sparseResidency16Samples                =3D false
> > >         sparseResidencyAliased                  =3D false
> > >         variableMultisampleRate                 =3D false
> > >         inheritedQueries                        =3D false
> > >
> > > VkPhysicalDeviceHostQueryResetFeaturesEXT:
> > > ------------------------------------------
> > >         hostQueryReset =3D true
> > >
> > > VkPhysicalDevicePrivateDataFeaturesEXT:
> > > ---------------------------------------
> > >         privateData =3D true
> > >
> > > VkPhysicalDeviceScalarBlockLayoutFeaturesEXT:
> > > ---------------------------------------------
> > >         scalarBlockLayout =3D true
> > >
> > > VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT:
> > > ------------------------------------------------
> > >         texelBufferAlignment =3D true
> > >
> > > VkPhysicalDeviceTimelineSemaphoreFeaturesKHR:
> > > ---------------------------------------------
> > >         timelineSemaphore =3D true
> > >
> > > VkPhysicalDeviceUniformBufferStandardLayoutFeaturesKHR:
> > > -------------------------------------------------------
> > >         uniformBufferStandardLayout =3D true
> > >
> > >
> > > GPU1:
> > > VkPhysicalDeviceProperties:
> > > ---------------------------
> > >         apiVersion        =3D 1.3.274 (4206866)
> > >         driverVersion     =3D 0.0.1 (1)
> > >         vendorID          =3D 0x10005
> > >         deviceID          =3D 0x0000
> > >         deviceType        =3D PHYSICAL_DEVICE_TYPE_CPU
> > >         deviceName        =3D llvmpipe (LLVM 17.0.6, 128 bits)
> > >         pipelineCacheUUID =3D 32342e30-2e38-2d31-2b70-316161616161
> > >
> > > VkPhysicalDeviceLimits:
> > > -----------------------
> > >         maxImageDimension1D                             =3D 16384
> > >         maxImageDimension2D                             =3D 16384
> > >         maxImageDimension3D                             =3D 4096
> > >         maxImageDimensionCube                           =3D 32768
> > >         maxImageArrayLayers                             =3D 2048
> > >         maxTexelBufferElements                          =3D 134217728
> > >         maxUniformBufferRange                           =3D 65536
> > >         maxStorageBufferRange                           =3D 134217728
> > >         maxPushConstantsSize                            =3D 256
> > >         maxMemoryAllocationCount                        =3D 429496729=
5
> > >         maxSamplerAllocationCount                       =3D 32768
> > >         bufferImageGranularity                          =3D 0x0000004=
0
> > >         sparseAddressSpaceSize                          =3D 0x0000000=
0
> > >         maxBoundDescriptorSets                          =3D 8
> > >         maxPerStageDescriptorSamplers                   =3D 1000000
> > >         maxPerStageDescriptorUniformBuffers             =3D 1000000
> > >         maxPerStageDescriptorStorageBuffers             =3D 1000000
> > >         maxPerStageDescriptorSampledImages              =3D 1000000
> > >         maxPerStageDescriptorStorageImages              =3D 1000000
> > >         maxPerStageDescriptorInputAttachments           =3D 1000000
> > >         maxPerStageResources                            =3D 1000000
> > >         maxDescriptorSetSamplers                        =3D 1000000
> > >         maxDescriptorSetUniformBuffers                  =3D 1000000
> > >         maxDescriptorSetUniformBuffersDynamic           =3D 1000000
> > >         maxDescriptorSetStorageBuffers                  =3D 1000000
> > >         maxDescriptorSetStorageBuffersDynamic           =3D 1000000
> > >         maxDescriptorSetSampledImages                   =3D 1000000
> > >         maxDescriptorSetStorageImages                   =3D 1000000
> > >         maxDescriptorSetInputAttachments                =3D 1000000
> > >         maxVertexInputAttributes                        =3D 32
> > >         maxVertexInputBindings                          =3D 32
> > >         maxVertexInputAttributeOffset                   =3D 2047
> > >         maxVertexInputBindingStride                     =3D 2048
> > >         maxVertexOutputComponents                       =3D 128
> > >         maxTessellationGenerationLevel                  =3D 64
> > >         maxTessellationPatchSize                        =3D 32
> > >         maxTessellationControlPerVertexInputComponents  =3D 128
> > >         maxTessellationControlPerVertexOutputComponents =3D 128
> > >         maxTessellationControlPerPatchOutputComponents  =3D 128
> > >         maxTessellationControlTotalOutputComponents     =3D 4096
> > >         maxTessellationEvaluationInputComponents        =3D 128
> > >         maxTessellationEvaluationOutputComponents       =3D 128
> > >         maxGeometryShaderInvocations                    =3D 32
> > >         maxGeometryInputComponents                      =3D 64
> > >         maxGeometryOutputComponents                     =3D 128
> > >         maxGeometryOutputVertices                       =3D 1024
> > >         maxGeometryTotalOutputComponents                =3D 1024
> > >         maxFragmentInputComponents                      =3D 128
> > >         maxFragmentOutputAttachments                    =3D 8
> > >         maxFragmentDualSrcAttachments                   =3D 2
> > >         maxFragmentCombinedOutputResources              =3D 104
> > >         maxComputeSharedMemorySize                      =3D 32768
> > >         maxComputeWorkGroupCount: count =3D 3
> > >                 65535
> > >                 65535
> > >                 65535
> > >         maxComputeWorkGroupInvocations                  =3D 1024
> > >         maxComputeWorkGroupSize: count =3D 3
> > >                 1024
> > >                 1024
> > >                 1024
> > >         subPixelPrecisionBits                           =3D 8
> > >         subTexelPrecisionBits                           =3D 8
> > >         mipmapPrecisionBits                             =3D 4
> > >         maxDrawIndexedIndexValue                        =3D 429496729=
5
> > >         maxDrawIndirectCount                            =3D 429496729=
5
> > >         maxSamplerLodBias                               =3D 16
> > >         maxSamplerAnisotropy                            =3D 16
> > >         maxViewports                                    =3D 16
> > >         maxViewportDimensions: count =3D 2
> > >                 16384
> > >                 16384
> > >         viewportBoundsRange: count =3D 2
> > >                 -32768
> > >                 32768
> > >         viewportSubPixelBits                            =3D 0
> > >         minMemoryMapAlignment                           =3D 64
> > >         minTexelBufferOffsetAlignment                   =3D 0x0000001=
0
> > >         minUniformBufferOffsetAlignment                 =3D 0x0000001=
0
> > >         minStorageBufferOffsetAlignment                 =3D 0x0000001=
0
> > >         minTexelOffset                                  =3D -32
> > >         maxTexelOffset                                  =3D 31
> > >         minTexelGatherOffset                            =3D -32
> > >         maxTexelGatherOffset                            =3D 31
> > >         minInterpolationOffset                          =3D -2
> > >         maxInterpolationOffset                          =3D 2
> > >         subPixelInterpolationOffsetBits                 =3D 8
> > >         maxFramebufferWidth                             =3D 16384
> > >         maxFramebufferHeight                            =3D 16384
> > >         maxFramebufferLayers                            =3D 2048
> > >         framebufferColorSampleCounts: count =3D 2
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >         framebufferDepthSampleCounts: count =3D 2
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >         framebufferStencilSampleCounts: count =3D 2
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >         framebufferNoAttachmentsSampleCounts: count =3D 2
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >         maxColorAttachments                             =3D 8
> > >         sampledImageColorSampleCounts: count =3D 2
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >         sampledImageIntegerSampleCounts: count =3D 2
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >         sampledImageDepthSampleCounts: count =3D 2
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >         sampledImageStencilSampleCounts: count =3D 2
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >         storageImageSampleCounts: count =3D 2
> > >                 SAMPLE_COUNT_1_BIT
> > >                 SAMPLE_COUNT_4_BIT
> > >         maxSampleMaskWords                              =3D 1
> > >         timestampComputeAndGraphics                     =3D true
> > >         timestampPeriod                                 =3D 1
> > >         maxClipDistances                                =3D 8
> > >         maxCullDistances                                =3D 8
> > >         maxCombinedClipAndCullDistances                 =3D 8
> > >         discreteQueuePriorities                         =3D 2
> > >         pointSizeRange: count =3D 2
> > >                 0
> > >                 255
> > >         lineWidthRange: count =3D 2
> > >                 1
> > >                 255
> > >         pointSizeGranularity                            =3D 0.125
> > >         lineWidthGranularity                            =3D 0.0078125
> > >         strictLines                                     =3D true
> > >         standardSampleLocations                         =3D true
> > >         optimalBufferCopyOffsetAlignment                =3D 0x0000008=
0
> > >         optimalBufferCopyRowPitchAlignment              =3D 0x0000008=
0
> > >         nonCoherentAtomSize                             =3D 0x0000004=
0
> > >
> > > VkPhysicalDeviceSparseProperties:
> > > ---------------------------------
> > >         residencyStandard2DBlockShape            =3D false
> > >         residencyStandard2DMultisampleBlockShape =3D false
> > >         residencyStandard3DBlockShape            =3D false
> > >         residencyAlignedMipSize                  =3D false
> > >         residencyNonResidentStrict               =3D false
> > >
> > > VkPhysicalDeviceCustomBorderColorPropertiesEXT:
> > > -----------------------------------------------
> > >         maxCustomBorderColorSamplers =3D 32768
> > >
> > > VkPhysicalDeviceDescriptorBufferDensityMapPropertiesEXT:
> > > --------------------------------------------------------
> > >         combinedImageSamplerDensityMapDescriptorSize =3D 0
> > >
> > > VkPhysicalDeviceDescriptorBufferPropertiesEXT:
> > > ----------------------------------------------
> > >         combinedImageSamplerDescriptorSingleArray            =3D true
> > >         bufferlessPushDescriptors                            =3D true
> > >         allowSamplerImageViewPostSubmitCreation              =3D fals=
e
> > >         descriptorBufferOffsetAlignment                      =3D 0x00=
000004
> > >         maxDescriptorBufferBindings                          =3D 8
> > >         maxResourceDescriptorBufferBindings                  =3D 8
> > >         maxSamplerDescriptorBufferBindings                   =3D 8
> > >         maxEmbeddedImmutableSamplerBindings                  =3D 8
> > >         maxEmbeddedImmutableSamplers                         =3D 2032
> > >         bufferCaptureReplayDescriptorDataSize                =3D 0
> > >         imageCaptureReplayDescriptorDataSize                 =3D 0
> > >         imageViewCaptureReplayDescriptorDataSize             =3D 0
> > >         samplerCaptureReplayDescriptorDataSize               =3D 0
> > >         accelerationStructureCaptureReplayDescriptorDataSize =3D 0
> > >         samplerDescriptorSize                                =3D 256
> > >         combinedImageSamplerDescriptorSize                   =3D 256
> > >         sampledImageDescriptorSize                           =3D 256
> > >         storageImageDescriptorSize                           =3D 256
> > >         uniformTexelBufferDescriptorSize                     =3D 256
> > >         robustUniformTexelBufferDescriptorSize               =3D 256
> > >         storageTexelBufferDescriptorSize                     =3D 256
> > >         robustStorageTexelBufferDescriptorSize               =3D 256
> > >         uniformBufferDescriptorSize                          =3D 256
> > >         robustUniformBufferDescriptorSize                    =3D 256
> > >         storageBufferDescriptorSize                          =3D 256
> > >         robustStorageBufferDescriptorSize                    =3D 256
> > >         inputAttachmentDescriptorSize                        =3D 256
> > >         accelerationStructureDescriptorSize                  =3D 0
> > >         maxSamplerDescriptorBufferRange                      =3D 0x08=
000000
> > >         maxResourceDescriptorBufferRange                     =3D 0x10=
000000
> > >         samplerDescriptorBufferAddressSpaceSize              =3D 0x08=
000000
> > >         resourceDescriptorBufferAddressSpaceSize             =3D 0x08=
000000
> > >         descriptorBufferAddressSpaceSize                     =3D 0x08=
000000
> > >
> > > VkPhysicalDeviceExtendedDynamicState3PropertiesEXT:
> > > ---------------------------------------------------
> > >         dynamicPrimitiveTopologyUnrestricted =3D true
> > >
> > > VkPhysicalDeviceExternalMemoryHostPropertiesEXT:
> > > ------------------------------------------------
> > >         minImportedHostPointerAlignment =3D 0x00001000
> > >
> > > VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT:
> > > -----------------------------------------------------
> > >         graphicsPipelineLibraryFastLinking                        =3D=
 true
> > >         graphicsPipelineLibraryIndependentInterpolationDecoration =3D=
 true
> > >
> > > VkPhysicalDeviceLineRasterizationPropertiesKHR:
> > > -----------------------------------------------
> > >         lineSubPixelPrecisionBits =3D 8
> > >
> > > VkPhysicalDeviceMaintenance5PropertiesKHR:
> > > ------------------------------------------
> > >         earlyFragmentMultisampleCoverageAfterSampleCounting =3D true
> > >         earlyFragmentSampleMaskTestBeforeSampleCounting     =3D false
> > >         depthStencilSwizzleOneSupport                       =3D false
> > >         polygonModePointSize                                =3D true
> > >         nonStrictSinglePixelWideLinesUseParallelogram       =3D false
> > >         nonStrictWideLinesUseParallelogram                  =3D false
> > >
> > > VkPhysicalDeviceMaintenance6PropertiesKHR:
> > > ------------------------------------------
> > >         blockTexelViewCompatibleMultipleLayers =3D true
> > >         maxCombinedImageSamplerDescriptorCount =3D 3
> > >         fragmentShadingRateClampCombinerInputs =3D false
> > >
> > > VkPhysicalDeviceMeshShaderPropertiesEXT:
> > > ----------------------------------------
> > >         maxTaskWorkGroupTotalCount            =3D 4194304
> > >         maxTaskWorkGroupCount: count =3D 3
> > >                 65536
> > >                 65536
> > >                 65536
> > >         maxTaskWorkGroupInvocations           =3D 1024
> > >         maxTaskWorkGroupSize: count =3D 3
> > >                 1024
> > >                 1024
> > >                 1024
> > >         maxTaskPayloadSize                    =3D 16384
> > >         maxTaskSharedMemorySize               =3D 32768
> > >         maxTaskPayloadAndSharedMemorySize     =3D 32768
> > >         maxMeshWorkGroupTotalCount            =3D 4194304
> > >         maxMeshWorkGroupCount: count =3D 3
> > >                 65536
> > >                 65536
> > >                 65536
> > >         maxMeshWorkGroupInvocations           =3D 1024
> > >         maxMeshWorkGroupSize: count =3D 3
> > >                 1024
> > >                 1024
> > >                 1024
> > >         maxMeshSharedMemorySize               =3D 28672
> > >         maxMeshPayloadAndSharedMemorySize     =3D 45056
> > >         maxMeshOutputMemorySize               =3D 32768
> > >         maxMeshPayloadAndOutputMemorySize     =3D 49152
> > >         maxMeshOutputComponents               =3D 128
> > >         maxMeshOutputVertices                 =3D 256
> > >         maxMeshOutputPrimitives               =3D 256
> > >         maxMeshOutputLayers                   =3D 8
> > >         maxMeshMultiviewViewCount             =3D 0
> > >         meshOutputPerVertexGranularity        =3D 1
> > >         meshOutputPerPrimitiveGranularity     =3D 1
> > >         maxPreferredTaskWorkGroupInvocations  =3D 64
> > >         maxPreferredMeshWorkGroupInvocations  =3D 128
> > >         prefersLocalInvocationVertexOutput    =3D true
> > >         prefersLocalInvocationPrimitiveOutput =3D true
> > >         prefersCompactVertexOutput            =3D true
> > >         prefersCompactPrimitiveOutput         =3D false
> > >
> > > VkPhysicalDeviceMultiDrawPropertiesEXT:
> > > ---------------------------------------
> > >         maxMultiDrawCount =3D 2048
> > >
> > > VkPhysicalDeviceNestedCommandBufferPropertiesEXT:
> > > -------------------------------------------------
> > >         maxCommandBufferNestingLevel =3D 4294967295
> > >
> > > VkPhysicalDeviceProvokingVertexPropertiesEXT:
> > > ---------------------------------------------
> > >         provokingVertexModePerPipeline                       =3D true
> > >         transformFeedbackPreservesTriangleFanProvokingVertex =3D true
> > >
> > > VkPhysicalDevicePushDescriptorPropertiesKHR:
> > > --------------------------------------------
> > >         maxPushDescriptors =3D 32
> > >
> > > VkPhysicalDeviceRobustness2PropertiesEXT:
> > > -----------------------------------------
> > >         robustStorageBufferAccessSizeAlignment =3D 0x00000001
> > >         robustUniformBufferAccessSizeAlignment =3D 0x00000001
> > >
> > > VkPhysicalDeviceShaderObjectPropertiesEXT:
> > > ------------------------------------------
> > >         shaderBinaryUUID     =3D 32342e30-2e38-2d31-2b70-316161616161
> > >         shaderBinaryVersion  =3D 1
> > >
> > > VkPhysicalDeviceTransformFeedbackPropertiesEXT:
> > > -----------------------------------------------
> > >         maxTransformFeedbackStreams                =3D 4
> > >         maxTransformFeedbackBuffers                =3D 4
> > >         maxTransformFeedbackBufferSize             =3D 0xffffffff
> > >         maxTransformFeedbackStreamDataSize         =3D 512
> > >         maxTransformFeedbackBufferDataSize         =3D 512
> > >         maxTransformFeedbackBufferDataStride       =3D 512
> > >         transformFeedbackQueries                   =3D true
> > >         transformFeedbackStreamsLinesTriangles     =3D false
> > >         transformFeedbackRasterizationStreamSelect =3D false
> > >         transformFeedbackDraw                      =3D true
> > >
> > > VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT:
> > > ----------------------------------------------------
> > >         maxVertexAttribDivisor =3D 4294967295
> > >
> > > VkPhysicalDeviceVulkan11Properties:
> > > -----------------------------------
> > >         deviceUUID                        =3D 6d657361-3234-2e30-2e38=
-2d312b703100
> > >         driverUUID                        =3D 6c6c766d-7069-7065-5555=
-494400000000
> > >         deviceNodeMask                    =3D 0
> > >         deviceLUIDValid                   =3D false
> > >         subgroupSize                      =3D 4
> > >         subgroupSupportedStages: count =3D 4
> > >                 SHADER_STAGE_FRAGMENT_BIT
> > >                 SHADER_STAGE_COMPUTE_BIT
> > >                 SHADER_STAGE_TASK_BIT_EXT
> > >                 SHADER_STAGE_MESH_BIT_EXT
> > >         subgroupSupportedOperations: count =3D 7
> > >                 SUBGROUP_FEATURE_BASIC_BIT
> > >                 SUBGROUP_FEATURE_VOTE_BIT
> > >                 SUBGROUP_FEATURE_ARITHMETIC_BIT
> > >                 SUBGROUP_FEATURE_BALLOT_BIT
> > >                 SUBGROUP_FEATURE_SHUFFLE_BIT
> > >                 SUBGROUP_FEATURE_SHUFFLE_RELATIVE_BIT
> > >                 SUBGROUP_FEATURE_QUAD_BIT
> > >         subgroupQuadOperationsInAllStages =3D false
> > >         pointClippingBehavior             =3D POINT_CLIPPING_BEHAVIOR=
_ALL_CLIP_PLANES
> > >         maxMultiviewViewCount             =3D 6
> > >         maxMultiviewInstanceIndex         =3D 2147483647
> > >         protectedNoFault                  =3D false
> > >         maxPerSetDescriptors              =3D 1000000
> > >         maxMemoryAllocationSize           =3D 0x80000000
> > >
> > > VkPhysicalDeviceVulkan12Properties:
> > > -----------------------------------
> > >         driverID                                             =3D DRIV=
ER_ID_MESA_LLVMPIPE
> > >         driverName                                           =3D llvm=
pipe
> > >         driverInfo                                           =3D Mesa=
 24.0.8-1+p1 (LLVM 17.0.6)
> > >         conformanceVersion:
> > >                 major    =3D 1
> > >                 minor    =3D 3
> > >                 subminor =3D 1
> > >                 patch    =3D 1
> > >         denormBehaviorIndependence                           =3D SHAD=
ER_FLOAT_CONTROLS_INDEPENDENCE_ALL
> > >         roundingModeIndependence                             =3D SHAD=
ER_FLOAT_CONTROLS_INDEPENDENCE_ALL
> > >         shaderSignedZeroInfNanPreserveFloat16                =3D true
> > >         shaderSignedZeroInfNanPreserveFloat32                =3D true
> > >         shaderSignedZeroInfNanPreserveFloat64                =3D true
> > >         shaderDenormPreserveFloat16                          =3D fals=
e
> > >         shaderDenormPreserveFloat32                          =3D fals=
e
> > >         shaderDenormPreserveFloat64                          =3D fals=
e
> > >         shaderDenormFlushToZeroFloat16                       =3D fals=
e
> > >         shaderDenormFlushToZeroFloat32                       =3D fals=
e
> > >         shaderDenormFlushToZeroFloat64                       =3D fals=
e
> > >         shaderRoundingModeRTEFloat16                         =3D true
> > >         shaderRoundingModeRTEFloat32                         =3D true
> > >         shaderRoundingModeRTEFloat64                         =3D true
> > >         shaderRoundingModeRTZFloat16                         =3D fals=
e
> > >         shaderRoundingModeRTZFloat32                         =3D fals=
e
> > >         shaderRoundingModeRTZFloat64                         =3D fals=
e
> > >         maxUpdateAfterBindDescriptorsInAllPools              =3D 4294=
967295
> > >         shaderUniformBufferArrayNonUniformIndexingNative     =3D true
> > >         shaderSampledImageArrayNonUniformIndexingNative      =3D true
> > >         shaderStorageBufferArrayNonUniformIndexingNative     =3D true
> > >         shaderStorageImageArrayNonUniformIndexingNative      =3D true
> > >         shaderInputAttachmentArrayNonUniformIndexingNative   =3D true
> > >         robustBufferAccessUpdateAfterBind                    =3D true
> > >         quadDivergentImplicitLod                             =3D true
> > >         maxPerStageDescriptorUpdateAfterBindSamplers         =3D 1000=
000
> > >         maxPerStageDescriptorUpdateAfterBindUniformBuffers   =3D 1000=
000
> > >         maxPerStageDescriptorUpdateAfterBindStorageBuffers   =3D 1000=
000
> > >         maxPerStageDescriptorUpdateAfterBindSampledImages    =3D 1000=
000
> > >         maxPerStageDescriptorUpdateAfterBindStorageImages    =3D 1000=
000
> > >         maxPerStageDescriptorUpdateAfterBindInputAttachments =3D 1000=
000
> > >         maxPerStageUpdateAfterBindResources                  =3D 1000=
000
> > >         maxDescriptorSetUpdateAfterBindSamplers              =3D 1000=
000
> > >         maxDescriptorSetUpdateAfterBindUniformBuffers        =3D 1000=
000
> > >         maxDescriptorSetUpdateAfterBindUniformBuffersDynamic =3D 1000=
000
> > >         maxDescriptorSetUpdateAfterBindStorageBuffers        =3D 1000=
000
> > >         maxDescriptorSetUpdateAfterBindStorageBuffersDynamic =3D 1000=
000
> > >         maxDescriptorSetUpdateAfterBindSampledImages         =3D 1000=
000
> > >         maxDescriptorSetUpdateAfterBindStorageImages         =3D 1000=
000
> > >         maxDescriptorSetUpdateAfterBindInputAttachments      =3D 1000=
000
> > >         supportedDepthResolveModes: count =3D 2
> > >                 RESOLVE_MODE_SAMPLE_ZERO_BIT
> > >                 RESOLVE_MODE_AVERAGE_BIT
> > >         supportedStencilResolveModes: count =3D 1
> > >                 RESOLVE_MODE_SAMPLE_ZERO_BIT
> > >         independentResolveNone                               =3D fals=
e
> > >         independentResolve                                   =3D fals=
e
> > >         filterMinmaxSingleComponentFormats                   =3D true
> > >         filterMinmaxImageComponentMapping                    =3D true
> > >         maxTimelineSemaphoreValueDifference                  =3D 1844=
6744073709551615
> > >         framebufferIntegerColorSampleCounts: count =3D 1
> > >                 SAMPLE_COUNT_1_BIT
> > >
> > > VkPhysicalDeviceVulkan13Properties:
> > > -----------------------------------
> > >         minSubgroupSize                                              =
                 =3D 4
> > >         maxSubgroupSize                                              =
                 =3D 4
> > >         maxComputeWorkgroupSubgroups                                 =
                 =3D 32
> > >         requiredSubgroupSizeStages: count =3D 2
> > >                 SHADER_STAGE_FRAGMENT_BIT
> > >                 SHADER_STAGE_COMPUTE_BIT
> > >         maxInlineUniformBlockSize                                    =
                 =3D 4096
> > >         maxPerStageDescriptorInlineUniformBlocks                     =
                 =3D 8
> > >         maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks      =
                 =3D 8
> > >         maxDescriptorSetInlineUniformBlocks                          =
                 =3D 8
> > >         maxDescriptorSetUpdateAfterBindInlineUniformBlocks           =
                 =3D 8
> > >         maxInlineUniformTotalSize                                    =
                 =3D 262144
> > >         integerDotProduct8BitUnsignedAccelerated                     =
                 =3D false
> > >         integerDotProduct8BitSignedAccelerated                       =
                 =3D false
> > >         integerDotProduct8BitMixedSignednessAccelerated              =
                 =3D false
> > >         integerDotProduct4x8BitPackedUnsignedAccelerated             =
                 =3D false
> > >         integerDotProduct4x8BitPackedSignedAccelerated               =
                 =3D false
> > >         integerDotProduct4x8BitPackedMixedSignednessAccelerated      =
                 =3D false
> > >         integerDotProduct16BitUnsignedAccelerated                    =
                 =3D false
> > >         integerDotProduct16BitSignedAccelerated                      =
                 =3D false
> > >         integerDotProduct16BitMixedSignednessAccelerated             =
                 =3D false
> > >         integerDotProduct32BitUnsignedAccelerated                    =
                 =3D false
> > >         integerDotProduct32BitSignedAccelerated                      =
                 =3D false
> > >         integerDotProduct32BitMixedSignednessAccelerated             =
                 =3D false
> > >         integerDotProduct64BitUnsignedAccelerated                    =
                 =3D false
> > >         integerDotProduct64BitSignedAccelerated                      =
                 =3D false
> > >         integerDotProduct64BitMixedSignednessAccelerated             =
                 =3D false
> > >         integerDotProductAccumulatingSaturating8BitUnsignedAccelerate=
d                =3D false
> > >         integerDotProductAccumulatingSaturating8BitSignedAccelerated =
                 =3D false
> > >         integerDotProductAccumulatingSaturating8BitMixedSignednessAcc=
elerated         =3D false
> > >         integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAc=
celerated        =3D false
> > >         integerDotProductAccumulatingSaturating4x8BitPackedSignedAcce=
lerated          =3D false
> > >         integerDotProductAccumulatingSaturating4x8BitPackedMixedSigne=
dnessAccelerated =3D false
> > >         integerDotProductAccumulatingSaturating16BitUnsignedAccelerat=
ed               =3D false
> > >         integerDotProductAccumulatingSaturating16BitSignedAccelerated=
                 =3D false
> > >         integerDotProductAccumulatingSaturating16BitMixedSignednessAc=
celerated        =3D false
> > >         integerDotProductAccumulatingSaturating32BitUnsignedAccelerat=
ed               =3D false
> > >         integerDotProductAccumulatingSaturating32BitSignedAccelerated=
                 =3D false
> > >         integerDotProductAccumulatingSaturating32BitMixedSignednessAc=
celerated        =3D false
> > >         integerDotProductAccumulatingSaturating64BitUnsignedAccelerat=
ed               =3D false
> > >         integerDotProductAccumulatingSaturating64BitSignedAccelerated=
                 =3D false
> > >         integerDotProductAccumulatingSaturating64BitMixedSignednessAc=
celerated        =3D false
> > >         storageTexelBufferOffsetAlignmentBytes                       =
                 =3D 0x00000010
> > >         storageTexelBufferOffsetSingleTexelAlignment                 =
                 =3D true
> > >         uniformTexelBufferOffsetAlignmentBytes                       =
                 =3D 0x00000010
> > >         uniformTexelBufferOffsetSingleTexelAlignment                 =
                 =3D true
> > >         maxBufferSize                                                =
                 =3D 0xffffffff
> > >
> > > VkPhysicalDeviceHostImageCopyPropertiesEXT:
> > > -------------------------------------------
> > >         copySrcLayoutCount                  =3D 23
> > >         pCopySrcLayouts: count =3D 23
> > >                 IMAGE_LAYOUT_GENERAL
> > >                 IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL
> > >                 IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL
> > >                 IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL
> > >                 IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL
> > >                 IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL
> > >                 IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL
> > >                 IMAGE_LAYOUT_PREINITIALIZED
> > >                 IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIM=
AL
> > >                 IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIM=
AL
> > >                 IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL
> > >                 IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL
> > >                 IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL
> > >                 IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL
> > >                 IMAGE_LAYOUT_READ_ONLY_OPTIMAL
> > >                 IMAGE_LAYOUT_ATTACHMENT_OPTIMAL
> > >                 IMAGE_LAYOUT_PRESENT_SRC_KHR
> > >                 IMAGE_LAYOUT_VIDEO_DECODE_DST_KHR
> > >                 IMAGE_LAYOUT_VIDEO_DECODE_SRC_KHR
> > >                 IMAGE_LAYOUT_VIDEO_DECODE_DPB_KHR
> > >                 IMAGE_LAYOUT_SHARED_PRESENT_KHR
> > >                 IMAGE_LAYOUT_FRAGMENT_DENSITY_MAP_OPTIMAL_EXT
> > >                 IMAGE_LAYOUT_FRAGMENT_SHADING_RATE_ATTACHMENT_OPTIMAL=
_KHR
> > >         copyDstLayoutCount                  =3D 23
> > >         pCopyDstLayouts: count =3D 23
> > >                 IMAGE_LAYOUT_GENERAL
> > >                 IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL
> > >                 IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL
> > >                 IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL
> > >                 IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL
> > >                 IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL
> > >                 IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL
> > >                 IMAGE_LAYOUT_PREINITIALIZED
> > >                 IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIM=
AL
> > >                 IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIM=
AL
> > >                 IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL
> > >                 IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL
> > >                 IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL
> > >                 IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL
> > >                 IMAGE_LAYOUT_READ_ONLY_OPTIMAL
> > >                 IMAGE_LAYOUT_ATTACHMENT_OPTIMAL
> > >                 IMAGE_LAYOUT_PRESENT_SRC_KHR
> > >                 IMAGE_LAYOUT_VIDEO_DECODE_DST_KHR
> > >                 IMAGE_LAYOUT_VIDEO_DECODE_SRC_KHR
> > >                 IMAGE_LAYOUT_VIDEO_DECODE_DPB_KHR
> > >                 IMAGE_LAYOUT_SHARED_PRESENT_KHR
> > >                 IMAGE_LAYOUT_FRAGMENT_DENSITY_MAP_OPTIMAL_EXT
> > >                 IMAGE_LAYOUT_FRAGMENT_SHADING_RATE_ATTACHMENT_OPTIMAL=
_KHR
> > >         optimalTilingLayoutUUID             =3D 32342e30-2e38-2d31-2b=
70-316161616161
> > >         identicalMemoryTypeRequirements     =3D false
> > >
> > > Device Extensions: count =3D 124
> > >         VK_AMDX_shader_enqueue                        : extension rev=
ision 1
> > >         VK_ARM_rasterization_order_attachment_access  : extension rev=
ision 1
> > >         VK_EXT_4444_formats                           : extension rev=
ision 1
> > >         VK_EXT_attachment_feedback_loop_dynamic_state : extension rev=
ision 1
> > >         VK_EXT_attachment_feedback_loop_layout        : extension rev=
ision 2
> > >         VK_EXT_border_color_swizzle                   : extension rev=
ision 1
> > >         VK_EXT_calibrated_timestamps                  : extension rev=
ision 2
> > >         VK_EXT_color_write_enable                     : extension rev=
ision 1
> > >         VK_EXT_conditional_rendering                  : extension rev=
ision 2
> > >         VK_EXT_custom_border_color                    : extension rev=
ision 12
> > >         VK_EXT_depth_clip_control                     : extension rev=
ision 1
> > >         VK_EXT_depth_clip_enable                      : extension rev=
ision 1
> > >         VK_EXT_depth_range_unrestricted               : extension rev=
ision 1
> > >         VK_EXT_descriptor_buffer                      : extension rev=
ision 1
> > >         VK_EXT_descriptor_indexing                    : extension rev=
ision 2
> > >         VK_EXT_dynamic_rendering_unused_attachments   : extension rev=
ision 1
> > >         VK_EXT_extended_dynamic_state                 : extension rev=
ision 1
> > >         VK_EXT_extended_dynamic_state2                : extension rev=
ision 1
> > >         VK_EXT_extended_dynamic_state3                : extension rev=
ision 2
> > >         VK_EXT_external_memory_host                   : extension rev=
ision 1
> > >         VK_EXT_graphics_pipeline_library              : extension rev=
ision 1
> > >         VK_EXT_host_image_copy                        : extension rev=
ision 1
> > >         VK_EXT_host_query_reset                       : extension rev=
ision 1
> > >         VK_EXT_image_2d_view_of_3d                    : extension rev=
ision 1
> > >         VK_EXT_image_robustness                       : extension rev=
ision 1
> > >         VK_EXT_image_sliced_view_of_3d                : extension rev=
ision 1
> > >         VK_EXT_index_type_uint8                       : extension rev=
ision 1
> > >         VK_EXT_inline_uniform_block                   : extension rev=
ision 1
> > >         VK_EXT_line_rasterization                     : extension rev=
ision 1
> > >         VK_EXT_load_store_op_none                     : extension rev=
ision 1
> > >         VK_EXT_memory_budget                          : extension rev=
ision 1
> > >         VK_EXT_memory_priority                        : extension rev=
ision 1
> > >         VK_EXT_mesh_shader                            : extension rev=
ision 1
> > >         VK_EXT_multi_draw                             : extension rev=
ision 1
> > >         VK_EXT_multisampled_render_to_single_sampled  : extension rev=
ision 1
> > >         VK_EXT_mutable_descriptor_type                : extension rev=
ision 1
> > >         VK_EXT_nested_command_buffer                  : extension rev=
ision 1
> > >         VK_EXT_non_seamless_cube_map                  : extension rev=
ision 1
> > >         VK_EXT_pageable_device_local_memory           : extension rev=
ision 1
> > >         VK_EXT_pipeline_creation_cache_control        : extension rev=
ision 3
> > >         VK_EXT_pipeline_creation_feedback             : extension rev=
ision 1
> > >         VK_EXT_post_depth_coverage                    : extension rev=
ision 1
> > >         VK_EXT_primitive_topology_list_restart        : extension rev=
ision 1
> > >         VK_EXT_primitives_generated_query             : extension rev=
ision 1
> > >         VK_EXT_private_data                           : extension rev=
ision 1
> > >         VK_EXT_provoking_vertex                       : extension rev=
ision 1
> > >         VK_EXT_rasterization_order_attachment_access  : extension rev=
ision 1
> > >         VK_EXT_robustness2                            : extension rev=
ision 1
> > >         VK_EXT_sampler_filter_minmax                  : extension rev=
ision 2
> > >         VK_EXT_scalar_block_layout                    : extension rev=
ision 1
> > >         VK_EXT_separate_stencil_usage                 : extension rev=
ision 1
> > >         VK_EXT_shader_atomic_float                    : extension rev=
ision 1
> > >         VK_EXT_shader_atomic_float2                   : extension rev=
ision 1
> > >         VK_EXT_shader_demote_to_helper_invocation     : extension rev=
ision 1
> > >         VK_EXT_shader_object                          : extension rev=
ision 1
> > >         VK_EXT_shader_stencil_export                  : extension rev=
ision 1
> > >         VK_EXT_shader_subgroup_ballot                 : extension rev=
ision 1
> > >         VK_EXT_shader_subgroup_vote                   : extension rev=
ision 1
> > >         VK_EXT_shader_viewport_index_layer            : extension rev=
ision 1
> > >         VK_EXT_subgroup_size_control                  : extension rev=
ision 2
> > >         VK_EXT_texel_buffer_alignment                 : extension rev=
ision 1
> > >         VK_EXT_transform_feedback                     : extension rev=
ision 1
> > >         VK_EXT_vertex_attribute_divisor               : extension rev=
ision 3
> > >         VK_EXT_vertex_input_dynamic_state             : extension rev=
ision 2
> > >         VK_EXT_ycbcr_2plane_444_formats               : extension rev=
ision 1
> > >         VK_EXT_ycbcr_image_arrays                     : extension rev=
ision 1
> > >         VK_GOOGLE_decorate_string                     : extension rev=
ision 1
> > >         VK_GOOGLE_hlsl_functionality1                 : extension rev=
ision 1
> > >         VK_KHR_16bit_storage                          : extension rev=
ision 1
> > >         VK_KHR_8bit_storage                           : extension rev=
ision 1
> > >         VK_KHR_bind_memory2                           : extension rev=
ision 1
> > >         VK_KHR_buffer_device_address                  : extension rev=
ision 1
> > >         VK_KHR_copy_commands2                         : extension rev=
ision 1
> > >         VK_KHR_create_renderpass2                     : extension rev=
ision 1
> > >         VK_KHR_dedicated_allocation                   : extension rev=
ision 3
> > >         VK_KHR_depth_stencil_resolve                  : extension rev=
ision 1
> > >         VK_KHR_descriptor_update_template             : extension rev=
ision 1
> > >         VK_KHR_device_group                           : extension rev=
ision 4
> > >         VK_KHR_draw_indirect_count                    : extension rev=
ision 1
> > >         VK_KHR_driver_properties                      : extension rev=
ision 1
> > >         VK_KHR_dynamic_rendering                      : extension rev=
ision 1
> > >         VK_KHR_external_fence                         : extension rev=
ision 1
> > >         VK_KHR_external_memory                        : extension rev=
ision 1
> > >         VK_KHR_external_memory_fd                     : extension rev=
ision 1
> > >         VK_KHR_external_semaphore                     : extension rev=
ision 1
> > >         VK_KHR_format_feature_flags2                  : extension rev=
ision 2
> > >         VK_KHR_get_memory_requirements2               : extension rev=
ision 1
> > >         VK_KHR_image_format_list                      : extension rev=
ision 1
> > >         VK_KHR_imageless_framebuffer                  : extension rev=
ision 1
> > >         VK_KHR_incremental_present                    : extension rev=
ision 2
> > >         VK_KHR_maintenance1                           : extension rev=
ision 2
> > >         VK_KHR_maintenance2                           : extension rev=
ision 1
> > >         VK_KHR_maintenance3                           : extension rev=
ision 1
> > >         VK_KHR_maintenance4                           : extension rev=
ision 2
> > >         VK_KHR_maintenance5                           : extension rev=
ision 1
> > >         VK_KHR_maintenance6                           : extension rev=
ision 1
> > >         VK_KHR_map_memory2                            : extension rev=
ision 1
> > >         VK_KHR_multiview                              : extension rev=
ision 1
> > >         VK_KHR_pipeline_library                       : extension rev=
ision 1
> > >         VK_KHR_push_descriptor                        : extension rev=
ision 2
> > >         VK_KHR_relaxed_block_layout                   : extension rev=
ision 1
> > >         VK_KHR_sampler_mirror_clamp_to_edge           : extension rev=
ision 3
> > >         VK_KHR_sampler_ycbcr_conversion               : extension rev=
ision 14
> > >         VK_KHR_separate_depth_stencil_layouts         : extension rev=
ision 1
> > >         VK_KHR_shader_atomic_int64                    : extension rev=
ision 1
> > >         VK_KHR_shader_clock                           : extension rev=
ision 1
> > >         VK_KHR_shader_draw_parameters                 : extension rev=
ision 1
> > >         VK_KHR_shader_float16_int8                    : extension rev=
ision 1
> > >         VK_KHR_shader_float_controls                  : extension rev=
ision 4
> > >         VK_KHR_shader_integer_dot_product             : extension rev=
ision 1
> > >         VK_KHR_shader_non_semantic_info               : extension rev=
ision 1
> > >         VK_KHR_shader_subgroup_extended_types         : extension rev=
ision 1
> > >         VK_KHR_shader_terminate_invocation            : extension rev=
ision 1
> > >         VK_KHR_spirv_1_4                              : extension rev=
ision 1
> > >         VK_KHR_storage_buffer_storage_class           : extension rev=
ision 1
> > >         VK_KHR_swapchain                              : extension rev=
ision 70
> > >         VK_KHR_swapchain_mutable_format               : extension rev=
ision 1
> > >         VK_KHR_synchronization2                       : extension rev=
ision 1
> > >         VK_KHR_timeline_semaphore                     : extension rev=
ision 2
> > >         VK_KHR_uniform_buffer_standard_layout         : extension rev=
ision 1
> > >         VK_KHR_variable_pointers                      : extension rev=
ision 1
> > >         VK_KHR_vulkan_memory_model                    : extension rev=
ision 3
> > >         VK_KHR_zero_initialize_workgroup_memory       : extension rev=
ision 1
> > >         VK_NV_device_generated_commands               : extension rev=
ision 3
> > >
> > > VkQueueFamilyProperties:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > >         queueProperties[0]:
> > >         -------------------
> > >                 minImageTransferGranularity =3D (1,1,1)
> > >                 queueCount                  =3D 1
> > >                 queueFlags                  =3D QUEUE_GRAPHICS_BIT | =
QUEUE_COMPUTE_BIT | QUEUE_TRANSFER_BIT
> > >                 timestampValidBits          =3D 64
> > >                 present support             =3D false
> > >
> > > VkPhysicalDeviceMemoryProperties:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > memoryHeaps: count =3D 1
> > >         memoryHeaps[0]:
> > >                 size   =3D 3505938432 (0xd0f86000) (3.27 GiB)
> > >                 budget =3D 3505938432 (0xd0f86000) (3.27 GiB)
> > >                 usage  =3D 522092544 (0x1f1e8000) (497.91 MiB)
> > >                 flags: count =3D 1
> > >                         MEMORY_HEAP_DEVICE_LOCAL_BIT
> > > memoryTypes: count =3D 1
> > >         memoryTypes[0]:
> > >                 heapIndex     =3D 0
> > >                 propertyFlags =3D 0x000f: count =3D 4
> > >                         MEMORY_PROPERTY_DEVICE_LOCAL_BIT
> > >                         MEMORY_PROPERTY_HOST_VISIBLE_BIT
> > >                         MEMORY_PROPERTY_HOST_COHERENT_BIT
> > >                         MEMORY_PROPERTY_HOST_CACHED_BIT
> > >                 usable for:
> > >                         IMAGE_TILING_OPTIMAL:
> > >                                 color images
> > >                                 FORMAT_D16_UNORM
> > >                                 FORMAT_X8_D24_UNORM_PACK32
> > >                                 FORMAT_D32_SFLOAT
> > >                                 FORMAT_S8_UINT
> > >                                 FORMAT_D24_UNORM_S8_UINT
> > >                                 FORMAT_D32_SFLOAT_S8_UINT
> > >                                 (non-sparse)
> > >                         IMAGE_TILING_LINEAR:
> > >                                 color images
> > >                                 (non-sparse)
> > >
> > > VkPhysicalDeviceFeatures:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > >         robustBufferAccess                      =3D true
> > >         fullDrawIndexUint32                     =3D true
> > >         imageCubeArray                          =3D true
> > >         independentBlend                        =3D true
> > >         geometryShader                          =3D true
> > >         tessellationShader                      =3D true
> > >         sampleRateShading                       =3D true
> > >         dualSrcBlend                            =3D true
> > >         logicOp                                 =3D true
> > >         multiDrawIndirect                       =3D true
> > >         drawIndirectFirstInstance               =3D true
> > >         depthClamp                              =3D true
> > >         depthBiasClamp                          =3D true
> > >         fillModeNonSolid                        =3D true
> > >         depthBounds                             =3D false
> > >         wideLines                               =3D true
> > >         largePoints                             =3D true
> > >         alphaToOne                              =3D true
> > >         multiViewport                           =3D true
> > >         samplerAnisotropy                       =3D true
> > >         textureCompressionETC2                  =3D false
> > >         textureCompressionASTC_LDR              =3D false
> > >         textureCompressionBC                    =3D true
> > >         occlusionQueryPrecise                   =3D true
> > >         pipelineStatisticsQuery                 =3D true
> > >         vertexPipelineStoresAndAtomics          =3D true
> > >         fragmentStoresAndAtomics                =3D true
> > >         shaderTessellationAndGeometryPointSize  =3D true
> > >         shaderImageGatherExtended               =3D true
> > >         shaderStorageImageExtendedFormats       =3D true
> > >         shaderStorageImageMultisample           =3D true
> > >         shaderStorageImageReadWithoutFormat     =3D true
> > >         shaderStorageImageWriteWithoutFormat    =3D true
> > >         shaderUniformBufferArrayDynamicIndexing =3D true
> > >         shaderSampledImageArrayDynamicIndexing  =3D true
> > >         shaderStorageBufferArrayDynamicIndexing =3D true
> > >         shaderStorageImageArrayDynamicIndexing  =3D true
> > >         shaderClipDistance                      =3D true
> > >         shaderCullDistance                      =3D true
> > >         shaderFloat64                           =3D true
> > >         shaderInt64                             =3D true
> > >         shaderInt16                             =3D true
> > >         shaderResourceResidency                 =3D false
> > >         shaderResourceMinLod                    =3D false
> > >         sparseBinding                           =3D false
> > >         sparseResidencyBuffer                   =3D false
> > >         sparseResidencyImage2D                  =3D false
> > >         sparseResidencyImage3D                  =3D false
> > >         sparseResidency2Samples                 =3D false
> > >         sparseResidency4Samples                 =3D false
> > >         sparseResidency8Samples                 =3D false
> > >         sparseResidency16Samples                =3D false
> > >         sparseResidencyAliased                  =3D false
> > >         variableMultisampleRate                 =3D false
> > >         inheritedQueries                        =3D false
> > >
> > > VkPhysicalDevice4444FormatsFeaturesEXT:
> > > ---------------------------------------
> > >         formatA4R4G4B4 =3D true
> > >         formatA4B4G4R4 =3D true
> > >
> > > VkPhysicalDeviceAttachmentFeedbackLoopDynamicStateFeaturesEXT:
> > > --------------------------------------------------------------
> > >         attachmentFeedbackLoopDynamicState =3D true
> > >
> > > VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT:
> > > --------------------------------------------------------
> > >         attachmentFeedbackLoopLayout =3D true
> > >
> > > VkPhysicalDeviceBorderColorSwizzleFeaturesEXT:
> > > ----------------------------------------------
> > >         borderColorSwizzle          =3D true
> > >         borderColorSwizzleFromImage =3D true
> > >
> > > VkPhysicalDeviceColorWriteEnableFeaturesEXT:
> > > --------------------------------------------
> > >         colorWriteEnable =3D true
> > >
> > > VkPhysicalDeviceConditionalRenderingFeaturesEXT:
> > > ------------------------------------------------
> > >         conditionalRendering          =3D true
> > >         inheritedConditionalRendering =3D false
> > >
> > > VkPhysicalDeviceCustomBorderColorFeaturesEXT:
> > > ---------------------------------------------
> > >         customBorderColors             =3D true
> > >         customBorderColorWithoutFormat =3D true
> > >
> > > VkPhysicalDeviceDepthClipControlFeaturesEXT:
> > > --------------------------------------------
> > >         depthClipControl =3D true
> > >
> > > VkPhysicalDeviceDepthClipEnableFeaturesEXT:
> > > -------------------------------------------
> > >         depthClipEnable =3D true
> > >
> > > VkPhysicalDeviceDescriptorBufferFeaturesEXT:
> > > --------------------------------------------
> > >         descriptorBuffer                   =3D true
> > >         descriptorBufferCaptureReplay      =3D false
> > >         descriptorBufferImageLayoutIgnored =3D true
> > >         descriptorBufferPushDescriptors    =3D true
> > >
> > > VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT:
> > > -------------------------------------------------------------
> > >         dynamicRenderingUnusedAttachments =3D true
> > >
> > > VkPhysicalDeviceExtendedDynamicState2FeaturesEXT:
> > > -------------------------------------------------
> > >         extendedDynamicState2                   =3D true
> > >         extendedDynamicState2LogicOp            =3D true
> > >         extendedDynamicState2PatchControlPoints =3D true
> > >
> > > VkPhysicalDeviceExtendedDynamicState3FeaturesEXT:
> > > -------------------------------------------------
> > >         extendedDynamicState3TessellationDomainOrigin         =3D tru=
e
> > >         extendedDynamicState3DepthClampEnable                 =3D tru=
e
> > >         extendedDynamicState3PolygonMode                      =3D tru=
e
> > >         extendedDynamicState3RasterizationSamples             =3D tru=
e
> > >         extendedDynamicState3SampleMask                       =3D tru=
e
> > >         extendedDynamicState3AlphaToCoverageEnable            =3D tru=
e
> > >         extendedDynamicState3AlphaToOneEnable                 =3D tru=
e
> > >         extendedDynamicState3LogicOpEnable                    =3D tru=
e
> > >         extendedDynamicState3ColorBlendEnable                 =3D tru=
e
> > >         extendedDynamicState3ColorBlendEquation               =3D tru=
e
> > >         extendedDynamicState3ColorWriteMask                   =3D tru=
e
> > >         extendedDynamicState3RasterizationStream              =3D fal=
se
> > >         extendedDynamicState3ConservativeRasterizationMode    =3D fal=
se
> > >         extendedDynamicState3ExtraPrimitiveOverestimationSize =3D fal=
se
> > >         extendedDynamicState3DepthClipEnable                  =3D tru=
e
> > >         extendedDynamicState3SampleLocationsEnable            =3D fal=
se
> > >         extendedDynamicState3ColorBlendAdvanced               =3D fal=
se
> > >         extendedDynamicState3ProvokingVertexMode              =3D tru=
e
> > >         extendedDynamicState3LineRasterizationMode            =3D tru=
e
> > >         extendedDynamicState3LineStippleEnable                =3D tru=
e
> > >         extendedDynamicState3DepthClipNegativeOneToOne        =3D tru=
e
> > >         extendedDynamicState3ViewportWScalingEnable           =3D fal=
se
> > >         extendedDynamicState3ViewportSwizzle                  =3D fal=
se
> > >         extendedDynamicState3CoverageToColorEnable            =3D fal=
se
> > >         extendedDynamicState3CoverageToColorLocation          =3D fal=
se
> > >         extendedDynamicState3CoverageModulationMode           =3D fal=
se
> > >         extendedDynamicState3CoverageModulationTableEnable    =3D fal=
se
> > >         extendedDynamicState3CoverageModulationTable          =3D fal=
se
> > >         extendedDynamicState3CoverageReductionMode            =3D fal=
se
> > >         extendedDynamicState3RepresentativeFragmentTestEnable =3D fal=
se
> > >         extendedDynamicState3ShadingRateImageEnable           =3D fal=
se
> > >
> > > VkPhysicalDeviceExtendedDynamicStateFeaturesEXT:
> > > ------------------------------------------------
> > >         extendedDynamicState =3D true
> > >
> > > VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT:
> > > ---------------------------------------------------
> > >         graphicsPipelineLibrary =3D true
> > >
> > > VkPhysicalDeviceHostImageCopyFeaturesEXT:
> > > -----------------------------------------
> > >         hostImageCopy =3D true
> > >
> > > VkPhysicalDeviceImage2DViewOf3DFeaturesEXT:
> > > -------------------------------------------
> > >         image2DViewOf3D   =3D true
> > >         sampler2DViewOf3D =3D true
> > >
> > > VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT:
> > > -----------------------------------------------
> > >         imageSlicedViewOf3D =3D true
> > >
> > > VkPhysicalDeviceIndexTypeUint8FeaturesKHR:
> > > ------------------------------------------
> > >         indexTypeUint8 =3D true
> > >
> > > VkPhysicalDeviceLineRasterizationFeaturesKHR:
> > > ---------------------------------------------
> > >         rectangularLines         =3D true
> > >         bresenhamLines           =3D true
> > >         smoothLines              =3D true
> > >         stippledRectangularLines =3D true
> > >         stippledBresenhamLines   =3D true
> > >         stippledSmoothLines      =3D true
> > >
> > > VkPhysicalDeviceMaintenance5FeaturesKHR:
> > > ----------------------------------------
> > >         maintenance5 =3D true
> > >
> > > VkPhysicalDeviceMaintenance6FeaturesKHR:
> > > ----------------------------------------
> > >         maintenance6 =3D true
> > >
> > > VkPhysicalDeviceMemoryPriorityFeaturesEXT:
> > > ------------------------------------------
> > >         memoryPriority =3D true
> > >
> > > VkPhysicalDeviceMeshShaderFeaturesEXT:
> > > --------------------------------------
> > >         taskShader                             =3D true
> > >         meshShader                             =3D true
> > >         multiviewMeshShader                    =3D false
> > >         primitiveFragmentShadingRateMeshShader =3D false
> > >         meshShaderQueries                      =3D true
> > >
> > > VkPhysicalDeviceMultiDrawFeaturesEXT:
> > > -------------------------------------
> > >         multiDraw =3D true
> > >
> > > VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT:
> > > -------------------------------------------------------------
> > >         multisampledRenderToSingleSampled =3D true
> > >
> > > VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT:
> > > -------------------------------------------------
> > >         mutableDescriptorType =3D true
> > >
> > > VkPhysicalDeviceNestedCommandBufferFeaturesEXT:
> > > -----------------------------------------------
> > >         nestedCommandBuffer                =3D true
> > >         nestedCommandBufferRendering       =3D true
> > >         nestedCommandBufferSimultaneousUse =3D true
> > >
> > > VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT:
> > > ----------------------------------------------
> > >         nonSeamlessCubeMap =3D true
> > >
> > > VkPhysicalDevicePageableDeviceLocalMemoryFeaturesEXT:
> > > -----------------------------------------------------
> > >         pageableDeviceLocalMemory =3D true
> > >
> > > VkPhysicalDevicePrimitiveTopologyListRestartFeaturesEXT:
> > > --------------------------------------------------------
> > >         primitiveTopologyListRestart      =3D true
> > >         primitiveTopologyPatchListRestart =3D true
> > >
> > > VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT:
> > > ----------------------------------------------------
> > >         primitivesGeneratedQuery                      =3D true
> > >         primitivesGeneratedQueryWithRasterizerDiscard =3D true
> > >         primitivesGeneratedQueryWithNonZeroStreams    =3D true
> > >
> > > VkPhysicalDeviceProvokingVertexFeaturesEXT:
> > > -------------------------------------------
> > >         provokingVertexLast                       =3D true
> > >         transformFeedbackPreservesProvokingVertex =3D true
> > >
> > > VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT:
> > > --------------------------------------------------------------
> > >         rasterizationOrderColorAttachmentAccess   =3D true
> > >         rasterizationOrderDepthAttachmentAccess   =3D true
> > >         rasterizationOrderStencilAttachmentAccess =3D true
> > >
> > > VkPhysicalDeviceRobustness2FeaturesEXT:
> > > ---------------------------------------
> > >         robustBufferAccess2 =3D true
> > >         robustImageAccess2  =3D true
> > >         nullDescriptor      =3D true
> > >
> > > VkPhysicalDeviceShaderAtomicFloat2FeaturesEXT:
> > > ----------------------------------------------
> > >         shaderBufferFloat16Atomics      =3D false
> > >         shaderBufferFloat16AtomicAdd    =3D false
> > >         shaderBufferFloat16AtomicMinMax =3D false
> > >         shaderBufferFloat32AtomicMinMax =3D true
> > >         shaderBufferFloat64AtomicMinMax =3D false
> > >         shaderSharedFloat16Atomics      =3D false
> > >         shaderSharedFloat16AtomicAdd    =3D false
> > >         shaderSharedFloat16AtomicMinMax =3D false
> > >         shaderSharedFloat32AtomicMinMax =3D true
> > >         shaderSharedFloat64AtomicMinMax =3D false
> > >         shaderImageFloat32AtomicMinMax  =3D true
> > >         sparseImageFloat32AtomicMinMax  =3D false
> > >
> > > VkPhysicalDeviceShaderAtomicFloatFeaturesEXT:
> > > ---------------------------------------------
> > >         shaderBufferFloat32Atomics   =3D true
> > >         shaderBufferFloat32AtomicAdd =3D true
> > >         shaderBufferFloat64Atomics   =3D false
> > >         shaderBufferFloat64AtomicAdd =3D false
> > >         shaderSharedFloat32Atomics   =3D true
> > >         shaderSharedFloat32AtomicAdd =3D true
> > >         shaderSharedFloat64Atomics   =3D false
> > >         shaderSharedFloat64AtomicAdd =3D false
> > >         shaderImageFloat32Atomics    =3D true
> > >         shaderImageFloat32AtomicAdd  =3D true
> > >         sparseImageFloat32Atomics    =3D false
> > >         sparseImageFloat32AtomicAdd  =3D false
> > >
> > > VkPhysicalDeviceShaderClockFeaturesKHR:
> > > ---------------------------------------
> > >         shaderSubgroupClock =3D true
> > >         shaderDeviceClock   =3D true
> > >
> > > VkPhysicalDeviceShaderObjectFeaturesEXT:
> > > ----------------------------------------
> > >         shaderObject =3D true
> > >
> > > VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT:
> > > ------------------------------------------------
> > >         texelBufferAlignment =3D true
> > >
> > > VkPhysicalDeviceTransformFeedbackFeaturesEXT:
> > > ---------------------------------------------
> > >         transformFeedback =3D true
> > >         geometryStreams   =3D true
> > >
> > > VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR:
> > > --------------------------------------------------
> > >         vertexAttributeInstanceRateDivisor     =3D true
> > >         vertexAttributeInstanceRateZeroDivisor =3D true
> > >
> > > VkPhysicalDeviceVertexInputDynamicStateFeaturesEXT:
> > > ---------------------------------------------------
> > >         vertexInputDynamicState =3D true
> > >
> > > VkPhysicalDeviceVulkan11Features:
> > > ---------------------------------
> > >         storageBuffer16BitAccess           =3D true
> > >         uniformAndStorageBuffer16BitAccess =3D true
> > >         storagePushConstant16              =3D true
> > >         storageInputOutput16               =3D false
> > >         multiview                          =3D true
> > >         multiviewGeometryShader            =3D true
> > >         multiviewTessellationShader        =3D true
> > >         variablePointersStorageBuffer      =3D true
> > >         variablePointers                   =3D true
> > >         protectedMemory                    =3D false
> > >         samplerYcbcrConversion             =3D true
> > >         shaderDrawParameters               =3D true
> > >
> > > VkPhysicalDeviceVulkan12Features:
> > > ---------------------------------
> > >         samplerMirrorClampToEdge                           =3D true
> > >         drawIndirectCount                                  =3D true
> > >         storageBuffer8BitAccess                            =3D true
> > >         uniformAndStorageBuffer8BitAccess                  =3D true
> > >         storagePushConstant8                               =3D true
> > >         shaderBufferInt64Atomics                           =3D true
> > >         shaderSharedInt64Atomics                           =3D true
> > >         shaderFloat16                                      =3D true
> > >         shaderInt8                                         =3D true
> > >         descriptorIndexing                                 =3D true
> > >         shaderInputAttachmentArrayDynamicIndexing          =3D true
> > >         shaderUniformTexelBufferArrayDynamicIndexing       =3D true
> > >         shaderStorageTexelBufferArrayDynamicIndexing       =3D true
> > >         shaderUniformBufferArrayNonUniformIndexing         =3D true
> > >         shaderSampledImageArrayNonUniformIndexing          =3D true
> > >         shaderStorageBufferArrayNonUniformIndexing         =3D true
> > >         shaderStorageImageArrayNonUniformIndexing          =3D true
> > >         shaderInputAttachmentArrayNonUniformIndexing       =3D true
> > >         shaderUniformTexelBufferArrayNonUniformIndexing    =3D true
> > >         shaderStorageTexelBufferArrayNonUniformIndexing    =3D true
> > >         descriptorBindingUniformBufferUpdateAfterBind      =3D true
> > >         descriptorBindingSampledImageUpdateAfterBind       =3D true
> > >         descriptorBindingStorageImageUpdateAfterBind       =3D true
> > >         descriptorBindingStorageBufferUpdateAfterBind      =3D true
> > >         descriptorBindingUniformTexelBufferUpdateAfterBind =3D true
> > >         descriptorBindingStorageTexelBufferUpdateAfterBind =3D true
> > >         descriptorBindingUpdateUnusedWhilePending          =3D true
> > >         descriptorBindingPartiallyBound                    =3D true
> > >         descriptorBindingVariableDescriptorCount           =3D true
> > >         runtimeDescriptorArray                             =3D true
> > >         samplerFilterMinmax                                =3D true
> > >         scalarBlockLayout                                  =3D true
> > >         imagelessFramebuffer                               =3D true
> > >         uniformBufferStandardLayout                        =3D true
> > >         shaderSubgroupExtendedTypes                        =3D true
> > >         separateDepthStencilLayouts                        =3D true
> > >         hostQueryReset                                     =3D true
> > >         timelineSemaphore                                  =3D true
> > >         bufferDeviceAddress                                =3D true
> > >         bufferDeviceAddressCaptureReplay                   =3D false
> > >         bufferDeviceAddressMultiDevice                     =3D false
> > >         vulkanMemoryModel                                  =3D true
> > >         vulkanMemoryModelDeviceScope                       =3D true
> > >         vulkanMemoryModelAvailabilityVisibilityChains      =3D true
> > >         shaderOutputViewportIndex                          =3D true
> > >         shaderOutputLayer                                  =3D true
> > >         subgroupBroadcastDynamicId                         =3D true
> > >
> > > VkPhysicalDeviceVulkan13Features:
> > > ---------------------------------
> > >         robustImageAccess                                  =3D true
> > >         inlineUniformBlock                                 =3D true
> > >         descriptorBindingInlineUniformBlockUpdateAfterBind =3D true
> > >         pipelineCreationCacheControl                       =3D true
> > >         privateData                                        =3D true
> > >         shaderDemoteToHelperInvocation                     =3D true
> > >         shaderTerminateInvocation                          =3D true
> > >         subgroupSizeControl                                =3D true
> > >         computeFullSubgroups                               =3D true
> > >         synchronization2                                   =3D true
> > >         textureCompressionASTC_HDR                         =3D false
> > >         shaderZeroInitializeWorkgroupMemory                =3D true
> > >         dynamicRendering                                   =3D true
> > >         shaderIntegerDotProduct                            =3D true
> > >         maintenance4                                       =3D true
> > >
> > > VkPhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT:
> > > -------------------------------------------------
> > >         ycbcr2plane444Formats =3D true
> > >
> > > VkPhysicalDeviceYcbcrImageArraysFeaturesEXT:
> > > --------------------------------------------
> > >         ycbcrImageArrays =3D true
> > >
> > >
> > > --
> > > 2.45.1.288.g0e0cd299f1-goog
> > >

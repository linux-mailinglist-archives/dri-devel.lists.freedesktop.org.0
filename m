Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705E08D5930
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 06:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7209B10E2BF;
	Fri, 31 May 2024 04:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KGbbYvbG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6359810E2BF
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 04:00:46 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2e96f29884dso17449991fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 21:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717128044; x=1717732844;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w+hOAnWHEjKFPeWrwKSC+cB2an1G2dYcTSMR+eM7fFo=;
 b=KGbbYvbGPUyotvLCwkY5LfFziOV3DAmoherAi4vPDMBxMACpxL/MCfyEFqjW9HIm4x
 dyKg8c8TEY8K1tnIhxoqJ+DMQDOPjqQWs/x15mDNf54WF/5EQMz24/mG9QX8YOX0knbr
 O5S2OU/ob1sspLaznmr6LmIlQP6D+Wk7x5uz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717128044; x=1717732844;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w+hOAnWHEjKFPeWrwKSC+cB2an1G2dYcTSMR+eM7fFo=;
 b=bXFXFYI3llG8BPsDUAqvnXDnEF1B5Ff87HVINXZf9Dre6GavVOxMAQ2H/a4IRpUXBV
 dBtwXMGJ48wS6pa4ZoOrMTdAVd/d4L4/kEnw2HBhYDX+/9RX6+R6TLNstLzzx6Nd7Jfh
 qNBrJvGc4k9knuImi42XAE3SL10qESIpft1nLaeIr1z/VipUC0atISj8OttmvlO4sgS3
 oIfeal63qh/0IaNa1lQ+6dcvmoYGi3FW19DZbGbGJPGgsIHafDmITft8pQOTL/6aotqt
 vvVnP+eqigqNQog9qTu4hpUC7yA7nA4vvfhFzUw8W2Zv38tFWrx/yfBehLE0iRBMzfCg
 ZBVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGlrUvmq5fnB693Tg3IlQpdDjamsi+lkbS2v9JscpXUpBEf838OBVX2XmVxeCHCxyzOSVK0LrmWI3fC1DbOuRyNChWe55pdGbId0Yzenmf
X-Gm-Message-State: AOJu0Ywy0gCpnbafRhZs1E8GP9AKSIHYqvv36mBfKYLP/h7F76iiQavd
 XECITLsRgkilzXDPad9WR9LYpiJdm1NWJ/fm0jGyOmdcQGEnrNJ83OckbwMZfENONIhnk70dXZ5
 hpRHlMXoHwfa5p4hfKJoYUUV7m6odZwp47goI
X-Google-Smtp-Source: AGHT+IFQf2JSvhccqSSnSc1LfOZKYoGTyJF8/jMIkcY2ULB3L6VKjptVpdKoltcSqXXxOVWcuYLAA4xtOJ2TooNPS60=
X-Received: by 2002:a19:5e5a:0:b0:52b:7b2c:2a3f with SMTP id
 2adb3069b0e04-52b8980ae9fmr243104e87.61.1717128043607; Thu, 30 May 2024
 21:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org>
In-Reply-To: <20240530083513.4135052-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 31 May 2024 12:00:32 +0800
Message-ID: <CAGXv+5FSDiZQDq21DnqaNVWLEU8JOR++7+BZLdON2Gp5+YyDrw@mail.gmail.com>
Subject: Re: [PATCH 0/6] powervr: MT8173 GPU support
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
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

On Thu, May 30, 2024 at 4:35=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi everyone,
>
> This series enables the PowerVR GPU found in the MT8173 SoC, found in
> some Chromebooks.
>
> This version is different from the initial powervr driver submission [1]
> in that it splits out the GPU glue layer support out of the powervr
> driver and into a separate clock and power domain driver. The glue code
> is otherwise the same, and also the same as found in the ChromeOS
> kernels, with some extra comments and macro names added where possible.
>
> Patch 1 adds a binding for the glue layer, called mfgtop. The glue layer
> contains clock and power controls for the GPU.
>
> Patch 2 adds a driver for the glue layer.
>
> Patch 3 adds an entry for the MT8173 GPU and 6XT series to the PowerVR
> binding.
>
> Patch 4 adds an entry for the PowerVR 6XT series GPU to the driver.
>
> Patch 5 corrects the clock for the GPU (called MFG) power domain.
>
> Patch 6 adds device nodes for the GPU and glue layer to the MT8173 dtsi
> file.
>
> Patch 2 and 6 depend on patch 1 to build. I suppose some common
> immutable tree would be needed from the MediaTek maintainers.
>
> The kernel driver successfully probes the hardware and loads the
> "rogue_4.40.2.51_v1.fw" firmware provided by Imagination Technologies [2]=
.
> Userspace was tested with Mesa 24.0.8 from Debian Trixie rebuilt with
> the powervr vulkan driver enabled. `vulkaninfo` gives some information
> about the GPU (attached at the end), but running the `triangle` example
> from the Sascha Willems demos [3] with -DUSE_D2D_WSI=3DON as recommended =
[4]
> failed with:
>
>     Can't find a display and a display mode!
>
> Same program worked correctly on a BeaglePlay and displayed a color
> gradient triangle. Not sure what went wrong here.

Frank mentioned over IRC that giving `triangle` a screen resolution would
make it work, and it did! Thanks Frank!

OTOH I'm getting some extra warnings not seen on the BeaglePlay:

    MESA: error: No hard coded passthrough rta vertex shader.
Returning empty shader.
    MESA: warning: ../src/imagination/vulkan/pvr_job_context.c:71:
FINISHME: Missing reset support for brn51764
    MESA: warning: ../src/imagination/vulkan/pvr_job_context.c:74:
FINISHME: Missing reset support for brn58839
    MESA: warning: ../src/imagination/vulkan/pvr_border.c:104:
FINISHME: Devices without tpu_border_colour_enhanced require entries
for compressed formats to be stored in the table pre-compressed.

I also get a constant stream of kernel error messages, all the same:

    powervr 13000000.gpu: [drm] Received unknown FWCCB command 2abc0069

And the first few frames seem to flicker. (Though that could also be the
display driver that's at fault.)


For reference, on the BeaglePlay I see:

    MESA: error: No hard coded idfwdf program. Returning empty program.
    MESA: error: No hard coded passthrough vertex shader. Returning
empty shader.
    MESA: warning:
../src/imagination/vulkan/pvr_descriptor_set.c:1073: FINISHME: Entry
tracker for allocations?


Regards
ChenYu


> Anyway, please have a look and test.
>
>
> Thanks
> ChenYu
>
> [1] https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.walke=
r@imgtec.com/
> [2] https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powe=
rvr
> [3] https://github.com/SaschaWillems/Vulkan
> [4] https://lore.kernel.org/dri-devel/f2b2671e-5acc-4dec-9c2e-3c9cd2e1f19=
e@imgtec.com/
>
> Chen-Yu Tsai (6):
>   dt-bindings: clock: mediatek: Add mt8173 mfgtop
>   clk: mediatek: Add mt8173-mfgtop driver
>   dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
>   drm/imagination: Add compatible string entry for Series6XT
>   arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
>   arm64: dts: mediatek: mt8173: Add GPU device nodes
>
>  .../clock/mediatek,mt8173-mfgtop.yaml         |  71 ++++++
>  .../bindings/gpu/img,powervr-rogue.yaml       |  24 +-
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  26 +-
>  drivers/clk/mediatek/Kconfig                  |   9 +
>  drivers/clk/mediatek/Makefile                 |   1 +
>  drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 240 ++++++++++++++++++
>  drivers/gpu/drm/imagination/pvr_drv.c         |   1 +
>  include/dt-bindings/clock/mt8173-clk.h        |   7 +
>  8 files changed, 374 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt81=
73-mfgtop.yaml
>  create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c
>
>
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
>
> Vulkan info output:
>
> WARNING: [Loader Message] Code 0 : terminator_CreateInstance: Received re=
turn code -3 from call to vkCreateInstance in ICD /usr/lib/aarch64-linux-gn=
u/libvulkan_virtio.so. Skipping this driver.
> 'DISPLAY' environment variable not set... skipping surface info
> ERROR: [../src/panfrost/vulkan/panvk_device.c:386] Code 0 : WARNING: panv=
k is not a conformant vulkan implementation, pass PAN_I_WANT_A_BROKEN_VULKA=
N_DRIVER=3D1 if you know what you're doing. (VK_ERROR_INCOMPATIBLE_DRIVER)
> MESA: error: No hard coded idfwdf program. Returning empty program.
> MESA: error: No hard coded passthrough rta vertex shader. Returning empty=
 shader.
> MESA: error: No hard coded passthrough vertex shader. Returning empty sha=
der.
> MESA: warning: ../src/imagination/vulkan/pvr_job_context.c:71: FINISHME: =
Missing reset support for brn51764
> MESA: warning: ../src/imagination/vulkan/pvr_job_context.c:74: FINISHME: =
Missing reset support for brn58839
> MESA: warning: ../src/imagination/vulkan/pvr_border.c:104: FINISHME: Devi=
ces without tpu_border_colour_enhanced require entries for compressed forma=
ts to be stored in the table pre-compressed.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> VULKANINFO
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Vulkan Instance Version: 1.3.280
>
>
> Instance Extensions: count =3D 23
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>         VK_EXT_acquire_drm_display             : extension revision 1
>         VK_EXT_acquire_xlib_display            : extension revision 1
>         VK_EXT_debug_report                    : extension revision 10
>         VK_EXT_debug_utils                     : extension revision 2
>         VK_EXT_direct_mode_display             : extension revision 1
>         VK_EXT_display_surface_counter         : extension revision 1
>         VK_EXT_surface_maintenance1            : extension revision 1
>         VK_EXT_swapchain_colorspace            : extension revision 4
>         VK_KHR_device_group_creation           : extension revision 1
>         VK_KHR_display                         : extension revision 23
>         VK_KHR_external_fence_capabilities     : extension revision 1
>         VK_KHR_external_memory_capabilities    : extension revision 1
>         VK_KHR_external_semaphore_capabilities : extension revision 1
>         VK_KHR_get_display_properties2         : extension revision 1
>         VK_KHR_get_physical_device_properties2 : extension revision 2
>         VK_KHR_get_surface_capabilities2       : extension revision 1
>         VK_KHR_portability_enumeration         : extension revision 1
>         VK_KHR_surface                         : extension revision 25
>         VK_KHR_surface_protected_capabilities  : extension revision 1
>         VK_KHR_wayland_surface                 : extension revision 6
>         VK_KHR_xcb_surface                     : extension revision 6
>         VK_KHR_xlib_surface                    : extension revision 6
>         VK_LUNARG_direct_driver_loading        : extension revision 1
>
> Layers: count =3D 2
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> VK_LAYER_MESA_device_select (Linux device selection layer) Vulkan version=
 1.3.211, layer version 1:
>         Layer Extensions: count =3D 0
>         Devices: count =3D 2
>                 GPU id =3D 0 (Imagination PowerVR Rogue GX6250)
>                 Layer-Device Extensions: count =3D 0
>
>                 GPU id =3D 1 (llvmpipe (LLVM 17.0.6, 128 bits))
>                 Layer-Device Extensions: count =3D 0
>
> VK_LAYER_MESA_overlay (Mesa Overlay layer) Vulkan version 1.3.211, layer =
version 1:
>         Layer Extensions: count =3D 0
>         Devices: count =3D 2
>                 GPU id =3D 0 (Imagination PowerVR Rogue GX6250)
>                 Layer-Device Extensions: count =3D 0
>
>                 GPU id =3D 1 (llvmpipe (LLVM 17.0.6, 128 bits))
>                 Layer-Device Extensions: count =3D 0
>
> Device Properties and Extensions:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> GPU0:
> VkPhysicalDeviceProperties:
> ---------------------------
>         apiVersion        =3D 1.0.274 (4194578)
>         driverVersion     =3D 24.0.8 (100663304)
>         vendorID          =3D 0x1010
>         deviceID          =3D 0x6250
>         deviceType        =3D PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU
>         deviceName        =3D Imagination PowerVR Rogue GX6250
>         pipelineCacheUUID =3D 6ddf30eb-d118-41f1-455f-580ae751c27b
>
> VkPhysicalDeviceLimits:
> -----------------------
>         maxImageDimension1D                             =3D 8192
>         maxImageDimension2D                             =3D 8192
>         maxImageDimension3D                             =3D 2048
>         maxImageDimensionCube                           =3D 8192
>         maxImageArrayLayers                             =3D 2048
>         maxTexelBufferElements                          =3D 65536
>         maxUniformBufferRange                           =3D 134217728
>         maxStorageBufferRange                           =3D 134217728
>         maxPushConstantsSize                            =3D 256
>         maxMemoryAllocationCount                        =3D 4294967295
>         maxSamplerAllocationCount                       =3D 4294967295
>         bufferImageGranularity                          =3D 0x00000001
>         sparseAddressSpaceSize                          =3D 0x4000000000
>         maxBoundDescriptorSets                          =3D 4
>         maxPerStageDescriptorSamplers                   =3D 32
>         maxPerStageDescriptorUniformBuffers             =3D 64
>         maxPerStageDescriptorStorageBuffers             =3D 36
>         maxPerStageDescriptorSampledImages              =3D 48
>         maxPerStageDescriptorStorageImages              =3D 8
>         maxPerStageDescriptorInputAttachments           =3D 8
>         maxPerStageResources                            =3D 224
>         maxDescriptorSetSamplers                        =3D 256
>         maxDescriptorSetUniformBuffers                  =3D 256
>         maxDescriptorSetUniformBuffersDynamic           =3D 8
>         maxDescriptorSetStorageBuffers                  =3D 256
>         maxDescriptorSetStorageBuffersDynamic           =3D 8
>         maxDescriptorSetSampledImages                   =3D 256
>         maxDescriptorSetStorageImages                   =3D 256
>         maxDescriptorSetInputAttachments                =3D 256
>         maxVertexInputAttributes                        =3D 16
>         maxVertexInputBindings                          =3D 16
>         maxVertexInputAttributeOffset                   =3D 65535
>         maxVertexInputBindingStride                     =3D 2147483648
>         maxVertexOutputComponents                       =3D 128
>         maxTessellationGenerationLevel                  =3D 0
>         maxTessellationPatchSize                        =3D 0
>         maxTessellationControlPerVertexInputComponents  =3D 0
>         maxTessellationControlPerVertexOutputComponents =3D 0
>         maxTessellationControlPerPatchOutputComponents  =3D 0
>         maxTessellationControlTotalOutputComponents     =3D 0
>         maxTessellationEvaluationInputComponents        =3D 0
>         maxTessellationEvaluationOutputComponents       =3D 0
>         maxGeometryShaderInvocations                    =3D 0
>         maxGeometryInputComponents                      =3D 0
>         maxGeometryOutputComponents                     =3D 0
>         maxGeometryOutputVertices                       =3D 0
>         maxGeometryTotalOutputComponents                =3D 0
>         maxFragmentInputComponents                      =3D 128
>         maxFragmentOutputAttachments                    =3D 8
>         maxFragmentDualSrcAttachments                   =3D 0
>         maxFragmentCombinedOutputResources              =3D 52
>         maxComputeSharedMemorySize                      =3D 16384
>         maxComputeWorkGroupCount: count =3D 3
>                 65536
>                 65536
>                 65536
>         maxComputeWorkGroupInvocations                  =3D 512
>         maxComputeWorkGroupSize: count =3D 3
>                 512
>                 512
>                 64
>         subPixelPrecisionBits                           =3D 8
>         subTexelPrecisionBits                           =3D 8
>         mipmapPrecisionBits                             =3D 8
>         maxDrawIndexedIndexValue                        =3D 4294967295
>         maxDrawIndirectCount                            =3D 2147483648
>         maxSamplerLodBias                               =3D 16
>         maxSamplerAnisotropy                            =3D 1
>         maxViewports                                    =3D 1
>         maxViewportDimensions: count =3D 2
>                 8192
>                 8192
>         viewportBoundsRange: count =3D 2
>                 -16384
>                 16384
>         viewportSubPixelBits                            =3D 0
>         minMemoryMapAlignment                           =3D 64
>         minTexelBufferOffsetAlignment                   =3D 0x00000010
>         minUniformBufferOffsetAlignment                 =3D 0x00000004
>         minStorageBufferOffsetAlignment                 =3D 0x00000004
>         minTexelOffset                                  =3D -8
>         maxTexelOffset                                  =3D 7
>         minTexelGatherOffset                            =3D -8
>         maxTexelGatherOffset                            =3D 7
>         minInterpolationOffset                          =3D -0.5
>         maxInterpolationOffset                          =3D 0.5
>         subPixelInterpolationOffsetBits                 =3D 4
>         maxFramebufferWidth                             =3D 8192
>         maxFramebufferHeight                            =3D 8192
>         maxFramebufferLayers                            =3D 2048
>         framebufferColorSampleCounts: count =3D 4
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_2_BIT
>                 SAMPLE_COUNT_4_BIT
>                 SAMPLE_COUNT_8_BIT
>         framebufferDepthSampleCounts: count =3D 4
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_2_BIT
>                 SAMPLE_COUNT_4_BIT
>                 SAMPLE_COUNT_8_BIT
>         framebufferStencilSampleCounts: count =3D 4
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_2_BIT
>                 SAMPLE_COUNT_4_BIT
>                 SAMPLE_COUNT_8_BIT
>         framebufferNoAttachmentsSampleCounts: count =3D 4
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_2_BIT
>                 SAMPLE_COUNT_4_BIT
>                 SAMPLE_COUNT_8_BIT
>         maxColorAttachments                             =3D 8
>         sampledImageColorSampleCounts: count =3D 4
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_2_BIT
>                 SAMPLE_COUNT_4_BIT
>                 SAMPLE_COUNT_8_BIT
>         sampledImageIntegerSampleCounts: count =3D 4
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_2_BIT
>                 SAMPLE_COUNT_4_BIT
>                 SAMPLE_COUNT_8_BIT
>         sampledImageDepthSampleCounts: count =3D 4
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_2_BIT
>                 SAMPLE_COUNT_4_BIT
>                 SAMPLE_COUNT_8_BIT
>         sampledImageStencilSampleCounts: count =3D 4
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_2_BIT
>                 SAMPLE_COUNT_4_BIT
>                 SAMPLE_COUNT_8_BIT
>         storageImageSampleCounts: count =3D 4
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_2_BIT
>                 SAMPLE_COUNT_4_BIT
>                 SAMPLE_COUNT_8_BIT
>         maxSampleMaskWords                              =3D 1
>         timestampComputeAndGraphics                     =3D false
>         timestampPeriod                                 =3D 0
>         maxClipDistances                                =3D 8
>         maxCullDistances                                =3D 8
>         maxCombinedClipAndCullDistances                 =3D 8
>         discreteQueuePriorities                         =3D 2
>         pointSizeRange: count =3D 2
>                 1
>                 511
>         lineWidthRange: count =3D 2
>                 0.0625
>                 16
>         pointSizeGranularity                            =3D 0.0625
>         lineWidthGranularity                            =3D 0.0625
>         strictLines                                     =3D false
>         standardSampleLocations                         =3D true
>         optimalBufferCopyOffsetAlignment                =3D 0x00000004
>         optimalBufferCopyRowPitchAlignment              =3D 0x00000004
>         nonCoherentAtomSize                             =3D 0x00000001
>
> VkPhysicalDeviceSparseProperties:
> ---------------------------------
>         residencyStandard2DBlockShape            =3D false
>         residencyStandard2DMultisampleBlockShape =3D false
>         residencyStandard3DBlockShape            =3D false
>         residencyAlignedMipSize                  =3D false
>         residencyNonResidentStrict               =3D false
>
> VkPhysicalDeviceTexelBufferAlignmentPropertiesEXT:
> --------------------------------------------------
>         storageTexelBufferOffsetAlignmentBytes       =3D 0x00000010
>         storageTexelBufferOffsetSingleTexelAlignment =3D true
>         uniformTexelBufferOffsetAlignmentBytes       =3D 0x00000010
>         uniformTexelBufferOffsetSingleTexelAlignment =3D false
>
> VkPhysicalDeviceTimelineSemaphorePropertiesKHR:
> -----------------------------------------------
>         maxTimelineSemaphoreValueDifference =3D 18446744073709551615
>
> Device Extensions: count =3D 20
>         VK_EXT_external_memory_dma_buf        : extension revision 1
>         VK_EXT_host_query_reset               : extension revision 1
>         VK_EXT_private_data                   : extension revision 1
>         VK_EXT_scalar_block_layout            : extension revision 1
>         VK_EXT_texel_buffer_alignment         : extension revision 1
>         VK_EXT_tooling_info                   : extension revision 1
>         VK_KHR_bind_memory2                   : extension revision 1
>         VK_KHR_copy_commands2                 : extension revision 1
>         VK_KHR_external_fence                 : extension revision 1
>         VK_KHR_external_fence_fd              : extension revision 1
>         VK_KHR_external_memory                : extension revision 1
>         VK_KHR_external_memory_fd             : extension revision 1
>         VK_KHR_external_semaphore             : extension revision 1
>         VK_KHR_external_semaphore_fd          : extension revision 1
>         VK_KHR_format_feature_flags2          : extension revision 2
>         VK_KHR_get_memory_requirements2       : extension revision 1
>         VK_KHR_image_format_list              : extension revision 1
>         VK_KHR_swapchain                      : extension revision 70
>         VK_KHR_timeline_semaphore             : extension revision 2
>         VK_KHR_uniform_buffer_standard_layout : extension revision 1
>
> VkQueueFamilyProperties:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         queueProperties[0]:
>         -------------------
>                 minImageTransferGranularity =3D (1,1,1)
>                 queueCount                  =3D 2
>                 queueFlags                  =3D QUEUE_GRAPHICS_BIT | QUEU=
E_COMPUTE_BIT | QUEUE_TRANSFER_BIT
>                 timestampValidBits          =3D 0
>                 present support             =3D false
>
> VkPhysicalDeviceMemoryProperties:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> memoryHeaps: count =3D 1
>         memoryHeaps[0]:
>                 size   =3D 1752969216 (0x687c3000) (1.63 GiB)
>                 flags: count =3D 1
>                         MEMORY_HEAP_DEVICE_LOCAL_BIT
> memoryTypes: count =3D 1
>         memoryTypes[0]:
>                 heapIndex     =3D 0
>                 propertyFlags =3D 0x0007: count =3D 3
>                         MEMORY_PROPERTY_DEVICE_LOCAL_BIT
>                         MEMORY_PROPERTY_HOST_VISIBLE_BIT
>                         MEMORY_PROPERTY_HOST_COHERENT_BIT
>                 usable for:
>                         IMAGE_TILING_OPTIMAL:
>                                 color images
>                                 FORMAT_D16_UNORM
>                                 FORMAT_D32_SFLOAT
>                                 FORMAT_S8_UINT
>                                 FORMAT_D24_UNORM_S8_UINT
>                                 (non-sparse)
>                         IMAGE_TILING_LINEAR:
>                                 color images
>                                 (non-sparse)
>
> VkPhysicalDeviceFeatures:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>         robustBufferAccess                      =3D true
>         fullDrawIndexUint32                     =3D true
>         imageCubeArray                          =3D true
>         independentBlend                        =3D false
>         geometryShader                          =3D false
>         tessellationShader                      =3D false
>         sampleRateShading                       =3D true
>         dualSrcBlend                            =3D false
>         logicOp                                 =3D false
>         multiDrawIndirect                       =3D true
>         drawIndirectFirstInstance               =3D true
>         depthClamp                              =3D true
>         depthBiasClamp                          =3D true
>         fillModeNonSolid                        =3D false
>         depthBounds                             =3D false
>         wideLines                               =3D true
>         largePoints                             =3D true
>         alphaToOne                              =3D false
>         multiViewport                           =3D false
>         samplerAnisotropy                       =3D false
>         textureCompressionETC2                  =3D true
>         textureCompressionASTC_LDR              =3D false
>         textureCompressionBC                    =3D false
>         occlusionQueryPrecise                   =3D false
>         pipelineStatisticsQuery                 =3D false
>         vertexPipelineStoresAndAtomics          =3D true
>         fragmentStoresAndAtomics                =3D true
>         shaderTessellationAndGeometryPointSize  =3D false
>         shaderImageGatherExtended               =3D false
>         shaderStorageImageExtendedFormats       =3D true
>         shaderStorageImageMultisample           =3D false
>         shaderStorageImageReadWithoutFormat     =3D true
>         shaderStorageImageWriteWithoutFormat    =3D false
>         shaderUniformBufferArrayDynamicIndexing =3D true
>         shaderSampledImageArrayDynamicIndexing  =3D true
>         shaderStorageBufferArrayDynamicIndexing =3D true
>         shaderStorageImageArrayDynamicIndexing  =3D true
>         shaderClipDistance                      =3D false
>         shaderCullDistance                      =3D false
>         shaderFloat64                           =3D false
>         shaderInt64                             =3D true
>         shaderInt16                             =3D true
>         shaderResourceResidency                 =3D false
>         shaderResourceMinLod                    =3D false
>         sparseBinding                           =3D false
>         sparseResidencyBuffer                   =3D false
>         sparseResidencyImage2D                  =3D false
>         sparseResidencyImage3D                  =3D false
>         sparseResidency2Samples                 =3D false
>         sparseResidency4Samples                 =3D false
>         sparseResidency8Samples                 =3D false
>         sparseResidency16Samples                =3D false
>         sparseResidencyAliased                  =3D false
>         variableMultisampleRate                 =3D false
>         inheritedQueries                        =3D false
>
> VkPhysicalDeviceHostQueryResetFeaturesEXT:
> ------------------------------------------
>         hostQueryReset =3D true
>
> VkPhysicalDevicePrivateDataFeaturesEXT:
> ---------------------------------------
>         privateData =3D true
>
> VkPhysicalDeviceScalarBlockLayoutFeaturesEXT:
> ---------------------------------------------
>         scalarBlockLayout =3D true
>
> VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT:
> ------------------------------------------------
>         texelBufferAlignment =3D true
>
> VkPhysicalDeviceTimelineSemaphoreFeaturesKHR:
> ---------------------------------------------
>         timelineSemaphore =3D true
>
> VkPhysicalDeviceUniformBufferStandardLayoutFeaturesKHR:
> -------------------------------------------------------
>         uniformBufferStandardLayout =3D true
>
>
> GPU1:
> VkPhysicalDeviceProperties:
> ---------------------------
>         apiVersion        =3D 1.3.274 (4206866)
>         driverVersion     =3D 0.0.1 (1)
>         vendorID          =3D 0x10005
>         deviceID          =3D 0x0000
>         deviceType        =3D PHYSICAL_DEVICE_TYPE_CPU
>         deviceName        =3D llvmpipe (LLVM 17.0.6, 128 bits)
>         pipelineCacheUUID =3D 32342e30-2e38-2d31-2b70-316161616161
>
> VkPhysicalDeviceLimits:
> -----------------------
>         maxImageDimension1D                             =3D 16384
>         maxImageDimension2D                             =3D 16384
>         maxImageDimension3D                             =3D 4096
>         maxImageDimensionCube                           =3D 32768
>         maxImageArrayLayers                             =3D 2048
>         maxTexelBufferElements                          =3D 134217728
>         maxUniformBufferRange                           =3D 65536
>         maxStorageBufferRange                           =3D 134217728
>         maxPushConstantsSize                            =3D 256
>         maxMemoryAllocationCount                        =3D 4294967295
>         maxSamplerAllocationCount                       =3D 32768
>         bufferImageGranularity                          =3D 0x00000040
>         sparseAddressSpaceSize                          =3D 0x00000000
>         maxBoundDescriptorSets                          =3D 8
>         maxPerStageDescriptorSamplers                   =3D 1000000
>         maxPerStageDescriptorUniformBuffers             =3D 1000000
>         maxPerStageDescriptorStorageBuffers             =3D 1000000
>         maxPerStageDescriptorSampledImages              =3D 1000000
>         maxPerStageDescriptorStorageImages              =3D 1000000
>         maxPerStageDescriptorInputAttachments           =3D 1000000
>         maxPerStageResources                            =3D 1000000
>         maxDescriptorSetSamplers                        =3D 1000000
>         maxDescriptorSetUniformBuffers                  =3D 1000000
>         maxDescriptorSetUniformBuffersDynamic           =3D 1000000
>         maxDescriptorSetStorageBuffers                  =3D 1000000
>         maxDescriptorSetStorageBuffersDynamic           =3D 1000000
>         maxDescriptorSetSampledImages                   =3D 1000000
>         maxDescriptorSetStorageImages                   =3D 1000000
>         maxDescriptorSetInputAttachments                =3D 1000000
>         maxVertexInputAttributes                        =3D 32
>         maxVertexInputBindings                          =3D 32
>         maxVertexInputAttributeOffset                   =3D 2047
>         maxVertexInputBindingStride                     =3D 2048
>         maxVertexOutputComponents                       =3D 128
>         maxTessellationGenerationLevel                  =3D 64
>         maxTessellationPatchSize                        =3D 32
>         maxTessellationControlPerVertexInputComponents  =3D 128
>         maxTessellationControlPerVertexOutputComponents =3D 128
>         maxTessellationControlPerPatchOutputComponents  =3D 128
>         maxTessellationControlTotalOutputComponents     =3D 4096
>         maxTessellationEvaluationInputComponents        =3D 128
>         maxTessellationEvaluationOutputComponents       =3D 128
>         maxGeometryShaderInvocations                    =3D 32
>         maxGeometryInputComponents                      =3D 64
>         maxGeometryOutputComponents                     =3D 128
>         maxGeometryOutputVertices                       =3D 1024
>         maxGeometryTotalOutputComponents                =3D 1024
>         maxFragmentInputComponents                      =3D 128
>         maxFragmentOutputAttachments                    =3D 8
>         maxFragmentDualSrcAttachments                   =3D 2
>         maxFragmentCombinedOutputResources              =3D 104
>         maxComputeSharedMemorySize                      =3D 32768
>         maxComputeWorkGroupCount: count =3D 3
>                 65535
>                 65535
>                 65535
>         maxComputeWorkGroupInvocations                  =3D 1024
>         maxComputeWorkGroupSize: count =3D 3
>                 1024
>                 1024
>                 1024
>         subPixelPrecisionBits                           =3D 8
>         subTexelPrecisionBits                           =3D 8
>         mipmapPrecisionBits                             =3D 4
>         maxDrawIndexedIndexValue                        =3D 4294967295
>         maxDrawIndirectCount                            =3D 4294967295
>         maxSamplerLodBias                               =3D 16
>         maxSamplerAnisotropy                            =3D 16
>         maxViewports                                    =3D 16
>         maxViewportDimensions: count =3D 2
>                 16384
>                 16384
>         viewportBoundsRange: count =3D 2
>                 -32768
>                 32768
>         viewportSubPixelBits                            =3D 0
>         minMemoryMapAlignment                           =3D 64
>         minTexelBufferOffsetAlignment                   =3D 0x00000010
>         minUniformBufferOffsetAlignment                 =3D 0x00000010
>         minStorageBufferOffsetAlignment                 =3D 0x00000010
>         minTexelOffset                                  =3D -32
>         maxTexelOffset                                  =3D 31
>         minTexelGatherOffset                            =3D -32
>         maxTexelGatherOffset                            =3D 31
>         minInterpolationOffset                          =3D -2
>         maxInterpolationOffset                          =3D 2
>         subPixelInterpolationOffsetBits                 =3D 8
>         maxFramebufferWidth                             =3D 16384
>         maxFramebufferHeight                            =3D 16384
>         maxFramebufferLayers                            =3D 2048
>         framebufferColorSampleCounts: count =3D 2
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_4_BIT
>         framebufferDepthSampleCounts: count =3D 2
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_4_BIT
>         framebufferStencilSampleCounts: count =3D 2
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_4_BIT
>         framebufferNoAttachmentsSampleCounts: count =3D 2
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_4_BIT
>         maxColorAttachments                             =3D 8
>         sampledImageColorSampleCounts: count =3D 2
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_4_BIT
>         sampledImageIntegerSampleCounts: count =3D 2
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_4_BIT
>         sampledImageDepthSampleCounts: count =3D 2
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_4_BIT
>         sampledImageStencilSampleCounts: count =3D 2
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_4_BIT
>         storageImageSampleCounts: count =3D 2
>                 SAMPLE_COUNT_1_BIT
>                 SAMPLE_COUNT_4_BIT
>         maxSampleMaskWords                              =3D 1
>         timestampComputeAndGraphics                     =3D true
>         timestampPeriod                                 =3D 1
>         maxClipDistances                                =3D 8
>         maxCullDistances                                =3D 8
>         maxCombinedClipAndCullDistances                 =3D 8
>         discreteQueuePriorities                         =3D 2
>         pointSizeRange: count =3D 2
>                 0
>                 255
>         lineWidthRange: count =3D 2
>                 1
>                 255
>         pointSizeGranularity                            =3D 0.125
>         lineWidthGranularity                            =3D 0.0078125
>         strictLines                                     =3D true
>         standardSampleLocations                         =3D true
>         optimalBufferCopyOffsetAlignment                =3D 0x00000080
>         optimalBufferCopyRowPitchAlignment              =3D 0x00000080
>         nonCoherentAtomSize                             =3D 0x00000040
>
> VkPhysicalDeviceSparseProperties:
> ---------------------------------
>         residencyStandard2DBlockShape            =3D false
>         residencyStandard2DMultisampleBlockShape =3D false
>         residencyStandard3DBlockShape            =3D false
>         residencyAlignedMipSize                  =3D false
>         residencyNonResidentStrict               =3D false
>
> VkPhysicalDeviceCustomBorderColorPropertiesEXT:
> -----------------------------------------------
>         maxCustomBorderColorSamplers =3D 32768
>
> VkPhysicalDeviceDescriptorBufferDensityMapPropertiesEXT:
> --------------------------------------------------------
>         combinedImageSamplerDensityMapDescriptorSize =3D 0
>
> VkPhysicalDeviceDescriptorBufferPropertiesEXT:
> ----------------------------------------------
>         combinedImageSamplerDescriptorSingleArray            =3D true
>         bufferlessPushDescriptors                            =3D true
>         allowSamplerImageViewPostSubmitCreation              =3D false
>         descriptorBufferOffsetAlignment                      =3D 0x000000=
04
>         maxDescriptorBufferBindings                          =3D 8
>         maxResourceDescriptorBufferBindings                  =3D 8
>         maxSamplerDescriptorBufferBindings                   =3D 8
>         maxEmbeddedImmutableSamplerBindings                  =3D 8
>         maxEmbeddedImmutableSamplers                         =3D 2032
>         bufferCaptureReplayDescriptorDataSize                =3D 0
>         imageCaptureReplayDescriptorDataSize                 =3D 0
>         imageViewCaptureReplayDescriptorDataSize             =3D 0
>         samplerCaptureReplayDescriptorDataSize               =3D 0
>         accelerationStructureCaptureReplayDescriptorDataSize =3D 0
>         samplerDescriptorSize                                =3D 256
>         combinedImageSamplerDescriptorSize                   =3D 256
>         sampledImageDescriptorSize                           =3D 256
>         storageImageDescriptorSize                           =3D 256
>         uniformTexelBufferDescriptorSize                     =3D 256
>         robustUniformTexelBufferDescriptorSize               =3D 256
>         storageTexelBufferDescriptorSize                     =3D 256
>         robustStorageTexelBufferDescriptorSize               =3D 256
>         uniformBufferDescriptorSize                          =3D 256
>         robustUniformBufferDescriptorSize                    =3D 256
>         storageBufferDescriptorSize                          =3D 256
>         robustStorageBufferDescriptorSize                    =3D 256
>         inputAttachmentDescriptorSize                        =3D 256
>         accelerationStructureDescriptorSize                  =3D 0
>         maxSamplerDescriptorBufferRange                      =3D 0x080000=
00
>         maxResourceDescriptorBufferRange                     =3D 0x100000=
00
>         samplerDescriptorBufferAddressSpaceSize              =3D 0x080000=
00
>         resourceDescriptorBufferAddressSpaceSize             =3D 0x080000=
00
>         descriptorBufferAddressSpaceSize                     =3D 0x080000=
00
>
> VkPhysicalDeviceExtendedDynamicState3PropertiesEXT:
> ---------------------------------------------------
>         dynamicPrimitiveTopologyUnrestricted =3D true
>
> VkPhysicalDeviceExternalMemoryHostPropertiesEXT:
> ------------------------------------------------
>         minImportedHostPointerAlignment =3D 0x00001000
>
> VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT:
> -----------------------------------------------------
>         graphicsPipelineLibraryFastLinking                        =3D tru=
e
>         graphicsPipelineLibraryIndependentInterpolationDecoration =3D tru=
e
>
> VkPhysicalDeviceLineRasterizationPropertiesKHR:
> -----------------------------------------------
>         lineSubPixelPrecisionBits =3D 8
>
> VkPhysicalDeviceMaintenance5PropertiesKHR:
> ------------------------------------------
>         earlyFragmentMultisampleCoverageAfterSampleCounting =3D true
>         earlyFragmentSampleMaskTestBeforeSampleCounting     =3D false
>         depthStencilSwizzleOneSupport                       =3D false
>         polygonModePointSize                                =3D true
>         nonStrictSinglePixelWideLinesUseParallelogram       =3D false
>         nonStrictWideLinesUseParallelogram                  =3D false
>
> VkPhysicalDeviceMaintenance6PropertiesKHR:
> ------------------------------------------
>         blockTexelViewCompatibleMultipleLayers =3D true
>         maxCombinedImageSamplerDescriptorCount =3D 3
>         fragmentShadingRateClampCombinerInputs =3D false
>
> VkPhysicalDeviceMeshShaderPropertiesEXT:
> ----------------------------------------
>         maxTaskWorkGroupTotalCount            =3D 4194304
>         maxTaskWorkGroupCount: count =3D 3
>                 65536
>                 65536
>                 65536
>         maxTaskWorkGroupInvocations           =3D 1024
>         maxTaskWorkGroupSize: count =3D 3
>                 1024
>                 1024
>                 1024
>         maxTaskPayloadSize                    =3D 16384
>         maxTaskSharedMemorySize               =3D 32768
>         maxTaskPayloadAndSharedMemorySize     =3D 32768
>         maxMeshWorkGroupTotalCount            =3D 4194304
>         maxMeshWorkGroupCount: count =3D 3
>                 65536
>                 65536
>                 65536
>         maxMeshWorkGroupInvocations           =3D 1024
>         maxMeshWorkGroupSize: count =3D 3
>                 1024
>                 1024
>                 1024
>         maxMeshSharedMemorySize               =3D 28672
>         maxMeshPayloadAndSharedMemorySize     =3D 45056
>         maxMeshOutputMemorySize               =3D 32768
>         maxMeshPayloadAndOutputMemorySize     =3D 49152
>         maxMeshOutputComponents               =3D 128
>         maxMeshOutputVertices                 =3D 256
>         maxMeshOutputPrimitives               =3D 256
>         maxMeshOutputLayers                   =3D 8
>         maxMeshMultiviewViewCount             =3D 0
>         meshOutputPerVertexGranularity        =3D 1
>         meshOutputPerPrimitiveGranularity     =3D 1
>         maxPreferredTaskWorkGroupInvocations  =3D 64
>         maxPreferredMeshWorkGroupInvocations  =3D 128
>         prefersLocalInvocationVertexOutput    =3D true
>         prefersLocalInvocationPrimitiveOutput =3D true
>         prefersCompactVertexOutput            =3D true
>         prefersCompactPrimitiveOutput         =3D false
>
> VkPhysicalDeviceMultiDrawPropertiesEXT:
> ---------------------------------------
>         maxMultiDrawCount =3D 2048
>
> VkPhysicalDeviceNestedCommandBufferPropertiesEXT:
> -------------------------------------------------
>         maxCommandBufferNestingLevel =3D 4294967295
>
> VkPhysicalDeviceProvokingVertexPropertiesEXT:
> ---------------------------------------------
>         provokingVertexModePerPipeline                       =3D true
>         transformFeedbackPreservesTriangleFanProvokingVertex =3D true
>
> VkPhysicalDevicePushDescriptorPropertiesKHR:
> --------------------------------------------
>         maxPushDescriptors =3D 32
>
> VkPhysicalDeviceRobustness2PropertiesEXT:
> -----------------------------------------
>         robustStorageBufferAccessSizeAlignment =3D 0x00000001
>         robustUniformBufferAccessSizeAlignment =3D 0x00000001
>
> VkPhysicalDeviceShaderObjectPropertiesEXT:
> ------------------------------------------
>         shaderBinaryUUID     =3D 32342e30-2e38-2d31-2b70-316161616161
>         shaderBinaryVersion  =3D 1
>
> VkPhysicalDeviceTransformFeedbackPropertiesEXT:
> -----------------------------------------------
>         maxTransformFeedbackStreams                =3D 4
>         maxTransformFeedbackBuffers                =3D 4
>         maxTransformFeedbackBufferSize             =3D 0xffffffff
>         maxTransformFeedbackStreamDataSize         =3D 512
>         maxTransformFeedbackBufferDataSize         =3D 512
>         maxTransformFeedbackBufferDataStride       =3D 512
>         transformFeedbackQueries                   =3D true
>         transformFeedbackStreamsLinesTriangles     =3D false
>         transformFeedbackRasterizationStreamSelect =3D false
>         transformFeedbackDraw                      =3D true
>
> VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT:
> ----------------------------------------------------
>         maxVertexAttribDivisor =3D 4294967295
>
> VkPhysicalDeviceVulkan11Properties:
> -----------------------------------
>         deviceUUID                        =3D 6d657361-3234-2e30-2e38-2d3=
12b703100
>         driverUUID                        =3D 6c6c766d-7069-7065-5555-494=
400000000
>         deviceNodeMask                    =3D 0
>         deviceLUIDValid                   =3D false
>         subgroupSize                      =3D 4
>         subgroupSupportedStages: count =3D 4
>                 SHADER_STAGE_FRAGMENT_BIT
>                 SHADER_STAGE_COMPUTE_BIT
>                 SHADER_STAGE_TASK_BIT_EXT
>                 SHADER_STAGE_MESH_BIT_EXT
>         subgroupSupportedOperations: count =3D 7
>                 SUBGROUP_FEATURE_BASIC_BIT
>                 SUBGROUP_FEATURE_VOTE_BIT
>                 SUBGROUP_FEATURE_ARITHMETIC_BIT
>                 SUBGROUP_FEATURE_BALLOT_BIT
>                 SUBGROUP_FEATURE_SHUFFLE_BIT
>                 SUBGROUP_FEATURE_SHUFFLE_RELATIVE_BIT
>                 SUBGROUP_FEATURE_QUAD_BIT
>         subgroupQuadOperationsInAllStages =3D false
>         pointClippingBehavior             =3D POINT_CLIPPING_BEHAVIOR_ALL=
_CLIP_PLANES
>         maxMultiviewViewCount             =3D 6
>         maxMultiviewInstanceIndex         =3D 2147483647
>         protectedNoFault                  =3D false
>         maxPerSetDescriptors              =3D 1000000
>         maxMemoryAllocationSize           =3D 0x80000000
>
> VkPhysicalDeviceVulkan12Properties:
> -----------------------------------
>         driverID                                             =3D DRIVER_I=
D_MESA_LLVMPIPE
>         driverName                                           =3D llvmpipe
>         driverInfo                                           =3D Mesa 24.=
0.8-1+p1 (LLVM 17.0.6)
>         conformanceVersion:
>                 major    =3D 1
>                 minor    =3D 3
>                 subminor =3D 1
>                 patch    =3D 1
>         denormBehaviorIndependence                           =3D SHADER_F=
LOAT_CONTROLS_INDEPENDENCE_ALL
>         roundingModeIndependence                             =3D SHADER_F=
LOAT_CONTROLS_INDEPENDENCE_ALL
>         shaderSignedZeroInfNanPreserveFloat16                =3D true
>         shaderSignedZeroInfNanPreserveFloat32                =3D true
>         shaderSignedZeroInfNanPreserveFloat64                =3D true
>         shaderDenormPreserveFloat16                          =3D false
>         shaderDenormPreserveFloat32                          =3D false
>         shaderDenormPreserveFloat64                          =3D false
>         shaderDenormFlushToZeroFloat16                       =3D false
>         shaderDenormFlushToZeroFloat32                       =3D false
>         shaderDenormFlushToZeroFloat64                       =3D false
>         shaderRoundingModeRTEFloat16                         =3D true
>         shaderRoundingModeRTEFloat32                         =3D true
>         shaderRoundingModeRTEFloat64                         =3D true
>         shaderRoundingModeRTZFloat16                         =3D false
>         shaderRoundingModeRTZFloat32                         =3D false
>         shaderRoundingModeRTZFloat64                         =3D false
>         maxUpdateAfterBindDescriptorsInAllPools              =3D 42949672=
95
>         shaderUniformBufferArrayNonUniformIndexingNative     =3D true
>         shaderSampledImageArrayNonUniformIndexingNative      =3D true
>         shaderStorageBufferArrayNonUniformIndexingNative     =3D true
>         shaderStorageImageArrayNonUniformIndexingNative      =3D true
>         shaderInputAttachmentArrayNonUniformIndexingNative   =3D true
>         robustBufferAccessUpdateAfterBind                    =3D true
>         quadDivergentImplicitLod                             =3D true
>         maxPerStageDescriptorUpdateAfterBindSamplers         =3D 1000000
>         maxPerStageDescriptorUpdateAfterBindUniformBuffers   =3D 1000000
>         maxPerStageDescriptorUpdateAfterBindStorageBuffers   =3D 1000000
>         maxPerStageDescriptorUpdateAfterBindSampledImages    =3D 1000000
>         maxPerStageDescriptorUpdateAfterBindStorageImages    =3D 1000000
>         maxPerStageDescriptorUpdateAfterBindInputAttachments =3D 1000000
>         maxPerStageUpdateAfterBindResources                  =3D 1000000
>         maxDescriptorSetUpdateAfterBindSamplers              =3D 1000000
>         maxDescriptorSetUpdateAfterBindUniformBuffers        =3D 1000000
>         maxDescriptorSetUpdateAfterBindUniformBuffersDynamic =3D 1000000
>         maxDescriptorSetUpdateAfterBindStorageBuffers        =3D 1000000
>         maxDescriptorSetUpdateAfterBindStorageBuffersDynamic =3D 1000000
>         maxDescriptorSetUpdateAfterBindSampledImages         =3D 1000000
>         maxDescriptorSetUpdateAfterBindStorageImages         =3D 1000000
>         maxDescriptorSetUpdateAfterBindInputAttachments      =3D 1000000
>         supportedDepthResolveModes: count =3D 2
>                 RESOLVE_MODE_SAMPLE_ZERO_BIT
>                 RESOLVE_MODE_AVERAGE_BIT
>         supportedStencilResolveModes: count =3D 1
>                 RESOLVE_MODE_SAMPLE_ZERO_BIT
>         independentResolveNone                               =3D false
>         independentResolve                                   =3D false
>         filterMinmaxSingleComponentFormats                   =3D true
>         filterMinmaxImageComponentMapping                    =3D true
>         maxTimelineSemaphoreValueDifference                  =3D 18446744=
073709551615
>         framebufferIntegerColorSampleCounts: count =3D 1
>                 SAMPLE_COUNT_1_BIT
>
> VkPhysicalDeviceVulkan13Properties:
> -----------------------------------
>         minSubgroupSize                                                  =
             =3D 4
>         maxSubgroupSize                                                  =
             =3D 4
>         maxComputeWorkgroupSubgroups                                     =
             =3D 32
>         requiredSubgroupSizeStages: count =3D 2
>                 SHADER_STAGE_FRAGMENT_BIT
>                 SHADER_STAGE_COMPUTE_BIT
>         maxInlineUniformBlockSize                                        =
             =3D 4096
>         maxPerStageDescriptorInlineUniformBlocks                         =
             =3D 8
>         maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks          =
             =3D 8
>         maxDescriptorSetInlineUniformBlocks                              =
             =3D 8
>         maxDescriptorSetUpdateAfterBindInlineUniformBlocks               =
             =3D 8
>         maxInlineUniformTotalSize                                        =
             =3D 262144
>         integerDotProduct8BitUnsignedAccelerated                         =
             =3D false
>         integerDotProduct8BitSignedAccelerated                           =
             =3D false
>         integerDotProduct8BitMixedSignednessAccelerated                  =
             =3D false
>         integerDotProduct4x8BitPackedUnsignedAccelerated                 =
             =3D false
>         integerDotProduct4x8BitPackedSignedAccelerated                   =
             =3D false
>         integerDotProduct4x8BitPackedMixedSignednessAccelerated          =
             =3D false
>         integerDotProduct16BitUnsignedAccelerated                        =
             =3D false
>         integerDotProduct16BitSignedAccelerated                          =
             =3D false
>         integerDotProduct16BitMixedSignednessAccelerated                 =
             =3D false
>         integerDotProduct32BitUnsignedAccelerated                        =
             =3D false
>         integerDotProduct32BitSignedAccelerated                          =
             =3D false
>         integerDotProduct32BitMixedSignednessAccelerated                 =
             =3D false
>         integerDotProduct64BitUnsignedAccelerated                        =
             =3D false
>         integerDotProduct64BitSignedAccelerated                          =
             =3D false
>         integerDotProduct64BitMixedSignednessAccelerated                 =
             =3D false
>         integerDotProductAccumulatingSaturating8BitUnsignedAccelerated   =
             =3D false
>         integerDotProductAccumulatingSaturating8BitSignedAccelerated     =
             =3D false
>         integerDotProductAccumulatingSaturating8BitMixedSignednessAcceler=
ated         =3D false
>         integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccele=
rated        =3D false
>         integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelera=
ted          =3D false
>         integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednes=
sAccelerated =3D false
>         integerDotProductAccumulatingSaturating16BitUnsignedAccelerated  =
             =3D false
>         integerDotProductAccumulatingSaturating16BitSignedAccelerated    =
             =3D false
>         integerDotProductAccumulatingSaturating16BitMixedSignednessAccele=
rated        =3D false
>         integerDotProductAccumulatingSaturating32BitUnsignedAccelerated  =
             =3D false
>         integerDotProductAccumulatingSaturating32BitSignedAccelerated    =
             =3D false
>         integerDotProductAccumulatingSaturating32BitMixedSignednessAccele=
rated        =3D false
>         integerDotProductAccumulatingSaturating64BitUnsignedAccelerated  =
             =3D false
>         integerDotProductAccumulatingSaturating64BitSignedAccelerated    =
             =3D false
>         integerDotProductAccumulatingSaturating64BitMixedSignednessAccele=
rated        =3D false
>         storageTexelBufferOffsetAlignmentBytes                           =
             =3D 0x00000010
>         storageTexelBufferOffsetSingleTexelAlignment                     =
             =3D true
>         uniformTexelBufferOffsetAlignmentBytes                           =
             =3D 0x00000010
>         uniformTexelBufferOffsetSingleTexelAlignment                     =
             =3D true
>         maxBufferSize                                                    =
             =3D 0xffffffff
>
> VkPhysicalDeviceHostImageCopyPropertiesEXT:
> -------------------------------------------
>         copySrcLayoutCount                  =3D 23
>         pCopySrcLayouts: count =3D 23
>                 IMAGE_LAYOUT_GENERAL
>                 IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL
>                 IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL
>                 IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL
>                 IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL
>                 IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL
>                 IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL
>                 IMAGE_LAYOUT_PREINITIALIZED
>                 IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL
>                 IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL
>                 IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL
>                 IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL
>                 IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL
>                 IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL
>                 IMAGE_LAYOUT_READ_ONLY_OPTIMAL
>                 IMAGE_LAYOUT_ATTACHMENT_OPTIMAL
>                 IMAGE_LAYOUT_PRESENT_SRC_KHR
>                 IMAGE_LAYOUT_VIDEO_DECODE_DST_KHR
>                 IMAGE_LAYOUT_VIDEO_DECODE_SRC_KHR
>                 IMAGE_LAYOUT_VIDEO_DECODE_DPB_KHR
>                 IMAGE_LAYOUT_SHARED_PRESENT_KHR
>                 IMAGE_LAYOUT_FRAGMENT_DENSITY_MAP_OPTIMAL_EXT
>                 IMAGE_LAYOUT_FRAGMENT_SHADING_RATE_ATTACHMENT_OPTIMAL_KHR
>         copyDstLayoutCount                  =3D 23
>         pCopyDstLayouts: count =3D 23
>                 IMAGE_LAYOUT_GENERAL
>                 IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL
>                 IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL
>                 IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL
>                 IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL
>                 IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL
>                 IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL
>                 IMAGE_LAYOUT_PREINITIALIZED
>                 IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL
>                 IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL
>                 IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL
>                 IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL
>                 IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL
>                 IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL
>                 IMAGE_LAYOUT_READ_ONLY_OPTIMAL
>                 IMAGE_LAYOUT_ATTACHMENT_OPTIMAL
>                 IMAGE_LAYOUT_PRESENT_SRC_KHR
>                 IMAGE_LAYOUT_VIDEO_DECODE_DST_KHR
>                 IMAGE_LAYOUT_VIDEO_DECODE_SRC_KHR
>                 IMAGE_LAYOUT_VIDEO_DECODE_DPB_KHR
>                 IMAGE_LAYOUT_SHARED_PRESENT_KHR
>                 IMAGE_LAYOUT_FRAGMENT_DENSITY_MAP_OPTIMAL_EXT
>                 IMAGE_LAYOUT_FRAGMENT_SHADING_RATE_ATTACHMENT_OPTIMAL_KHR
>         optimalTilingLayoutUUID             =3D 32342e30-2e38-2d31-2b70-3=
16161616161
>         identicalMemoryTypeRequirements     =3D false
>
> Device Extensions: count =3D 124
>         VK_AMDX_shader_enqueue                        : extension revisio=
n 1
>         VK_ARM_rasterization_order_attachment_access  : extension revisio=
n 1
>         VK_EXT_4444_formats                           : extension revisio=
n 1
>         VK_EXT_attachment_feedback_loop_dynamic_state : extension revisio=
n 1
>         VK_EXT_attachment_feedback_loop_layout        : extension revisio=
n 2
>         VK_EXT_border_color_swizzle                   : extension revisio=
n 1
>         VK_EXT_calibrated_timestamps                  : extension revisio=
n 2
>         VK_EXT_color_write_enable                     : extension revisio=
n 1
>         VK_EXT_conditional_rendering                  : extension revisio=
n 2
>         VK_EXT_custom_border_color                    : extension revisio=
n 12
>         VK_EXT_depth_clip_control                     : extension revisio=
n 1
>         VK_EXT_depth_clip_enable                      : extension revisio=
n 1
>         VK_EXT_depth_range_unrestricted               : extension revisio=
n 1
>         VK_EXT_descriptor_buffer                      : extension revisio=
n 1
>         VK_EXT_descriptor_indexing                    : extension revisio=
n 2
>         VK_EXT_dynamic_rendering_unused_attachments   : extension revisio=
n 1
>         VK_EXT_extended_dynamic_state                 : extension revisio=
n 1
>         VK_EXT_extended_dynamic_state2                : extension revisio=
n 1
>         VK_EXT_extended_dynamic_state3                : extension revisio=
n 2
>         VK_EXT_external_memory_host                   : extension revisio=
n 1
>         VK_EXT_graphics_pipeline_library              : extension revisio=
n 1
>         VK_EXT_host_image_copy                        : extension revisio=
n 1
>         VK_EXT_host_query_reset                       : extension revisio=
n 1
>         VK_EXT_image_2d_view_of_3d                    : extension revisio=
n 1
>         VK_EXT_image_robustness                       : extension revisio=
n 1
>         VK_EXT_image_sliced_view_of_3d                : extension revisio=
n 1
>         VK_EXT_index_type_uint8                       : extension revisio=
n 1
>         VK_EXT_inline_uniform_block                   : extension revisio=
n 1
>         VK_EXT_line_rasterization                     : extension revisio=
n 1
>         VK_EXT_load_store_op_none                     : extension revisio=
n 1
>         VK_EXT_memory_budget                          : extension revisio=
n 1
>         VK_EXT_memory_priority                        : extension revisio=
n 1
>         VK_EXT_mesh_shader                            : extension revisio=
n 1
>         VK_EXT_multi_draw                             : extension revisio=
n 1
>         VK_EXT_multisampled_render_to_single_sampled  : extension revisio=
n 1
>         VK_EXT_mutable_descriptor_type                : extension revisio=
n 1
>         VK_EXT_nested_command_buffer                  : extension revisio=
n 1
>         VK_EXT_non_seamless_cube_map                  : extension revisio=
n 1
>         VK_EXT_pageable_device_local_memory           : extension revisio=
n 1
>         VK_EXT_pipeline_creation_cache_control        : extension revisio=
n 3
>         VK_EXT_pipeline_creation_feedback             : extension revisio=
n 1
>         VK_EXT_post_depth_coverage                    : extension revisio=
n 1
>         VK_EXT_primitive_topology_list_restart        : extension revisio=
n 1
>         VK_EXT_primitives_generated_query             : extension revisio=
n 1
>         VK_EXT_private_data                           : extension revisio=
n 1
>         VK_EXT_provoking_vertex                       : extension revisio=
n 1
>         VK_EXT_rasterization_order_attachment_access  : extension revisio=
n 1
>         VK_EXT_robustness2                            : extension revisio=
n 1
>         VK_EXT_sampler_filter_minmax                  : extension revisio=
n 2
>         VK_EXT_scalar_block_layout                    : extension revisio=
n 1
>         VK_EXT_separate_stencil_usage                 : extension revisio=
n 1
>         VK_EXT_shader_atomic_float                    : extension revisio=
n 1
>         VK_EXT_shader_atomic_float2                   : extension revisio=
n 1
>         VK_EXT_shader_demote_to_helper_invocation     : extension revisio=
n 1
>         VK_EXT_shader_object                          : extension revisio=
n 1
>         VK_EXT_shader_stencil_export                  : extension revisio=
n 1
>         VK_EXT_shader_subgroup_ballot                 : extension revisio=
n 1
>         VK_EXT_shader_subgroup_vote                   : extension revisio=
n 1
>         VK_EXT_shader_viewport_index_layer            : extension revisio=
n 1
>         VK_EXT_subgroup_size_control                  : extension revisio=
n 2
>         VK_EXT_texel_buffer_alignment                 : extension revisio=
n 1
>         VK_EXT_transform_feedback                     : extension revisio=
n 1
>         VK_EXT_vertex_attribute_divisor               : extension revisio=
n 3
>         VK_EXT_vertex_input_dynamic_state             : extension revisio=
n 2
>         VK_EXT_ycbcr_2plane_444_formats               : extension revisio=
n 1
>         VK_EXT_ycbcr_image_arrays                     : extension revisio=
n 1
>         VK_GOOGLE_decorate_string                     : extension revisio=
n 1
>         VK_GOOGLE_hlsl_functionality1                 : extension revisio=
n 1
>         VK_KHR_16bit_storage                          : extension revisio=
n 1
>         VK_KHR_8bit_storage                           : extension revisio=
n 1
>         VK_KHR_bind_memory2                           : extension revisio=
n 1
>         VK_KHR_buffer_device_address                  : extension revisio=
n 1
>         VK_KHR_copy_commands2                         : extension revisio=
n 1
>         VK_KHR_create_renderpass2                     : extension revisio=
n 1
>         VK_KHR_dedicated_allocation                   : extension revisio=
n 3
>         VK_KHR_depth_stencil_resolve                  : extension revisio=
n 1
>         VK_KHR_descriptor_update_template             : extension revisio=
n 1
>         VK_KHR_device_group                           : extension revisio=
n 4
>         VK_KHR_draw_indirect_count                    : extension revisio=
n 1
>         VK_KHR_driver_properties                      : extension revisio=
n 1
>         VK_KHR_dynamic_rendering                      : extension revisio=
n 1
>         VK_KHR_external_fence                         : extension revisio=
n 1
>         VK_KHR_external_memory                        : extension revisio=
n 1
>         VK_KHR_external_memory_fd                     : extension revisio=
n 1
>         VK_KHR_external_semaphore                     : extension revisio=
n 1
>         VK_KHR_format_feature_flags2                  : extension revisio=
n 2
>         VK_KHR_get_memory_requirements2               : extension revisio=
n 1
>         VK_KHR_image_format_list                      : extension revisio=
n 1
>         VK_KHR_imageless_framebuffer                  : extension revisio=
n 1
>         VK_KHR_incremental_present                    : extension revisio=
n 2
>         VK_KHR_maintenance1                           : extension revisio=
n 2
>         VK_KHR_maintenance2                           : extension revisio=
n 1
>         VK_KHR_maintenance3                           : extension revisio=
n 1
>         VK_KHR_maintenance4                           : extension revisio=
n 2
>         VK_KHR_maintenance5                           : extension revisio=
n 1
>         VK_KHR_maintenance6                           : extension revisio=
n 1
>         VK_KHR_map_memory2                            : extension revisio=
n 1
>         VK_KHR_multiview                              : extension revisio=
n 1
>         VK_KHR_pipeline_library                       : extension revisio=
n 1
>         VK_KHR_push_descriptor                        : extension revisio=
n 2
>         VK_KHR_relaxed_block_layout                   : extension revisio=
n 1
>         VK_KHR_sampler_mirror_clamp_to_edge           : extension revisio=
n 3
>         VK_KHR_sampler_ycbcr_conversion               : extension revisio=
n 14
>         VK_KHR_separate_depth_stencil_layouts         : extension revisio=
n 1
>         VK_KHR_shader_atomic_int64                    : extension revisio=
n 1
>         VK_KHR_shader_clock                           : extension revisio=
n 1
>         VK_KHR_shader_draw_parameters                 : extension revisio=
n 1
>         VK_KHR_shader_float16_int8                    : extension revisio=
n 1
>         VK_KHR_shader_float_controls                  : extension revisio=
n 4
>         VK_KHR_shader_integer_dot_product             : extension revisio=
n 1
>         VK_KHR_shader_non_semantic_info               : extension revisio=
n 1
>         VK_KHR_shader_subgroup_extended_types         : extension revisio=
n 1
>         VK_KHR_shader_terminate_invocation            : extension revisio=
n 1
>         VK_KHR_spirv_1_4                              : extension revisio=
n 1
>         VK_KHR_storage_buffer_storage_class           : extension revisio=
n 1
>         VK_KHR_swapchain                              : extension revisio=
n 70
>         VK_KHR_swapchain_mutable_format               : extension revisio=
n 1
>         VK_KHR_synchronization2                       : extension revisio=
n 1
>         VK_KHR_timeline_semaphore                     : extension revisio=
n 2
>         VK_KHR_uniform_buffer_standard_layout         : extension revisio=
n 1
>         VK_KHR_variable_pointers                      : extension revisio=
n 1
>         VK_KHR_vulkan_memory_model                    : extension revisio=
n 3
>         VK_KHR_zero_initialize_workgroup_memory       : extension revisio=
n 1
>         VK_NV_device_generated_commands               : extension revisio=
n 3
>
> VkQueueFamilyProperties:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         queueProperties[0]:
>         -------------------
>                 minImageTransferGranularity =3D (1,1,1)
>                 queueCount                  =3D 1
>                 queueFlags                  =3D QUEUE_GRAPHICS_BIT | QUEU=
E_COMPUTE_BIT | QUEUE_TRANSFER_BIT
>                 timestampValidBits          =3D 64
>                 present support             =3D false
>
> VkPhysicalDeviceMemoryProperties:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> memoryHeaps: count =3D 1
>         memoryHeaps[0]:
>                 size   =3D 3505938432 (0xd0f86000) (3.27 GiB)
>                 budget =3D 3505938432 (0xd0f86000) (3.27 GiB)
>                 usage  =3D 522092544 (0x1f1e8000) (497.91 MiB)
>                 flags: count =3D 1
>                         MEMORY_HEAP_DEVICE_LOCAL_BIT
> memoryTypes: count =3D 1
>         memoryTypes[0]:
>                 heapIndex     =3D 0
>                 propertyFlags =3D 0x000f: count =3D 4
>                         MEMORY_PROPERTY_DEVICE_LOCAL_BIT
>                         MEMORY_PROPERTY_HOST_VISIBLE_BIT
>                         MEMORY_PROPERTY_HOST_COHERENT_BIT
>                         MEMORY_PROPERTY_HOST_CACHED_BIT
>                 usable for:
>                         IMAGE_TILING_OPTIMAL:
>                                 color images
>                                 FORMAT_D16_UNORM
>                                 FORMAT_X8_D24_UNORM_PACK32
>                                 FORMAT_D32_SFLOAT
>                                 FORMAT_S8_UINT
>                                 FORMAT_D24_UNORM_S8_UINT
>                                 FORMAT_D32_SFLOAT_S8_UINT
>                                 (non-sparse)
>                         IMAGE_TILING_LINEAR:
>                                 color images
>                                 (non-sparse)
>
> VkPhysicalDeviceFeatures:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>         robustBufferAccess                      =3D true
>         fullDrawIndexUint32                     =3D true
>         imageCubeArray                          =3D true
>         independentBlend                        =3D true
>         geometryShader                          =3D true
>         tessellationShader                      =3D true
>         sampleRateShading                       =3D true
>         dualSrcBlend                            =3D true
>         logicOp                                 =3D true
>         multiDrawIndirect                       =3D true
>         drawIndirectFirstInstance               =3D true
>         depthClamp                              =3D true
>         depthBiasClamp                          =3D true
>         fillModeNonSolid                        =3D true
>         depthBounds                             =3D false
>         wideLines                               =3D true
>         largePoints                             =3D true
>         alphaToOne                              =3D true
>         multiViewport                           =3D true
>         samplerAnisotropy                       =3D true
>         textureCompressionETC2                  =3D false
>         textureCompressionASTC_LDR              =3D false
>         textureCompressionBC                    =3D true
>         occlusionQueryPrecise                   =3D true
>         pipelineStatisticsQuery                 =3D true
>         vertexPipelineStoresAndAtomics          =3D true
>         fragmentStoresAndAtomics                =3D true
>         shaderTessellationAndGeometryPointSize  =3D true
>         shaderImageGatherExtended               =3D true
>         shaderStorageImageExtendedFormats       =3D true
>         shaderStorageImageMultisample           =3D true
>         shaderStorageImageReadWithoutFormat     =3D true
>         shaderStorageImageWriteWithoutFormat    =3D true
>         shaderUniformBufferArrayDynamicIndexing =3D true
>         shaderSampledImageArrayDynamicIndexing  =3D true
>         shaderStorageBufferArrayDynamicIndexing =3D true
>         shaderStorageImageArrayDynamicIndexing  =3D true
>         shaderClipDistance                      =3D true
>         shaderCullDistance                      =3D true
>         shaderFloat64                           =3D true
>         shaderInt64                             =3D true
>         shaderInt16                             =3D true
>         shaderResourceResidency                 =3D false
>         shaderResourceMinLod                    =3D false
>         sparseBinding                           =3D false
>         sparseResidencyBuffer                   =3D false
>         sparseResidencyImage2D                  =3D false
>         sparseResidencyImage3D                  =3D false
>         sparseResidency2Samples                 =3D false
>         sparseResidency4Samples                 =3D false
>         sparseResidency8Samples                 =3D false
>         sparseResidency16Samples                =3D false
>         sparseResidencyAliased                  =3D false
>         variableMultisampleRate                 =3D false
>         inheritedQueries                        =3D false
>
> VkPhysicalDevice4444FormatsFeaturesEXT:
> ---------------------------------------
>         formatA4R4G4B4 =3D true
>         formatA4B4G4R4 =3D true
>
> VkPhysicalDeviceAttachmentFeedbackLoopDynamicStateFeaturesEXT:
> --------------------------------------------------------------
>         attachmentFeedbackLoopDynamicState =3D true
>
> VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT:
> --------------------------------------------------------
>         attachmentFeedbackLoopLayout =3D true
>
> VkPhysicalDeviceBorderColorSwizzleFeaturesEXT:
> ----------------------------------------------
>         borderColorSwizzle          =3D true
>         borderColorSwizzleFromImage =3D true
>
> VkPhysicalDeviceColorWriteEnableFeaturesEXT:
> --------------------------------------------
>         colorWriteEnable =3D true
>
> VkPhysicalDeviceConditionalRenderingFeaturesEXT:
> ------------------------------------------------
>         conditionalRendering          =3D true
>         inheritedConditionalRendering =3D false
>
> VkPhysicalDeviceCustomBorderColorFeaturesEXT:
> ---------------------------------------------
>         customBorderColors             =3D true
>         customBorderColorWithoutFormat =3D true
>
> VkPhysicalDeviceDepthClipControlFeaturesEXT:
> --------------------------------------------
>         depthClipControl =3D true
>
> VkPhysicalDeviceDepthClipEnableFeaturesEXT:
> -------------------------------------------
>         depthClipEnable =3D true
>
> VkPhysicalDeviceDescriptorBufferFeaturesEXT:
> --------------------------------------------
>         descriptorBuffer                   =3D true
>         descriptorBufferCaptureReplay      =3D false
>         descriptorBufferImageLayoutIgnored =3D true
>         descriptorBufferPushDescriptors    =3D true
>
> VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT:
> -------------------------------------------------------------
>         dynamicRenderingUnusedAttachments =3D true
>
> VkPhysicalDeviceExtendedDynamicState2FeaturesEXT:
> -------------------------------------------------
>         extendedDynamicState2                   =3D true
>         extendedDynamicState2LogicOp            =3D true
>         extendedDynamicState2PatchControlPoints =3D true
>
> VkPhysicalDeviceExtendedDynamicState3FeaturesEXT:
> -------------------------------------------------
>         extendedDynamicState3TessellationDomainOrigin         =3D true
>         extendedDynamicState3DepthClampEnable                 =3D true
>         extendedDynamicState3PolygonMode                      =3D true
>         extendedDynamicState3RasterizationSamples             =3D true
>         extendedDynamicState3SampleMask                       =3D true
>         extendedDynamicState3AlphaToCoverageEnable            =3D true
>         extendedDynamicState3AlphaToOneEnable                 =3D true
>         extendedDynamicState3LogicOpEnable                    =3D true
>         extendedDynamicState3ColorBlendEnable                 =3D true
>         extendedDynamicState3ColorBlendEquation               =3D true
>         extendedDynamicState3ColorWriteMask                   =3D true
>         extendedDynamicState3RasterizationStream              =3D false
>         extendedDynamicState3ConservativeRasterizationMode    =3D false
>         extendedDynamicState3ExtraPrimitiveOverestimationSize =3D false
>         extendedDynamicState3DepthClipEnable                  =3D true
>         extendedDynamicState3SampleLocationsEnable            =3D false
>         extendedDynamicState3ColorBlendAdvanced               =3D false
>         extendedDynamicState3ProvokingVertexMode              =3D true
>         extendedDynamicState3LineRasterizationMode            =3D true
>         extendedDynamicState3LineStippleEnable                =3D true
>         extendedDynamicState3DepthClipNegativeOneToOne        =3D true
>         extendedDynamicState3ViewportWScalingEnable           =3D false
>         extendedDynamicState3ViewportSwizzle                  =3D false
>         extendedDynamicState3CoverageToColorEnable            =3D false
>         extendedDynamicState3CoverageToColorLocation          =3D false
>         extendedDynamicState3CoverageModulationMode           =3D false
>         extendedDynamicState3CoverageModulationTableEnable    =3D false
>         extendedDynamicState3CoverageModulationTable          =3D false
>         extendedDynamicState3CoverageReductionMode            =3D false
>         extendedDynamicState3RepresentativeFragmentTestEnable =3D false
>         extendedDynamicState3ShadingRateImageEnable           =3D false
>
> VkPhysicalDeviceExtendedDynamicStateFeaturesEXT:
> ------------------------------------------------
>         extendedDynamicState =3D true
>
> VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT:
> ---------------------------------------------------
>         graphicsPipelineLibrary =3D true
>
> VkPhysicalDeviceHostImageCopyFeaturesEXT:
> -----------------------------------------
>         hostImageCopy =3D true
>
> VkPhysicalDeviceImage2DViewOf3DFeaturesEXT:
> -------------------------------------------
>         image2DViewOf3D   =3D true
>         sampler2DViewOf3D =3D true
>
> VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT:
> -----------------------------------------------
>         imageSlicedViewOf3D =3D true
>
> VkPhysicalDeviceIndexTypeUint8FeaturesKHR:
> ------------------------------------------
>         indexTypeUint8 =3D true
>
> VkPhysicalDeviceLineRasterizationFeaturesKHR:
> ---------------------------------------------
>         rectangularLines         =3D true
>         bresenhamLines           =3D true
>         smoothLines              =3D true
>         stippledRectangularLines =3D true
>         stippledBresenhamLines   =3D true
>         stippledSmoothLines      =3D true
>
> VkPhysicalDeviceMaintenance5FeaturesKHR:
> ----------------------------------------
>         maintenance5 =3D true
>
> VkPhysicalDeviceMaintenance6FeaturesKHR:
> ----------------------------------------
>         maintenance6 =3D true
>
> VkPhysicalDeviceMemoryPriorityFeaturesEXT:
> ------------------------------------------
>         memoryPriority =3D true
>
> VkPhysicalDeviceMeshShaderFeaturesEXT:
> --------------------------------------
>         taskShader                             =3D true
>         meshShader                             =3D true
>         multiviewMeshShader                    =3D false
>         primitiveFragmentShadingRateMeshShader =3D false
>         meshShaderQueries                      =3D true
>
> VkPhysicalDeviceMultiDrawFeaturesEXT:
> -------------------------------------
>         multiDraw =3D true
>
> VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT:
> -------------------------------------------------------------
>         multisampledRenderToSingleSampled =3D true
>
> VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT:
> -------------------------------------------------
>         mutableDescriptorType =3D true
>
> VkPhysicalDeviceNestedCommandBufferFeaturesEXT:
> -----------------------------------------------
>         nestedCommandBuffer                =3D true
>         nestedCommandBufferRendering       =3D true
>         nestedCommandBufferSimultaneousUse =3D true
>
> VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT:
> ----------------------------------------------
>         nonSeamlessCubeMap =3D true
>
> VkPhysicalDevicePageableDeviceLocalMemoryFeaturesEXT:
> -----------------------------------------------------
>         pageableDeviceLocalMemory =3D true
>
> VkPhysicalDevicePrimitiveTopologyListRestartFeaturesEXT:
> --------------------------------------------------------
>         primitiveTopologyListRestart      =3D true
>         primitiveTopologyPatchListRestart =3D true
>
> VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT:
> ----------------------------------------------------
>         primitivesGeneratedQuery                      =3D true
>         primitivesGeneratedQueryWithRasterizerDiscard =3D true
>         primitivesGeneratedQueryWithNonZeroStreams    =3D true
>
> VkPhysicalDeviceProvokingVertexFeaturesEXT:
> -------------------------------------------
>         provokingVertexLast                       =3D true
>         transformFeedbackPreservesProvokingVertex =3D true
>
> VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT:
> --------------------------------------------------------------
>         rasterizationOrderColorAttachmentAccess   =3D true
>         rasterizationOrderDepthAttachmentAccess   =3D true
>         rasterizationOrderStencilAttachmentAccess =3D true
>
> VkPhysicalDeviceRobustness2FeaturesEXT:
> ---------------------------------------
>         robustBufferAccess2 =3D true
>         robustImageAccess2  =3D true
>         nullDescriptor      =3D true
>
> VkPhysicalDeviceShaderAtomicFloat2FeaturesEXT:
> ----------------------------------------------
>         shaderBufferFloat16Atomics      =3D false
>         shaderBufferFloat16AtomicAdd    =3D false
>         shaderBufferFloat16AtomicMinMax =3D false
>         shaderBufferFloat32AtomicMinMax =3D true
>         shaderBufferFloat64AtomicMinMax =3D false
>         shaderSharedFloat16Atomics      =3D false
>         shaderSharedFloat16AtomicAdd    =3D false
>         shaderSharedFloat16AtomicMinMax =3D false
>         shaderSharedFloat32AtomicMinMax =3D true
>         shaderSharedFloat64AtomicMinMax =3D false
>         shaderImageFloat32AtomicMinMax  =3D true
>         sparseImageFloat32AtomicMinMax  =3D false
>
> VkPhysicalDeviceShaderAtomicFloatFeaturesEXT:
> ---------------------------------------------
>         shaderBufferFloat32Atomics   =3D true
>         shaderBufferFloat32AtomicAdd =3D true
>         shaderBufferFloat64Atomics   =3D false
>         shaderBufferFloat64AtomicAdd =3D false
>         shaderSharedFloat32Atomics   =3D true
>         shaderSharedFloat32AtomicAdd =3D true
>         shaderSharedFloat64Atomics   =3D false
>         shaderSharedFloat64AtomicAdd =3D false
>         shaderImageFloat32Atomics    =3D true
>         shaderImageFloat32AtomicAdd  =3D true
>         sparseImageFloat32Atomics    =3D false
>         sparseImageFloat32AtomicAdd  =3D false
>
> VkPhysicalDeviceShaderClockFeaturesKHR:
> ---------------------------------------
>         shaderSubgroupClock =3D true
>         shaderDeviceClock   =3D true
>
> VkPhysicalDeviceShaderObjectFeaturesEXT:
> ----------------------------------------
>         shaderObject =3D true
>
> VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT:
> ------------------------------------------------
>         texelBufferAlignment =3D true
>
> VkPhysicalDeviceTransformFeedbackFeaturesEXT:
> ---------------------------------------------
>         transformFeedback =3D true
>         geometryStreams   =3D true
>
> VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR:
> --------------------------------------------------
>         vertexAttributeInstanceRateDivisor     =3D true
>         vertexAttributeInstanceRateZeroDivisor =3D true
>
> VkPhysicalDeviceVertexInputDynamicStateFeaturesEXT:
> ---------------------------------------------------
>         vertexInputDynamicState =3D true
>
> VkPhysicalDeviceVulkan11Features:
> ---------------------------------
>         storageBuffer16BitAccess           =3D true
>         uniformAndStorageBuffer16BitAccess =3D true
>         storagePushConstant16              =3D true
>         storageInputOutput16               =3D false
>         multiview                          =3D true
>         multiviewGeometryShader            =3D true
>         multiviewTessellationShader        =3D true
>         variablePointersStorageBuffer      =3D true
>         variablePointers                   =3D true
>         protectedMemory                    =3D false
>         samplerYcbcrConversion             =3D true
>         shaderDrawParameters               =3D true
>
> VkPhysicalDeviceVulkan12Features:
> ---------------------------------
>         samplerMirrorClampToEdge                           =3D true
>         drawIndirectCount                                  =3D true
>         storageBuffer8BitAccess                            =3D true
>         uniformAndStorageBuffer8BitAccess                  =3D true
>         storagePushConstant8                               =3D true
>         shaderBufferInt64Atomics                           =3D true
>         shaderSharedInt64Atomics                           =3D true
>         shaderFloat16                                      =3D true
>         shaderInt8                                         =3D true
>         descriptorIndexing                                 =3D true
>         shaderInputAttachmentArrayDynamicIndexing          =3D true
>         shaderUniformTexelBufferArrayDynamicIndexing       =3D true
>         shaderStorageTexelBufferArrayDynamicIndexing       =3D true
>         shaderUniformBufferArrayNonUniformIndexing         =3D true
>         shaderSampledImageArrayNonUniformIndexing          =3D true
>         shaderStorageBufferArrayNonUniformIndexing         =3D true
>         shaderStorageImageArrayNonUniformIndexing          =3D true
>         shaderInputAttachmentArrayNonUniformIndexing       =3D true
>         shaderUniformTexelBufferArrayNonUniformIndexing    =3D true
>         shaderStorageTexelBufferArrayNonUniformIndexing    =3D true
>         descriptorBindingUniformBufferUpdateAfterBind      =3D true
>         descriptorBindingSampledImageUpdateAfterBind       =3D true
>         descriptorBindingStorageImageUpdateAfterBind       =3D true
>         descriptorBindingStorageBufferUpdateAfterBind      =3D true
>         descriptorBindingUniformTexelBufferUpdateAfterBind =3D true
>         descriptorBindingStorageTexelBufferUpdateAfterBind =3D true
>         descriptorBindingUpdateUnusedWhilePending          =3D true
>         descriptorBindingPartiallyBound                    =3D true
>         descriptorBindingVariableDescriptorCount           =3D true
>         runtimeDescriptorArray                             =3D true
>         samplerFilterMinmax                                =3D true
>         scalarBlockLayout                                  =3D true
>         imagelessFramebuffer                               =3D true
>         uniformBufferStandardLayout                        =3D true
>         shaderSubgroupExtendedTypes                        =3D true
>         separateDepthStencilLayouts                        =3D true
>         hostQueryReset                                     =3D true
>         timelineSemaphore                                  =3D true
>         bufferDeviceAddress                                =3D true
>         bufferDeviceAddressCaptureReplay                   =3D false
>         bufferDeviceAddressMultiDevice                     =3D false
>         vulkanMemoryModel                                  =3D true
>         vulkanMemoryModelDeviceScope                       =3D true
>         vulkanMemoryModelAvailabilityVisibilityChains      =3D true
>         shaderOutputViewportIndex                          =3D true
>         shaderOutputLayer                                  =3D true
>         subgroupBroadcastDynamicId                         =3D true
>
> VkPhysicalDeviceVulkan13Features:
> ---------------------------------
>         robustImageAccess                                  =3D true
>         inlineUniformBlock                                 =3D true
>         descriptorBindingInlineUniformBlockUpdateAfterBind =3D true
>         pipelineCreationCacheControl                       =3D true
>         privateData                                        =3D true
>         shaderDemoteToHelperInvocation                     =3D true
>         shaderTerminateInvocation                          =3D true
>         subgroupSizeControl                                =3D true
>         computeFullSubgroups                               =3D true
>         synchronization2                                   =3D true
>         textureCompressionASTC_HDR                         =3D false
>         shaderZeroInitializeWorkgroupMemory                =3D true
>         dynamicRendering                                   =3D true
>         shaderIntegerDotProduct                            =3D true
>         maintenance4                                       =3D true
>
> VkPhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT:
> -------------------------------------------------
>         ycbcr2plane444Formats =3D true
>
> VkPhysicalDeviceYcbcrImageArraysFeaturesEXT:
> --------------------------------------------
>         ycbcrImageArrays =3D true
>
>
> --
> 2.45.1.288.g0e0cd299f1-goog
>

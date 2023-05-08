Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBA46FB52A
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 18:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C19310E2E2;
	Mon,  8 May 2023 16:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id E81A410E2D8;
 Mon,  8 May 2023 16:34:58 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:52156.536084247
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 1D4D21000E7;
 Tue,  9 May 2023 00:34:49 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-85667d6c59-6qwzn with ESMTP id
 91234223621345caa0824c695adad8f9 for chenhuacai@loongson.cn; 
 Tue, 09 May 2023 00:34:56 CST
X-Transaction-ID: 91234223621345caa0824c695adad8f9
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <12123b79-d680-4ed4-d14f-fedd0eb73b29@189.cn>
Date: Tue, 9 May 2023 00:34:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [V3] drm/amdgpu/display: Enable DC_FP for LoongArch
From: Sui Jingfeng <15330273260@189.cn>
To: Huacai Chen <chenhuacai@loongson.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>
References: <20230508030941.476694-1-chenhuacai@loongson.cn>
 <1b888568-b1f4-c764-7212-5a940fb8454a@189.cn>
Content-Language: en-US
In-Reply-To: <1b888568-b1f4-c764-7212-5a940fb8454a@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: loongson-kernel@lists.loongnix.cn, WANG Xuerui <kernel@xen0n.name>,
 Xuefeng Li <lixuefeng@loongson.cn>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have tested glmark2 on ls3a5000 with this patch applied,

I have also bought a better gpu (vega 56), which is on the way.

currently only have a rx550 at hand.

I pasted the performance score here, how about this score?

Does this looks normal?


glmark2
=======================================================
     glmark2 2021.12
=======================================================
     OpenGL Information
     GL_VENDOR:     AMD
     GL_RENDERER:   AMD Radeon RX 550 / 550 Series (polaris12, LLVM 
14.0.6, DRM 3.52, 6.4.0-rc1+)
     GL_VERSION:    4.6 (Compatibility Profile) Mesa 23.0.0
=======================================================
[build] use-vbo=false: FPS: 4408 FrameTime: 0.227 ms
[build] use-vbo=true: FPS: 7474 FrameTime: 0.134 ms
[texture] texture-filter=nearest: FPS: 7096 FrameTime: 0.141 ms
[texture] texture-filter=linear: FPS: 7400 FrameTime: 0.135 ms
[texture] texture-filter=mipmap: FPS: 7392 FrameTime: 0.135 ms
[shading] shading=gouraud: FPS: 7442 FrameTime: 0.134 ms
[shading] shading=blinn-phong-inf: FPS: 7417 FrameTime: 0.135 ms
[shading] shading=phong: FPS: 7396 FrameTime: 0.135 ms
[shading] shading=cel: FPS: 6804 FrameTime: 0.147 ms
[bump] bump-render=high-poly: FPS: 6789 FrameTime: 0.147 ms
[bump] bump-render=normals: FPS: 7159 FrameTime: 0.140 ms
[bump] bump-render=height: FPS: 7177 FrameTime: 0.139 ms
[effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 7674 FrameTime: 0.130 ms
[effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 3783 FrameTime: 
0.264 ms
[pulsar] light=false:quads=5:texture=false: FPS: 5684 FrameTime: 0.176 ms
[desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4: 
FPS: 3631 FrameTime: 0.275 ms
[desktop] effect=shadow:windows=4: FPS: 3730 FrameTime: 0.268 ms
[buffer] 
columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=map: 
FPS: 492 FrameTime: 2.033 ms
[buffer] 
columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=subdata: 
FPS: 551 FrameTime: 1.815 ms
[buffer] 
columns=200:interleave=true:update-dispersion=0.9:update-fraction=0.5:update-method=map: 
FPS: 1103 FrameTime: 0.907 ms
[ideas] speed=duration: FPS: 3298 FrameTime: 0.303 ms
[jellyfish] <default>: FPS: 5440 FrameTime: 0.184 ms
[terrain] <default>:   FPS: 731 FrameTime: 1.368 ms
[shadow] <default>: FPS: 5963 FrameTime: 0.168 ms
[refract] <default>: FPS: 1384 FrameTime: 0.723 ms
[conditionals] fragment-steps=0:vertex-steps=0: FPS: 7454 FrameTime: 
0.134 ms
[conditionals] fragment-steps=5:vertex-steps=0: FPS: 7460 FrameTime: 
0.134 ms
[conditionals] fragment-steps=0:vertex-steps=5: FPS: 7469 FrameTime: 
0.134 ms
[function] fragment-complexity=low:fragment-steps=5: FPS: 7401 
FrameTime: 0.135 ms
[function] fragment-complexity=medium:fragment-steps=5:  FPS: 7302 
FrameTime: 0.137 ms
[loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 6979 
FrameTime: 0.143 ms
[loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 6416 
FrameTime: 0.156 ms
[loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 7423 
FrameTime: 0.135 ms
=======================================================
                                   glmark2 Score: 5615
=======================================================


On 2023/5/8 23:46, Sui Jingfeng wrote:
> Nice patch!
>
>
> I have tested this patch on ls3a5000+ls7a2000+AMDGPU RX550, but it 
> seems that dc_fpu_begin() and
>
> dc_fpu_end() will not be called on AMDGPU RX550. But it at least 
> proved that
>
> this patch does not introduce bugs to what already works.
>
>
> I can proved that after apply this patch,  glmark2 still works like a 
> charm.
>
> fbtest and kms_flip test also run very well.
>
>
> On 2023/5/8 11:09, Huacai Chen wrote:
>> LoongArch now provides kernel_fpu_begin() and kernel_fpu_end() that are
>> used like the x86 counterparts in commit 2b3bd32ea3a22ea2d ("LoongArch:
>> Provide kernel fpu functions"), so we can enable DC_FP on LoongArch for
>> supporting more DCN devices.
>>
>> Signed-off-by: WANG Xuerui <kernel@xen0n.name>
>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> ---
>> V2: Update commit message to add the commit which provides kernel fpu
>>      functions.
>> V3: Update commit message again and rebase on the latest code.
>>
>>   drivers/gpu/drm/amd/display/Kconfig            | 2 +-
>>   drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 6 ++++--
>>   drivers/gpu/drm/amd/display/dc/dml/Makefile    | 5 +++++
>>   3 files changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/Kconfig 
>> b/drivers/gpu/drm/amd/display/Kconfig
>> index 2d8e55e29637..49df073962d5 100644
>> --- a/drivers/gpu/drm/amd/display/Kconfig
>> +++ b/drivers/gpu/drm/amd/display/Kconfig
>> @@ -8,7 +8,7 @@ config DRM_AMD_DC
>>       depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
>>       select SND_HDA_COMPONENT if SND_HDA_CORE
>>       # !CC_IS_CLANG: 
>> https://github.com/ClangBuiltLinux/linux/issues/1752
>> -    select DRM_AMD_DC_FP if (X86 || (PPC64 && ALTIVEC) || (ARM64 && 
>> KERNEL_MODE_NEON && !CC_IS_CLANG))
>> +    select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) 
>> || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
>>       help
>>         Choose this option if you want to use the new display engine
>>         support for AMDGPU. This adds required support for Vega and
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>> index c42aa947c969..172aa10a8800 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>> @@ -33,6 +33,8 @@
>>   #include <asm/cputable.h>
>>   #elif defined(CONFIG_ARM64)
>>   #include <asm/neon.h>
>> +#elif defined(CONFIG_LOONGARCH)
>> +#include <asm/fpu.h>
>>   #endif
>>     /**
>> @@ -88,7 +90,7 @@ void dc_fpu_begin(const char *function_name, const 
>> int line)
>>       *pcpu += 1;
>>         if (*pcpu == 1) {
>> -#if defined(CONFIG_X86)
>> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>>           migrate_disable();
>>           kernel_fpu_begin();
>>   #elif defined(CONFIG_PPC64)
>> @@ -128,7 +130,7 @@ void dc_fpu_end(const char *function_name, const 
>> int line)
>>       pcpu = get_cpu_ptr(&fpu_recursion_depth);
>>       *pcpu -= 1;
>>       if (*pcpu <= 0) {
>> -#if defined(CONFIG_X86)
>> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>>           kernel_fpu_end();
>>           migrate_enable();
>>   #elif defined(CONFIG_PPC64)
>> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile 
>> b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> index 01db035589c5..77cf5545c94c 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> @@ -38,6 +38,11 @@ ifdef CONFIG_ARM64
>>   dml_rcflags := -mgeneral-regs-only
>>   endif
>>   +ifdef CONFIG_LOONGARCH
>> +dml_ccflags := -mfpu=64
>> +dml_rcflags := -msoft-float
>> +endif
>> +
>>   ifdef CONFIG_CC_IS_GCC
>>   ifneq ($(call gcc-min-version, 70100),y)
>>   IS_OLD_GCC = 1

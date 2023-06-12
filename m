Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DDF72CEB7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 20:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B7410E2BD;
	Mon, 12 Jun 2023 18:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2754710E2BD;
 Mon, 12 Jun 2023 18:51:43 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Dx_+s+aYdkcf8DAA--.8648S3;
 Tue, 13 Jun 2023 02:51:42 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxbMo9aYdkTP4WAA--.57509S3; 
 Tue, 13 Jun 2023 02:51:41 +0800 (CST)
Message-ID: <d4b8254e-888b-31d4-ec18-560fed2c3c2a@loongson.cn>
Date: Tue, 13 Jun 2023 02:51:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [V3] drm/amdgpu/display: Enable DC_FP for LoongArch
To: Huacai Chen <chenhuacai@loongson.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>
References: <20230508030941.476694-1-chenhuacai@loongson.cn>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230508030941.476694-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxbMo9aYdkTP4WAA--.57509S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGry3AFy3try5Cw15CryrKrX_yoW5uw1rpa
 1ktFWjgr4kJF42v3yrAF1j9FZ8J3Z5JFW0kFyUAwn8ua48Aw4kGrZ0krs8trZrWF47A3yS
 qFn7WrWavFn0yrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
 xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07URa0PU
 UUUU=
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

Hi,

On 2023/5/8 11:09, Huacai Chen wrote:
> LoongArch now provides kernel_fpu_begin() and kernel_fpu_end() that are
> used like the x86 counterparts in commit 2b3bd32ea3a22ea2d ("LoongArch:
> Provide kernel fpu functions"), so we can enable DC_FP on LoongArch for
> supporting more DCN devices.
>
> Signed-off-by: WANG Xuerui <kernel@xen0n.name>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>


Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>


> ---
> V2: Update commit message to add the commit which provides kernel fpu
>      functions.
> V3: Update commit message again and rebase on the latest code.
>
>   drivers/gpu/drm/amd/display/Kconfig            | 2 +-
>   drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 6 ++++--
>   drivers/gpu/drm/amd/display/dc/dml/Makefile    | 5 +++++
>   3 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index 2d8e55e29637..49df073962d5 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -8,7 +8,7 @@ config DRM_AMD_DC
>   	depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
>   	select SND_HDA_COMPONENT if SND_HDA_CORE
>   	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
> -	select DRM_AMD_DC_FP if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
> +	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
>   	help
>   	  Choose this option if you want to use the new display engine
>   	  support for AMDGPU. This adds required support for Vega and
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> index c42aa947c969..172aa10a8800 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -33,6 +33,8 @@
>   #include <asm/cputable.h>
>   #elif defined(CONFIG_ARM64)
>   #include <asm/neon.h>
> +#elif defined(CONFIG_LOONGARCH)
> +#include <asm/fpu.h>
>   #endif
>   
>   /**
> @@ -88,7 +90,7 @@ void dc_fpu_begin(const char *function_name, const int line)
>   	*pcpu += 1;
>   
>   	if (*pcpu == 1) {
> -#if defined(CONFIG_X86)
> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>   		migrate_disable();
>   		kernel_fpu_begin();
>   #elif defined(CONFIG_PPC64)
> @@ -128,7 +130,7 @@ void dc_fpu_end(const char *function_name, const int line)
>   	pcpu = get_cpu_ptr(&fpu_recursion_depth);
>   	*pcpu -= 1;
>   	if (*pcpu <= 0) {
> -#if defined(CONFIG_X86)
> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>   		kernel_fpu_end();
>   		migrate_enable();
>   #elif defined(CONFIG_PPC64)
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 01db035589c5..77cf5545c94c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -38,6 +38,11 @@ ifdef CONFIG_ARM64
>   dml_rcflags := -mgeneral-regs-only
>   endif
>   
> +ifdef CONFIG_LOONGARCH
> +dml_ccflags := -mfpu=64
> +dml_rcflags := -msoft-float
> +endif
> +
>   ifdef CONFIG_CC_IS_GCC
>   ifneq ($(call gcc-min-version, 70100),y)
>   IS_OLD_GCC = 1

-- 
Jingfeng


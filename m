Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D5809E3B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 09:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849E710EA19;
	Fri,  8 Dec 2023 08:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10D610E161
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 04:49:55 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-77f3159d822so69861385a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 20:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1702010995; x=1702615795; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Siq5/aLB+N8os3ShA228wuqtqMbftMOZ84Ddlbg3k10=;
 b=a7YJCcOLBwjt6/FKb3aQB3yNqnRRlz352KXCXaQXQiGKmhSjpoBSVBGSVuoOscTYyd
 mbUJpM2BFN8jtzlkLxZIj12mTVqopZFTwAAuDKBCqbQyJ1DJGIkrfe6U45HB3X+lQ7e/
 uUHm2BSi3DkF2dlXdbLzpY/Yn3Ti1oHnNE9J4swNleTClYt1c8WJE1M2vXTkn8wlsRl9
 Xcdy2Vj2qER/pvDMiZ6XRVfgkl7Fqj/q4QU/8y8q5DLDx4nw0okayjEwiqJazFxaPhff
 YaJadAKmbFrld15DfgCvY5YOAPqUicIAkxewLVrmeLG5l74i3f3hNPsoiclnbDVlAG1S
 ojHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702010995; x=1702615795;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Siq5/aLB+N8os3ShA228wuqtqMbftMOZ84Ddlbg3k10=;
 b=Suwy7V7L7QsygAPnHwKI+MPiOT3Uz7dmWLM2b7y/oc6CRP4R0qVXO8Kh/I78cVRDI7
 G3WRsrq9hg1w995BHSZ03g3bc3WH/YXgmGHMSpHudDnBHb8S/PEhYDNG+l5wNZVBQkjQ
 4yEcZHEXOIDXIEg0AQfIztJ8MKpG1EheH1Zexe0i8rFo+dfpi5d5xmtTzycwxUwDcreY
 7QGZWlE7T2HurUslNDEMBTRueIwHKNEFqtIr40wk/QM272UwTKjexz9bqxg7YVoKcpip
 RUv7Z50mB9ocbFWF/DKL/HjibIlFQOJtiYexyNCvSSGAoFcoe5CnSN7vlxW1W+ExrwwZ
 dnwQ==
X-Gm-Message-State: AOJu0YxyCta2tYW60uup3jsqt0WNdMG8bgHCrb7zPB70mdK1HEmhK9nU
 gRFzihXgWNWLwbaMDnJhMHbOow==
X-Google-Smtp-Source: AGHT+IFZn6XnJPcvVcVddGixsOUuewR/YlITPthokCfZLM+Gy+wdFy5aCuBE/cobBs7DetgZyfJ9UA==
X-Received: by 2002:a05:620a:1a8a:b0:77f:338c:a713 with SMTP id
 bl10-20020a05620a1a8a00b0077f338ca713mr2602110qkb.62.1702010994966; 
 Thu, 07 Dec 2023 20:49:54 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:41c5:bf1:860b:1e95?
 ([2600:1700:2000:b002:41c5:bf1:860b:1e95])
 by smtp.gmail.com with ESMTPSA id
 ov11-20020a05620a628b00b0077f05db2663sm430776qkn.66.2023.12.07.20.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 20:49:54 -0800 (PST)
Message-ID: <6d4cecd5-9083-4d68-a7e2-266dae9e3952@sifive.com>
Date: Thu, 7 Dec 2023 22:49:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <ZV2+f/yu3C6xTVqn@infradead.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZV2+f/yu3C6xTVqn@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 08 Dec 2023 08:35:22 +0000
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Nicolas Schier <nicolas@fjasle.eu>, Will Deacon <will@kernel.org>,
 linux-kbuild@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Pan Xinhui <Xinhui.Pan@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Alex Deucher <alexander.deucher@amd.com>,
 linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph,

On 2023-11-22 2:40 AM, Christoph Hellwig wrote:
>> -	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
>> +	select DRM_AMD_DC_FP if ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG
>> +	select DRM_AMD_DC_FP if PPC64 && ALTIVEC
>> +	select DRM_AMD_DC_FP if RISCV && FPU
>> +	select DRM_AMD_DC_FP if LOONGARCH || X86
> 
> This really is a mess.  Can you add a ARCH_HAS_KERNEL_FPU_SUPPORT
> symbol that all architetures that have it select instead, and them
> make DRM_AMD_DC_FP depend on it?

Yes, I have done this for v2, which I will send shortly.

>> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV)
>>  		kernel_fpu_begin();
>>  #elif defined(CONFIG_PPC64)
>>  		if (cpu_has_feature(CPU_FTR_VSX_COMP))
>> @@ -122,7 +124,7 @@ void dc_fpu_end(const char *function_name, const int line)
>>  
>>  	depth = __this_cpu_dec_return(fpu_recursion_depth);
>>  	if (depth == 0) {
>> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV)
>>  		kernel_fpu_end();
>>  #elif defined(CONFIG_PPC64)
>>  		if (cpu_has_feature(CPU_FTR_VSX_COMP))
> 
> And then this mess can go away.  We'll need to decide if we want to
> cover all the in-kernel vector support as part of it, which would
> seem reasonable to me, or have a separate generic kernel_vector_begin
> with it's own option.

I think we may want to keep vector separate for performance on architectures
with separate FP and vector register files. For now, I have limited my changes
to FPU support only, which means I have removed VSX/Altivec from here; the
AMDGPU code doesn't need Altivec anyway.

>> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> index ea7d60f9a9b4..5c8f840ef323 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> @@ -43,6 +43,12 @@ dml_ccflags := -mfpu=64
>>  dml_rcflags := -msoft-float
>>  endif
>>  
>> +ifdef CONFIG_RISCV
>> +include $(srctree)/arch/riscv/Makefile.isa
>> +# Remove V from the ISA string, like in arch/riscv/Makefile, but keep F and D.
>> +dml_ccflags := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
>> +endif
>> +
>>  ifdef CONFIG_CC_IS_GCC
>>  ifneq ($(call gcc-min-version, 70100),y)
>>  IS_OLD_GCC = 1
> 
> And this is again not really something we should be doing.
> Instead we need a generic way in Kconfig to enable FPU support
> for an object file or set of, that the arch support can hook
> into.

I've included this in v2 as well.

> Btw, I'm also really worried about folks using the FPU instructions
> outside the kernel_fpu_begin/end windows in general (not directly
> related to the RISC-V support).  Can we have objecttool checks
> for that similar to only allowing the unsafe uaccess in the
> uaccess begin/end pairs?

ARM partially enforces this at compile time: it disallows calling
kernel_neon_begin() inside a translation unit that has NEON enabled. That
doesn't prevent the programmer from calling a FPU-enabled function from outside
a begin/end section, but it does prevent the compiler from generating unexpected
FPU usage behind your back. I implemented this same functionality for RISC-V.

Actually tracking all possibly-FPU-tainted functions and their call sites is
probably possible, but a much larger task.

Regards,
Samuel


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB66905E43
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 00:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BF610E1C7;
	Wed, 12 Jun 2024 22:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="hIEyHhfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F36610E1C7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 22:12:01 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-62f8dcbd4b5so4595837b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 15:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1718230320; x=1718835120;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ppMASZ0eIvj/5FKG8wqGN0hZDHJf87zO9TYcK304HR8=;
 b=hIEyHhfYACqqc1X8kPG0LlYDz0kOmA01/Pj33A8wuE4RemMEZpKzU51Kis62pgrYSi
 6tqf8fWqzpI4+qPuse0akw+FUHcTVJuMFntruYDbtnxuadIz5lsV5aWlkHY7iy/SJ7cN
 orBzuasfvP5HMfHVviYKBOgbKFgXlZ+e5RMRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718230320; x=1718835120;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ppMASZ0eIvj/5FKG8wqGN0hZDHJf87zO9TYcK304HR8=;
 b=F7RehCQvFSa0ZU08lBI1PWyGzLpWifX6J6H6J7u57Y7fDMe7/7LBMcUzuVuycQctlU
 FdY8eCow9NHcvixNnZcmkkRunRy8mqgTGy2qTrKTjjq5K7EXUhbzayF45Lq/sCn7igOp
 3jKceYb4p4CANMAgkt3UzMtmjNwU1Ex2h8IvPVJVtLbSxf+wfEBzYJpPu6xmTOJtWI0k
 doHpgGS0OPdbsNvOSrB4viszz1d0dVHmONOzWVfjVekV3SbVbG43SJCF4eq7D26zGaet
 ccavJFXDnb0m4+ozD1ZLxQ+vVj2IpqTKSiRVE5QEzBb9rixYkm2YzKvu78XvC21iA5aM
 EN2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSukAmEMn5Nb/yhdIiszHp5pOiS0W3oj8v559tGFGDnM1Tu5s0ZxczgUjpQZZN+/Eshk+Q6DAvi5CSbu+P6tdEs6h0vezqe2yg2sBXYwlQ
X-Gm-Message-State: AOJu0YzfsR5Vu75OYPG3RU2atBpNt74UiftE2UH0i88usMVMULC3hIjY
 DmZas2H9Fgs/p4MzvOG79Byc4qI5KTw4TANAmfWdtQQKF1tayWkLXICLXlBBbQ==
X-Google-Smtp-Source: AGHT+IHxzFYt0pq6Y+fA/dKuwJmOWcF4JS7vsNenIyDqRHigG6xvvdGFEw4nNPdEDBg7cQUt9d+mQg==
X-Received: by 2002:a0d:ee45:0:b0:627:c0ab:22b9 with SMTP id
 00721157ae682-62fb847de6emr29993107b3.21.1718230319867; 
 Wed, 12 Jun 2024 15:11:59 -0700 (PDT)
Received: from [192.168.0.212] ([50.35.46.55])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5c20435sm309356d6.49.2024.06.12.15.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 15:11:59 -0700 (PDT)
Message-ID: <d366491d-2f5b-478c-8968-b0a3a298827c@broadcom.com>
Date: Wed, 12 Jun 2024 15:11:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/8] x86/vmware: Introduce VMware hypercall API
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 bp@alien8.de, hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Cc: x86@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com
References: <3d6ec46c-53c2-4a13-90ff-eb419863c1d5@broadcom.com>
 <20240606232334.41384-1-alexey.makhalov@broadcom.com>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <20240606232334.41384-1-alexey.makhalov@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Borislav, please review v11 implementation of 1/8 based on your proposal.
I'm waiting for your feedback before sending full v11 patchset.
Thanks,
--Alexey

On 6/6/24 4:23 PM, Alexey Makhalov wrote:
> Introduce vmware_hypercall family of functions. It is a common
> implementation to be used by the VMware guest code and virtual
> device drivers in architecture independent manner.
> 
> The API consists of vmware_hypercallX and vmware_hypercall_hb_{out,in}
> set of functions by analogy with KVM hypercall API. Architecture
> specific implementation is hidden inside.
> 
> It will simplify future enhancements in VMware hypercalls such
> as SEV-ES and TDX related changes without needs to modify a
> caller in device drivers code.
> 
> Current implementation extends an idea from commit bac7b4e84323
> ("x86/vmware: Update platform detection code for VMCALL/VMMCALL
> hypercalls") to have a slow, but safe path vmware_hypercall_slow()
> earlier during the boot when alternatives are not yet applied.
> The code inherits VMWARE_CMD logic from the commit mentioned above.
> 
> Move common macros from vmware.c to vmware.h.
> 
> Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
> ---
>   arch/x86/include/asm/vmware.h | 279 ++++++++++++++++++++++++++++++++--
>   arch/x86/kernel/cpu/vmware.c  |  58 ++++++-
>   2 files changed, 315 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
> index ac9fc51e2b18..724c8b9b4b8d 100644
> --- a/arch/x86/include/asm/vmware.h
> +++ b/arch/x86/include/asm/vmware.h
> @@ -7,26 +7,277 @@
>   #include <linux/stringify.h>
>   
>   /*
> - * The hypercall definitions differ in the low word of the %edx argument
> - * in the following way: the old port base interface uses the port
> - * number to distinguish between high- and low bandwidth versions.
> + * VMware hypercall ABI.
> + *
> + * - Low bandwidth (LB) hypercalls (I/O port based, vmcall and vmmcall)
> + * have up to 6 input and 6 output arguments passed and returned using
> + * registers: %eax (arg0), %ebx (arg1), %ecx (arg2), %edx (arg3),
> + * %esi (arg4), %edi (arg5).
> + * The following input arguments must be initialized by the caller:
> + * arg0 - VMWARE_HYPERVISOR_MAGIC
> + * arg2 - Hypercall command
> + * arg3 bits [15:0] - Port number, LB and direction flags
> + *
> + * - High bandwidth (HB) hypercalls are I/O port based only. They have
> + * up to 7 input and 7 output arguments passed and returned using
> + * registers: %eax (arg0), %ebx (arg1), %ecx (arg2), %edx (arg3),
> + * %esi (arg4), %edi (arg5), %ebp (arg6).
> + * The following input arguments must be initialized by the caller:
> + * arg0 - VMWARE_HYPERVISOR_MAGIC
> + * arg1 - Hypercall command
> + * arg3 bits [15:0] - Port number, HB and direction flags
> + *
> + * For compatibility purposes, x86_64 systems use only lower 32 bits
> + * for input and output arguments.
> + *
> + * The hypercall definitions differ in the low word of the %edx (arg3)
> + * in the following way: the old I/O port based interface uses the port
> + * number to distinguish between high- and low bandwidth versions, and
> + * uses IN/OUT instructions to define transfer direction.
>    *
>    * The new vmcall interface instead uses a set of flags to select
>    * bandwidth mode and transfer direction. The flags should be loaded
> - * into %dx by any user and are automatically replaced by the port
> - * number if the VMWARE_HYPERVISOR_PORT method is used.
> - *
> - * In short, new driver code should strictly use the new definition of
> - * %dx content.
> + * into arg3 by any user and are automatically replaced by the port
> + * number if the I/O port method is used.
> + */
> +
> +#define VMWARE_HYPERVISOR_HB		BIT(0)
> +#define VMWARE_HYPERVISOR_OUT		BIT(1)
> +
> +#define VMWARE_HYPERVISOR_PORT		0x5658
> +#define VMWARE_HYPERVISOR_PORT_HB	(VMWARE_HYPERVISOR_PORT | \
> +					 VMWARE_HYPERVISOR_HB)
> +
> +#define VMWARE_HYPERVISOR_MAGIC		0x564d5868U
> +
> +#define VMWARE_CMD_GETVERSION		10
> +#define VMWARE_CMD_GETHZ		45
> +#define VMWARE_CMD_GETVCPU_INFO		68
> +#define VMWARE_CMD_STEALCLOCK		91
> +
> +#define CPUID_VMWARE_FEATURES_ECX_VMMCALL	BIT(0)
> +#define CPUID_VMWARE_FEATURES_ECX_VMCALL	BIT(1)
> +
> +extern unsigned long vmware_hypercall_slow(unsigned long cmd,
> +					   unsigned long in1, unsigned long in3,
> +					   unsigned long in4, unsigned long in5,
> +					   u32 *out1, u32 *out2, u32 *out3,
> +					   u32 *out4, u32 *out5);
> +
> +/*
> + * The low bandwidth call. The low word of %edx is presumed to have OUT bit
> + * set. The high word of %edx may contain input data from the caller.
>    */
> +#define VMWARE_HYPERCALL					\
> +	ALTERNATIVE_2("movw %[port], %%dx\n\t"			\
> +		      "inl (%%dx), %%eax",			\
> +		      "vmcall", X86_FEATURE_VMCALL,		\
> +		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
> +
> +static inline
> +unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
> +{
> +	unsigned long out0;
> +
> +	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
> +		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
> +					     NULL, NULL, NULL, NULL, NULL);
> +
> +	asm_inline volatile (VMWARE_HYPERCALL
> +		: "=a" (out0)
> +		: [port] "i" (VMWARE_HYPERVISOR_PORT),
> +		  "a" (VMWARE_HYPERVISOR_MAGIC),
> +		  "b" (in1),
> +		  "c" (cmd),
> +		  "d" (0)
> +		: "cc", "memory");
> +	return out0;
> +}
> +
> +static inline
> +unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
> +				u32 *out1, u32 *out2)
> +{
> +	unsigned long out0;
> +
> +	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
> +		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
> +					     out1, out2, NULL, NULL, NULL);
> +
> +	asm_inline volatile (VMWARE_HYPERCALL
> +		: "=a" (out0), "=b" (*out1), "=c" (*out2)
> +		: [port] "i" (VMWARE_HYPERVISOR_PORT),
> +		  "a" (VMWARE_HYPERVISOR_MAGIC),
> +		  "b" (in1),
> +		  "c" (cmd),
> +		  "d" (0)
> +		: "cc", "memory");
> +	return out0;
> +}
> +
> +static inline
> +unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
> +				u32 *out1, u32 *out2, u32 *out3)
> +{
> +	unsigned long out0;
> +
> +	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
> +		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
> +					     out1, out2, out3, NULL, NULL);
> +
> +	asm_inline volatile (VMWARE_HYPERCALL
> +		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
> +		: [port] "i" (VMWARE_HYPERVISOR_PORT),
> +		  "a" (VMWARE_HYPERVISOR_MAGIC),
> +		  "b" (in1),
> +		  "c" (cmd),
> +		  "d" (0)
> +		: "cc", "memory");
> +	return out0;
> +}
> +
> +static inline
> +unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
> +				unsigned long in3, unsigned long in4,
> +				unsigned long in5, u32 *out2)
> +{
> +	unsigned long out0;
> +
> +	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
> +		return vmware_hypercall_slow(cmd, in1, in3, in4, in5,
> +					     NULL, out2, NULL, NULL, NULL);
> +
> +	asm_inline volatile (VMWARE_HYPERCALL
> +		: "=a" (out0), "=c" (*out2)
> +		: [port] "i" (VMWARE_HYPERVISOR_PORT),
> +		  "a" (VMWARE_HYPERVISOR_MAGIC),
> +		  "b" (in1),
> +		  "c" (cmd),
> +		  "d" (in3),
> +		  "S" (in4),
> +		  "D" (in5)
> +		: "cc", "memory");
> +	return out0;
> +}
> +
> +static inline
> +unsigned long vmware_hypercall6(unsigned long cmd, unsigned long in1,
> +				unsigned long in3, u32 *out2,
> +				u32 *out3, u32 *out4, u32 *out5)
> +{
> +	unsigned long out0;
> +
> +	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
> +		return vmware_hypercall_slow(cmd, in1, in3, 0, 0,
> +					     NULL, out2, out3, out4, out5);
> +
> +	asm_inline volatile (VMWARE_HYPERCALL
> +		: "=a" (out0), "=c" (*out2), "=d" (*out3), "=S" (*out4),
> +		  "=D" (*out5)
> +		: [port] "i" (VMWARE_HYPERVISOR_PORT),
> +		  "a" (VMWARE_HYPERVISOR_MAGIC),
> +		  "b" (in1),
> +		  "c" (cmd),
> +		  "d" (in3)
> +		: "cc", "memory");
> +	return out0;
> +}
> +
> +static inline
> +unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
> +				unsigned long in3, unsigned long in4,
> +				unsigned long in5, u32 *out1,
> +				u32 *out2, u32 *out3)
> +{
> +	unsigned long out0;
> +
> +	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
> +		return vmware_hypercall_slow(cmd, in1, in3, in4, in5,
> +					     out1, out2, out3, NULL, NULL);
> +
> +	asm_inline volatile (VMWARE_HYPERCALL
> +		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
> +		: [port] "i" (VMWARE_HYPERVISOR_PORT),
> +		  "a" (VMWARE_HYPERVISOR_MAGIC),
> +		  "b" (in1),
> +		  "c" (cmd),
> +		  "d" (in3),
> +		  "S" (in4),
> +		  "D" (in5)
> +		: "cc", "memory");
> +	return out0;
> +}
> +
> +#ifdef CONFIG_X86_64
> +#define VMW_BP_CONSTRAINT "r"
> +#else
> +#define VMW_BP_CONSTRAINT "m"
> +#endif
> +
> +/*
> + * High bandwidth calls are not supported on encrypted memory guests.
> + * The caller should check cc_platform_has(CC_ATTR_MEM_ENCRYPT) and use
> + * low bandwidth hypercall if memory encryption is set.
> + * This assumption simplifies HB hypercall implementation to just I/O port
> + * based approach without alternative patching.
> + */
> +static inline
> +unsigned long vmware_hypercall_hb_out(unsigned long cmd, unsigned long in2,
> +				      unsigned long in3, unsigned long in4,
> +				      unsigned long in5, unsigned long in6,
> +				      u32 *out1)
> +{
> +	unsigned long out0;
> +
> +	asm_inline volatile (
> +		UNWIND_HINT_SAVE
> +		"push %%" _ASM_BP "\n\t"
> +		UNWIND_HINT_UNDEFINED
> +		"mov %[in6], %%" _ASM_BP "\n\t"
> +		"rep outsb\n\t"
> +		"pop %%" _ASM_BP "\n\t"
> +		UNWIND_HINT_RESTORE
> +		: "=a" (out0), "=b" (*out1)
> +		: "a" (VMWARE_HYPERVISOR_MAGIC),
> +		  "b" (cmd),
> +		  "c" (in2),
> +		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
> +		  "S" (in4),
> +		  "D" (in5),
> +		  [in6] VMW_BP_CONSTRAINT (in6)
> +		: "cc", "memory");
> +	return out0;
> +}
>   
> -/* Old port-based version */
> -#define VMWARE_HYPERVISOR_PORT    0x5658
> -#define VMWARE_HYPERVISOR_PORT_HB 0x5659
> +static inline
> +unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
> +				     unsigned long in3, unsigned long in4,
> +				     unsigned long in5, unsigned long in6,
> +				     u32 *out1)
> +{
> +	unsigned long out0;
>   
> -/* Current vmcall / vmmcall version */
> -#define VMWARE_HYPERVISOR_HB   BIT(0)
> -#define VMWARE_HYPERVISOR_OUT  BIT(1)
> +	asm_inline volatile (
> +		UNWIND_HINT_SAVE
> +		"push %%" _ASM_BP "\n\t"
> +		UNWIND_HINT_UNDEFINED
> +		"mov %[in6], %%" _ASM_BP "\n\t"
> +		"rep insb\n\t"
> +		"pop %%" _ASM_BP "\n\t"
> +		UNWIND_HINT_RESTORE
> +		: "=a" (out0), "=b" (*out1)
> +		: "a" (VMWARE_HYPERVISOR_MAGIC),
> +		  "b" (cmd),
> +		  "c" (in2),
> +		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
> +		  "S" (in4),
> +		  "D" (in5),
> +		  [in6] VMW_BP_CONSTRAINT (in6)
> +		: "cc", "memory");
> +	return out0;
> +}
> +#undef VMW_BP_CONSTRAINT
> +#undef VMWARE_HYPERCALL
>   
>   /* The low bandwidth call. The low word of edx is presumed clear. */
>   #define VMWARE_HYPERCALL						\
> diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
> index 11f83d07925e..533ac2d1de88 100644
> --- a/arch/x86/kernel/cpu/vmware.c
> +++ b/arch/x86/kernel/cpu/vmware.c
> @@ -41,17 +41,9 @@
>   
>   #define CPUID_VMWARE_INFO_LEAF               0x40000000
>   #define CPUID_VMWARE_FEATURES_LEAF           0x40000010
> -#define CPUID_VMWARE_FEATURES_ECX_VMMCALL    BIT(0)
> -#define CPUID_VMWARE_FEATURES_ECX_VMCALL     BIT(1)
>   
> -#define VMWARE_HYPERVISOR_MAGIC	0x564D5868
> -
> -#define VMWARE_CMD_GETVERSION    10
> -#define VMWARE_CMD_GETHZ         45
> -#define VMWARE_CMD_GETVCPU_INFO  68
>   #define VMWARE_CMD_LEGACY_X2APIC  3
>   #define VMWARE_CMD_VCPU_RESERVED 31
> -#define VMWARE_CMD_STEALCLOCK    91
>   
>   #define STEALCLOCK_NOT_AVAILABLE (-1)
>   #define STEALCLOCK_DISABLED        0
> @@ -110,6 +102,56 @@ struct vmware_steal_time {
>   static unsigned long vmware_tsc_khz __ro_after_init;
>   static u8 vmware_hypercall_mode     __ro_after_init;
>   
> +unsigned long vmware_hypercall_slow(unsigned long cmd,
> +				    unsigned long in1, unsigned long in3,
> +				    unsigned long in4, unsigned long in5,
> +				    u32 *out1, u32 *out2, u32 *out3,
> +				    u32 *out4, u32 *out5)
> +{
> +	unsigned long out0;
> +
> +	switch (vmware_hypercall_mode) {
> +	case CPUID_VMWARE_FEATURES_ECX_VMCALL:
> +		asm_inline volatile ("vmcall"
> +				: "=a" (out0), "=b" (*out1), "=c" (*out2),
> +				"=d" (*out3), "=S" (*out4), "=D" (*out5)
> +				: "a" (VMWARE_HYPERVISOR_MAGIC),
> +				"b" (in1),
> +				"c" (cmd),
> +				"d" (in3),
> +				"S" (in4),
> +				"D" (in5)
> +				: "cc", "memory");
> +		break;
> +	case CPUID_VMWARE_FEATURES_ECX_VMMCALL:
> +		asm_inline volatile ("vmmcall"
> +				: "=a" (out0), "=b" (*out1), "=c" (*out2),
> +				"=d" (*out3), "=S" (*out4), "=D" (*out5)
> +				: "a" (VMWARE_HYPERVISOR_MAGIC),
> +				"b" (in1),
> +				"c" (cmd),
> +				"d" (in3),
> +				"S" (in4),
> +				"D" (in5)
> +				: "cc", "memory");
> +		break;
> +	default:
> +		asm_inline volatile ("movw %[port], %%dx; inl (%%dx), %%eax"
> +				: "=a" (out0), "=b" (*out1), "=c" (*out2),
> +				"=d" (*out3), "=S" (*out4), "=D" (*out5)
> +				: [port] "i" (VMWARE_HYPERVISOR_PORT),
> +				"a" (VMWARE_HYPERVISOR_MAGIC),
> +				"b" (in1),
> +				"c" (cmd),
> +				"d" (in3),
> +				"S" (in4),
> +				"D" (in5)
> +				: "cc", "memory");
> +		break;
> +	}
> +	return out0;
> +}
> +
>   static inline int __vmware_platform(void)
>   {
>   	uint32_t eax, ebx, ecx, edx;

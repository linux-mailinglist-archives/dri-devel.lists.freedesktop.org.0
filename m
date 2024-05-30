Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8FA8D426D
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 02:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D4410E144;
	Thu, 30 May 2024 00:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="P5M+j9LJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6C910E144
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 00:44:39 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-70231ac9093so127567b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 17:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1717029879; x=1717634679;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rCzRJkj1CS92P5UL4N6EIOsMjdv4mGiz9WlXzg9a4rQ=;
 b=P5M+j9LJFfk2Twsok9pBmX43X0BRgVYApKL8LLiLnxAJb1AswT8qCQRRgfb+PTpZRR
 m86dnz3ZIAV8sNaWuKvQxQ06SQbk56P7loo3TpOjp90WpQf0B2c7tLLppx2fErlVJHuW
 IBH3wtqz2ylvxTUluL+4jh7nUwFQCY1wMcIf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717029879; x=1717634679;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rCzRJkj1CS92P5UL4N6EIOsMjdv4mGiz9WlXzg9a4rQ=;
 b=wK3Dyr7kjJQmBW28V2c7oeeI6F4vZiJG+opDXje85qULFQD4PW3/tcNt+T54oxMyVH
 rVkRtzooOXNv2mFCfgBY1uUAAtWNuvHChGKWQYv8OvkZMbxpJCtBJ5FjpTnlldp8+06j
 668jxxniEfTgoWLka7vwhR/8xOmWdiwqPVErSCv7CsJww5hpeHRYB0wXYOG5PEK44gBA
 +NLuHkUfA6Oki3eZ7cun8jCdK4baBAl8Ivaqr5W1+5ygenkO+NSeffEWTCIhX29jToza
 lsBwgs9fF04WhcxS3s33TgEj4A3e9GgwJIZGHOO1Zftpz6nAgyOEUdqwtEqqS4WUOLVJ
 z6Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8pxLdTNNhzOywU0Fosvcw8ZCNPDaJUF2xAMO6jYOpEm7ir9eLfFpi/+QtXOpuHRbqFK+4zb9R9RQWnzzwn0F8Cy3lA3LZgCceyRShkhza
X-Gm-Message-State: AOJu0YyAE9kI53YToF1q7fyX9Hu1I27rmG/APJEefpLyWvxlx6b0Js9/
 /Io7i4hDrXCYfTS3EtoPqnVkYaYg4quPHYKv1t/cf89FLZaGlCrMOCA7XLXLMg==
X-Google-Smtp-Source: AGHT+IHwDMLSgDYOlyi5QH1JnmlZc4CE2Nq6P0ZJpWRVppHjw0PEH3ZRBVrPALS2TxI2l35Jt0vyPw==
X-Received: by 2002:a05:6a20:9752:b0:1b1:f6a9:6b31 with SMTP id
 adf61e73a8af0-1b26460c771mr556508637.61.1717029878514; 
 Wed, 29 May 2024 17:44:38 -0700 (PDT)
Received: from [10.66.192.68] ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f93d308732sm8304742b3a.101.2024.05.29.17.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 17:44:38 -0700 (PDT)
Message-ID: <9ca6230c-740c-4f1a-8fdf-73f74cf025a1@broadcom.com>
Date: Wed, 29 May 2024 17:44:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/8] x86/vmware: Introduce VMware hypercall API
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de, x86@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com
References: <20240523191446.54695-1-alexey.makhalov@broadcom.com>
 <20240523191446.54695-2-alexey.makhalov@broadcom.com>
 <20240527170734.GCZlS91uXD68HRN1na@fat_crate.local>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <20240527170734.GCZlS91uXD68HRN1na@fat_crate.local>
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



On 5/27/24 10:07 AM, Borislav Petkov wrote:
> On Thu, May 23, 2024 at 12:14:39PM -0700, Alexey Makhalov wrote:
>> +#define VMWARE_HYPERCALL						\
>> +	ALTERNATIVE_3("",						\
>> +		      "jmp .Lport_call%=", X86_FEATURE_HYPERVISOR,	\
>> +		      "jmp .Lvmcall%=", X86_FEATURE_VMCALL,		\
>> +		      "vmmcall\n\t"					\
>> +		      "jmp .Lend%=", X86_FEATURE_VMW_VMMCALL)		\
>> +		      "cmpb $"						\
>> +			__stringify(CPUID_VMWARE_FEATURES_ECX_VMMCALL)	\
>> +			", %[mode]\n\t"					\
>> +		      "jg .Lvmcall%=\n\t"				\
>> +		      "je .Lvmmcall%=\n\t"				\
>> +		      ".Lport_call%=: movw %[port], %%dx\n\t"		\
>> +		      "inl (%%dx), %%eax\n\t"				\
>> +		      "jmp .Lend%=\n\t"					\
>> +		      ".Lvmmcall%=: vmmcall\n\t"			\
>> +		      "jmp .Lend%=\n\t"					\
>> +		      ".Lvmcall%=: vmcall\n\t"				\
>> +		      ".Lend%=:"
> 
> So applied (and with minor fixups for the proper indentation, see end of
> this mail) this looks like this:
> 
> .pushsection .altinstructions,"a"
>   .long 661b - .
>   .long 6641f - .
>   .4byte ( 4*32+31)
>   .byte 663b-661b
>   .byte 6651f-6641f
>   .long 661b - .
>   .long 6642f - .
>   .4byte ( 8*32+18)
>   .byte 663b-661b
>   .byte 6652f-6642f
>   .long 661b - .
>   .long 6643f - .
>   .4byte ( 8*32+19)
>   .byte 663b-661b
>   .byte 6653f-6643f
> .popsection
> .pushsection .altinstr_replacement, "ax"
> # ALT: replacement 1
> 6641:
>          jmp .Lport_call72
> 6651:
> # ALT: replacement 2
> 6642:
>          jmp .Lvmcall72
> 6652:
> # ALT: replacement 3
> 6643:
>          vmmcall
>          jmp .Lend72
> 6653:
> .popsection
>          cmpb $((((1UL))) << (0)), vmware_hypercall_mode(%rip)   # vmware_hypercall_mode
>          jg .Lvmcall72
>          je .Lvmmcall72
> .Lport_call72:
>          movw $22104, %dx        #
>          inl (%dx), %eax
>          jmp .Lend72
> .Lvmmcall72:
>          vmmcall
>          jmp .Lend72
> .Lvmcall72:
>          vmcall
> .Lend72:
> 
> ---
> 
> so AFAICT, you want three things:
> 
> 1. X86_FEATURE_HYPERVISOR - that is always set when running as a guest.
>     For that it should do:
> 
>          movw $22104, %dx        #
>          inl (%dx), %eax
> 
> 2. X86_FEATURE_VMCALL:
> 
> 	vmcall
> 
> 3. X86_FEATURE_VMW_VMMCALL:
> 
> 	vmmcall
> 
> So why don't you simply do that?
> 
> vmware_set_capabilities() sets vmware_hypercall_mode *and* those feature
> flags at the same time.
> 
> And you either support VMCALL or VMMCALL so the first thing should be the
> fallback for some ancient crap.
> 
> IOW, your hypercall alternative should simply be:
> 
> 	ALTERNATIVE_2("vmcall", "vmmcall", X86_FEATURE_VMW_VMMCALL, "movw %[port], %%dx; "inl (%%dx), %%eax", X86_FEATURE_HYPERVISOR);
> 
> without any more silly dance?
While most of the vmware_hypercall callers are executed after 
alternative patching applied, there are small amount of hypercalls 
running before that.
Only for them we have the logic of analyzing vmware_hypercall_mode as a 
default alternative code. And there are 2 constraints:
1. vmcall/vmmcall are not supported by old ESXi/Workstation/Fusion. We 
have to use in/out instructions. After the end of support of old 
hypervisors the alternative can be simplified as follow:
ALTERNATIVE("vmcall", "vmmcall", X86_FEATURE_VMW_VMMCALL);
2. SEV-ES enabled VMs should use _only_ vmcall/vmmcall as in/out 
instructions cause faults.

Another approach that we discussed internally was to use
ALTERNATIVE_2("movw %[port], %%dx; "inl (%%dx), %%eax", "vmcall", 
X86_FEATURE_VMW_VMCALL, "vmmcall", X86_FEATURE_VMW_VMMCALL) for 
vmware_hypercallX family of functions, _and_ to have a separate API
vmware_sev_hypercallX, with the silly dance without an alternative 
inside, to be used only by early boot code, before alternative 
application. But, it's error prone when things come to boot time related 
code movements or rearrangements as it puts additional requirement for 
SEV-ES understanding/testing for VMware guests.

So, we picked a safe solution until a deprecation of port based 
hypercalls, which was mentioned above.


See also a commit bac7b4e843232 ("x86/vmware: Update platform detection 
code for VMCALL/VMMCALL hypercalls") where silly dance was introduced 
with VMWARE_CMD macro.

> 
> Hmmm?
> 
> ---
> 
> Fixup indentation for proper .s output:
> 
> diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
> index 5114f4c75c54..8be877d8bb7c 100644
> --- a/arch/x86/include/asm/vmware.h
> +++ b/arch/x86/include/asm/vmware.h
> @@ -70,17 +70,18 @@ extern u8 vmware_hypercall_mode;
>   		      "jmp .Lvmcall%=", X86_FEATURE_VMCALL,		\
>   		      "vmmcall\n\t"					\
>   		      "jmp .Lend%=", X86_FEATURE_VMW_VMMCALL)		\
> -		      "cmpb $"						\
> -			__stringify(CPUID_VMWARE_FEATURES_ECX_VMMCALL)	\
> -			", %[mode]\n\t"					\
> +		      "\tcmpb $" __stringify(CPUID_VMWARE_FEATURES_ECX_VMMCALL) ", %[mode]\n\t" \
Noted \t prefix before cmpb, but will keep original 3 lines to fit in 80 
columns limit.

>   		      "jg .Lvmcall%=\n\t"				\
> -		      "je .Lvmmcall%=\n\t"				\
> -		      ".Lport_call%=: movw %[port], %%dx\n\t"		\
> +		      "je .Lvmmcall%=\n"				\
> +		      ".Lport_call%=:\n\t"				\
> +		      "movw %[port], %%dx\n\t"				\
Noted having labels on a separate line.
>   		      "inl (%%dx), %%eax\n\t"				\
> -		      "jmp .Lend%=\n\t"					\
> -		      ".Lvmmcall%=: vmmcall\n\t"			\
> -		      "jmp .Lend%=\n\t"					\
> -		      ".Lvmcall%=: vmcall\n\t"				\
> +		      "jmp .Lend%=\n"					\
> +		      ".Lvmmcall%=:\n\t"				\
> +		      "vmmcall\n\t"					\
> +		      "jmp .Lend%=\n"					\
> +		      ".Lvmcall%=:\n\t"					\
> +		      "vmcall\n"					\
>   		      ".Lend%=:"
>   
>   static inline
> 
> 
Best regards,
--Alexey

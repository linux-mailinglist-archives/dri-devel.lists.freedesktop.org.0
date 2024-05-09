Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4CD8C1A01
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 01:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E673D10E05C;
	Thu,  9 May 2024 23:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="KpnIozH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C906310E05C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 23:42:04 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1ec41d82b8bso13109055ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 16:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715298124; x=1715902924;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qcQ+E1QA8l+ah/ENXdvarlO1w5eDBmEI+kx8d052/jY=;
 b=KpnIozH4JH3QnMSMtNUwIQwSW+P6mPM52kKPpu4+4+1GwzhanZ8mP+GYEjzoWHX8fY
 /WXksEhsybtjsmXYjY7/a4Fs2HLCt9+ozQLbDVuY73arSVg/bDGjHQBIFOh8ZyQkPiDk
 kUb+QvwSZL6LVU2SD+HaJbQ6dZx7sqkCTAk9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715298124; x=1715902924;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qcQ+E1QA8l+ah/ENXdvarlO1w5eDBmEI+kx8d052/jY=;
 b=ni8CcbbbMNRGqfN8SuqWKmOvfh1P+Hm/9ridNC6ni1wkXISOhrbFJd9F5z/MeRgkhf
 6CbXZSb+18LCErvbMUuqSuyQvFn2Qs/qPmBpLWFJzS8BSdTnE3UxaK/SmQNyKdgIp8TJ
 bEN5cYOdaC6sdA7j96e5m+KVOM/fIMjpEJszv4xpFdcuFHHnS1jdtccnsOj1gHDkGPk1
 Esphb9FBR4fHEJNXjbrQfkqVAexgjisEEUl4djy5lVZEYtDwIPJwMYKgj9KmQk86jtJn
 KgKY7WyFMQ6zxwsgjDYZobSfdDPV/1J7TF2IT0NoIRwdZGWCMJ1KLUZoGxv0sYbWG0Eh
 P/Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXwFv6OWrciXnUJDepwvZZmVdikWdM0iCik/LihQQjintK4Zi45/dAWltUhcmoAIA8sD3ZsnNnG0OceZz1igG+G/jPWMiIn45QOpJGMsEW
X-Gm-Message-State: AOJu0YwbYqPZHPZzh43miMU5LhR9tvAHu3AwhhBYTFcPD0QvCsKOcglF
 EnkYE4jmQoQjq3HYDLUoLAyArSpmcuaTSvg9Yyy7ML24CtatTeZ1qVEtHMZKuA==
X-Google-Smtp-Source: AGHT+IEUXVntNOdIl0JFIcu3FbFOnabVgHUgiNiHs/V/L6l5se4Qx1VFF0gI5J1ocymcGEaLDXx4BQ==
X-Received: by 2002:a17:903:120e:b0:1e4:6519:816d with SMTP id
 d9443c01a7336-1ef43f51feamr13083235ad.48.1715298124022; 
 Thu, 09 May 2024 16:42:04 -0700 (PDT)
Received: from [10.62.14.240] ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0b9d176fsm19965805ad.58.2024.05.09.16.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 16:42:03 -0700 (PDT)
Message-ID: <a503d8b3-d31c-46e9-a4a2-538312e850c5@broadcom.com>
Date: Thu, 9 May 2024 16:42:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/8] x86/vmware: Introduce VMware hypercall API
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
 kirill.shutemov@linux.intel.com, Nadav Amit <nadav.amit@gmail.com>,
 Jeff Sipek <jsipek@vmware.com>
References: <20240505182829.GBZjfPzeEijTsBUth5@fat_crate.local>
 <20240506215305.30756-1-alexey.makhalov@broadcom.com>
 <20240506215305.30756-4-alexey.makhalov@broadcom.com>
 <20240507095852.GVZjn7XM0VMXzBfKsd@fat_crate.local>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <20240507095852.GVZjn7XM0VMXzBfKsd@fat_crate.local>
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



On 5/7/24 2:58 AM, Borislav Petkov wrote:
> On Mon, May 06, 2024 at 02:53:00PM -0700, Alexey Makhalov wrote:
>> +#define VMWARE_HYPERCALL						\
>> +	ALTERNATIVE_3("cmpb $"						\
>> +			__stringify(CPUID_VMWARE_FEATURES_ECX_VMMCALL)	\
>> +			", %[mode]\n\t"					\
>> +		      "jg 2f\n\t"					\
>> +		      "je 1f\n\t"					\
>> +		      "movw %[port], %%dx\n\t"				\
>> +		      "inl (%%dx), %%eax\n\t"				\
>> +		      "jmp 3f\n\t"					\
>> +		      "1: vmmcall\n\t"					\
>> +		      "jmp 3f\n\t"					\
>> +		      "2: vmcall\n\t"					\
>> +		      "3:\n\t",						\
>> +		      "movw %[port], %%dx\n\t"				\
>> +		      "inl (%%dx), %%eax", X86_FEATURE_HYPERVISOR,	\
> 
> That's a bunch of insns and their size would inadvertently go into the final
> image.
> 
> What you should try to do is something like this:
> 
> ALTERNATIVE_3("jmp .Lend_legacy_call", "", X86_FEATURE_HYPERVISOR,
> 	      "vmcall; jmp .Lend_legacy_call", X86_FEATURE_VMCALL,
> 	      "vmmcall; jmp .Lend_legacy_call", X86_FEATURE_VMW_VMMCALL)
> 
> 		/* bunch of conditional branches and INs and V*MCALLs, etc go here */
> 
> 		.Lend_legacy_call:
> 
> so that you don't have these 26 bytes, as you say, of alternatives to patch but
> only the JMPs and the VM*CALLs.
> 
> See for an example the macros in arch/x86/entry/calling.h which simply jump
> over the code when not needed.
Good idea!

> 
> Also, you could restructure the alternative differently so that that bunch of
> insns call is completely out-of-line because all current machines support
> VM*CALL so you won't even need to patch. You only get to patch when running on
> some old rust and there you can just as well go completely out-of-line.
> 
Alternatives patching has not been performed at platform detection time.
And platform detection hypercalls should work on all machines.
That is the reason we have IN as a default hypercall behavior.

> Something along those lines, anyway.
> 
>> - * The high bandwidth in call. The low word of edx is presumed to have the
>> - * HB bit set.
>> + * High bandwidth calls are not supported on encrypted memory guests.
>> + * The caller should check cc_platform_has(CC_ATTR_MEM_ENCRYPT) and use
>> + * low bandwidth hypercall it memory encryption is set.
> 
> s/it/if/
Acked.

> 
>> -#define VMWARE_PORT(cmd, eax, ebx, ecx, edx)				\
>> -	__asm__("inl (%%dx), %%eax" :					\
>> -		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
>> -		"a"(VMWARE_HYPERVISOR_MAGIC),				\
>> -		"c"(VMWARE_CMD_##cmd),					\
>> -		"d"(VMWARE_HYPERVISOR_PORT), "b"(UINT_MAX) :		\
>> -		"memory")
>> -
>> -#define VMWARE_VMCALL(cmd, eax, ebx, ecx, edx)				\
>> -	__asm__("vmcall" :						\
>> -		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
>> -		"a"(VMWARE_HYPERVISOR_MAGIC),				\
>> -		"c"(VMWARE_CMD_##cmd),					\
>> -		"d"(0), "b"(UINT_MAX) :					\
>> -		"memory")
>> -
>> -#define VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx)				\
>> -	__asm__("vmmcall" :						\
>> -		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
>> -		"a"(VMWARE_HYPERVISOR_MAGIC),				\
>> -		"c"(VMWARE_CMD_##cmd),					\
>> -		"d"(0), "b"(UINT_MAX) :					\
>> -		"memory")
>> -
>> -#define VMWARE_CMD(cmd, eax, ebx, ecx, edx) do {		\
>> -	switch (vmware_hypercall_mode) {			\
>> -	case CPUID_VMWARE_FEATURES_ECX_VMCALL:			\
>> -		VMWARE_VMCALL(cmd, eax, ebx, ecx, edx);		\
>> -		break;						\
>> -	case CPUID_VMWARE_FEATURES_ECX_VMMCALL:			\
>> -		VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx);	\
>> -		break;						\
>> -	default:						\
>> -		VMWARE_PORT(cmd, eax, ebx, ecx, edx);		\
>> -		break;						\
>> -	}							\
>> -	} while (0)
> 
> You're kidding, right?
> 
> You went to all that trouble in patch 1 to move those to the header only to
> *remove* them here?
> 
> You do realize that that is a unnecessary churn for no good reason, right?
> 
> So that set needs to be restructured differently.
> 
> * first patch introduces those new API calls.
> 
> * follow-on patches convert the callers to the new API
> 
> * last patch removes the old API.
> 
> Ok?
My intention was to have a implementation transformation from locals 
macro through common macros to common API.

What you are suggesting will eliminate unnecessary patches. It makes sense.

Will perform this restructuring in v10.

> 
> And when you redo them, make sure you drop all Reviewed-by tags because the new
> versions are not reviewed anymore.
Noted.

Thanks again,
--Alexey

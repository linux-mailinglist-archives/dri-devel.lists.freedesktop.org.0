Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7978B16E2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 01:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B6510E4DC;
	Wed, 24 Apr 2024 23:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Bq6ipplz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5F510E60E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 23:12:26 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-5d81b08d6f2so320271a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 16:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1714000346; x=1714605146;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=hPfScfPV1IGhG5jM7PoOqja5p4JBWAzPFYxIfUHs4Sw=;
 b=Bq6ipplz0tK+kegXPqjvubU/+ievJosVCeFvOnGvfMzzWttO5/IFi2YPm3xn0frQrT
 3Kx114Sn/JvXOwGBczGxNvd9f0ytr3lCW3q34c1TDBRSu+UNrcs+/LybaOcwweTbiWfV
 Mb9pKemTlYsUVq4yBdVxCTRWr4LwwndIuJKQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714000346; x=1714605146;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hPfScfPV1IGhG5jM7PoOqja5p4JBWAzPFYxIfUHs4Sw=;
 b=qu5HAsLJ0MT8sdhI83JTa68UpIKHf0671N5oxMaF+VnKbZiXzD60XJTRXIgbVEUpEc
 O9YnvV5Kr6EZqGj4EKlk/Ezj9Qyi5yfFrvfoA7U5yv3YfNdiB3XABs5msV2J13vAFn1r
 GPmcWVZRh9bq0/6BPBnk8wsGh2cdr0BrzX7KSm09fZvqGJzbfalJh0KUjv3MAw+fWmdY
 drn5ntadAt6yrN+UtnFtHN4YiLDApdJ4WN47skF0oDwdQZ86N9bMOet/yXccEL/2/g9U
 r6fTMLjml1TkPAGRjpTi/4IeA8WMAG2FqdRM8iE8JTwdIHuil7ExsqQL0lifmZbb8mLC
 m7Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBZJeAZCz1Z2tWcW1dbre0kjdtvlF6Uc6UPMaCjrJIRomdPR+GdCLvVX2fcx1nSd9/E4Z/96yGZU0YSVhybw5mte9WYoN8ZfDFYT/ykedC
X-Gm-Message-State: AOJu0YytjA44o7b0mrpSvRB0c2ezn3a3EX//oB2FGmZO8vl5lTXPWRDj
 w3KJyzzNeq8/rKt4891JFWHlfBq9cVrz61Srl0TT9vwKW1Vi4o5WP5Zk9grQSw==
X-Google-Smtp-Source: AGHT+IHk2hpMcHHpMlh3mlu02TpcJMcce1tmQffz3w+3HxPX6dyAB1i0Jya+cji1Ag1eQiAuZI6iXg==
X-Received: by 2002:a05:6a21:2720:b0:1ac:3a2c:b3b with SMTP id
 rm32-20020a056a21272000b001ac3a2c0b3bmr3799472pzb.12.1714000345872; 
 Wed, 24 Apr 2024 16:12:25 -0700 (PDT)
Received: from [10.62.14.176] ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1709027ed700b001d8f111804asm12670215plb.113.2024.04.24.16.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 16:12:25 -0700 (PDT)
Message-ID: <adcbfb9a-a4e1-4a32-b786-6c204d941e9f@broadcom.com>
Date: Wed, 24 Apr 2024 16:12:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/7] x86/vmware: Move common macros to vmware.h
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
 kirill.shutemov@linux.intel.com, Nadav Amit <nadav.amit@gmail.com>
References: <20240422225656.10309-1-alexey.makhalov@broadcom.com>
 <20240422225656.10309-2-alexey.makhalov@broadcom.com>
 <20240424160608.GFZikt8JLrTN4M5PG2@fat_crate.local>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <20240424160608.GFZikt8JLrTN4M5PG2@fat_crate.local>
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



On 4/24/24 9:06 AM, Borislav Petkov wrote:
> On Mon, Apr 22, 2024 at 03:56:50PM -0700, Alexey Makhalov wrote:
>> Move VMware hypercall macros to vmware.h. This is a prerequisite for
>> the introduction of vmware_hypercall API. No functional changes besides
>> exporting vmware_hypercall_mode symbol.
> 
> Well, I see more.
> 
> So code movement patches should be done this way:
> 
> * first patch: sole code movement, no changes whatsoever
> 
> * follow-on patches: add changes and explain them
> 
> Because... (follow me down)...
> 
>> @@ -476,8 +431,8 @@ static bool __init vmware_legacy_x2apic_available(void)
>>   {
>>   	uint32_t eax, ebx, ecx, edx;
>>   	VMWARE_CMD(GETVCPU_INFO, eax, ebx, ecx, edx);
>> -	return !(eax & BIT(VMWARE_CMD_VCPU_RESERVED)) &&
>> -		(eax & BIT(VMWARE_CMD_LEGACY_X2APIC));
>> +	return !(eax & BIT(VCPU_RESERVED)) &&
>> +		(eax & BIT(VCPU_LEGACY_X2APIC));
> 
> ... what is that change for?
> 
> Those bit definitions are clearly vmware-specific. So why are you
> changing them to something generic-ish?
> 
> In any case, this patch needs to be split as outlined above.

Thanks for prompt review. The concern is valid.
I've split this patch on 2 pieces:
1. Macro renaming - to use proper prefix GETVCPU_INFO_ instead of 
incorrect VMWARE_CMD_.
2. Code movement - the original idea of the patch.

Remaining patches will remain intact.

Thanks,
--Alexey

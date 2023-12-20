Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF929819728
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 04:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D7510E317;
	Wed, 20 Dec 2023 03:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D4610E317
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 03:30:06 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-28b9e9e83b0so1556745a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 19:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1703043005; x=1703647805;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sUq2OM1li7CxkIrkWDtdEiY2oiOCTUFA1jYnFMugiCM=;
 b=AtbCG4CLrjcYnUqa0aSknqahWf1DH9/BBTGLee9ejQSxz9dZtcDm9QzqkB0VX1sHkm
 uxKxainkgUa/yjnQ9sZXdl9T14ZDrTuWg8i6y8XpYImfnlX06f8HUAlXEB5GIaoIF7/X
 AIWd5+0obNn4iwovg5sC6byZ8RtpInQd69VFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703043005; x=1703647805;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sUq2OM1li7CxkIrkWDtdEiY2oiOCTUFA1jYnFMugiCM=;
 b=Yl49TSqGc8l3rTs8EvTZHeTDDUMnBo/8/Yc5wAnFht+kEMS4Ur8UWUi8kyxl/PNIsE
 jfFfDx1WqqXJ1Y1pmPHV24xYdbskXXkqqUsornX8Flw+JaxV3Kn0wxgzZHHAg4DNVDFG
 Z/XZZKdRfkpcDDZXmhEOrlK9m2kJEVqQ1reKRiM7SqiAYG5q7Glbj8RtH3B+iryzqAoc
 D97HE7uOfkC0sbXbXW2szw/OTTdqrWdVNODYE27cmVbod+r2EZsyNJXoPH23ctYx1i1u
 i/FpLLOcsvdwMdFgtwaAPEhqOOhpRS+8MYmmkIs0txKc100oFRhLqFLzlOWLZYW6iR49
 sSgQ==
X-Gm-Message-State: AOJu0YxONFEJAu/e8vl92e6VGNWjdjun7uJn3YxM5atH/FF9EggRz92e
 G4a9V1mPfbGRjmjKbhdkdi2PWw==
X-Google-Smtp-Source: AGHT+IEyUAv+ITNtl62B1KaAoSR3d91Ea/PTHOO2rzx6Z7ZW3/qRzKUylZEstlP7OvWBD6PwHNK7xg==
X-Received: by 2002:a17:902:d491:b0:1d3:6a11:1fbd with SMTP id
 c17-20020a170902d49100b001d36a111fbdmr7432822plg.118.1703043005517; 
 Tue, 19 Dec 2023 19:30:05 -0800 (PST)
Received: from [192.168.0.111] (d-174-140-102-53.fl.cpe.atlanticbb.net.
 [174.140.102.53]) by smtp.gmail.com with ESMTPSA id
 n16-20020a170903111000b001d3320f6143sm14934478plh.269.2023.12.19.19.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 19:30:05 -0800 (PST)
Message-ID: <e6a4d942-0711-4035-840b-9b2b116ae70c@broadcom.com>
Date: Tue, 19 Dec 2023 19:30:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] x86/vmware: Introduce vmware_hypercall API
Content-Language: en-US
To: kirill.shutemov@linux.intel.com
References: <20231219215751.9445-1-alexey.makhalov@broadcom.com>
 <20231219215751.9445-3-alexey.makhalov@broadcom.com>
 <20231219232023.u4dyuvbzbh565grk@box.shutemov.name>
 <75eed318-2d22-429d-ab95-80610ba82934@broadcom.com>
 <20231220005156.2rymnxu5bv6wdwlx@box.shutemov.name>
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <20231220005156.2rymnxu5bv6wdwlx@box.shutemov.name>
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
Cc: pv-drivers@vmware.com, dave.hansen@linux.intel.com,
 dri-devel@lists.freedesktop.org, namit@vmware.com, hpa@zytor.com,
 airlied@gmail.com, timothym@vmware.com, x86@kernel.org, mingo@redhat.com,
 linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
 tzimmermann@suse.de, richardcochran@gmail.com, virtualization@lists.linux.dev,
 mripard@kernel.org, akaher@vmware.com, bp@alien8.de, jsipek@vmware.com,
 tglx@linutronix.de, netdev@vger.kernel.org, dmitry.torokhov@gmail.com,
 linux-kernel@vger.kernel.org, horms@kernel.org, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/19/23 4:51 PM, kirill.shutemov@linux.intel.com wrote:
> On Tue, Dec 19, 2023 at 04:17:40PM -0800, Alexey Makhalov wrote:
>>
>>
>> On 12/19/23 3:20 PM, kirill.shutemov@linux.intel.com wrote:
>>> On Tue, Dec 19, 2023 at 01:57:47PM -0800, Alexey Makhalov wrote:
>>>> +static inline
>>>> +unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
>>> ...
>>>> +static inline
>>>> +unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
>>>> +				uint32_t *out1, uint32_t *out2)
>>> ...
>>>> +static inline
>>>> +unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
>>>> +				uint32_t *out1, uint32_t *out2,
>>>> +				uint32_t *out3)
>>> ...
>>>> +static inline
>>>> +unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
>>>> +				unsigned long in3, unsigned long in4,
>>>> +				unsigned long in5, uint32_t *out2)
>>> ...
>>>> +static inline
>>>> +unsigned long vmware_hypercall6(unsigned long cmd, unsigned long in1,
>>>> +				unsigned long in3, uint32_t *out2,
>>>> +				uint32_t *out3, uint32_t *out4,
>>>> +				uint32_t *out5)
>>> ...
>>>> +static inline
>>>> +unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
>>>> +				unsigned long in3, unsigned long in4,
>>>> +				unsigned long in5, uint32_t *out1,
>>>> +				uint32_t *out2, uint32_t *out3)
>>>
>>> Naming is weird. The number in the name doesn't help much as there seems
>>> no system on how many of the parameters are ins and outs.
>>
>> There was internal discussion on hypercall API naming. One of proposals was
>> using 2 digits - number of input and number of output arguments.
>> And it definitely looked weird. So, we agreed to have just single number  -
>> total number of arguments excluding cmd.
> 
> Have you considered naming them by number of input parameters? Number of
> output parameters as demanded by users.
> 
> So vmware_hypercall4() will become vmware_hypercall1() and current
> vmware_hypercall1() and vmware_hypercall3() will go away.
> 
> It is still awful, but /maybe/ better that this, I donno.
> 

Deprecating vmware_hypercall1 and vmware_hypercall3 in favor of 
vmware_hypercall4 will generate less efficient code for the caller of 
first ones.
Using current vmware_hypercall4 instead of vmware_hypercall1 will force 
the caller to allocate additional variables (register or on stack 
memory) for hypercall asm inline to put additional output registers on. 
And specifically to 'usage' of *out3 - compiler will unnecessary 
'clobber' useful rdx, when hypervisor will keep it unchanged.

Unfortunately VMware hypercall ABI is not as beautiful as KVM one, 
especially in number of output arguments and their ordering. rbp 
register usage as an argument is a separate bummer((. So we have to work 
with what we have.

Current set of functions includes only 6 functions (for LB), which is 
the optimum between readability, maintainability and performance. It 
covers all current kernel callers and all new callers from yet to be 
upstreamed patches that we have in Photon OS including 2 patches for x86 
and arm64 guest support.

Regards,
--Alexey

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429BCABED8A
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 10:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E88010E6B1;
	Wed, 21 May 2025 08:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="iVM4aFa2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A3B10E6B3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 08:06:49 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so51802855e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 01:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747814805; x=1748419605;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jk8Im1peoTeREjRLUX0UezyMuhGS2KJYCffxAr4+aAA=;
 b=iVM4aFa29ToaCmRZP3avSO8/ylfOJCxyNiTFc1q94BlZim2Xj9s8VDJtUx/GP5ymSl
 mzITF54Q/frr0Oh8CTJEFOHOVPzrBMkd58fMXmSqVwDP7M8D4Z0J1mPQ15HbzcDCE1NK
 +h4V+06QEXV4uaZ1M4Q8zlv7WYulg1uY3sSQSIhwDbOgdtoty3oJEjMlwcQdl4nYkhCm
 tfc70/h6z4l08R1ExyqUDCwAEOdy9/wT0QH901F7hKqgWAPTlSfp4Fyhd5OMza4aj3Bo
 hJaWxnvo1ILagUAOBaeWXoHiolzO9wsMfyLJK2yJyLedm4J0qvLKbAVS8nv/bfa/bATJ
 8TlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747814805; x=1748419605;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jk8Im1peoTeREjRLUX0UezyMuhGS2KJYCffxAr4+aAA=;
 b=oxd7/84ZCFRqE6F7k72gVLWNvwWde+PA+KVBnINoSTCg5exlRcZQb03HGTFaI1h3+1
 /qUVSIlLfPECNoQHIFB7JthSexrUZUfMJCcdKMbUmLy1zu/TEivnjYg78Q/UKxbQC7f0
 aTaXhfFqI73Io5kw1b+LONVHLNW+6pf+wnq6z20GiOHfExoa/lJrmdzsDfffDWbVVymi
 OeerHov6t9mKe4ZFL3IkbvRmr1bJ5PwaBIbrV1lbnHkNNGZmOPyrKdr2yj/EXavsP4MA
 dFRb+mUG6/eSffQKWOcM3rOHldMNLv4q4euEZosPkqf3tW+kI1wqY+bDSn6JlM43jvZX
 teBw==
X-Gm-Message-State: AOJu0YyrJOjzHCICGLGLXJpkDDTZINoKlSR4rx5zqpV7Ksu8K67sob0J
 HgS0KVMd/dcgLogTj/WFiSLVuAZSFvZ0+SeCXSv7mD4I/tCgfkM6kPheRqdUZvp0JLY=
X-Gm-Gg: ASbGnctHKi5jVUbsmnVZIajvf3IAck0q0WbTL4gm9bLUzHY4FgjEf4uOkI4gvh2wxSw
 KrqVmnQa0P0M/aQ1C8cIZ4aCooeOnfK7gj0Ggr4yRMTqSdghIEvCMoRmj8C53ixTwgqngG6fI9z
 RW4C94RkkcKf2Ia0s1LcJ46SdD76xDTE7uxlzwuSBJRV5ebE6pdxaEkmdFY4EB0BWv7eOOK1bbQ
 jo+/FpRwa5cPDT4ILmVtD5aSPWIkTurS+Sfs7aGzm/FDZNG1l2PVta8YfFCczapnGhoxKBP7pfS
 HzGCbVm/QyUibCyhdafG4i4YOuzPj3LV7MHXHXZjPYNaRYik3z2IAQYSmA+LSJrMQg==
X-Google-Smtp-Source: AGHT+IHg6iYaVQPf9CJWapfaxHxigQSgxdG2SgzXq5BKN69ZWgpDJO7ssWDUyZcJd5r77NG/Wjh2uA==
X-Received: by 2002:a05:600c:548c:b0:43d:fa58:700e with SMTP id
 5b1f17b1804b1-442fd6759c0mr150601925e9.33.1747814805161; 
 Wed, 21 May 2025 01:06:45 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f7d975cfsm62186235e9.38.2025.05.21.01.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 01:06:43 -0700 (PDT)
Message-ID: <b88bb6af-2215-4f1c-8e48-05f36957c6ab@ursulin.net>
Date: Wed, 21 May 2025 09:06:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/2] Introduce a sysfs interface for lmem information
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
 <174775327260.81385.8059929394366685323@jlahtine-mobl>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <174775327260.81385.8059929394366685323@jlahtine-mobl>
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


On 20/05/2025 16:01, Joonas Lahtinen wrote:
> (+ Tvrtko, Rodrigo and Jani)
> 
> Quoting Krzysztof Niemiec (2025-05-19 18:34:14)
>> Hi,
>>
>> This series introduces a way for applications to read local memory
>> information via files in the sysfs. So far the only way to do this was
>> via i915_query ioctl. This is slightly less handy than sysfs for
>> external users. Additionally, the ioctl has a capability check which
>> limits which users of a system might use it to get information.
>>
>> The goals of this series are:
>>
>>          1) Introduce a simpler interface to access lmem information,
>>          2) Lift the CAP_PERFMON check on that information, OR provide
>>             the administrator with a way to optionally lift it.
>>
>> The first patch introduces the general mechanism without protections.
>> This will effectively lift a capability check on obtaining the memory
>> information. The second patch introduces that check back inside the
>> _show() functions, but also adds a sysctl parameter allowing to override
>> the checks, if an administrator so decides.
>>
>> I'm sending this as RFC because I have a feeling that there's no
>> consensus whether memory information exposed in the patch should be
>> protected or not. Showing it to any user is strictly speaking an info
>> leak, but the severity thereof might be considered not that high, so I'd
>> rather leave it up to discussion first.
>>
>> If we decide for lifting the check, the first patch is sufficient.
> 
> Nack on that.
> 
> CPU memory footprint and GPU memory footprint have a very different
> nature. This was discussed to quite a length, please refer to mailing
> list archives.
> 
>> If we
>> decide against it, the second patch protects the information by default,
>> but with a way to expose it as a conscious decision of the admin. I find
>> it a decent compromise.
> 
> No need for the added complexity if we were to add a sysfs.
> 
> If a sysfs is added, it can be made root readable by default but system
> admin is free to chown or chmod the file for more relaxed access. Back
> in the original discussion time, this was omitted for lack of users.

Agreed, no need to complicate with redundant access controls in the kernel.

> Even now, userspace/sysadmin could already essentially use setuid helper
> process that will only report the memory statistics.
> 
> So I'm not really fully convinced this is needed at all.
> 
> And if it is to be added for the convenience of usersppace, it should
> probably then be considered to be a standard interface across DRM drivers
> ala fdinfo or cgroups.

Cgroup visibility for device memory exists in principle although i915 
hasn't been wired up to it.

For system memory (integrated GPUs) there is some work in progress 
around memcg accounting, although I am unsure if i915 would be 
automatically covered or not.

Also going a step back, from MangoHUDs point of view, I don't really see 
why total GPU memory is very interesting? I would have thought it is 
more interesting to know how much the monitored client is using, which 
is already available via fdinfo. Total memory sounds like something 
which it could leave to interpretation by the entity looking at the 
traces. (If the monitored client is running alone then total_free =~ 
total - client, and if it isn't running alone then it doesn't matter, no?)

Regards,

Tvrtko

>> This change has been requested in these parallel issues for i915 and Xe:
>>
>> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14153
>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4861
>>
>> Thanks
>> Krzysztof
>>
>> Krzysztof Niemiec (2):
>>    drm/i915: Expose local memory information via sysfs
>>    drm/i915: Add protections to sysfs local memory information
>>
>>   drivers/gpu/drm/i915/i915_sysfs.c          |   6 +
>>   drivers/gpu/drm/i915/intel_memory_region.c | 136 +++++++++++++++++++++
>>   drivers/gpu/drm/i915/intel_memory_region.h |   3 +
>>   3 files changed, 145 insertions(+)
>>
>> -- 
>> 2.45.2
>> _


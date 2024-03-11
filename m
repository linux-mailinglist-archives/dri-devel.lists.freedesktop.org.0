Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9868878660
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 18:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8508C112BD4;
	Mon, 11 Mar 2024 17:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E5oQp75c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFC2112BE0;
 Mon, 11 Mar 2024 17:35:48 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-29c16b324ecso649977a91.3; 
 Mon, 11 Mar 2024 10:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710178547; x=1710783347; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=ODj6J0HasoDCh7aA9/jnSDVtp5eVDPF40pjn5JyramI=;
 b=E5oQp75cgjBxQ64j3iSlN7FW7lEhLc39nnkdyvTRiKPdfp45ft2JK4WbCpZmAFYh/e
 7NTKsJvzkxrYKw0ME/np88UdqkaDSAOuxNBStNJfvKHvxh1D968foN8Ym81FsVqEpBc2
 +Oxb/z3VFKbTHtyIbZ4yy+jh6bQDTiHGdluzLq4fI6G3C7w8sSSL7VYm8GPtu5JHIxGH
 CSkw7biqrMJmd1JKZj5RPI4GC6ibxhuaNwza6e3ihNZ7yqR2j/Vz0pR6CiciAPGgG2qx
 uE1JmyAiS8N3ckip3OQXdtz5/BKxBsLaG0QFYMcRSHZfYbx6c/aUmuX5tJJq5yRHCWer
 c4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710178547; x=1710783347;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODj6J0HasoDCh7aA9/jnSDVtp5eVDPF40pjn5JyramI=;
 b=JweZRwSCOpP8xkw7MjkJoPdEA48aBkG9K2Ng6+Ur+S/WtcIiugpIAte68BYV7YVLqU
 Gac1duMUkXfjZFPN+njn7jlNFIRBfowhPrJr7RrxfGJnxuAi6+D5I8R93Zj8c6mHeqhX
 h6O35lJiLJLgpPwTWBh2LD8Qllu6CiRM8IkSTSqtaeUfJfpFOPOvYo55y18c1d0is+nx
 I62Dek6guqVuyvHye8A+secOYiiFjTqSNZUNhvvb+YhSUG8vGX+TfN2HkfqLimVWyPKd
 1shzLOkzScNCj8EN2rfwJ8tsR5ljFSNT0vEWJ6Tdxa2rzV4r96bE8os9TT/7BIasMBP0
 eWOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwYtroZCDz+xh968yFtM70TkUfquUiOtJvPAbcrdKc8DJGBWYnGHsBRBPSMMeEoJi361hsJINdUpD/EaR4GRT97LJMtC7ofM0KytxlF1cm
X-Gm-Message-State: AOJu0Yy3hQU+z6AKydL4jLwkYYhrqR79cZ86Ed/NGMIqNuEjJuIg3zdR
 w9E6rRpQYhm1oUu/ZeERYpToW/+mi/QH8cJ/dYHUWxvfp3N70Z2qXzM/o5zV
X-Google-Smtp-Source: AGHT+IGAeea1SLQ57waLxWthyK/wYe6cwXyd8kkohevK6Z3WHC1wsSAGZ9L4WeQq6Pv/N73Iw+o+Gg==
X-Received: by 2002:a17:90b:905:b0:29b:95a:baaa with SMTP id
 bo5-20020a17090b090500b0029b095abaaamr4698053pjb.47.1710178547436; 
 Mon, 11 Mar 2024 10:35:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a17090aad4900b0029b9c932b5dsm4438783pjv.29.2024.03.11.10.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 10:35:46 -0700 (PDT)
Message-ID: <cb72e724-232f-4134-befd-f3c7144e1105@roeck-us.net>
Date: Mon, 11 Mar 2024 10:35:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/hwmon: Fix locking inversion in sysfs getter
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Dale B Stimson <dale.b.stimson@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20240311080717.421152-2-janusz.krzysztofik@linux.intel.com>
 <Ze84MKyzFzTRq_Fm@intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Ze84MKyzFzTRq_Fm@intel.com>
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

On 3/11/24 09:58, Rodrigo Vivi wrote:
> On Mon, Mar 11, 2024 at 09:06:46AM +0100, Janusz Krzysztofik wrote:
>> In i915 hwmon sysfs getter path we now take a hwmon_lock, then acquire an
>> rpm wakeref.  That results in lock inversion:
>>
>> <4> [197.079335] ======================================================
>> <4> [197.085473] WARNING: possible circular locking dependency detected
>> <4> [197.091611] 6.8.0-rc7-Patchwork_129026v7-gc4dc92fb1152+ #1 Not tainted
>> <4> [197.098096] ------------------------------------------------------
>> <4> [197.104231] prometheus-node/839 is trying to acquire lock:
>> <4> [197.109680] ffffffff82764d80 (fs_reclaim){+.+.}-{0:0}, at: __kmalloc+0x9a/0x350
>> <4> [197.116939]
>> but task is already holding lock:
>> <4> [197.122730] ffff88811b772a40 (&hwmon->hwmon_lock){+.+.}-{3:3}, at: hwm_energy+0x4b/0x100 [i915]
>> <4> [197.131543]
>> which lock already depends on the new lock.
>> ...
>> <4> [197.507922] Chain exists of:
>>    fs_reclaim --> &gt->reset.mutex --> &hwmon->hwmon_lock
>> <4> [197.518528]  Possible unsafe locking scenario:
>> <4> [197.524411]        CPU0                    CPU1
>> <4> [197.528916]        ----                    ----
>> <4> [197.533418]   lock(&hwmon->hwmon_lock);
>> <4> [197.537237]                                lock(&gt->reset.mutex);
>> <4> [197.543376]                                lock(&hwmon->hwmon_lock);
>> <4> [197.549682]   lock(fs_reclaim);
>> ...
>> <4> [197.632548] Call Trace:
>> <4> [197.634990]  <TASK>
>> <4> [197.637088]  dump_stack_lvl+0x64/0xb0
>> <4> [197.640738]  check_noncircular+0x15e/0x180
>> <4> [197.652968]  check_prev_add+0xe9/0xce0
>> <4> [197.656705]  __lock_acquire+0x179f/0x2300
>> <4> [197.660694]  lock_acquire+0xd8/0x2d0
>> <4> [197.673009]  fs_reclaim_acquire+0xa1/0xd0
>> <4> [197.680478]  __kmalloc+0x9a/0x350
>> <4> [197.689063]  acpi_ns_internalize_name.part.0+0x4a/0xb0
>> <4> [197.694170]  acpi_ns_get_node_unlocked+0x60/0xf0
>> <4> [197.720608]  acpi_ns_get_node+0x3b/0x60
>> <4> [197.724428]  acpi_get_handle+0x57/0xb0
>> <4> [197.728164]  acpi_has_method+0x20/0x50
>> <4> [197.731896]  acpi_pci_set_power_state+0x43/0x120
>> <4> [197.736485]  pci_power_up+0x24/0x1c0
>> <4> [197.740047]  pci_pm_default_resume_early+0x9/0x30
>> <4> [197.744725]  pci_pm_runtime_resume+0x2d/0x90
>> <4> [197.753911]  __rpm_callback+0x3c/0x110
>> <4> [197.762586]  rpm_callback+0x58/0x70
>> <4> [197.766064]  rpm_resume+0x51e/0x730
>> <4> [197.769542]  rpm_resume+0x267/0x730
>> <4> [197.773020]  rpm_resume+0x267/0x730
>> <4> [197.776498]  rpm_resume+0x267/0x730
>> <4> [197.779974]  __pm_runtime_resume+0x49/0x90
>> <4> [197.784055]  __intel_runtime_pm_get+0x19/0xa0 [i915]
>> <4> [197.789070]  hwm_energy+0x55/0x100 [i915]
>> <4> [197.793183]  hwm_read+0x9a/0x310 [i915]
>> <4> [197.797124]  hwmon_attr_show+0x36/0x120
>> <4> [197.800946]  dev_attr_show+0x15/0x60
>> <4> [197.804509]  sysfs_kf_seq_show+0xb5/0x100
>>
>> However, the lock is only intended to protect either a hwmon overflow
>> counter or rmw hardware operations.  There is no need to hold the lock,
>> only the wakeref, while reading from hardware.
>>
>> Acquire the lock after hardware read under rpm wakeref.
>>
>> Fixes: c41b8bdcc297 ("drm/i915/hwmon: Show device level energy usage")
>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>> Cc: <stable@vger.kernel.org> # v6.2+
>> ---
>>   drivers/gpu/drm/i915/i915_hwmon.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
>> index 8c3f443c8347e..faf7670de6e06 100644
>> --- a/drivers/gpu/drm/i915/i915_hwmon.c
>> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
>> @@ -136,11 +136,11 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
>>   	else
>>   		rgaddr = hwmon->rg.energy_status_all;
>>   
>> -	mutex_lock(&hwmon->hwmon_lock);
>> -
>>   	with_intel_runtime_pm(uncore->rpm, wakeref)
>>   		reg_val = intel_uncore_read(uncore, rgaddr);
>>   
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
> 
> This is not enough.
> check hwm_locked_with_pm_intel_uncore_rmw()
> 
> It looks like we need to rethink this lock entirely here.
> 

I would have assumed that the lock was supposed to ensure that
reading the register value and the subsequent update of accum_energy
and reg_val_prev was synchronized. This is no longer the case
after this patch has been applied. Given that, I would agree that
it would make sense to define what the lock is supposed to protect
before changing its scope.

Guenter


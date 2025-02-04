Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F36EA278C1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 18:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9358910E6E0;
	Tue,  4 Feb 2025 17:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="peQv+xYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A5310E6DE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 17:40:47 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-38789e5b6a7so3127799f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 09:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1738690845; x=1739295645;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hIyNGRM2RRnUZcA2PrGOWEpGnxPIPwOozNJrpfAPGPM=;
 b=peQv+xYqZkMQ24SbByMsXBXvqumYlB7bYP90/EyMX+/3cEd7JX/ebYYb06VC+Cf20U
 S+oTfxc8cDvqACnDGuZ4/tw9A0V2CvYXQuOaQpmzxaaD32SBWGL4MC/qanRFpv0UORMk
 PdJBrUmIO4rVvP/lzk42hlbXwM0X1qeGuNEp4pjQg00tqotCLYzO5XQTOemlKYpedt5o
 QaEZrYrXSyaoGzTuSoPLEX+GrlUqYSLV5LRSLpEoEHDBZRHW8OsbuXvEK80FfrTjnt9N
 uOuuFw5glyi6qDEma0W2/V+F8i/cMrAtj/gh7yJoDMkEaF6tW9rAyTH6m8kXOYJdocf6
 UZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738690845; x=1739295645;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hIyNGRM2RRnUZcA2PrGOWEpGnxPIPwOozNJrpfAPGPM=;
 b=GQcQd6B51r4mMMDyxwS/PPEFldS0724PR4iFhuBH3vk94LxG261rCkUSBXdQ7FOOPq
 +gxGbEN/O4mI0lNSU4rM2SkwP+XuEC86tLZduT7wGFy1Yq+EvbZ30XQOfeMGSl6mu2C8
 G42Yu5Nq7qlIPveBzarL6w4Y3i7JBxiP+8XIR0c310Y8GdyvguACLD7E2KR/Ckn/bE+6
 OvzhrYrZRa/2MXyVtnEzECPmtUu2hhu1rchrcKzCE4UQ5gFg9zn47vrGhxQhAa1cb+sZ
 Oxd5lsQ1QwQYUkxE+8BTwk1qi31gi551Fj+uvW+qsJV824M2suM2gGI0hP2O3EaoJ4nr
 G0nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfTkc18McOm6O8M2h97VJN20flut0MQ3UByTwHOxa6BbyeMMioyN9utX+Ugzbl1+l1izm1hPko5b0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsBkK3dja6uiRUPF//S6JUJtDxXtJN5O7Ge9HFSipKAKyG4yVO
 BqYQ7I23BOPMJGVEFtFuWFdd2TA35FM5kCbt5H7O3A6M7MhRhfpbnuUK9A8DQJE=
X-Gm-Gg: ASbGncvZpylTTf5PvreFM7M3qnPEGHPhsM2rI5OrDfX1p6Z6R+pz5mPKHvoRHNy2Mnk
 tiMVQbTnEI/xoODFJxotPqefgR3TQ/qdWhThpDxSz9cH0OuqtStNTu9bQpNO66IOoqPNtFO2tS3
 pPXtRT/BsyFPgFHoIBH8ks0LuydMPVKhQC70fsZe9eGk8P7ZdUD8ad+ip0MpyHCshl5d3OLsH+5
 8p6RTAN7WIhu7JkWJ1zuU32S9xZXS1z6abDFId3/Yhg4HapHMGaECK45+cAJHR3FP2wFAOmhKwr
 hKcgSho8O7UK1wIm9mlYKH7x1C9BC04=
X-Google-Smtp-Source: AGHT+IG7Rv3/zspEaprEtmnDKbzUGn9l96SSpL2vZkkGASiB89Q75LGouKh1WFZeOnuTRKuV8Xgbow==
X-Received: by 2002:a5d:6d85:0:b0:382:4b52:ffcc with SMTP id
 ffacd0b85a97d-38c516664cfmr22659292f8f.0.1738690845404; 
 Tue, 04 Feb 2025 09:40:45 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38da59470b2sm2956181f8f.40.2025.02.04.09.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 09:40:45 -0800 (PST)
Message-ID: <253bbc0b-ca45-4456-a253-1215b46775b0@ursulin.net>
Date: Tue, 4 Feb 2025 17:40:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/5] drm/i915: Use device wedged event
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 jani.nikula@linux.intel.com, christian.koenig@amd.com,
 alexander.deucher@amd.com, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, xaver.hugl@kde.org,
 pekka.paalanen@haloniitty.fi
References: <20250204070528.1919158-1-raag.jadav@intel.com>
 <20250204070528.1919158-5-raag.jadav@intel.com> <Z6JNVF7O_Da8wA7p@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <Z6JNVF7O_Da8wA7p@intel.com>
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


On 04/02/2025 17:24, Rodrigo Vivi wrote:
> On Tue, Feb 04, 2025 at 12:35:27PM +0530, Raag Jadav wrote:
>> Now that we have device wedged event provided by DRM core, make use
>> of it and support both driver rebind and bus-reset based recovery.
>> With this in place, userspace will be notified of wedged device on
>> gt reset failure.
>>
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_reset.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> 
> Joonas, Tvrtko, ack on getting this through drm-misc-next?

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

>> index aae5a081cb53..d6dc12fd87c1 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>> @@ -1422,6 +1422,9 @@ static void intel_gt_reset_global(struct intel_gt *gt,
>>   
>>   	if (!test_bit(I915_WEDGED, &gt->reset.flags))
>>   		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
>> +	else
>> +		drm_dev_wedged_event(&gt->i915->drm,
>> +				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>>   }
>>   
>>   /**
>> -- 
>> 2.34.1
>>

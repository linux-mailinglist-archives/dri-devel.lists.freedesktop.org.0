Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2B1BF38D1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 22:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B74B10E50E;
	Mon, 20 Oct 2025 20:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PypM5oJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA57F10E50E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 20:56:36 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-93e7d3648a8so147229739f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 13:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1760993795; x=1761598595;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+ja+n9veh9qlHqb8hMHqgjmxsNKt1NGlPkWcYxqSmGs=;
 b=PypM5oJ2K7HamK4wH0SB6P54AttsOCJj+6KzB8wc79ppHDHqUhtCOVqEvMlOeBtc1W
 393y9d/b3gW0EH7Bqmatnpqdm6fWxAPAtdrsR7DwNVsd4CHE22sbVYovWQgvF4QJgTxT
 QkmZpdtPY8ThZJaV2ame2EqgzjYTBRFHdvKug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760993795; x=1761598595;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ja+n9veh9qlHqb8hMHqgjmxsNKt1NGlPkWcYxqSmGs=;
 b=d+h9Zw639Ku3m1c6Atb0FHbC+9gH365D8LqfnFHMVFTFwj7OXzggDExV+4PCQHO8y+
 NJG10xT9Z/GWMNpzLDO7URNvE6JsnwLRusr2Ex2xRUMCL0BzfdPaWtqiINwg3z5+IsQj
 oejncxN9m0XbeB4YPpwaosGDqhrRyHqGGk7cOJV76BipSCvSJ9cUsZ5C7NhYlRRJtAx+
 4kvuNFFiGpk06n6+uTEaE7/87WQQRpj/qLtQV6msvcGuxEDB4t8sYRKsslMufeaTkWt/
 MT0Vu5XQpJB0QuLcpKDSOHhZbweQidc4JFOpE/p8DRQGAxAnX16k3SxN2VPp4w9+ru6e
 Sw0g==
X-Gm-Message-State: AOJu0Yz90jrU7Gh+AAEHBrSnKE1tUAHkIUp167nQp3NjgRz5dr/RcUWb
 BpsJAwO4VOFIGUSPS2FRp0ogswnFHrIZxuScveAZmVDGztyLOiruIWBFMrf4LRMeRdg=
X-Gm-Gg: ASbGnct9uxq9xISA1xw3SaVZCcEknpYWYNerZLM5pn13ai7iOrld494wRSUjN4iFrGC
 TgAfG5tEjFIIAxoRBQAS3/s6C/mq/q05+dtiFw+lOn5B/aajL14xXdDIRJlKmgivu41o3PwBZnm
 DFEoWbVRpZi4gEapUYy+RTWogTk+VoNsBov3UlRzzzRmWKxxmod5UaHdW1Eot/Ai56bGpiqtpUr
 Qp00Mpw6v7GlkG/8m1E8gBKNGXTz3mzESnSzCi0mraMWZHvDJIOvF5CVCc1IF7cHhB37t2+jwn0
 rJfPa5HfSoMcvsWKwwQZ9CV3Y0b9VW0+/4EbCt9guK/JyfQGXAadPwtgwPSaEJH3A7gnkqtFn0p
 knZfaotAF/vwGpuXm0G81PqBhOEg7rDG4OibPI90fMT3zODpXsmsWf+QC3DOHMUp3kcuQBdIvLy
 K+AnkST3MTTGZj
X-Google-Smtp-Source: AGHT+IEYQuMsRrQP0zzcYNlBWGppocUzz2r9I/kZPTACOG5ljM8owh9X4YfA9kncxZnuMAgjkIzHhg==
X-Received: by 2002:a92:c245:0:b0:429:4c65:e8f7 with SMTP id
 e9e14a558f8ab-430c52d775cmr191927495ab.24.1760993795511; 
 Mon, 20 Oct 2025 13:56:35 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-430d070a461sm33957455ab.9.2025.10.20.13.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 13:56:35 -0700 (PDT)
Message-ID: <3f523293-8a8d-4136-b4bc-4ad0d4a50c59@linuxfoundation.org>
Date: Mon, 20 Oct 2025 14:56:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/solomon: Use kmalloc_array() instead of kmalloc()
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20251019145927.167544-1-mehdi.benhadjkhelifa@gmail.com>
 <2541f99c-1081-4253-ae58-97654694cd78@linuxfoundation.org>
 <e4f0290b-5d15-472f-acee-e1e1b0629ec0@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e4f0290b-5d15-472f-acee-e1e1b0629ec0@gmail.com>
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

On 10/20/25 15:38, Mehdi Ben Hadj Khelifa wrote:
> On 10/20/25 9:08 PM, Shuah Khan wrote:
>> On 10/19/25 08:58, Mehdi Ben Hadj Khelifa wrote:
>>> Replace kmalloc() with kmalloc_array() in several places to correctly
>>> handle array allocations and benefit from built-in overflow checking.
>>> This prevents potential integer overflows[1] when computing allocation
>>> sizes from width, height, pitch, or page values.
>>>
>>> [1]:https://docs.kernel.org/process/deprecated.html
>>
>> Mu understanding is that this document lists deprecates APIs so people
>> don't keep adding new ones.
>>
>> I didn't get the impression that we are supposed to go delete them from
>> the kernel and cause a churn.
>>
> the document[1] specifically quotes the following:"
> Dynamic size calculations (especially multiplication) should not be performed in memory allocator (or similar) function arguments due to the risk of them overflowing. This could lead to values wrapping around and a smaller allocation being made than the caller was expecting. Using those allocations could lead to linear overflows of heap memory and other misbehaviors. (One exception to this is literal values where the compiler can warn if they might overflow. However, the preferred way in these cases is to refactor the code as suggested below to avoid the open-coded arithmetic.)"
> Specifically mentionned the refactor of the code base in such cases which is why i'm doing the patches in the first place.Also i'm trying the best to send patches related to the issue where such issues of overflow are present or to be consistent with the same API used within the same subsystem.
> [1]:https://docs.kernel.org/process/deprecated.html> How are you testing these changes - do you have this hardware?
>>
>>>
> I have a raspberrypi zero 2 wh that i'm using in combination with the ssd1306 OLED panel via I2C to test it's rendering and it's working properly by using modetest and seeing no regressions or warnings in dmesg.
> 

Send v2 with all these details and why this change is needed
in the first place.

When and how does this potential problem trigger? Is this a
theoretical or does this happen in this code path and how?
Next time include all of these details people understand the
problem better.

thanks,
-- Shuah


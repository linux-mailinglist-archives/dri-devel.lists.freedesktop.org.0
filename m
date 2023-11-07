Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F117E47BE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 19:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F5D10E63F;
	Tue,  7 Nov 2023 18:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A995E10E639;
 Tue,  7 Nov 2023 18:03:50 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-692c02adeefso5155811b3a.3; 
 Tue, 07 Nov 2023 10:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699380230; x=1699985030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=+7XZp8TY75sF7U5h9nw0ejrOlAspCCqCAM2E9Vc6lJo=;
 b=DaoTcwoEYt208OfWgLh12d88fuh7ymm/1Pl8Xy6TNgha7J5mQ7YyW03Avlbm34fpUs
 4N4ijUfQsaTE1rmjAaXqIhxOuKBCHTzQEpx5PqNYp2XzfHBswSR/NMbfVZiKoFxUCDso
 yoaTr7o3tgIqkF+RZ7GKAlvVCoJasFPkhvDmE3IvHdhu7zk4B/CXEfvRinygGY4vezze
 NHUUPBRLXUdY67vILn7hOVcOLtWOy2168fHGd/zYQoNeUdtKp/FgWAZUbH6/MwNWx9iH
 T+x13o6BR2/sEaNmgGgc9+f7s4PaTuqrKiO+Y2Q3ZXZRA3OqIK46xUXWJOY1o36BrLRR
 KUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699380230; x=1699985030;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+7XZp8TY75sF7U5h9nw0ejrOlAspCCqCAM2E9Vc6lJo=;
 b=XJXeQgiwnf4aMmsuLw1s6Is3lar3n7GPbTleA3bBdCbVTotZ1AzZRVKc3VxN/r58hc
 jit6JnYmHmN491dJrO6ky+5wKt4PNA6sThepy6SuPRgGNUycQ5QAhK5LJ7W7wQ7HoduZ
 54VlpzmgL33iJ4XvWTTmWVJx2bq3kzkTmVYEF2cga0ovzTlJ4gYGPhoP6ZfqOup4ZFdX
 r2Z6l+Ov4KkohZt8SMjj+8n8alBUCS+KDeKhHlPkwvhW4Rt3n5G23xvgTSpJ5RoNu9XQ
 3yoimBZa8feE2ew3/mfXGPnO8Nws4ub7aqkfUaf/fr8uszKY5i4gshNSPdSReINyqBzw
 yHBg==
X-Gm-Message-State: AOJu0YxA9AoQ1qa44iVqD+JE5JpkqTIpzs1gUi3kEG0BQofe7jRRRX5c
 SHgYqBkq0oFGaGpiVRfVg4z/dbpnmbM=
X-Google-Smtp-Source: AGHT+IGQmOk5Vlvefa201+fp88HLQxdIENvDptE6tnHClw/M6ybyq5Z+coNiU1SmroFLsDGsbOeZqA==
X-Received: by 2002:a05:6a20:8f03:b0:12f:c0c1:d70 with SMTP id
 b3-20020a056a208f0300b0012fc0c10d70mr34253111pzk.40.1699380230066; 
 Tue, 07 Nov 2023 10:03:50 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a056a00125100b0069102aa1918sm7457304pfi.48.2023.11.07.10.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 10:03:49 -0800 (PST)
Message-ID: <f98d840d-f3ff-47e1-b609-2cfe33c65cb5@roeck-us.net>
Date: Tue, 7 Nov 2023 10:03:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/pm: clean up redundant comparisons with 0
Content-Language: en-US
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
References: <20231107082910.92508-1-jose.pekkarinen@foxhound.fi>
 <98e8490e-6608-47a8-890c-f1fe894dac7f@roeck-us.net>
 <65d132b0dbef66039fd6938ecbc2bf68@foxhound.fi>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <65d132b0dbef66039fd6938ecbc2bf68@foxhound.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org,
 alexander.deucher@amd.com, evan.quan@amd.com, christian.koenig@amd.com,
 linux-kernel-mentees@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/7/23 09:26, José Pekkarinen wrote:
> On 2023-11-07 16:08, Guenter Roeck wrote:
>> On 11/7/23 00:29, José Pekkarinen wrote:
>>> There is a couple of function return checks of functions that return
>>> unsigned values, and local variables to hold them are also unsigned, so
>>> checking if they are negative will always return false. This patch will
>>> remove them, as well as the never reached code.
>>>
>>> drivers/gpu/drm/amd/pm/amdgpu_pm.c:2801:5-8: WARNING: Unsigned expression compared with zero: val < 0
>>> drivers/gpu/drm/amd/pm/amdgpu_pm.c:2814:5-8: WARNING: Unsigned expression compared with zero: val < 0
>>>
>>> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>>> ---
>>>   drivers/gpu/drm/amd/pm/amdgpu_pm.c | 4 ----
>>>   1 file changed, 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>>> index 8bb2da13826f..e7bb1d324084 100644
>>> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>>> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>>> @@ -2798,8 +2798,6 @@ static ssize_t amdgpu_hwmon_show_power_avg(struct device *dev,
>>>       unsigned int val;
>>>         val = amdgpu_hwmon_get_power(dev, AMDGPU_PP_SENSOR_GPU_AVG_POWER);
>>> -    if (val < 0)
>>> -        return val;
>>>
>>
>> This is reporting errors returned from amdgpu_hwmon_get_power() as
>> large integers.
> 
>      Alright, that case it is a false positive, thanks for the comment!
> 


No, it isn't a false positive. The fix is wrong. The variable should be declared
'int val', not 'unsigned int val'.

Guenter


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DF649926F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 21:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C35210E90A;
	Mon, 24 Jan 2022 20:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FC610E90A;
 Mon, 24 Jan 2022 20:21:21 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id c2so23764717wml.1;
 Mon, 24 Jan 2022 12:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=L7Z367An0XQXA3IfS2t7lE/P4WVIsL4Rvo0sJu7Bhew=;
 b=YrSUTbiCwqvog8COCITrB6k/QYeDJXuqk+SVZOh8RbNO+GyZIT/ywoyyBt6fsiBbD3
 KLJeIZRuXVeczNbCXanWH1GsuM8dOUTpNrEcvfYg3tb8eN5gd2REjJ5jNY3dGunqbDxn
 BmfSVoEw/Fn80x1B/TnvPohOqAMZrKk9IFn3bKt5sDoyniiQ0/8lzAQGBQABJ5kky95/
 EQcfWUdv09295PwsRgPpLC2O/Lth1h7nkDINx9EZX3Cfbv9QKBKVdVVEQG/skbIoQn3x
 KtWj7RMvuniJBx5ZuUWfiB+KJsV1nzBt3SXwKqCaPrjbL8m7wB7ClDlt3nFYBi3y7OP0
 B+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=L7Z367An0XQXA3IfS2t7lE/P4WVIsL4Rvo0sJu7Bhew=;
 b=fSImcDuJ0ClTn9ayDr4N96456Oa5OHJ0Du97eFAsjbQi677wSgKsALI7Kr4WJ3hJP0
 2WRZAikG53LnqGjvcFqCF6+x4QCW93C8euLNHAjqrqm8GepIdo7n2a9dM2OIr2HsB6n0
 QMA9YDyWsnMAHAhu/se/94UhHcLIeYw2jFP+5K50i9u0lRy5689vzQoLwhVXBEMUi5NA
 NuxwyP1HORx0ebJoXnpdJ1trHNmx1hqiSi8gi0LZxJFvWJJriV8NSjvb2W9Z4/f49TAP
 CcztX7fTjhdkYyWzqVuawcJhFkUsUAXmTLvx/s02gPP+wB+TPE6kmvPKa9/jfQFoUcyW
 061Q==
X-Gm-Message-State: AOAM530Hwq3TVQJfzWQ8IToo2sOUugY0EyqtfSlD/VhceUiVPmiPorYV
 3oOrK0ipuefxVabk1zGc0K0Dye08v9Q=
X-Google-Smtp-Source: ABdhPJxMGwE8fCxmF8kobgHSMo2QP5IbtpBQv55xLXDJrSWmJKgFjF06ZYZ1tpyQo7cdwBcn7FSKlg==
X-Received: by 2002:a7b:c20a:: with SMTP id x10mr16078wmi.141.1643055679673;
 Mon, 24 Jan 2022 12:21:19 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:139c:f8a8:1313:ffa0?
 ([2a02:908:1252:fb60:139c:f8a8:1313:ffa0])
 by smtp.gmail.com with ESMTPSA id m8sm5983411wrn.106.2022.01.24.12.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 12:21:19 -0800 (PST)
Subject: Re: [PATCH 01/11] drm/radeon: use ttm_resource_manager_debug
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch,
 zackr@vmware.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220124130328.2376-1-christian.koenig@amd.com>
 <20220124130328.2376-2-christian.koenig@amd.com>
 <e0138a97e91678c0bd8d06071b6398c09d9c4142.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f10e56a4-4ade-a7c4-8ce7-caff821a4a02@gmail.com>
Date: Mon, 24 Jan 2022 21:21:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e0138a97e91678c0bd8d06071b6398c09d9c4142.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Am 24.01.22 um 17:33 schrieb Thomas Hellström:
> On Mon, 2022-01-24 at 14:03 +0100, Christian König wrote:
>> Instead of calling the debug operation directly.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Huang Rui <ray.huang@amd.com>
> The first two patches seem unrelated to the series.

No idea what happened here, those two are already upstream.

I probably just forgot to pull drm-misc-next changes from a different 
system.

> Also is there a chance of a series cover-letter?

Going to add one the next time, but I though it would be pretty clear 
what this is now about.

Thanks,
Christian.

>
> Thanks,
> Thomas
>
>
>
>> ---
>>   drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c
>> b/drivers/gpu/drm/radeon/radeon_ttm.c
>> index 11b21d605584..0d1283cdc8fb 100644
>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>> @@ -802,7 +802,7 @@ static int radeon_mm_vram_dump_table_show(struct
>> seq_file *m, void *unused)
>>                                                             
>> TTM_PL_VRAM);
>>          struct drm_printer p = drm_seq_file_printer(m);
>>   
>> -       man->func->debug(man, &p);
>> +       ttm_resource_manager_debug(man, &p);
>>          return 0;
>>   }
>>   
>> @@ -820,7 +820,7 @@ static int radeon_mm_gtt_dump_table_show(struct
>> seq_file *m, void *unused)
>>                                                             
>> TTM_PL_TT);
>>          struct drm_printer p = drm_seq_file_printer(m);
>>   
>> -       man->func->debug(man, &p);
>> +       ttm_resource_manager_debug(man, &p);
>>          return 0;
>>   }
>>   
>


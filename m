Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2107FF010
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 14:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794F510E2FF;
	Thu, 30 Nov 2023 13:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2CC10E2FF;
 Thu, 30 Nov 2023 13:26:22 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40b4a8db331so7721775e9.3; 
 Thu, 30 Nov 2023 05:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701350780; x=1701955580; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kMjMwDQeJ7U3HaJX4ZxhNthwT8vrdAeuzz7BaoFMnjY=;
 b=JAhl2sDTvuoabwWpyFNweBEIpafGo7b5e6Y5EaSqnbvFoVijFm/zVr9jrt+euDbOns
 9ycp/0V0Y5bG3QZtXkjx75/hFzr0cOHMqzwyTVaEsHsK/YgQeUkvKtEsICmRu7f/8ZMA
 ItQd/QGpumq/zAy0fwwamiGUIiFWBrCZeUwAoOwkGRkoIC6srLzoB2SWKMsZEu2JP8Ns
 Dah/CIQQucyIFt1jNCGNoIdOHvtgXhUFrTnvlO/FECqWCeU73TVXT3hjJ7JWAHtAVj9M
 yF9esZ2ItuNGYcppqqxbdduGjjuELSPoLoT408xKpCA2+YKqyGC05AZ9vMcFGivaC9z3
 WX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701350780; x=1701955580;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kMjMwDQeJ7U3HaJX4ZxhNthwT8vrdAeuzz7BaoFMnjY=;
 b=Rpl6L/WbV2bKXS8199WtXxn8OV7K2szm6UnXAdQnG0A65xiUWQsiSSJqbQRvONCQ9z
 sKdoSaqCEFSjwISoJa/7GYNIidv8895CPycFC+RqxNOKXO0F0rzxStXOQztKUBwkddPs
 hyrdmadwUVmunqf1azaexXJPQLl8S4G4YwSA2l9kIaPFHyyU9rrJ8tABB1DynQtyzMWu
 3XqoJLERofq1WaFaM4aoZTYiSW5Uzf0q/mN9JbNp5vPoURR7NtvEFblpdv85Wz9o9Gnl
 sLLjI6AHXFqgOwNtQroY0GuDJltZV9G/iQX6zG5RWB2h089erPXp+6c5brPVOyKd4QdL
 PfSA==
X-Gm-Message-State: AOJu0Yw6v5ar1hmRUBjmiPLczjQf05K3SKAa64MGa07bFCam/loYVYot
 L9gCnomvXeE9ird2wZKkOUw=
X-Google-Smtp-Source: AGHT+IF4VK2RMM99vHoNOTjMS8JYwZng9oa3EJPG40jI+yusE7jKXL9SAsLKU4Q7PP0rLS8URV59NA==
X-Received: by 2002:a05:600c:a04:b0:40b:47f0:66b5 with SMTP id
 z4-20020a05600c0a0400b0040b47f066b5mr8748485wmp.26.1701350780275; 
 Thu, 30 Nov 2023 05:26:20 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c470900b004063cd8105csm5706905wmo.22.2023.11.30.05.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 05:26:19 -0800 (PST)
Message-ID: <1e10c821-1981-4c9c-8243-dc4592bf9102@gmail.com>
Date: Thu, 30 Nov 2023 14:26:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Correct the documentation of
 name and exp_name symbols
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20231122160556.24948-1-Ramesh.Errabolu@amd.com>
 <c5ae3f32-0779-4583-8fe6-92f5dea5ede6@amd.com>
 <CADnq5_OJbURbVzXVypohp7gCjE+ckHkEnDD67H7KTDJZt_e3HA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CADnq5_OJbURbVzXVypohp7gCjE+ckHkEnDD67H7KTDJZt_e3HA@mail.gmail.com>
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Ramesh Errabolu <Ramesh.Errabolu@amd.com>,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.11.23 um 22:18 schrieb Alex Deucher:
> On Wed, Nov 22, 2023 at 1:58 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 22.11.23 um 17:05 schrieb Ramesh Errabolu:
>>> Fix the documentation of struct dma_buf members name and exp_name
>>> as to how these members are to be used and accessed.
>>>
>>> Signed-off-by: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> Please apply this to drm-misc.

Done, thanks for the reminder.

Christian.

>
> Alex
>
>>> ---
>>>    include/linux/dma-buf.h | 11 +++++++----
>>>    1 file changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>> index 3f31baa3293f..8ff4add71f88 100644
>>> --- a/include/linux/dma-buf.h
>>> +++ b/include/linux/dma-buf.h
>>> @@ -343,16 +343,19 @@ struct dma_buf {
>>>        /**
>>>         * @exp_name:
>>>         *
>>> -      * Name of the exporter; useful for debugging. See the
>>> -      * DMA_BUF_SET_NAME IOCTL.
>>> +      * Name of the exporter; useful for debugging. Must not be NULL
>>>         */
>>>        const char *exp_name;
>>>
>>>        /**
>>>         * @name:
>>>         *
>>> -      * Userspace-provided name; useful for accounting and debugging,
>>> -      * protected by dma_resv_lock() on @resv and @name_lock for read access.
>>> +      * Userspace-provided name. Default value is NULL. If not NULL,
>>> +      * length cannot be longer than DMA_BUF_NAME_LEN, including NIL
>>> +      * char. Useful for accounting and debugging. Read/Write accesses
>>> +      * are protected by @name_lock
>>> +      *
>>> +      * See the IOCTLs DMA_BUF_SET_NAME or DMA_BUF_SET_NAME_A/B
>>>         */
>>>        const char *name;
>>>
>> _______________________________________________
>> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
>> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35EC926373
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 16:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0583010E8D9;
	Wed,  3 Jul 2024 14:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CBAy9eo7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCFC10E8D9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 14:31:02 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ebe785b234so56928691fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 07:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720017061; x=1720621861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RtaE5+VV5FfCTl+mHtRAgePSOI5g77wEwHwoMxAfEjY=;
 b=CBAy9eo7dFT3IE+IfQRUuO4TQ6ziDRFy4Pou6CmPc72YhlCL/4+1/Ou4GJKpZ+Kpjg
 d0S0BP3ugp0wiegWA0v3qQNA99CmYIrmLmGsleIPJKbtPrh0bbAwUjSx382N8vLNOleZ
 joBhL28D1AH8N7boxH8mUTkeoSurweQQZvHWQt8W/sMC1eetzlKynkG0XqleeeFL4S/i
 x9qyAf3tLoTONwvEFL1RG/fmMNCd5yHpTXs9YO9yMPo4278ph5H9gfJMnQzkyEWHyyYK
 zgZnFsTS8mloFIxEmrCTssFNqw6cJGXmdkVXeBSVvnMjYWoJ5WFyp4pMbeYx6owZHitS
 kY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720017061; x=1720621861;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RtaE5+VV5FfCTl+mHtRAgePSOI5g77wEwHwoMxAfEjY=;
 b=fAOv8eFUGcZMrJLR6uOyrHJy2lb5hBX4wDkPdN8kPlZ7SB27jJAqYNIVLW+0mgGb7B
 tI22oqZO1IpBUVMrTY5EMdQUubomNysXipBJXO+Oc3yUSFu5peieAc4EK9z3f0SWB0lU
 7SML/yW9a3TCzh5ZzvEKnAFiqEeQzc4HWfW4keEume2GjMWCHbpOmZy4Teo/FKHCoFY4
 wkIIt0+HFdsVb0lQWgZYb2oNtRogP7Gb//xw3k3RtuJJup1X7cQCQXYB7vYpdWqXI4Nd
 NCzjUMhB+XqsokxKkotrBCsorpQCV/s9STm5AbetoZEj3obqpnsmsHolQGfIZq+1gPtL
 MoSw==
X-Gm-Message-State: AOJu0YxK09H3tQITyW0BXYsWDTWsevK4ttFM9gKcYLj5B8qELdadZbvN
 eB0bTup9234Xg2c9gN33xVJNYDGcWGmZRJsAOAgop1/3S1dESBGk
X-Google-Smtp-Source: AGHT+IEuYysWwF4mvgqFenXaUq7ytIzH5jGgjK4AI092ZNpLqajpoo4CiGgRgdYneY+Ir7gMBPGjHw==
X-Received: by 2002:a2e:b888:0:b0:2ee:4f93:ae25 with SMTP id
 38308e7fff4ca-2ee5e4c3ae4mr86845841fa.29.1720017060199; 
 Wed, 03 Jul 2024 07:31:00 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257c4e10d6sm170302075e9.30.2024.07.03.07.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 07:30:59 -0700 (PDT)
Message-ID: <d49cedec-b417-40c3-abe5-62a8675bb711@gmail.com>
Date: Wed, 3 Jul 2024 16:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Using drm_exec for TTMs BO eviction
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240703132602.4756-1-christian.koenig@amd.com>
 <aa97506c2bd1db39eb42f4801e5499adbd57b34c.camel@linux.intel.com>
 <10c7178a311b0b4abe9e5474de332c08262b4840.camel@linux.intel.com>
 <73edf33a73a3c2974f90ad3a8f6b17a67b45586c.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <73edf33a73a3c2974f90ad3a8f6b17a67b45586c.camel@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.07.24 um 15:59 schrieb Thomas Hellström:
> On Wed, 2024-07-03 at 15:53 +0200, Thomas Hellström wrote:
>> On Wed, 2024-07-03 at 15:40 +0200, Thomas Hellström wrote:
>>> Hi, Christian,
>>>
>>> On Wed, 2024-07-03 at 15:25 +0200, Christian König wrote:
>>>> Hi guys,
>>>>
>>>> We recently ran into a problem with deadlocks during eviction and
>>>> while back Thomas worked on a patch set which was going into the
>>>> direction of solving this.
>>>>
>>>> So I simplified it to just the functionality needed to resolve
>>>> this
>>>> issue at. The resulting patch set is just the initial first step
>>>> of
>>>> using drm_exec in TTM for locking BOs during eviction.
>>>>
>>>> Should a deadlock happen the drm_exec object is now used to
>>>> resolve
>>>> it and prelock the contended object. This approach solves this
>>>> the
>>>> ENOMEM issue on contending evictions quite nicely.
>>>>
>>>> Please review and comment,
>>>> Christian.
>>> Overall it looks sane, but I think it makes sense to review and
>>> land
>>> the part of the shrinker series first that touches this eviction
>>> path
>>> and gets rid of a lot of code that's hard to understand and
>>> simplifies
>>> the locking a lot. (That part doesn't touch drm_exec), and it has
>>> been
>>> pending reviews for some time.

That's actually exactly what I wanted to avoid.

>>>
>>> I don't think it's correct to bypass that. Then we could work out
>>> the
>>> drm_exec implications.
>> It's
>>
>> https://patchwork.freedesktop.org/series/131815/
>>
>> And in particular patch 7 there brings in the restartable LRU
>> functionality and sipmlifies eviction immensely and would make the
>> usage of this patchset's rudimentary drm_exec support easier to
>> understand and review.

Yeah, seen Mathews comments on that stuff.

Looked like 99% sane to me the last time I checked, the only thing I'm 
still not very keen at is still the bulk and cursor interaction.

>>
>> /Thomas
> Hm. I actually think all review comments have been sorted out up to
> that patch, so what's missing is a resend of the new version, RB from
> Matt and Review / Ack from you, then that part could be partially
> merged.

Going to take another look at that.

Regards,
Christian.

>
> /Thomas
>
>
>
>>
>>> /Thomas
>>>
>>>
>>>>


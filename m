Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04508857CE2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 13:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DBA10E9B5;
	Fri, 16 Feb 2024 12:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R6LacRUc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C37910E899;
 Fri, 16 Feb 2024 12:45:31 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d0e520362cso20273701fa.2; 
 Fri, 16 Feb 2024 04:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708087530; x=1708692330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z21o86oZ2POmZsD5ofKWQxDd0NBUibTeXuOHb4VWv3M=;
 b=R6LacRUcSpJjs3XqMRPf+WLW+YU5BHuasmFazuhvF5nyz8tH6UPeC88aGu4ZnItx71
 miEjfsYKuH4iYSS1AU9eNB9tsHPJQFjIk9rUbmlmj3+RCcs9jEhBrTIFP5B/bkHuyabq
 eVatlS77R47pt38mEKu2YCrOnxHW4KPlRmVa5BiLizg8KcAc28TPlN0WeVFp7U9Hz2mE
 rM7Yc1EErQTy3OHZnYzIV4/zUvCnAcq/1d7vfOGTAVPoLYkadCwJpCN6PpciL5/Se1XM
 CP+rZGlzp3RGEphlbYFXe/+uz8LycAGdhAj6hpCEdzYv80y4O6LPgbjtCFTRelCl6MM0
 JC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708087530; x=1708692330;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z21o86oZ2POmZsD5ofKWQxDd0NBUibTeXuOHb4VWv3M=;
 b=MZXlmuXAEKfTllo0w+lWqu1nskEYis5yyggi2PgCfcx9gfONvRqOCpjoxB/WKj6gUR
 nMnAWjxt6IZpix/IvSpRg+RT+NoXVXQ2MfSwet7x+6lcFvKnoXe/5rxq8npVoxkyv4gW
 LPP4wtG4vIOj7RFXYe1/xmWUaaUfouG2PnwCTM5xH8y+zdaKo17iT8Y/gJbaAKWM/CS8
 IOPz7OrVcTo6ysi4MnRFFILWItuGyFHg0O12csG4xyY+v/ppGGuTzCfcFCWapvEkHKpM
 CPFVVBF8IhEreXP0mjikyuJ/9NFus+8hNjCTWa1R1l+sm23jaPqGaLTFW0UxKw0y8AjA
 MISg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEsLjqt76b/OUO4/3GJDZVLvhN8xUVvQWYreTRPpo1yqBAvDVFQ1vA6LG09A0lpjLgJXdjmGYclxH/QjhZyRPrcnXrKVF3qTCoKein+52cLdPI7FuAsl+YtxQs1Nwfg9EWYnkIsKCpuah4H5p0gApHn18+YAI60EqbOQoG6iYwPer+1kdOt+9KsJWBp/Qh9Y6lm0hNx5fdX0LD7u6rftjhoOPA7mRRylzDIXTPyybN
X-Gm-Message-State: AOJu0Yy9Ls3qHsjFUiOBHQG3cY5EixiRnxO2qwucawdoIv4GadqKOvOX
 FuKdz5rHBfAE77SIQ6oz1AJ1E/W1jcZlrdigRVJlKDDKvO5KJtAk
X-Google-Smtp-Source: AGHT+IGyVMz/0Xs8YGS+0Is6rqroqbgJJL0ly2ndoIEMALtAiS2mU/opMyiec2MQdlc/y84MBPNn5Q==
X-Received: by 2002:a2e:b059:0:b0:2d2:1da5:385 with SMTP id
 d25-20020a2eb059000000b002d21da50385mr637592ljl.47.1708087529841; 
 Fri, 16 Feb 2024 04:45:29 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a05600003c400b0033d22852483sm859650wrg.62.2024.02.16.04.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 04:45:29 -0800 (PST)
Message-ID: <c3563341-bfcb-4df9-a6c0-f983835a4e2e@gmail.com>
Date: Fri, 16 Feb 2024 13:45:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6 V4] fdinfo shared stats
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 daniel@ffwll.ch
References: <20240212210428.851952-1-alexander.deucher@amd.com>
 <b883e82e-9042-4656-b152-065ed31a81de@gmail.com>
 <CADnq5_MwEB_=2uySBmiOu3mBcA=uRDvsoA_jT9umHNnwLELWZQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CADnq5_MwEB_=2uySBmiOu3mBcA=uRDvsoA_jT9umHNnwLELWZQ@mail.gmail.com>
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

Am 15.02.24 um 15:20 schrieb Alex Deucher:
> On Thu, Feb 15, 2024 at 9:18 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 12.02.24 um 22:04 schrieb Alex Deucher:
>>> We had a request to add shared buffer stats to fdinfo for amdgpu and
>>> while implementing that, Christian mentioned that just looking at
>>> the GEM handle count doesn't take into account buffers shared with other
>>> subsystems like V4L or RDMA.  Those subsystems don't use GEM, so it
>>> doesn't really matter from a GPU top perspective, but it's more
>>> correct if you actually want to see shared buffers.
>>>
>>> After further discussions, add a helper and update all fdinfo
>>> implementations to use that helper for consistency.
>>>
>>> v4: switch drm_gem_object_is_shared_for_memory_stats() to an inline function
>> I'm still not sure if looking at the actual handle count is the right
>> approach, but it's certainly better than before.
> Well, it's consistent across drivers.

Yeah, which makes it easy to change if we find something better.

>
>> So Reviewed-by: Christian König <christian.koenig@amd.com> for the
>> entire series.
>>
>> Should I take this through drm-misc-next?
> Yes, please.

Done.

Regards,
Christian.

>
> Thanks,
>
> Alex
>
>> Regards,
>> Christian.
>>
>>> Alex Deucher (6):
>>>     Documentation/gpu: Update documentation on drm-shared-*
>>>     drm: add drm_gem_object_is_shared_for_memory_stats() helper
>>>     drm: update drm_show_memory_stats() for dma-bufs
>>>     drm/amdgpu: add shared fdinfo stats
>>>     drm/i915: Update shared stats to use the new gem helper
>>>     drm/xe: Update shared stats to use the new gem helper
>>>
>>>    Documentation/gpu/drm-usage-stats.rst      |  2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
>>>    drivers/gpu/drm/drm_file.c                 |  2 +-
>>>    drivers/gpu/drm/i915/i915_drm_client.c     |  2 +-
>>>    drivers/gpu/drm/xe/xe_drm_client.c         |  2 +-
>>>    include/drm/drm_gem.h                      | 13 +++++++++++++
>>>    8 files changed, 38 insertions(+), 4 deletions(-)
>>>


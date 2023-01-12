Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CC1667A55
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 17:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BD510E2E9;
	Thu, 12 Jan 2023 16:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E1810E2E9;
 Thu, 12 Jan 2023 16:07:16 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ss4so38646241ejb.11;
 Thu, 12 Jan 2023 08:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dHV7iLVeEoxWcipV4xBlnEzvxV/elyHUJdIwSKoRHCg=;
 b=h85fndVH6GssjgjD1EWJSAtGtoNvTRWquDg+XjFznz4IZV+0QhrcxclYxBoWih+CRy
 Ji9E72NYMSlxyZ9Rf709uPyvP91NM5m3yjPTuQJF+qdrJpkIaj0J6XSvLuMczeB/6ZKv
 tLbq7W3yLsG+DPfFRiBAECEgkqj2RCjGxb+j4aFEMlstdg1L1F3DVVEIWd+QsqI9YJVo
 Jp40O+GLjNxRFFLc9K6fGHnCdL+Wp/zBL8AZcevEYnU/XLZf0PN9kvsNW5e4mI2LIdDc
 aHqpMus6UfZxJSG4vkc7y/XgLLbZ2U02WebPU4vNXKjZK2ka4B+tUHLGPojh+UVFQNk+
 w/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dHV7iLVeEoxWcipV4xBlnEzvxV/elyHUJdIwSKoRHCg=;
 b=uC8SD5FcdAr/14wEROKvksNjMdlgiTTZxA2zmC8XA8XskWMf8OJz42pvh2HvfjwmOh
 QK3/QhrVh238FgE0P8+q5e+KTMdQXEx9Rzfxztu5193BhfX6Wx1D7vhIrH/ga3MnBXDj
 LGnTC4Mk6tqwPdh/3Y6CWkO5DsRv9yuvscSdn7avQdjLTvNcyeLr++rB9R6SYPENUnfX
 ICaMZL27QuG1EHfpBp8sQVLvixQI62x63zALYieQO8dRKV8s0MJQOTpdxczgdvvjj8En
 /9OSbYDMQqxHlOVvP8YqUpKR44TwV3H7as4h+zSNPID6pBA9iN5QACwnI6n7hIxDa2XX
 AKnQ==
X-Gm-Message-State: AFqh2krU0N88gnldnQU98KGQHS74ZRwUUswstxO+IVnSZeXHOJjYLIgR
 e318IPa/unvdi3l9gJDjkSp0sMu2bJM=
X-Google-Smtp-Source: AMrXdXsAfvAtKhbGTzhtKdbl+CkInA9t1c+F9Co0spmc/7dopbDjpA8hDeZKuBhwMS6vOKEuFKCoSw==
X-Received: by 2002:a17:907:c208:b0:84c:e73c:d224 with SMTP id
 ti8-20020a170907c20800b0084ce73cd224mr28084242ejc.10.1673539635353; 
 Thu, 12 Jan 2023 08:07:15 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:55ec:58c:e8ab:e871?
 ([2a02:908:1256:79a0:55ec:58c:e8ab:e871])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a1709061daa00b0084cc87c03ebsm7537589ejh.110.2023.01.12.08.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 08:07:14 -0800 (PST)
Message-ID: <c5630980-283c-a1af-ecde-57433cb86a9d@gmail.com>
Date: Thu, 12 Jan 2023 17:07:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/ttm: replace busy placement with flags
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230111114256.72669-1-christian.koenig@amd.com>
 <20230111114256.72669-2-christian.koenig@amd.com>
 <CAM0jSHP=LT5mXEFvXWJGPOotgRBBLFe-Pw=4TTHYWo=Maov_uA@mail.gmail.com>
 <2b68945e-4001-db29-4421-f1a7266f0d69@gmail.com>
 <CAM0jSHOEXiQj-9160deCA-AxDjbUUrwYDUit9=yzPCcdLp_Wwg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAM0jSHOEXiQj-9160deCA-AxDjbUUrwYDUit9=yzPCcdLp_Wwg@mail.gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.01.23 um 16:18 schrieb Matthew Auld:
> [SNIP]
>> Currently "dim rebuild-tip" doesn't work for me because of a conflict in
>> i915_gem_execbuffer.c
> Seems to be working now.

Nope. When I do a fresh install with "drm setup" in a different working 
directly I run into exactly this problem again.

On a different system "drm rebuild-tip" runs perfectly fine, so my 
educated guess is that some conflict resolution isn't applied on some 
systems.

I've seen this phenomena couple of times with drm-tip now, but can't 
really make sense what's going wrong here. Daniel any idea?

Christian.

>
>> Any idea how to fix this?
>>
>> Thanks,
>> Christian.
>>
>>
>>> [1] https://patchwork.freedesktop.org/project/intel-gfx-trybot/series/?ordering=-last_updated


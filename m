Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB963765138
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 12:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895A410E089;
	Thu, 27 Jul 2023 10:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E42310E089
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 10:32:26 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2680edb9767so163330a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 03:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690453945; x=1691058745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4VsKgOIlO7JTMbURB3u+V7Qr/QzOpc+0Bt56AjhAYAM=;
 b=Zr/NhsMbDbdIdSqoueTQTw00LusmUmyLrdR7MeDx+ZO5Q+75jdmzv373GL0Ee5CtKr
 W6fluKiuFJCg5ZU3kW0Km101UvphMU1vBCY7hDEO6TFqab4XzqrIV8fVDPR2Owpqim7U
 N3OX4eAxVQVjc5z6Zvv7YweV9TAIgzv2mVUZoaytYD45Z4tHHiC7Kn023GaYmi5v6RKy
 g9n+r/2KPb5qfD2ZK/MDUQIwCLsfUVl7c4q/2XRu1uefpNinWMEwlZLohyik+zojbFUF
 urJtl81vW3ulTBjRT5ht+WLfC03kh8PaMNuzZ2kESl6uu5dT49u0KrVoAN4kKuQ8SPSD
 k2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690453945; x=1691058745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4VsKgOIlO7JTMbURB3u+V7Qr/QzOpc+0Bt56AjhAYAM=;
 b=CTuJ20MHCiUNgCRyx0hJFDxDj2Ub68r9PshSGmr07Gg6uk5M5W0N+gzPhqDumpgUld
 1BRErKBOduss5bk+qCd+plnlFVWBvmav+sFXJIqhA5KySVsWkEOhEvbEQmBA/V/xox4R
 xQ6i71BdBwzbaQab66epFidCwtlajNtToDYO2Xa2R+fKk9rjRQjKGCDgDbFeYj0sgxMi
 OGr56oInst37QiLdqLj/Ycf4lq1sj75K+EXh95FS1jmQqKa0er5DItw3OXkWoAXhCPEQ
 WTz8r1icqYitWRPv6Lg2DZNLEhERkqt0CQhVGmKFwpfOiLnIgIr1x/C2I5lssiPGgbuF
 b8Xw==
X-Gm-Message-State: ABy/qLbvhUdjkCPSRaUaKnoWM4DksjImZDAlvKdiHxL2zPAWFZ/blGdz
 ybSXywb1hM+6G8iYktByLQa9JQ==
X-Google-Smtp-Source: APBJJlGmzPZn88CMJAqpsojyTb97uikW28yo5O3pi8rH8SDlSH8BwjASuoOudfeGFyxgCSRxAf0mLA==
X-Received: by 2002:a17:90a:1b06:b0:263:2312:60c2 with SMTP id
 q6-20020a17090a1b0600b00263231260c2mr4299433pjq.3.1690453945653; 
 Thu, 27 Jul 2023 03:32:25 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 8-20020a17090a018800b0026309d57724sm2755058pjc.39.2023.07.27.03.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 03:32:25 -0700 (PDT)
Message-ID: <cc819e13-cb25-ddaa-e0e3-7328f5ea3a4f@bytedance.com>
Date: Thu, 27 Jul 2023 18:32:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 28/49] dm zoned: dynamically allocate the dm-zoned-meta
 shrinker
Content-Language: en-US
To: Damien Le Moal <dlemoal@kernel.org>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
 <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
 <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
 <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>,
 yujie.liu@intel.com, vbabka@suse.cz, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, tytso@mit.edu, netdev@vger.kernel.org,
 muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/7/27 18:20, Damien Le Moal wrote:
> On 7/27/23 17:55, Qi Zheng wrote:
>>>>            goto err;
>>>>        }
>>>>    +    zmd->mblk_shrinker->count_objects = dmz_mblock_shrinker_count;
>>>> +    zmd->mblk_shrinker->scan_objects = dmz_mblock_shrinker_scan;
>>>> +    zmd->mblk_shrinker->seeks = DEFAULT_SEEKS;
>>>> +    zmd->mblk_shrinker->private_data = zmd;
>>>> +
>>>> +    shrinker_register(zmd->mblk_shrinker);
>>>
>>> I fail to see how this new shrinker API is better... Why isn't there a
>>> shrinker_alloc_and_register() function ? That would avoid adding all this code
>>> all over the place as the new API call would be very similar to the current
>>> shrinker_register() call with static allocation.
>>
>> In some registration scenarios, memory needs to be allocated in advance.
>> So we continue to use the previous prealloc/register_prepared()
>> algorithm. The shrinker_alloc_and_register() is just a helper function
>> that combines the two, and this increases the number of APIs that
>> shrinker exposes to the outside, so I choose not to add this helper.
> 
> And that results in more code in many places instead of less code + a simple
> inline helper in the shrinker header file... So not adding that super simple

It also needs to be exported to the driver for use.

> helper is not exactly the best choice in my opinion.

Hm, either one is fine for me. If no one else objects, I can add this
helper. ;)

> 

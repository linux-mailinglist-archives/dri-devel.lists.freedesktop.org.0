Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE5A78E9C7
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 11:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E52910E5D7;
	Thu, 31 Aug 2023 09:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC6110E5D7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 09:50:43 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bf095e1becso495815ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1693475442; x=1694080242;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4hWsSdZV+d/r/C3M//CWRHenhxuyH6PXWTZ8m4C2T5w=;
 b=cJJikfestDpgQg3BjusGOlfxzuV07+U7+pV2uQDchyk7oXkVbs9n81sQUmM1mO+UoB
 vP/fWV+10arzJl8blz9rKn0Kv/GIJ7NT/iLMbSiMVQFUKhZXppR+BS6lwqz7R+u+E+bK
 A+0hRwbfCiPyXnzjXrwec1qnAoFdtgl2x46rEcoJY/KeoXhhWBQbaDIznxoAAW49SGKH
 KkVod3tOvGKhZsFAVAFTftSuqd1otpR5uNnJdSraTfdHC38MH1qBwOn+Me1dR9pv54pA
 9VtMVHVILSCL2vK7JePRdsDpiP0iB0rnipwtEJZsIUyxM1wHdKXiEEyrJ6Py7NYLTV6z
 3xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693475442; x=1694080242;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4hWsSdZV+d/r/C3M//CWRHenhxuyH6PXWTZ8m4C2T5w=;
 b=bLtvoeR3u3DGRWkdx8oNktZ8WMUhmhycUoqzMLFmILH9E/ll6OpckyLpU9Bx1ngs9S
 apKTN/suE+XVKA7jlKnYgOa1l+fNSbOq1aUJLKJPkYDxQUo6ANU4xIJIAuPRp8HgEj17
 Pu2EpoMqcvJfjR3URkfWLsqEkgcivTdGdI+2o8UH4WPa1jv+9TvlWdKDi1qg2u9u0VVv
 baq9T11azcMr0mDETOgGLXmVEtGPbIlOJeWEaRfcAZXdjyfbaxizIrZQ8cDrfb3T1nu2
 cG45a8POsHSjdExzZLl81sIBp4dvoSK/n64y5z6nPx3du7h1Xdk80RlbbFLJukOwxNpz
 7czg==
X-Gm-Message-State: AOJu0YxxA69E5nh/RV7lH7fDVntDACnX3lYjeDpVabRen+Rw/gpfMWeq
 uvYxewYm3SMd0b9LcKAwo0KUrg==
X-Google-Smtp-Source: AGHT+IEnkrf0TI+aDPgBrUJ4hvYx5ldH5fkSZ7zbguENseaBUxfSfJnXVG+gK4GUU5F65oVTA/ERUg==
X-Received: by 2002:a17:903:22cd:b0:1c2:c60:8388 with SMTP id
 y13-20020a17090322cd00b001c20c608388mr4731256plg.6.1693475442668; 
 Thu, 31 Aug 2023 02:50:42 -0700 (PDT)
Received: from [10.84.155.178] ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 jg7-20020a17090326c700b001bbb1eec92esm893971plb.281.2023.08.31.02.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 02:50:42 -0700 (PDT)
Message-ID: <414e5087-921f-4f80-06cc-b7b894fd3794@bytedance.com>
Date: Thu, 31 Aug 2023 17:50:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 0/4] cleanups for lockless slab shrink
To: akpm@linux-foundation.org
References: <20230824033539.34570-1-zhengqi.arch@bytedance.com>
Content-Language: en-US
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230824033539.34570-1-zhengqi.arch@bytedance.com>
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
Cc: brauner@kernel.org, muchun.song@linux.dev, tytso@mit.edu,
 linux-fsdevel@vger.kernel.org, paulmck@kernel.org, gregkh@linuxfoundation.org,
 djwong@kernel.org, roman.gushchin@linux.dev, david@fromorbit.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, linux-mm@kvack.org, senozhatsky@chromium.org,
 cel@kernel.org, joel@joelfernandes.org, yujie.liu@intel.com,
 christian.koenig@amd.com, vbabka@suse.cz, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/8/24 11:35, Qi Zheng wrote:
> Hi all,
> 
> This series is some cleanups split from the previous patchset[1], I dropped the
> [PATCH v2 5/5] which is more related to the main lockless patch.
> 
> This series is based on the next-20230823.
> 
> Comments and suggestions are welcome.
> 
> [1]. https://lore.kernel.org/lkml/20230807110936.21819-1-zhengqi.arch@bytedance.com/
> 
> Thanks,
> Qi
> 
> Changlog in part 1 v2 -> part 1 v3:
>   - drop [PATCH v2 5/5]
>   - collect Acked-by
>   - rebase onto the next-20230823

Hi Andrew,

Can this cleanup series be merged? This part is relatively independent
and has Reviewed-bys and Acked-by.

Thanks,
Qi

> 
> Changlog in part 1 v1 -> part 1 v2:
>   - fix compilation warning in [PATCH 1/5]
>   - rename synchronize_shrinkers() to ttm_pool_synchronize_shrinkers()
>     (pointed by Christian König)
>   - collect Reviewed-by
> 
> Changlog in v4 -> part 1 v1:
>   - split from the previous large patchset
>   - fix comment format in [PATCH v4 01/48] (pointed by Muchun Song)
>   - change to use kzalloc_node() and fix typo in [PATCH v4 44/48]
>     (pointed by Dave Chinner)
>   - collect Reviewed-bys
>   - rebase onto the next-20230815
> 
> Qi Zheng (4):
>    mm: move some shrinker-related function declarations to mm/internal.h
>    mm: vmscan: move shrinker-related code into a separate file
>    mm: shrinker: remove redundant shrinker_rwsem in debugfs operations
>    drm/ttm: introduce pool_shrink_rwsem
> 
>   drivers/gpu/drm/ttm/ttm_pool.c |  17 +-
>   include/linux/shrinker.h       |  20 -
>   mm/Makefile                    |   4 +-
>   mm/internal.h                  |  28 ++
>   mm/shrinker.c                  | 694 ++++++++++++++++++++++++++++++++
>   mm/shrinker_debug.c            |  18 +-
>   mm/vmscan.c                    | 701 ---------------------------------
>   7 files changed, 743 insertions(+), 739 deletions(-)
>   create mode 100644 mm/shrinker.c
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C7876065A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 05:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A64B10E156;
	Tue, 25 Jul 2023 03:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F34410E156
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 03:09:22 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-267711d2b43so714272a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 20:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690254562; x=1690859362;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZLkcXzJjvvDBLgu5DbJbwRAKtejO8FK7VlKqBEYpGhg=;
 b=T37460khNMPot0VVWdDz4lB6VWzVdicUBxVfz7CttLqrgD8g0MkXpwdKxm81+5qM3E
 yM+KFmnDFeQa0ZY5ZeNvvyumpxFJqPDg3oixgT5YKKGKOt9qmtbXs6vK0nUKy4kqsaDS
 iJ3utK1jXEfJapBrHYjK+SRbiAPBWHkzR4mO0jKk+qC4Stl39POzbhCCP4MwAtpmSso5
 ynGZ9erR4hLoA8pCdH+sRZpUbw1kMvKh2ycfFI2IzmOqd8Zq8Q0hlgUcK6mejCeashGS
 UzcYSPHM74qvjYTTAriMRhyDbW62IR+NfEc7uD2qj/U2RIYLpDl8fGFG28yoLGatJrqh
 GkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690254562; x=1690859362;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZLkcXzJjvvDBLgu5DbJbwRAKtejO8FK7VlKqBEYpGhg=;
 b=CUsxJASf9nHN8p4bsowDJw7tSQ78mt2ZKrkqqUZgiUyJoGQOmKlGfeEkUID6Qf3kx0
 CVo/V2Ww9TMuoyB3slAzhjekBdH+M35yeHD/Wy+j4mXvDwP4h6nn9SN9gN8wV8lOYPix
 S4RH0yrfctIFNUTjq1fb0mpRxbG73w5yXK9B2NCNqlLD/sWiwsPIk0ExGEAkesBT2LWR
 Q4qEjfMwgk1evZijhBb5jHxAOSR/D+2x1+IgPgut5JYBDpgDMIelxprWEp1hCAismvxj
 5CTEJnOO4AUI11t/v2i263WP5wNJ0h8AZfIz+Nbyfm2rFZB/5YOyQi7TwyK8ZTTCUtHw
 AA6w==
X-Gm-Message-State: ABy/qLYkh70Qdxx+nOAiYWEfnn0dGo/Ds5yi7sDCd6XxYUoDpZlYFObG
 elwyLCMjpRmAZtzXXts/mpGaGQ==
X-Google-Smtp-Source: APBJJlEruF0WFFXXZAOwcLJKfTF/P8Yek4Wx/bwgxp4VRr2IRHJr9OEk7izXq54CPTEEiNehAqKYyg==
X-Received: by 2002:a17:90a:50f:b0:263:730b:f568 with SMTP id
 h15-20020a17090a050f00b00263730bf568mr10246975pjh.3.1690254562043; 
 Mon, 24 Jul 2023 20:09:22 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 21-20020a17090a199500b002633fa95ac2sm9540001pji.13.2023.07.24.20.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 20:09:21 -0700 (PDT)
Message-ID: <d2621ad0-8b99-9154-5ff5-509dec2f32a3@bytedance.com>
Date: Tue, 25 Jul 2023 11:09:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 01/47] mm: vmscan: move shrinker-related code into a
 separate file
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-2-zhengqi.arch@bytedance.com>
 <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
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
Cc: kvm@vger.kernel.org, djwong@kernel.org,
 Roman Gushchin <roman.gushchin@linux.dev>, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Linux Memory Management List <linux-mm@kvack.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, cel@kernel.org, x86@kernel.org,
 steven.price@arm.com, cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-nfs@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com,
 Vlastimil Babka <vbabka@suse.cz>, linux-raid@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, netdev <netdev@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/7/25 10:35, Muchun Song wrote:
> 
> 
>> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> The mm/vmscan.c file is too large, so separate the shrinker-related
>> code from it into a separate file. No functional changes.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>> include/linux/shrinker.h |   3 +
>> mm/Makefile              |   4 +-
>> mm/shrinker.c            | 707 +++++++++++++++++++++++++++++++++++++++
>> mm/vmscan.c              | 701 --------------------------------------
>> 4 files changed, 712 insertions(+), 703 deletions(-)
>> create mode 100644 mm/shrinker.c
>>
>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>> index 224293b2dd06..961cb84e51f5 100644
>> --- a/include/linux/shrinker.h
>> +++ b/include/linux/shrinker.h
>> @@ -96,6 +96,9 @@ struct shrinker {
>>   */
>> #define SHRINKER_NONSLAB (1 << 3)
>>
>> +unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
>> +			   int priority);
> 
> A good cleanup, vmscan.c is so huge.
> 
> I'd like to introduce a new header in mm/ directory and contains those
> declarations of functions (like this and other debug function in
> shrinker_debug.c) since they are used internally across mm.

How about putting them in the mm/internal.h file?

> 
> Thanks.
> 

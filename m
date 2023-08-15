Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 537E977CA1C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 11:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7174510E23D;
	Tue, 15 Aug 2023 09:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5315F10E23D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 09:15:02 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bb91c20602so9096535ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 02:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1692090901; x=1692695701;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N6UPah3rxy6GE+IW6hhaEXFukV19/RQgo9PDGSDaxjc=;
 b=B4NWnukFtWBpBFBooLjjX+4xRi6cYrfaI8iegReeVzLQWKPXXt1CxHdKL4/tZ0fNPM
 0UExtQR6YZe58qkKHpbXtHQV0uPapic2RYOUTB+6Pi7LdOE1C7GEcaF7+zgpTtYtD/de
 UlP+/TDXrfMVghqI9OT3wDmB4f+60Ecld4ptmi3g4OGE44+/xTS+dFaCetp2KrysicqF
 +aYy3xTBT6yAIsFwZB/EdPqMFUGo82MatiM8ko8K8L/pW/bDYDRzwOeVlfM6AvdWPq+b
 HcGAAnq5GXzxPWbDmjMNdTVLUEtTfSjxZmvfFI4JrMMNezs7y6COdvHcs3klmaxHW6vC
 FHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692090901; x=1692695701;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N6UPah3rxy6GE+IW6hhaEXFukV19/RQgo9PDGSDaxjc=;
 b=eYdLRcQ3z2RCFLwo5wYwtIpg5KKyIyC1rQy46Zc3ntdsAYjaB3FK3crRQuoe8lwn01
 lrymRtg5Z6EBKQAoOwnEObAIsyyvdd8U4HU6mekSsuC/Y9L/Mvtu10oWNwiigMQyCYTU
 MsflWVky8ZRiCr0oKUohwY52XPLaUFTM2ghmab1mIxWQeCw6mQpnVAmvq1tIRntLHds6
 zJLwCdA+YXbgA3u1Gp6BLa8DtIwXDNVtat6X2gnk2FWym9MWE23Q4f23dcF1LdxXn3Ku
 DLQPn51wLhfTqBXrKzj47dIgqolNTsC5Dj1kfkTPq0Bb1HFTknqkEENP+qq+ZeGmFKgE
 EffA==
X-Gm-Message-State: AOJu0YyD2dnDtAlUM1LZ9QJwT8S6U4DksrgpOUduMxIY9X/gqhv5JsN0
 Ge2nFx8h6HInqqB63GHL3kTVXQ==
X-Google-Smtp-Source: AGHT+IGKaQyK0d17VyjHV7p/Fr8yAF+2JMAJsl65uoihXD9UcmAUSi1eF134pFnOBdZUKl9ThFMr5Q==
X-Received: by 2002:a17:902:e5c8:b0:1bb:83ec:832 with SMTP id
 u8-20020a170902e5c800b001bb83ec0832mr13866844plf.2.1692090901535; 
 Tue, 15 Aug 2023 02:15:01 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1c25:884:3ed:e1db:b610?
 ([240e:694:e21:b::2]) by smtp.gmail.com with ESMTPSA id
 io13-20020a17090312cd00b001b39ffff838sm10630843plb.25.2023.08.15.02.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Aug 2023 02:15:01 -0700 (PDT)
Message-ID: <4f64cd2d-90e8-7902-7ef7-1ac58d51b2a8@bytedance.com>
Date: Tue, 15 Aug 2023 17:14:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4 01/48] mm: move some shrinker-related function
 declarations to mm/internal.h
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-2-zhengqi.arch@bytedance.com>
 <FC3AE898-443D-4ACB-BCB4-0F8F2F48CDD0@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <FC3AE898-443D-4ACB-BCB4-0F8F2F48CDD0@linux.dev>
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
 Linux-MM <linux-mm@kvack.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, cel@kernel.org, x86@kernel.org,
 steven.price@arm.com, cluster-devel@redhat.com, simon.horman@corigine.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 dlemoal@kernel.org, yujie.liu@intel.com, Vlastimil Babka <vbabka@suse.cz>,
 linux-raid@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 tytso@mit.edu, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/8/15 16:36, Muchun Song wrote:
> 
> 
>> On Aug 7, 2023, at 19:08, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> The following functions are only used inside the mm subsystem, so it's
>> better to move their declarations to the mm/internal.h file.
>>
>> 1. shrinker_debugfs_add()
>> 2. shrinker_debugfs_detach()
>> 3. shrinker_debugfs_remove()
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> 
> One nit bellow.
> 
> [...]
> 
>> +
>> +/*
>> + * shrinker related functions
>> + */
> 
> This is a multi-comment format. "/* shrinker related functions. */" is
> the right one-line format of comment.

Will do.

Thanks,
Qi

> 
>> +
>> +#ifdef CONFIG_SHRINKER_DEBUG
>> +extern int shrinker_debugfs_add(struct shrinker *shrinker);
>> +extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
>> +      int *debugfs_id);
>> +extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
>> +    int debugfs_id);
>> +#else /* CONFIG_SHRINKER_DEBUG */
>> +static inline int shrinker_debugfs_add(struct shrinker *shrinker)
>> +{
>> +	return 0;
>> +}
>> +static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
>> +     int *debugfs_id)
>> +{
>> +	*debugfs_id = -1;
>> +	return NULL;
>> +}
>> +static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
>> +	int debugfs_id)
>> +{
>> +}
>> +#endif /* CONFIG_SHRINKER_DEBUG */
>> +
>> #endif /* __MM_INTERNAL_H */
>> -- 
>> 2.30.2
>>
> 

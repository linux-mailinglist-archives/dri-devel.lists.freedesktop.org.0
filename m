Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC57F6BBC37
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 19:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1E710E2F9;
	Wed, 15 Mar 2023 18:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44F410E2F7;
 Wed, 15 Mar 2023 18:34:40 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so1647066wmb.5; 
 Wed, 15 Mar 2023 11:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678905279;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CtOt4k+OA7BRYZzOf48URPO0GcAncf4iHV2OjY+5sf0=;
 b=MQN9M+e8go8FI4ny8BDXc1LSAsz2gjMmKT/F0Sd7C7iz9YMMqs5wJGFa2lBP3V5+hU
 AoZ/WGcXgpC0Xvmm9V5KewSH8Lo8Kx5tCbofldlsApeP65IiwgeW0WbDnNGDhCkXs8+O
 qmG02wTyT2mCjQCiA44UTCAihv6AqedY7h3991+qaiMfWah8GQ0b8W3mJVq6Jv89J7vu
 JS3MmkvKUcBIHHH6SPETQE1zTc2+tN7hpBloGvBuZjwELicbmnODZCQiNaFMTpg+L+z5
 +ZrAPRvjMvYF5xcB2uw9ZTIgKinz7/LwGm4/QUBuKd4uMng0kYjh2IoxiRBFmNSzBcqv
 D+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678905279;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CtOt4k+OA7BRYZzOf48URPO0GcAncf4iHV2OjY+5sf0=;
 b=ivwxmxJMA7daILiVn2VkLBTFOoPpVlKvQXDEOC3ojSwMMPKz3cEAZDNCTpWoG55Zgs
 tUsWSXSwXN+rW9G4Cl+PsqdquX1enm2e0kWu40P9RlpYugdmmWNU1eNEwirWWzd1x/9v
 NFUvM1aAlghnbThs+OFq/FwqsCuqr/bBoZs6jUDPCPzXMsgS8pzqNGG792wcDWQ2pG4h
 z8XnuFWHgOzXiCsGvqlC3Pxjc9zTRqASRN9NI+tOjJlvA8paUmzzaXDAGm6oVRCTpioj
 APuuOqqXPCdUWj5cljalGGzdcNDnmMYp//bXUzR6nw/OPH7YNJoGTeanTiEfHYWkrstq
 ++XQ==
X-Gm-Message-State: AO0yUKUhXo8VjTbxXjj4JBA8CKii59lfLBiWcOsYdwGdXFiSgS97FJV5
 TxC0n5ZSHlntx4BlNUzNDrXQDwLs7Lo=
X-Google-Smtp-Source: AK7set+2LomhmjBH70rgb2Oj8RhcZvpraCp5q19+6NSqH6yHcsC8h6T2Bf0CmjfM7Ac4w4xPBXqh+w==
X-Received: by 2002:a05:600c:3503:b0:3ea:e7f6:f8fa with SMTP id
 h3-20020a05600c350300b003eae7f6f8famr18076778wmq.10.1678905279017; 
 Wed, 15 Mar 2023 11:34:39 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:bb77:36d:cdaf:f7f2?
 ([2a02:908:1256:79a0:bb77:36d:cdaf:f7f2])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c311100b003e733a973d2sm2668415wmo.39.2023.03.15.11.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 11:34:38 -0700 (PDT)
Message-ID: <b6bf19b1-1265-a5cc-7a82-300fe7bdd15b@gmail.com>
Date: Wed, 15 Mar 2023 19:34:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BUG 6.3-rc1] Bad lock in ttm_bo_delayed_delete()
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>
References: <20230307212223.7e49384a@gandalf.local.home>
 <20230307212615.7a099103@gandalf.local.home>
 <b919b550-6da8-f9f0-a0eb-0fd8af513817@amd.com>
 <20230315110949.1e11b3aa@gandalf.local.home>
 <07597f3e-0b35-c22b-91ec-fa3875d6fe22@gmail.com>
 <20230315115712.56b3c21f@gandalf.local.home>
 <20230315133146.3a48206e@gandalf.local.home>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230315133146.3a48206e@gandalf.local.home>
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
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.03.23 um 18:31 schrieb Steven Rostedt:
> On Wed, 15 Mar 2023 11:57:12 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
>
> So I'm looking at the backtraces.
>
>> The WARN_ON triggered:
>>
>> [   21.481449] mpls_gso: MPLS GSO support
>> [   21.488795] IPI shorthand broadcast: enabled
>> [   21.488873] ------------[ cut here ]------------
>> [   21.490101] ------------[ cut here ]------------
>>
>> [   21.491693] WARNING: CPU: 1 PID: 38 at drivers/gpu/drm/ttm/ttm_bo.c:332 ttm_bo_release+0x2ac/0x2fc  <<<---- Line of the added WARN_ON()
> This happened on CPU 1.
>
>> [   21.492940] refcount_t: underflow; use-after-free.
>> [   21.492965] WARNING: CPU: 0 PID: 84 at lib/refcount.c:28 refcount_warn_saturate+0xb6/0xfc
> This happened on CPU 0.
>
>> [   21.496116] Modules linked in:
>> [   21.497197] Modules linked in:
>> [   21.500105] CPU: 1 PID: 38 Comm: kworker/1:1 Not tainted 6.3.0-rc2-test-00047-g6015b1aca1a2-dirty #993
>> [   21.500789] CPU: 0 PID: 84 Comm: kworker/0:1H Not tainted 6.3.0-rc2-test-00047-g6015b1aca1a2-dirty #993
>> [   21.501882] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
>> [   21.503533] sched_clock: Marking stable (20788024762, 714243692)->(22140778105, -638509651)
>> [   21.504080] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
>> [   21.504089] Workqueue: ttm ttm_bo_delayed_delete
>> [   21.507196] Workqueue: events drm_fb_helper_damage_work
>> [   21.509235]
>> [   21.510291] registered taskstats version 1
>> [   21.510302] Running ring buffer tests...
>> [   21.511792]
>> [   21.513870] EIP: refcount_warn_saturate+0xb6/0xfc
>> [   21.515261] EIP: ttm_bo_release+0x2ac/0x2fc
>> [   21.516566] Code: 68 00 27 0c d8 e8 36 3b aa ff 0f 0b 58 c9 c3 90 80 3d 41 c2 37 d8 00 75 8a c6 05 41 c2 37 d8 01 68 2c 27 0c d8 e8 16 3b aa ff <0f> 0b 59 c9 c3 80 3d 3f c2 37 d8 00 0f 85 67 ff ff ff c6 05 3f c2
>> [   21.516998] Code: ff 8d b4 26 00 00 00 00 66 90 0f 0b 8b 43 10 85 c0 0f 84 a1 fd ff ff 8d 76 00 0f 0b 8b 43 28 85 c0 0f 84 9c fd ff ff 8d 76 00 <0f> 0b e9 92 fd ff ff 8d b4 26 00 00 00 00 66 90 c7 43 18 00 00 00
>> [   21.517905] EAX: 00000026 EBX: c129d150 ECX: 00000040 EDX: 00000002
>> [   21.518987] EAX: d78c8550 EBX: c129d134 ECX: c129d134 EDX: 00000001
>> [   21.519337] ESI: c129d0bc EDI: f6f91200 EBP: c2b8bf18 ESP: c2b8bf14
>> [   21.520617] ESI: c129d000 EDI: c126a7a0 EBP: c1839c24 ESP: c1839bec
>> [   21.521546] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
>> [   21.526154] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
>> [   21.526162] CR0: 80050033 CR2: 00000000 CR3: 18506000 CR4: 00150ef0
>> [   21.526166] Call Trace:
>> [   21.526189]  ? ww_mutex_unlock+0x3a/0x94
>> [   21.530300] CR0: 80050033 CR2: ff9ff000 CR3: 18506000 CR4: 00150ef0
>> [   21.531722]  ? ttm_bo_cleanup_refs+0xc4/0x1e0
>> [   21.533114] Call Trace:
>> [   21.534516]  ttm_mem_evict_first+0x3d3/0x568
>> [   21.535901]  ttm_bo_delayed_delete+0x9c/0xa4
>> [   21.537391]  ? kfree+0x6b/0xdc
>> [   21.538901]  process_one_work+0x21a/0x484
>> [   21.540279]  ? ttm_range_man_alloc+0xe0/0xec
>> [   21.540854]  worker_thread+0x14a/0x39c
>> [   21.541714]  ? ttm_range_man_fini_nocheck+0xe8/0xe8
>> [   21.543332]  kthread+0xea/0x10c
>> [   21.544301]  ttm_bo_mem_space+0x1d0/0x1e4
>> [   21.544942]  ? process_one_work+0x484/0x484
>> [   21.545887]  ttm_bo_validate+0xc5/0x19c
>> [   21.546986]  ? kthread_complete_and_exit+0x1c/0x1c
>> [   21.547680]  ttm_bo_init_reserved+0x15e/0x1fc
>> [   21.548716]  ret_from_fork+0x1c/0x28
>> [   21.549650]  qxl_bo_create+0x145/0x20c
> The qxl_bo_create() calls ttm_bo_init_reserved() as the object in question
> is about to be freed.
>
> I'm guessing what is happening here, is that an object was to be freed by
> the delayed_delete, and in the mean time, something else picked it up.
>
> What's protecting this from not being used again?

The reference count. This is pretty clearly an unbalanced reference 
counting issue.

It's just that previously you wouldn't notice it much because we were 
just silently removing the BO from the LRU list without checking if it 
was already removed (and so just damaging a bit of memory).

While now we get tons of errors because the delayed worker actually runs 
no matter if the BO is already freed or not.

Christian.

>
> -- Steve
>


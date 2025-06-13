Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC2FAD894A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 12:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4994E10E0FA;
	Fri, 13 Jun 2025 10:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="vrS4dGqJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059C110E0FA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 10:18:33 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3a376ba6f08so1125229f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 03:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1749809912; x=1750414712;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sV/HZ5Fyhc8ToOvblcP5MmsBAeYj2vL57bHG1ypiZXI=;
 b=vrS4dGqJW5/PAk/W9IzQ6D8KpXwmvLRvnCk0pX+H9ofQsMPdy7pUJx5Nhm65QuU+nd
 O3Z3Ckch+j4BmqAJpuX2ZRZJEC/a3g2GcxDsJfu4V0pyxP9p5QnRPoG8vx//Y/LnE41S
 AAXDTPh/rzmeVKegc3HxY8xwM+0GH1e2gwtHtb14VDFNMap+OhcVG71hBukNdlYQH1gt
 Hvqk2B+ctoKreHvG9/YYr1yYq2HMHRmToaLnLabh1Gk1dO4kEueNFUolyG+kw5yaA8Gx
 saZQgxAF+6GgS6QHirug8kr2UYsx/n/5E/TkXHBcqHbfImyIpKAqpaURpjAfI4AynhQo
 kRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749809912; x=1750414712;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sV/HZ5Fyhc8ToOvblcP5MmsBAeYj2vL57bHG1ypiZXI=;
 b=EAv8vTEtId3+jaLAOikNvXVg4pstNAYlT01z62gZnIQ0y9C5CjSuT/oMj8r8+3ph+3
 NGsbiYhTBGz0B/wSCkQ/2bDZBNPA5GKLVvdStRhv1XuTJqSG6N5c0LPX1+0dkqRVFsYR
 cVGKVo7OH8QB8HB9AkdQcX5h61UWw5lxDvQGftPDYupNrI3EOuNTBsPVUh/EXhTZ3EP3
 mrvTJ77rOgdY6V/JJMGQGWjy19RssZZxQ/UOUe6kAqAvi57QMJRPTnFYOYf5bxA/yclf
 4FgtYpmrW3hvpF1zugcCF5O8ESqGYMcMr3dqQiXxd8xgUeobvY13675NmzBQXq4eHIun
 /+Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0hpYW4YdlYKv9b7H7f2VH3ZXAB19ytLzY9IbFmsRFX0xrP37QlmyGpnq9qVqSmc9zKY4xGp/86WQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT+mLuMxd/L1l1Ed84ZZDEG8bQhQ3bpG9zfoKx9Z1fT5+M3Euj
 sbR7GSvf/oFJPVKxvNq7gps2/CSFBvG4KUiVZVYjT6TL5JTwxfMlJ2Z5Diwc8PG91EE=
X-Gm-Gg: ASbGncvt1clhcnXKWktIJBLCA+x931S+EjNETSHR51IdRlUCNuDvRtV50FiG0OMRBrJ
 P0cTKtdpcqXdTfqlii6Tr9Y1QWat9di6ramNfonQ++0klqR3nUVWHk5DWAr7+UZo4T59XfN+2ht
 pprTyphHfi8DCSsEyMEs9exopclMkkmA1cZzOs8Dq6wEwq3fSNdevGIJ5TF0fyZw3DXoOQTAUJb
 eFMlJV4rNdCZ/O8ao6+newaFOznmtATOX/g/yuGgRaQIzEX1kIiTaW/0T9GBM5x9Ul5BjT9ErOY
 8Xrw/F91YLNFI+hXptJ3yMjoH+OPNYAVNR75XjHpcV1MzhZTYUhREgGaZHnpYNwpXiI8c/xCSPd
 7
X-Google-Smtp-Source: AGHT+IH7fKFaBpyLoTRwg0/xfLemfGo7voqZDJ10wG4sXl7yesgW/PWocqRXN5K86IcVtYvdOvdW3A==
X-Received: by 2002:a05:6000:238a:b0:3a4:f6ba:51da with SMTP id
 ffacd0b85a97d-3a568703f54mr2202296f8f.15.1749809911574; 
 Fri, 13 Jun 2025 03:18:31 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b19b32sm1947500f8f.67.2025.06.13.03.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 03:18:31 -0700 (PDT)
Message-ID: <dca65c78-9af4-4266-b60e-ce13b5a61f06@ursulin.net>
Date: Fri, 13 Jun 2025 11:18:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: tzimmermann@suse.de, dri-devel@lists.freedesktop.org
References: <20250604113234.2520-1-christian.koenig@amd.com>
 <aEBn9o-bARNut3ek@phenom.ffwll.local> <aEByd4gidRpxJkfp@phenom.ffwll.local>
 <7497bb60649f9459b9734514bd320033f45651e2@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <7497bb60649f9459b9734514bd320033f45651e2@intel.com>
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


On 13/06/2025 11:09, Jani Nikula wrote:
> On Wed, 04 Jun 2025, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>> On Wed, Jun 04, 2025 at 05:36:22PM +0200, Simona Vetter wrote:
>>> On Wed, Jun 04, 2025 at 01:32:34PM +0200, Christian König wrote:
>>>> This was added by Sima +10 years ago as a solution to avoid exporting
>>>> multiple dma-bufs for the same GEM object. I tried to remove it before,
>>>> but wasn't 100% sure about all the side effects.
>>>>
>>>> Now Thomas recent modified drm_gem_prime_handle_to_dmabuf() which makes
>>>> it obvious that this is a superflous step. We try to look up the DMA-buf
>>>> by handle handle and if that fails for some reason (must likely because
>>>> the handle is a duplicate) the code just use the DMA-buf from the GEM
>>>> object.
>>>>
>>>> Just using the DMA-buf from the GEM object in the first place has the
>>>> same effect as far as I can see.
>>>
>>> So the history is a bit more funny, might want to add that.
>>>
>>> In d0b2c5334f41 ("drm/prime: Always add exported buffers to the handle
>>> cache") I added this additional lookup. It wasn't part of the bugfix,
>>> but back then the handle list was just a linked list and you could do
>>> lookups in either direction. And I guess I felt like doing a quick lookup
>>> before we grab the next lock makes sense. Premature optimization, I'm
>>> confessing to the crime guilty as charged :-/
>>>
>>> Then Chris Wilson in 077675c1e8a1 ("drm: Convert prime dma-buf <-> handle
>>> to rbtree") and added 2 rb trees to support both directions. At that point
>>> that handle2buf lookup really didn't make much sense anymore, but we just
>>> kept it and it's been in the tree confusing people ever since.
>>>
>>> With that added:
>>>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> lol :-/
>>
>> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>>
>> Cheers, Sima
> 
> This regressed one of our CI IGT tests [1].
> 
> BR,
> Jani.
> 
> 
> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463

It also explodes even more trivially when logging into a KDE Wayland 
session:

[   66.986238] CPU: 1 UID: 112 PID: 1220 Comm: sddm-greeter-qt Tainted: 
G     U              6.16.0-rc1-uaf #424 PREEMPT(full)
[   66.986242] Tainted: [U]=USER
[   66.986244] Hardware name: LENOVO 21CB007AUK/21CB007AUK, BIOS 
N3AET85W (1.50 ) 03/04/2025
[   66.986246] RIP: 0010:drm_prime_destroy_file_private+0x16/0x20
[   66.986250] Code: 00 00 00 00 00 00 5b 31 d2 31 f6 31 ff c3 66 0f 1f 
44 00 00 0f 1f 44 00 00 48 8b 87 90 00 00 00 48 85 c0 75 05 31 c0 31 ff 
c3 <0f> 0b 31 c0 31 ff c3 0f 1f 00 0f 1f 44 00 00 48 8b 47 70 48 89 f1
[   66.986253] RSP: 0018:ffffc90002997c78 EFLAGS: 00010286
[   66.986256] RAX: ffff88812823d550 RBX: ffff888133a00800 RCX: 
0000000000000000
[   66.986259] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
ffff888133a00b80
[   66.986261] RBP: ffff888133a00ad8 R08: 0000000000000000 R09: 
0000000000000000
[   66.986262] R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff88810d8fc000
[   66.986264] R13: ffff888133a00ab0 R14: ffff888133a00ab0 R15: 
dead000000000100
[   66.986266] FS:  0000795148051c80(0000) GS:ffff8884cb7e1000(0000) 
knlGS:0000000000000000
[   66.986269] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   66.986271] CR2: 000079514cc776d0 CR3: 0000000137894005 CR4: 
0000000000772ef0
[   66.986273] PKRU: 55555554
[   66.986275] Call Trace:
[   66.986276]  <TASK>
[   66.986278]  drm_file_free+0x234/0x2a0
[   66.986286]  drm_release_noglobal+0x1b/0x80
[   66.986290]  __fput+0x100/0x2c0
[   66.986296]  __x64_sys_close+0x39/0x80
[   66.986299]  do_syscall_64+0x95/0x1290
[   66.986307]  ? lock_acquire+0xe6/0x2e0
[   66.986311]  ? find_held_lock+0x2b/0x80
[   66.986314]  ? __might_fault+0x44/0x80
[   66.986318]  ? lock_release+0x17b/0x2a0
[   66.986323]  ? rcu_is_watching+0xd/0x40
[   66.986326]  ? __rseq_handle_notify_resume+0x44b/0x5f0
[   66.986332]  ? exit_to_user_mode_loop+0x37/0x150
[   66.986338]  ? entry_SYSCALL_64_after_hwframe+0x4b/0x53
[   66.986341]  ? lockdep_hardirqs_on+0x7c/0x110
[   66.986345]  ? do_syscall_64+0x190/0x1290
[   66.986348]  ? lockdep_hardirqs_on+0x7c/0x110
[   66.986352]  ? do_syscall_64+0x190/0x1290
[   66.986354]  ? do_syscall_64+0x190/0x1290
[   66.986359]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[   66.986361] RIP: 0033:0x79514b2ab6e2
[   66.986364] Code: 08 0f 85 71 3a ff ff 49 89 fb 48 89 f0 48 89 d7 48 
89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 
05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 66 2e 0f 1f 84 00 00 00 00 00 66
[   66.986366] RSP: 002b:00007ffc6e412a78 EFLAGS: 00000246 ORIG_RAX: 
0000000000000003
[   66.986370] RAX: ffffffffffffffda RBX: 0000795148051c80 RCX: 
000079514b2ab6e2
[   66.986371] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
0000000000000013
[   66.986373] RBP: 00007ffc6e412aa0 R08: 0000000000000000 R09: 
0000000000000000
[   66.986375] R10: 0000000000000000 R11: 0000000000000246 R12: 
00005c4e70a4df20
[   66.986377] R13: 00005c4e70a46240 R14: 0000000000000008 R15: 
00005c4e70e0fab8
[   66.986388]  </TASK>
[   66.986390] irq event stamp: 484049
[   66.986391] hardirqs last  enabled at (484055): [<ffffffff813c6602>] 
__up_console_sem+0x62/0x80
[   66.986395] hardirqs last disabled at (484060): [<ffffffff813c65e7>] 
__up_console_sem+0x47/0x80
[   66.986398] softirqs last  enabled at (483398): [<ffffffff8131c50f>] 
__irq_exit_rcu+0xef/0x170
[   66.986402] softirqs last disabled at (483393): [<ffffffff8131c50f>] 
__irq_exit_rcu+0xef/0x170
[   66.986405] ---[ end trace 0000000000000000 ]---

Regards,

Tvrtko

> 
> 
> 
>>
>>>
>>>
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_gem.c      |  2 +-
>>>>   drivers/gpu/drm/drm_internal.h |  1 +
>>>>   drivers/gpu/drm/drm_prime.c    | 56 +++++-----------------------------
>>>>   3 files changed, 10 insertions(+), 49 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>> index 1e659d2660f7..2eacd86e1cf9 100644
>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>> @@ -282,7 +282,7 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>>>>   	if (obj->funcs->close)
>>>>   		obj->funcs->close(obj, file_priv);
>>>>   
>>>> -	drm_prime_remove_buf_handle(&file_priv->prime, id);
>>>> +	drm_prime_remove_buf_handle(&file_priv->prime, obj->dma_buf, id);
>>>>   	drm_vma_node_revoke(&obj->vma_node, file_priv);
>>>>   
>>>>   	drm_gem_object_handle_put_unlocked(obj);
>>>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>>>> index e44f28fd81d3..504565857f4d 100644
>>>> --- a/drivers/gpu/drm/drm_internal.h
>>>> +++ b/drivers/gpu/drm/drm_internal.h
>>>> @@ -86,6 +86,7 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>>>>   void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
>>>>   void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
>>>>   void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>>>> +				 struct dma_buf *dma_buf,
>>>>   				 uint32_t handle);
>>>>   
>>>>   /* drm_managed.c */
>>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>>> index d828502268b8..f4facfa469db 100644
>>>> --- a/drivers/gpu/drm/drm_prime.c
>>>> +++ b/drivers/gpu/drm/drm_prime.c
>>>> @@ -90,7 +90,6 @@ struct drm_prime_member {
>>>>   	uint32_t handle;
>>>>   
>>>>   	struct rb_node dmabuf_rb;
>>>> -	struct rb_node handle_rb;
>>>>   };
>>>>   
>>>>   static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
>>>> @@ -122,45 +121,9 @@ static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
>>>>   	rb_link_node(&member->dmabuf_rb, rb, p);
>>>>   	rb_insert_color(&member->dmabuf_rb, &prime_fpriv->dmabufs);
>>>>   
>>>> -	rb = NULL;
>>>> -	p = &prime_fpriv->handles.rb_node;
>>>> -	while (*p) {
>>>> -		struct drm_prime_member *pos;
>>>> -
>>>> -		rb = *p;
>>>> -		pos = rb_entry(rb, struct drm_prime_member, handle_rb);
>>>> -		if (handle > pos->handle)
>>>> -			p = &rb->rb_right;
>>>> -		else
>>>> -			p = &rb->rb_left;
>>>> -	}
>>>> -	rb_link_node(&member->handle_rb, rb, p);
>>>> -	rb_insert_color(&member->handle_rb, &prime_fpriv->handles);
>>>> -
>>>>   	return 0;
>>>>   }
>>>>   
>>>> -static struct dma_buf *drm_prime_lookup_buf_by_handle(struct drm_prime_file_private *prime_fpriv,
>>>> -						      uint32_t handle)
>>>> -{
>>>> -	struct rb_node *rb;
>>>> -
>>>> -	rb = prime_fpriv->handles.rb_node;
>>>> -	while (rb) {
>>>> -		struct drm_prime_member *member;
>>>> -
>>>> -		member = rb_entry(rb, struct drm_prime_member, handle_rb);
>>>> -		if (member->handle == handle)
>>>> -			return member->dma_buf;
>>>> -		else if (member->handle < handle)
>>>> -			rb = rb->rb_right;
>>>> -		else
>>>> -			rb = rb->rb_left;
>>>> -	}
>>>> -
>>>> -	return NULL;
>>>> -}
>>>> -
>>>>   static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpriv,
>>>>   				       struct dma_buf *dma_buf,
>>>>   				       uint32_t *handle)
>>>> @@ -186,25 +149,28 @@ static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpri
>>>>   }
>>>>   
>>>>   void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>>>> +				 struct dma_buf *dma_buf,
>>>>   				 uint32_t handle)
>>>>   {
>>>>   	struct rb_node *rb;
>>>>   
>>>> +	if (!dma_buf)
>>>> +		return;
>>>> +
>>>>   	mutex_lock(&prime_fpriv->lock);
>>>>   
>>>> -	rb = prime_fpriv->handles.rb_node;
>>>> +	rb = prime_fpriv->dmabufs.rb_node;
>>>>   	while (rb) {
>>>>   		struct drm_prime_member *member;
>>>>   
>>>> -		member = rb_entry(rb, struct drm_prime_member, handle_rb);
>>>> -		if (member->handle == handle) {
>>>> -			rb_erase(&member->handle_rb, &prime_fpriv->handles);
>>>> +		member = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
>>>> +		if (member->dma_buf == dma_buf && member->handle == handle) {
>>>>   			rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
>>>>   
>>>>   			dma_buf_put(member->dma_buf);
>>>>   			kfree(member);
>>>>   			break;
>>>> -		} else if (member->handle < handle) {
>>>> +		} else if (member->dma_buf < dma_buf) {
>>>>   			rb = rb->rb_right;
>>>>   		} else {
>>>>   			rb = rb->rb_left;
>>>> @@ -446,12 +412,6 @@ struct dma_buf *drm_gem_prime_handle_to_dmabuf(struct drm_device *dev,
>>>>   		goto out_unlock;
>>>>   	}
>>>>   
>>>> -	dmabuf = drm_prime_lookup_buf_by_handle(&file_priv->prime, handle);
>>>> -	if (dmabuf) {
>>>> -		get_dma_buf(dmabuf);
>>>> -		goto out;
>>>> -	}
>>>> -
>>>>   	mutex_lock(&dev->object_name_lock);
>>>>   	/* re-export the original imported/exported object */
>>>>   	if (obj->dma_buf) {
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>> -- 
>>> Simona Vetter
>>> Software Engineer, Intel Corporation
>>> http://blog.ffwll.ch
> 


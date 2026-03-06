Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECddLwDGqmnVWwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:18:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5AF220667
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:18:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D2210ED20;
	Fri,  6 Mar 2026 12:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 84C6E10ED1D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 12:18:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7216497;
 Fri,  6 Mar 2026 04:17:58 -0800 (PST)
Received: from [10.1.26.21] (e122027.cambridge.arm.com [10.1.26.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12CEC3F694;
 Fri,  6 Mar 2026 04:18:00 -0800 (PST)
Message-ID: <18dd3a23-02d6-4b1c-84ac-fe3b1181db18@arm.com>
Date: Fri, 6 Mar 2026 12:17:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] drm/panthor: Part ways with drm_gem_shmem_object
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
References: <20260305124320.156606-1-boris.brezillon@collabora.com>
 <20260305124320.156606-6-boris.brezillon@collabora.com>
 <347054fe-8a71-470e-9e1f-7d9f6d328ed5@arm.com>
 <20260306131511.65cd2c73@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260306131511.65cd2c73@fedora>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 4C5AF220667
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.51 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:olvaffe@gmail.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,intel.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,arm.com:mid,arm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 06/03/2026 12:15, Boris Brezillon wrote:
> On Fri, 6 Mar 2026 11:58:09 +0000
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 05/03/2026 12:43, Boris Brezillon wrote:
>>> While drm_gem_shmem_object does most of the job we need it to do, the
>>> way sub-resources (pages, sgt, vmap) are handled and their lifetimes
>>> gets in the way of BO reclaim. There has been attempts to address
>>> that [1], but in the meantime, new gem_shmem users were introduced
>>> (accel drivers), and some of them manually free some of these resources.
>>> This makes things harder to control/sanitize/validate.
>>>
>>> Thomas Zimmerman is not a huge fan of enforcing lifetimes of sub-resources
>>> and forcing gem_shmem users to go through new gem_shmem helpers when they
>>> need manual control of some sort, and I believe this is a dead end if
>>> we don't force users to follow some stricter rules through carefully
>>> designed helpers, because there will always be one user doing crazy things
>>> with gem_shmem_object internals, which ends up tripping out the common
>>> helpers when they are called.
>>>
>>> The consensus we reached was that we would be better off forking
>>> gem_shmem in panthor. So here we are, parting ways with gem_shmem. The
>>> current transition tries to minimize the changes, but there are still
>>> some aspects that are different, the main one being that we no longer
>>> have a pages_use_count, and pages stays around until the GEM object is
>>> destroyed (or when evicted once we've added a shrinker). The sgt also
>>> no longer retains pages. This is losely based on how msm does things by
>>> the way.
>>>
>>> If there's any interest in sharing code (probably with msm, since the
>>> panthor shrinker is going to be losely based on the msm implementation),
>>> we can always change gears and do that once we have everything
>>> working/merged.
>>>
>>> [1]https://patchwork.kernel.org/project/dri-devel/patch/20240105184624.508603-1-dmitry.osipenko@collabora.com/
>>>
>>> v2:
>>> - Fix refcounting
>>> - Add a _locked suffix to a bunch of functions expecting the resv lock
>>>   to be held
>>> - Take the lock before releasing resources in panthor_gem_free_object()
>>>
>>> v3:
>>> - Use ERR_CAST() to fix an ERR-ptr deref
>>> - Add missing resv_[un]lock() around a panthor_gem_backing_unpin_locked()
>>>   call
>>>
>>> v4:
>>> - Fix an error path in panthor_gem_vmap_get_locked()
>>> - Don't leave bo->base.pages with an ERR_PTR()
>>> - Make panthor_gem_{pin,unpin}[_locked]() more consistent
>>> - Don't fail in panthor_gem_dev_map_get_sgt_locked() if the pages are not
>>>   allocated
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>  drivers/gpu/drm/panthor/Kconfig         |   1 -
>>>  drivers/gpu/drm/panthor/panthor_drv.c   |   7 +-
>>>  drivers/gpu/drm/panthor/panthor_fw.c    |  16 +-
>>>  drivers/gpu/drm/panthor/panthor_gem.c   | 700 ++++++++++++++++++++----
>>>  drivers/gpu/drm/panthor/panthor_gem.h   |  62 ++-
>>>  drivers/gpu/drm/panthor/panthor_mmu.c   |  48 +-
>>>  drivers/gpu/drm/panthor/panthor_sched.c |   9 +-
>>>  7 files changed, 669 insertions(+), 174 deletions(-)
>>>  
>>
>> One minor issue below (and of course the kernel test robot's report).
>>
>> [...]
>>
>>> @@ -646,7 +1108,7 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
>>>  					 struct seq_file *m,
>>>  					 struct gem_size_totals *totals)
>>>  {
>>> -	unsigned int refcount = kref_read(&bo->base.base.refcount);
>>> +	unsigned int refcount = kref_read(&bo->base.refcount);
>>>  	char creator_info[32] = {};
>>>  	size_t resident_size;
>>>  	u32 gem_usage_flags = bo->debugfs.flags;
>>> @@ -656,21 +1118,21 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
>>>  	if (!refcount)
>>>  		return;
>>>  
>>> -	resident_size = bo->base.pages ? bo->base.base.size : 0;
>>> +	resident_size = bo->backing.pages ? bo->base.size : 0;
>>>  
>>>  	snprintf(creator_info, sizeof(creator_info),
>>>  		 "%s/%d", bo->debugfs.creator.process_name, bo->debugfs.creator.tgid);
>>>  	seq_printf(m, "%-32s%-16d%-16d%-16zd%-16zd0x%-16lx",
>>>  		   creator_info,
>>> -		   bo->base.base.name,
>>> +		   bo->base.name,
>>>  		   refcount,
>>> -		   bo->base.base.size,
>>> +		   bo->base.size,
>>>  		   resident_size,
>>> -		   drm_vma_node_start(&bo->base.base.vma_node));
>>> +		   drm_vma_node_start(&bo->base.vma_node));
>>>  
>>> -	if (drm_gem_is_imported(&bo->base.base))
>>> +	if (drm_gem_is_imported(&bo->base))
>>>  		gem_state_flags |= PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED;
>>> -	if (bo->base.base.dma_buf)
>>> +	if (bo->base.dma_buf)
>>>  		gem_state_flags |= PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED;
>>>  
>>>  	seq_printf(m, "0x%-8x 0x%-10x", gem_state_flags, gem_usage_flags);
>>> @@ -679,10 +1141,8 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
>>>  		seq_printf(m, "%s\n", bo->label.str ? : "");
>>>  	}
>>>  
>>> -	totals->size += bo->base.base.size;
>>> +	totals->size += bo->base.size;
>>>  	totals->resident += resident_size;
>>> -	if (bo->base.madv > 0)
>>> -		totals->reclaimable += resident_size;  
>>
>> You've dropped the code for calculating totals->reclaimable - but the
>> code for printing this out is still there. So it'll print out "Total
>> reclaimable: 0" always.
> 
> I'm mean, it's always been zero anyway, because we never added MADVISE
> support, so I'm not too sure it matters in this patch. We should
> probably hook that up again in the commit adding the shrinker, based on
> the object state.

Sure, I did double check that it wasn't just waiting for a later patch.
My main concern was leaving the variable around looking like it was
doing something useful.

Thanks,
Steve


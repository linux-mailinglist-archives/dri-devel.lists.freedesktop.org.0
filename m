Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIEBAobhqWnDGwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 21:03:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5369E217EED
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 21:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B17A10EC77;
	Thu,  5 Mar 2026 20:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="DLi5r1xp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DE710EC78
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 20:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772740971; x=1773345771; i=natalie.vock@gmx.de;
 bh=phDzhtlQizgMyOC1yfYUp7PKzd+JtfBxgdJqOaZTptU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=DLi5r1xpIzSSSbdbiiFEZAh/vxLXfsqfPAekyNDHFq5FhaxIPbahClQk8E3rwA5y
 fQOXCx8rVcLpAfckVZt2Z6wwEsKIch5bgMZuLjMqkHeacgkoa8Jr/bxFOI+eqeKXV
 P9mAEKZ26yJyzaPLfWZIgYbiq7Cv2BZ8CzOCBQ3/MR7IrqO9/D51i5tfXYPqNybAS
 9JB7GKRs7gPwPWG3xP/lDbwfxAvFokFRByYNA08rAKVey9QykdM6P82c150alXtTr
 2SVtEqniG32+aGqAVxm7TKR/b8rMLhBJ+OsLhW3IUqs3nZgfvWzAnHtXtsOTzcmbU
 IQAvAEhxmwaVAEOBTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M89Gj-1w2vsG2OW3-00GoLV; Thu, 05
 Mar 2026 21:02:51 +0100
Message-ID: <893f4113-bbc9-4947-8bb2-a4d02d9714fb@gmx.de>
Date: Thu, 5 Mar 2026 21:02:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] cgroup,cgroup/dmem: Add
 (dmem_)cgroup_common_ancestor helper
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260302-dmemcg-aggressive-protect-v5-0-ffd3a2602309@gmx.de>
 <20260302-dmemcg-aggressive-protect-v5-2-ffd3a2602309@gmx.de>
 <c87a99bc-5481-444e-8841-b09d20016cfd@linux.intel.com>
Content-Language: en-US
From: Natalie Vock <natalie.vock@gmx.de>
In-Reply-To: <c87a99bc-5481-444e-8841-b09d20016cfd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:inoGMv/YVdTcuTz04Iy5wDEN4mEJYw7Qk585yWnJHR+efwwrzJB
 1rZM/EwVzWdlj5/KxEW4jVXHzVQhy+FYeSHzpmBS0egYXkUELSpawTPbp3BP9MTkgrE/HWI
 XKBMHRmPaVRH2Da5TMCuVa0u4HW3S4YABwRm2aegdS5wJkGQBieBnq/CwwuvqLP50utSqgJ
 opxi448C7k1DI4TBBqMgg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DBqRdHiFvyw=;tsF+IXvhK92PczdTDWcQMwqPA1p
 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
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
X-Rspamd-Queue-Id: 5369E217EED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:cgroups@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 3/2/26 15:38, Maarten Lankhorst wrote:
> Hey,
>=20
> This should probably have a Co-developed-by: Tejun Heo <tj@kernel.org>

Oh, that's a good point, sorry!

Although, I think I also need to add a S-o-b tag, then, don't I?

Tejun, just to confirm, would you be fine with that? Wouldn't want to=20
claim people certify something without talking to them first :P

>=20
> I need to take a closer look at patch 4 and 6, to add my r-b over the re=
st.
>=20
> Den 2026-03-02 kl. 13:37, skrev Natalie Vock:
>> This helps to find a common subtree of two resources, which is importan=
t
>> when determining whether it's helpful to evict one resource in favor of
>> another.
>>
>> To facilitate this, add a common helper to find the ancestor of two
>> cgroups using each cgroup's ancestor array.
>>
>> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
>> ---
>>   include/linux/cgroup.h      | 21 +++++++++++++++++++++
>>   include/linux/cgroup_dmem.h |  9 +++++++++
>>   kernel/cgroup/dmem.c        | 43 ++++++++++++++++++++++++++++++++++++=
++++---
>>   3 files changed, 70 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/cgroup.h b/include/linux/cgroup.h
>> index bc892e3b37eea..560ae995e3a54 100644
>> --- a/include/linux/cgroup.h
>> +++ b/include/linux/cgroup.h
>> @@ -561,6 +561,27 @@ static inline struct cgroup *cgroup_ancestor(struc=
t cgroup *cgrp,
>>   	return cgrp->ancestors[ancestor_level];
>>   }
>>  =20
>> +/**
>> + * cgroup_common_ancestor - find common ancestor of two cgroups
>> + * @a: first cgroup to find common ancestor of
>> + * @b: second cgroup to find common ancestor of
>> + *
>> + * Find the first cgroup that is an ancestor of both @a and @b, if it =
exists
>> + * and return a pointer to it. If such a cgroup doesn't exist, return =
NULL.
>> + *
>> + * This function is safe to call as long as both @a and @b are accessi=
ble.
>> + */
>> +static inline struct cgroup *cgroup_common_ancestor(struct cgroup *a,
>> +						    struct cgroup *b)
>> +{
>> +	int level;
>> +
>> +	for (level =3D min(a->level, b->level); level >=3D 0; level--)
>> +		if (a->ancestors[level] =3D=3D b->ancestors[level])
>> +			return a->ancestors[level];
>> +	return NULL;
>> +}
>> +
>>   /**
>>    * task_under_cgroup_hierarchy - test task's membership of cgroup anc=
estry
>>    * @task: the task to be tested
>> diff --git a/include/linux/cgroup_dmem.h b/include/linux/cgroup_dmem.h
>> index 1a88cd0c9eb00..444b84f4c253a 100644
>> --- a/include/linux/cgroup_dmem.h
>> +++ b/include/linux/cgroup_dmem.h
>> @@ -28,6 +28,8 @@ bool dmem_cgroup_below_min(struct dmem_cgroup_pool_st=
ate *root,
>>   			   struct dmem_cgroup_pool_state *test);
>>   bool dmem_cgroup_below_low(struct dmem_cgroup_pool_state *root,
>>   			   struct dmem_cgroup_pool_state *test);
>> +struct dmem_cgroup_pool_state *dmem_cgroup_common_ancestor(struct dmem=
_cgroup_pool_state *a,
>> +							   struct dmem_cgroup_pool_state *b);
>>  =20
>>   void dmem_cgroup_pool_state_put(struct dmem_cgroup_pool_state *pool);
>>   #else
>> @@ -75,6 +77,13 @@ static inline bool dmem_cgroup_below_low(struct dmem=
_cgroup_pool_state *root,
>>   	return false;
>>   }
>>  =20
>> +static inline
>> +struct dmem_cgroup_pool_state *dmem_cgroup_common_ancestor(struct dmem=
_cgroup_pool_state *a,
>> +							   struct dmem_cgroup_pool_state *b)
>> +{
>> +	return NULL;
>> +}
>> +
>>   static inline void dmem_cgroup_pool_state_put(struct dmem_cgroup_pool=
_state *pool)
>>   { }
>>  =20
>> diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
>> index 28227405f7cfe..a3ba865f4c68f 100644
>> --- a/kernel/cgroup/dmem.c
>> +++ b/kernel/cgroup/dmem.c
>> @@ -569,11 +569,10 @@ void dmem_cgroup_pool_state_put(struct dmem_cgrou=
p_pool_state *pool)
>>   EXPORT_SYMBOL_GPL(dmem_cgroup_pool_state_put);
>>  =20
>>   static struct dmem_cgroup_pool_state *
>> -get_cg_pool_unlocked(struct dmemcg_state *cg, struct dmem_cgroup_regio=
n *region)
>> +find_cg_pool_unlocked(struct dmemcg_state *cg, struct dmem_cgroup_regi=
on *region)
>>   {
>> -	struct dmem_cgroup_pool_state *pool, *allocpool =3D NULL;
>> +	struct dmem_cgroup_pool_state *pool;
>>  =20
>> -	/* fastpath lookup? */
>>   	rcu_read_lock();
>>   	pool =3D find_cg_pool_locked(cg, region);
>>   	if (pool && !READ_ONCE(pool->inited))
>> @@ -582,6 +581,17 @@ get_cg_pool_unlocked(struct dmemcg_state *cg, stru=
ct dmem_cgroup_region *region)
>>   		pool =3D NULL;
>>   	rcu_read_unlock();
>>  =20
>> +	return pool;
>> +}
>> +
>> +static struct dmem_cgroup_pool_state *
>> +get_cg_pool_unlocked(struct dmemcg_state *cg, struct dmem_cgroup_regio=
n *region)
>> +{
>> +	struct dmem_cgroup_pool_state *pool, *allocpool =3D NULL;
>> +
>> +	/* fastpath lookup? */
>> +	pool =3D find_cg_pool_unlocked(cg, region);
>> +
>>   	while (!pool) {
>>   		spin_lock(&dmemcg_lock);
>>   		if (!region->unregistered)
>> @@ -756,6 +766,33 @@ bool dmem_cgroup_below_low(struct dmem_cgroup_pool=
_state *root,
>>   }
>>   EXPORT_SYMBOL_GPL(dmem_cgroup_below_low);
>>  =20
>> +/**
>> + * dmem_cgroup_common_ancestor(): Find the first common ancestor of tw=
o pools.
>> + * @a: First pool to find the common ancestor of.
>> + * @b: First pool to find the common ancestor of.
>> + *
>> + * Return: The first pool that is a parent of both @a and @b, or NULL =
if either @a or @b are NULL,
>> + * or if such a pool does not exist.
>> + */
>> +struct dmem_cgroup_pool_state *dmem_cgroup_common_ancestor(struct dmem=
_cgroup_pool_state *a,
>> +							   struct dmem_cgroup_pool_state *b)
>> +{
>> +	struct cgroup *ancestor_cgroup;
>> +	struct cgroup_subsys_state *ancestor_css;
>> +
>> +	if (!a || !b)
>> +		return NULL;
>> +
>> +	ancestor_cgroup =3D cgroup_common_ancestor(a->cs->css.cgroup, b->cs->=
css.cgroup);
>> +	if (!ancestor_cgroup)
>> +		return NULL;
>> +
>> +	ancestor_css =3D cgroup_e_css(ancestor_cgroup, &dmem_cgrp_subsys);
>> +
>> +	return find_cg_pool_unlocked(css_to_dmemcs(ancestor_css), a->region);
>> +}
>> +EXPORT_SYMBOL_GPL(dmem_cgroup_common_ancestor);
>  From the naming, I would not expect a reference to be taken to the comm=
on ancestor, especially because the reference through a and b would both b=
e able keep the ancestor alive. Otherwise it would not be an ancestor. Ren=
ame to dmem_cgroup_get_common_ancestor perhaps? Same for the find_, perhap=
s rename to lookup_ or use the unmodified get_cg_pool_unlocked version, be=
cause the common ancestor's pool_state definitely exists if either a or b =
do.

Right. Will rename to dmem_cgroup_get_common_ancestor, and also point=20
out in the documentation that a reference is taken.

Thanks,
Natalie

>=20
> Kind regards,
> ~Maarten Lankhorst


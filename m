Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFzmOC+njGnVrwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:58:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20945125E64
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC85410E623;
	Wed, 11 Feb 2026 15:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC0B310E623
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 15:58:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED2AB339;
 Wed, 11 Feb 2026 07:58:27 -0800 (PST)
Received: from [10.57.54.250] (unknown [10.57.54.250])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D24BD3F632;
 Wed, 11 Feb 2026 07:58:29 -0800 (PST)
Message-ID: <4f90ca0b-4291-43a8-b131-19da3ac848e9@arm.com>
Date: Wed, 11 Feb 2026 15:58:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] drm/panthor: Part ways with drm_gem_shmem_object
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
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
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
References: <20260211080343.1887134-1-boris.brezillon@collabora.com>
 <20260211080343.1887134-6-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260211080343.1887134-6-boris.brezillon@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.51 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,collabora.com,intel.com,google.com];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 20945125E64
X-Rspamd-Action: no action

On 11/02/2026 08:03, Boris Brezillon wrote:
> While drm_gem_shmem_object does most of the job we need it to do, the
> way sub-resources (pages, sgt, vmap) are handled and their lifetimes
> gets in the way of BO reclaim. There has been attempts to address
> that [1], but in the meantime, new gem_shmem users were introduced
> (accel drivers), and some of them manually free some of these resources.
> This makes things harder to control/sanitize/validate.
> 
> Thomas Zimmerman is not a huge fan of enforcing lifetimes of sub-resources
> and forcing gem_shmem users to go through new gem_shmem helpers when they
> need manual control of some sort, and I believe this is a dead end if
> we don't force users to follow some stricter rules through carefully
> designed helpers, because there will always be one user doing crazy things
> with gem_shmem_object internals, which ends up tripping out the common
> helpers when they are called.
> 
> The consensus we reached was that we would be better off forking
> gem_shmem in panthor. So here we are, parting ways with gem_shmem. The
> current transition tries to minimize the changes, but there are still
> some aspects that are different, the main one being that we no longer
> have a pages_use_count, and pages stays around until the GEM object is
> destroyed (or when evicted once we've added a shrinker). The sgt also
> no longer retains pages. This is losely based on how msm does things by
> the way.
> 
> If there's any interest in sharing code (probably with msm, since the
> panthor shrinker is going to be losely based on the msm implementation),
> we can always change gears and do that once we have everything
> working/merged.
> 
> [1]https://patchwork.kernel.org/project/dri-devel/patch/20240105184624.508603-1-dmitry.osipenko@collabora.com/
> 
> v2:
> - Fix refcounting
> - Add a _locked suffix to a bunch of functions expecting the resv lock
>   to be held
> - Take the lock before releasing resources in panthor_gem_free_object()
> 
> v3:
> - Use ERR_CAST() to fix an ERR-ptr deref
> - Add missing resv_[un]lock() around a panthor_gem_backing_unpin_locked()
>   call
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Looks good, but one issue I missed previously below.

[...]

> +
> +static void *
> +panthor_gem_vmap_get_locked(struct panthor_gem_object *bo)
> +{
> +	pgprot_t prot = PAGE_KERNEL;
> +	void *vaddr;
> +	int ret;
> +
> +	dma_resv_assert_held(bo->base.resv);
> +
> +	if (drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base)))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (refcount_inc_not_zero(&bo->cmap.vaddr_use_count)) {
> +		drm_WARN_ON_ONCE(bo->base.dev, !bo->cmap.vaddr);
> +		return bo->cmap.vaddr;
> +	}
> +
> +	ret = panthor_gem_backing_pin_locked(bo);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = panthor_gem_prep_for_cpu_map_locked(bo);
> +	if (ret)
> +		return ERR_PTR(ret);

This should be "goto err_unpin" to drop the pin.

Thanks,
Steve

> +
> +	if (should_map_wc(bo))
> +		prot = pgprot_writecombine(prot);
> +
> +	vaddr = vmap(bo->backing.pages, bo->base.size >> PAGE_SHIFT, VM_MAP, prot);
> +	if (!vaddr) {
> +		ret = -ENOMEM;
> +		goto err_unpin;
> +	}
> +
> +	bo->cmap.vaddr = vaddr;
> +	refcount_set(&bo->cmap.vaddr_use_count, 1);
> +	return vaddr;
> +
> +err_unpin:
> +	panthor_gem_backing_unpin_locked(bo);
> +	return ERR_PTR(ret);
> +}
> +

[...]

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781FAC8AEB4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 17:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACAB10E148;
	Wed, 26 Nov 2025 16:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0tAqNEVW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CTusdpC5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0tAqNEVW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CTusdpC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9026C10E148
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 16:20:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 181D222533;
 Wed, 26 Nov 2025 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764174010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=griXGCwC2cX+QY1JG+B+j6ITpIqbNGa8OMBvAEk1Wqk=;
 b=0tAqNEVWCEjpoWgKwgidypENukNyyRY63yPMKVY/+MiudN0WqZMxissRIBh4fPgu8ZUySl
 sN9wCcEsLit0NHPM00DtH8ZhIKnTJZx6NdUEeLqKuqKS8XJ+eeCbaASUItqSgAyM3VrFCp
 5hLe9/PobYpujaHfb45NNpBQ910Yv7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764174010;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=griXGCwC2cX+QY1JG+B+j6ITpIqbNGa8OMBvAEk1Wqk=;
 b=CTusdpC5wpF5Ujwh4rutb4WL88ThLPMpWrjRvmGTXZQu1s3+BIA1uQuZUbd0TJ/gBJ95lx
 eYMGVmN8J9eI2+Bw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0tAqNEVW;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CTusdpC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764174010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=griXGCwC2cX+QY1JG+B+j6ITpIqbNGa8OMBvAEk1Wqk=;
 b=0tAqNEVWCEjpoWgKwgidypENukNyyRY63yPMKVY/+MiudN0WqZMxissRIBh4fPgu8ZUySl
 sN9wCcEsLit0NHPM00DtH8ZhIKnTJZx6NdUEeLqKuqKS8XJ+eeCbaASUItqSgAyM3VrFCp
 5hLe9/PobYpujaHfb45NNpBQ910Yv7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764174010;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=griXGCwC2cX+QY1JG+B+j6ITpIqbNGa8OMBvAEk1Wqk=;
 b=CTusdpC5wpF5Ujwh4rutb4WL88ThLPMpWrjRvmGTXZQu1s3+BIA1uQuZUbd0TJ/gBJ95lx
 eYMGVmN8J9eI2+Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B2953EA63;
 Wed, 26 Nov 2025 16:20:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kSXsGLkoJ2lRLQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Nov 2025 16:20:09 +0000
Message-ID: <bcba3b95-aa46-497a-b76f-e96455bf7ce8@suse.de>
Date: Wed, 26 Nov 2025 17:20:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/16] drm/panfrost,panthor: Cached maps and explicit
 flushing
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com
References: <20251126124455.3656651-1-boris.brezillon@collabora.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20251126124455.3656651-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[27]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,collabora.com,nvidia.com,igalia.com,intel.com,imgtec.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,amd.com];
 DKIM_TRACE(0.00)[suse.de:+]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 TAGGED_RCPT(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 R_RATELIMIT(0.00)[to_ip_from(RLgosu6qu4h11rje89ht7rjgg5)];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url, gitlab.freedesktop.org:url,
 suse.de:mid, suse.de:dkim, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 181D222533
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

Hi

Am 26.11.25 um 13:44 schrieb Boris Brezillon:
> This series implements cached maps and explicit flushing for both panfrost
> and panthor. To avoid code/bug duplication, the tricky guts of the cache
> flushing ioctl which walk the sg list are broken into a new common shmem
> helper which can be used by any driver.

Gem-shmem is getting more and more complicated. I think gem-shmem would 
be better off to be a simple implementation for all the drivers that use 
shadow buffering and software rendering. There are plenty of them. And 
drivers like the ones in sysfb/ are our failure-mode fallback. They 
should have non-complicated memory management wherever possible.

Therefore, could we first duplicate the existing gem-shmem code into 
gem-uma as we discussed recently on IRC? The changes are simple:

- copy the existing gem-shmem to gem-uma (plus renames)
- convert panthor and panfrost to the new interfaces

And on top of that, further improvements, such as the series at hand, 
could be done. Later we'd convert other drivers to gem-uma where it 
fits, such as lima.

Best regards
Thomas

>
> The PanVK MR to use this lives here:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36385
>
> The questions about the DMA-API based CPU-cache-flush mechanism used
> in this patchset have been dropped. After briefly discussing it with
> Sima and Robin, it seems there's a consensus on the fact we should
> probably expose CPU cache maintenance without going through the DMA
> API (extending drm_cache? providing MM helpers for CPU cache
> flush/invalidation? It's not clear yet how, but this will be discussed
> in a separate thread). In the meantime, we can rely on dma_sync because
> that's good enough for our usecase.
>
> Changes in v2:
> - Expose the coherency so userspace can know when it should skip cache
>    maintenance
> - Hook things up at drm_gem_object_funcs level to dma-buf cpu_prep hooks
>    can be implemented generically
> - Revisit the semantics of the flags passed to gem_sync()
> - Add BO_QUERY_INFO ioctls to query BO flags on imported objects and
>    let the UMD know when cache maintenance is needed on those
>
> Changes in v3:
> - New patch to fix panthor_gpu_coherency_set()
> - No other major changes, check each patch changelog for more details
>
> Changes in v4:
> - Two trivial fixes, check each patch changelog for more details
>
> Changes in v5:
> - Add a way to overload dma_buf_ops while still relying on the drm_prime
>    boilerplate
> - Add default shmem implementation for
>    dma_buf_ops::{begin,end}_cpu_access()
> - Provide custom dma_buf_ops to deal with CPU cache flushes around CPU
>    accesses when the BO is CPU-cacheable
> - Go back to a version of drm_gem_shmem_sync() that only deals with
>    cache maintenance, and adjust the semantics to make it clear this is
>    the only thing it cares about
> - Adjust the BO_SYNC ioctls according to the new drm_gem_shmem_sync()
>    semantics
>
> Changes in v6:
> - No major changes, check the changelog in each patch for more details
>
> Boris Brezillon (10):
>    drm/prime: Simplify life of drivers needing custom dma_buf_ops
>    drm/shmem: Provide a generic {begin,end}_cpu_access() implementation
>    drm/panthor: Provide a custom dma_buf implementation
>    drm/panthor: Fix panthor_gpu_coherency_set()
>    drm/panthor: Expose the selected coherency protocol to the UMD
>    drm/panthor: Add a PANTHOR_BO_SYNC ioctl
>    drm/panthor: Add an ioctl to query BO flags
>    drm/panfrost: Provide a custom dma_buf implementation
>    drm/panfrost: Expose the selected coherency protocol to the UMD
>    drm/panfrost: Add an ioctl to query BO flags
>
> Faith Ekstrand (5):
>    drm/shmem: Add a drm_gem_shmem_sync() helper
>    drm/panthor: Bump the driver version to 1.6
>    drm/panfrost: Add a PANFROST_SYNC_BO ioctl
>    drm/panfrost: Add flag to map GEM object Write-Back Cacheable
>    drm/panfrost: Bump the driver version to 1.6
>
> Loïc Molinari (1):
>    drm/panthor: Add flag to map GEM object Write-Back Cacheable
>
>   drivers/gpu/drm/drm_gem_shmem_helper.c     | 207 +++++++++++++++++++++
>   drivers/gpu/drm/drm_prime.c                |  10 +-
>   drivers/gpu/drm/panfrost/panfrost_device.h |   1 +
>   drivers/gpu/drm/panfrost/panfrost_drv.c    | 101 +++++++++-
>   drivers/gpu/drm/panfrost/panfrost_gem.c    |  67 +++++++
>   drivers/gpu/drm/panfrost/panfrost_gem.h    |   9 +
>   drivers/gpu/drm/panfrost/panfrost_gpu.c    |  26 ++-
>   drivers/gpu/drm/panfrost/panfrost_regs.h   |  10 +-
>   drivers/gpu/drm/panthor/panthor_device.c   |  10 +-
>   drivers/gpu/drm/panthor/panthor_drv.c      |  79 +++++++-
>   drivers/gpu/drm/panthor/panthor_gem.c      |  71 ++++++-
>   drivers/gpu/drm/panthor/panthor_gem.h      |   4 +
>   drivers/gpu/drm/panthor/panthor_gpu.c      |   2 +-
>   drivers/gpu/drm/panthor/panthor_sched.c    |  18 +-
>   include/drm/drm_drv.h                      |   8 +
>   include/drm/drm_gem_shmem_helper.h         |  24 +++
>   include/uapi/drm/panfrost_drm.h            |  76 +++++++-
>   include/uapi/drm/panthor_drm.h             | 157 +++++++++++++++-
>   18 files changed, 857 insertions(+), 23 deletions(-)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



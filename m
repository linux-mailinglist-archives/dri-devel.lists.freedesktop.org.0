Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AADA70366
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 15:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B3010E57B;
	Tue, 25 Mar 2025 14:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="N0iBIPJG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9/Gw5bYZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N0iBIPJG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9/Gw5bYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA9710E57B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 14:17:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FC9A1F391;
 Tue, 25 Mar 2025 14:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742912278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Hs0YS/wfSFYXl/1DQ7zM/1hagYFnz5mjomQwY05XTYA=;
 b=N0iBIPJGcRYDyIpf4VbYaEt5J5kVt7Eiyc2Beji0esbJsh1rhpq30WGbtpdbwOD5OZYVK4
 Oph+pAe+JlkWtdB4iE6rQR/e0YiXNb529nbrnvq3RPugj1AYL/6k5tIpwRbLJ5A3gbJYOR
 ASfN8hJg3HnVA0We06Ol1VL5LOeUA8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742912278;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Hs0YS/wfSFYXl/1DQ7zM/1hagYFnz5mjomQwY05XTYA=;
 b=9/Gw5bYZk5KykOeuXJv/cQE8ugvOi4BkqIm0MbmcifsAcru9DrakCF/ETl9UAsuQNo48C2
 I+dU3KvkEMl/YNBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742912278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Hs0YS/wfSFYXl/1DQ7zM/1hagYFnz5mjomQwY05XTYA=;
 b=N0iBIPJGcRYDyIpf4VbYaEt5J5kVt7Eiyc2Beji0esbJsh1rhpq30WGbtpdbwOD5OZYVK4
 Oph+pAe+JlkWtdB4iE6rQR/e0YiXNb529nbrnvq3RPugj1AYL/6k5tIpwRbLJ5A3gbJYOR
 ASfN8hJg3HnVA0We06Ol1VL5LOeUA8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742912278;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Hs0YS/wfSFYXl/1DQ7zM/1hagYFnz5mjomQwY05XTYA=;
 b=9/Gw5bYZk5KykOeuXJv/cQE8ugvOi4BkqIm0MbmcifsAcru9DrakCF/ETl9UAsuQNo48C2
 I+dU3KvkEMl/YNBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D2B13137AC;
 Tue, 25 Mar 2025 14:17:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8WSuMRW74mcwGgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Mar 2025 14:17:57 +0000
Message-ID: <0e0686da-ae96-4a7a-81b2-b9ece1fa4837@suse.de>
Date: Tue, 25 Mar 2025 15:17:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 00/10] Add generic DRM-shmem memory shrinker (part 1)
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
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
In-Reply-To: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[collabora.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,amd.com,redhat.com,arm.com,imgtec.com];
 RCPT_COUNT_TWELVE(0.00)[15]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
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

I've looked through this before, so

Acked-by: Thomas Zimmermann <tzimmermann@suse.d>

for the series.

Am 22.03.25 um 22:25 schrieb Dmitry Osipenko:
> Hi,
>
> This a continuation of a year-old series that adds generic DRM-shmem
> shrinker [1]. The old series became too big with too many patches, more
> reasonable to split it up into multiple smaller patchsets. Here is
> the firtst part that makes preparatory DRM changes.
>
> [1] https://lore.kernel.org/dri-devel/20240105184624.508603-1-dmitry.osipenko@collabora.com/
>
> Changelog:
>
> v20:- Rebased on recent drm-misc. Added r-bs that were given to v19.
>
> Dmitry Osipenko (10):
>    drm/gem: Change locked/unlocked postfix of drm_gem_v/unmap() function
>      names
>    drm/gem: Add _locked postfix to functions that have unlocked
>      counterpart
>    drm/gem: Document locking rule of vmap and evict callbacks
>    drm/shmem-helper: Make all exported symbols GPL
>    drm/shmem-helper: Refactor locked/unlocked functions
>    drm/shmem-helper: Remove obsoleted is_iomem test
>    drm/shmem-helper: Add and use pages_pin_count
>    drm/shmem-helper: Use refcount_t for pages_use_count
>    drm/shmem-helper: Switch drm_gem_shmem_vmap/vunmap to use pin/unpin
>    drm/shmem-helper: Use refcount_t for vmap_use_count
>
>   drivers/gpu/drm/drm_client.c                  |  10 +-
>   drivers/gpu/drm/drm_gem.c                     |  26 ++--
>   drivers/gpu/drm/drm_gem_framebuffer_helper.c  |   6 +-
>   drivers/gpu/drm/drm_gem_shmem_helper.c        | 145 +++++++++---------
>   drivers/gpu/drm/drm_internal.h                |   4 +-
>   drivers/gpu/drm/drm_prime.c                   |   4 +-
>   drivers/gpu/drm/imagination/pvr_gem.c         |   4 +-
>   drivers/gpu/drm/lima/lima_gem.c               |   4 +-
>   drivers/gpu/drm/lima/lima_sched.c             |   4 +-
>   drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
>   drivers/gpu/drm/panfrost/panfrost_dump.c      |   4 +-
>   .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |   2 +-
>   drivers/gpu/drm/panfrost/panfrost_mmu.c       |   2 +-
>   drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |   6 +-
>   drivers/gpu/drm/panthor/panthor_gem.h         |   4 +-
>   drivers/gpu/drm/panthor/panthor_sched.c       |   4 +-
>   drivers/gpu/drm/tests/drm_gem_shmem_test.c    |  28 ++--
>   include/drm/drm_gem.h                         |  15 +-
>   include/drm/drm_gem_shmem_helper.h            |  45 ++++--
>   19 files changed, 167 insertions(+), 152 deletions(-)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


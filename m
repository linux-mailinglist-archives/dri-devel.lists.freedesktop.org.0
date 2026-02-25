Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHCFDk/enmkTXgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:34:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FDF1968BC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E553610E259;
	Wed, 25 Feb 2026 11:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="KFqeXe5m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="73bPQfUX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VPIRHKg7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XkD1UiKJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEC710E259
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:34:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A550D5C5B4;
 Wed, 25 Feb 2026 11:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772019274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=06rR0BzSAqyocoz661s88dhkzq7l5Ry/ExxLEADtw6Y=;
 b=KFqeXe5mX7IkzCXMPUSjqOZEMi4J+b1hIMPunZzDTp5Ab3zTdtXpLT90A2d44jNnxE1rc0
 ZjCHhX60opUx0tEMO9JahvF8/NjsdOiZlNDIhFIto0MEBf1NkTvr9rZVze+Eoep7YkLVsT
 5MKCLLtAOaTHbWMYypvACUoecn1aHcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772019274;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=06rR0BzSAqyocoz661s88dhkzq7l5Ry/ExxLEADtw6Y=;
 b=73bPQfUXLwY0J8NOY6ANi6i80szQNjySSuQtnKxpr3TP/0Vj000ppmldpZR7b97YvaX49s
 SvcqqB0SVWDhERCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772019273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=06rR0BzSAqyocoz661s88dhkzq7l5Ry/ExxLEADtw6Y=;
 b=VPIRHKg7Hv3bQTLdgZwq1PScdkfg1VUblMH/DiAd+bIAqsQbYRBI0mO9nyY78I60U0YVEi
 pt6S22B3xnK+IZBnh4mwzuQpzwfxkjC+G9xalGfYmp81QfNGpz5Ptg2x9X0ubowQzlieup
 le+Y2XNwtlCkwgAn0Obynxoaa7QUxh4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772019273;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=06rR0BzSAqyocoz661s88dhkzq7l5Ry/ExxLEADtw6Y=;
 b=XkD1UiKJlcjoeVUsLCNTuM9qeG9KzMTJJqf+I3wRltmAnnfVN8xiHLCOBVvQagZKX/geyL
 HbCxGn8c71G6qqAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F9573EA65;
 Wed, 25 Feb 2026 11:34:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1kuxEUnenml+HwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Feb 2026 11:34:33 +0000
Message-ID: <04bc032c-3b6c-424c-b928-302a602d08bf@suse.de>
Date: Wed, 25 Feb 2026 12:34:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/gem-shmem: Track folio accessed/dirty status
 in vmap
To: Frank Binns <Frank.Binns@imgtec.com>, Matt Coster
 <Matt.Coster@imgtec.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "loic.molinari@collabora.com" <loic.molinari@collabora.com>,
 "willy@infradead.org" <willy@infradead.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20260209133241.238813-1-tzimmermann@suse.de>
 <20260209133241.238813-7-tzimmermann@suse.de>
 <d8d52d86fae1c3bb153cebb3ec154c84470804b8.camel@imgtec.com>
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
In-Reply-To: <d8d52d86fae1c3bb153cebb3ec154c84470804b8.camel@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.Binns@imgtec.com,m:Matt.Coster@imgtec.com,m:simona@ffwll.ch,m:airlied@gmail.com,m:boris.brezillon@collabora.com,m:loic.molinari@collabora.com,m:willy@infradead.org,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:linux-mm@kvack.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[imgtec.com,ffwll.ch,gmail.com,collabora.com,infradead.org,kernel.org,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,imgtec.com:email]
X-Rspamd-Queue-Id: 98FDF1968BC
X-Rspamd-Action: no action



Am 25.02.26 um 11:57 schrieb Frank Binns:
> Hi Thomas,
>
> On Mon, 2026-02-09 at 14:27 +0100, Thomas Zimmermann wrote:
>> On successful vmap, set the page_mark_accessed_on_put and _dirty_on_put
>> flags in the gem-shmem object. Signals that the contained pages require
>> LRU and dirty tracking when they are being released back to SHMEM. Clear
>> these flags on put, so that the buffer remains quiet until the next call
>> to vmap. There's no means of handling dirty status in vmap as there's no
>> write-only mapping available.
>>
>> Both flags, _accessed_on_put and _dirty_on_put, have always been part of
>> the gem-shmem object, but never used much. So most drivers did not track
>> the page status correctly.
>>
>> Only the v3d and imagination drivers make limited use of _dirty_on_put. In
>> the case of imagination, move the flag setting from init to cleanup. This
>> ensures writeback of modified pages but does not interfere with the
>> internal vmap/vunmap calls. V3d already implements this behaviour.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> # gem-shmem
> The change to the imagination driver is:
>
> Acked-by: Frank Binns <frank.binns@imgtec.com>
> Tested-by: Frank Binns <frank.binns@imgtec.com>

Great, thanks a lot.

>
> Thanks
> Frank
>
>> ---
>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++++
>>   drivers/gpu/drm/imagination/pvr_gem.c  | 6 ++++--
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index 0c86ad40a049..dda9af9bf5b3 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -265,6 +265,8 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>>   				  shmem->pages_mark_dirty_on_put,
>>   				  shmem->pages_mark_accessed_on_put);
>>   		shmem->pages = NULL;
>> +		shmem->pages_mark_accessed_on_put = false;
>> +		shmem->pages_mark_dirty_on_put = false;
>>   	}
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
>> @@ -397,6 +399,8 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>>   		} else {
>>   			iosys_map_set_vaddr(map, shmem->vaddr);
>>   			refcount_set(&shmem->vmap_use_count, 1);
>> +			shmem->pages_mark_accessed_on_put = true;
>> +			shmem->pages_mark_dirty_on_put = true;
>>   		}
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/imagination/pvr_gem.c
>> index c07c9a915190..307b02c916d4 100644
>> --- a/drivers/gpu/drm/imagination/pvr_gem.c
>> +++ b/drivers/gpu/drm/imagination/pvr_gem.c
>> @@ -25,7 +25,10 @@
>>   
>>   static void pvr_gem_object_free(struct drm_gem_object *obj)
>>   {
>> -	drm_gem_shmem_object_free(obj);
>> +	struct drm_gem_shmem_object *shmem_obj = to_drm_gem_shmem_obj(obj);
>> +
>> +	shmem_obj->pages_mark_dirty_on_put = true;
>> +	drm_gem_shmem_free(shmem_obj);
>>   }
>>   
>>   static struct dma_buf *pvr_gem_export(struct drm_gem_object *obj, int flags)
>> @@ -363,7 +366,6 @@ pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
>>   	if (IS_ERR(shmem_obj))
>>   		return ERR_CAST(shmem_obj);
>>   
>> -	shmem_obj->pages_mark_dirty_on_put = true;
>>   	shmem_obj->map_wc = !(flags & PVR_BO_CPU_CACHED);
>>   	pvr_obj = shmem_gem_to_pvr_gem(shmem_obj);
>>   	pvr_obj->flags = flags;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



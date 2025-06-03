Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE592ACC6CD
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 14:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5365B10E013;
	Tue,  3 Jun 2025 12:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="EMFK6w35";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l/O9T+6O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EMFK6w35";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l/O9T+6O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8C710E1B7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 12:40:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2ACA11F7B5;
 Tue,  3 Jun 2025 12:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748954439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MmB0IG5i/ot/uj8oiNr6ycLyY1acTI0Bjk/0dnYdgUU=;
 b=EMFK6w3555N4zZCyeab240OMkr9lXLZFsBLwlXMOof9W//ABEtSKm68rqPLIlSwv1JoE/H
 mADaaxei4n0jAeqSAne6vVqU2QF3ESmCIgY/iFrQvlD4VbvEKEH1BhgqGib5X8t8lq+/ba
 5C/6j5oF1RBgGnajpngTSCYfGrQIOVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748954439;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MmB0IG5i/ot/uj8oiNr6ycLyY1acTI0Bjk/0dnYdgUU=;
 b=l/O9T+6OCL4gABskVPPQBdPJ3uKUoXwnBOAzmmWMqTblHlxEGFRqZwQusXzJ8aU+EtENQB
 44SUjulBslp5z/Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748954439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MmB0IG5i/ot/uj8oiNr6ycLyY1acTI0Bjk/0dnYdgUU=;
 b=EMFK6w3555N4zZCyeab240OMkr9lXLZFsBLwlXMOof9W//ABEtSKm68rqPLIlSwv1JoE/H
 mADaaxei4n0jAeqSAne6vVqU2QF3ESmCIgY/iFrQvlD4VbvEKEH1BhgqGib5X8t8lq+/ba
 5C/6j5oF1RBgGnajpngTSCYfGrQIOVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748954439;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MmB0IG5i/ot/uj8oiNr6ycLyY1acTI0Bjk/0dnYdgUU=;
 b=l/O9T+6OCL4gABskVPPQBdPJ3uKUoXwnBOAzmmWMqTblHlxEGFRqZwQusXzJ8aU+EtENQB
 44SUjulBslp5z/Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA89F13A1D;
 Tue,  3 Jun 2025 12:40:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZHEMNEbtPmjyfAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Jun 2025 12:40:38 +0000
Message-ID: <35b01b87-6345-4d59-99be-e39daa226dd5@suse.de>
Date: Tue, 3 Jun 2025 14:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/gem: Fix race in drm_gem_handle_create_tail()
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@intel.com>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-2-simona.vetter@ffwll.ch>
 <2e60074d-8efd-4880-8620-9d9572583c88@suse.de>
 <aD7gcvEaZzoDRRc1@phenom.ffwll.local>
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
In-Reply-To: <aD7gcvEaZzoDRRc1@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,vger.kernel.org,kernel.org,gmail.com,ffwll.ch,intel.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:email, intel.com:email,
 ffwll.ch:email, imap1.dmz-prg2.suse.org:helo]
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

Hi

Am 03.06.25 um 13:45 schrieb Simona Vetter:
> On Mon, Jun 02, 2025 at 05:15:58PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 28.05.25 um 11:12 schrieb Simona Vetter:
>>> Object creation is a careful dance where we must guarantee that the
>>> object is fully constructed before it is visible to other threads, and
>>> GEM buffer objects are no difference.
>>>
>>> Final publishing happens by calling drm_gem_handle_create(). After
>>> that the only allowed thing to do is call drm_gem_object_put() because
>>> a concurrent call to the GEM_CLOSE ioctl with a correctly guessed id
>>> (which is trivial since we have a linear allocator) can already tear
>>> down the object again.
>>>
>>> Luckily most drivers get this right, the very few exceptions I've
>>> pinged the relevant maintainers for. Unfortunately we also need
>>> drm_gem_handle_create() when creating additional handles for an
>>> already existing object (e.g. GETFB ioctl or the various bo import
>>> ioctl), and hence we cannot have a drm_gem_handle_create_and_put() as
>>> the only exported function to stop these issues from happening.
>>>
>>> Now unfortunately the implementation of drm_gem_handle_create() isn't
>>> living up to standards: It does correctly finishe object
>>> initialization at the global level, and hence is safe against a
>>> concurrent tear down. But it also sets up the file-private aspects of
>>> the handle, and that part goes wrong: We fully register the object in
>>> the drm_file.object_idr before calling drm_vma_node_allow() or
>>> obj->funcs->open, which opens up races against concurrent removal of
>>> that handle in drm_gem_handle_delete().
>>>
>>> Fix this with the usual two-stage approach of first reserving the
>>> handle id, and then only registering the object after we've completed
>>> the file-private setup.
>>>
>>> Jacek reported this with a testcase of concurrently calling GEM_CLOSE
>>> on a freshly-created object (which also destroys the object), but it
>>> should be possible to hit this with just additional handles created
>>> through import or GETFB without completed destroying the underlying
>>> object with the concurrent GEM_CLOSE ioctl calls.
>>>
>>> Note that the close-side of this race was fixed in f6cd7daecff5 ("drm:
>>> Release driver references to handle before making it available
>>> again"), which means a cool 9 years have passed until someone noticed
>>> that we need to make this symmetry or there's still gaps left :-/
>>> Without the 2-stage close approach we'd still have a race, therefore
>>> that's an integral part of this bugfix.
>>>
>>> More importantly, this means we can have NULL pointers behind
>>> allocated id in our drm_file.object_idr. We need to check for that
>>> now:
>>>
>>> - drm_gem_handle_delete() checks for ERR_OR_NULL already
>>>
>>> - drm_gem.c:object_lookup() also chekcs for NULL
>>>
>>> - drm_gem_release() should never be called if there's another thread
>>>     still existing that could call into an IOCTL that creates a new
>>>     handle, so cannot race. For paranoia I added a NULL check to
>>>     drm_gem_object_release_handle() though.
>>>
>>> - most drivers (etnaviv, i915, msm) are find because they use
>>>     idr_find, which maps both ENOENT and NULL to NULL.
>>>
>>> - vmgfx is already broken vmw_debugfs_gem_info_show() because NULL
>>>     pointers might exist due to drm_gem_handle_delete(). This needs a
>>>     separate patch. This is because idr_for_each_entry terminates on the
>>>     first NULL entry and so might not iterate over everything.
>>>
>>> - similar for amd in amdgpu_debugfs_gem_info_show() and
>>>     amdgpu_gem_force_release(). The latter is really questionable though
>>>     since it's a best effort hack and there's no way to close all the
>>>     races. Needs separate patches.
>>>
>>> - xe is really broken because it not uses idr_for_each_entry() but
>>>     also drops the drm_file.table_lock, which can wreak the idr iterator
>>>     state if you're unlucky enough. Maybe another reason to look into
>>>     the drm fdinfo memory stats instead of hand-rolling too much.
>>>
>>> - drm_show_memory_stats() is also broken since it uses
>>>     idr_for_each_entry. But since that's a preexisting bug I'll follow
>>>     up with a separate patch.
>>>
>>> Reported-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> Cc: stable@vger.kernel.org
>>> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Signed-off-by: Simona Vetter <simona.vetter@intel.com>
>>> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
>>> ---
>>>    drivers/gpu/drm/drm_gem.c | 10 +++++++++-
>>>    include/drm/drm_file.h    |  3 +++
>>>    2 files changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index 1e659d2660f7..e4e20dda47b1 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -279,6 +279,9 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>>>    	struct drm_file *file_priv = data;
>>>    	struct drm_gem_object *obj = ptr;
>>> +	if (WARN_ON(!data))
>>> +		return 0;
>>> +
>>>    	if (obj->funcs->close)
>>>    		obj->funcs->close(obj, file_priv);
>>> @@ -399,7 +402,7 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>>>    	idr_preload(GFP_KERNEL);
>>>    	spin_lock(&file_priv->table_lock);
>>> -	ret = idr_alloc(&file_priv->object_idr, obj, 1, 0, GFP_NOWAIT);
>>> +	ret = idr_alloc(&file_priv->object_idr, NULL, 1, 0, GFP_NOWAIT);
>>>    	spin_unlock(&file_priv->table_lock);
>>>    	idr_preload_end();
>>> @@ -420,6 +423,11 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>>>    			goto err_revoke;
>>>    	}
>>> +	/* mirrors drm_gem_handle_delete to avoid races */
>>> +	spin_lock(&file_priv->table_lock);
>>> +	obj = idr_replace(&file_priv->object_idr, obj, handle);
>>> +	WARN_ON(obj != NULL);
>> A DRM print function would be preferable. The obj here is an errno pointer.
>> Should the errno code be part of the error message?
>>
>> If it fails, why does the function still succeed?
> This is an internal error that should never happen, at that point just
> bailing out is the way to go.
>
> Also note that the error code here is just to satisfy the function
> signature that id_for_each expects, we don't look at it ever (since if
> there's no bugs, it should never fail). I learned this because I actually
> removed the int return value and stuff didn't compile :-)

I see.

>
> I can use drm_WARN_ON if you want me to though?

If you use drm_WARN_ON, you can add

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

>
> I'll also explain this in the commit message for the next round.
> -Sima
>
>> Best regards
>> Thomas
>>
>>> +	spin_unlock(&file_priv->table_lock);
>>>    	*handlep = handle;
>>>    	return 0;
>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>> index 5c3b2aa3e69d..d344d41e6cfe 100644
>>> --- a/include/drm/drm_file.h
>>> +++ b/include/drm/drm_file.h
>>> @@ -300,6 +300,9 @@ struct drm_file {
>>>    	 *
>>>    	 * Mapping of mm object handles to object pointers. Used by the GEM
>>>    	 * subsystem. Protected by @table_lock.
>>> +	 *
>>> +	 * Note that allocated entries might be NULL as a transient state when
>>> +	 * creating or deleting a handle.
>>>    	 */
>>>    	struct idr object_idr;
>> -- 
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


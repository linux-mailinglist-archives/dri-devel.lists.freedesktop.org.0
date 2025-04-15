Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94C1A89F25
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 15:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F4910E786;
	Tue, 15 Apr 2025 13:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="EM2cNif7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NmUwUYm/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EM2cNif7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NmUwUYm/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6541C10E786
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 13:14:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 703BB21169;
 Tue, 15 Apr 2025 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744722880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Se5jHxUz0IwEvCNsGEEKC5CnNqrVllaEpKYdOMi4hG4=;
 b=EM2cNif7pMJAvLOZvr3Brj6+c+/xKV5r2g6ziYHB88timYd4Ed1k8KlbdTCXDWTnMzgBqG
 EDen88W9TXkuoeUrhtdKt2WIggrksJefWHKweLPNaGRHaCPAFhjaPzCQL3apZykJKnPXlx
 WYWp5x0+klpud7fCvKie0U3HcLw1ItI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744722880;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Se5jHxUz0IwEvCNsGEEKC5CnNqrVllaEpKYdOMi4hG4=;
 b=NmUwUYm/yIv31sPY2fPSQiSSRxGGUbZ+gb0rxQj1fzY5O3Q0zIaI/RoiJLxsZhte/PyHLI
 PqV41dBhdktSI6BQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EM2cNif7;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="NmUwUYm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744722880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Se5jHxUz0IwEvCNsGEEKC5CnNqrVllaEpKYdOMi4hG4=;
 b=EM2cNif7pMJAvLOZvr3Brj6+c+/xKV5r2g6ziYHB88timYd4Ed1k8KlbdTCXDWTnMzgBqG
 EDen88W9TXkuoeUrhtdKt2WIggrksJefWHKweLPNaGRHaCPAFhjaPzCQL3apZykJKnPXlx
 WYWp5x0+klpud7fCvKie0U3HcLw1ItI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744722880;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Se5jHxUz0IwEvCNsGEEKC5CnNqrVllaEpKYdOMi4hG4=;
 b=NmUwUYm/yIv31sPY2fPSQiSSRxGGUbZ+gb0rxQj1fzY5O3Q0zIaI/RoiJLxsZhte/PyHLI
 PqV41dBhdktSI6BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1FB6E137A5;
 Tue, 15 Apr 2025 13:14:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sHUWBsBb/meiIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Apr 2025 13:14:40 +0000
Message-ID: <704bd885-c3ae-4d14-99c3-9fce797a29cb@suse.de>
Date: Tue, 15 Apr 2025 15:14:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Internally test import_attach for imported
 objects
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 simona@ffwll.ch, airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250415092057.63172-1-tzimmermann@suse.de>
 <e2e82102-eb9f-4eb6-8ac3-6122ed7fcf28@amd.com>
 <48ab9b82-0d26-4d7c-88b0-feab9762b128@suse.de>
 <b924ffa7-99c0-42f1-9170-069e92299021@amd.com>
 <ddb93e8d-7716-47b3-b06c-0bf862d9c32b@suse.de>
 <ac0aba3d-ec77-4f6b-9ac1-f6077519f30d@amd.com>
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
In-Reply-To: <ac0aba3d-ec77-4f6b-9ac1-f6077519f30d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 703BB21169
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[amd.com,ffwll.ch,gmail.com,redhat.com,163.com,kernel.org,linux.intel.com];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[11];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,suse.de:dkim,suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Hi

Am 15.04.25 um 14:52 schrieb Christian König:
> Am 15.04.25 um 14:40 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 15.04.25 um 14:19 schrieb Christian König:
>>> Am 15.04.25 um 12:45 schrieb Thomas Zimmermann:
>>>> Hi
>>>>
>>>> Am 15.04.25 um 11:39 schrieb Christian König:
>>>>> Am 15.04.25 um 11:20 schrieb Thomas Zimmermann:
>>>>>> Test struct drm_gem_object.import_attach to detect imported objects
>>>>>> during cleanup. At that point, the imported DMA buffer might have
>>>>>> already been released and the dma_buf field is NULL. The object's
>>>>>> free callback then does a cleanup as for native objects.
>>>>> I don't think that this is a good idea.
>>>>>
>>>>> The DMA-buf is separately reference counted through the import attachment.
>>>> I understand that it's not ideal, but testing for import_attach to be set is what we currently do throughout drivers. Putting this behind an interface is already a step forward.
>>>>
>>>>>> Happens for calls to drm_mode_destroy_dumb_ioctl() that eventually
>>>>>> clear the dma_buf field in drm_gem_object_exported_dma_buf_free().
>>>>> That is for exported DMA-buf and should *NEVER* be used for imported ones.
>>>> Did you look at the discussion at the Closes tag? Where else could dma-buf be cleared?
>>> Yeah, I've seen that. The solution is just completely wrong.
>>>
>>> See for the export case obj->dma_buf points to the exported DMA-buf and causes a circle dependency when not set to NULL when the last handle is released.
>>>
>>> But for the import case obj->dma_buf is actually not that relevant. Instead obj->import_attach->dma_buf should be used.
>> So if I understand correctly, the tests in that helper should be done by looking at import_attach->dma_buf.
> At least in theory yes. IIRC we also set obj->dma_buf to the same value as import_attach->dma_buf for convenient so that code doesn't need to check both.
>
> But it can be that obj->dma_buf is already NULL while the import attachment is still in the process of being cleaned up. So there are a couple of cases where we have to look at obj->import_attach->dma_buf.

Ok, that should also solve the problem for now. The point here is to 
limit exposure of import_attach.

>
>> The long-term goal is to make import_attach optional because its setup requires a DMA-capable device.
> HUI WHAT?
>
> Dmitry and I put quite some effort into being able to create an import_attach without the requirement to have a DMA-capable device.
>
> The last puzzle piece of that landed a month ago in the form of this patch here:
>
> commit b72f66f22c0e39ae6684c43fead774c13db24e73
> Author: Christian König <christian.koenig@amd.com>
> Date:   Tue Feb 11 17:20:53 2025 +0100
>
>      dma-buf: drop caching of sg_tables
>      
>      That was purely for the transition from static to dynamic dma-buf
>      handling and can be removed again now.
>      
>      Signed-off-by: Christian König <christian.koenig@amd.com>
>      Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>      Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>      Link: https://patchwork.freedesktop.org/patch/msgid/20250211163109.12200-5-christian.koenig@amd.com
>
> When you don't create an import attachment the exporter wouldn't know that his buffer is actually used which is usually a quite bad idea.
>
> This is for devices who only want to do a vmap of the buffer, isn't it?

Yeah, the vmap needs the sgtable, which needs import_attach IIRC. 
Somewhere in there a DMA device is required. But it's not of high 
priority as we have workarounds.

Best regards
Thomas

>
> Regards,
> Christian.
>
>> Best regards
>> Thomas
>>
>>> Regards,
>>> Christian.
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
>>>>>> Reported-by: Andy Yan <andyshrk@163.com>
>>>>>> Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
>>>>>> Tested-by: Andy Yan <andyshrk@163.com>
>>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> Cc: Anusha Srivatsa <asrivats@redhat.com>
>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>>> Cc: linux-media@vger.kernel.org
>>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>>> ---
>>>>>>     include/drm/drm_gem.h | 8 +++++++-
>>>>>>     1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>>> index 9b71f7a9f3f8..f09b8afcf86d 100644
>>>>>> --- a/include/drm/drm_gem.h
>>>>>> +++ b/include/drm/drm_gem.h
>>>>>> @@ -589,7 +589,13 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
>>>>>>     static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>>>>>>     {
>>>>>>         /* The dma-buf's priv field points to the original GEM object. */
>>>>>> -    return obj->dma_buf && (obj->dma_buf->priv != obj);
>>>>>> +    return (obj->dma_buf && (obj->dma_buf->priv != obj)) ||
>>>>>> +           /*
>>>>>> +        * TODO: During object release, the dma-buf might already
>>>>>> +        *       be gone. For now keep testing import_attach, but
>>>>>> +        *       this should be removed at some point.
>>>>>> +        */
>>>>>> +           obj->import_attach;
>>>>>>     }
>>>>>>       #ifdef CONFIG_LOCKDEP

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


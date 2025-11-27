Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55566C8D62F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A4C10E7B2;
	Thu, 27 Nov 2025 08:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Dy2fnNb5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mcxeNkRH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dy2fnNb5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mcxeNkRH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225F010E7B2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 08:42:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CB04C5BCCC;
 Thu, 27 Nov 2025 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764232973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FFLkjlN/jxPKrFrlgJnZNHNtPA524cjhIQ746GC0Vy4=;
 b=Dy2fnNb5rYJ7LBTYe/6YbBWFmqvYdEsQL1M++MXU2zgP6fcOWrp3eKRxB2xMPFyfyr2um0
 Z/zk0SIizqRVfbZHb/tHcJdE/wLo3nom8x0MF6Sng8u3iNqVr3cZlIgG+Iphec4zq/nx5W
 yCUUrJvz+zKYn8wZfer5j1/J/mUBUCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764232973;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FFLkjlN/jxPKrFrlgJnZNHNtPA524cjhIQ746GC0Vy4=;
 b=mcxeNkRHXjtZ267/E/5G1uIQOfhA2zjE6TrRJKEC9BKYurdqWoquwHv64fS5nLiYXDleoC
 zEVwzlO+x5IZmLAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764232973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FFLkjlN/jxPKrFrlgJnZNHNtPA524cjhIQ746GC0Vy4=;
 b=Dy2fnNb5rYJ7LBTYe/6YbBWFmqvYdEsQL1M++MXU2zgP6fcOWrp3eKRxB2xMPFyfyr2um0
 Z/zk0SIizqRVfbZHb/tHcJdE/wLo3nom8x0MF6Sng8u3iNqVr3cZlIgG+Iphec4zq/nx5W
 yCUUrJvz+zKYn8wZfer5j1/J/mUBUCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764232973;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FFLkjlN/jxPKrFrlgJnZNHNtPA524cjhIQ746GC0Vy4=;
 b=mcxeNkRHXjtZ267/E/5G1uIQOfhA2zjE6TrRJKEC9BKYurdqWoquwHv64fS5nLiYXDleoC
 zEVwzlO+x5IZmLAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F31A73EA63;
 Thu, 27 Nov 2025 08:42:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1zvsOQwPKGl2NgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Nov 2025 08:42:52 +0000
Message-ID: <daaf256e-8662-4f9a-b702-1a6656117448@suse.de>
Date: Thu, 27 Nov 2025 09:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/16] drm/prime: Simplify life of drivers needing
 custom dma_buf_ops
From: Thomas Zimmermann <tzimmermann@suse.de>
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
 <20251126124455.3656651-2-boris.brezillon@collabora.com>
 <2e789ff6-b79f-4577-bc69-f74dfed6acfa@suse.de>
Content-Language: en-US
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
In-Reply-To: <2e789ff6-b79f-4577-bc69-f74dfed6acfa@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; MIME_TRACE(0.00)[0:+];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[27]; TAGGED_RCPT(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLq3cifbxyhc6qbbynzfc6amns)];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,collabora.com,nvidia.com,igalia.com,intel.com,imgtec.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,amd.com];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:mid,collabora.com:email]
X-Spam-Level: 
X-Spam-Score: -2.80
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

Hi

Am 27.11.25 um 09:34 schrieb Thomas Zimmermann:
> Hi
>
> Am 26.11.25 um 13:44 schrieb Boris Brezillon:
>> drm_gem_is_prime_exported_dma_buf() checks the dma_buf->ops against
>> drm_gem_prime_dmabuf_ops, which makes it impossible to use if the
>> driver implements custom dma_buf_ops. Instead of duplicating a bunch
>> of helpers to work around it, let's provide a way for drivers to
>> expose their custom dma_buf_ops so the core prime helpers can rely on
>> that instead of hardcoding &drm_gem_prime_dmabuf_ops.
>
> This can't go in as-is. I've spent an awful amount of patches on 
> removing buffer callbacks from struct drm_driver. Let's please not go 
> back to that.
>
>>
>> v5:
>> - New patch
>>
>> v6:
>> - Pass custom dma_buf_ops directly instead of through a getter
>>
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> ---
>>   drivers/gpu/drm/drm_prime.c | 10 ++++++++--
>>   include/drm/drm_drv.h       |  8 ++++++++
>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 21809a82187b..86fd95f0c105 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -904,6 +904,12 @@ unsigned long 
>> drm_prime_get_contiguous_size(struct sg_table *sgt)
>>   }
>>   EXPORT_SYMBOL(drm_prime_get_contiguous_size);
>>   +static const struct dma_buf_ops *
>> +drm_gem_prime_get_dma_buf_ops(struct drm_device *dev)
>> +{
>> +    return dev->driver->dma_buf_ops ?: &drm_gem_prime_dmabuf_ops;
>> +}
>> +
>>   /**
>>    * drm_gem_prime_export - helper library implementation of the 
>> export callback
>>    * @obj: GEM object to export
>> @@ -920,7 +926,7 @@ struct dma_buf *drm_gem_prime_export(struct 
>> drm_gem_object *obj,
>>       struct dma_buf_export_info exp_info = {
>>           .exp_name = KBUILD_MODNAME, /* white lie for debug */
>>           .owner = dev->driver->fops->owner,
>> -        .ops = &drm_gem_prime_dmabuf_ops,
>> +        .ops = drm_gem_prime_get_dma_buf_ops(dev),
>
> Rather provide a new function drm_gem_prime_export_with_ops() that 
> takes an additional dma_ops instance. The current 
> drm_gem_prime_export() would call it with &drm_gem_prime_dmabuf_ops.
>
> If this really does not work, you could add a pointer to dma_buf_ops 
> to drm_gem_object_funcs and fetch that from drm_gem_prime_export(). We 
> already vm_ops there.
>
> Other drivers, such as amdgpu, would also benefit from such a change
>
>>           .size = obj->size,
>>           .flags = flags,
>>           .priv = obj,
>> @@ -947,7 +953,7 @@ bool drm_gem_is_prime_exported_dma_buf(struct 
>> drm_device *dev,
>>   {
>>       struct drm_gem_object *obj = dma_buf->priv;
>>   -    return (dma_buf->ops == &drm_gem_prime_dmabuf_ops) && 
>> (obj->dev == dev);
>> +    return dma_buf->ops == drm_gem_prime_get_dma_buf_ops(dev) && 
>> obj->dev == dev;

On a second thought, we probably cannot be sure that dma_buf->priv 
really is a GEM object until we tested the ops field. :/  IIRC that's 
why the ops test goes first and the test for obj->dev goes second. So 
neither solution works.

Best regards
Thomas

>
> This is a bit more complicated and the test has been a pain point 
> before. For this case, I think we should add a GEM callback for this
>
> struct drm_gem_object_funcs {
>     bool (*exported_by)(struct drm_gem_object *obj, struct drm_device 
> *dev)
> }
>
> next to the existing export callback.
>
> And drm_gem_is_prime_exported_dma_buf would then do
>
> {
>     if (obj->funcs->exported_by)
>        return obj->funcs-<exported_by(obj, dev)
>
>    return /* what we currently test */
> }
>
> IIRC amdgpu would again benefit from this.
>
> These changes will isolate dma_buf handling near GEM code, keep 
> drm_driver clean, and even allow for a driver to have different 
> implementations of dma_buf_ops.
>
> Best regards
> Thomas
>
>>   }
>>   EXPORT_SYMBOL(drm_gem_is_prime_exported_dma_buf);
>>   diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 42fc085f986d..1c6dae60d523 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -431,6 +431,14 @@ struct drm_driver {
>>        * some examples.
>>        */
>>       const struct file_operations *fops;
>> +
>> +    /**
>> +     * @dma_buf_ops:
>> +     *
>> +     * dma_buf_ops to use for buffers exported by this driver. When 
>> NULL,
>> +     * the drm_prime logic defaults to &drm_gem_prime_dmabuf_ops.
>> +     */
>> +    const struct dma_buf_ops *dma_buf_ops;
>>   };
>>     void *__devm_drm_dev_alloc(struct device *parent,
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



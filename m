Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C582391EFE0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 09:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C97F10E13E;
	Tue,  2 Jul 2024 07:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Ly25YY1L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+74wd0wp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y8TXKUAQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BL1kaO27";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3F910E13E;
 Tue,  2 Jul 2024 07:17:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC4251FB8C;
 Tue,  2 Jul 2024 07:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719904624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=axMy9f3IG5VTz9UovBf2PqbgdOwoX86hrEemi5WedSk=;
 b=Ly25YY1LTVEJfjiVw6OIzqGfmEXgKWTy5JgoPhE2QxObP2nMb+jPvy9QwANeLovYvLNwOA
 1F7SJhGWxQUsN7oPnWjRYYnTRv1mA2Eqq4ajVN87aN4Tpo6WmeN/rIK0ZlVF3VXeW81lH8
 ms5lw7Vo33HItr3JG7Cfpokl0Ns1hGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719904624;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=axMy9f3IG5VTz9UovBf2PqbgdOwoX86hrEemi5WedSk=;
 b=+74wd0wp/gh7ToGD6FSYXZVP0OXlMQJJd4PjWICSMZE2IqmJNAeIhtvxb51ATvsZ2mi0fJ
 xff7+MqPmAXSJDBg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Y8TXKUAQ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BL1kaO27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719904623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=axMy9f3IG5VTz9UovBf2PqbgdOwoX86hrEemi5WedSk=;
 b=Y8TXKUAQ8UUasIkLz8zrfkZutnwA5skZDAo2jqQuaUNpFbObqWKdDHYbVh24JfPIpaRXyw
 oJpafUqCBq6yhvb/rFAfWUgf18Z/YNIQ5XvxLoLMQXnxLBcFv43o9Qk/+jd6yd/848RD9G
 bKyD1USTnblrPMZvkTQOKbI+bUQ/AJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719904623;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=axMy9f3IG5VTz9UovBf2PqbgdOwoX86hrEemi5WedSk=;
 b=BL1kaO27rvd2zx4IGVIC6IpYhL1gmGbZOm+rgrBmOrvMGTCtybyInbqgIkbKVA0FEPyrhW
 lmUz3PsiqyLX6pDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7672D1395F;
 Tue,  2 Jul 2024 07:17:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2YKJG2+pg2brAQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Jul 2024 07:17:03 +0000
Message-ID: <5674b73c-3bf3-4ec5-a1a7-44c9ce62ef68@suse.de>
Date: Tue, 2 Jul 2024 09:17:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: implement vmap/vunmap GEM object functions
To: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <asbjorn@asbjorn.st>,
 intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Jouni_H=C3=B6gander?=
 <jouni.hogander@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240629182513.78026-1-asbjorn@asbjorn.st>
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
In-Reply-To: <20240629182513.78026-1-asbjorn@asbjorn.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CC4251FB8C
X-Spam-Score: -5.50
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-5.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_TWELVE(0.00)[12];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Am 29.06.24 um 20:25 schrieb Asbjørn Sloth Tønnesen:
> Implement i915_gem_vmap_object() and i915_gem_vunmap_object(),
> based on i915_gem_dmabuf_vmap() and i915_gem_dmabuf_vunmap().
>
> This enables a drm_client to use drm_client_buffer_vmap() and
> drm_client_buffer_vunmap() on hardware using the i915 driver.
>
> Tested with a currently out of tree pixelflut drm_client[1] on:
> - Lenovo ThinkCentre M720q (CoffeeLake-S GT2 / Intel UHD Graphics 630)
> - Dell Wyse N06D - 3030 LT (ValleyView on Intel Celeron N2807 SOC)
>
> [1] XDP->DRM pixelflut: https://labitat.dk/wiki/Pixelflut-XDR
>
> Signed-off-by: Asbjørn Sloth Tønnesen <asbjorn@asbjorn.st>

I didn't do a review, but

Ack-by: Thomas Zimmermann <tzimmermann@suse.de>

as it would possible allow to share more code with the fbdev helpers.

Best regards
Thomas

> ---
> This patch applies on top of drm-intel/drm-intel-next (32a120f52a4c)
>
>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 26 ++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 58e6c680fe0d..356530b599ce 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -873,6 +873,30 @@ bool i915_gem_object_needs_ccs_pages(struct drm_i915_gem_object *obj)
>   	return lmem_placement;
>   }
>   
> +static int i915_gem_vmap_object(struct drm_gem_object *gem_obj,
> +				struct iosys_map *map)
> +{
> +	struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
> +	void *vaddr;
> +
> +	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
> +	if (IS_ERR(vaddr))
> +		return PTR_ERR(vaddr);
> +
> +	iosys_map_set_vaddr(map, vaddr);
> +
> +	return 0;
> +}
> +
> +static void i915_gem_vunmap_object(struct drm_gem_object *gem_obj,
> +				   struct iosys_map *map)
> +{
> +	struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
> +
> +	i915_gem_object_flush_map(obj);
> +	i915_gem_object_unpin_map(obj);
> +}
> +
>   void i915_gem_init__objects(struct drm_i915_private *i915)
>   {
>   	INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
> @@ -896,6 +920,8 @@ static const struct drm_gem_object_funcs i915_gem_object_funcs = {
>   	.free = i915_gem_free_object,
>   	.close = i915_gem_close_object,
>   	.export = i915_gem_prime_export,
> +	.vmap = i915_gem_vmap_object,
> +	.vunmap = i915_gem_vunmap_object,
>   };
>   
>   /**

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


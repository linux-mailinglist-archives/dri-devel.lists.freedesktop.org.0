Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JJEF/t/rmlfFQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 09:08:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DC02354E9
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 09:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A9610E4A4;
	Mon,  9 Mar 2026 08:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Wc5lckVq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e35VI6N6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wc5lckVq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e35VI6N6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01E410E4A4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 08:08:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 76C775BE17;
 Mon,  9 Mar 2026 08:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1773043701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ogb2IB1Q2p2DeUyYklDfAYMMP5kLmo+OtwtAWoKHnco=;
 b=Wc5lckVqF0ZbqzAaca4wFPEFVJye7bsAOfalIGPvRKZHAmfGFHWcTrIwrzkBNIHvpYT5dX
 yQ5MGpR7VMkf6aXZlyT0GrpsE0vZnMqCmmeerg2lhRZFbssIfEClnPGLyIdc8b+CO6+7r3
 2FAlS/iHoqmc9Ev0khFtZcipB3CQltA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1773043701;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ogb2IB1Q2p2DeUyYklDfAYMMP5kLmo+OtwtAWoKHnco=;
 b=e35VI6N6lFaj38uqM+THxMUmDRZZ88QyrZahLVFKoC0P1ykQxj2CZLK4rtWTqES4RpLk2L
 daydCQkEBOKHqxCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Wc5lckVq;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=e35VI6N6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1773043701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ogb2IB1Q2p2DeUyYklDfAYMMP5kLmo+OtwtAWoKHnco=;
 b=Wc5lckVqF0ZbqzAaca4wFPEFVJye7bsAOfalIGPvRKZHAmfGFHWcTrIwrzkBNIHvpYT5dX
 yQ5MGpR7VMkf6aXZlyT0GrpsE0vZnMqCmmeerg2lhRZFbssIfEClnPGLyIdc8b+CO6+7r3
 2FAlS/iHoqmc9Ev0khFtZcipB3CQltA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1773043701;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ogb2IB1Q2p2DeUyYklDfAYMMP5kLmo+OtwtAWoKHnco=;
 b=e35VI6N6lFaj38uqM+THxMUmDRZZ88QyrZahLVFKoC0P1ykQxj2CZLK4rtWTqES4RpLk2L
 daydCQkEBOKHqxCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38B7C3EDC8;
 Mon,  9 Mar 2026 08:08:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yPdpDPV/rmkzEQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Mar 2026 08:08:21 +0000
Message-ID: <793a35dc-0f0a-4bf2-84cd-8a6f56ac2a66@suse.de>
Date: Mon, 9 Mar 2026 09:08:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/loongson: use drm_gem_ttm_dumb_map_offset()
To: Amin GATTOUT <amin.gattout@gmail.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260308-master-v1-1-af32d71c8a1d@gmail.com>
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
In-Reply-To: <20260308-master-v1-1-af32d71c8a1d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
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
X-Rspamd-Queue-Id: C7DC02354E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:amin.gattout@gmail.com,m:suijingfeng@loongson.cn,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:amingattout@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,loongson.cn,linux.intel.com,kernel.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Hi,

thanks for the patch.,

Am 08.03.26 um 11:15 schrieb Amin GATTOUT:
> Replace the open-coded lsdc_dumb_map_offset() with the generic
> drm_gem_ttm_dumb_map_offset() helper, which is functionally identical.
> This removes unnecessary boilerplate and aligns with the DRM convention
> for TTM-based drivers.
>
> Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/loongson/lsdc_drv.c |  3 ++-
>   drivers/gpu/drm/loongson/lsdc_gem.c | 15 ---------------
>   drivers/gpu/drm/loongson/lsdc_gem.h |  4 ----
>   3 files changed, 2 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
> index abf5bf68eec2..1ece1ea42f78 100644
> --- a/drivers/gpu/drm/loongson/lsdc_drv.c
> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
> @@ -13,6 +13,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fbdev_ttm.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_ttm_helper.h>
>   #include <drm/drm_ioctl.h>
>   #include <drm/drm_modeset_helper.h>
>   #include <drm/drm_print.h>
> @@ -45,7 +46,7 @@ static const struct drm_driver lsdc_drm_driver = {
>   
>   	.debugfs_init = lsdc_debugfs_init,
>   	.dumb_create = lsdc_dumb_create,
> -	.dumb_map_offset = lsdc_dumb_map_offset,
> +	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
>   	.gem_prime_import_sg_table = lsdc_prime_import_sg_table,
>   	DRM_FBDEV_TTM_DRIVER_OPS,
>   };
> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
> index 6372db2d3093..2fb03487c983 100644
> --- a/drivers/gpu/drm/loongson/lsdc_gem.c
> +++ b/drivers/gpu/drm/loongson/lsdc_gem.c
> @@ -234,21 +234,6 @@ int lsdc_dumb_create(struct drm_file *file, struct drm_device *ddev,
>   	return 0;
>   }
>   
> -int lsdc_dumb_map_offset(struct drm_file *filp, struct drm_device *ddev,
> -			 u32 handle, uint64_t *offset)
> -{
> -	struct drm_gem_object *gobj;
> -
> -	gobj = drm_gem_object_lookup(filp, handle);
> -	if (!gobj)
> -		return -ENOENT;
> -
> -	*offset = drm_vma_node_offset_addr(&gobj->vma_node);
> -
> -	drm_gem_object_put(gobj);
> -
> -	return 0;
> -}
>   
>   void lsdc_gem_init(struct drm_device *ddev)
>   {
> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.h b/drivers/gpu/drm/loongson/lsdc_gem.h
> index 92cbb10e6e13..96729b3eebec 100644
> --- a/drivers/gpu/drm/loongson/lsdc_gem.h
> +++ b/drivers/gpu/drm/loongson/lsdc_gem.h
> @@ -14,10 +14,6 @@ lsdc_prime_import_sg_table(struct drm_device *ddev,
>   			   struct dma_buf_attachment *attach,
>   			   struct sg_table *sg);
>   
> -int lsdc_dumb_map_offset(struct drm_file *file,
> -			 struct drm_device *dev,
> -			 u32 handle,
> -			 uint64_t *offset);
>   
>   int lsdc_dumb_create(struct drm_file *file,
>   		     struct drm_device *ddev,
>
> ---
> base-commit: c23719abc3308df7ed3ad35650ad211fb2d2003d
> change-id: 20260308-master-58f0cb492c5e
>
> Best regards,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



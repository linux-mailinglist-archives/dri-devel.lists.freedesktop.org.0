Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42404AC40C8
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 15:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4997910E31B;
	Mon, 26 May 2025 13:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pjLhy+xJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7dtDdtPB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pjLhy+xJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7dtDdtPB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD6F10E319
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:57:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2AFFF21CBA;
 Mon, 26 May 2025 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748267852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jBMujsfGeHHLdcCqtL9Av1p7N3ykeQ7L5YUhPaT2Qmw=;
 b=pjLhy+xJf3zQ4Yp6m6LdHkkDSadRTO0Jnpwl/al1h+3m+9cRV4NVIzyFPPvPjaSuWtKLrM
 MMUUlJZkWbTOv8/N6RLib06iA9QMp92AM3RwJdfTpJmT5+CMKSTQiUi+4sl2pJl6kkWXQ4
 DbLtVCW3s0qX+v0rer/I9OBNSBiIhqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748267852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jBMujsfGeHHLdcCqtL9Av1p7N3ykeQ7L5YUhPaT2Qmw=;
 b=7dtDdtPBhqj7yNELIME5FylOvhV+Gy3SmC/lk5f9tchq4LgLb9FCSjBqB0Zt/adckEhNTa
 EjlqjD7s7QnG07BQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pjLhy+xJ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7dtDdtPB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748267852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jBMujsfGeHHLdcCqtL9Av1p7N3ykeQ7L5YUhPaT2Qmw=;
 b=pjLhy+xJf3zQ4Yp6m6LdHkkDSadRTO0Jnpwl/al1h+3m+9cRV4NVIzyFPPvPjaSuWtKLrM
 MMUUlJZkWbTOv8/N6RLib06iA9QMp92AM3RwJdfTpJmT5+CMKSTQiUi+4sl2pJl6kkWXQ4
 DbLtVCW3s0qX+v0rer/I9OBNSBiIhqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748267852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jBMujsfGeHHLdcCqtL9Av1p7N3ykeQ7L5YUhPaT2Qmw=;
 b=7dtDdtPBhqj7yNELIME5FylOvhV+Gy3SmC/lk5f9tchq4LgLb9FCSjBqB0Zt/adckEhNTa
 EjlqjD7s7QnG07BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D6F101397F;
 Mon, 26 May 2025 13:57:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GdQBM0tzNGjHQgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 26 May 2025 13:57:31 +0000
Message-ID: <ee9ca879-4bb7-4339-b827-78eb2d46a97f@suse.de>
Date: Mon, 26 May 2025 15:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 3/3] drm/udl: use
 DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT
To: oushixiong1025@163.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250522070714.439824-1-oushixiong1025@163.com>
 <20250522070714.439824-3-oushixiong1025@163.com>
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
In-Reply-To: <20250522070714.439824-3-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Queue-Id: 2AFFF21CBA
X-Spam-Score: -1.51
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.51 / 50.00]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[163.com,amd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,poorly.run,redhat.com,lists.freedesktop.org,vger.kernel.org,kylinos.cn];
 DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[11];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid, suse.de:dkim,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo, kylinos.cn:email]
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



Am 22.05.25 um 09:07 schrieb oushixiong1025@163.com:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> Import dmabuf without mapping its sg_table to avoid issues likes:
>     udl 2-1.4:1.0: swiotlb buffer is full (sz: 2097152 bytes), total 65536 (slots), used 1 (slots)
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/udl/udl_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index 1922988625eb..ce5ae7cacb90 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -57,7 +57,7 @@ static const struct drm_driver driver = {
>   
>   	/* GEM hooks */
>   	.fops = &udl_driver_fops,
> -	DRM_GEM_SHMEM_DRIVER_OPS,
> +	DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT,
>   	DRM_FBDEV_SHMEM_DRIVER_OPS,
>   
>   	.name = DRIVER_NAME,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13978C83FA
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 11:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3A210EE5E;
	Fri, 17 May 2024 09:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="m7qf+6jX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ygx9C/dI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kCxAATtg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fps46lkT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F5E10EE5E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 09:39:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EAA865D1EF;
 Fri, 17 May 2024 09:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715938783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9jv8VdhpxAJBR0+sDYeiUI/cwKAgctaPKrAPkOAC9L0=;
 b=m7qf+6jXiwmBqTU26bNvU3nDZMgvvEJoqYviARKdJFgWmIlDjGEfkj4E3Yzeb7E5JKuYUF
 ngTDbsWlNFG33/E37yYrsG+Uen/TviBtmpjBmgBeaXjfStc/tIZRnf7W5qj7LwbmMH8uCp
 /ArpN2r7zluKW9zaMKpSyXl8TIAcSRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715938783;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9jv8VdhpxAJBR0+sDYeiUI/cwKAgctaPKrAPkOAC9L0=;
 b=Ygx9C/dI/JLR0ZquwFK17yQZ7M5Q0MqmvVcMOZInp54gyMPGG5Kcx1EbirF7PkdWBlHJqk
 Mvk3ZrbiKHQ2paBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kCxAATtg;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Fps46lkT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715938782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9jv8VdhpxAJBR0+sDYeiUI/cwKAgctaPKrAPkOAC9L0=;
 b=kCxAATtgfgIgG8wbUm0xv6xqEpv6taWKE3YoTqLtZSiLwpS38wt4h1e/9w4heXJ3Z6fSIY
 oXRkUxSW2T9WkhMU7DwOA/vteSyc+89SXnijYmITgSp3f8wU05bzWUkkEyIxRF8Z6p8qja
 bfCsQ6kimKT+vKbcik4H/5QdHFpgYCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715938782;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9jv8VdhpxAJBR0+sDYeiUI/cwKAgctaPKrAPkOAC9L0=;
 b=Fps46lkTmBTtrGb8COKx4hufBHLHgk8UlPUPgzBuV/EqQMS0RvDJ6t+HJpE6aDO+MOicLV
 GSSdQUtgKqoRQpAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9F7F13991;
 Fri, 17 May 2024 09:39:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id e8FCK94lR2akPQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 17 May 2024 09:39:42 +0000
Message-ID: <b71a2cc2-fed2-427e-bd98-f9c67917a30e@suse.de>
Date: Fri, 17 May 2024 11:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/mgag200: Add an option to disable Write-Combine
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240516161751.479558-1-jfalempe@redhat.com>
 <20240516161751.479558-3-jfalempe@redhat.com>
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
In-Reply-To: <20240516161751.479558-3-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,lists.freedesktop.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: EAA865D1EF
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -4.50
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

Hi,

just nits below.

Am 16.05.24 um 18:17 schrieb Jocelyn Falempe:
> Unfortunately, the G200 ioburst workaround doesn't work on some servers
> like Dell poweredge XR11, XR5610, or HPE XL260
> In this case completely disabling WC is the only option to achieve
> low-latency.
> So this adds a new Kconfig option, to disable WC mapping of the G200

The formatting look off. Maybe make this one single paragraph.

No comma after 'option'.

>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/mgag200/Kconfig       | 10 ++++++++++
>   drivers/gpu/drm/mgag200/mgag200_drv.c |  7 +++++++
>   2 files changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
> index b28c5e4828f47..73ab5730b74d9 100644
> --- a/drivers/gpu/drm/mgag200/Kconfig
> +++ b/drivers/gpu/drm/mgag200/Kconfig
> @@ -11,3 +11,13 @@ config DRM_MGAG200
>   	 MGA G200 desktop chips and the server variants. It requires 0.3.0
>   	 of the modesetting userspace driver, and a version of mga driver
>   	 that will fail on KMS enabled devices.
> +
> +config DRM_MGAG200_DISABLE_WRITECOMBINE
> +	bool "Disable Write Combine mapping of VRAM"
> +	depends on DRM_MGAG200 && PREEMPT_RT
> +	help
> +	  The VRAM of the G200 is mapped with Write-Combine, to improve
No comma after Write-Combine
> +	  performances. However this increases the system latency a lot, even
Just say "This can interfere with real-time tasks; even if they are 
running on other CPU cores then the graphics output."

> +	  for realtime tasks running on other CPU cores. Typically 40us-80us
> +	  latencies are measured with hwlat when Write Combine is enabled.

Leave out the next sentence: "Typically ..." The measureed numbers 
depend on the hardware and everyone is encouraged to test on their own 
system. You could mention  the numbers in the commit description, as you 
already mention the affected systems there.

> +	  Recommended if you run realtime tasks on a server with a Matrox G200.

I still think that we should not encourage anyone to use this option. 
Maybe say "Enable this option only if you run..."

> \ No newline at end of file
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 3883f25ca4d8b..7461e3f984eff 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -146,12 +146,19 @@ int mgag200_device_preinit(struct mga_device *mdev)
>   	}
>   	mdev->vram_res = res;
>   
> +#if defined(CONFIG_DRM_MGAG200_DISABLE_WRITECOMBINE)
> +	drm_info(dev, "Disable Write Combine\n");

I would not print this drm_info() here. The user has selected the config 
option, so they should know what happens. It's also listed in /proc/mtrr 
IIRC.

Best regards
Thomas

> +	mdev->vram = devm_ioremap(dev->dev, res->start, resource_size(res));
> +	if (!mdev->vram)
> +		return -ENOMEM;
> +#else
>   	mdev->vram = devm_ioremap_wc(dev->dev, res->start, resource_size(res));
>   	if (!mdev->vram)
>   		return -ENOMEM;
>   
>   	/* Don't fail on errors, but performance might be reduced. */
>   	devm_arch_phys_wc_add(dev->dev, res->start, resource_size(res));
> +#endif
>   
>   	return 0;
>   }

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


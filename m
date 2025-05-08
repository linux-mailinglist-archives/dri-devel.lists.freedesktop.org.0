Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973E3AAF607
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 10:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A767710E373;
	Thu,  8 May 2025 08:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PbTnNk8y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sZJuHhEf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PbTnNk8y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sZJuHhEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFAC10E373
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 08:52:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9A4121F385;
 Thu,  8 May 2025 08:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746694345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QHTt6o55yYjofN0X6cUNZDpXS8zaEbTeYZ5+qKEWI7E=;
 b=PbTnNk8ybCBTRdQJIgHnC9q4YVG9j6CAFx2mKOc4cbMn4QrqvbwQQqR3tBQY02DLCJYqqW
 jo9NY8MhK59wd7D4K0BGCOC2GdjHzn7udmDPhSv9wnO4XeiVIaSCFboca9NU6Vpuk0/z+t
 ERPxqeBG1IYWWaKzLdnczrW0ON5BYbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746694345;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QHTt6o55yYjofN0X6cUNZDpXS8zaEbTeYZ5+qKEWI7E=;
 b=sZJuHhEfnipyUMGuXUlod+Rzr0t7mjBW6+VVxym89DPStJDerrMEHbDEAoFDtYV5lwxzL4
 bgmvRR/ff7K9wZCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PbTnNk8y;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sZJuHhEf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746694345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QHTt6o55yYjofN0X6cUNZDpXS8zaEbTeYZ5+qKEWI7E=;
 b=PbTnNk8ybCBTRdQJIgHnC9q4YVG9j6CAFx2mKOc4cbMn4QrqvbwQQqR3tBQY02DLCJYqqW
 jo9NY8MhK59wd7D4K0BGCOC2GdjHzn7udmDPhSv9wnO4XeiVIaSCFboca9NU6Vpuk0/z+t
 ERPxqeBG1IYWWaKzLdnczrW0ON5BYbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746694345;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QHTt6o55yYjofN0X6cUNZDpXS8zaEbTeYZ5+qKEWI7E=;
 b=sZJuHhEfnipyUMGuXUlod+Rzr0t7mjBW6+VVxym89DPStJDerrMEHbDEAoFDtYV5lwxzL4
 bgmvRR/ff7K9wZCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 625E013687;
 Thu,  8 May 2025 08:52:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vUixFslwHGg0ZAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 08 May 2025 08:52:25 +0000
Message-ID: <538ee029-543a-41be-be7f-40283b5cfc2b@suse.de>
Date: Thu, 8 May 2025 10:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fbdev-client: Ignore EOPNOTSUPP errors
To: Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20250412070047.6725-1-thierry.reding@gmail.com>
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
In-Reply-To: <20250412070047.6725-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 9A4121F385
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:mid, suse.de:dkim, bootlin.com:url,
 nvidia.com:email]
X-Rspamd-Action: no action
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

sorry for the late review. I've been away for a few days.

Am 12.04.25 um 09:00 schrieb Thierry Reding:
> From: Thierry Reding <treding@nvidia.com>
>
> Recent generations of Tegra have moved the display components outside of
> host1x, leading to a device that has no CRTCs attached and hence doesn't
> support any of the modesetting functionality. When this is detected, the
> driver clears the DRIVER_MODESET and DRIVER_ATOMIC flags for the device.
>
> Unfortunately, this causes the following errors during boot:
>
>      [      15.418958] ERR KERN drm drm: [drm] *ERROR* Failed to register client: -95
>      [      15.425311] WARNING KERN drm drm: [drm] Failed to set up DRM client; error -95
>
> These originate from the fbdev client checking for the presence of the
> DRIVER_MODESET flag and returning -EOPNOTSUPP. However, if a driver does
> not support DRIVER_MODESET this is entirely expected and the error isn't
> helpful.
>
> One solution would have been to conditionally call drm_client_setup()
> only if modesetting is supported. This seems a bit redundant, however,
> and could further complicate things if ever any DRM clients are added
> that do not rely on modesetting.

These default in-kernel clients are all somewhat legacy by definition 
and the only viable use cases involve display output. There won't be any 
clients that don't output to the display. Best would be to put that 
check around drm_client_setup() in the tegra driver. [1]

if (drm->driver_features & MODESET)
   drm_client_setup()

[1] 
https://elixir.bootlin.com/linux/v6.14.5/source/drivers/gpu/drm/tegra/drm.c#L1274

If you want to get fancy, you could also add that test at the very top 
of drm_client_setup() itself; with a drm_dbg() statement noting the 
absense of modesetting.

Best regards
Thomas

>
> Instead, simply add an extra check to ignore this expected error and
> skip the fbdev client registration.
>
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/gpu/drm/clients/drm_fbdev_client.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
> index f894ba52bdb5..8c8552ed912e 100644
> --- a/drivers/gpu/drm/clients/drm_fbdev_client.c
> +++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
> @@ -152,7 +152,11 @@ int drm_fbdev_client_setup(struct drm_device *dev, const struct drm_format_info
>   
>   	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
>   	if (ret) {
> -		drm_err(dev, "Failed to register client: %d\n", ret);
> +		if (ret != -EOPNOTSUPP)
> +			drm_err(dev, "Failed to register client: %d\n", ret);
> +		else
> +			ret = 0;
> +
>   		goto err_drm_client_init;
>   	}
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


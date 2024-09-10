Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0A4972A93
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 09:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E0310E720;
	Tue, 10 Sep 2024 07:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="wTtnwDxO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qb9r4ZkU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qo5B/Dfv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7tt0SXRd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6336410E720
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 07:24:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CBD701F804;
 Tue, 10 Sep 2024 07:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725953063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zNgLU6oyaubrQ/4d6rM6K1MKOLGhk6AKfbSQ7+uFIdk=;
 b=wTtnwDxOQhLio/IuUrWZxqFH+3K6hcXYJA6IlB6ytP4/gRQi5n4i8tpUlE8igiQ/SZy1mr
 D0AJsyVVsyFgSITDOkzihHG9pGI2ULPGKL/jKYP033+UL6thvgBMTmRHYHH43xJZodAK8z
 kziMuD26vrocvFOE7IPxmUjIP/GJtBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725953063;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zNgLU6oyaubrQ/4d6rM6K1MKOLGhk6AKfbSQ7+uFIdk=;
 b=qb9r4ZkUAscAbNexhcQlZvBFMYvXGk3PAMuRkabCyby6sTQxZw77GFMHqE0JPkuvZmAzQZ
 sejiGpGSyBORAxBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Qo5B/Dfv";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7tt0SXRd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725953062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zNgLU6oyaubrQ/4d6rM6K1MKOLGhk6AKfbSQ7+uFIdk=;
 b=Qo5B/DfvGyaB5+DXXCuNV6eGt/OGakNT76K6XjOra7td4qBfLXkpW11jeB9BE4mnk8se0m
 xjnU4KRdM9mNxzIUryWWjrmA1Lodfa6IGNaYayIrTObtcUbuqUhGYin0MsTDmVrF4RDG1V
 EEauavZMt/Ou+UhwZMLV9O9n4pKygis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725953062;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zNgLU6oyaubrQ/4d6rM6K1MKOLGhk6AKfbSQ7+uFIdk=;
 b=7tt0SXRdLPSV1ZDBd2xY3cK2LcH/bNWxh10C/JNKzN1pSFJ3Al5ow/BfSnp40jhREuj80f
 wMyxsRiRoBxGlnCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7264F13A3A;
 Tue, 10 Sep 2024 07:24:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Vt6TGib032ZKJQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Sep 2024 07:24:22 +0000
Message-ID: <75c8c1f0-d774-4bc1-ba71-bce15db921c7@suse.de>
Date: Tue, 10 Sep 2024 09:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bochs: use devm_ioremap_wc() to map framebuffer
To: Yan Zhao <yan.y.zhao@intel.com>, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, virtualization@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Kevin Tian <kevin.tian@intel.com>
References: <20240909131643.28915-1-yan.y.zhao@intel.com>
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
In-Reply-To: <20240909131643.28915-1-yan.y.zhao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CBD701F804
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[intel.com,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.linux.dev,lists.freedesktop.org,vger.kernel.org];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[14]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email, suse.de:dkim, suse.de:mid,
 suse.de:email]
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

Am 09.09.24 um 15:16 schrieb Yan Zhao:
> Opt for devm_ioremap_wc() over devm_ioremap() when mapping the framebuffer.
>
> Using devm_ioremap() results in the VA being mapped with PAT=UC-, which
> considerably slows down drm_fb_memcpy(). In contrast, devm_ioremap_wc()
> maps the VA with PAT set to WC, leading to better performance on platforms
> where access to UC memory is much slower than WC memory.
>
> Here's the performance data measured in a guest on the physical machine
> "Sapphire Rapids XCC".
> With host KVM honors guest PAT memory types, the effective memory type
> for this framebuffer range is
> - WC when devm_ioremap_wc() is used
> - UC- when devm_ioremap() is used.
>
> The data presented is an average from 10 execution runs.
>
> Cycles: Avg cycles of executed bochs_primary_plane_helper_atomic_update()
>          from VM boot to GDM show up
> Cnt:    Avg cnt of executed bochs_primary_plane_helper_atomic_update()
>          from VM boot to GDM show up
> T:      Avg time of each bochs_primary_plane_helper_atomic_update().
>
>   -------------------------------------------------
> |            | devm_ioremap() | devm_ioremap_wc() |
> |------------|----------------|-------------------|
> |  Cycles    |    211.545M    |   0.157M          |
> |------------|----------------|-------------------|
> |  Cnt       |     142        |   1917            |
> |------------|----------------|-------------------|
> |  T         |    0.1748s     |   0.0004s         |
>   -------------------------------------------------

Very nice. Thank you so much.

> Note:
> Following the rebase to [3], the previously reported GDM failure on the
> VGA device [1] can no longer be reproduced, thanks to the memory management
> improvements made in [2]. Despite this, I have proceeded to submit this
> patch because of the noticeable performance improvements it provides.
>
> Reported-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> Closes: https://lore.kernel.org/all/87jzfutmfc.fsf@redhat.com/#t
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> Link: https://lore.kernel.org/all/87jzfutmfc.fsf@redhat.com/#t [1]
> Link: https://patchwork.freedesktop.org/series/138086 [2]
> Link: https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/drm-misc-next [3]

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Texted-by: Thomas Zimmermann <tzimmermann@suse.de>

If no other reviews come in, I'll merge the patch by the end of the week.

Best regards
Thomas

> ---
> v2:
> - Rebased to the latest drm-misc-next branch. [2]
> - Updated patch log to match the base code.
>
> v1: https://lore.kernel.org/all/20240909051529.26776-1-yan.y.zhao@intel.com
> ---
>   drivers/gpu/drm/tiny/bochs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index 69c5f65e9853..9055b1dd66df 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -268,7 +268,7 @@ static int bochs_hw_init(struct bochs_device *bochs)
>   	if (!devm_request_mem_region(&pdev->dev, addr, size, "bochs-drm"))
>   		DRM_WARN("Cannot request framebuffer, boot fb still active?\n");
>   
> -	bochs->fb_map = devm_ioremap(&pdev->dev, addr, size);
> +	bochs->fb_map = devm_ioremap_wc(&pdev->dev, addr, size);
>   	if (bochs->fb_map == NULL) {
>   		DRM_ERROR("Cannot map framebuffer\n");
>   		return -ENOMEM;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


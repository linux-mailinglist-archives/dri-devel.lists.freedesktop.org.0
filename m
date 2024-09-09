Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49363970E03
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 08:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C3B10E2D3;
	Mon,  9 Sep 2024 06:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UFzyTmpL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="upzODjPH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UFzyTmpL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="upzODjPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0FD10E2D3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 06:40:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9A18821BE4;
 Mon,  9 Sep 2024 06:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725864031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r/8pmPEGTLS0nYwfthKxie8srEPnbPhRDriy+MIC0a4=;
 b=UFzyTmpLhlTyZSxGJsSB1a1EFJZ7bl9Hc1i3DLg4TIlxgiDQPIQwqzh3+JRoWDq+Ypjqzb
 9NkNuXrzM0bDXeR7qGsCPTtHBankcwCcavFVWBJdhVB+HJmL6uhBBzfNPC+eZUN5V9PiG/
 467ncPyw0/RISwrieKw50Zj5m0vJAPU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725864031;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r/8pmPEGTLS0nYwfthKxie8srEPnbPhRDriy+MIC0a4=;
 b=upzODjPHHbVRS9lE2eOFzOmhdRCZwq5yUdUomrXUST6hPCbgaAXqUxgbRltRMF143lINOR
 8xoV3Qu8rktojgBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UFzyTmpL;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=upzODjPH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725864031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r/8pmPEGTLS0nYwfthKxie8srEPnbPhRDriy+MIC0a4=;
 b=UFzyTmpLhlTyZSxGJsSB1a1EFJZ7bl9Hc1i3DLg4TIlxgiDQPIQwqzh3+JRoWDq+Ypjqzb
 9NkNuXrzM0bDXeR7qGsCPTtHBankcwCcavFVWBJdhVB+HJmL6uhBBzfNPC+eZUN5V9PiG/
 467ncPyw0/RISwrieKw50Zj5m0vJAPU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725864031;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r/8pmPEGTLS0nYwfthKxie8srEPnbPhRDriy+MIC0a4=;
 b=upzODjPHHbVRS9lE2eOFzOmhdRCZwq5yUdUomrXUST6hPCbgaAXqUxgbRltRMF143lINOR
 8xoV3Qu8rktojgBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 31E9013A3A;
 Mon,  9 Sep 2024 06:40:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LeyLCl+Y3mZ2TgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Sep 2024 06:40:31 +0000
Message-ID: <78cf5ef4-09a1-4f7e-ab88-cbffdd967af3@suse.de>
Date: Mon, 9 Sep 2024 08:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bochs: use ioremap_wc() to map framebuffer during
 driver probing
To: Yan Zhao <yan.y.zhao@intel.com>, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, virtualization@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Kevin Tian <kevin.tian@intel.com>
References: <20240909051529.26776-1-yan.y.zhao@intel.com>
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
In-Reply-To: <20240909051529.26776-1-yan.y.zhao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9A18821BE4
X-Spam-Level: 
X-Spamd-Result: default: False [-6.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[intel.com,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.linux.dev,lists.freedesktop.org,vger.kernel.org];
 RCPT_COUNT_TWELVE(0.00)[14]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -6.51
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

Am 09.09.24 um 07:15 schrieb Yan Zhao:
> Use ioremap_wc() instead of ioremap() to map framebuffer during driver
> probing phase.
>
> Using ioremap() results in a VA being mapped with PAT=UC-. Additionally,
> on x86 architectures, ioremap() invokes memtype_reserve() to reserve the
> memory type as UC- for the physical range. This reservation can cause
> subsequent calls to ioremap_wc() to fail to map the VA with PAT=WC to the
> same physical range for framebuffre in ttm_kmap_iter_linear_io_init().
> Consequently, the operation drm_gem_vram_bo_driver_move() ->
> ttm_bo_move_memcpy() -> ttm_move_memcpy() becomes significantly slow on
> platforms where UC memory access is slow.

I've noticed this too and pushed a major update that replaces the entire 
memory management. [1]

The patch is still welcome, I think, but you may want to rebase onto the 
latest drm-misc-next branch. [2]

Best regards
Thomas

[1] https://patchwork.freedesktop.org/series/138086/
[2] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/drm-misc-next

>
> Here's the performance data measured in a guest on the physical machine
> "Sapphire Rapids XCC".
> With host KVM honors guest PAT memory types, the effective memory type
> for this framebuffer range is
> - WC when ioremap_wc() is used in driver probing phase
> - UC- when ioremap() is used.
>
> The data presented is an average from 10 execution runs.
> The memcpy range for the data is
> mem->bus.offset=0xfd000000, mem->size=0x3e8000.
>
> --------------------------------------------------------------
>                                |      in bochs_hw_init()       |
>                                |    ioremap()   | ioremap_wc() |
> ------------------------------|----------------|--------------|
>      cycles of                 |    2227.4M     |   17.8M      |
> drm_gem_vram_bo_driver_move() |                |              |
> ------------------------------|----------------|--------------|
>      time of                   |    1.24s       |   0.01s      |
> drm_gem_vram_bo_driver_move() |                |              |
> --------------------------------------------------------------
>
> Reported-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> Closes: https://lore.kernel.org/all/87jzfutmfc.fsf@redhat.com/#t
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>   drivers/gpu/drm/tiny/bochs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index 31fc5d839e10..6414f0a72f6a 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -261,7 +261,7 @@ static int bochs_hw_init(struct drm_device *dev)
>   	if (pci_request_region(pdev, 0, "bochs-drm") != 0)
>   		DRM_WARN("Cannot request framebuffer, boot fb still active?\n");
>   
> -	bochs->fb_map = ioremap(addr, size);
> +	bochs->fb_map = ioremap_wc(addr, size);
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


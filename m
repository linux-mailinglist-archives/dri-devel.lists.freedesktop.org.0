Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF12B2F401
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 11:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEF510E8DE;
	Thu, 21 Aug 2025 09:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yvh1Z5Q3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lQh8JrGX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yvh1Z5Q3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lQh8JrGX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C635010E8DB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 09:32:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7C6E11F7C7;
 Thu, 21 Aug 2025 09:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755768775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HSOE/POrg1VyRnjOccSnEhf2Rw07HMBFsL5nh18d+jI=;
 b=yvh1Z5Q3eLEQ4lhL9dGASWyvFdDLV189GV/7qUXjPu0tfo1HZwZe48h6iXLVk7t09NrKaf
 O5uU6FnK/f+TWg9lBRDyhVZ7uhKqLtg0pQNhzlmRj4WHvSWX/h4dKFhysgY7FyMbYzVVBc
 olXcpSKqZZAilnXo9PWMi0UD5sOa7kM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755768775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HSOE/POrg1VyRnjOccSnEhf2Rw07HMBFsL5nh18d+jI=;
 b=lQh8JrGXeJ2mBfB5wOTx1pIy3RVWek/Zi40Y0Ucl3U1OjvwnnBmPOujYqgXcsSBV0Y24VS
 bNPOwlhoP9yZJnAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755768775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HSOE/POrg1VyRnjOccSnEhf2Rw07HMBFsL5nh18d+jI=;
 b=yvh1Z5Q3eLEQ4lhL9dGASWyvFdDLV189GV/7qUXjPu0tfo1HZwZe48h6iXLVk7t09NrKaf
 O5uU6FnK/f+TWg9lBRDyhVZ7uhKqLtg0pQNhzlmRj4WHvSWX/h4dKFhysgY7FyMbYzVVBc
 olXcpSKqZZAilnXo9PWMi0UD5sOa7kM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755768775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HSOE/POrg1VyRnjOccSnEhf2Rw07HMBFsL5nh18d+jI=;
 b=lQh8JrGXeJ2mBfB5wOTx1pIy3RVWek/Zi40Y0Ucl3U1OjvwnnBmPOujYqgXcsSBV0Y24VS
 bNPOwlhoP9yZJnAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0FB64139A8;
 Thu, 21 Aug 2025 09:32:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Z91fAsfnpmjNJwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 09:32:55 +0000
Message-ID: <0e8a1005-baa6-493e-a514-cd5d806949e1@suse.de>
Date: Thu, 21 Aug 2025 11:32:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH AUTOSEL 6.14 107/642] drm/amdgpu: adjust
 drm_firmware_drivers_only() handling
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Kent Russell <kent.russell@amd.com>, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, lijo.lazar@amd.com,
 mario.limonciello@amd.com, rajneesh.bhardwaj@amd.com, kenneth.feng@amd.com,
 Ramesh.Errabolu@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250505221419.2672473-1-sashal@kernel.org>
 <20250505221419.2672473-107-sashal@kernel.org>
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
In-Reply-To: <20250505221419.2672473-107-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[15];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Am 06.05.25 um 00:05 schrieb Sasha Levin:
> From: Alex Deucher <alexander.deucher@amd.com>
>
> [ Upstream commit e00e5c223878a60e391e5422d173c3382d378f87 ]
>
> Move to probe so we can check the PCI device type and
> only apply the drm_firmware_drivers_only() check for
> PCI DISPLAY classes.  Also add a module parameter to
> override the nomodeset kernel parameter as a workaround
> for platforms that have this hardcoded on their kernel
> command lines.

I just came across this patch because it got backported into various 
older releases. It was part of the series at [1]. From the cover letter:

 >>>

There are a number of systems and cloud providers out there
that have nomodeset hardcoded in their kernel parameters
to block nouveau for the nvidia driver.  This prevents the
amdgpu driver from loading. Unfortunately the end user cannot
easily change this.  The preferred way to block modules from
loading is to use modprobe.blacklist=<driver>.  That is what
providers should be using to block specific drivers.

Drop the check to allow the driver to load even when nomodeset
is specified on the kernel command line.

<<<

Why was that series never on dri-devel?

Why is this necessary in the upstream kernel? It works around a problem 
with the user's configuration. The series' cover letter already states 
the correct solution.

Firmware-only parameters affect all drivers; why not try for a common 
solution? At least the test against the PCI class appears useful in the 
common case.

Best regards
Thomas


>
> Reviewed-by: Kent Russell <kent.russell@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index f2d77bc04e4a9..7246c54bd2bbf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -173,6 +173,7 @@ uint amdgpu_sdma_phase_quantum = 32;
>   char *amdgpu_disable_cu;
>   char *amdgpu_virtual_display;
>   bool enforce_isolation;
> +int amdgpu_modeset = -1;
>   
>   /* Specifies the default granularity for SVM, used in buffer
>    * migration and restoration of backing memory when handling
> @@ -1033,6 +1034,13 @@ module_param_named(user_partt_mode, amdgpu_user_partt_mode, uint, 0444);
>   module_param(enforce_isolation, bool, 0444);
>   MODULE_PARM_DESC(enforce_isolation, "enforce process isolation between graphics and compute . enforce_isolation = on");
>   
> +/**
> + * DOC: modeset (int)
> + * Override nomodeset (1 = override, -1 = auto). The default is -1 (auto).
> + */
> +MODULE_PARM_DESC(modeset, "Override nomodeset (1 = enable, -1 = auto)");
> +module_param_named(modeset, amdgpu_modeset, int, 0444);
> +
>   /**
>    * DOC: seamless (int)
>    * Seamless boot will keep the image on the screen during the boot process.
> @@ -2244,6 +2252,12 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>   	int ret, retry = 0, i;
>   	bool supports_atomic = false;
>   
> +	if ((pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA ||
> +	    (pdev->class >> 8) == PCI_CLASS_DISPLAY_OTHER) {
> +		if (drm_firmware_drivers_only() && amdgpu_modeset == -1)
> +			return -EINVAL;
> +	}
> +
>   	/* skip devices which are owned by radeon */
>   	for (i = 0; i < ARRAY_SIZE(amdgpu_unsupported_pciidlist); i++) {
>   		if (amdgpu_unsupported_pciidlist[i] == pdev->device)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)



Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B1B97CDE0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 20:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17D110E76D;
	Thu, 19 Sep 2024 18:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nEhYEFx+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ysTABskm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nEhYEFx+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ysTABskm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435CF10E75D;
 Thu, 19 Sep 2024 18:58:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8FFD120A35;
 Thu, 19 Sep 2024 18:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726772284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=selmG9sv2Rc+Z+AIxNq38Y15kNQJ3wbA3QV55V81zvY=;
 b=nEhYEFx+LkUwx1tLogcykjEC+8GhlRlt0h1nNlSPBhWp6ZATuiwlc7NJZNRBk3U4PuRhv8
 2yXFHDlqicWfPoqtG2EF6sMLcQLqFseteIlTDBxii6Z4BIn2pQ0x7SEbOiTBMXFaopDhIr
 jRKxKsTXFAoMVyWg8C5hZvDdZE5Zddk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726772284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=selmG9sv2Rc+Z+AIxNq38Y15kNQJ3wbA3QV55V81zvY=;
 b=ysTABskmetoNgIZYuG6QODRGPGnV6Bo6uri6N0jVOEMmVaRXEqxzQvYHeEVlSnXZs6qFLd
 UWlKJqs5opv/NUCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nEhYEFx+;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ysTABskm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726772284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=selmG9sv2Rc+Z+AIxNq38Y15kNQJ3wbA3QV55V81zvY=;
 b=nEhYEFx+LkUwx1tLogcykjEC+8GhlRlt0h1nNlSPBhWp6ZATuiwlc7NJZNRBk3U4PuRhv8
 2yXFHDlqicWfPoqtG2EF6sMLcQLqFseteIlTDBxii6Z4BIn2pQ0x7SEbOiTBMXFaopDhIr
 jRKxKsTXFAoMVyWg8C5hZvDdZE5Zddk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726772284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=selmG9sv2Rc+Z+AIxNq38Y15kNQJ3wbA3QV55V81zvY=;
 b=ysTABskmetoNgIZYuG6QODRGPGnV6Bo6uri6N0jVOEMmVaRXEqxzQvYHeEVlSnXZs6qFLd
 UWlKJqs5opv/NUCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8AF8513A1E;
 Thu, 19 Sep 2024 18:58:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0gE5ITt07GaTGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 19 Sep 2024 18:58:03 +0000
Message-ID: <0c768bf6-bc19-43de-a30b-ff5e3ddfd0b3@suse.de>
Date: Thu, 19 Sep 2024 20:58:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] treewide: Correct the typo 'acccess'
To: WangYuli <wangyuli@uniontech.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, vitaly.prosyak@amd.com,
 yifan1.zhang@amd.com, Tim.Huang@amd.com, jesse.zhang@amd.com,
 Prike.Liang@amd.com, Hawking.Zhang@amd.com, kevinyang.wang@amd.com,
 srinivasan.shanmugam@amd.com, Jiadong.Zhu@amd.com, tao.zhou1@amd.com,
 pavel@ucw.cz, lee@kernel.org, aren@peacevolution.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, le.ma@amd.com,
 Wenhui.Sheng@amd.com, jjhiblot@traphandler.com, guanwentao@uniontech.com,
 zhanjun@uniontech.com
References: <4AB1F900B5D100C2+20240919182855.85840-1-wangyuli@uniontech.com>
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
In-Reply-To: <4AB1F900B5D100C2+20240919182855.85840-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8FFD120A35
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[uniontech.com,amd.com,gmail.com,ffwll.ch,ucw.cz,kernel.org,peacevolution.org];
 RCPT_COUNT_TWELVE(0.00)[29]; MIME_TRACE(0.00)[0:+];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 MID_RHS_MATCH_FROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RL516un6i87yts6oyas1exgued)];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Am 19.09.24 um 20:28 schrieb WangYuli:
> There are some spelling mistakes of 'acccess' in comments which
> should be instead of 'access'.
>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c   | 2 +-
>   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c  | 2 +-
>   drivers/leds/rgb/leds-group-multicolor.c | 2 +-

I think it's better to make 2 patches: one for amdgpu and one for leds. 
Each patch can then go into the correct tree.

If you make 2 patches, you can add

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

to each of them.

Best regards
Thomas

>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> index d3e8be82a172..f847a9fc61e1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> @@ -1894,7 +1894,7 @@ static void gfx_v11_0_init_compute_vmid(struct amdgpu_device *adev)
>   	mutex_unlock(&adev->srbm_mutex);
>   
>   	/* Initialize all compute VMIDs to have no GDS, GWS, or OA
> -	   acccess. These should be enabled by FW for target VMIDs. */
> +	   access. These should be enabled by FW for target VMIDs. */
>   	for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
>   		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_BASE, 2 * i, 0);
>   		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_SIZE, 2 * i, 0);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> index 408e5600bb61..13dca7377f53 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> @@ -1248,7 +1248,7 @@ static void gfx_v9_4_3_xcc_init_compute_vmid(struct amdgpu_device *adev,
>   	mutex_unlock(&adev->srbm_mutex);
>   
>   	/* Initialize all compute VMIDs to have no GDS, GWS, or OA
> -	   acccess. These should be enabled by FW for target VMIDs. */
> +	   access. These should be enabled by FW for target VMIDs. */
>   	for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
>   		WREG32_SOC15_OFFSET(GC, GET_INST(GC, xcc_id), regGDS_VMID0_BASE, 2 * i, 0);
>   		WREG32_SOC15_OFFSET(GC, GET_INST(GC, xcc_id), regGDS_VMID0_SIZE, 2 * i, 0);
> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
> index b6c7679015fd..548c7dd63ba1 100644
> --- a/drivers/leds/rgb/leds-group-multicolor.c
> +++ b/drivers/leds/rgb/leds-group-multicolor.c
> @@ -55,7 +55,7 @@ static void restore_sysfs_write_access(void *data)
>   {
>   	struct led_classdev *led_cdev = data;
>   
> -	/* Restore the write acccess to the LED */
> +	/* Restore the write access to the LED */
>   	mutex_lock(&led_cdev->led_access);
>   	led_sysfs_enable(led_cdev);
>   	mutex_unlock(&led_cdev->led_access);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


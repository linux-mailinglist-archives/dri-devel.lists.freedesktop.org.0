Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4E09184BC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25E810E8F6;
	Wed, 26 Jun 2024 14:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="2KKjN3V7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JKAtOpjr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2KKjN3V7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JKAtOpjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6E910E8F6;
 Wed, 26 Jun 2024 14:45:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 187701FB57;
 Wed, 26 Jun 2024 14:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719413143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OcWujkPoCob+1bpQdKUYlH6gppmc+0nz4OvCsAtTE6U=;
 b=2KKjN3V7XGbzFvynQcWjeSxJfAUACJ7gMc9Q/LpttIgYfxGSP9qFhm2Od79Aafh9GSjt+/
 Ic+blWT3zEC4eAYIQ+VDsKpVpiv/VYo/bXREAjma3vPYJ8j2FACBLiXkcV27mtpsqHJgWy
 28voG1tFSdMoUxD4f/0ySiLVH550e24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719413143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OcWujkPoCob+1bpQdKUYlH6gppmc+0nz4OvCsAtTE6U=;
 b=JKAtOpjrrs9MpzH6PvL+mgRYa3OvNtfJOZZIhaXeBqf28JSy3Z0P6mh4xIc5JTZTYrN97d
 pwnRFEqfnkJ7EuDQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2KKjN3V7;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JKAtOpjr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719413143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OcWujkPoCob+1bpQdKUYlH6gppmc+0nz4OvCsAtTE6U=;
 b=2KKjN3V7XGbzFvynQcWjeSxJfAUACJ7gMc9Q/LpttIgYfxGSP9qFhm2Od79Aafh9GSjt+/
 Ic+blWT3zEC4eAYIQ+VDsKpVpiv/VYo/bXREAjma3vPYJ8j2FACBLiXkcV27mtpsqHJgWy
 28voG1tFSdMoUxD4f/0ySiLVH550e24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719413143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OcWujkPoCob+1bpQdKUYlH6gppmc+0nz4OvCsAtTE6U=;
 b=JKAtOpjrrs9MpzH6PvL+mgRYa3OvNtfJOZZIhaXeBqf28JSy3Z0P6mh4xIc5JTZTYrN97d
 pwnRFEqfnkJ7EuDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C3152139C2;
 Wed, 26 Jun 2024 14:45:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pPtALpYpfGb3WgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jun 2024 14:45:42 +0000
Message-ID: <c549235c-2542-454f-b0ae-1ce6ea884f5c@suse.de>
Date: Wed, 26 Jun 2024 16:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/radeon: rdev->ddev to rdev_to_drm(rdev) 1
To: Wu Hoi Pok <wuhoipok@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240624151122.23724-1-wuhoipok@gmail.com>
 <20240624151122.23724-3-wuhoipok@gmail.com>
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
In-Reply-To: <20240624151122.23724-3-wuhoipok@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 187701FB57
X-Spam-Score: -4.50
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:dkim]
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

please squash patches 2 to 7 into a single patch that goes first.

Am 24.06.24 um 17:10 schrieb Wu Hoi Pok:
> Please refer to patch 1.

That's not a commit message. Once a patchset landed, no one will know 
what patch 1 was.

Best regards
Thomas

>
> Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
> ---
>   drivers/gpu/drm/radeon/atombios_encoders.c |  2 +-
>   drivers/gpu/drm/radeon/cik.c               | 14 ++++++-------
>   drivers/gpu/drm/radeon/dce6_afmt.c         |  2 +-
>   drivers/gpu/drm/radeon/evergreen.c         | 12 +++++------
>   drivers/gpu/drm/radeon/ni.c                |  2 +-
>   drivers/gpu/drm/radeon/r100.c              | 24 +++++++++++-----------
>   6 files changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
> index 03e6871b3065..c82e0fbc49b4 100644
> --- a/drivers/gpu/drm/radeon/atombios_encoders.c
> +++ b/drivers/gpu/drm/radeon/atombios_encoders.c
> @@ -2179,7 +2179,7 @@ int radeon_atom_pick_dig_encoder(struct drm_encoder *encoder, int fe_idx)
>   void
>   radeon_atom_encoder_init(struct radeon_device *rdev)
>   {
> -	struct drm_device *dev = rdev->ddev;
> +	struct drm_device *dev = rdev_to_drm(rdev);
>   	struct drm_encoder *encoder;
>   
>   	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index b5e96a8fc2c1..11a492f21157 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -7585,7 +7585,7 @@ int cik_irq_process(struct radeon_device *rdev)
>   					DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
>   
>   				if (rdev->irq.crtc_vblank_int[0]) {
> -					drm_handle_vblank(rdev->ddev, 0);
> +					drm_handle_vblank(rdev_to_drm(rdev), 0);
>   					rdev->pm.vblank_sync = true;
>   					wake_up(&rdev->irq.vblank_queue);
>   				}
> @@ -7615,7 +7615,7 @@ int cik_irq_process(struct radeon_device *rdev)
>   					DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
>   
>   				if (rdev->irq.crtc_vblank_int[1]) {
> -					drm_handle_vblank(rdev->ddev, 1);
> +					drm_handle_vblank(rdev_to_drm(rdev), 1);
>   					rdev->pm.vblank_sync = true;
>   					wake_up(&rdev->irq.vblank_queue);
>   				}
> @@ -7645,7 +7645,7 @@ int cik_irq_process(struct radeon_device *rdev)
>   					DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
>   
>   				if (rdev->irq.crtc_vblank_int[2]) {
> -					drm_handle_vblank(rdev->ddev, 2);
> +					drm_handle_vblank(rdev_to_drm(rdev), 2);
>   					rdev->pm.vblank_sync = true;
>   					wake_up(&rdev->irq.vblank_queue);
>   				}
> @@ -7675,7 +7675,7 @@ int cik_irq_process(struct radeon_device *rdev)
>   					DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
>   
>   				if (rdev->irq.crtc_vblank_int[3]) {
> -					drm_handle_vblank(rdev->ddev, 3);
> +					drm_handle_vblank(rdev_to_drm(rdev), 3);
>   					rdev->pm.vblank_sync = true;
>   					wake_up(&rdev->irq.vblank_queue);
>   				}
> @@ -7705,7 +7705,7 @@ int cik_irq_process(struct radeon_device *rdev)
>   					DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
>   
>   				if (rdev->irq.crtc_vblank_int[4]) {
> -					drm_handle_vblank(rdev->ddev, 4);
> +					drm_handle_vblank(rdev_to_drm(rdev), 4);
>   					rdev->pm.vblank_sync = true;
>   					wake_up(&rdev->irq.vblank_queue);
>   				}
> @@ -7735,7 +7735,7 @@ int cik_irq_process(struct radeon_device *rdev)
>   					DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
>   
>   				if (rdev->irq.crtc_vblank_int[5]) {
> -					drm_handle_vblank(rdev->ddev, 5);
> +					drm_handle_vblank(rdev_to_drm(rdev), 5);
>   					rdev->pm.vblank_sync = true;
>   					wake_up(&rdev->irq.vblank_queue);
>   				}
> @@ -8581,7 +8581,7 @@ int cik_init(struct radeon_device *rdev)
>   	/* Initialize surface registers */
>   	radeon_surface_init(rdev);
>   	/* Initialize clocks */
> -	radeon_get_clock_info(rdev->ddev);
> +	radeon_get_clock_info(rdev_to_drm(rdev));
>   
>   	/* Fence driver */
>   	radeon_fence_driver_init(rdev);
> diff --git a/drivers/gpu/drm/radeon/dce6_afmt.c b/drivers/gpu/drm/radeon/dce6_afmt.c
> index 4c06f47453fd..d6ab93ed9ec4 100644
> --- a/drivers/gpu/drm/radeon/dce6_afmt.c
> +++ b/drivers/gpu/drm/radeon/dce6_afmt.c
> @@ -91,7 +91,7 @@ struct r600_audio_pin *dce6_audio_get_pin(struct radeon_device *rdev)
>   			pin = &rdev->audio.pin[i];
>   			pin_count = 0;
>   
> -			list_for_each_entry(encoder, &rdev->ddev->mode_config.encoder_list, head) {
> +			list_for_each_entry(encoder, &rdev_to_drm(rdev)->mode_config.encoder_list, head) {
>   				if (radeon_encoder_is_digital(encoder)) {
>   					radeon_encoder = to_radeon_encoder(encoder);
>   					dig = radeon_encoder->enc_priv;
> diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
> index c634dc28e6c3..bc4ab71613a5 100644
> --- a/drivers/gpu/drm/radeon/evergreen.c
> +++ b/drivers/gpu/drm/radeon/evergreen.c
> @@ -1673,7 +1673,7 @@ void evergreen_pm_misc(struct radeon_device *rdev)
>    */
>   void evergreen_pm_prepare(struct radeon_device *rdev)
>   {
> -	struct drm_device *ddev = rdev->ddev;
> +	struct drm_device *ddev = rdev_to_drm(rdev);
>   	struct drm_crtc *crtc;
>   	struct radeon_crtc *radeon_crtc;
>   	u32 tmp;
> @@ -1698,7 +1698,7 @@ void evergreen_pm_prepare(struct radeon_device *rdev)
>    */
>   void evergreen_pm_finish(struct radeon_device *rdev)
>   {
> -	struct drm_device *ddev = rdev->ddev;
> +	struct drm_device *ddev = rdev_to_drm(rdev);
>   	struct drm_crtc *crtc;
>   	struct radeon_crtc *radeon_crtc;
>   	u32 tmp;
> @@ -1763,7 +1763,7 @@ void evergreen_hpd_set_polarity(struct radeon_device *rdev,
>    */
>   void evergreen_hpd_init(struct radeon_device *rdev)
>   {
> -	struct drm_device *dev = rdev->ddev;
> +	struct drm_device *dev = rdev_to_drm(rdev);
>   	struct drm_connector *connector;
>   	unsigned enabled = 0;
>   	u32 tmp = DC_HPDx_CONNECTION_TIMER(0x9c4) |
> @@ -1804,7 +1804,7 @@ void evergreen_hpd_init(struct radeon_device *rdev)
>    */
>   void evergreen_hpd_fini(struct radeon_device *rdev)
>   {
> -	struct drm_device *dev = rdev->ddev;
> +	struct drm_device *dev = rdev_to_drm(rdev);
>   	struct drm_connector *connector;
>   	unsigned disabled = 0;
>   
> @@ -4753,7 +4753,7 @@ int evergreen_irq_process(struct radeon_device *rdev)
>   				event_name = "vblank";
>   
>   				if (rdev->irq.crtc_vblank_int[crtc_idx]) {
> -					drm_handle_vblank(rdev->ddev, crtc_idx);
> +					drm_handle_vblank(rdev_to_drm(rdev), crtc_idx);
>   					rdev->pm.vblank_sync = true;
>   					wake_up(&rdev->irq.vblank_queue);
>   				}
> @@ -5211,7 +5211,7 @@ int evergreen_init(struct radeon_device *rdev)
>   	/* Initialize surface registers */
>   	radeon_surface_init(rdev);
>   	/* Initialize clocks */
> -	radeon_get_clock_info(rdev->ddev);
> +	radeon_get_clock_info(rdev_to_drm(rdev));
>   	/* Fence driver */
>   	radeon_fence_driver_init(rdev);
>   	/* initialize AGP */
> diff --git a/drivers/gpu/drm/radeon/ni.c b/drivers/gpu/drm/radeon/ni.c
> index 77aee99e473a..3890911fe693 100644
> --- a/drivers/gpu/drm/radeon/ni.c
> +++ b/drivers/gpu/drm/radeon/ni.c
> @@ -2360,7 +2360,7 @@ int cayman_init(struct radeon_device *rdev)
>   	/* Initialize surface registers */
>   	radeon_surface_init(rdev);
>   	/* Initialize clocks */
> -	radeon_get_clock_info(rdev->ddev);
> +	radeon_get_clock_info(rdev_to_drm(rdev));
>   	/* Fence driver */
>   	radeon_fence_driver_init(rdev);
>   	/* initialize memory controller */
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
> index 0b1e19345f43..d7d7d23bf9a1 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -459,7 +459,7 @@ void r100_pm_misc(struct radeon_device *rdev)
>    */
>   void r100_pm_prepare(struct radeon_device *rdev)
>   {
> -	struct drm_device *ddev = rdev->ddev;
> +	struct drm_device *ddev = rdev_to_drm(rdev);
>   	struct drm_crtc *crtc;
>   	struct radeon_crtc *radeon_crtc;
>   	u32 tmp;
> @@ -490,7 +490,7 @@ void r100_pm_prepare(struct radeon_device *rdev)
>    */
>   void r100_pm_finish(struct radeon_device *rdev)
>   {
> -	struct drm_device *ddev = rdev->ddev;
> +	struct drm_device *ddev = rdev_to_drm(rdev);
>   	struct drm_crtc *crtc;
>   	struct radeon_crtc *radeon_crtc;
>   	u32 tmp;
> @@ -603,7 +603,7 @@ void r100_hpd_set_polarity(struct radeon_device *rdev,
>    */
>   void r100_hpd_init(struct radeon_device *rdev)
>   {
> -	struct drm_device *dev = rdev->ddev;
> +	struct drm_device *dev = rdev_to_drm(rdev);
>   	struct drm_connector *connector;
>   	unsigned enable = 0;
>   
> @@ -626,7 +626,7 @@ void r100_hpd_init(struct radeon_device *rdev)
>    */
>   void r100_hpd_fini(struct radeon_device *rdev)
>   {
> -	struct drm_device *dev = rdev->ddev;
> +	struct drm_device *dev = rdev_to_drm(rdev);
>   	struct drm_connector *connector;
>   	unsigned disable = 0;
>   
> @@ -798,7 +798,7 @@ int r100_irq_process(struct radeon_device *rdev)
>   		/* Vertical blank interrupts */
>   		if (status & RADEON_CRTC_VBLANK_STAT) {
>   			if (rdev->irq.crtc_vblank_int[0]) {
> -				drm_handle_vblank(rdev->ddev, 0);
> +				drm_handle_vblank(rdev_to_drm(rdev), 0);
>   				rdev->pm.vblank_sync = true;
>   				wake_up(&rdev->irq.vblank_queue);
>   			}
> @@ -807,7 +807,7 @@ int r100_irq_process(struct radeon_device *rdev)
>   		}
>   		if (status & RADEON_CRTC2_VBLANK_STAT) {
>   			if (rdev->irq.crtc_vblank_int[1]) {
> -				drm_handle_vblank(rdev->ddev, 1);
> +				drm_handle_vblank(rdev_to_drm(rdev), 1);
>   				rdev->pm.vblank_sync = true;
>   				wake_up(&rdev->irq.vblank_queue);
>   			}
> @@ -1471,7 +1471,7 @@ int r100_cs_packet_parse_vline(struct radeon_cs_parser *p)
>   	header = radeon_get_ib_value(p, h_idx);
>   	crtc_id = radeon_get_ib_value(p, h_idx + 5);
>   	reg = R100_CP_PACKET0_GET_REG(header);
> -	crtc = drm_crtc_find(p->rdev->ddev, p->filp, crtc_id);
> +	crtc = drm_crtc_find(rdev_to_drm(p->rdev), p->filp, crtc_id);
>   	if (!crtc) {
>   		DRM_ERROR("cannot find crtc %d\n", crtc_id);
>   		return -ENOENT;
> @@ -3059,7 +3059,7 @@ DEFINE_SHOW_ATTRIBUTE(r100_debugfs_mc_info);
>   void  r100_debugfs_rbbm_init(struct radeon_device *rdev)
>   {
>   #if defined(CONFIG_DEBUG_FS)
> -	struct dentry *root = rdev->ddev->primary->debugfs_root;
> +	struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>   
>   	debugfs_create_file("r100_rbbm_info", 0444, root, rdev,
>   			    &r100_debugfs_rbbm_info_fops);
> @@ -3069,7 +3069,7 @@ void  r100_debugfs_rbbm_init(struct radeon_device *rdev)
>   void r100_debugfs_cp_init(struct radeon_device *rdev)
>   {
>   #if defined(CONFIG_DEBUG_FS)
> -	struct dentry *root = rdev->ddev->primary->debugfs_root;
> +	struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>   
>   	debugfs_create_file("r100_cp_ring_info", 0444, root, rdev,
>   			    &r100_debugfs_cp_ring_info_fops);
> @@ -3081,7 +3081,7 @@ void r100_debugfs_cp_init(struct radeon_device *rdev)
>   void  r100_debugfs_mc_info_init(struct radeon_device *rdev)
>   {
>   #if defined(CONFIG_DEBUG_FS)
> -	struct dentry *root = rdev->ddev->primary->debugfs_root;
> +	struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>   
>   	debugfs_create_file("r100_mc_info", 0444, root, rdev,
>   			    &r100_debugfs_mc_info_fops);
> @@ -3947,7 +3947,7 @@ int r100_resume(struct radeon_device *rdev)
>   			RREG32(R_0007C0_CP_STAT));
>   	}
>   	/* post */
> -	radeon_combios_asic_init(rdev->ddev);
> +	radeon_combios_asic_init(rdev_to_drm(rdev));
>   	/* Resume clock after posting */
>   	r100_clock_startup(rdev);
>   	/* Initialize surface registers */
> @@ -4056,7 +4056,7 @@ int r100_init(struct radeon_device *rdev)
>   	/* Set asic errata */
>   	r100_errata(rdev);
>   	/* Initialize clocks */
> -	radeon_get_clock_info(rdev->ddev);
> +	radeon_get_clock_info(rdev_to_drm(rdev));
>   	/* initialize AGP */
>   	if (rdev->flags & RADEON_IS_AGP) {
>   		r = radeon_agp_init(rdev);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


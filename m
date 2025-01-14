Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C806A1026C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 09:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E9910E890;
	Tue, 14 Jan 2025 08:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="lvla28ge";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vG87vBrp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lvla28ge";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vG87vBrp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1576810E88C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 08:54:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BD6DC1F38F;
 Tue, 14 Jan 2025 08:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736844861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HKgOtgw4sNwu6g6XMWoDQ+T4igadmr9tSXc+U5FBPbE=;
 b=lvla28geNZdEhfmGcyakK9ef3+y2Fvk134npglY52Eyl/LB8sqkh3P+Aq0Dp6+MKhdEjEI
 Gm00vlFP5WqksaSHnB/MdRKS/ZgW0Otd5T2e7HNRkSLccvJn9SZMPbdmqx6KeJ3PSn711p
 KYZFg1Rik8Arz/H4fbJvGp5XUbkNqcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736844861;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HKgOtgw4sNwu6g6XMWoDQ+T4igadmr9tSXc+U5FBPbE=;
 b=vG87vBrpxqyHkVsyfJMZPOXgckCSaXrVKj/Vj3E7MY6gMFO9zEDGv/CPF5kLRXtdFv+JIo
 EC6DSiJZC+q+dMAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736844861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HKgOtgw4sNwu6g6XMWoDQ+T4igadmr9tSXc+U5FBPbE=;
 b=lvla28geNZdEhfmGcyakK9ef3+y2Fvk134npglY52Eyl/LB8sqkh3P+Aq0Dp6+MKhdEjEI
 Gm00vlFP5WqksaSHnB/MdRKS/ZgW0Otd5T2e7HNRkSLccvJn9SZMPbdmqx6KeJ3PSn711p
 KYZFg1Rik8Arz/H4fbJvGp5XUbkNqcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736844861;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HKgOtgw4sNwu6g6XMWoDQ+T4igadmr9tSXc+U5FBPbE=;
 b=vG87vBrpxqyHkVsyfJMZPOXgckCSaXrVKj/Vj3E7MY6gMFO9zEDGv/CPF5kLRXtdFv+JIo
 EC6DSiJZC+q+dMAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 489601384C;
 Tue, 14 Jan 2025 08:54:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +jdxED0mhme0bAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Jan 2025 08:54:21 +0000
Message-ID: <6ab6000d-cfe0-4ee9-b7f7-109856c89285@suse.de>
Date: Tue, 14 Jan 2025 09:54:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] drm/vkms: Switch to managed for connector
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
References: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
 <20250113-google-vkms-managed-v7-1-4f81d1893e0b@bootlin.com>
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
In-Reply-To: <20250113-google-vkms-managed-v7-1-4f81d1893e0b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.72 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.12)[-0.611]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[bootlin.com,gmail.com,riseup.net,linux.intel.com,kernel.org,ffwll.ch];
 TAGGED_RCPT(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[19]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Score: -2.72
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




Am 13.01.25 um 18:09 schrieb Louis Chauvet:
> The current VKMS driver uses non-managed function to create connectors. It
> is not an issue yet, but in order to support multiple devices easily,
> convert this code to use drm and device managed helpers.
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maíra Canal <mcanal@igalia.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vkms/vkms_output.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 8f4bd5aef087b459d37d0cbbf90fe0145090917a..570823ecb28f589e6323036590ec05a2f633bc9b 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -3,11 +3,11 @@
>   #include "vkms_drv.h"
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_edid.h>
> +#include <drm/drm_managed.h>
>   #include <drm/drm_probe_helper.h>
>   
>   static const struct drm_connector_funcs vkms_connector_funcs = {
>   	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
>   	.reset = drm_atomic_helper_connector_reset,
>   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> @@ -75,8 +75,8 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>   		}
>   	}
>   
> -	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
> -				 DRM_MODE_CONNECTOR_VIRTUAL);
> +	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
> +				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
>   	if (ret) {
>   		DRM_ERROR("Failed to init connector\n");
>   		return ret;
> @@ -88,7 +88,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>   			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>   	if (ret) {
>   		DRM_ERROR("Failed to init encoder\n");
> -		goto err_encoder;
> +		return ret;
>   	}
>   	encoder->possible_crtcs = drm_crtc_mask(crtc);
>   
> @@ -110,9 +110,5 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>   
>   err_attach:
>   	drm_encoder_cleanup(encoder);
> -
> -err_encoder:
> -	drm_connector_cleanup(connector);
> -
>   	return ret;
>   }
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


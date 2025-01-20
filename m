Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBECCA16BBF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 12:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C6610E3C9;
	Mon, 20 Jan 2025 11:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZDwYZoEP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0a+cytFM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZDwYZoEP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0a+cytFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EC310E3C8;
 Mon, 20 Jan 2025 11:41:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 99DEE2117C;
 Mon, 20 Jan 2025 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737373256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=biX32WFKRdLT8vn1NI8/UsG4SJIRTaJvEutDO+E9rzQ=;
 b=ZDwYZoEPAE7qGDn/qM9gTA/1++wSMC+wwOTGCrIyEGWeom74J0ntvKVB4fbtU1ULFNfLuX
 aov9Cb1k8pU7n6KDc7L30dK1p76NDoVsVSvjRKuihfbwCo/CSrVvsQAcoTHO26gfE4W8jg
 Dn6fN1T7hxr5swLc7ufdqOpp4Fuso8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737373256;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=biX32WFKRdLT8vn1NI8/UsG4SJIRTaJvEutDO+E9rzQ=;
 b=0a+cytFMSWrKSmVK9YA0kjfLEAYcmHPJMNDJJQZa54df9PFDlIqBdD+0gCe+2bn7aAnLX+
 v6UGT1TtuK4AuuCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZDwYZoEP;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0a+cytFM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737373256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=biX32WFKRdLT8vn1NI8/UsG4SJIRTaJvEutDO+E9rzQ=;
 b=ZDwYZoEPAE7qGDn/qM9gTA/1++wSMC+wwOTGCrIyEGWeom74J0ntvKVB4fbtU1ULFNfLuX
 aov9Cb1k8pU7n6KDc7L30dK1p76NDoVsVSvjRKuihfbwCo/CSrVvsQAcoTHO26gfE4W8jg
 Dn6fN1T7hxr5swLc7ufdqOpp4Fuso8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737373256;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=biX32WFKRdLT8vn1NI8/UsG4SJIRTaJvEutDO+E9rzQ=;
 b=0a+cytFMSWrKSmVK9YA0kjfLEAYcmHPJMNDJJQZa54df9PFDlIqBdD+0gCe+2bn7aAnLX+
 v6UGT1TtuK4AuuCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7AC501393E;
 Mon, 20 Jan 2025 11:40:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QoPAHEg2jmf6bQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jan 2025 11:40:56 +0000
Message-ID: <68c9501f-c75a-409e-8295-b164bc081bff@suse.de>
Date: Mon, 20 Jan 2025 12:40:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/client: Handle tiled displays better
To: Maarten Lankhorst <dev@lankhorst.se>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250116142825.3933-1-dev@lankhorst.se>
 <20250116142825.3933-2-dev@lankhorst.se>
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
In-Reply-To: <20250116142825.3933-2-dev@lankhorst.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 99DEE2117C
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
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




Am 16.01.25 um 15:28 schrieb Maarten Lankhorst:
> When testing on my tiled display, initially the tiled display is
> detected correctly:
> [90376.523692] xe 0000:67:00.0: [drm:drm_client_firmware_config.isra.0 [drm]] fallback: Not all outputs enabled
> [90376.523713] xe 0000:67:00.0: [drm:drm_client_firmware_config.isra.0 [drm]] Enabled: 0, detected: 2
> ...
> [90376.523967] xe 0000:67:00.0: [drm:drm_client_modeset_probe [drm]] [CRTC:82:pipe A] desired mode 1920x2160 set (1920,0)
> [90376.524020] xe 0000:67:00.0: [drm:drm_client_modeset_probe [drm]] [CRTC:134:pipe B] desired mode 1920x2160 set (0,0)
>
> But then, when modes have been set:
> [90379.729525] xe 0000:67:00.0: [drm:drm_client_firmware_config.isra.0 [drm]] [CONNECTOR:287:DP-4] on [CRTC:82:pipe A]: 1920x2160
> [90379.729640] xe 0000:67:00.0: [drm:drm_client_firmware_config.isra.0 [drm]] [CONNECTOR:289:DP-5] on [CRTC:134:pipe B]: 1920x2160
> ...
> [90379.730036] xe 0000:67:00.0: [drm:drm_client_modeset_probe [drm]] [CRTC:82:pipe A] desired mode 1920x2160 set (0,0)
> [90379.730124] xe 0000:67:00.0: [drm:drm_client_modeset_probe [drm]] [CRTC:134:pipe B] desired mode 1920x2160 set (0,0)
>
> Call drm_client_get_tile_offsets() in drm_client_firmware_config() as
> well, to ensure that the offset is set correctly.
>
> This has to be done as a separate pass, as the tile order may not be
> equal to the drm connector order.
>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_client_modeset.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 251f943137179..aca442c25209a 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -743,6 +743,15 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>   	if ((conn_configured & mask) != mask && conn_configured != conn_seq)
>   		goto retry;
>   
> +	for (i = 0; i < count; i++) {
> +		struct drm_connector *connector = connectors[i];
> +
> +		if (connector->has_tile)
> +			drm_client_get_tile_offsets(dev, connectors, connector_count,
> +						    modes, offsets, i,
> +						    connector->tile_h_loc, connector->tile_v_loc);
> +	}
> +
>   	/*
>   	 * If the BIOS didn't enable everything it could, fall back to have the
>   	 * same user experiencing of lighting up as much as possible like the

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


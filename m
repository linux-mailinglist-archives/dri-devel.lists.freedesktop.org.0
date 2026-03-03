Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGOgN7irpmn9SgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 10:36:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 502FD1EBF91
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 10:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C2E10E749;
	Tue,  3 Mar 2026 09:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="koH7ciuC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LK9Xg1TT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="koH7ciuC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LK9Xg1TT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C731710E749
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 09:36:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7DE333F822;
 Tue,  3 Mar 2026 09:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772530611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/3T6V4yCyVwpfclVgp1b5NHCSdZ5jI6Vo2cfZjLwfVk=;
 b=koH7ciuC+7IUtuFX6IsC+/ao10biiokpO/1lExLlaTCqpi64yV7QaVjTfYUCaFy6ht4RAc
 LC3wwBNCZPxcSx14qRR/LmUuLbCU6AIK+h1+rMy5AMd2dexLUDWq3hj7Qdb6eB0rWVpI9g
 ehgmdj3KgoG82reQi8aJ30iQNZha968=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772530611;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/3T6V4yCyVwpfclVgp1b5NHCSdZ5jI6Vo2cfZjLwfVk=;
 b=LK9Xg1TTrclsjrcLyqkWRVhWODId9xtZTKsPWMWZKw3d2KBqUDO+lYTZ05G+dW3zv7OOq4
 Wy2C92xVUX4PidDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772530611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/3T6V4yCyVwpfclVgp1b5NHCSdZ5jI6Vo2cfZjLwfVk=;
 b=koH7ciuC+7IUtuFX6IsC+/ao10biiokpO/1lExLlaTCqpi64yV7QaVjTfYUCaFy6ht4RAc
 LC3wwBNCZPxcSx14qRR/LmUuLbCU6AIK+h1+rMy5AMd2dexLUDWq3hj7Qdb6eB0rWVpI9g
 ehgmdj3KgoG82reQi8aJ30iQNZha968=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772530611;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/3T6V4yCyVwpfclVgp1b5NHCSdZ5jI6Vo2cfZjLwfVk=;
 b=LK9Xg1TTrclsjrcLyqkWRVhWODId9xtZTKsPWMWZKw3d2KBqUDO+lYTZ05G+dW3zv7OOq4
 Wy2C92xVUX4PidDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A4203EA69;
 Tue,  3 Mar 2026 09:36:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NuvQDLOrpmmjUwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Mar 2026 09:36:51 +0000
Message-ID: <b413c625-ccbc-4c10-819d-5034a0ac9a17@suse.de>
Date: Tue, 3 Mar 2026 10:36:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sitronix/st7586: fix bad pixel data due to byte swap
To: David Lechner <dlechner@baylibre.com>,
 David Lechner <david@lechnology.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?=
 <noralf@tronnes.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260228-drm-mipi-dbi-fix-st7586-byte-swap-v1-1-e78f6c24cd28@baylibre.com>
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
In-Reply-To: <20260228-drm-mipi-dbi-fix-st7586-byte-swap-v1-1-e78f6c24cd28@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
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
X-Rspamd-Queue-Id: 502FD1EBF91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dlechner@baylibre.com,m:david@lechnology.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:noralf@tronnes.org,m:lumag@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,lechnology.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,tronnes.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid]
X-Rspamd-Action: no action



Am 01.03.26 um 05:30 schrieb David Lechner:
> Correctly set dbi->write_memory_bpw for the ST7586 driver. This driver
> is for a monochrome display that has an unusual data format, so the
> default value set in mipi_dbi_spi_init() is not correct simply because
> this controller is non-standard.
>
> Previously, we were using dbi->swap_bytes to make the same sort of
> workaround, but it was removed in the same commit that added
> dbi->write_memory_bpw, so we need to use the latter now to have the
> correct behavior.
>
> This fixes every 3 columns of pixels being swapped on the display. There
> are 3 pixels per byte, so the byte swap caused this effect.
>
> Fixes: df3fb27a74a4 ("drm/mipi-dbi: Make bits per word configurable for pixel transfers")
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/sitronix/st7586.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/sitronix/st7586.c b/drivers/gpu/drm/sitronix/st7586.c
> index b57ebf37a664..16b6b4e368af 100644
> --- a/drivers/gpu/drm/sitronix/st7586.c
> +++ b/drivers/gpu/drm/sitronix/st7586.c
> @@ -347,6 +347,12 @@ static int st7586_probe(struct spi_device *spi)
>   	if (ret)
>   		return ret;
>   
> +	/*
> +	 * Override value set by mipi_dbi_spi_init(). This driver is a bit
> +	 * non-standard, so best to set it explicitly here.
> +	 */
> +	dbi->write_memory_bpw = 8;
> +
>   	/* Cannot read from this controller via SPI */
>   	dbi->read_commands = NULL;
>   
> @@ -356,15 +362,6 @@ static int st7586_probe(struct spi_device *spi)
>   	if (ret)
>   		return ret;
>   
> -	/*
> -	 * we are using 8-bit data, so we are not actually swapping anything,
> -	 * but setting mipi->swap_bytes makes mipi_dbi_typec3_command() do the
> -	 * right thing and not use 16-bit transfers (which results in swapped
> -	 * bytes on little-endian systems and causes out of order data to be
> -	 * sent to the display).
> -	 */
> -	dbi->swap_bytes = true;
> -
>   	drm_mode_config_reset(drm);
>   
>   	ret = drm_dev_register(drm, 0);
>
> ---
> base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
> change-id: 20260228-drm-mipi-dbi-fix-st7586-byte-swap-f0d03c5f800c
>
> Best regards,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



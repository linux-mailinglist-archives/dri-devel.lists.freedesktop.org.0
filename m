Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AtAKBqVpWnXEAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:48:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D91DA107
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F199D10E4E4;
	Mon,  2 Mar 2026 13:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RGcDp//K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ak8gp2yw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RGcDp//K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ak8gp2yw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9756810E4E4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 13:48:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4D82A3F754;
 Mon,  2 Mar 2026 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772459285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/N3wFtUySN2LVJGj8z/oDsOLK5MHkmKhqtsN4t0gl8Y=;
 b=RGcDp//KAi67AJkTHEgfcTwsspcOv0fC4X5IJEtqdz1RgZ1FFM+vz6qnDX6yLISDGr37sH
 DwrzvZpeDW82aOnqjN+93Di/wm7coLC2ppI6FF2pJ/MdRsOE2jGzN0yODcp8TEI57eF03r
 0nKXRzSlhMXOf3M3kS0MX6oau2aLv9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772459285;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/N3wFtUySN2LVJGj8z/oDsOLK5MHkmKhqtsN4t0gl8Y=;
 b=Ak8gp2ywp2KqS7togkXVHpnLj68iBSeXgcN6fpOeVTK63gbTy7dx5MX9IqlvEcKW/NoZtc
 ZOBtNcnm+m1yjXDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772459285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/N3wFtUySN2LVJGj8z/oDsOLK5MHkmKhqtsN4t0gl8Y=;
 b=RGcDp//KAi67AJkTHEgfcTwsspcOv0fC4X5IJEtqdz1RgZ1FFM+vz6qnDX6yLISDGr37sH
 DwrzvZpeDW82aOnqjN+93Di/wm7coLC2ppI6FF2pJ/MdRsOE2jGzN0yODcp8TEI57eF03r
 0nKXRzSlhMXOf3M3kS0MX6oau2aLv9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772459285;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/N3wFtUySN2LVJGj8z/oDsOLK5MHkmKhqtsN4t0gl8Y=;
 b=Ak8gp2ywp2KqS7togkXVHpnLj68iBSeXgcN6fpOeVTK63gbTy7dx5MX9IqlvEcKW/NoZtc
 ZOBtNcnm+m1yjXDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ED4733EA69;
 Mon,  2 Mar 2026 13:48:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id z/RwOBSVpWmhDgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Mar 2026 13:48:04 +0000
Message-ID: <5cdb4e34-7964-4456-9311-eac8b3d37371@suse.de>
Date: Mon, 2 Mar 2026 14:48:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Open-code drm_simple_encoder_init()
To: Hardik Phalet <hardik.phalet@pm.me>
Cc: Hardik Phalet <hardik.phalet@gmail.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260227103515.413685-1-hardik.phalet@pm.me>
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
In-Reply-To: <20260227103515.413685-1-hardik.phalet@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,ffwll.ch,lists.freedesktop.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hardik.phalet@pm.me,m:hardik.phalet@gmail.com,m:airlied@redhat.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:hardikphalet@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,pm.me:email,suse.com:url]
X-Rspamd-Queue-Id: F15D91DA107
X-Rspamd-Action: no action

Hi

Am 27.02.26 um 11:35 schrieb Hardik Phalet:
> drm_simple_encoder_init() is a thin wrapper around drm_encoder_init()
> that only provides a minimal drm_encoder_funcs instance with
> .destroy = drm_encoder_cleanup.
>
> Inline the helper in virtgpu_display.c and provide a local
> drm_encoder_funcs instance instead. This removes the unnecessary
> indirection and prepares for the eventual removal of
> drm_simple_encoder_init().
>
> No functional changes intended.
>
> Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
> ---
>   drivers/gpu/drm/virtio/virtgpu_display.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
> index f1dae9569805..8bd6cdc6c16e 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -232,6 +232,10 @@ static enum drm_mode_status virtio_gpu_conn_mode_valid(struct drm_connector *con
>   	return MODE_BAD;
>   }
>   
> +static const struct drm_encoder_funcs virtio_gpu_enc_cleanup_funcs = {
> +	.destroy = drm_encoder_cleanup
> +};
> +
>   static const struct drm_encoder_helper_funcs virtio_gpu_enc_helper_funcs = {
>   	.mode_set   = virtio_gpu_enc_mode_set,
>   	.enable     = virtio_gpu_enc_enable,
> @@ -306,7 +310,8 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
>   	if (vgdev->has_edid)
>   		drm_connector_attach_edid_property(connector);
>   
> -	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
> +	drm_encoder_init(dev, encoder, &virtio_gpu_enc_cleanup_funcs,
> +			 DRM_MODE_ENCODER_VIRTUAL, NULL);

This looks correct, but you should also remove the include statement at [1]

[1] 
https://elixir.bootlin.com/linux/v6.19/source/drivers/gpu/drm/virtio/virtgpu_display.c#L35

Best regards
Thomas

>   	drm_encoder_helper_add(encoder, &virtio_gpu_enc_helper_funcs);
>   	encoder->possible_crtcs = 1 << index;
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



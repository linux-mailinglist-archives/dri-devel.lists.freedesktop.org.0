Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP2zHWivpWleEQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:40:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDE61DC017
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F1810E541;
	Mon,  2 Mar 2026 15:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BpNcQGZR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rcTAoUSj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BpNcQGZR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rcTAoUSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823BD10E533
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 15:40:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 19AB43F77E;
 Mon,  2 Mar 2026 15:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772466018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8chj8bMH0fOnBmf36td1ppz2Y6Xputk1ViWJaoigA5Q=;
 b=BpNcQGZRxrACmEzx6RcrnAS/Lt8ZudKtbLsrADXkpDIrDWWoUFkjLhj0WzpBXZuYZYnwP1
 39vptSELovsCXkGsU9TnLsdBDIVfaHIOCCF6KVrUO09ZW4C6WZrFDziwB2bnV7Y8RwpLJn
 CQH9uzvL/7yUyUKL+b/aOJ1ud1t2NSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772466018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8chj8bMH0fOnBmf36td1ppz2Y6Xputk1ViWJaoigA5Q=;
 b=rcTAoUSjJoos17MfZCSm4kL1uts/liWWdyuclYFCpg1rGrwxwTSKVMf3qZZL0ywZ4jGkGC
 PFNaV7uY7UNhB5Bg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BpNcQGZR;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rcTAoUSj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772466018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8chj8bMH0fOnBmf36td1ppz2Y6Xputk1ViWJaoigA5Q=;
 b=BpNcQGZRxrACmEzx6RcrnAS/Lt8ZudKtbLsrADXkpDIrDWWoUFkjLhj0WzpBXZuYZYnwP1
 39vptSELovsCXkGsU9TnLsdBDIVfaHIOCCF6KVrUO09ZW4C6WZrFDziwB2bnV7Y8RwpLJn
 CQH9uzvL/7yUyUKL+b/aOJ1ud1t2NSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772466018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8chj8bMH0fOnBmf36td1ppz2Y6Xputk1ViWJaoigA5Q=;
 b=rcTAoUSjJoos17MfZCSm4kL1uts/liWWdyuclYFCpg1rGrwxwTSKVMf3qZZL0ywZ4jGkGC
 PFNaV7uY7UNhB5Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A931D3EA69;
 Mon,  2 Mar 2026 15:40:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tv0HKGGvpWl1BwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Mar 2026 15:40:17 +0000
Message-ID: <83824dfb-dbde-4466-bb5d-3fb4348dca6e@suse.de>
Date: Mon, 2 Mar 2026 16:40:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Open-code drm_simple_encoder_init()
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Hardik Phalet <hardik.phalet@pm.me>
Cc: Hardik Phalet <hardik.phalet@gmail.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260227103515.413685-1-hardik.phalet@pm.me>
 <5cdb4e34-7964-4456-9311-eac8b3d37371@suse.de>
 <4fa6bc36-3507-4171-8955-29c90db9254b@collabora.com>
 <cf8cb929-2339-46a9-8b76-e76778787b9d@suse.de>
 <e008ca24-83ee-427e-b2a2-8f93e390b199@collabora.com>
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
In-Reply-To: <e008ca24-83ee-427e-b2a2-8f93e390b199@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
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
X-Rspamd-Queue-Id: AEDE61DC017
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
	FREEMAIL_CC(0.00)[gmail.com,redhat.com,chromium.org,linux.intel.com,kernel.org,ffwll.ch,lists.freedesktop.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.osipenko@collabora.com,m:hardik.phalet@pm.me,m:hardik.phalet@gmail.com,m:airlied@redhat.com,m:kraxel@redhat.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:hardikphalet@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,suse.de:dkim,suse.de:mid,bootlin.com:url,suse.com:url,pm.me:email]
X-Rspamd-Action: no action



Am 02.03.26 um 16:31 schrieb Dmitry Osipenko:
> On 3/2/26 17:15, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 02.03.26 um 14:57 schrieb Dmitry Osipenko:
>>> On 3/2/26 16:48, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 27.02.26 um 11:35 schrieb Hardik Phalet:
>>>>> drm_simple_encoder_init() is a thin wrapper around drm_encoder_init()
>>>>> that only provides a minimal drm_encoder_funcs instance with
>>>>> .destroy = drm_encoder_cleanup.
>>>>>
>>>>> Inline the helper in virtgpu_display.c and provide a local
>>>>> drm_encoder_funcs instance instead. This removes the unnecessary
>>>>> indirection and prepares for the eventual removal of
>>>>> drm_simple_encoder_init().
>>>>>
>>>>> No functional changes intended.
>>>>>
>>>>> Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
>>>>> ---
>>>>>     drivers/gpu/drm/virtio/virtgpu_display.c | 7 ++++++-
>>>>>     1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/
>>>>> drm/virtio/virtgpu_display.c
>>>>> index f1dae9569805..8bd6cdc6c16e 100644
>>>>> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
>>>>> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
>>>>> @@ -232,6 +232,10 @@ static enum drm_mode_status
>>>>> virtio_gpu_conn_mode_valid(struct drm_connector *con
>>>>>         return MODE_BAD;
>>>>>     }
>>>>>     +static const struct drm_encoder_funcs
>>>>> virtio_gpu_enc_cleanup_funcs = {
>>>>> +    .destroy = drm_encoder_cleanup
>>>>> +};
>>>>> +
>>>>>     static const struct drm_encoder_helper_funcs
>>>>> virtio_gpu_enc_helper_funcs = {
>>>>>         .mode_set   = virtio_gpu_enc_mode_set,
>>>>>         .enable     = virtio_gpu_enc_enable,
>>>>> @@ -306,7 +310,8 @@ static int vgdev_output_init(struct
>>>>> virtio_gpu_device *vgdev, int index)
>>>>>         if (vgdev->has_edid)
>>>>>             drm_connector_attach_edid_property(connector);
>>>>>     -    drm_simple_encoder_init(dev, encoder,
>>>>> DRM_MODE_ENCODER_VIRTUAL);
>>>>> +    drm_encoder_init(dev, encoder, &virtio_gpu_enc_cleanup_funcs,
>>>>> +             DRM_MODE_ENCODER_VIRTUAL, NULL);
>>>> This looks correct, but you should also remove the include statement
>>>> at [1]
>>>>
>>>> [1] https://elixir.bootlin.com/linux/v6.19/source/drivers/gpu/drm/
>>>> virtio/virtgpu_display.c#L35
>>> The patch adds more lines than removes. What's wrong with
>>> drm_simple_encoder_init() and why it needs to be removed eventually?
>> I added it myself a few years ago in an attempt to save some lines of
>> code. That was a mistake. It's a helper without any purpose. Helpers
>> should do something.
> It saves few lines and makes code easier to read. Don't see value in
> removal of the helper.

All it does is to set a default cleanup function. But that's not even 
clear from the helper's name.

If we really want a default cleanup, we should call 
drm_encoder_cleanup() as a default at [1]. Drivers could then just leave 
out the encoder funcs entirely.

[1] 
https://elixir.bootlin.com/linux/v6.19/source/drivers/gpu/drm/drm_mode_config.c#L530

Best regards
Thomas

>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



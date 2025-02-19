Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C9BA3BACB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 10:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A36910E271;
	Wed, 19 Feb 2025 09:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="EciNQtMQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VXx/4wy4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EciNQtMQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VXx/4wy4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B597510E271
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 09:49:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5460F21176;
 Wed, 19 Feb 2025 09:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739958578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cS9epS7evsUYDH97zcJKsfxUiDtQ6N8sItfOFs2DspQ=;
 b=EciNQtMQ3vKGDFt2NcqGdvODxYiZWZjbuCDX/pXXSudYLkfVSwrIPpZSe0OarGsYxfsUPQ
 DV67pHK6MEtgzRu5Lcjvov46Q/OcUjSFpqZp9Fb5vOUmYnpBHoTlaiAhFCv5KRrmO7hyRh
 rsvV9VQUxgcqdlVghyPKNtJtI50Msxs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739958578;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cS9epS7evsUYDH97zcJKsfxUiDtQ6N8sItfOFs2DspQ=;
 b=VXx/4wy4RVd3BeX2qG71wh9VagBfe8bTuugRpYXy7hYNrJIy51urC4oZosPxxmmWaRSth1
 7jN9F7Hx5NyDNICg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EciNQtMQ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="VXx/4wy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739958578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cS9epS7evsUYDH97zcJKsfxUiDtQ6N8sItfOFs2DspQ=;
 b=EciNQtMQ3vKGDFt2NcqGdvODxYiZWZjbuCDX/pXXSudYLkfVSwrIPpZSe0OarGsYxfsUPQ
 DV67pHK6MEtgzRu5Lcjvov46Q/OcUjSFpqZp9Fb5vOUmYnpBHoTlaiAhFCv5KRrmO7hyRh
 rsvV9VQUxgcqdlVghyPKNtJtI50Msxs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739958578;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cS9epS7evsUYDH97zcJKsfxUiDtQ6N8sItfOFs2DspQ=;
 b=VXx/4wy4RVd3BeX2qG71wh9VagBfe8bTuugRpYXy7hYNrJIy51urC4oZosPxxmmWaRSth1
 7jN9F7Hx5NyDNICg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 146F413715;
 Wed, 19 Feb 2025 09:49:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id izaoAzKptWepOgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Feb 2025 09:49:38 +0000
Message-ID: <81731c1c-b74d-4b60-8c01-cda9a92d9c1b@suse.de>
Date: Wed, 19 Feb 2025 10:49:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
To: Aditya Garg <gargaditya08@live.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <4BAFD886-84E0-4C4C-94B3-90BF911ED0E7@live.com>
 <F16BB9EB-632C-4BC4-A8BA-492BF32E43C1@live.com>
 <d9304ed0-911b-4877-a15c-981b3335bbf9@suse.de>
 <8051F1F7-C1B0-428E-BE12-353C242EA650@live.com>
 <a88a6e48-8c55-410b-b553-8942dac3608a@suse.de>
 <858CA9AF-6128-4974-9C98-9EC01FF4FDB1@live.com>
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
In-Reply-To: <858CA9AF-6128-4974-9C98-9EC01FF4FDB1@live.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5460F21176
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[live.com]; MIME_TRACE(0.00)[0:+];
 TO_DN_EQ_ADDR_SOME(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
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

Am 19.02.25 um 10:37 schrieb Aditya Garg:
> Hi
>
>>> I’ve tried these changes, seem to be breaking the driver:
>>>
>>> —>8—
>>>  From 16c920cabf65ec664663ebe1611c0ccf6e81de4a Mon Sep 17 00:00:00 2001
>>> From: Aditya Garg <gargaditya08@live.com>
>>> Date: Tue, 18 Feb 2025 18:54:10 +0530
>>> Subject: [PATCH] better error handling
>>>
>>> ---
>>>   .../apple-touchbar-advanced-0.1/appletbdrm.c  | 68 +++++++++++++------
>>>   1 file changed, 46 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/usr/src/apple-touchbar-advanced-0.1/appletbdrm.c b/usr/src/apple-touchbar-advanced-0.1/appletbdrm.c
>>> index f2d9113..cb13b36 100644
>>> --- a/usr/src/apple-touchbar-advanced-0.1/appletbdrm.c
>>> +++ b/usr/src/apple-touchbar-advanced-0.1/appletbdrm.c
>>> @@ -133,6 +133,17 @@ struct appletbdrm_device {
>>>    struct drm_encoder encoder;
>>>   };
>>>   +struct appletbdrm_plane_state {
>>> + struct drm_shadow_plane_state base;
>>> + u8 *request_buffer;
>>> + u8 *response_buffer;
>>> +};
>>> +
>>> +static inline struct appletbdrm_plane_state *to_appletbdrm_plane_state(struct drm_plane_state *state)
>>> +{
>>> + return container_of(state, struct appletbdrm_plane_state, base.base);
>>> +}
>>> +
>>>   static int appletbdrm_send_request(struct appletbdrm_device *adev,
>>>      struct appletbdrm_msg_request_header *request, size_t size)
>>>   {
>>> @@ -311,24 +322,6 @@ static int appletbdrm_flush_damage(struct appletbdrm_device *adev,
>>>    if (!frames_size)
>>>    return 0;
>>>   - request_size = ALIGN(sizeof(*request) + frames_size + sizeof(*footer), 16);
>>> -
>>> - request = kzalloc(request_size, GFP_KERNEL);
>>> - if (!request)
>>> - return -ENOMEM;
>>> -
>>> - response = kzalloc(sizeof(*response), GFP_KERNEL);
>>> - if (!response) {
>>> - ret = -ENOMEM;
>>> - goto free_request;
>>> - }
>>> -
>>> - ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>>> - if (ret) {
>>> - drm_err(drm, "Failed to start CPU framebuffer access (%d)\n", ret);
>>> - goto free_response;
>>> - }
>>> -
>>>    request->header.unk_00 = cpu_to_le16(2);
>>>    request->header.unk_02 = cpu_to_le16(0x12);
>>>    request->header.unk_04 = cpu_to_le32(9);
>>> @@ -389,10 +382,6 @@ static int appletbdrm_flush_damage(struct appletbdrm_device *adev,
>>>     end_fb_cpu_access:
>>>    drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>>> -free_response:
>>> - kfree(response);
>>> -free_request:
>>> - kfree(request);
>>>      return ret;
>>>   }
>>> @@ -415,6 +404,15 @@ static int appletbdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
>>>    struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>>>    struct drm_crtc *new_crtc = new_plane_state->crtc;
>>>    struct drm_crtc_state *new_crtc_state = NULL;
>>> + struct appletbdrm_plane_state *appletbdrm_state = to_appletbdrm_plane_state(new_plane_state);
>>> + struct drm_device *drm = plane->dev;
>>> + struct drm_plane_state *plane_state = plane->state;
>>> + struct appletbdrm_fb_request_response *response;
>>> + struct appletbdrm_fb_request_footer *footer;
>>> + struct drm_framebuffer *fb = plane_state->fb;
>>> + struct appletbdrm_fb_request *request;
>>> + size_t frames_size = 0;
>>> + size_t request_size;
>>>    int ret;
>>>      if (new_crtc)
>>> @@ -429,6 +427,22 @@ static int appletbdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
>>>    else if (!new_plane_state->visible)
>>>    return 0;
>>>   + request_size = ALIGN(sizeof(*request) + frames_size + sizeof(*footer), 16);
>>> +
>>> + appletbdrm_state->request_buffer = kzalloc(request_size, GFP_KERNEL);
>>> + if (!request)
>>> + return -ENOMEM;
>>> +
>>> + appletbdrm_state->response_buffer = kzalloc(sizeof(*response), GFP_KERNEL);
>>> + if (!response) {
>>> + ret = -ENOMEM;
>>> + }
>>> +
>>> + ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>>> + if (ret) {
>>> + drm_err(drm, "Failed to start CPU framebuffer access (%d)\n", ret);
>>> + }
>>> +
>>>    return 0;
>>>   }
>>>   @@ -464,6 +478,15 @@ static void appletbdrm_primary_plane_helper_atomic_disable(struct drm_plane *pla
>>>    drm_dev_exit(idx);
>>>   }
>>>   +static void appletbdrm_primary_plane_destroy_state(struct drm_plane *plane,
>>> + struct drm_plane_state *state)
>>> +{
>>> + struct appletbdrm_plane_state *appletbdrm_state = to_appletbdrm_plane_state(state);
>>> +
>>> + kfree(appletbdrm_state->request_buffer);
>>> + kfree(appletbdrm_state->response_buffer);
>>> +}
>>> +
>>>   static const struct drm_plane_helper_funcs appletbdrm_primary_plane_helper_funcs = {
>>>    DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>>>    .atomic_check = appletbdrm_primary_plane_helper_atomic_check,
>>> @@ -474,6 +497,7 @@ static const struct drm_plane_helper_funcs appletbdrm_primary_plane_helper_funcs
>>>   static const struct drm_plane_funcs appletbdrm_primary_plane_funcs = {
>>>    .update_plane = drm_atomic_helper_update_plane,
>>>    .disable_plane = drm_atomic_helper_disable_plane,
>>> + .atomic_destroy_state = appletbdrm_primary_plane_destroy_state,
>>>    .destroy = drm_plane_cleanup,
>>>    DRM_GEM_SHADOW_PLANE_FUNCS,
>> You don't allocate struct appletbdrm_plane_state. Instead of this macro, you also have to set your own helpers for the plane's .reset and .atomic_duplicate_state There's again example code in the ssd130x driver.
> Any attempt make to allocate request and response outside appletdrm_flush_damage seems to be breaking the driver.
>
> If I understand correctly, you want me to allocate them outside appletdrm_flush_damage, in appletbdrm_primary_plane_helper_atomic_check, return -ENOMEM if they fail. After that add kfree(return) and kfree(response) in appletbdrm_primary_plane_destroy_state.
>
> The ssd130x driver example isn’t really helping me. Could you please help me out here?

What's the exact error message?

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


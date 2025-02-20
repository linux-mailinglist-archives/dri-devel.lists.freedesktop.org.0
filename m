Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A582A3D658
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705B310E911;
	Thu, 20 Feb 2025 10:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="J1F0skuw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zuyeecd2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J1F0skuw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zuyeecd2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6C910E4C0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:20:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 86CFD1F387;
 Thu, 20 Feb 2025 10:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740046812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YJS7UOtIBl1pHD+OUTi+jkVlUtd8J9x4ApZrqS5758c=;
 b=J1F0skuwSmKfusl0mp+2dffutS0358Tdmd+E3IdHT1Y8vsPUp/b0lkzfkjeAq5xbPcNTBl
 oZ75H0liO59pMAj3oIB8oZ2nI/iuUtlLFlqdXE7MDoQm+O2K4W1kXqI/SfVTyVdS+H1sxV
 xe16ZW9TltcL4kzG30FjG0APS8bsx1U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740046812;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YJS7UOtIBl1pHD+OUTi+jkVlUtd8J9x4ApZrqS5758c=;
 b=zuyeecd2Yupm1kxDbGaaSdbbRhOloZR/AWcy5jY3zxcOh3QNhCOFCHgHWsVWbXf8oCvgTl
 VpvZmDIhGdXRG6AQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=J1F0skuw;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zuyeecd2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740046812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YJS7UOtIBl1pHD+OUTi+jkVlUtd8J9x4ApZrqS5758c=;
 b=J1F0skuwSmKfusl0mp+2dffutS0358Tdmd+E3IdHT1Y8vsPUp/b0lkzfkjeAq5xbPcNTBl
 oZ75H0liO59pMAj3oIB8oZ2nI/iuUtlLFlqdXE7MDoQm+O2K4W1kXqI/SfVTyVdS+H1sxV
 xe16ZW9TltcL4kzG30FjG0APS8bsx1U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740046812;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YJS7UOtIBl1pHD+OUTi+jkVlUtd8J9x4ApZrqS5758c=;
 b=zuyeecd2Yupm1kxDbGaaSdbbRhOloZR/AWcy5jY3zxcOh3QNhCOFCHgHWsVWbXf8oCvgTl
 VpvZmDIhGdXRG6AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 41B7E13301;
 Thu, 20 Feb 2025 10:20:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YrTXDtwBt2d2BwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Feb 2025 10:20:12 +0000
Message-ID: <95bcb1d4-c8dd-4a30-a496-e7e54717f124@suse.de>
Date: Thu, 20 Feb 2025 11:20:11 +0100
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
References: <81731c1c-b74d-4b60-8c01-cda9a92d9c1b@suse.de>
 <9E4CE61A-1FA3-4409-B402-6C51D453B085@live.com>
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
In-Reply-To: <9E4CE61A-1FA3-4409-B402-6C51D453B085@live.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 86CFD1F387
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com];
 RCVD_TLS_ALL(0.00)[]; TO_DN_EQ_ADDR_SOME(0.00)[];
 TO_DN_SOME(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_TO(0.00)[live.com];
 MID_RHS_MATCH_FROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
 RCPT_COUNT_SEVEN(0.00)[9]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

Hi,

to be honest: you are just throwing patches and errors at me and want me 
to fix your driver for you. If you want to maintain a kernel driver, you 
need to be able to debug at least such basic problems. I suggest you 
start to debug these issues by yourself and try to find their causes. 
(printk() will be helpful.)

Best regards
Thomas

Am 19.02.25 um 11:19 schrieb Aditya Garg:
> Hi
>
>> On 19 Feb 2025, at 3:19 PM, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>
>> ﻿Hi
>>
>> Am 19.02.25 um 10:37 schrieb Aditya Garg:
>>> Hi
>>>
>>>>> I’ve tried these changes, seem to be breaking the driver:
>>>>>
>>>>> —>8—
>>>>>  From 16c920cabf65ec664663ebe1611c0ccf6e81de4a Mon Sep 17 00:00:00 2001
>>>>> From: Aditya Garg <gargaditya08@live.com>
>>>>> Date: Tue, 18 Feb 2025 18:54:10 +0530
>>>>> Subject: [PATCH] better error handling
>>>>>
>>>>> ---
>>>>>   .../apple-touchbar-advanced-0.1/appletbdrm.c  | 68 +++++++++++++------
>>>>>   1 file changed, 46 insertions(+), 22 deletions(-)
>>>>>
>>>>> diff --git a/usr/src/apple-touchbar-advanced-0.1/appletbdrm.c b/usr/src/apple-touchbar-advanced-0.1/appletbdrm.c
>>>>> index f2d9113..cb13b36 100644
>>>>> --- a/usr/src/apple-touchbar-advanced-0.1/appletbdrm.c
>>>>> +++ b/usr/src/apple-touchbar-advanced-0.1/appletbdrm.c
>>>>> @@ -133,6 +133,17 @@ struct appletbdrm_device {
>>>>>    struct drm_encoder encoder;
>>>>>   };
>>>>>   +struct appletbdrm_plane_state {
>>>>> + struct drm_shadow_plane_state base;
>>>>> + u8 *request_buffer;
>>>>> + u8 *response_buffer;
>>>>> +};
>>>>> +
>>>>> +static inline struct appletbdrm_plane_state *to_appletbdrm_plane_state(struct drm_plane_state *state)
>>>>> +{
>>>>> + return container_of(state, struct appletbdrm_plane_state, base.base);
>>>>> +}
>>>>> +
>>>>>   static int appletbdrm_send_request(struct appletbdrm_device *adev,
>>>>>      struct appletbdrm_msg_request_header *request, size_t size)
>>>>>   {
>>>>> @@ -311,24 +322,6 @@ static int appletbdrm_flush_damage(struct appletbdrm_device *adev,
>>>>>    if (!frames_size)
>>>>>    return 0;
>>>>>   - request_size = ALIGN(sizeof(*request) + frames_size + sizeof(*footer), 16);
>>>>> -
>>>>> - request = kzalloc(request_size, GFP_KERNEL);
>>>>> - if (!request)
>>>>> - return -ENOMEM;
>>>>> -
>>>>> - response = kzalloc(sizeof(*response), GFP_KERNEL);
>>>>> - if (!response) {
>>>>> - ret = -ENOMEM;
>>>>> - goto free_request;
>>>>> - }
>>>>> -
>>>>> - ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>>>>> - if (ret) {
>>>>> - drm_err(drm, "Failed to start CPU framebuffer access (%d)\n", ret);
>>>>> - goto free_response;
>>>>> - }
>>>>> -
>>>>>    request->header.unk_00 = cpu_to_le16(2);
>>>>>    request->header.unk_02 = cpu_to_le16(0x12);
>>>>>    request->header.unk_04 = cpu_to_le32(9);
>>>>> @@ -389,10 +382,6 @@ static int appletbdrm_flush_damage(struct appletbdrm_device *adev,
>>>>>     end_fb_cpu_access:
>>>>>    drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>>>>> -free_response:
>>>>> - kfree(response);
>>>>> -free_request:
>>>>> - kfree(request);
>>>>>      return ret;
>>>>>   }
>>>>> @@ -415,6 +404,15 @@ static int appletbdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
>>>>>    struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>>>>>    struct drm_crtc *new_crtc = new_plane_state->crtc;
>>>>>    struct drm_crtc_state *new_crtc_state = NULL;
>>>>> + struct appletbdrm_plane_state *appletbdrm_state = to_appletbdrm_plane_state(new_plane_state);
>>>>> + struct drm_device *drm = plane->dev;
>>>>> + struct drm_plane_state *plane_state = plane->state;
>>>>> + struct appletbdrm_fb_request_response *response;
>>>>> + struct appletbdrm_fb_request_footer *footer;
>>>>> + struct drm_framebuffer *fb = plane_state->fb;
>>>>> + struct appletbdrm_fb_request *request;
>>>>> + size_t frames_size = 0;
>>>>> + size_t request_size;
>>>>>    int ret;
>>>>>      if (new_crtc)
>>>>> @@ -429,6 +427,22 @@ static int appletbdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
>>>>>    else if (!new_plane_state->visible)
>>>>>    return 0;
>>>>>   + request_size = ALIGN(sizeof(*request) + frames_size + sizeof(*footer), 16);
>>>>> +
>>>>> + appletbdrm_state->request_buffer = kzalloc(request_size, GFP_KERNEL);
>>>>> + if (!request)
>>>>> + return -ENOMEM;
>>>>> +
>>>>> + appletbdrm_state->response_buffer = kzalloc(sizeof(*response), GFP_KERNEL);
>>>>> + if (!response) {
>>>>> + ret = -ENOMEM;
>>>>> + }
>>>>> +
>>>>> + ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>>>>> + if (ret) {
>>>>> + drm_err(drm, "Failed to start CPU framebuffer access (%d)\n", ret);
>>>>> + }
>>>>> +
>>>>>    return 0;
>>>>>   }
>>>>>   @@ -464,6 +478,15 @@ static void appletbdrm_primary_plane_helper_atomic_disable(struct drm_plane *pla
>>>>>    drm_dev_exit(idx);
>>>>>   }
>>>>>   +static void appletbdrm_primary_plane_destroy_state(struct drm_plane *plane,
>>>>> + struct drm_plane_state *state)
>>>>> +{
>>>>> + struct appletbdrm_plane_state *appletbdrm_state = to_appletbdrm_plane_state(state);
>>>>> +
>>>>> + kfree(appletbdrm_state->request_buffer);
>>>>> + kfree(appletbdrm_state->response_buffer);
>>>>> +}
>>>>> +
>>>>>   static const struct drm_plane_helper_funcs appletbdrm_primary_plane_helper_funcs = {
>>>>>    DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>>>>>    .atomic_check = appletbdrm_primary_plane_helper_atomic_check,
>>>>> @@ -474,6 +497,7 @@ static const struct drm_plane_helper_funcs appletbdrm_primary_plane_helper_funcs
>>>>>   static const struct drm_plane_funcs appletbdrm_primary_plane_funcs = {
>>>>>    .update_plane = drm_atomic_helper_update_plane,
>>>>>    .disable_plane = drm_atomic_helper_disable_plane,
>>>>> + .atomic_destroy_state = appletbdrm_primary_plane_destroy_state,
>>>>>    .destroy = drm_plane_cleanup,
>>>>>    DRM_GEM_SHADOW_PLANE_FUNCS,
>>>> You don't allocate struct appletbdrm_plane_state. Instead of this macro, you also have to set your own helpers for the plane's .reset and .atomic_duplicate_state There's again example code in the ssd130x driver.
>>> Any attempt make to allocate request and response outside appletdrm_flush_damage seems to be breaking the driver.
>>>
>>> If I understand correctly, you want me to allocate them outside appletdrm_flush_damage, in appletbdrm_primary_plane_helper_atomic_check, return -ENOMEM if they fail. After that add kfree(return) and kfree(response) in appletbdrm_primary_plane_destroy_state.
>>>
>>> The ssd130x driver example isn’t really helping me. Could you please help me out here?
>> What's the exact error message?
> I'm not getting any error message. Modprobing the compiled driver simply gets stuck, or shows killed.
>
> For the patch I sent yesterday, I got this in journalctl:
>
> Feb 18 18:36:33 MacBook kernel: Call Trace:
> Feb 18 18:36:33 MacBook kernel:  <TASK>
> Feb 18 18:36:33 MacBook kernel:  ? show_regs+0x6c/0x80
> Feb 18 18:36:33 MacBook kernel:  ? __die+0x24/0x80
> Feb 18 18:36:33 MacBook kernel:  ? page_fault_oops+0x175/0x5c0
> Feb 18 18:36:33 MacBook kernel:  ? do_user_addr_fault+0x4b2/0x870
> Feb 18 18:36:33 MacBook kernel:  ? exc_page_fault+0x85/0x1c0
> Feb 18 18:36:33 MacBook kernel:  ? asm_exc_page_fault+0x27/0x30
> Feb 18 18:36:33 MacBook kernel:  ? drm_gem_fb_begin_cpu_access+0x5/0xc0
> Feb 18 18:36:33 MacBook kernel:  ? appletbdrm_primary_plane_helper_atomic_check+0x158/0x1b0 [appletbdrm]
> Feb 18 18:36:33 MacBook kernel:  drm_atomic_helper_check_planes+0xf6/0x250
> Feb 18 18:36:33 MacBook kernel:  drm_atomic_helper_check+0x51/0xa0
> Feb 18 18:36:33 MacBook kernel:  drm_atomic_check_only+0x688/0xb00
> Feb 18 18:36:33 MacBook kernel:  drm_atomic_commit+0x6f/0xf0
> Feb 18 18:36:33 MacBook kernel:  ? __pfx___drm_printfn_info+0x10/0x10
> Feb 18 18:36:33 MacBook kernel:  drm_mode_atomic_ioctl+0xc01/0xe60
> Feb 18 18:36:33 MacBook kernel:  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> Feb 18 18:36:33 MacBook kernel:  drm_ioctl_kernel+0xb6/0x120
> Feb 18 18:36:33 MacBook kernel:  drm_ioctl+0x2f3/0x5b0
> Feb 18 18:36:33 MacBook kernel:  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> Feb 18 18:36:33 MacBook kernel:  __x64_sys_ioctl+0xa4/0xe0
> Feb 18 18:36:33 MacBook kernel:  x64_sys_call+0x131e/0x2650
> Feb 18 18:36:33 MacBook kernel:  do_syscall_64+0x7e/0x170
> Feb 18 18:36:33 MacBook kernel:  ? arch_exit_to_user_mode_prepare.isra.0+0x22/0xd0
> Feb 18 18:36:33 MacBook kernel:  ? syscall_exit_to_user_mode+0x38/0x1d0
> Feb 18 18:36:33 MacBook kernel:  ? do_syscall_64+0x8a/0x170
> Feb 18 18:36:33 MacBook kernel:  ? arch_exit_to_user_mode_prepare.isra.0+0x22/0xd0
> Feb 18 18:36:33 MacBook kernel:  ? syscall_exit_to_user_mode+0x38/0x1d0
> Feb 18 18:36:33 MacBook kernel:  ? do_syscall_64+0x8a/0x170
> Feb 18 18:36:33 MacBook kernel:  ? arch_exit_to_user_mode_prepare.isra.0+0x22/0xd0
> Feb 18 18:36:33 MacBook kernel:  ? syscall_exit_to_user_mode+0x38/0x1d0
> Feb 18 18:36:33 MacBook kernel:  ? do_syscall_64+0x8a/0x170
> Feb 18 18:36:33 MacBook kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> Feb 18 18:36:33 MacBook kernel: RIP: 0033:0x5e684e58801b
> Feb 18 18:36:33 MacBook kernel: Code: ff ff ff 4c 89 f7 e8 44 d0 f4 ff ff 15 1e a6 48 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 89 ff 89 f6 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 9d c1 48 85 c0 0f 98 c2 20 ca 89 c1 c1 e1 10
> Feb 18 18:36:33 MacBook kernel: RSP: 002b:00007fff91689798 EFLAGS: 00000206 ORIG_RAX: 0000000000000010
> Feb 18 18:36:33 MacBook kernel: RAX: ffffffffffffffda RBX: 00007fff91689850 RCX: 00005e684e58801b
> Feb 18 18:36:33 MacBook kernel: RDX: 00007fff916897a0 RSI: 00000000c03864bc RDI: 0000000000000004
> Feb 18 18:36:33 MacBook kernel: RBP: 00005e68545f9570 R08: 00005e68545f9590 R09: 00005e68545f9750
> Feb 18 18:36:33 MacBook kernel: R10: 00005e68545eb560 R11: 0000000000000206 R12: 00005e68545f9750
> Feb 18 18:36:33 MacBook kernel: R13: 00005e68545f9590 R14: 00005e68545f97a0 R15: 0000000000000001
> Feb 18 18:36:33 MacBook kernel:  </TASK>
>
> Btw, the *working* source code with changes approved by you is available over here:
>
> https://github.com/AdityaGarg8/apple-touchbar-drv/blob/dfr/usr/src/apple-touchbar-advanced-0.1/appletbdrm.c
>
>
>> Best regards
>> Thomas
>>
>>
>> -- 
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


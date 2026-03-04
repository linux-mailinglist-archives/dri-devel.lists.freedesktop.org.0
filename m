Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCSeM49UqGnUtAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 16:49:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 756ED203459
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 16:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158AB10EA36;
	Wed,  4 Mar 2026 15:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="WnNpGdV+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3JzdDpdA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WnNpGdV+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3JzdDpdA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C7A10EA36
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 15:49:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 137B73F974;
 Wed,  4 Mar 2026 15:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772639370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xCXzVXRNiQUEv2rL+BPMuBd1c7Pw9X/gCQi73Ayv7iA=;
 b=WnNpGdV+lx09lgr9ZcU+eX/7mMKvqZQ62cKe3pg+VHyr57UKMejgeqgIWxHQbdQy94YZ+3
 43eAPp4bOpvOMsBFybkeZIx5Ylfm+0/K9Ed1oenw0FlxAZOaWySpkco2PjtHtC+FYl6g9B
 hOGVncb4pHqEEsypFEJp/qEQ9dy8yKY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772639370;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xCXzVXRNiQUEv2rL+BPMuBd1c7Pw9X/gCQi73Ayv7iA=;
 b=3JzdDpdArHYQvGbvnYqcwiUUvVW/JE11WJMXSIZ6CJNocL47gndqHQQl+lWJzdrKvOTWee
 Ahn7dDys/7UvkaDA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WnNpGdV+;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3JzdDpdA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772639370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xCXzVXRNiQUEv2rL+BPMuBd1c7Pw9X/gCQi73Ayv7iA=;
 b=WnNpGdV+lx09lgr9ZcU+eX/7mMKvqZQ62cKe3pg+VHyr57UKMejgeqgIWxHQbdQy94YZ+3
 43eAPp4bOpvOMsBFybkeZIx5Ylfm+0/K9Ed1oenw0FlxAZOaWySpkco2PjtHtC+FYl6g9B
 hOGVncb4pHqEEsypFEJp/qEQ9dy8yKY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772639370;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xCXzVXRNiQUEv2rL+BPMuBd1c7Pw9X/gCQi73Ayv7iA=;
 b=3JzdDpdArHYQvGbvnYqcwiUUvVW/JE11WJMXSIZ6CJNocL47gndqHQQl+lWJzdrKvOTWee
 Ahn7dDys/7UvkaDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D21053EA69;
 Wed,  4 Mar 2026 15:49:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qpnZMYlUqGkKaQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Mar 2026 15:49:29 +0000
Message-ID: <2e3fd9d3-71de-4900-93af-2120af27d051@suse.de>
Date: Wed, 4 Mar 2026 16:49:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/radeon: Test for fbdev GEM object with generic
 helper
To: Alex Deucher <alexdeucher@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260304130250.59008-1-tzimmermann@suse.de>
 <20260304130250.59008-3-tzimmermann@suse.de>
 <CADnq5_NyHuvQfggvZ2aUJ4uv_3HAwKTA5fYWxQej1=QtF7PJBQ@mail.gmail.com>
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
In-Reply-To: <CADnq5_NyHuvQfggvZ2aUJ4uv_3HAwKTA5fYWxQej1=QtF7PJBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
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
X-Rspamd-Queue-Id: 756ED203459
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,suse.com:url,amd.com:email]
X-Rspamd-Action: no action

Hi

Am 04.03.26 um 16:32 schrieb Alex Deucher:
> On Wed, Mar 4, 2026 at 8:03 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Replace radeon's test for the fbdev GEM object with a call to the
>> generic helper.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Series is:
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Thanks

>
> Did you want me to pick these up or did you want to land them in drm-misc?

Please add it to your tree.

Best regards
Thomas

>
> Alex
>
>> ---
>>   drivers/gpu/drm/radeon/radeon_device.c |  7 ++++---
>>   drivers/gpu/drm/radeon/radeon_fbdev.c  | 17 -----------------
>>   drivers/gpu/drm/radeon/radeon_mode.h   |  5 -----
>>   3 files changed, 4 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
>> index 5d523d5dae88..705c012fcf9e 100644
>> --- a/drivers/gpu/drm/radeon/radeon_device.c
>> +++ b/drivers/gpu/drm/radeon/radeon_device.c
>> @@ -37,6 +37,7 @@
>>   #include <drm/drm_client_event.h>
>>   #include <drm/drm_crtc_helper.h>
>>   #include <drm/drm_device.h>
>> +#include <drm/drm_fb_helper.h>
>>   #include <drm/drm_file.h>
>>   #include <drm/drm_framebuffer.h>
>>   #include <drm/drm_probe_helper.h>
>> @@ -1574,7 +1575,6 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
>>          list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
>>                  struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
>>                  struct drm_framebuffer *fb = crtc->primary->fb;
>> -               struct radeon_bo *robj;
>>
>>                  if (radeon_crtc->cursor_bo) {
>>                          struct radeon_bo *robj = gem_to_radeon_bo(radeon_crtc->cursor_bo);
>> @@ -1588,9 +1588,10 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
>>                  if (fb == NULL || fb->obj[0] == NULL) {
>>                          continue;
>>                  }
>> -               robj = gem_to_radeon_bo(fb->obj[0]);
>>                  /* don't unpin kernel fb objects */
>> -               if (!radeon_fbdev_robj_is_fb(rdev, robj)) {
>> +               if (!drm_fb_helper_gem_is_fb(dev->fb_helper, fb->obj[0])) {
>> +                       struct radeon_bo *robj = gem_to_radeon_bo(fb->obj[0]);
>> +
>>                          r = radeon_bo_reserve(robj, false);
>>                          if (r == 0) {
>>                                  radeon_bo_unpin(robj);
>> diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
>> index 18d61f3f7344..3e243f5e2f44 100644
>> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
>> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
>> @@ -274,20 +274,3 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>>          radeon_fbdev_destroy_pinned_object(gobj);
>>          return ret;
>>   }
>> -
>> -bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
>> -{
>> -       struct drm_fb_helper *fb_helper = rdev_to_drm(rdev)->fb_helper;
>> -       struct drm_gem_object *gobj;
>> -
>> -       if (!fb_helper)
>> -               return false;
>> -
>> -       gobj = drm_gem_fb_get_obj(fb_helper->fb, 0);
>> -       if (!gobj)
>> -               return false;
>> -       if (gobj != &robj->tbo.base)
>> -               return false;
>> -
>> -       return true;
>> -}
>> diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
>> index 088af85902f7..ae1ecdc2e189 100644
>> --- a/drivers/gpu/drm/radeon/radeon_mode.h
>> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
>> @@ -936,14 +936,9 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>>                                      struct drm_fb_helper_surface_size *sizes);
>>   #define RADEON_FBDEV_DRIVER_OPS \
>>          .fbdev_probe = radeon_fbdev_driver_fbdev_probe
>> -bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj);
>>   #else
>>   #define RADEON_FBDEV_DRIVER_OPS \
>>          .fbdev_probe = NULL
>> -static inline bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
>> -{
>> -       return false;
>> -}
>>   #endif
>>
>>   void radeon_crtc_handle_vblank(struct radeon_device *rdev, int crtc_id);
>> --
>> 2.53.0
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



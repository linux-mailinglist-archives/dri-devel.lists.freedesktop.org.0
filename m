Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B68E8AE785
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 15:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E961122CB;
	Tue, 23 Apr 2024 13:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Tl+I5wFb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dn9tVnTw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tl+I5wFb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dn9tVnTw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D9C10FB38;
 Tue, 23 Apr 2024 13:09:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 10E2837FA5;
 Tue, 23 Apr 2024 13:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713877775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fpIprDN6eGSy7cTEPwpHpMhu88OeXdeca3a1xTyakMQ=;
 b=Tl+I5wFbIc12kdvEkw+UW22IOYNxSyIQF+HAn/NbyRPbyn45DJERyixWXkGOW0oUQ1r5D/
 dvZf2j15q004H/hm3THny1Hu1/pgXT3bTVd9wmKktuS2sbQEgCD0hRdrn+S/ZoYG/ZIqvc
 2bI6ral9p82JdY/9Sb65wlIwZeZ99Vk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713877775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fpIprDN6eGSy7cTEPwpHpMhu88OeXdeca3a1xTyakMQ=;
 b=dn9tVnTwgk1bJGnN2jremo8FrHrL/cnSxed39tsUaPo1T+KpL3z0ymdu0ihc2rCcwgus0r
 S6Uon7wUF+ZS/5Bg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Tl+I5wFb;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dn9tVnTw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713877775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fpIprDN6eGSy7cTEPwpHpMhu88OeXdeca3a1xTyakMQ=;
 b=Tl+I5wFbIc12kdvEkw+UW22IOYNxSyIQF+HAn/NbyRPbyn45DJERyixWXkGOW0oUQ1r5D/
 dvZf2j15q004H/hm3THny1Hu1/pgXT3bTVd9wmKktuS2sbQEgCD0hRdrn+S/ZoYG/ZIqvc
 2bI6ral9p82JdY/9Sb65wlIwZeZ99Vk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713877775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fpIprDN6eGSy7cTEPwpHpMhu88OeXdeca3a1xTyakMQ=;
 b=dn9tVnTwgk1bJGnN2jremo8FrHrL/cnSxed39tsUaPo1T+KpL3z0ymdu0ihc2rCcwgus0r
 S6Uon7wUF+ZS/5Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9360A13894;
 Tue, 23 Apr 2024 13:09:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iAPeIg6zJ2ZaYAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 23 Apr 2024 13:09:34 +0000
Message-ID: <e10d9029-0f02-4d2e-8fee-f4759eb05148@suse.de>
Date: Tue, 23 Apr 2024 15:09:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] drm/{i915,xe}: Implement fbdev emulation as
 in-kernel client
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Deak, Imre" <imre.deak@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20240409081029.17843-1-tzimmermann@suse.de>
 <20240409081029.17843-7-tzimmermann@suse.de>
 <d164f7d9b0fab2573c9c9781cab17b02c4cdce46.camel@intel.com>
 <1517673a-50da-4f66-958c-1222b1dfc4a6@suse.de>
 <275e85aa8165204bcfe8ff6039356cd0f3577c61.camel@intel.com>
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
In-Reply-To: <275e85aa8165204bcfe8ff6039356cd0f3577c61.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.50
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 10E2837FA5
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; XM_UA_NO_VERSION(0.01)[];
 FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,redhat.com,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[16];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_EQ_ADDR_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:dkim, suse.de:email]
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

Am 23.04.24 um 13:36 schrieb Hogander, Jouni:
> On Tue, 2024-04-23 at 13:13 +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 22.04.24 um 16:11 schrieb Hogander, Jouni:
>>> On Tue, 2024-04-09 at 10:04 +0200, Thomas Zimmermann wrote:
>>>> Replace all code that initializes or releases fbdev emulation
>>>> throughout the driver. Instead initialize the fbdev client by a
>>>> single call to intel_fbdev_setup() after i915 has registered its
>>>> DRM device. Just like similar code in other drivers, i915 fbdev
>>>> emulation now acts like a regular DRM client. Do the same for xe.
>>>>
>>>> The fbdev client setup consists of the initial preparation and
>>>> the
>>>> hot-plugging of the display. The latter creates the fbdev device
>>>> and sets up the fbdev framebuffer. The setup performs display
>>>> hot-plugging once. If no display can be detected, DRM probe
>>>> helpers
>>>> re-run the detection on each hotplug event.
>>>>
>>>> A call to drm_client_dev_unregister() releases all in-kernel
>>>> clients
>>>> automatically. No further action is required within i915. If the
>>>> fbdev
>>>> framebuffer has been fully set up, struct fb_ops.fb_destroy
>>>> implements
>>>> the release. For partially initialized emulation, the fbdev
>>>> client
>>>> reverts the initial setup. Do the same for xe and remove its call
>>>> to
>>>> intel_fbdev_fini().
>>>>
>>>> v8:
>>>> - setup client in intel_display_driver_register (Jouni)
>>>> - mention xe in commit message
>>>>
>>>> v7:
>>>> - update xe driver
>>>> - reword commit message
>>>>
>>>> v6:
>>>> - use 'i915' for i915 device (Jouni)
>>>> - remove unnecessary code for non-atomic mode setting (Jouni,
>>>> Ville)
>>>> - fix function name in commit message (Jouni)
>>>>
>>>> v3:
>>>> -  as before, silently ignore devices without displays
>>>>
>>>> v2:
>>>> -  let drm_client_register() handle initial hotplug
>>>> -  fix driver name in error message (Jani)
>>>> -  fix non-fbdev build (kernel test robot)
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
>> Thank you so much. All patches has R-bs. Can you add the series to
>> the
>> intel tree?
> Is it ok to merge patch 01/06 via intel tree as well?

Sure, np.

Best regards
Thomas

>
> Rodrigo, This set is containing Xe display changes as well. Is it ok to
> push this via drm-intel?
>
> BR,
>
> Jouni Högander
>
>> Best regards
>> Thomas
>>
>>>> ---
>>>>    drivers/gpu/drm/i915/display/intel_display.c  |   1 -
>>>>    .../drm/i915/display/intel_display_driver.c   |  20 +-
>>>>    drivers/gpu/drm/i915/display/intel_fbdev.c    | 177 ++++++++---
>>>> -----
>>>> --
>>>>    drivers/gpu/drm/i915/display/intel_fbdev.h    |  20 +-
>>>>    drivers/gpu/drm/xe/display/xe_display.c       |   2 -
>>>>    5 files changed, 80 insertions(+), 140 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
>>>> b/drivers/gpu/drm/i915/display/intel_display.c
>>>> index 614e60420a29a..161a5aabf6746 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>>>> @@ -85,7 +85,6 @@
>>>>    #include "intel_dvo.h"
>>>>    #include "intel_fb.h"
>>>>    #include "intel_fbc.h"
>>>> -#include "intel_fbdev.h"
>>>>    #include "intel_fdi.h"
>>>>    #include "intel_fifo_underrun.h"
>>>>    #include "intel_frontbuffer.h"
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c
>>>> b/drivers/gpu/drm/i915/display/intel_display_driver.c
>>>> index e5f052d4ff1cc..ed8589fa35448 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
>>>> @@ -514,10 +514,6 @@ int intel_display_driver_probe(struct
>>>> drm_i915_private *i915)
>>>>    
>>>>           intel_overlay_setup(i915);
>>>>    
>>>> -       ret = intel_fbdev_init(&i915->drm);
>>>> -       if (ret)
>>>> -               return ret;
>>>> -
>>>>           /* Only enable hotplug handling once the fbdev is fully
>>>> set
>>>> up. */
>>>>           intel_hpd_init(i915);
>>>>    
>>>> @@ -544,16 +540,6 @@ void intel_display_driver_register(struct
>>>> drm_i915_private *i915)
>>>>    
>>>>           intel_display_debugfs_register(i915);
>>>>    
>>>> -       /*
>>>> -        * Some ports require correctly set-up hpd registers for
>>>> -        * detection to work properly (leading to ghost connected
>>>> -        * connector status), e.g. VGA on gm45.  Hence we can
>>>> only
>>>> set
>>>> -        * up the initial fbdev config after hpd irqs are fully
>>>> -        * enabled. We do it last so that the async config cannot
>>>> run
>>>> -        * before the connectors are registered.
>>>> -        */
>>>> -       intel_fbdev_initial_config_async(i915);
>>>> -
>>>>           /*
>>>>            * We need to coordinate the hotplugs with the
>>>> asynchronous
>>>>            * fbdev configuration, for which we use the
>>>> @@ -562,6 +548,8 @@ void intel_display_driver_register(struct
>>>> drm_i915_private *i915)
>>>>           drm_kms_helper_poll_init(&i915->drm);
>>>>           intel_hpd_poll_disable(i915);
>>>>    
>>>> +       intel_fbdev_setup(i915);
>>>> +
>>>>           intel_display_device_info_print(DISPLAY_INFO(i915),
>>>>                                           DISPLAY_RUNTIME_INFO(i91
>>>> 5),
>>>> &p);
>>>>    }
>>>> @@ -597,9 +585,6 @@ void intel_display_driver_remove_noirq(struct
>>>> drm_i915_private *i915)
>>>>            */
>>>>           intel_hpd_poll_fini(i915);
>>>>    
>>>> -       /* poll work can call into fbdev, hence clean that up
>>>> afterwards */
>>>> -       intel_fbdev_fini(i915);
>>>> -
>>>>           intel_unregister_dsm_handler();
>>>>    
>>>>           /* flush any delayed tasks or pending work */
>>>> @@ -640,7 +625,6 @@ void intel_display_driver_unregister(struct
>>>> drm_i915_private *i915)
>>>>    
>>>>           drm_client_dev_unregister(&i915->drm);
>>>>    
>>>> -       intel_fbdev_unregister(i915);
>>>>           /*
>>>>            * After flushing the fbdev (incl. a late async config
>>>> which
>>>>            * will have delayed queuing of a hotplug event), then
>>>> flush
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c
>>>> b/drivers/gpu/drm/i915/display/intel_fbdev.c
>>>> index f783de611a7f5..bda702c2cab8e 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>>>> @@ -24,7 +24,6 @@
>>>>     *     David Airlie
>>>>     */
>>>>    
>>>> -#include <linux/async.h>
>>>>    #include <linux/console.h>
>>>>    #include <linux/delay.h>
>>>>    #include <linux/errno.h>
>>>> @@ -39,6 +38,7 @@
>>>>    #include <linux/vga_switcheroo.h>
>>>>    
>>>>    #include <drm/drm_crtc.h>
>>>> +#include <drm/drm_crtc_helper.h>
>>>>    #include <drm/drm_fb_helper.h>
>>>>    #include <drm/drm_fourcc.h>
>>>>    #include <drm/drm_gem_framebuffer_helper.h>
>>>> @@ -58,7 +58,6 @@ struct intel_fbdev {
>>>>           struct intel_framebuffer *fb;
>>>>           struct i915_vma *vma;
>>>>           unsigned long vma_flags;
>>>> -       async_cookie_t cookie;
>>>>           int preferred_bpp;
>>>>    
>>>>           /* Whether or not fbdev hpd processing is temporarily
>>>> suspended */
>>>> @@ -135,6 +134,26 @@ static int intel_fbdev_mmap(struct fb_info
>>>> *info, struct vm_area_struct *vma)
>>>>           return i915_gem_fb_mmap(obj, vma);
>>>>    }
>>>>    
>>>> +static void intel_fbdev_fb_destroy(struct fb_info *info)
>>>> +{
>>>> +       struct drm_fb_helper *fb_helper = info->par;
>>>> +       struct intel_fbdev *ifbdev = container_of(fb_helper,
>>>> struct
>>>> intel_fbdev, helper);
>>>> +
>>>> +       drm_fb_helper_fini(&ifbdev->helper);
>>>> +
>>>> +       /*
>>>> +        * We rely on the object-free to release the VMA pinning
>>>> for
>>>> +        * the info->screen_base mmaping. Leaking the VMA is
>>>> simpler
>>>> than
>>>> +        * trying to rectify all the possible error paths leading
>>>> here.
>>>> +        */
>>>> +       intel_unpin_fb_vma(ifbdev->vma, ifbdev->vma_flags);
>>>> +       drm_framebuffer_remove(&ifbdev->fb->base);
>>>> +
>>>> +       drm_client_release(&fb_helper->client);
>>>> +       drm_fb_helper_unprepare(&ifbdev->helper);
>>>> +       kfree(ifbdev);
>>>> +}
>>>> +
>>>>    __diag_push();
>>>>    __diag_ignore_all("-Woverride-init", "Allow field
>>>> initialization
>>>> overrides for fb ops");
>>>>    
>>>> @@ -147,6 +166,7 @@ static const struct fb_ops intelfb_ops = {
>>>>           .fb_pan_display = intel_fbdev_pan_display,
>>>>           __FB_DEFAULT_DEFERRED_OPS_DRAW(intel_fbdev),
>>>>           .fb_mmap = intel_fbdev_mmap,
>>>> +       .fb_destroy = intel_fbdev_fb_destroy,
>>>>    };
>>>>    
>>>>    __diag_pop();
>>>> @@ -158,7 +178,6 @@ static int intelfb_create(struct
>>>> drm_fb_helper
>>>> *helper,
>>>>           struct intel_framebuffer *intel_fb = ifbdev->fb;
>>>>           struct drm_device *dev = helper->dev;
>>>>           struct drm_i915_private *dev_priv = to_i915(dev);
>>>> -       struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
>>>>           const struct i915_gtt_view view = {
>>>>                   .type = I915_GTT_VIEW_NORMAL,
>>>>           };
>>>> @@ -250,7 +269,7 @@ static int intelfb_create(struct
>>>> drm_fb_helper
>>>> *helper,
>>>>           ifbdev->vma_flags = flags;
>>>>    
>>>>           intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
>>>> -       vga_switcheroo_client_fb_set(pdev, info);
>>>> +
>>>>           return 0;
>>>>    
>>>>    out_unpin:
>>>> @@ -276,26 +295,6 @@ static const struct drm_fb_helper_funcs
>>>> intel_fb_helper_funcs = {
>>>>           .fb_dirty = intelfb_dirty,
>>>>    };
>>>>    
>>>> -static void intel_fbdev_destroy(struct intel_fbdev *ifbdev)
>>>> -{
>>>> -       /* We rely on the object-free to release the VMA pinning
>>>> for
>>>> -        * the info->screen_base mmaping. Leaking the VMA is
>>>> simpler
>>>> than
>>>> -        * trying to rectify all the possible error paths leading
>>>> here.
>>>> -        */
>>>> -
>>>> -       drm_fb_helper_fini(&ifbdev->helper);
>>>> -
>>>> -       if (ifbdev->vma)
>>>> -               intel_unpin_fb_vma(ifbdev->vma, ifbdev-
>>>>> vma_flags);
>>>> -
>>>> -       if (ifbdev->fb)
>>>> -               drm_framebuffer_remove(&ifbdev->fb->base);
>>>> -
>>>> -       drm_client_release(&ifbdev->helper.client);
>>>> -       drm_fb_helper_unprepare(&ifbdev->helper);
>>>> -       kfree(ifbdev);
>>>> -}
>>>> -
>>>>    /*
>>>>     * Build an intel_fbdev struct using a BIOS allocated
>>>> framebuffer,
>>>> if possible.
>>>>     * The core display code will have read out the current plane
>>>> configuration,
>>>> @@ -459,16 +458,6 @@ static void
>>>> intel_fbdev_suspend_worker(struct
>>>> work_struct *work)
>>>>                                   true);
>>>>    }
>>>>    
>>>> -static void intel_fbdev_sync(struct intel_fbdev *ifbdev)
>>>> -{
>>>> -       if (!ifbdev->cookie)
>>>> -               return;
>>>> -
>>>> -       /* Only serialises with all preceding async calls, hence
>>>> +1
>>>> */
>>>> -       async_synchronize_cookie(ifbdev->cookie + 1);
>>>> -       ifbdev->cookie = 0;
>>>> -}
>>>> -
>>>>    /* Suspends/resumes fbdev processing of incoming HPD events.
>>>> When
>>>> resuming HPD
>>>>     * processing, fbdev will perform a full connector reprobe if a
>>>> hotplug event
>>>>     * was received while HPD was suspended.
>>>> @@ -559,8 +548,6 @@ static int
>>>> intel_fbdev_output_poll_changed(struct
>>>> drm_device *dev)
>>>>           if (!ifbdev)
>>>>                   return -EINVAL;
>>>>    
>>>> -       intel_fbdev_sync(ifbdev);
>>>> -
>>>>           mutex_lock(&ifbdev->hpd_lock);
>>>>           send_hpd = !ifbdev->hpd_suspended;
>>>>           ifbdev->hpd_waiting = true;
>>>> @@ -580,7 +567,6 @@ static int intel_fbdev_restore_mode(struct
>>>> drm_i915_private *dev_priv)
>>>>           if (!ifbdev)
>>>>                   return -EINVAL;
>>>>    
>>>> -       intel_fbdev_sync(ifbdev);
>>>>           if (!ifbdev->vma)
>>>>                   return -ENOMEM;
>>>>    
>>>> @@ -598,7 +584,20 @@ static int intel_fbdev_restore_mode(struct
>>>> drm_i915_private *dev_priv)
>>>>     */
>>>>    
>>>>    static void intel_fbdev_client_unregister(struct drm_client_dev
>>>> *client)
>>>> -{ }
>>>> +{
>>>> +       struct drm_fb_helper *fb_helper =
>>>> drm_fb_helper_from_client(client);
>>>> +       struct drm_device *dev = fb_helper->dev;
>>>> +       struct pci_dev *pdev = to_pci_dev(dev->dev);
>>>> +
>>>> +       if (fb_helper->info) {
>>>> +               vga_switcheroo_client_fb_set(pdev, NULL);
>>>> +               drm_fb_helper_unregister_info(fb_helper);
>>>> +       } else {
>>>> +               drm_fb_helper_unprepare(fb_helper);
>>>> +               drm_client_release(&fb_helper->client);
>>>> +               kfree(fb_helper);
>>>> +       }
>>>> +}
>>>>    
>>>>    static int intel_fbdev_client_restore(struct drm_client_dev
>>>> *client)
>>>>    {
>>>> @@ -616,7 +615,31 @@ static int intel_fbdev_client_restore(struct
>>>> drm_client_dev *client)
>>>>    
>>>>    static int intel_fbdev_client_hotplug(struct drm_client_dev
>>>> *client)
>>>>    {
>>>> -       return intel_fbdev_output_poll_changed(client->dev);
>>>> +       struct drm_fb_helper *fb_helper =
>>>> drm_fb_helper_from_client(client);
>>>> +       struct drm_device *dev = client->dev;
>>>> +       struct pci_dev *pdev = to_pci_dev(dev->dev);
>>>> +       int ret;
>>>> +
>>>> +       if (dev->fb_helper)
>>>> +               return intel_fbdev_output_poll_changed(dev);
>>>> +
>>>> +       ret = drm_fb_helper_init(dev, fb_helper);
>>>> +       if (ret)
>>>> +               goto err_drm_err;
>>>> +
>>>> +       ret = drm_fb_helper_initial_config(fb_helper);
>>>> +       if (ret)
>>>> +               goto err_drm_fb_helper_fini;
>>>> +
>>>> +       vga_switcheroo_client_fb_set(pdev, fb_helper->info);
>>>> +
>>>> +       return 0;
>>>> +
>>>> +err_drm_fb_helper_fini:
>>>> +       drm_fb_helper_fini(fb_helper);
>>>> +err_drm_err:
>>>> +       drm_err(dev, "Failed to setup i915 fbdev emulation
>>>> (ret=%d)\n", ret);
>>>> +       return ret;
>>>>    }
>>>>    
>>>>    static const struct drm_client_funcs intel_fbdev_client_funcs =
>>>> {
>>>> @@ -626,22 +649,23 @@ static const struct drm_client_funcs
>>>> intel_fbdev_client_funcs = {
>>>>           .hotplug        = intel_fbdev_client_hotplug,
>>>>    };
>>>>    
>>>> -int intel_fbdev_init(struct drm_device *dev)
>>>> +void intel_fbdev_setup(struct drm_i915_private *i915)
>>>>    {
>>>> -       struct drm_i915_private *dev_priv = to_i915(dev);
>>>> +       struct drm_device *dev = &i915->drm;
>>>>           struct intel_fbdev *ifbdev;
>>>>           int ret;
>>>>    
>>>> -       if (drm_WARN_ON(dev, !HAS_DISPLAY(dev_priv)))
>>>> -               return -ENODEV;
>>>> +       if (!HAS_DISPLAY(i915))
>>>> +               return;
>>>>    
>>>>           ifbdev = kzalloc(sizeof(*ifbdev), GFP_KERNEL);
>>>>           if (!ifbdev)
>>>> -               return -ENOMEM;
>>>> -
>>>> -       mutex_init(&ifbdev->hpd_lock);
>>>> +               return;
>>>>           drm_fb_helper_prepare(dev, &ifbdev->helper, 32,
>>>> &intel_fb_helper_funcs);
>>>>    
>>>> +       i915->display.fbdev.fbdev = ifbdev;
>>>> +       INIT_WORK(&i915->display.fbdev.suspend_work,
>>>> intel_fbdev_suspend_worker);
>>>> +       mutex_init(&ifbdev->hpd_lock);
>>>>           if (intel_fbdev_init_bios(dev, ifbdev))
>>>>                   ifbdev->helper.preferred_bpp = ifbdev-
>>>>> preferred_bpp;
>>>>           else
>>>> @@ -649,68 +673,19 @@ int intel_fbdev_init(struct drm_device
>>>> *dev)
>>>>    
>>>>           ret = drm_client_init(dev, &ifbdev->helper.client,
>>>> "intel-
>>>> fbdev",
>>>>                                 &intel_fbdev_client_funcs);
>>>> -       if (ret)
>>>> +       if (ret) {
>>>> +               drm_err(dev, "Failed to register client: %d\n",
>>>> ret);
>>>>                   goto err_drm_fb_helper_unprepare;
>>>> +       }
>>>>    
>>>> -       ret = drm_fb_helper_init(dev, &ifbdev->helper);
>>>> -       if (ret)
>>>> -               goto err_drm_client_release;
>>>> -
>>>> -       dev_priv->display.fbdev.fbdev = ifbdev;
>>>> -       INIT_WORK(&dev_priv->display.fbdev.suspend_work,
>>>> intel_fbdev_suspend_worker);
>>>> +       drm_client_register(&ifbdev->helper.client);
>>>>    
>>>> -       return 0;
>>>> +       return;
>>>>    
>>>> -err_drm_client_release:
>>>> -       drm_client_release(&ifbdev->helper.client);
>>>>    err_drm_fb_helper_unprepare:
>>>>           drm_fb_helper_unprepare(&ifbdev->helper);
>>>> +       mutex_destroy(&ifbdev->hpd_lock);
>>>>           kfree(ifbdev);
>>>> -       return ret;
>>>> -}
>>>> -
>>>> -static void intel_fbdev_initial_config(void *data,
>>>> async_cookie_t
>>>> cookie)
>>>> -{
>>>> -       struct intel_fbdev *ifbdev = data;
>>>> -
>>>> -       /* Due to peculiar init order wrt to hpd handling this is
>>>> separate. */
>>>> -       if (drm_fb_helper_initial_config(&ifbdev->helper))
>>>> -               intel_fbdev_unregister(to_i915(ifbdev-
>>>>> helper.dev));
>>>> -}
>>>> -
>>>> -void intel_fbdev_initial_config_async(struct drm_i915_private
>>>> *dev_priv)
>>>> -{
>>>> -       struct intel_fbdev *ifbdev = dev_priv-
>>>>> display.fbdev.fbdev;
>>>> -
>>>> -       if (!ifbdev)
>>>> -               return;
>>>> -
>>>> -       ifbdev->cookie =
>>>> async_schedule(intel_fbdev_initial_config,
>>>> ifbdev);
>>>> -}
>>>> -
>>>> -void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
>>>> -{
>>>> -       struct intel_fbdev *ifbdev = dev_priv-
>>>>> display.fbdev.fbdev;
>>>> -
>>>> -       if (!ifbdev)
>>>> -               return;
>>>> -
>>>> -       intel_fbdev_set_suspend(&dev_priv->drm,
>>>> FBINFO_STATE_SUSPENDED, true);
>>>> -
>>>> -       if (!current_is_async())
>>>> -               intel_fbdev_sync(ifbdev);
>>>> -
>>>> -       drm_fb_helper_unregister_info(&ifbdev->helper);
>>>> -}
>>>> -
>>>> -void intel_fbdev_fini(struct drm_i915_private *dev_priv)
>>>> -{
>>>> -       struct intel_fbdev *ifbdev = fetch_and_zero(&dev_priv-
>>>>> display.fbdev.fbdev);
>>>> -
>>>> -       if (!ifbdev)
>>>> -               return;
>>>> -
>>>> -       intel_fbdev_destroy(ifbdev);
>>>>    }
>>>>    
>>>>    struct intel_framebuffer *intel_fbdev_framebuffer(struct
>>>> intel_fbdev
>>>> *fbdev)
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.h
>>>> b/drivers/gpu/drm/i915/display/intel_fbdev.h
>>>> index 8c953f102ba22..08de2d5b34338 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.h
>>>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.h
>>>> @@ -14,27 +14,11 @@ struct intel_fbdev;
>>>>    struct intel_framebuffer;
>>>>    
>>>>    #ifdef CONFIG_DRM_FBDEV_EMULATION
>>>> -int intel_fbdev_init(struct drm_device *dev);
>>>> -void intel_fbdev_initial_config_async(struct drm_i915_private
>>>> *dev_priv);
>>>> -void intel_fbdev_unregister(struct drm_i915_private *dev_priv);
>>>> -void intel_fbdev_fini(struct drm_i915_private *dev_priv);
>>>> +void intel_fbdev_setup(struct drm_i915_private *dev_priv);
>>>>    void intel_fbdev_set_suspend(struct drm_device *dev, int state,
>>>> bool
>>>> synchronous);
>>>>    struct intel_framebuffer *intel_fbdev_framebuffer(struct
>>>> intel_fbdev
>>>> *fbdev);
>>>>    #else
>>>> -static inline int intel_fbdev_init(struct drm_device *dev)
>>>> -{
>>>> -       return 0;
>>>> -}
>>>> -
>>>> -static inline void intel_fbdev_initial_config_async(struct
>>>> drm_i915_private *dev_priv)
>>>> -{
>>>> -}
>>>> -
>>>> -static inline void intel_fbdev_unregister(struct
>>>> drm_i915_private
>>>> *dev_priv)
>>>> -{
>>>> -}
>>>> -
>>>> -static inline void intel_fbdev_fini(struct drm_i915_private
>>>> *dev_priv)
>>>> +static inline void intel_fbdev_setup(struct drm_i915_private
>>>> *dev_priv)
>>>>    {
>>>>    }
>>>>    
>>>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
>>>> b/drivers/gpu/drm/xe/display/xe_display.c
>>>> index cdbc3f04c80a7..ca5cbe1d8a03b 100644
>>>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>>>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>>>> @@ -214,9 +214,7 @@ void xe_display_fini(struct xe_device *xe)
>>>>           if (!xe->info.enable_display)
>>>>                   return;
>>>>    
>>>> -       /* poll work can call into fbdev, hence clean that up
>>>> afterwards */
>>>>           intel_hpd_poll_fini(xe);
>>>> -       intel_fbdev_fini(xe);
>>>>    
>>>>           intel_hdcp_component_fini(xe);
>>>>           intel_audio_deinit(xe);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


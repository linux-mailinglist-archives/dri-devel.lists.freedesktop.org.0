Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA10988773
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 16:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7317710ECB8;
	Fri, 27 Sep 2024 14:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tfT63/EN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FB/iJqV5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tfT63/EN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FB/iJqV5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B4210E1D5;
 Fri, 27 Sep 2024 14:46:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 71C341FB3A;
 Fri, 27 Sep 2024 14:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727448368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ag95j2HlwCUZAp2SvGyj6ELR44w7cR5N8MXq/hsV3lg=;
 b=tfT63/EN6pUS3YCuCGfd8F05gnmjMrbMPzUJ3F7Z9g+8iOkRx3DGHWpYVcWp686sj8p2wv
 WTnfUFRsTSxlWjqq8dvyRI9HQXDnJ/MHYLcDUvoOcaackTT90cn/F5lb8AmTTVldpvKQ3l
 uBnsxgvLvjjSiid16FtwI2AcBZUbuj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727448368;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ag95j2HlwCUZAp2SvGyj6ELR44w7cR5N8MXq/hsV3lg=;
 b=FB/iJqV5sxWZHvX3gozgBPwRuj/GLILRQ2en9IgAsXOKrkT01kQTvTBejEeyA90rRRnh+O
 pTf2C6dTVdyS1GAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="tfT63/EN";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="FB/iJqV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727448368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ag95j2HlwCUZAp2SvGyj6ELR44w7cR5N8MXq/hsV3lg=;
 b=tfT63/EN6pUS3YCuCGfd8F05gnmjMrbMPzUJ3F7Z9g+8iOkRx3DGHWpYVcWp686sj8p2wv
 WTnfUFRsTSxlWjqq8dvyRI9HQXDnJ/MHYLcDUvoOcaackTT90cn/F5lb8AmTTVldpvKQ3l
 uBnsxgvLvjjSiid16FtwI2AcBZUbuj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727448368;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ag95j2HlwCUZAp2SvGyj6ELR44w7cR5N8MXq/hsV3lg=;
 b=FB/iJqV5sxWZHvX3gozgBPwRuj/GLILRQ2en9IgAsXOKrkT01kQTvTBejEeyA90rRRnh+O
 pTf2C6dTVdyS1GAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 347F31386E;
 Fri, 27 Sep 2024 14:46:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GLZ8CzDF9mbyKwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Sep 2024 14:46:08 +0000
Message-ID: <8fb2df6b-4708-4eac-aa18-d7825d0410a6@suse.de>
Date: Fri, 27 Sep 2024 16:46:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 79/80] drm/omapdrm: Remove struct drm_fb_helper from
 struct omap_fbdev.
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, javierm@redhat.com,
 jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20240924071734.98201-1-tzimmermann@suse.de>
 <20240924071734.98201-80-tzimmermann@suse.de>
 <029f0567-f9df-402c-ae42-3bf27c060986@ideasonboard.com>
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
In-Reply-To: <029f0567-f9df-402c-ae42-3bf27c060986@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 71C341FB3A
X-Spam-Score: -6.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[ideasonboard.com,redhat.com,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
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

Hi

Am 26.09.24 um 15:07 schrieb Tomi Valkeinen:
> Hi,
>
> On 24/09/2024 10:13, Thomas Zimmermann wrote:
>> Store instances of drm_fb_helper and struct omap_fbdev separately.
>> This will allow omapdrm to use the common fbdev client, which allocates
>> its own instance of struct drm_fb_helper.
>>
>> There is at most one instance of each per DRM device, so both can be
>> referenced directly from the omap and DRM device structures. A later
>> patchset might rework the common fbdev client to allow for storing
>> both, drm_fb_helper and omap_fbdev, together in the same place.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>   drivers/gpu/drm/omapdrm/omap_drv.h   |  3 ++
>>   drivers/gpu/drm/omapdrm/omap_fbdev.c | 42 +++++++++++++++-------------
>>   2 files changed, 26 insertions(+), 19 deletions(-)
>
> The ywrap seems to be broken, but it's broken without this series too. 
> With some quick hacks I managed to get the omapdrm's panning function 
> called, and it works the same way with or without this series.
>
> Tested on DRA76 EVM.
>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>
> For reference, in case someone is interested fixing omapdrm's ywrap code:
>
> - get_fb() doesn't work. I don't understand the point of the function. 
> It compares fbi->fix.id and MODULE_NAME, and the "fbi->fix.id" has 
> changed along the years so the check no longer works. Afaik, the whole 
> function is not needed, and we can just use fbi->par.
>
> - omap_fbdev_pan_display() doesn't seem to get called when the console 
> scrolls. I can get it called with an userspace app that does some y 
> panning. Maybe FBINFO_HWACCEL_YWRAP is not supported anymore?

If ywrap doesn't work and no one complained, can we remove it? The rest 
of the code is equivalent to drm_fbdev_dma.c, so we could remove omap's 
implementation entirely.

Best regards
Thomas

>
>  Tomi
>
>> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h 
>> b/drivers/gpu/drm/omapdrm/omap_drv.h
>> index 4c7217b35f6b..d903568fd8cc 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_drv.h
>> +++ b/drivers/gpu/drm/omapdrm/omap_drv.h
>> @@ -32,6 +32,7 @@
>>   #define MODULE_NAME     "omapdrm"
>>     struct omap_drm_usergart;
>> +struct omap_fbdev;
>>     struct omap_drm_pipeline {
>>       struct drm_crtc *crtc;
>> @@ -97,6 +98,8 @@ struct omap_drm_private {
>>         /* memory bandwidth limit if it is needed on the platform */
>>       unsigned int max_bandwidth;
>> +
>> +    struct omap_fbdev *fbdev;
>>   };
>>     diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c 
>> b/drivers/gpu/drm/omapdrm/omap_fbdev.c
>> index 523be34682ca..044e80403c3b 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
>> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
>> @@ -13,6 +13,7 @@
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_framebuffer.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_managed.h>
>>   #include <drm/drm_util.h>
>>     #include "omap_drv.h"
>> @@ -26,10 +27,8 @@ module_param_named(ywrap, ywrap_enabled, bool, 0644);
>>    * fbdev funcs, to implement legacy fbdev interface on top of drm 
>> driver
>>    */
>>   -#define to_omap_fbdev(x) container_of(x, struct omap_fbdev, base)
>> -
>>   struct omap_fbdev {
>> -    struct drm_fb_helper base;
>> +    struct drm_device *dev;
>>       bool ywrap_enabled;
>>         /* for deferred dmm roll when getting called in atomic ctx */
>> @@ -41,7 +40,7 @@ static struct drm_fb_helper *get_fb(struct fb_info 
>> *fbi);
>>   static void pan_worker(struct work_struct *work)
>>   {
>>       struct omap_fbdev *fbdev = container_of(work, struct 
>> omap_fbdev, work);
>> -    struct drm_fb_helper *helper = &fbdev->base;
>> +    struct drm_fb_helper *helper = fbdev->dev->fb_helper;
>>       struct fb_info *fbi = helper->info;
>>       struct drm_gem_object *bo = drm_gem_fb_get_obj(helper->fb, 0);
>>       int npages;
>> @@ -55,24 +54,25 @@ FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS(omap_fbdev,
>>                      drm_fb_helper_damage_range,
>>                      drm_fb_helper_damage_area)
>>   -static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
>> -        struct fb_info *fbi)
>> +static int omap_fbdev_pan_display(struct fb_var_screeninfo *var, 
>> struct fb_info *fbi)
>>   {
>>       struct drm_fb_helper *helper = get_fb(fbi);
>> -    struct omap_fbdev *fbdev = to_omap_fbdev(helper);
>> +    struct omap_drm_private *priv;
>> +    struct omap_fbdev *fbdev;
>>         if (!helper)
>>           goto fallback;
>>   +    priv = helper->dev->dev_private;
>> +    fbdev = priv->fbdev;
>> +
>>       if (!fbdev->ywrap_enabled)
>>           goto fallback;
>>   -    if (drm_can_sleep()) {
>> +    if (drm_can_sleep())
>>           pan_worker(&fbdev->work);
>> -    } else {
>> -        struct omap_drm_private *priv = helper->dev->dev_private;
>> +    else
>>           queue_work(priv->wq, &fbdev->work);
>> -    }
>>         return 0;
>>   @@ -92,7 +92,6 @@ static void omap_fbdev_fb_destroy(struct fb_info 
>> *info)
>>       struct drm_fb_helper *helper = info->par;
>>       struct drm_framebuffer *fb = helper->fb;
>>       struct drm_gem_object *bo = drm_gem_fb_get_obj(fb, 0);
>> -    struct omap_fbdev *fbdev = to_omap_fbdev(helper);
>>         DBG();
>>   @@ -104,7 +103,7 @@ static void omap_fbdev_fb_destroy(struct 
>> fb_info *info)
>>         drm_client_release(&helper->client);
>>       drm_fb_helper_unprepare(helper);
>> -    kfree(fbdev);
>> +    kfree(helper);
>>   }
>>     /*
>> @@ -128,9 +127,9 @@ static const struct fb_ops omap_fb_ops = {
>>   static int omap_fbdev_create(struct drm_fb_helper *helper,
>>           struct drm_fb_helper_surface_size *sizes)
>>   {
>> -    struct omap_fbdev *fbdev = to_omap_fbdev(helper);
>>       struct drm_device *dev = helper->dev;
>>       struct omap_drm_private *priv = dev->dev_private;
>> +    struct omap_fbdev *fbdev = priv->fbdev;
>>       struct drm_framebuffer *fb = NULL;
>>       union omap_gem_size gsize;
>>       struct fb_info *fbi = NULL;
>> @@ -338,6 +337,7 @@ static const struct drm_client_funcs 
>> omap_fbdev_client_funcs = {
>>     void omap_fbdev_setup(struct drm_device *dev)
>>   {
>> +    struct omap_drm_private *priv = dev->dev_private;
>>       struct omap_fbdev *fbdev;
>>       struct drm_fb_helper *helper;
>>       int ret;
>> @@ -345,24 +345,28 @@ void omap_fbdev_setup(struct drm_device *dev)
>>       drm_WARN(dev, !dev->registered, "Device has not been 
>> registered.\n");
>>       drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
>>   -    fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
>> +    fbdev = drmm_kzalloc(dev, sizeof(*fbdev), GFP_KERNEL);
>>       if (!fbdev)
>>           return;
>> -    helper = &fbdev->base;
>> +    fbdev->dev = dev;
>> +    INIT_WORK(&fbdev->work, pan_worker);
>> +
>> +    priv->fbdev = fbdev;
>>   +    helper = kzalloc(sizeof(*helper), GFP_KERNEL);
>> +    if (!helper)
>> +        return;
>>       drm_fb_helper_prepare(dev, helper, 32, &omap_fb_helper_funcs);
>>         ret = drm_client_init(dev, &helper->client, "fbdev", 
>> &omap_fbdev_client_funcs);
>>       if (ret)
>>           goto err_drm_client_init;
>>   -    INIT_WORK(&fbdev->work, pan_worker);
>> -
>>       drm_client_register(&helper->client);
>>         return;
>>     err_drm_client_init:
>>       drm_fb_helper_unprepare(helper);
>> -    kfree(fbdev);
>> +    kfree(helper);
>>   }
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7FD2D6028
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CC06EA95;
	Thu, 10 Dec 2020 15:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D666EA95
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:43:46 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BAFhRu1114554;
 Thu, 10 Dec 2020 09:43:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607615007;
 bh=Q9Lgho0lfcaose0GI5VwBEyUsFB+PhHHAi7cp3XSzlA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=wZ8cMM6TET8ZBxFYn71KAoeaHWTFsxw7SI3Xn6gnOcJu5cbI5gLVC+1N8062n4XC8
 CGOQr3VReHKcwwZwdLv5D28EXdr6jNHW0JZJyLUnw36sWzZAKE0ahr6G4V2GL/gSR7
 LivWgdNi0/YMF/mFc7pxVrZXZjLXxyVqiukW/7TE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BAFhRUT084241
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Dec 2020 09:43:27 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 09:43:26 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 09:43:26 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BAFhNDM048884;
 Thu, 10 Dec 2020 09:43:23 -0600
Subject: Re: [PATCH v3 1/2] drm: automatic legacy gamma support
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201210140852.1040054-1-tomi.valkeinen@ti.com>
 <20201210140852.1040054-2-tomi.valkeinen@ti.com>
 <20201210152739.GF401619@phenom.ffwll.local>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <39cc67d5-1977-df56-0fbb-1b8531398e81@ti.com>
Date: Thu, 10 Dec 2020 17:43:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201210152739.GF401619@phenom.ffwll.local>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, David Airlie <airlied@linux.ie>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/12/2020 17:27, Daniel Vetter wrote:

>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index e82db0f4e771..80e3797f0f01 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -46,6 +46,7 @@
>>  #include <drm/drm_print.h>
>>  #include <drm/drm_vblank.h>
>>  
>> +#include "drm_crtc_internal.h"
> 
> So this is a bit annoying, because thus far we managed to have a very
> clear split between core and helpers. And I think we can keep that.
> 
>>  #include "drm_crtc_helper_internal.h"
>>  #include "drm_internal.h"
>>  
>> @@ -136,15 +137,15 @@ static void drm_fb_helper_restore_lut_atomic(struct drm_crtc *crtc)
>>  {
>>  	uint16_t *r_base, *g_base, *b_base;
>>  
>> -	if (crtc->funcs->gamma_set == NULL)
>> +	if (!drm_crtc_supports_legacy_gamma(crtc))
>>  		return;
>>  
>>  	r_base = crtc->gamma_store;
>>  	g_base = r_base + crtc->gamma_size;
>>  	b_base = g_base + crtc->gamma_size;
>>  
>> -	crtc->funcs->gamma_set(crtc, r_base, g_base, b_base,
>> -			       crtc->gamma_size, NULL);
>> +	drm_crtc_legacy_gamma_set(crtc, r_base, g_base, b_base,
>> +				  crtc->gamma_size, NULL);
> 
> This is only used by legacy non-atomic drivers. It's pretty much
> impossible to make kgdb work with atomic drivers, so really let's just not
> bother and keep the code as-is.

You're right.

>>  }
>>  
>>  /**
>> @@ -946,7 +947,7 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
>>  	drm_modeset_lock_all(fb_helper->dev);
>>  	drm_client_for_each_modeset(modeset, &fb_helper->client) {
>>  		crtc = modeset->crtc;
>> -		if (!crtc->funcs->gamma_set || !crtc->gamma_size) {
>> +		if (!drm_crtc_supports_legacy_gamma(crtc)) {
>>  			ret = -EINVAL;
>>  			goto out;
>>  		}
>> @@ -964,8 +965,8 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
>>  		memcpy(g + cmap->start, cmap->green, cmap->len * sizeof(*g));
>>  		memcpy(b + cmap->start, cmap->blue, cmap->len * sizeof(*b));
>>  
>> -		ret = crtc->funcs->gamma_set(crtc, r, g, b,
>> -					     crtc->gamma_size, NULL);
>> +		ret = drm_crtc_legacy_gamma_set(crtc, r, g, b, crtc->gamma_size,
>> +						NULL);
>>  		if (ret)
>>  			goto out;
> 
> Same here.

Yep.

>>  	}
>> @@ -1024,12 +1025,10 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
>>  	struct drm_device *dev = fb_helper->dev;
>>  	struct drm_property_blob *gamma_lut = NULL;
>>  	struct drm_modeset_acquire_ctx ctx;
>> -	struct drm_crtc_state *crtc_state;
>>  	struct drm_atomic_state *state;
>>  	struct drm_mode_set *modeset;
>>  	struct drm_crtc *crtc;
>>  	u16 *r, *g, *b;
>> -	bool replaced;
>>  	int ret = 0;
>>  
>>  	drm_modeset_acquire_init(&ctx, 0);
>> @@ -1053,18 +1052,9 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
>>  			goto out_state;
>>  		}
>>  
>> -		crtc_state = drm_atomic_get_crtc_state(state, crtc);
>> -		if (IS_ERR(crtc_state)) {
>> -			ret = PTR_ERR(crtc_state);
>> +		ret = drm_crtc_gamma_ramp_set(state, crtc, gamma_lut);
>> +		if (ret)
> 
> You're nesting an atomic commit in an atomic commit here, that will go
> boom. I guess ideally we'd move this into drm_client_modeset so it
> remembers the fbdev gamma ramp and does it all in one go. Otherwise I
> guess you need some kind of different helper, not sure what.

What do you mean? Are you mixing drm_crtc_legacy_gamma_set with drm_crtc_gamma_ramp_set (yeah, I
didn't quite know how to name the latter one...)? drm_crtc_gamma_ramp_set does the same thing as the
removed code, it sets the gamma_lut in to the state. It doesn't commit.

drm_crtc_gamma_ramp_set does a "setup the state so that this gamma ramp will be on screen", which
means setting/clearing GAMMA_LUT, DEGAMMA_LUT and CTM. I wanted to have that logic in one place,
which means we need to export it from drm.ko.

I could just inline drm_crtc_gamma_ramp_set, but then I need drm_mode_obj_find_prop_id, which is
again not exported. I could also inline drm_mode_obj_find_prop_id as it's trivial enough loop. But
this sounds uglier than exporting a function.

Personally, I don't remember when I have used fbdev the last time (other than simple tests), and I
could as well just leave the code here as it is. I have no idea if this fbdev setcmap is a big
feature that has to function also with HW that only has a pre-gamma table.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

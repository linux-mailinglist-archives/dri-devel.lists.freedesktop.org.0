Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F6A9377A6
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 14:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF56E10EB7F;
	Fri, 19 Jul 2024 12:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GqeXUHT2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9650B10EB7F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 12:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721391436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PYYKEju9V33WI0n770mWoWhS2UEiPymay1ebUhEfSwk=;
 b=GqeXUHT2veX197bGhuSc4IgyQyREwiIZqJNXJ8aV5GGtvIdvBUESeP6ipWr26z59h3XT5s
 FwQmoxKmduGcMWY13mPwmM7WbACSrZ4GFDzQtc5L6/PCj43AK5O+ZsQ7Y8nurl6KZMGOdm
 Artdt7RuFPggsw0Q1wKZWWH6p66IDcg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-DZmZFR1DOEucKBR3AXD05A-1; Fri, 19 Jul 2024 08:17:15 -0400
X-MC-Unique: DZmZFR1DOEucKBR3AXD05A-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ee8e904f01so23599471fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 05:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721391434; x=1721996234;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PYYKEju9V33WI0n770mWoWhS2UEiPymay1ebUhEfSwk=;
 b=NR3IVQ3zj0iAMav1lmzi+7Wk2PaH5M4E1Qb2Y/wNPGP/9yr0l2i+VgyEmVQlPWSUKR
 c6almIsJ2jAZb5w4OtObbX45lwasMnOto1LXc1p3jKw1ZIZplAp6+rLLy6qco1GLtwib
 ads7Z6ya/Jf7NdMFivpP3gGCjPP/80580o0up/ukV/NuCxzQy+Cb2tBzOingOlx9KskQ
 JQcv8UOHmNVkGEoSUDUq3BULeKQmT0q8nPGWCB5DyrTRt99zOXvbH1V90Rdg0fo5UjkB
 CPlWs6FAW4i0c3eN6/Sp9JGImEU3pWWT9I/NnK1CVWyLSw0YSihmALpC21N42XP2igrz
 YOCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWyNpYooONVyO/T3+aVNBs6qFtp8LK44yXMaNfduXVd91mqaWJQinhUVuPmi+yC8Zl4MRmhQitF9m9oDfZxWx5WAu1j2fYLny1ev63c3lC
X-Gm-Message-State: AOJu0YwK1DjkPPblpwajvjKl/ygxMmAO6hamZEzoOPOHEM8Yusu6xfVp
 zjStjskhhKdqGTJkwlWwhxiMiV4gRjFUNdU4XzxQf2SJyou4SzOGIDgkR/wPGAPYHC8EWpYHz4i
 4DvhUrFqZOvhVB4zaVkS20ACL8wL2fg3uW9ZeldS3AzTb0dvG23wegctAts9LS96CuA==
X-Received: by 2002:a2e:a374:0:b0:2ee:4e67:85e9 with SMTP id
 38308e7fff4ca-2ef05d453afmr32362621fa.47.1721391434018; 
 Fri, 19 Jul 2024 05:17:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq3dCGUOd9Ik/4G/nKmK45+YmrjlMMvmRYqERkYuL/YmdUvmCx8gK5AGz5NeyIvbwXPo/GJQ==
X-Received: by 2002:a2e:a374:0:b0:2ee:4e67:85e9 with SMTP id
 38308e7fff4ca-2ef05d453afmr32362441fa.47.1721391433559; 
 Fri, 19 Jul 2024 05:17:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a8e42bsm51381405e9.30.2024.07.19.05.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 05:17:13 -0700 (PDT)
Message-ID: <5e79eaf0-d229-4d7e-b597-f2ae32957031@redhat.com>
Date: Fri, 19 Jul 2024 14:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Add missing static inline to
 drm_panic_is_enabled()
To: imre.deak@intel.com, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
References: <20240719103615.1489714-1-jfalempe@redhat.com>
 <ZppQWb05llyndFh-@ideak-desk.fi.intel.com>
 <ZppRX2d88APfac0G@ideak-desk.fi.intel.com>
 <ZppVnTtQAGUDqPdO@ideak-desk.fi.intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZppVnTtQAGUDqPdO@ideak-desk.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 19/07/2024 14:01, Imre Deak wrote:
> On Fri, Jul 19, 2024 at 02:43:27PM +0300, Imre Deak wrote:
>> On Fri, Jul 19, 2024 at 02:39:11PM +0300, Imre Deak wrote:
>>> On Fri, Jul 19, 2024 at 12:36:08PM +0200, Jocelyn Falempe wrote:
>>>> This breaks build if DRM_PANIC is not enabled.
>>>>
>>>> Fixes: de338c754d40 ("drm/panic: Add missing static inline to drm_panic_is_enabled()")
>>
>> The fix is actually for 9f774c42a908 ("drm/panic: Add drm_panic_is_enabled()")

Yes, picked up the wrong sha1.
> 
> A related issue, DRM_CONFIG_PANIC=y is also borked for me:
> 
>    CC [M]  drivers/gpu/drm/drm_panic.o
> drivers/gpu/drm/drm_panic.c:712:6: error: no previous prototype for ‘drm_panic_is_enabled’ [-Werror=missing-prototypes]
>    712 | bool drm_panic_is_enabled(struct drm_device *dev)
>        |      ^~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
ok it's missing the #include "drm_crtc_internal.h" in drm_panic.c.
how did I missed that :(
let me send a v2.

-- 

Jocelyn

>>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>
>>> Thanks for the quick fix:
>>> Reviewed-by: Imre Deak <imre.deak@intel.com>
>>>
>>>> ---
>>>>   drivers/gpu/drm/drm_crtc_internal.h | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
>>>> index c10de39cbe83..bbac5350774e 100644
>>>> --- a/drivers/gpu/drm/drm_crtc_internal.h
>>>> +++ b/drivers/gpu/drm/drm_crtc_internal.h
>>>> @@ -321,7 +321,7 @@ drm_edid_load_firmware(struct drm_connector *connector)
>>>>   #ifdef CONFIG_DRM_PANIC
>>>>   bool drm_panic_is_enabled(struct drm_device *dev);
>>>>   #else
>>>> -bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
>>>> +static inline bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
>>>>   #endif
>>>>   
>>>>   #endif /* __DRM_CRTC_INTERNAL_H__ */
>>>> -- 
>>>> 2.45.2
>>>>
> 


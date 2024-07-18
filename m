Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ED6934AF9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 11:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8D510E6C1;
	Thu, 18 Jul 2024 09:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DtwfGyUm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72E610E6B7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 09:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721295012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9q9HLC7V8MLZ80zJXfERHHxdoqrkWdriaq68Cy7rAuA=;
 b=DtwfGyUmC/f3yToMgJEKyPuAxwipU9UvA97oNE3yR1MtVpKpe4nfah7mGJ8K0aRg8KBY3y
 5hDMx9IiSd//STsjaih1YcGXqivwgTpxb3h0ymKac4lVqv1ZmPtCoL69PE5ciaVXIFy44e
 RMEGB+tBBh8LTwPLXChq9z4qINwDygc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-EYaAgBgDNped3moY3mcxaA-1; Thu, 18 Jul 2024 05:30:08 -0400
X-MC-Unique: EYaAgBgDNped3moY3mcxaA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4265464ddc9so584465e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 02:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721295007; x=1721899807;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9q9HLC7V8MLZ80zJXfERHHxdoqrkWdriaq68Cy7rAuA=;
 b=No4oCo8XViajr3OAbn39cfzd4tUFJdgeX3Pn2xt+ItbTrS4Ymdn4p21ezJkCATbMcm
 +VaRxezyJXhbIAo9Z+WbhRVAYf27mab3K7QPZ4t6jjbpp8NhnXLRoA3JEeSX0202Lsv1
 tRro37o/YYCl1LMX4pTroYIzV+N9tpq2CmmZFV5HWtHq1vVDoL1pxyNEXVgcDp3fC+Uw
 2w2pmoR6uxzfiipCk01TtjgxdkkETgo+IOWPjzBuHe+vmc7mYEMx0okYAqDrnLjxgLAZ
 hNqqB8mtEtM/K9rifDO6YR2g0U5LhEc5QbUvGlS4ucUxjKKhz5TQO3FSYYyfKb7ROF8S
 faMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW41I/SjalrSwWIA1ZlzTq7gOlKAHWN/CF9WoKfiVAxdx4uJKKQ1Fpy6m2omUz9uCTJJBQPSsJEJztgrBlu6PycBTjt47gGzYm5zpdjBGGL
X-Gm-Message-State: AOJu0YwLG/cbUdPhXSOT6J41xeHpKOVTg4Sm813ASD4gmWdpjot9HP7J
 ykC09/iaoJwRYHoQRMgk0nQQy4MxIG8lNoVLT9o1D4szD1q1WHuVgCN4TQZf409keieWmGhsX8c
 XtEuysrOuUEVFn84zKyJfrpzXMfPg42/zO77ubiXbGAs9iLIvmQHlnOx+I7Opqu8uCA==
X-Received: by 2002:a05:600c:1c9d:b0:426:711c:6591 with SMTP id
 5b1f17b1804b1-427d2a85815mr2795365e9.4.1721295007407; 
 Thu, 18 Jul 2024 02:30:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+8ttf1s3egHR+h5cLkePronykxkc0Zd3hb0OjoNA8amSZdiUzePN3sl9hakq1rcMyxyqpXw==
X-Received: by 2002:a05:600c:1c9d:b0:426:711c:6591 with SMTP id
 5b1f17b1804b1-427d2a85815mr2795035e9.4.1721295006929; 
 Thu, 18 Jul 2024 02:30:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2b1f1e1sm3094685e9.30.2024.07.18.02.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 02:30:06 -0700 (PDT)
Message-ID: <60419d31-f467-4277-97da-23c9573af2bf@redhat.com>
Date: Thu, 18 Jul 2024 11:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/panic: Add drm_panic_is_enabled()
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20240717090102.968152-1-jfalempe@redhat.com>
 <20240717090102.968152-2-jfalempe@redhat.com>
 <ZpfeiMj48JQTQcOE@phenom.ffwll.local>
 <34305c58-38a6-4b5a-9777-69833aefa003@redhat.com>
In-Reply-To: <34305c58-38a6-4b5a-9777-69833aefa003@redhat.com>
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



On 18/07/2024 09:04, Jocelyn Falempe wrote:
> 
> 
> On 17/07/2024 17:08, Daniel Vetter wrote:
>> On Wed, Jul 17, 2024 at 10:48:39AM +0200, Jocelyn Falempe wrote:
>>> It allows to check if the drm device supports drm_panic.
>>> Prepare the work to have better integration with fbcon and vtconsole.
>>>
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   drivers/gpu/drm/drm_panic.c | 20 ++++++++++++++++++++
>>>   include/drm/drm_panic.h     |  2 ++
>>>   2 files changed, 22 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>>> index 948aed00595e..d9a25c2d0a65 100644
>>> --- a/drivers/gpu/drm/drm_panic.c
>>> +++ b/drivers/gpu/drm/drm_panic.c
>>> @@ -703,6 +703,26 @@ static void debugfs_register_plane(struct 
>>> drm_plane *plane, int index)
>>>   static void debugfs_register_plane(struct drm_plane *plane, int 
>>> index) {}
>>>   #endif /* CONFIG_DRM_PANIC_DEBUG */
>>> +/**
>>> + * drm_panic_is_enabled
>>> + * @dev: the drm device that may supports drm_panic
>>> + *
>>> + * returns true if the drm device supports drm_panic
>>> + */
>>> +bool drm_panic_is_enabled(struct drm_device *dev)
>>> +{
>>> +    struct drm_plane *plane;
>>> +
>>> +    if (!dev->mode_config.num_total_plane)
>>> +        return false;
>>> +
>>> +    drm_for_each_plane(plane, dev)
>>> +        if (plane->helper_private && 
>>> plane->helper_private->get_scanout_buffer)
>>> +            return true;
>>> +    return false;
>>> +}
>>> +EXPORT_SYMBOL(drm_panic_is_enabled);
>>
>> This feels like overkill since you currently only have one user in the
>> fbdev emulation code, but maybe useful in some other places ...
>>
>>> +
>>>   /**
>>>    * drm_panic_register() - Initialize DRM panic for a device
>>>    * @dev: the drm device on which the panic screen will be displayed.
>>> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
>>> index 73bb3f3d9ed9..c3a358dc3e27 100644
>>> --- a/include/drm/drm_panic.h
>>> +++ b/include/drm/drm_panic.h
>>> @@ -148,11 +148,13 @@ struct drm_scanout_buffer {
>>>   #ifdef CONFIG_DRM_PANIC
>>> +bool drm_panic_is_enabled(struct drm_device *dev);
>>
>> Since it's internal only, this should be in
>> drivers/gpu/drm/drm_crtc_internal.h and not int he include for drivers.
> 
> Yes, that makes sense, drivers won't need that API.
> 
>> With that:
>>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>>>   void drm_panic_register(struct drm_device *dev);
>>>   void drm_panic_unregister(struct drm_device *dev);
>>
>> These two are only used in drm.ko. Can you please move them to
>> drm_crtc_internal.h too and drop the EXPORT_SYMBOL in a follow-up patch?
>> We're trying to limit the exported interface and official headers to
>> really only the pieces drivers actually need.
> 
> Sure, I'll add this to my next drm_panic series.

I think this also applies to drm_panic_init() and drm_panic_exit(), that 
I introduce in my QR code series:
https://patchwork.freedesktop.org/patch/604890/?series=135944&rev=2
I will move them to drm_crtc_internal.h

> 
>>
>> Thanks, Sima
>>
>>>   #else
>>> +bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
>>>   static inline void drm_panic_register(struct drm_device *dev) {}
>>>   static inline void drm_panic_unregister(struct drm_device *dev) {}
>>> -- 
>>> 2.45.2
>>>
>>
> 
> Best regards,
> 


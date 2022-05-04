Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 494DB519EA6
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331E910FB93;
	Wed,  4 May 2022 11:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B271510FB93
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651665407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jeooKqRyzghfUkOfeV/Vlt1zt/wtQuZm4IF/sDcOCuI=;
 b=BP0IWDUxMQGWQ3QooZraq7uSV81IXeN8ArCLLxOekJft+xG7oGC1mfKXVnpl3Kj4wGcn6g
 lo1kwbX0GlrJ80Ap5AiuLJ8tpiGrw/ioLnXvVgd6/wAbYa3DM94pyET+hC+4mhL48HKZci
 zNHiwBCj3LXetTqI67hqce5CZP8oDTw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-zgzLYCtFNYuVPw3wASjbAQ-1; Wed, 04 May 2022 07:56:46 -0400
X-MC-Unique: zgzLYCtFNYuVPw3wASjbAQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 j21-20020adfa555000000b0020adb9ac14fso290713wrb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jeooKqRyzghfUkOfeV/Vlt1zt/wtQuZm4IF/sDcOCuI=;
 b=YWO1RhggXzXtGGMRg1YvTgVB45919cm0a+m6mjG37W4gH/qFMGIdv1QJBa+NdDxsnF
 FKv6fVjLYdmfAEEmDi/8rHj13UUszpeWNFKSZOeMviqCZ3BXrHvcHD1qEFgQfbYEphQF
 /H0RkfIFtUk9yqJLXKIz+3VIXhMU5iwEAvvv7APJpY3L8Ikz4PPHkaTk1lhEjSBBCCKz
 5wuG6JVTjdx5fxD+a3Gmegf1X1WXZJRyVoA7kACDV+xb+bEAK1r0UBjc3PWz0QP2G2z7
 Huj/pJR6Ie1fddjnTknlnrw4GNVFZ+qG3/CepXXnDgkhgwdnGluVt2WhqR9ZiPufiXhg
 BamA==
X-Gm-Message-State: AOAM5325U3kfaWUZ32piVP1bvRObpdc1t+SAAdkoW5SDKrno4/QuSOfJ
 mGLhPRpKwdzZavfBscUlFKy6ymGmIDy8I3z0Tr7/WARco0l/TU8w4U5K+OlYR3j3HyyHf11nnto
 Fc04MU/K/tjRyoEeHkN+bNiPCnt7H
X-Received: by 2002:a5d:6c68:0:b0:20c:7246:a86 with SMTP id
 r8-20020a5d6c68000000b0020c72460a86mr6621308wrz.283.1651665405518; 
 Wed, 04 May 2022 04:56:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcfeLk92eWO9kDpgsOwX7w2kPMQqOtTO6Tll5Hf868QaJVConADPmtwiaov2wQju1ShcIuXA==
X-Received: by 2002:a5d:6c68:0:b0:20c:7246:a86 with SMTP id
 r8-20020a5d6c68000000b0020c72460a86mr6621302wrz.283.1651665405331; 
 Wed, 04 May 2022 04:56:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:a765:79fb:b5ef:c480?
 ([2a01:e0a:d5:a000:a765:79fb:b5ef:c480])
 by smtp.gmail.com with ESMTPSA id
 bg3-20020a05600c3c8300b003942a244ed2sm4503560wmb.23.2022.05.04.04.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 04:56:44 -0700 (PDT)
Message-ID: <deeac198-4227-aaa9-3f55-361f3834c93e@redhat.com>
Date: Wed, 4 May 2022 13:56:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/4] mgag200: Optimize damage clips
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
References: <20220426164108.1051295-1-jfalempe@redhat.com>
 <20220426164108.1051295-3-jfalempe@redhat.com>
 <811b97ca-d7f0-184e-17f3-4c3398ca3794@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <811b97ca-d7f0-184e-17f3-4c3398ca3794@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/05/2022 12:04, Thomas Zimmermann wrote:
> Hi
> 
> Am 26.04.22 um 18:41 schrieb Jocelyn Falempe:
>> when there are multiple damage clips, previous code merged them into one
>> big rectangle. As the Matrox memory is very slow, it's faster to copy 
>> each
>> damage clip.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> How do you measure the performance? It seems as if it depends a lot on 
> the nature of the screen update.  But maybe using that loop is faster in 
> the general case with other drivers as well.

I used ktime_get_ts64() to measure the time to copy the damage 
rectangles to VRAM.
It was always faster to copy multiple small rectangles than one big. 
(using Gnome shell/Wayland, dragging windows around).
The memory bandwith of mgag200 is so slow, that accessing it in a more 
"linear" way, is clearly not worth.

I didn't save the numbers, but copying the whole frame was around 130ms 
(for 1280x1024x32).

It may also depends on the userspace optimizations (like if a userspace 
send overlapping rectangles).

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_mode.c | 15 ++++++++++-----
>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c 
>> b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> index cff2e76f3fa0..2bc380a85996 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -855,10 +855,6 @@ mgag200_handle_damage(struct mga_device *mdev, 
>> struct drm_framebuffer *fb,
>>       dst += drm_fb_clip_offset(fb->pitches[0], fb->format, clip);
>>       drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, clip);
>> -
>> -    /* Always scanout image at VRAM offset 0 */
>> -    mgag200_set_startadd(mdev, (u32)0);
>> -    mgag200_set_offset(mdev, fb);
>>   }
>>   static void
>> @@ -904,6 +900,9 @@ mgag200_simple_display_pipe_enable(struct 
>> drm_simple_display_pipe *pipe,
>>       mgag200_enable_display(mdev);
>>       mgag200_handle_damage(mdev, fb, &fullscreen, 
>> &shadow_plane_state->data[0]);
>> +    /* Always scanout image at VRAM offset 0 */
>> +    mgag200_set_startadd(mdev, (u32)0);
>> +    mgag200_set_offset(mdev, fb);
>>   }
>>   static void
>> @@ -959,12 +958,18 @@ mgag200_simple_display_pipe_update(struct 
>> drm_simple_display_pipe *pipe,
>>       struct drm_shadow_plane_state *shadow_plane_state = 
>> to_drm_shadow_plane_state(state);
>>       struct drm_framebuffer *fb = state->fb;
>>       struct drm_rect damage;
>> +    struct drm_atomic_helper_damage_iter iter;
>>       if (!fb)
>>           return;
>> -    if (drm_atomic_helper_damage_merged(old_state, state, &damage))
>> +    drm_atomic_helper_damage_iter_init(&iter, old_state, state);
>> +    drm_atomic_for_each_plane_damage(&iter, &damage) {
>>           mgag200_handle_damage(mdev, fb, &damage, 
>> &shadow_plane_state->data[0]);
>> +    }
>> +    /* Always scanout image at VRAM offset 0 */
>> +    mgag200_set_startadd(mdev, (u32)0);
>> +    mgag200_set_offset(mdev, fb);
>>   }
>>   static struct drm_crtc_state *
> 


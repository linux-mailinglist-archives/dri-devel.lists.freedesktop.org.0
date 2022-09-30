Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E81C5F0A01
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 13:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E90510EC90;
	Fri, 30 Sep 2022 11:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B3710EC90
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 11:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664536940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIY8LT1ugRWlfKqWsvrTNSHb2e7mEKJMdmnnIobz0+0=;
 b=LsI2gkQqASai2z3+0gjE97uqODYFq8U2yFDTr0sf7EPclz4JzwNx8QRObgmJHGHvetu0KX
 We/IQ026Oj9/AxGGWGGmxU1SDNDsiN9w1TRCet2wLM00Y803Mh7DQhyCAR5XtS5FQc/cnv
 t9yHwo2PXNMPAImSYPp6NVEzZS0oER8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-xUkufsbqNVGTAfNm9uKyUg-1; Fri, 30 Sep 2022 07:22:19 -0400
X-MC-Unique: xUkufsbqNVGTAfNm9uKyUg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so1935730wmn.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 04:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=NIY8LT1ugRWlfKqWsvrTNSHb2e7mEKJMdmnnIobz0+0=;
 b=YwcIO/xl0ESb3+DGGNOHw9EaeJUU105Uf7cNCKgDjYcdH1t5+YkEssHkeB3n16itji
 39sFG27C/ysGE+084Fqy9pQPq1whfI1U2Ooa/NXgGejbvuJa/x/zXQuggMnMd43f2EWb
 S32DZM7zFo/m017Y15btL+fS9vsgEMSzCGtnH7IRpntPUJJUlob4j/IvBPUcyKBr/Xbe
 qTWrvql+eIArgit2yg+0NYG9Ir1wNtbEuXYKPsN+x0sga8TTSmCY56bF0NLMtz8QnTF3
 LOj9tTbk7X6619HCo+yDasZIYcGzSQhb0bm0o4RoK0710SCzY/IIVEet5dZ/n/SUZgI5
 Y74g==
X-Gm-Message-State: ACrzQf1eklHyTHzSE7k7uVuzDBEg+qNjpU7OkQLp5sBH0Xi4GxZUzk/a
 p3RXdqVMHG4iM7bpOQjbo6jr1ddJ1EpqueIqfARzXN52X/LOEOBFDp9cMhtKnQu8RuIz9pj5Xb1
 O6FQzE29lovm83BzEve6WkCSCqqRT
X-Received: by 2002:a05:600c:221a:b0:3b4:75b8:3f7f with SMTP id
 z26-20020a05600c221a00b003b475b83f7fmr5389152wml.175.1664536938344; 
 Fri, 30 Sep 2022 04:22:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6eh4/mcd2KYdSDOHHgpKNlEvirzPAZUgKCO+3PZhxJKjfyP3Jmv5uSx5Dz7KM57sx+HtZzsg==
X-Received: by 2002:a05:600c:221a:b0:3b4:75b8:3f7f with SMTP id
 z26-20020a05600c221a00b003b475b83f7fmr5389141wml.175.1664536938143; 
 Fri, 30 Sep 2022 04:22:18 -0700 (PDT)
Received: from [172.20.10.4] ([84.78.249.224])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c310600b003b4f86b31dfsm6438527wmo.33.2022.09.30.04.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 04:22:17 -0700 (PDT)
Message-ID: <79e665bb-c51a-0ac1-3f2f-f0e5eba22388@redhat.com>
Date: Fri, 30 Sep 2022 13:22:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/ssd130x: Iterate over damage clips instead of using a
 merged rect
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220930080123.2441629-1-javierm@redhat.com>
 <a72d4736-74e1-1485-e952-f39909d94fbc@suse.de>
 <da9fddaa-2329-c91b-a89d-c998c5720917@redhat.com>
 <65fd4526-f223-d425-3e69-04fe5485c87c@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <65fd4526-f223-d425-3e69-04fe5485c87c@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 9/30/22 12:11, Thomas Zimmermann wrote:

[...]

>>
>>>> +
>>>> +		ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &damage);
>>>
>>> In simpledrm, we adjust the destination address with dst_clip like this:
>>>
>>>     iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format,
>>> &dst_clip));
>>>
>>> How does this work in ssd130x? You never use dst_clip to adjust to the
>>> changed location. Won't you have out-of-bounds writes on the device?
>>>
>>
>> Right, in ssd130x what I do is:
>>
>> static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_map *vmap,
>> 				struct drm_rect *rect)
>> {
>> 	struct iosys_map dst;
>> ...
>> 	u8 *buf = NULL;
>> ...
>> 	buf = kcalloc(dst_pitch, drm_rect_height(rect), GFP_KERNEL);
>> ...
>> 	iosys_map_set_vaddr(&dst, buf);
>> 	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
>> ...
>> 	ssd130x_update_rect(ssd130x, buf, rect);
>> }
>>
>> I understand that's correct too?
> 
>  From what I understand about ssd130x, blit_rect looks correct up to the 
> call to update_rect.  The values in the rect parameter are for the 
> damage area of the plane. In update_rect, the destination coords x and y 
> are also taken from rect. But they should come from dst_clip, which is 
> the on-screen location. Does that make sense?
> 

I believe you are correct. Then what I should do is to not pass the damage
area to ssd130x_fb_blit_rect() as the struct drm_rect argument but instead
the dst_clip as filled by drm_rect_intersect(). Does that sound correct ?

In other words, the following:

	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
	drm_atomic_for_each_plane_damage(&iter, &damage) {
		dst_clip = plane_state->dst;
		if (!drm_rect_intersect(&dst_clip, &damage))
			continue;

		ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &dst_clip);
	}

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


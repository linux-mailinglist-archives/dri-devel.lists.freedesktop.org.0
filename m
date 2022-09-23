Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D3D5E78F9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 13:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2568110E852;
	Fri, 23 Sep 2022 11:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9C010E8A0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 11:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663930879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JOiBQeetDdcvSGIfY2fjhmLzANCrF4v13aGxj9JhJvY=;
 b=PGBpLfFqI634DeddRewYt0Pc1ZMDIqjKUV9Jk7+4T/a5s8PvxeNV6lYHmqUmgQCq5Myk6k
 oOL19leHHkzyKsBITxzRUZak1azVTqJ6fRC3197+e0aI+bVTB5pEVsIobxjcm7cUwfAPL3
 fbhwmOvwNJI7fmQkbpKwXdGNsTpWxqU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-322-s3i6rlckMx-Pt-n1xSMbYg-1; Fri, 23 Sep 2022 07:01:18 -0400
X-MC-Unique: s3i6rlckMx-Pt-n1xSMbYg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r7-20020a1c4407000000b003b3f017f259so3187306wma.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 04:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JOiBQeetDdcvSGIfY2fjhmLzANCrF4v13aGxj9JhJvY=;
 b=g90+iaCXORSMWNh8dIWiO+aCFDV3dhnH2Fg7pPN1VBoAxg83aNdEgkz+2R+DiICoFt
 rAV5E0M467GWyPuw/U0sJH6n8UWzmI7BEZtEYVFnhbk2M6yOQXdj0W5sZHG9Ks9+1ZCS
 xjxC9MZ/p1GPlpjUWgkV8p4JGweBSI7sX4QrJN59g/ndcao5TqUJawqO3nEOAADEPSe7
 NCjwAjxXitBLDw7fQlPChC+GpkXParxSYqw4jvosRPCmm9Ke4YjzfVsMUUESDcwoaX4n
 S+kQmwGGWGJyFNbcAOvnfxMLKZPlQBVQvQ3j67HImwbd9aAnUkFKKnKGyKEhzg8cJxbL
 7ahg==
X-Gm-Message-State: ACrzQf3k5sWWFjb8cwF934sRaHjcknBmhsifq+qybDhDo9o92Y9BaBxA
 FBkV1XAuJdYpASmWZTN3CFCqWhuzqjbSDCe70DAiLJVSBPG3hF62bUgxsUoPdtCElB9xjLn0mha
 PZeU+AmYzzbjA8XpMbSuTv4XCV8iA
X-Received: by 2002:a05:600c:364a:b0:3b4:b9b3:8bef with SMTP id
 y10-20020a05600c364a00b003b4b9b38befmr12643118wmq.26.1663930877269; 
 Fri, 23 Sep 2022 04:01:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4gLa2EBcgyRTL5irtnfD1Rbw8bNumsaMk9N6QECjIoyKaHGe3CCmvJDwZ+J5z85y4gmVnDHA==
X-Received: by 2002:a05:600c:364a:b0:3b4:b9b3:8bef with SMTP id
 y10-20020a05600c364a00b003b4b9b38befmr12643075wmq.26.1663930876886; 
 Fri, 23 Sep 2022 04:01:16 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c1-20020a5d5281000000b002287d99b455sm7050946wrv.15.2022.09.23.04.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 04:01:16 -0700 (PDT)
Message-ID: <4bef4296-b32f-e6c9-c8d0-591e2945e0d4@redhat.com>
Date: Fri, 23 Sep 2022 13:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 13/33] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <maxime@cerno.tech>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-13-f733a0ed9f90@cerno.tech>
 <49ea7c7c-7d4c-8348-ea75-e0f376111e4c@suse.de>
 <b3c4ee65-fc56-f54c-3946-b6524fb36f72@redhat.com>
 <93969920-b5ed-ff15-48d4-02e2f9c23505@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <93969920-b5ed-ff15-48d4-02e2f9c23505@suse.de>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/23/22 12:30, Thomas Zimmermann wrote:

[...]

>>>> +
>>>> +#ifdef CONFIG_DRM_KUNIT_TEST
>>>> +#include "tests/drm_client_modeset_test.c"
>>>> +#endif
>>>
>>> I strongly dislike this style of including source files in each other.
>>> It's a recipe for all kind of build errors. Can you do something else?
>>>
>>
>> This seems to be the convention used to test static functions and what's
>> documented in the Kunit docs: https://kunit.dev/third_party/kernel/docs/tips.html#testing-static-functions
> 
> That document says "...one option is to conditionally #include the test 
> file...". This doesn't sound like a strong requirement.
>

That's true.

>>
>> I agree with you that's not ideal but I think that consistency with how
>> it is done by other subsystems is also important.
>>   
>>> As the tested function is an internal interface, maybe export a wrapper
>>> if tests are enabled, like this:
>>>
>>> #ifdef CONFIG_DRM_KUNIT_TEST
>>> struct drm_display_mode *
>>> drm_connector_pick_cmdline_mode_kunit(drm_conenctor)
>>> {
>>>     return drm_connector_pick_cmdline_mode(connector)
>>> }
>>> EXPORT_SYMBOL(drm_connector_pick_cmdline_mode_kunit)
>>> #endif
>>>
>>> The wrapper's declaration can be located in the kunit test file.
>>>
>>
>> But that's also not nice since we are artificially exposing these only
>> to allow the static functions to be called from unit tests. And would
>> be a different approach than the one used by all other subsystems...
>>
> 
> There's the problem of interference between the source files when 
> building the code. It's also not the same source code after including 
> the test file. At a minimum, including the tests' source file further 
> includes more files. <kunit/tests.h> also includes quite a few of Linux 
> header files.
> 
> IMHO the current convention (if any) is far from optimal and we should 
> consider breaking it.
>

Yes, I agree with that. But probably we should be explicit about the
wrapper export symbols to access static functions pattern in the KUnit
docs so other subsystems could do the same and it becomes a convention ?
 
> Best regards
> Thomas
> 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


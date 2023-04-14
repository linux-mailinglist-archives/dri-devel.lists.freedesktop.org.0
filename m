Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4776E1DB1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 09:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4FE10E169;
	Fri, 14 Apr 2023 07:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5FA10E169
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681459168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DeOVQm3gb9iSfcxRrVTwjqf6Xvgk6j2LtF2N86WQqYk=;
 b=iyvmJC4gtk0TMDa1zykUZfUuxzhutQ2o/u9foQcJRu3bEeVqsCmbWCJi3hogoieGM5c0ec
 E/3uLTst6AhXA7UKIem1lGRvi4U422VF5CKGMNqq1ry5DGzY0yKnf9Irvdse2ldqJjamEB
 ex7wYXlS0o+zwKGpnGeyiZmr+gk1tII=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-Dq37D5wqOvqRN09Ura62OA-1; Fri, 14 Apr 2023 03:59:27 -0400
X-MC-Unique: Dq37D5wqOvqRN09Ura62OA-1
Received: by mail-wm1-f70.google.com with SMTP id
 f14-20020a05600c154e00b003f0a04fd5b6so3368049wmg.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 00:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681459166; x=1684051166;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DeOVQm3gb9iSfcxRrVTwjqf6Xvgk6j2LtF2N86WQqYk=;
 b=e04ugrIT0DE5i/ReGptHm9GnPoKii0/6aPvJJkG2g3zt8YyQcgHMygXLZ9SYWRcLd5
 VFGDfrnhC1cfKye4HfcwJ8Isuy9gQOblkez/iSWFY8oPBlZaooWHM91/yo9pDaQPwDJt
 An+x/9ZkKFcP0t4e2Mt6Wxp+GR5SiPx58kBWinLiAKqzpsUK8QZX8r0UMnUxYfxQkopy
 LNEIBfhO8mwVxjMlOeJ1+YRA5FJqSLLDqLjzz7PWIoWGYsTTDKu9Ni815PILH/BPSq0S
 f3YvpYrzdgQ9t6WNKFF63fFMT9B9NutGNbeuZSlFC4EE0ew0A1PRXc1B6jnO9BNmDIiA
 JheQ==
X-Gm-Message-State: AAQBX9fPpDLfdKCH2yODVgjprLM3Az5TOCMr6x01Pc7hICTeSlYcMB4U
 jhRK5EkJ6IsyzhR4L09qbJApYF7e+wkdvAEPGHA7Sqt43iLbksI6SKs9b7bq1D6SLwtIZJMyysh
 AtdrL9WYv8qJrzqZIEo3d7BQu8lsU
X-Received: by 2002:adf:e34d:0:b0:2cf:e422:e28c with SMTP id
 n13-20020adfe34d000000b002cfe422e28cmr3048971wrj.42.1681459166002; 
 Fri, 14 Apr 2023 00:59:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350YDtF9mP1uo1VdvO6G3SM2Cpw+y2vqzFrDaE76qDYDI3TGLJezpewWN3IOf1k3bs+MYoqj6HQ==
X-Received: by 2002:adf:e34d:0:b0:2cf:e422:e28c with SMTP id
 n13-20020adfe34d000000b002cfe422e28cmr3048953wrj.42.1681459165706; 
 Fri, 14 Apr 2023 00:59:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a7bcbd5000000b003ede3e54ed7sm3700197wmi.6.2023.04.14.00.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 00:59:25 -0700 (PDT)
Message-ID: <c808889e-43e9-3e41-134d-5ce673492047@redhat.com>
Date: Fri, 14 Apr 2023 09:59:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH 0/2] drm/mgag200: Use 24bit format in VRAM
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
References: <20230412133912.610294-1-jfalempe@redhat.com>
 <3f060f42-3b8e-2296-eeb9-0f774b5ae3b6@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <3f060f42-3b8e-2296-eeb9-0f774b5ae3b6@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/04/2023 21:29, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.04.23 um 15:39 schrieb Jocelyn Falempe:
>> The bandwidth between system memory and VRAM is very limited
>> on G200.
>> So when using a 32bit framebuffer on system memory, convert it to 24bit
>> when copying the frame to the VRAM, this allows to go 33% faster.
>> Converting the format on the fly is negligible, even on low end CPU.
> 
> I'm skeptical about this idea. We emulated a number of formats in 
> simpledrm and got a lot of flames and pushback. The argument was that we 
> should export the formats that hardware supports and not pretend to 
> support anything else. The only exception allowed was emulating 
> XRGB8888, because it's the common ground hat everything in userspace 
> supports.
> 
> I see that this is a bit different from your patches, but not so much. 
> When userspace wants 32-bit XRGB, it should get it if possible.

The hardware will drop the 8bit alpha anyway, there is no image quality 
loss. So I find it better to drop it before sending it to the hardware 
to save bandwidth. As the mgag200 doesn't expose any other 
functionality, the userspace can't even read the VRAM back, so it's 
unlikely to cause issue.

> 
> I'd rather suggest to set the console to 16 bit and also resort the 
> formats array. It is supposed to be sorted by preference. RGB565 should 
> maybe be the top most entry, followed by RGB888. Then you'd have to 
> teach userspace to respect these settings. I'm not sure if all 
> compositors do.
> 

I don't think userspace cares much about very old hardware like this 
one. I would rather make it work as good as possible with current userspace.
For example Gnome/Wayland won't work in 16bit or 24bit pixel depth, and 
it would be much harder to add support in the compositor than this ~36 
lines patch. Other compositors are probably expecting 32bit hardware too.
mgag200 is also likely the last hardware from this era that's still 
alive, so we can't expect userspace to add specific support for it.


We can still change the format array order, but I would put 24bit first, 
as 16 bit is a bit ugly nowadays.

> Best regards
> Thomas
> 
>>
>> [PATCH 1/2] drm/mgag200: simplify offset and scale computation.
>> [PATCH 2/2] drm/mgag200: Use 24bit format in VRAM
>>
>> drivers/gpu/drm/mgag200/mgag200_mode.c | 87 
>> ++++++++++++++++++++++++++++++++++++---------------------------------------------------
>>   1 file changed, 36 insertions(+), 51 deletions(-)
>>
>>
>>
> 


Best regards,

-- 

Jocelyn


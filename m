Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8001F94E860
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 10:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E904210E06E;
	Mon, 12 Aug 2024 08:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="I4kg5dw6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB27F10E06E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723450791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3o34Iz19CskY8QkKtn+LImoDRcl+f67XFDtnP4KOAg=;
 b=I4kg5dw6AoR+e4Fm2t87ZCeyHK7yM/B+qZ1aP6tFzopS9ELCx1RjGv4x/oiG+UWZ4DX8hc
 3FZ/iYUrDW9rft8Ssipwekqyt+NlGiNbIBPqgHCf+JCAZ2YSF+WvY9COgkWxlaKDbJOnvo
 9O1LHRX0rTBYzG3fwNtY2A663QChN74=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-Hj0nJ6D4OIO-RdbjrrV0Fg-1; Mon, 12 Aug 2024 04:19:50 -0400
X-MC-Unique: Hj0nJ6D4OIO-RdbjrrV0Fg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3688010b3bfso2690356f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 01:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723450789; x=1724055589;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E3o34Iz19CskY8QkKtn+LImoDRcl+f67XFDtnP4KOAg=;
 b=a/HaX8naymHnsqGU+eiK/ONatu+XLkkjQkC6eBHykwhPc1D6JAhHIfjIziH8InxjbG
 By9ZWpSnHSd52eJgpxCn5N3vABWKzHTa51gTp+HgUoB/jgXwvE3jZTbK4xXIS8HBiaS7
 sQKDW19f2UVYvZtYLh//4gIE2BaxmRqBUNeZjZYpLZmBjhZpkXZAcq+tieMnZ5ZZ+eoA
 CN8dYSAbM9U/drMIvSYP4vD6X+syCFH2ITyFklYHe4jm7IlOXSadlBWC0s2UL82md1P7
 jhGWd6CdESDPObKvYKo20OYP4sPcpjZ9vDaFknvzifcODe6lRiEkqgAMU9WDmU7SV1j7
 MpFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoq51GH8nUStwh1ufwAaHvaUFoGR78N82vTJ5eWuN1SG4PWrltycbnRO6G5Dio8gu/TVAHfpM9zHN2c4PHiOt39dlSx75qww13jlKEx5/I
X-Gm-Message-State: AOJu0YzH1OPAHO0ldqWmH3fHHweGM5BntTGh4iHLM4+14qdT4DZTw+ww
 ukPp9SJERDTgtvXEFleGPFjHfatdaC8+RA8YO5YZEeJyR94QB5ObMUMNDoe73G0dpHNziZAiaVH
 mdro4vLek+O5VQ+kim5i1Rq8ohuHKblIOfEq8PCd75UnywFTnSFHsWmwx8L8KQ/jQIw==
X-Received: by 2002:a5d:4985:0:b0:368:6f64:307c with SMTP id
 ffacd0b85a97d-36d5e1c7a02mr6504945f8f.15.1723450789263; 
 Mon, 12 Aug 2024 01:19:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN/mZ9YrwSKVYWoIoFR7pGSDMYPCNe0Z5cU4A87sD5rUF/UHi7uRpdszgJLta+wR9gYck3VA==
X-Received: by 2002:a5d:4985:0:b0:368:6f64:307c with SMTP id
 ffacd0b85a97d-36d5e1c7a02mr6504928f8f.15.1723450788707; 
 Mon, 12 Aug 2024 01:19:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429c750e510sm92627665e9.13.2024.08.12.01.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 01:19:48 -0700 (PDT)
Message-ID: <64fca171-abd0-4e49-a035-52cf707f2992@redhat.com>
Date: Mon, 12 Aug 2024 10:19:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/panic: Cleanup and add panic description
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20240723091553.286844-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240723091553.286844-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/07/2024 11:11, Jocelyn Falempe wrote:
> This small series removes unused export symbols, moves internal include to drm_crtc_internal.h, and adds the panic description, now that kmsg_dump provides this information.

I've pushed it to drm-misc-next.

Thanks,

-- 

Jocelyn

> 
> Jocelyn Falempe (5):
>    drm/panic: Remove space before "!" in panic message
>    drm/panic: Remove useless export symbols
>    drm/panic: Move drm_panic_register prototype to drm_crtc_internal.h
>    drm/panic: Move copyright notice to the top
>    drm/panic: Add panic description
> 
>   drivers/gpu/drm/drm_crtc_internal.h |  4 ++++
>   drivers/gpu/drm/drm_panic.c         | 27 +++++++++++++++++++++------
>   include/drm/drm_panic.h             | 21 ++++++---------------
>   3 files changed, 31 insertions(+), 21 deletions(-)
> 
> 
> base-commit: f00bfaca704ca1a2c4e31501a0a7d4ee434e73a7


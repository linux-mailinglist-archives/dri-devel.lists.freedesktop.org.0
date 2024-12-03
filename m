Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562D19E1EE3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2E310EA21;
	Tue,  3 Dec 2024 14:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Tvq56dl9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3092E10EA1E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 14:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733235592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gZDbYzrMnl3kZ2aVFcLlP7YKYYiFATa3NrTm4b3/+oA=;
 b=Tvq56dl9hbVA7b4tqOMuVSXcU0bVNmCJ2Acj/QCTTgZA6kvfM2EL+rTzQ4XEbTupvLW1qg
 Xpe7Ly6ob9MlHNYdqSgIZKOfOp8L9p07f+FG08k177qzlYUAA1qhOJF33XGoku77b4et9o
 HFOTI4ekXlLaMNxxwE+75w6KnJYxv8c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-eyn3RkG4MDOlAsvXsZ8IVg-1; Tue, 03 Dec 2024 09:19:45 -0500
X-MC-Unique: eyn3RkG4MDOlAsvXsZ8IVg-1
X-Mimecast-MFC-AGG-ID: eyn3RkG4MDOlAsvXsZ8IVg
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-434a5ca6a67so40981645e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 06:19:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733235584; x=1733840384;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gZDbYzrMnl3kZ2aVFcLlP7YKYYiFATa3NrTm4b3/+oA=;
 b=Dp6LsxKeGDAzMTuX9V8fqei9vZ9zXQbLeY3f92nMaCBjR01v145aBrG3PD3lyGVb97
 guBwBDhodAIhKR63SNOqg0LBlJ9EbyFi21+CRVfqBD8vb4qWavl0CNX2cl4q7T/XSXUI
 eXwuz2TpqVRY9235m4IpaOEFcFjEQdB2mhDSda/2z90ZaUwbIfOvnHXNZoxs17ZqhgdE
 +1JxG0eIWOMn9Rd0VnUJejMLyZIEzLlYIqsMfoEqVIPYXNSkuEXLl2dz1UeOJ/sK768E
 WZAVULN9idXXyHoeB7zqLW8cTGAinVXo0dncKafMNJ32JNiS0NMqKx/GP4xrNbaFEboJ
 nIAA==
X-Gm-Message-State: AOJu0YyMbSw3YUdm9tNEKLxE7/gxkaBrb48zhYeC0PsaLgi8HG5kc5Z8
 Uo/53NSViraYAIdx2bWYjYWBomQQydgzKG4GK1bM6HUcZFryTGXOcXYB6+avou71acM74krZiU/
 II0ZHwjE9tAu0fr3zZ/csFwhZQfr1mZwnSCNPwUKFByNMofpOv3lIv2m3YMfAuxAB4KBVeD2eIO
 OTzhuPEUW7iOboMWlnrO59z18VBkKPAmZJmYfahdI3xV+rW+fe9Q==
X-Gm-Gg: ASbGnctGC/pozx4qGqFyJbmHVmrLEqJhA/cs2B3ImLVhDg5XJs8OLSPq5Lt3cFiYYDG
 30PN4GPGXlI2YfLZn5P214MngGzjRz5/Rs3N7Hm1sPipsn8z66OM8oX1ULtH3/tTuYYuSoHSjcL
 FB+zMtfZ43CTxx5X5PP0iLD0xso3E3iMoaLY5LQOEj29Ouy9kd88eUBnRPpGV9ZIGI4lr3YHAMz
 uRtKHwqi4+hm7yLQgxn7rsWgnGSyEbSwdQdpqrhJL8IGC6Bp67COLbtdhjovk458iogXbexiX74
 MJtdqYCS6zmHBg==
X-Received: by 2002:a05:600c:35d5:b0:431:60ec:7a96 with SMTP id
 5b1f17b1804b1-434d0a05cf2mr22241225e9.25.1733235583674; 
 Tue, 03 Dec 2024 06:19:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7VlzYuiKbdY4H0Yv5Jbnc1IzXHevklW4ow0F/QhwTYqK+y2eJsOVQN0acAT1J9/XCajwMOA==
X-Received: by 2002:a05:600c:35d5:b0:431:60ec:7a96 with SMTP id
 5b1f17b1804b1-434d0a05cf2mr22240895e9.25.1733235583087; 
 Tue, 03 Dec 2024 06:19:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e3b99249sm10320737f8f.88.2024.12.03.06.19.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 06:19:42 -0800 (PST)
Message-ID: <4f99d11e-7860-45f4-b366-e1ecf649914b@redhat.com>
Date: Tue, 3 Dec 2024 15:19:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/6] drm/panic: Move drawing functions to drm_draw
To: dri-devel@lists.freedesktop.org
References: <20241115142950.1758007-1-jfalempe@redhat.com>
 <20241115142950.1758007-2-jfalempe@redhat.com> <87y10x3u0x.fsf@intel.com>
 <a51f2945-4eff-411e-83ad-838e69daeb6a@redhat.com> <87ed2o506g.fsf@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87ed2o506g.fsf@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: omvLkqocOVNSdOtfuvhd6imE21_xHzYRJBcjNkgTQ6g_1733235584
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

On 03/12/2024 15:08, Jani Nikula wrote:
> On Tue, 03 Dec 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> On 03/12/2024 12:06, Jani Nikula wrote:
>>> On Fri, 15 Nov 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>> Move the color conversions, blit and fill functions to drm_draw.c,
>>>> so that they can be re-used by drm_log.
>>>> drm_draw is internal to the drm subsystem, and shouldn't be used by
>>>> gpu drivers.
>>>
>>> I started looking at this in patch 2:
>>>
>>>> +#include "../drm_draw.h"
>>>
>>> I think we should avoid #includes with ../ like this.
>>
>> Sure, I've added it in v8, after the clients moved to drm/clients/, but
>> I didn't think much about it.
>>
>>>
>>> Either drm_draw.h belongs in include/drm, or maybe clients/Makefile
>>> needs to add subdir-ccflags-y += -I$(src)/.. or something like that?
>>>
>>> If it's supposed to be internal, I guess the latter, but then the
>>> current convention is to have _internal.h suffix. All drm headers under
>>> drivers/ have that.
>>
>> ok, I can rename drm_draw.h to drm_draw_internal.h, and add the include
>> in the Makefile.
>>>
>>> Is this the first drm subsystem internal thing that's a separate module?
>>> Should we use EXPORT_SYMBOL_NS() and MODULE_IMPORT_NS() to enforce it
>>> being internal?
>>
>> It's not really a separate module, as it's built in the core drm module.
>> (the reason is that it's used by drm_panic too, which must be in the
>> core drm module).
> 
> Right, sorry, I got confused and looked at this the other way round.
> 
> drm_draw is part of drm.ko, drm log is part of drm_client_lib.ko, and
> uses drm_draw, right?
Yes, that's it.
> 
> So is drm_draw really internal if drm client uses it?

For me "internal" includes drm clients and kms helpers, but yes, it's 
not really clear.

> 
> I don't really deeply care either way, but it bugs me when it's
> somewhere in between. :)
> 
> Either include/drm/drm_draw.h or drivers/gpu/drm/drm_draw_internal.h,
> the latter *possibly* with symbol namespace, but not a big deal.

The other reason for "internal" is that we should find a way to merge 
drm_draw, drm_format_helper, and some vkms conversion helper, that does 
similar things. So the less users, the easier it will be.

Best regards,

-- 

Jocelyn
> 
> 
> BR,
> Jani.
> 
> 
>>
>> I don't know much about symbol namespace, but I can add that if needed.
>>
>> Best regards,
> 


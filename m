Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64159876575
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 14:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82F510F9FB;
	Fri,  8 Mar 2024 13:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XDQHLQUV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4740910F9FB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 13:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709905075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sdx4785Ipwisl1ArTBqV52xgOgASQAP7d6PS01jYkGE=;
 b=XDQHLQUV2OMmC+oUiZsY2oYVBQI+JUAdHzxFfYtc3b6ep45kTm2075E6HM6HBMGoFigXzk
 f9TLibTpBBJbQFSo93yTEoFIFnx13LoSLukngg6HCwfl7NFlsRJPjbrppayhHwTfJsFYq+
 y0FSvzARNF7YGQPvcH7rNN9rFKrW3H4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-zDIvdmP7NWykTz_lOhpV5Q-1; Fri, 08 Mar 2024 08:37:54 -0500
X-MC-Unique: zDIvdmP7NWykTz_lOhpV5Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-412de861228so4632955e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Mar 2024 05:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709905073; x=1710509873;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sdx4785Ipwisl1ArTBqV52xgOgASQAP7d6PS01jYkGE=;
 b=nOjNBBTj94ZYGA8Fuo/Q7RidlsLQItv1yhM2YEMzfTQM7cDSYC3MB0qX69FLT4G8MC
 P873TWTlhJQSl8nUzbyj09A834sCsmqG8pph6qd/DFAbECzm6Kz+TazOWDDRGq7Yf+ES
 2lNsQxVcBFZCnQwygvX6w2PmJFJpif4unEcaHfMlFz1gwBst0C1OjOlsTONK30jcPmKN
 jTQgQL8gf7+EG+PzGmLa5EioB/eA3KMggzXwLicSTl0aiP0A2omn789q4mdUnE5ojCTs
 ZXgDucsHl/EMs/obGviq6Kg3vI5y6GzO4Kg4+yY7Pdf/bcbmW9F4k8pJAnLiFOb5K8t+
 OYkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHsdk/9RfW9CAsrg70MXuE740U2fVib/qbIgUHVXC01APaMclfOUx3m+gALU7/tK0Ycx5diYGT4zlZ+yVZi42QMgkQfCOhc4L7kXvpeq/h
X-Gm-Message-State: AOJu0YzcCj8NqtVGzKbPaXPhKSz9FOtBdaCCFSTWCFGoxEf+Vv3+HAXG
 OdjX9jmN+2GwlazpleYODGIMp8S+818YzLm1Pa3SQqHWaYUQVSwYPwIe+yMuKMgW/q9Lq2JTvGy
 vwMSLf84RPTxYJH7Pp3L3VqdTZF59qtA5e6HElKPb+TJRzgkfoPBu9cLldnfOOSwbGg==
X-Received: by 2002:a05:600c:4f56:b0:411:a751:322b with SMTP id
 m22-20020a05600c4f5600b00411a751322bmr16958189wmq.18.1709905073076; 
 Fri, 08 Mar 2024 05:37:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEExHzCIjNtdnL3LoJThmDzUp6nj0k64eeVYvBng+2l1Hbe9ghWFF9uqUL164t5T+Og5HTGFw==
X-Received: by 2002:a05:600c:4f56:b0:411:a751:322b with SMTP id
 m22-20020a05600c4f5600b00411a751322bmr16958167wmq.18.1709905072739; 
 Fri, 08 Mar 2024 05:37:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b0041310142e37sm5525337wms.47.2024.03.08.05.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 05:37:52 -0800 (PST)
Message-ID: <193a4534-0fe0-49d9-baff-a9c9e39483a7@redhat.com>
Date: Fri, 8 Mar 2024 14:37:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/9] drm/panic: Add drm panic locking
To: John Ogness <john.ogness@linutronix.de>, dri-devel@lists.freedesktop.org, 
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Lukas Wunner <lukas@wunner.de>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 David Airlie <airlied@gmail.com>
References: <20240307091936.576689-1-jfalempe@redhat.com>
 <20240307091936.576689-2-jfalempe@redhat.com>
 <87r0gmmj5i.fsf@jogness.linutronix.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87r0gmmj5i.fsf@jogness.linutronix.de>
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



On 07/03/2024 11:27, John Ogness wrote:
> On 2024-03-07, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>> index 39ef0a6addeb..c0bb91312fb2 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -38,6 +38,7 @@
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_framebuffer.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>> +#include <drm/drm_panic.h>
>>   #include <drm/drm_print.h>
>>   #include <drm/drm_self_refresh_helper.h>
>>   #include <drm/drm_vblank.h>
>> @@ -3099,6 +3100,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>>   		}
>>   	}
>>   
>> +	drm_panic_lock(state->dev);
>>   	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
>>   		WARN_ON(plane->state != old_plane_state);
>>   
>> @@ -3108,6 +3110,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>>   		state->planes[i].state = old_plane_state;
>>   		plane->state = new_plane_state;
>>   	}
>> +	drm_panic_unlock(state->dev);
> 
> Is there a reason irqsave/irqrestore variants are not used? Maybe this
> code path is too hot?

This lock will be taken for each page flip, so typically at 60Hz (or 
maybe 144Hz for gamers). I don't know what are the performance impacts 
of the irqsave/irqrestore variant.
> 
> By leaving interrupts enabled, there is the risk that a panic from
> within any interrupt handler may block the drm panic handler.

The current design is that the panic handler will just use try_lock(), 
and if it can't take it, the panic screen will not be seen.
The goal is to make sure drm_panic won't crash the machine and prevent 
kdump or other panic handler to run. So there is a very small race 
chance that the panic screen won't be seen, but that's ok.

So I think in this case the drm panic handler shouldn't be blocked, as 
it only use try_lock().

Best regards,

-- 

Jocelyn

> 
> John Ogness
> 


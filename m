Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A885487D2ED
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 18:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43F11123ED;
	Fri, 15 Mar 2024 17:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aBvIUNU8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBF31123ED
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 17:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710524332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nuCzrTJUQ7AmQZGsE3jWNyl9FwbeuQmR7382weTg0c=;
 b=aBvIUNU8Ro8FCwbmydoiVdmivvjmKIsH10sJ+Iy40Puvchod1Ye59xlExweZE6P0NcXd+N
 7VMjoeqwkAFaP/4BirUBDxXPU0KGtR0NrAjmSdMa1G95pBeOl1Xg6KbO/PWG4j/+3rIucA
 h04U8qQpoHZN5I7zyCoMgFVzGAIW0+E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-W-7YYfsYPRGgYH4NNc7SuA-1; Fri, 15 Mar 2024 13:38:50 -0400
X-MC-Unique: W-7YYfsYPRGgYH4NNc7SuA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40e435a606aso11766015e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 10:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710524329; x=1711129129;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7nuCzrTJUQ7AmQZGsE3jWNyl9FwbeuQmR7382weTg0c=;
 b=iSnio7CnsWNmSKy8cDiWFo8Y7Y9bJ+/OACkVfmef1WDXLtfcIWf6JOJESLKJk8BErh
 j9i5ARzLWgcmuyHYvPMKvfW/OUaYaTIzheM6s/bE8ln5T5a8fGJ8Ql7umo9elgcRoto3
 f9hUqTtmxD4CjZOT8AT9RDE3fOkCnyBn9nGPucRdwiGla/R4zaWiG5+/2eyXP+V+iPWT
 RmNif7016CFngI3Y++RkkuWxeVfhSHaNyTjZKFAIp3pACM0itcpFWcjh5bysswmuIaxk
 Jf9lUcoERDuK0zHqnDJKK01wjPs7v/6UqbTZd3LufzCZ8CZDxif6XYk/QtucmKuGXGml
 oxQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEe4RgPWNHzlH4uh/FN+kWDOcnWFV9nKcJ5VStyd50XQkA1SGfMQk52QSbG0VKmtZWbQf1M34IbJLDGTIBKNGfuO283WU9Ma8jL40f1G+n
X-Gm-Message-State: AOJu0YyyoaiGhufIsji/VTF3l7RZzfrut0kuf/ASqIB48WyS4sFFXNp6
 aH7KjKXg9mVGFmvAh8EKdIQdQr3ZWdzTYR5Eb+tqdaCK9q4+ZNiJu/P4B5Pc04HdwBnO99rbSoj
 bKQeAtRKi4iIbVI1oMAmu6Pqa0xNGDVPcGRy30BU4ZlEChJMvcVIptb8zr1E6IPa1tw==
X-Received: by 2002:a05:600c:540d:b0:413:ffff:2e37 with SMTP id
 he13-20020a05600c540d00b00413ffff2e37mr2471731wmb.7.1710524329130; 
 Fri, 15 Mar 2024 10:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcWJsJ6Mtfao9mImW6BJBCW6oqS7Bo6yOitn7EZcUQwjP2u9NBTPys3/7R2gm46Z8PN+4pFw==
X-Received: by 2002:a05:600c:540d:b0:413:ffff:2e37 with SMTP id
 he13-20020a05600c540d00b00413ffff2e37mr2471718wmb.7.1710524328793; 
 Fri, 15 Mar 2024 10:38:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a05600c4f4f00b004130c1dc29csm6498637wmq.22.2024.03.15.10.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 10:38:48 -0700 (PDT)
Message-ID: <851cbef2-712b-44c7-95d7-2bfeff197040@redhat.com>
Date: Fri, 15 Mar 2024 18:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/9] drm/panic: Add drm panic locking
To: John Ogness <john.ogness@linutronix.de>, dri-devel@lists.freedesktop.org, 
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net, noralf@tronnes.org, sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Lukas Wunner <lukas@wunner.de>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 David Airlie <airlied@gmail.com>
References: <20240315151317.857684-1-jfalempe@redhat.com>
 <20240315151317.857684-2-jfalempe@redhat.com>
 <87plvvbjl9.fsf@jogness.linutronix.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87plvvbjl9.fsf@jogness.linutronix.de>
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



On 15/03/2024 16:28, John Ogness wrote:
> On 2024-03-15, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> +static inline int drm_panic_trylock(struct drm_device *dev, unsigned long *flags)
>> +{
>> +	return raw_spin_trylock_irqsave(&dev->mode_config.panic_lock, *flags);
>> +}
> 
> [...]
> 
>> +static inline unsigned long drm_panic_lock(struct drm_device *dev)
>> +{
>> +	unsigned long flags;
>> +
>> +	raw_spin_lock_irqsave(&dev->mode_config.panic_lock, flags);
>> +	return flags;
>> +}
> 
> I find it a bit strange that @flags is passed as an argument in the
> trylock variant but returned in the lock variant. I would pass it as an
> argument in both variants. Just a suggestion.

Or maybe I can do it as a macro instead of a static inline function, to 
have the same semantic as raw_spin_lock_irqsave() which modify the 
flags, without passing it as pointer, because it's also a macro.

https://elixir.bootlin.com/linux/latest/source/include/linux/spinlock.h#L296

#define drm_panic_lock(dev, flags) \
raw_spin_lock_irqsave(&dev->mode_config.panic_lock, flags);

> 
> John Ogness
> 

-- 

Jocelyn


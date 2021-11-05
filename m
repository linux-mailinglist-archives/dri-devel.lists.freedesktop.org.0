Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 994374461BC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 10:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004376E115;
	Fri,  5 Nov 2021 09:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5287C6E116
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636106144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oZ67s9sbnfsD5fqdtGG0nGBmSdAaIG5RWNWBFufx9E8=;
 b=TkztJmfb0Z4d5Q7UrtQL+DyWHuqpVNqfrdsLFZ+WiVfpGFPuMhNLrJ6F0nv5PsMlaarAZb
 Vygb0wLA0cRBG+/tiSf4jFiiLaL74ejFHMHrXXXujjjbzKMNx7ZJmLQBW7khPh6LFcMIPc
 JR7ikaxBoCVEu4dcI2OiMs+xAg75I6U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-si4hae0xM6mAhW1Yp4pQ5w-1; Fri, 05 Nov 2021 05:55:43 -0400
X-MC-Unique: si4hae0xM6mAhW1Yp4pQ5w-1
Received: by mail-wm1-f71.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso5474163wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 02:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oZ67s9sbnfsD5fqdtGG0nGBmSdAaIG5RWNWBFufx9E8=;
 b=P0pJZ9A1AG8xEN4jgsE4DTqU5pYbDND4MTDNKTvFKiRQKujP4AnVxGBApscLJ51q8O
 46J9f9rFC5m/baMjLEOz7d1GQJvOWegapzYu15BT8z/XNrH2obIRRuFVG9i9N2WyGXmd
 Frsp3knYTuLDV4ZTnKje1aELzQpNMJhYv5USJDn+shZUaB+XCWM8B9PBlK1niL+2osJp
 2q8dH2vJWmQibBq6OtiJSbp8xAecNv32SKIERnnq3vp0YnDLbzWb/SqGONnKs9bLzcfq
 sG3P0H85GaNkIdwB/V0oaD6Nmfx40xrr0GuFm3hOAQymHn25iKOlYGxNjIwEJFKNdHFi
 RVuA==
X-Gm-Message-State: AOAM530IQ3NuxSzpPjR/8ENBPNy5SWfE1059YibeHDRhT4bBUlveuXHk
 CuN/bnsJaPD0wvDbUkIUjBwDncp7nniZgitoH2Zjd/uXhCB4aqkRVPbowT449/zMaskA9ZzFDHF
 xTYt6h7GjHueqSzYnxWy2UNvVmZ/f
X-Received: by 2002:a7b:c8d5:: with SMTP id f21mr27635766wml.146.1636106142131; 
 Fri, 05 Nov 2021 02:55:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyT8viACi1U7JY5S3rkG/MaHma60ZlmQ0NQODpS8eTcPcWv9ZvZPYhizNzNYarjDaHcIaJjnA==
X-Received: by 2002:a7b:c8d5:: with SMTP id f21mr27635740wml.146.1636106141897; 
 Fri, 05 Nov 2021 02:55:41 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id s26sm5390804wmc.0.2021.11.05.02.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 02:55:41 -0700 (PDT)
Message-ID: <847c2315-b4a2-3bd1-e048-4263b5f496ed@redhat.com>
Date: Fri, 5 Nov 2021 10:55:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/2] drm: Move nomodeset kernel parameter to the DRM
 subsystem
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-3-javierm@redhat.com>
 <f2c40b22-04bf-e8f2-9839-36d6d26189a1@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <f2c40b22-04bf-e8f2-9839-36d6d26189a1@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/5/21 10:00, Thomas Zimmermann wrote:

[snip]

>> +
>> +static int __init disable_modeset(char *str)
>> +{
>> +	drm_nomodeset = true;
>> +
>> +	pr_warn("You have booted with nomodeset. This means your GPU drivers are DISABLED\n");
>> +	pr_warn("Any video related functionality will be severely degraded, and you may not even be able to suspend the system properly\n");
>> +	pr_warn("Unless you actually understand what nomodeset does, you should reboot without enabling it\n");
> 
> I'd update this text to be less sensational.
>

This is indeed quite sensational. But think we can do it as a follow-up patch.

Since we will have to stick with nomodeset for backward compatibility, I was
planning to add documentation to explain what this parameter is about and what
is the actual effect of setting it.

So I think we can change this as a part of that patch-set.
 
>> +
>> +	return 1;
>> +}
>> +
>> +/* Disable kernel modesetting */
>> +__setup("nomodeset", disable_modeset);
>> diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
>> index 45cb3e540eff..c890c1ca20c4 100644
>> --- a/drivers/gpu/drm/i915/i915_module.c
>> +++ b/drivers/gpu/drm/i915/i915_module.c
>> @@ -4,8 +4,6 @@
>>    * Copyright © 2021 Intel Corporation
>>    */
>>   
>> -#include <linux/console.h>
>> -
>
> These changes should be in patch 1?
>

Yes, I forgot to move these when changed the order of the patches.

Best regards, -- 
Javier Martinez Canillas
Linux Engineering
Red Hat


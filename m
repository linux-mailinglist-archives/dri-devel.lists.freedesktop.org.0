Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC8044576A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 17:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79280732F2;
	Thu,  4 Nov 2021 16:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162FB732F2
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636044253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GBeSNSo+VR936LBuXFto2HVzfx/uW1FgtYIk1y3q3ig=;
 b=CBVY3wAoy78upQNbKAT1HVlHDBpW4oEl0NbOHqlw8hz+XAM45IIsqMx9wT6FBTHERDHg6I
 h207V7GgFIdF5o0vj424y1hfbUtdxmpIm3EE1+0uJwpm1eT+0mXEEd/T7hq/7E1t++v9zk
 HkSLJ2SgiK0VMUli6JbyzWmnaRWXtWQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-qMVwtRYNOXKiXi7RXZfa5g-1; Thu, 04 Nov 2021 12:44:12 -0400
X-MC-Unique: qMVwtRYNOXKiXi7RXZfa5g-1
Received: by mail-wm1-f71.google.com with SMTP id
 c1-20020a05600c0ac100b00322fcaa2bc7so2776689wmr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 09:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GBeSNSo+VR936LBuXFto2HVzfx/uW1FgtYIk1y3q3ig=;
 b=ldursHxyGYPUYliBapAe3PB5KPAPYKIsdIboPqFXh9NtLtCkWxIhcFp/PcpWChnR8Q
 c9hOrvC0BJrO4XuJtCLuGIfqz1m+3yG3sqbyD/yX2bMPcMKiZr84TzuxMAZ0LeZSw9rk
 PylB6rXcYm8I+7locCtBIQNYZwhyIGRrF41slNXLZcUUle8BlyW2V38sl1rvLkgNd6vr
 dzXQvayld2C76yH+dsG11opNrhJVsSI197UsEqwCn+UERczNUZOBfB4Fubs2Cp/fBrXv
 Dq71ZMwaSFVeKjnnlvqGtzwJpFrvU6sHHAHplNvvMFbGs0owFoHxSb8aWc0evFszE+vL
 JS0Q==
X-Gm-Message-State: AOAM533liUwj4Lghk+qWYuQWNgpmNXmzY4tDjrNJoZI7T4kfKGmXWJmw
 lLHJ//v5o1bx7/ARbGx1JH0L58LV2SUoT5hg0GongUWDAy/QYvRFBXhmAyv/hNdj6XHv0UltcDE
 Yd/dIctMiCYX0rg58zV+pl7cDkf7A
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr39525111wrt.224.1636044250775; 
 Thu, 04 Nov 2021 09:44:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnATpWRYfiqKo492+/czqTIzFCv7HIX437cz1EV9eI7R7UChO4l+utit2RLduHTmaqMKEFNQ==
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr39525075wrt.224.1636044250590; 
 Thu, 04 Nov 2021 09:44:10 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id o4sm6636216wry.80.2021.11.04.09.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 09:44:10 -0700 (PDT)
Message-ID: <3ff9fe95-9bc7-a043-78c6-d52d0ff02e23@redhat.com>
Date: Thu, 4 Nov 2021 17:44:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] drm: Add a drm_drv_enabled() to check if drivers
 should be enabled
To: Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-2-javierm@redhat.com> <87zgqjanz2.fsf@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <87zgqjanz2.fsf@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/4/21 17:24, Jani Nikula wrote:

[snip]

>> index ab2295dd4500..45cb3e540eff 100644
>> --- a/drivers/gpu/drm/i915/i915_module.c
>> +++ b/drivers/gpu/drm/i915/i915_module.c
>> @@ -18,9 +18,12 @@
>>  #include "i915_selftest.h"
>>  #include "i915_vma.h"
>>  
>> +static const struct drm_driver driver;
>> +
> 
> No, this makes absolutely no sense, and will also oops on nomodeset.
>

Ups, sorry about that. For some reason I thought that it was defined in
the same compilation unit, but I noticed now that it is in i915_drv.c.
 
> BR,
> Jani.
> 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat


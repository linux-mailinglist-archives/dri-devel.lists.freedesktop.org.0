Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD655E769B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 11:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A96810E7A5;
	Fri, 23 Sep 2022 09:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDD310E7A5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 09:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663924564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Ep2LcsdKEgsIs6aTOfGI5dO+1JAPu67k1k4S8GmmVo=;
 b=J0m8r+8OkwhhrQdomsRV1KSfjuAp0dPGN6VbaZ2mFo3Rg8NDYRFfjpqwsFcC5QSgAz+6qY
 CO49q5VtXJrprxIC6N5LNX51ULtdqVceKVUxfAsdYNiYXSwBROR0XtWcZul8MzjRLbUJdq
 m3XyFOkXS7eeykK4yj+CzP7Mt4TMMds=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-301-w0KLpq3rNrKQuL5Q4TRxyA-1; Fri, 23 Sep 2022 05:16:03 -0400
X-MC-Unique: w0KLpq3rNrKQuL5Q4TRxyA-1
Received: by mail-wm1-f69.google.com with SMTP id
 84-20020a1c0257000000b003b4be28d7e3so2458276wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 02:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+Ep2LcsdKEgsIs6aTOfGI5dO+1JAPu67k1k4S8GmmVo=;
 b=s48KxYXbwUOrDub8/agnLladp8IHlLQF/P6WefJBgsuqRCORmBl+U2V/hzVXfbtU9B
 cKOXhLmbppWrPmkjX5SRtGas0bjuZ/CcQn/pVO9j9uKdQKQX9b686PIeO35TO1LQBKe4
 xuIt9reEYa3WGbAMcF8q7zwK5lL0X/mgTCUcA5ZcxfxYC1K0uUBKa0mjT0bJ/F07kIPv
 hyTJ4Bb1hQ6aYX66XNCQ3uw6Tx9BuNtq5py1fl14yzVDFH0b28M83NSFlz666tp6U5Jv
 3/FCQdnYUSDDUqxHZU/QlUoSVWLqC8nKZ2mx3Qvbh+SplEUtl9BH3d7/u444B+EdPjti
 XzFw==
X-Gm-Message-State: ACrzQf3oJvl7+BSWBUUwB5XSR+V1ejhhrX2bCS9mzOhezbLEgrLX2xjG
 OVKMtEs/xQ8WwORIEF+RD4u6WXDxhtC5ko7DT9d6NlXGBJiEAr9VwboU0pdEBidEi/OhaDF00Ii
 kKUH689S9nYq7z2rfHyjbDJEhfJ/U
X-Received: by 2002:a05:6000:1446:b0:22b:968:446 with SMTP id
 v6-20020a056000144600b0022b09680446mr4404247wrx.493.1663924562122; 
 Fri, 23 Sep 2022 02:16:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7F3z+Gwjzc07MWPiMCmk12QqRaTKvW+HCfQ8Z5AVFjSyhCeNr6oTPhOMgxzk/EfvjW1wZMOA==
X-Received: by 2002:a05:6000:1446:b0:22b:968:446 with SMTP id
 v6-20020a056000144600b0022b09680446mr4404236wrx.493.1663924561935; 
 Fri, 23 Sep 2022 02:16:01 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff510000000b00228c375d81bsm7020309wro.2.2022.09.23.02.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 02:16:01 -0700 (PDT)
Message-ID: <7ccc4b30-0f85-6870-0c60-9897fdb374b9@redhat.com>
Date: Fri, 23 Sep 2022 11:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/ssd130x: Use drm_atomic_get_new_plane_state()
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220923083447.1679780-1-javierm@redhat.com>
 <Yy1271xW1SOlL41e@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yy1271xW1SOlL41e@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Ville,

On 9/23/22 11:05, Ville Syrjälä wrote:
> On Fri, Sep 23, 2022 at 10:34:47AM +0200, Javier Martinez Canillas wrote:
>> The struct drm_plane .state shouldn't be accessed directly but instead the
>> drm_atomic_get_new_plane_state() helper function should be used.
>>
>> This is based on a similar patch from Thomas Zimmermann for the simpledrm
>> driver. No functional changes.
>>
>> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>

Thanks.
 
> I wonder how many naked obj->state dereferences are still
> left in places where they should be using the get_{new,old}()
> stuff. Might have to write a bit of cocci to find out...
> 
> 
> Btw on a somewhat related note, I've been thinking about bringing
> for_each_crtc_in_state() & co. back (got removed in commit
> 77ac3b00b131 ("drm/atomic: Remove deprecated accessor macros"))
> but this time without any object state iterator variable. Now that
> we're more often just plumbing the full atomic state through I
> think there are bunch of places that don't need the object state(s)
> within the loop at all, so having to have those variables around
> makes the whole thing a bit noisy. Also IIRC we had to add some
> (void) casts into the current macros to hide some compiler warnings
> about unused variables. Could get rid of at least some of those extra
> casts again.
> 
> I don't suppose there's anyone interested in doing that so I don't
> have to? ;)
> 

Maybe you can add an entry in Documentation/gpu/todo.rst, explaining
this and putting yourself as a contact? 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


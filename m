Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AB24379B2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 17:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605506E5CA;
	Fri, 22 Oct 2021 15:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C483D6E5CA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 15:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634915780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGKg98798sR7hDdh2nqAXz7sKPnZ3GW7bRVI1o0f6mc=;
 b=TiiLhr7z6tQIozaSnIkVIOD14ZyhJ8th4VhVxup8Ez2WL2m+ajyKpOHS4zKixUMFWrBljx
 XpFSoUPJOY+oBWaNlTlNRZis4j3qDlZZIUckCUS4jxWhDsQhtQtI+tys+p0jtadROUNiPB
 c22hgWdexb4J+D1zEo4FrN2SKhCMgeo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-a2hkIWlAMw6G4opsOVfPQw-1; Fri, 22 Oct 2021 11:16:19 -0400
X-MC-Unique: a2hkIWlAMw6G4opsOVfPQw-1
Received: by mail-wr1-f71.google.com with SMTP id
 10-20020a5d47aa000000b001610cbda93dso1031885wrb.23
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 08:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pGKg98798sR7hDdh2nqAXz7sKPnZ3GW7bRVI1o0f6mc=;
 b=Boni1QnKKquIMgZjvj4vbQHVNG113Ggc5eOVMl6rbh3345E3n4jZAnAN59cY81iFZx
 cRsrX7DSpL7GKBK5PExo5UW0+o9unMeGzbUWuw3IcM3SzSGcfLxHWcAtGIiJf4HKro8t
 CExcJynEZ1tnVMijlawRjtXkJLOAHRk39m4hq5X3KOolBAY/5LXM0L3z6EuTs57JHCXp
 xBp7ib+gCD+XwPC/P4UW2RW5SAccVsF6AhoIE/P9Sn2pfV17ozo91yvW6mbC8V3zZrgs
 tL0snFF0Ux5iMv4wvuuOxwzEjxnG7YfFu+o7Hn0HhWauvki6x2GwlHMhsNnZSblZOble
 BnhA==
X-Gm-Message-State: AOAM5307UHauLBf/Ed/LUninywE85hR1ZO4+jWmIamvmLJUl9Umrz8Xs
 JlaqgQ4mVj4tIlvktuITYZTzPOHijqubo8RhNjl1do5dR67QPqYm6WpTAXQiokOQv3ferBN1vk9
 TgsyUXMRW4dqi8dr4R2qHEvuKaBiF
X-Received: by 2002:adf:fa8b:: with SMTP id h11mr627054wrr.74.1634915778357;
 Fri, 22 Oct 2021 08:16:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEKQAQpr7NQ++0cIjm/8luZl970ACFAB+piCj+X1eATgioaVsZPPinY4goUeNvEb0f2ZXSww==
X-Received: by 2002:adf:fa8b:: with SMTP id h11mr627019wrr.74.1634915778129;
 Fri, 22 Oct 2021 08:16:18 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id l20sm12942958wmq.42.2021.10.22.08.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 08:16:17 -0700 (PDT)
Message-ID: <352163b2-2946-aec8-16b4-fd6f01373ff2@redhat.com>
Date: Fri, 22 Oct 2021 17:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] drm/aperture: Add param to disable conflicting
 framebuffers removal
To: Neal Gompa <ngompa13@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
References: <20211022144040.3418284-1-javierm@redhat.com>
 <CAEg-Je_v0zvOs1dOZ3P0qsPDO7LC8xk0zxQBLH6gr65V82dnPA@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAEg-Je_v0zvOs1dOZ3P0qsPDO7LC8xk0zxQBLH6gr65V82dnPA@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Neal,

Thanks for your feedback.

On 10/22/21 16:56, Neal Gompa wrote:
> On Fri, Oct 22, 2021 at 10:40 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> The simpledrm driver allows to use the frame buffer that was set-up by the
>> firmware. This gives early video output before the platform DRM driver is
>> probed and takes over.
>>
>> But it would be useful to have a way to disable this take over by the real
>> DRM drivers. For example, there may be bugs in the DRM drivers that could
>> cause the display output to not work correctly.
>>
>> For those cases, it would be good to keep the simpledrm driver instead and
>> at least get a working display as set-up by the firmware.
>>
>> Let's add a drm.remove_fb boolean kernel command line parameter, that when
>> set to false will prevent the conflicting framebuffers to being removed.
>>
>> Since the drivers call drm_aperture_remove_conflicting_framebuffers() very
>> early in their probe callback, this will cause the drivers' probe to fail.
>>
>> Thanks to Neal Gompa for the suggestion and Thomas Zimmermann for the idea
>> on how this could be implemented.
>>
>> Suggested-by: Neal Gompa <ngompa13@gmail.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>> Hello,
>>
>> I'm sending this as an RFC because I wasn't sure about the correct name for
>> this module parameter, and also if 'remove_fb=0' is intitutive or instead a
>> parameter that's enabled is preferred (i.e: 'disable_fb_removal=1').
>>
> 
> In general, I think the patch is fine, but it might make sense to name
> the parameter after the *effect* rather than the *action*. That is,
> the effect of this option is that we don't probe and hand over to a
> more appropriate hardware DRM driver.
> 
> Since the effect (in DRM terms) is that we don't use platform DRM
> modules, perhaps we could name the option one of these:
> 
> * drm.noplatformdrv
> * drm.simpledrv
> * drm.force_simple
>

or maybe drm.disable_handover ? Naming is hard...
 
> I'm inclined to say we should use the drm.* namespace for the cmdline
> option because that makes it clear what subsystem it affects. The
> legacy "nomodeset" option kind of sucked because it didn't really tell
> you what that meant, and I'd rather not repeat that mistake.
>

Yes, agreed. In fact, that is the case for this patch since the param is
in the drm module. I just forgot to mention the namespace in the last
paragraph of the comment.

Best regards, -- 
Javier Martinez Canillas
Linux Engineering
Red Hat


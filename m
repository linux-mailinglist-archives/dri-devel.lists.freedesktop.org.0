Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921354ED446
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 08:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3995510FBBB;
	Thu, 31 Mar 2022 06:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C4910FBBB
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 06:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648709846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9PIynONmhibmMUqDB+lyC0sJ1jQrUoUs0UH+lulyj0=;
 b=ELUw1BgVnH8SkKnauEDtNXlkqFlo1jJw3GShz58dtEoOpYnZUVJMDWRTS4OQo4oT6TZjJs
 2RpyWpRm8Hqjx+KnY7yfAxv9K3+Zw2X7vlgdcvXTNmgW+iZQu/VxjKRglCBAqFtsEI5OqU
 ZTrXogyBhQToVXTy4NTMy8ItiiM7+qA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-p6ukx3XiPIWwIO-XtUsd9g-1; Thu, 31 Mar 2022 02:57:23 -0400
X-MC-Unique: p6ukx3XiPIWwIO-XtUsd9g-1
Received: by mail-wm1-f71.google.com with SMTP id
 9-20020a05600c240900b0038c99b98f6fso817930wmp.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 23:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z9PIynONmhibmMUqDB+lyC0sJ1jQrUoUs0UH+lulyj0=;
 b=hgSO5BhQkQh0vhaEi7bo0yhhykqQUt5dC7cgLQ5CWPdFaMCqpyWCXkfBz4cwQ3murs
 5YEcHQb38wZWzFa6dX7GAvYXC+dDb9brICK+j5qOwmJWU+ASiZL8bi7RRgtkO+78K4sz
 asUTslUYebtPKI1YsR9huJgO1Fvk6taktiq+48/aKseu6aXd8UxQt7ez8KvHt4k6aEU+
 L5DjS6hWuNT6FtSwuKkIFNazD++joyi+onFOcunowJNIxxQJCaiwqoByiuR29bnDah2X
 mzyIrvDqEqGA3Tjba6DHiPUTbYo3Dd+BDrdAfvrdZAJg0tDgFyouwJzVfbZ0iClvZ5Yn
 Kn3w==
X-Gm-Message-State: AOAM5315gfESEfZQeh8IsWm4Aa1LbFyYAIN2QqJAHB9EG9SUxSJk9YOW
 xLNsLJc9fkeajkoa5yP6uiZ8LvVaY+JIKkQjNiJgkjetlxAilWuHinahl6RlbeJJNEvbnJfEcZb
 Y/vp5ahDlfJDAoyhQQbD9nNQpCCY6
X-Received: by 2002:adf:d1cf:0:b0:204:12b6:9f5 with SMTP id
 b15-20020adfd1cf000000b0020412b609f5mr2903624wrd.249.1648709842273; 
 Wed, 30 Mar 2022 23:57:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy7rSwVd1FKfhLKAbCvGLnW7B5dWLo+Sqa6uGFqRv35Htih2JQuY+kM8jKiTRZ/ssAZqN/Zw==
X-Received: by 2002:adf:d1cf:0:b0:204:12b6:9f5 with SMTP id
 b15-20020adfd1cf000000b0020412b609f5mr2903606wrd.249.1648709841987; 
 Wed, 30 Mar 2022 23:57:21 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a1ced03000000b0038ce57d28a1sm6399833wmh.26.2022.03.30.23.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 23:57:21 -0700 (PDT)
Message-ID: <5ec4c23a-a326-23f8-b496-3e75b39ba951@redhat.com>
Date: Thu, 31 Mar 2022 08:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/8] drm/display: Introduce a DRM display-helper module
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-4-tzimmermann@suse.de>
 <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>
 <729dbf70-885f-bbe4-98ea-48e6e1b7304d@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <729dbf70-885f-bbe4-98ea-48e6e1b7304d@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 3/30/22 12:32, Thomas Zimmermann wrote:
> Hi
> 

[snip]

>>>   
>>> -obj-$(CONFIG_DRM_DP_HELPER) += drm_dp_helper.o
>>> +obj-$(CONFIG_DRM_DISPLAY_HELPER) += drm_display_helper.o
>>
>> The drm_dp_helper.ko module has some parameters and this change will break
>> existing kernel cmdline that are using it:
>>
>> $ modinfo drivers/gpu/drm/dp/drm_dp_helper.ko | grep parm | cut -d : -f2
>>             drm_dp_cec_unregister_delay
>>             dp_aux_i2c_speed_khz
>>             dp_aux_i2c_transfer_size
>>
>> I don't know whether those are considered a kernel ABI or not though, and
>> some already changed when the DP helpers were moved from drm_kms_helper.ko
> 
> Good point. I'll mention it in the commit message andcheck the 
> documentation as well.
> 
> At least, no one complained when these functions moved from kms helpers 
> into dp helpers. Moving them again is unfortunate, but I hope that the 
> new library will stick.
>

I was just pointing out because honestly I didn't know what was the kernel
policy around changing kernel command line parameters. It seems that isn't
documented anywhere.

But since no one complained when these were moved from drm_kms_helper.ko
and the current drm_dp_helper.ko is so recent, I would say that's fine.

If you re-spin feel free to add,

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
 
> I somehow expected that HDMI, HDCP et al would require their own 
> libraries.  But introducing several new and tiny kernel modules for such 
> small helpers wasn't worth it. Hence, there's the display library that 
> can collect all such helpers in a single place.
>

Yes, I agree with your approach to have all helpers into a single module.
 
> It looks like MIPI DSI could be another candidate to be moved into the 
> display library; at least partially. I have go through the codebase to 
> see if there are drivers that would benefit from such a change.
> 

Great.

> Best regards
> Thomas
> 
>>
> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


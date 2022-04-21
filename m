Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B440A509FF7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 14:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690F410E3D4;
	Thu, 21 Apr 2022 12:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8BC10E251
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 12:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650545270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TnOf3NHeZTSr4cEYbvvix37pw/apJI2q+GJ3+PP81w0=;
 b=adeGPANgsejNeCirqbYaCpwDV7+aiUoGLVQRuZu8oJW0OMimCRCyUDSLPq7Bbaoimt17HY
 0WRRzr7NDg/qGC6sSpwebf/GQuuynV6gvFLuXkEtq6SYXOP9zgM9nUo8BWr/bT4rKxbGGs
 k/3ipA5IyXEIc05/T+qzuhyey25WvRA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-Mh1xZkMTNaerx5Dr-IVxCw-1; Thu, 21 Apr 2022 08:47:48 -0400
X-MC-Unique: Mh1xZkMTNaerx5Dr-IVxCw-1
Received: by mail-wm1-f69.google.com with SMTP id
 t187-20020a1c46c4000000b0038ebc45dbfcso2328619wma.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 05:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TnOf3NHeZTSr4cEYbvvix37pw/apJI2q+GJ3+PP81w0=;
 b=Ox0RK+DwcfKSEKmoOFwJnoDOyShvN2UF8e+qBHvxh9NodanA9w8fYQDWejax8VSizq
 QeSenqR+AzXDcWCvFNnru04kLmyWsv9hYB0SIZD7dvlnjcuyecs1KTADk4mXVqBvcyaH
 Ckik27xbNgSlAtJyIYrM1eKIcxbjMIMv8bPZCnFNRSiv7tgcgZggvVLH5qnpA760mdu3
 R/awBGR3OVKf7mEfup+llyvGQhIG7xW/izzcwMVnx92cR071fqccDnDAcXWcIlVw9b1t
 G2TzHgQWGAAnBSESr/h/+06SQ9DKSGSlZ8ojkBOfVCznqC5UXR7ARM4p+ddPdJZq1Mk6
 x1cg==
X-Gm-Message-State: AOAM5333HCPkv6/TFVWf0nUZck/dC+4oZnbbMJMbYRk4wLQFfxl9x/0y
 ntXOf6bqFVmF4IFZwVfvUlry9x9m5HrPHolfUgsk9jVHMaqDV9OSiQzpCN6n6ZEEFnlUsKZn2Z4
 xEC4O+7N8J+c8Fm/65WrMYX2BDwAb
X-Received: by 2002:adf:9581:0:b0:1ed:c341:4ed1 with SMTP id
 p1-20020adf9581000000b001edc3414ed1mr18446932wrp.299.1650545267313; 
 Thu, 21 Apr 2022 05:47:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwM7PKieGr1IEXIphps56gblQ+HazfGrEHkPNWi6ZMSTtd09VlmmzSO/ZCY16iuoKF1G1KUhw==
X-Received: by 2002:adf:9581:0:b0:1ed:c341:4ed1 with SMTP id
 p1-20020adf9581000000b001edc3414ed1mr18446919wrp.299.1650545267042; 
 Thu, 21 Apr 2022 05:47:47 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a05600c34d200b0038ed14b7ac3sm1955281wmq.40.2022.04.21.05.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 05:47:46 -0700 (PDT)
Message-ID: <dce29330-e40c-860e-2c72-7ddebdd96e20@redhat.com>
Date: Thu, 21 Apr 2022 14:47:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <b3f7e288-3341-8c6f-1b95-e553ac5ebc35@suse.de>
 <CAMeQTsbh-Fy4CORBTX=AfZ+K-fZYUQ=hY=ctLFyu9KcJ5NgFUA@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMeQTsbh-Fy4CORBTX=AfZ+K-fZYUQ=hY=ctLFyu9KcJ5NgFUA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, James Hilliard <james.hilliard1@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Patrik,

On 4/21/22 14:39, Patrik Jakobsson wrote:
> On Thu, Apr 21, 2022 at 1:49 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>
>> Hi
>>
>> Am 09.04.22 um 06:23 schrieb James Hilliard:
>>> Select the efi framebuffer if efi is enabled.
>>>
>>> This appears to be needed for video output to function correctly.
>>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>> ---
>>> Changes v2 -> v3:
>>>    - select EFI_FB instead of depending on it
>>> Changes v1 -> v2:
>>>    - use depends instead of select
>>> ---
>>>   drivers/gpu/drm/gma500/Kconfig | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
>>> index 0cff20265f97..a422fa84d53b 100644
>>> --- a/drivers/gpu/drm/gma500/Kconfig
>>> +++ b/drivers/gpu/drm/gma500/Kconfig
>>> @@ -2,11 +2,13 @@
>>>   config DRM_GMA500
>>>       tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
>>>       depends on DRM && PCI && X86 && MMU
>>> +     depends on FB
>>
>> Why do we need FB here? Framebuffer support should be hidden by DRM's
>> fbdev helpers.
> 
> It is not needed but gives him video output since it enables the drm
> fbdev emulation.
>

I'm not sure to understand this. Shouldn't depend on DRM_FBDEV_EMULATION then?
 
> I looked some more at the logs and it seems weston doesn't work on his
> system without the fbdev backend. So the question is why weston isn't
> working without fbdev? Perhaps this is just a Weston configuration
> issue?
> 

But is weston using the fbdev emulated by DRM or the one registered by
efifb? I thought that the latter from what was mentioned in this thread.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


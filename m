Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B84498188
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 14:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070CA10E2D0;
	Mon, 24 Jan 2022 13:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A51B10E18B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 13:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643032609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YSqLQTi0kpug+gxLseY0EO7WdkGc2b3LlDQDn6WfK9k=;
 b=R6XP12qv4pk3MQnZXLoGx72kqdigQ3CAY+b+dTZb4qY6V47ro7yU/R9edHWVz6z+dK3c/M
 hmIRkBhrZXHpjD1LtJSSbh23097DwNE79ivOtYjB6Zcs++fNZ2f25Qn7D2/V/vXQVkEJAr
 Z9d55qJl5NVszGCNdK3Hp9zzWy4/Vfw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-MVLOBLx8PmiD65hOxCZP_g-1; Mon, 24 Jan 2022 08:56:48 -0500
X-MC-Unique: MVLOBLx8PmiD65hOxCZP_g-1
Received: by mail-wr1-f70.google.com with SMTP id
 t19-20020adf97d3000000b001d7564e4b37so1902047wrb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 05:56:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=YSqLQTi0kpug+gxLseY0EO7WdkGc2b3LlDQDn6WfK9k=;
 b=m3TJ4XLDN7rcSjkTkmhaADcIkPMnJWvsEnlji0Ew/wyZmloJZcgFseGyELsJGWgl0S
 qprar7Yb11K3acjwkZ+iG08inbz3l+BBQuO1Tr7SIJOz/GFNU+jVTZWLdzWTe7ies+iX
 e3y3+HopVXioAp7zR05C8HhDrMUsqhfZv0izHVacevKUHAcLVttZ31sDhNGh3tC4Bv5O
 nykbAeLORzyFProjM4Wm69lrHpyT1hI00doCqKmQGD32z917l0L7HGQaT3Bta2Jnjwdu
 EerAMipfNOZrDx1MhtSuLuE6ohvYkznXJ8ZJku3b6hilfJQ0KRDGGjuEr3mRbU67sl8S
 0Kxw==
X-Gm-Message-State: AOAM5309cGqv3+uGAPY9UKFIQQUh5QA7PYO68mFKUYtDmEoV6bUkh9Ry
 xShozlZy7YZXtAF76uHi0h0PG4zly8JYeKZxhlZpzm4RtFgyVbho/OD4DXoDHj9zVIpUiOoOnSJ
 7wd6mtk4a2osIeXCqpn4Ln9UejZDE
X-Received: by 2002:a5d:61c6:: with SMTP id q6mr7199319wrv.667.1643032606857; 
 Mon, 24 Jan 2022 05:56:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypkYfrulJD9zvGIs/3jSlnpWz+2/2XmXFRuwYQuHQ2tcE8GsQEKRgQ0vh9JaRMpuCjkZXoOA==
X-Received: by 2002:a5d:61c6:: with SMTP id q6mr7199304wrv.667.1643032606631; 
 Mon, 24 Jan 2022 05:56:46 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id l13sm20189582wmq.22.2022.01.24.05.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 05:56:46 -0800 (PST)
Message-ID: <b88309c2-7c22-3bcb-3f37-ade3e7d89617@redhat.com>
Date: Mon, 24 Jan 2022 14:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/5] fbdev: Hot-unplug firmware fb devices on forced
 removal
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, zackr@vmware.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, hdegoede@redhat.com
References: <20220124123659.4692-1-tzimmermann@suse.de>
 <20220124123659.4692-2-tzimmermann@suse.de>
 <508e6735-d5f0-610c-d4ca-b1abc093f63c@redhat.com>
In-Reply-To: <508e6735-d5f0-610c-d4ca-b1abc093f63c@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/22 14:52, Javier Martinez Canillas wrote:

[snip]

>> @@ -1898,9 +1917,13 @@ EXPORT_SYMBOL(register_framebuffer);
>>  void
>>  unregister_framebuffer(struct fb_info *fb_info)
>>  {
>> -	mutex_lock(&registration_lock);
>> +	bool forced_out = fb_info->forced_out;
>> +
>> +	if (!forced_out)
>> +		mutex_lock(&registration_lock);
>>  	do_unregister_framebuffer(fb_info);
>> -	mutex_unlock(&registration_lock);
>> +	if (!forced_out)
>> +		mutex_unlock(&registration_lock);
>>  }
> 
> I'm not sure to follow the logic here. The forced_out bool is set when the
> platform device is unregistered in do_remove_conflicting_framebuffers(),
> but shouldn't the struct platform_driver .remove callback be executed even
> in this case ?
> 
> That is, the platform_device_unregister() will trigger the call to the
> .remove callback that in turn will call unregister_framebuffer().
> 
> Shouldn't we always hold the mutex when calling do_unregister_framebuffer() ?
> 

Scratch that, I got it now. That's exactly the reason why you skip the
mutext_lock(). After adding the check for dev, feel free to add:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat


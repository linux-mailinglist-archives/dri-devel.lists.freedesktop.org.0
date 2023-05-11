Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0896FF2D3
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 15:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357BB10E0D1;
	Thu, 11 May 2023 13:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF9A10E0D1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 13:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683811870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNjSXYigSjFKy+QUeKCUEASx47pCMdyUi/tX4R1i/fw=;
 b=cwgFq8N8ee7zoxigcCVWoU6Cvrgyk0OTRm0acYZaE3CXTkVNB5zSldidznSIPn/G7otrc+
 zGTuK/QoD4FOSDavNcV7XIHVl4EgJSLvSjDnw+6D9d3AEGMZFEJVwxpdRim3ucJ2bsjGau
 s1teMiKKYClB1yxR6tRFkT1Y8KhXBzo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-MSdyodf3NmK1SFbjMnIbzA-1; Thu, 11 May 2023 09:31:08 -0400
X-MC-Unique: MSdyodf3NmK1SFbjMnIbzA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f42d18a079so17122485e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 06:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683811867; x=1686403867;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UNjSXYigSjFKy+QUeKCUEASx47pCMdyUi/tX4R1i/fw=;
 b=EQJ3ElKRWS9pEYl7pp8HStdxmp1qzloVprYBBimybtKU/7tFuzEG2aIkdBN7WsCpkD
 Vh1H1iX9duDF1tQeRPh+OIEZ2vEg3rj02FThIrEl1QSbmc3Ma16oOndB+dDvvdusmQjj
 z9P3Ale9kD0W7AUdmorsQXVBrakMK4xMeTq1G87lXgo22OqooD0fXHqHuKpg6qH2xIFN
 wo2A5FW13zKUehN72PcKCCi845x10g62T5jRgsfF0EAmWPytdNFSJSTBR7jMeQAzmtPf
 DfsZ+9A3yI6cOaTLYb0d/OpXsZtIkLbYJR0GiKpjr1jpijMq6hw3iJVW95hGOCv5ARJE
 dgrw==
X-Gm-Message-State: AC+VfDyRh6vSSwzAbuM9vA+dyEXjytybjfsxUsymzEHfE5ldi7GqpCmk
 w7QYRkq6G/ME/Q/Ht+yIyLA0UtUK1Kr+Q7eraLq0eELKsPRQ0UQKKTFV8R623AdfTGKe81aqMpc
 pwAQWI/9d+a1pphwRVhEgqk8BFs2v
X-Received: by 2002:a1c:f715:0:b0:3f1:661e:4686 with SMTP id
 v21-20020a1cf715000000b003f1661e4686mr16029358wmh.7.1683811867015; 
 Thu, 11 May 2023 06:31:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7L9to6DXGbiJOc7XWLzmBnCCDcfKe7PVBm5u+458DsvZQv52Cv7TLitHiLYrOTKBgMtsdHNg==
X-Received: by 2002:a1c:f715:0:b0:3f1:661e:4686 with SMTP id
 v21-20020a1cf715000000b003f1661e4686mr16029337wmh.7.1683811866731; 
 Thu, 11 May 2023 06:31:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a7bc014000000b003ef64affec7sm25670321wmb.22.2023.05.11.06.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 06:31:06 -0700 (PDT)
Message-ID: <761364fc-7e21-581d-4fd4-d81cd27bd4b1@redhat.com>
Date: Thu, 11 May 2023 15:31:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] drm/mgag200: Fix gamma lut not initialized.
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
References: <20230510131034.284078-1-jfalempe@redhat.com>
 <3cdf3215-99ac-5000-1911-28639c4e6248@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <3cdf3215-99ac-5000-1911-28639c4e6248@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Phil Oester <kernel@linuxace.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2023 14:26, Thomas Zimmermann wrote:
> Hi
> 
> Am 10.05.23 um 15:10 schrieb Jocelyn Falempe:
>> When mgag200 switched from simple KMS to regular atomic helpers,
>> the initialization of the gamma settings was lost.
>> This leads to a black screen, if the bios/uefi doesn't use the same
>> pixel color depth.
>>
>> v2: rebase on top of drm-misc-fixes, and add Cc stable tag.
> 
> Looks good. Please add the patch to drm-misc-fixes.
Applied to drm-misc-fixes

Thanks

-- 

Jocelyn
> 
> Best regards
> Thomas
> 
>>
>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2171155
>> Fixes: 1baf9127c482 ("drm/mgag200: Replace simple-KMS with regular 
>> atomic helpers")
>> Cc: <stable@vger.kernel.org>
>> Tested-by: Phil Oester <kernel@linuxace.com>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_mode.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c 
>> b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> index 0a5aaf78172a..576c4c838a33 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -640,6 +640,11 @@ void mgag200_crtc_helper_atomic_enable(struct 
>> drm_crtc *crtc, struct drm_atomic_
>>       if (funcs->pixpllc_atomic_update)
>>           funcs->pixpllc_atomic_update(crtc, old_state);
>> +    if (crtc_state->gamma_lut)
>> +        mgag200_crtc_set_gamma(mdev, format, 
>> crtc_state->gamma_lut->data);
>> +    else
>> +        mgag200_crtc_set_gamma_linear(mdev, format);
>> +
>>       mgag200_enable_display(mdev);
>>       if (funcs->enable_vidrst)
>>
>> base-commit: a26cc2934331b57b5a7164bff344f0a2ec245fc0
> 


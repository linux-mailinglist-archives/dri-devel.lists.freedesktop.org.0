Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CACDD5FD72B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B68D10E6B1;
	Thu, 13 Oct 2022 09:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6410F10E6B1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665653846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rsi4Lk+z8q8AtuKdvp61jTbjG2RLIicZfW+0rKzKJto=;
 b=Ba3eKyU77y+atwCMwqCUeespGd8o7sEMASwnixespa+WHprCMs7uUyzUrXWJJWqFtTsGfZ
 MW6bV79YB2JqTmjPlffQ4OPtpbVD2POYu9vBtHRGehqXFFyNupQiI2Dm5y2TBNlKr67TRo
 CzKm0iT5+I6yfXe1FHd9wpqGBZsLOas=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-298-7lO6eAvDN6-cFxGW9Y-22Q-1; Thu, 13 Oct 2022 05:37:25 -0400
X-MC-Unique: 7lO6eAvDN6-cFxGW9Y-22Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 k22-20020a05600c0b5600b003c6cf5c5592so595351wmr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 02:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rsi4Lk+z8q8AtuKdvp61jTbjG2RLIicZfW+0rKzKJto=;
 b=btNSa6NyD2pRtTswwd/T+3YzzvRC6Jk6haatp+rW4ApyhSpRPx2c0p5btOlbXJXdzv
 8trMmt1dxV2Gl3B7kPwkv0yJTPk3eEtHntejUl/b644f1TvfieWUweiWfdtCO1fzaT5h
 U4c2d17me799bDRmjV7YtiFdqiF8tz7UQKqfhfN0c0SpvMuXJfQmhkAXJ/+3Hw2TS2M+
 Ark66sEgInU49/fgFRSswlQ1YH+xQ7+2OXSk7H+DdNugeSXccOaaq929NpdBDBTp9uGS
 mGdpeU6BcmDrEusIm0HSC/mtAnB11/KEWGg2TAggY7iE/fKOisrol0G86qGkrc7DBpyc
 ChBQ==
X-Gm-Message-State: ACrzQf03dupDcVR3uoUlRYhSSWHRD4zfqeRbOjzaNET2scxiufF0Dz7C
 Tcq11avQYKzvfMr5cucvb71g+Q5EWkQoemDfyD45moEZofU23XESce+t+q2kYoDodXG2tvWm2Tn
 xow8TGSQGq40R0nIjMokNakBCO/ZJ
X-Received: by 2002:adf:ef43:0:b0:22d:c507:dd48 with SMTP id
 c3-20020adfef43000000b0022dc507dd48mr20778864wrp.416.1665653844217; 
 Thu, 13 Oct 2022 02:37:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5XZ/j3MSgkJXocGL5tRASQ0I9DPMwtOk/wMQIV0LJQylec4FXcsib9VWlSeBD+v4nVY4ZQVw==
X-Received: by 2002:adf:ef43:0:b0:22d:c507:dd48 with SMTP id
 c3-20020adfef43000000b0022dc507dd48mr20778847wrp.416.1665653843992; 
 Thu, 13 Oct 2022 02:37:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:c13d:8f66:ffd1:f7f4?
 ([2a01:e0a:c:37e0:c13d:8f66:ffd1:f7f4])
 by smtp.gmail.com with ESMTPSA id
 bn13-20020a056000060d00b002286670bafasm1616877wrb.48.2022.10.13.02.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 02:37:23 -0700 (PDT)
Message-ID: <f2af0e1e-f4ed-ef4f-bad8-11e2dee132a7@redhat.com>
Date: Thu, 13 Oct 2022 11:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm/mgag200: Fix PLL setup for G200_SE_A rev >=4
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com
References: <20221013082901.471417-1-jfalempe@redhat.com>
 <db634341-da68-e8a6-1143-445f17262c63@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <db634341-da68-e8a6-1143-445f17262c63@suse.de>
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
Cc: michel@daenzer.net, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/10/2022 11:05, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.10.22 um 10:29 schrieb Jocelyn Falempe:
>> For G200_SE_A, PLL M setting is wrong, which leads to blank screen,
>> or "signal out of range" on VGA display.
>> previous code had "m |= 0x80" which was changed to
>> m |= ((pixpllcn & BIT(8)) >> 1);
>>
>> Tested on G200_SE_A rev 42
>>
>> This line of code was moved to another file with
>> commit 85397f6bc4ff ("drm/mgag200: Initialize each model in separate
>> function") but can be easily backported before this commit.
>>
>> Fixes: 2dd040946ecf ("drm/mgag200: Store values (not bits) in struct 
>> mgag200_pll_values")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_g200se.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200se.c
>> index be389ed91cbd..4ec035029b8b 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
>> @@ -284,7 +284,7 @@ static void 
>> mgag200_g200se_04_pixpllc_atomic_update(struct drm_crtc *crtc,
>>       pixpllcp = pixpllc->p - 1;
>>       pixpllcs = pixpllc->s;
>> -    xpixpllcm = pixpllcm | ((pixpllcn & BIT(8)) >> 1);
>> +    xpixpllcm = pixpllcm | BIT(7);
> 
> Thanks for figuring this out. G200SE apparently is special compared to 
> the other models. The old MGA docs only list this bit as <reserved>. 
> Really makes me wonder why this is different.

I think it might be because of the "clock * 2" trick for this model.
(so N parameter is half of what it should be, and doesn't have BIT(8) 
set). But I don't have the G200SE A specific hardware spec either.


> 
> Please write it as
> 
>    BIT(7) | pixpllcm
> 
> so that bit settings are ordered MSB-to-LSB and include a one-line 
> comment that says that G200SE needs to set this bit unconditionally.

Thanks, I will send a v2 shortly.

> 
> Best regards
> Thomas
> 
> 
> 
>>       xpixpllcn = pixpllcn;
>>       xpixpllcp = (pixpllcs << 3) | pixpllcp;
> 


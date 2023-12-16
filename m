Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4FC815D18
	for <lists+dri-devel@lfdr.de>; Sun, 17 Dec 2023 02:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CAE10E089;
	Sun, 17 Dec 2023 01:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE63110E089
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Dec 2023 01:48:10 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-33664cc674bso61341f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 17:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702777629; x=1703382429; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eWQ768EYZOxvcALHGE3+QsDGQTu32k76xRbkD7I2xc4=;
 b=YAf7Jw1qouW55kCw1I4quN0+1bB5FneDlZFZ4NhQ5wRidiWlGtLz6cjO5aKy1Lk6OK
 mYE2RKbW2u3YMnOiXY8Gf4tLG6/TZ89RXP1MM+c5dK+rKshd3xIdPgvjjsUUiRITNIxB
 KX6AbflHc0mlHrQOHx4OkJGBcyz5LWVMe6u97vNE+A9mb1Bn8xtOOQd90zneOyF5boJo
 yjPLTcz5gGVWr+/daHzti2Wf2QLJKhQsRv8oQUrYtUA9Tut7YciXIn7m41FQ6LC7M5Fk
 BqtmC5O7seR3M7aA91YvGHc3dugWJ1KlndMzexnLjAGySowLCAujdSEJmnYxsfmwJtch
 cwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702777629; x=1703382429;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eWQ768EYZOxvcALHGE3+QsDGQTu32k76xRbkD7I2xc4=;
 b=EBmfYyEpFooDGHA98rYy6MlfQQm1ZlNssxaOK+FbdsfJ/KS1sJUPZoaoKIOhu8d0T1
 3zm0sl+ffzj6LNsWv3ha3c3Ww1JjF+3k54XBcg+37GjLLG2CFLlQ+Uy3gf8Q1YRW4tsH
 +NzFgoe29a8kZHHpEPtPqi7EC2erckgmLbJOapCGZsmF2kQNTZnmu7mtaca4u2/mLOhZ
 uT5KK9z6hPWdJ1nIJQ+TSVHvp7bIHr6xNaT0Jllt72agBjj1HXYAEqawgcMbbRiybaqG
 gM+5CYV0AbhD/05v02kCRcqivZLl/ClwbqcMNg1DyGsWEWuKf9Hq/sdbLDp33u9gx41n
 W6dQ==
X-Gm-Message-State: AOJu0Yygsq4+c8ufDTvTJ66SoB2UPmehyiKEvJlUvkkVNixdQFYHt/Rl
 ZGVdN1LXDU3Hyzpwj9r1sJyzFqqIvyWvdg==
X-Google-Smtp-Source: AGHT+IFVUtVZMBPe1oVF3X+wn0VSZMz3Sgb/ENpi8qjCOD/ESvPSho/wESSfjDeZ8AMBXe/mFBQiXA==
X-Received: by 2002:a7b:c8d4:0:b0:40c:48fb:ea00 with SMTP id
 f20-20020a7bc8d4000000b0040c48fbea00mr5392408wml.194.1702768339592; 
 Sat, 16 Dec 2023 15:12:19 -0800 (PST)
Received: from ?IPV6:2a02:1810:a404:e700:259e:a1b4:62cb:af3d?
 (ptr-4x653mgnc6rxc3brvi5.18120a2.ip6.access.telenet.be.
 [2a02:1810:a404:e700:259e:a1b4:62cb:af3d])
 by smtp.gmail.com with ESMTPSA id
 fm14-20020a05600c0c0e00b00407b93d8085sm37599258wmb.27.2023.12.16.15.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Dec 2023 15:12:18 -0800 (PST)
Message-ID: <78ec36c9-5e87-4c83-bdbf-5680f6eaff4c@gmail.com>
Date: Sun, 17 Dec 2023 00:12:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tiny: print 'struct resource *' correctly
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, tzimmermann@suse.de
References: <20231015131100.331880-1-yussef.dalton@gmail.com>
 <35984b5f-d4f5-4d45-9e17-b41140ff78e0@infradead.org>
From: Yussef Dalton <yussef.dalton@gmail.com>
In-Reply-To: <35984b5f-d4f5-4d45-9e17-b41140ff78e0@infradead.org>
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/15/23 17:35, Randy Dunlap wrote:
> 
> 
> On 10/15/23 06:11, Yussef Dalton wrote:
>> Since format specifier %pr refers to a 'struct resource *', there is no
>> need to take the address of the 'res' variable since it is already of
>> type 'struct resource *'.
>>
>> Signed-off-by: Yussef Dalton <yussef.dalton@gmail.com>
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Thanks.
> 
>> ---
>>   drivers/gpu/drm/tiny/ofdrm.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
>> index 2d999a0facde..6372ab383747 100644
>> --- a/drivers/gpu/drm/tiny/ofdrm.c
>> +++ b/drivers/gpu/drm/tiny/ofdrm.c
>> @@ -1208,13 +1208,13 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
>>   
>>   	ret = devm_aperture_acquire_from_firmware(dev, fb_pgbase, fb_pgsize);
>>   	if (ret) {
>> -		drm_err(dev, "could not acquire memory range %pr: error %d\n", &res, ret);
>> +		drm_err(dev, "could not acquire memory range %pr: error %d\n", res, ret);
>>   		return ERR_PTR(ret);
>>   	}
>>   
>>   	mem = devm_request_mem_region(&pdev->dev, fb_pgbase, fb_pgsize, drv->name);
>>   	if (!mem) {
>> -		drm_warn(dev, "could not acquire memory region %pr\n", &res);
>> +		drm_warn(dev, "could not acquire memory region %pr\n", res);
>>   		return ERR_PTR(-ENOMEM);
>>   	}
>>   
> 

Hi,

Sorry for the bump, but is there any news on my patch?

Regards,

Yussef

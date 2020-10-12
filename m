Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19ED28B4C2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 14:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA70A6E05F;
	Mon, 12 Oct 2020 12:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FA06E05F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 12:41:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h7so19043188wre.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7qsjzm1PdrVyQaK0HRDkkd9q7lA4iohvL00P5MRKnSg=;
 b=uw6GGdA7EbUxqQtWmpmHkmdo77bsX4OqN6QUSs2//li3EjU/9ZsxaGKitxccKEsP4T
 VMYSHBh+BjSQf3sXB8nk1jgres5ZASOJ5DbG3WXKzTbtWeRVtT3LmTqvAZ/ni+hESWgu
 2VDZWodGOG3BKCUy0q0kmXKV0bHr493duCZORp7pjS9AgU/STo8h5n6YhbbeyPGqi0EB
 B5ApajJgKhlVr+CIiXOsTrRXlBhtn5E4j4r0GzWHe43heVI3suFC4iMucd1QEy+I0sCy
 rNDCrR4XS/IWTeIRVB1TWtJFcbKkaSqJgFFFRwCaw1tFTevcJUmVqjhuEZQ+GNt7NxBA
 wJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7qsjzm1PdrVyQaK0HRDkkd9q7lA4iohvL00P5MRKnSg=;
 b=mmBPdfWxkyeT0wlMJZqb5+Fqt6rwbe1R9a4mVVqFdHO4IHCBL0Kt5KjnywDAwUjLlw
 65ShfyrzXa0aHQbXL8Z1Bvhu9rCNoNV+DIckJCXDGQKsl1esbgTEj9y6XFNrGCtkq/CU
 p/ZNHIBM92Hj3hQoCKiJWipILuKTaLHYNnc8ZrEj99nCvbKzm/XyWOKd9sp8MSkPQ0c1
 XaavTZs3AHgmz06/5rAuyaewfR8TCQjnNdOeb0rptCPa8zK8fXHj4hIhJREodLDvsnd4
 xuMD//DnBrhuuvwQD1VB4ZL8LRZhcnqLQBlHapT0hPfDpHqx+OzcpzXQbsQGT+JpUUAy
 y0Tg==
X-Gm-Message-State: AOAM533In+O0ejgXw5FHDLa05cSZ6jI4FGb9KBxz6ChCLvjhLsvPhzoG
 A+OD82RpBt+hpEWy/D+3QpK+bg==
X-Google-Smtp-Source: ABdhPJw8zznPI1POKalReA7H9TEOdIiPdBz/JlPw5d2G4s7qpRna4FmrbgfQQzN1tK1GfnfN8sbARQ==
X-Received: by 2002:a5d:554b:: with SMTP id g11mr29948016wrw.370.1602506460417; 
 Mon, 12 Oct 2020 05:41:00 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:35de:80a8:f551:6aa3?
 ([2a01:e35:2ec0:82b0:35de:80a8:f551:6aa3])
 by smtp.gmail.com with ESMTPSA id a81sm25763847wmf.32.2020.10.12.05.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 05:40:59 -0700 (PDT)
Subject: Re: [PATCH 3/3] drm/vkms: fbdev emulation support
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <20201009232156.3916879-3-daniel.vetter@ffwll.ch>
 <20201012132452.1241297a@linux-uq9g>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <9ad2c6dd-9f3e-8b88-e013-dcb0e1fd8005@baylibre.com>
Date: Mon, 12 Oct 2020 14:40:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012132452.1241297a@linux-uq9g>
Content-Language: en-US
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/10/2020 13:24, Thomas Zimmermann wrote:
> Hi
> 
> On Sat, 10 Oct 2020 01:21:56 +0200 Daniel Vetter <daniel.vetter@ffwll.ch>
> wrote:
> 
>> Hooray for generic fbdev support, making this a oneliner. We just
>> needed to fix preferred_depth fixed and the vmap support added first.
>>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
>> Cc: Melissa Wen <melissa.srw@gmail.com>
>> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> ---
>>  drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
>> index 6221e5040264..cc09e2df5cb1 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.c
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
>> @@ -169,6 +169,8 @@ static int __init vkms_init(void)
>>  	if (ret)
>>  		goto out_devres;
>>  
>> +	drm_fbdev_generic_setup(&vkms_device->drm, 0);
>> +
> 
> It feels strange to have console support in a driver for non-interactive
> systems. But OK, why not. I guess it helps with testing?

It's weird because it the kernel is misconfigured and no console is specified on the cmdline
this console could become the main console...

It's a great feature, but couldn't this be a module parameter ?

Neil

> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Best regards
> Thomas
> 
>>  	return 0;
>>  
>>  out_devres:
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF5F758287
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 18:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E0010E0F0;
	Tue, 18 Jul 2023 16:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8D410E0F0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 16:51:53 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8deso61981555e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 09:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689699111; x=1692291111;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MN6YwH/Sg2GWW0btTszOmesTuh4cunm9Lg6HKMqqnCw=;
 b=egfysYxgLkUoEleL1gyoe/YSMlHqdSH48uaDD4e/3n+ywjtXgUQutVP+GXKZzMiku9
 SvXy2p5WOAoco6rrCaqJJp/Ik2oXBysd3Fs4clBrawSOPtl9y8elKKmU8+AhNwHGL6ne
 YC3F67N7Bu37kJBH/JYkH2DnzkznRTwAi1noYg3b2EyJ8KHMmltUKdqpcx3Ih3RJpMKy
 BjVJBu3V5HAP6Ge5mFZqDY8gcB3BRL+Rsbg+L0kTRQHNvFy9ypKUY3kaP//+QKpjVe5/
 YvbyKsyb/6xC1vC47PS4BTCmPBh+YS9BkuHrKnWoL2ehaBK8FJaFQTDZMhV9BqXs/GcT
 XsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689699111; x=1692291111;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MN6YwH/Sg2GWW0btTszOmesTuh4cunm9Lg6HKMqqnCw=;
 b=dIfCqzhNkk/Yb07tHKk6VluKhKSsge0wClrsNFr+Z93mStpjD2mURsspUfcIjq4vPU
 2hGiHRmU7qpYZtLOI7Fz0KFuHd1X/iKX8p2j0vWWTf09PnmSfCxvQuOg8Towf8d8C31l
 b6Ku7Sl7MuyEWdGPyA4q6oQ2qnqq2Pej0cgmU7HHTi4MnIsFCq3117MZ8qD37nNc0W3k
 snMb+EHC3EQMBUqTp/ZXSKh0fcpl8fbPGDWCoUpmfjHkofUxED5RXcJCa6pGpEcIuAHy
 G3SLTnvam45IOocuLnjvaFh5Fcto4tai0oo6Q0z74jJl+ZoLVZNjLjAnfSaB7AEclbG7
 vKbw==
X-Gm-Message-State: ABy/qLYW+FkI154Cq+NXQh7SFIy+W9b9QNNcf1zKlPsLfISpiegWGMvH
 uKR1p6bFFfDzSnQRTI97VzI=
X-Google-Smtp-Source: APBJJlHOFvWvbot+HP++JP3fT3TaaKdoAq2pAqKoUA88Vosh8ICwrFeGwoU1pwkBqV7ju6n7ny7FzQ==
X-Received: by 2002:a1c:6a0a:0:b0:3fa:aeac:e96c with SMTP id
 f10-20020a1c6a0a000000b003faaeace96cmr2796662wmc.9.1689699111032; 
 Tue, 18 Jul 2023 09:51:51 -0700 (PDT)
Received: from [192.168.70.38] ([37.174.75.194])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c261300b003fbb5506e54sm2568348wma.29.2023.07.18.09.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 09:51:49 -0700 (PDT)
Message-ID: <d3090a47-4bf9-4aef-34f4-6dc06198189b@gmail.com>
Date: Tue, 18 Jul 2023 18:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RESEND v2] staging: fbtft: ili9341: use macro
 FBTFT_REGISTER_SPI_DRIVER
Content-Language: en-US, fr
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230718081759.28902-1-rgallaispou@gmail.com>
 <2023071817-enslave-unlovable-f8ae@gregkh>
From: =?UTF-8?Q?Rapha=c3=abl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <2023071817-enslave-unlovable-f8ae@gregkh>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le 18/07/2023 à 15:33, Greg Kroah-Hartman a écrit :
> On Tue, Jul 18, 2023 at 10:17:59AM +0200, Raphael Gallais-Pou wrote:
>> Using FBTFT_REGISTER_DRIVER resolves to a NULL struct spi_device_id. This
>> ultimately causes a warning when the module probes. Fixes it.
>>
>> Changes in v2:
>> 	- dropped MODULE_ALIAS changes
>> 	- changed commit log for more accurate description
>>
>> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
>> ---
>>   drivers/staging/fbtft/fb_ili9341.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Why is this a resend? >
> And the changes need to go below the --- line as per the documentation.

I messed up the first send and forgot the changelog.
Thanks for your insights, I understand now that I shouldn't have sent a 
'RESEND', but rather a v3 with a third entry in the changelog.

Regards,
Raphaël
> 
> thanks,
> 
> greg k-h

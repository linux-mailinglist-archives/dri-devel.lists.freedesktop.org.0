Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6249C97E048
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 08:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04E010E057;
	Sun, 22 Sep 2024 06:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VmTXftXd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA1410E057
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 06:19:54 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2068acc8b98so31631495ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 23:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726985994; x=1727590794; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3xQ9V6HSaf4CAgLfVMwdW/11tmA/ZODg6WnRklyW9P8=;
 b=VmTXftXdBCAvbDAtmgD2T5YpiqzUjVHxrx/KXfzDYPX7jpoAM5VgPl61nQ5UfDJ2rS
 U1KO7Ur274V7ESKnObQUtFtH0Iosy+uxDBBqtmq7hJmZ0NPm8+BEsFWidVzLYNBZ5F3Z
 bans6Q4lNNwxgGLbPA6dsqgrrNFdIGXOLgcS6gFCaxFiJLgZ4SjcE662W5aNXpJlvev8
 511qKjfDDV6i4nc8sUwlGgCcrdRHa2+y2WyInKuFJBiYATb6XfWLVKdo/HWSdBQ+yv7k
 RWj67Zww9xfWw8usw4i9C4QJ3yBPdlevB4kRBRhmkFn7PeXkaVwLrGbfuUuVWRL2JLje
 IzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726985994; x=1727590794;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3xQ9V6HSaf4CAgLfVMwdW/11tmA/ZODg6WnRklyW9P8=;
 b=mmPixL931HLvXhFwV4K857jRQ6OQBVgv/CyO1vJJcBQRFMsQzYieKN/W3MwKXSpJ0b
 KfQ5ZDRbZWgnQkoYMVKWoC9WUXNjvtPS02najcD2F34DSH5O0MK2e3uHZLhsbJa8eDfs
 aVpkQaOvNWIpUGWCTL6OHOv+qgw9FZ7sV0wHdb1plCNPguoeESERzKGtCnT0OZ1wbgCI
 lk5ZiV+9JTDWMfSI/P3IfPnrfhc9fqjWb609aXYLFvXnhPeP9NwL6XGgQj/7v8/b2H9N
 SFnOgkYkdJu2ylU5ImiwajMItt1jot7y9eBwEQTiI5dUcWho3L2TNQUmCMVT0Au3Y7C2
 yBMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDb0LVl6/Qgpi1zWt1a1950BOlXzLGWcjVJ1AE+vJsHkgJeeiWY46hIybweTOYdMF7zHIGnVzBxbU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA6ES8K4eZdGW4hSC1ivaneR7i+R5wVpxPw6PrDVIaFz9GVLKt
 /KDQa3ZkrJyVX9XGgumQKNR9eLDB18geoKycOVfvi4+yFkEX2KXw
X-Google-Smtp-Source: AGHT+IHco0PIIsbh+MV6+539AZjban0BxjLXSZCarpWMLofXWVD3xMzTIYoyBh0YTzpmrUpdjtCTNg==
X-Received: by 2002:a17:903:191:b0:207:1913:8bae with SMTP id
 d9443c01a7336-208d8397c1amr90751845ad.14.1726985993913; 
 Sat, 21 Sep 2024 23:19:53 -0700 (PDT)
Received: from [10.3.80.76] ([59.152.80.69]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20794730629sm116259225ad.247.2024.09.21.23.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Sep 2024 23:19:53 -0700 (PDT)
Message-ID: <d470e0ef-0193-478c-a858-d6498758aa9a@gmail.com>
Date: Sun, 22 Sep 2024 11:49:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: elida-kd35t133: transition to mipi_dsi wrapped
 functions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240917071710.1254520-1-tejasvipin76@gmail.com>
 <c3wv3r44cmua2hphyjqzb7pp2a32pvs6svcj6s2zohp77qn3cr@4iica7j5bx5l>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <c3wv3r44cmua2hphyjqzb7pp2a32pvs6svcj6s2zohp77qn3cr@4iica7j5bx5l>
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



On 9/20/24 9:59 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 17, 2024 at 12:47:10PM GMT, Tejas Vipin wrote:
>> Changes the elida-kd35t133 panel to use multi style functions for
>> improved error handling.
>>
>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>> ---
>>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 107 ++++++++-----------
>>  1 file changed, 45 insertions(+), 62 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
>> index 00791ea81e90..62abda9559e7 100644
>> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
>> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
>> @@ -135,25 +127,16 @@ static int kd35t133_prepare(struct drm_panel *panel)
>>  
>>  	msleep(20);
>>  
>> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>> -	if (ret < 0) {
>> -		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
>> -		goto disable_iovcc;
>> -	}
>> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>> +	mipi_dsi_msleep(&dsi_ctx, 250);
>>  
>> -	msleep(250);
>> +	kd35t133_init_sequence(&dsi_ctx);
>> +	if (!dsi_ctx.accum_err)
>> +		dev_dbg(ctx->dev, "Panel init sequence done\n");
>>  
>> -	ret = kd35t133_init_sequence(ctx);
>> -	if (ret < 0) {
>> -		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
>> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>> +	if (dsi_ctx.accum_err)
>>  		goto disable_iovcc;
>> -	}
> 
> Move this after the last mipi_dsi_msleep(), merge with the error
> handling.
> 
>> -
>> -	ret = mipi_dsi_dcs_set_display_on(dsi);
>> -	if (ret < 0) {
>> -		dev_err(ctx->dev, "Failed to set display on: %d\n", ret);
>> -		goto disable_iovcc;
>> -	}
>>  
>>  	msleep(50);
> 
> mipi_dsi_msleep()

Is this necessary though? Converting this msleep to mipi_dsi_msleep and
moving the previous dsi_ctx.accum_err check to below this seems
redundant. If the check is placed above msleep, then we need to only
check for the error once. If its placed below mipi_dsi_msleep, we end up
checking for the error twice (once as written in the code, once in the
code generated by the macro) which is unnecessary.

-- 
Tejas Vipin

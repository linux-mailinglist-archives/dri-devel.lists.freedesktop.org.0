Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DE870E751
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 23:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D843810E0D9;
	Tue, 23 May 2023 21:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B8410E0D9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 21:26:04 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-510d8d7f8eeso722648a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 14:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684877162; x=1687469162;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1PgxNHZj4UwDTS6F97+9NYcBDmjYn8Q7KCM1kPowz7w=;
 b=rdkjx024S826zFQkHayX4XQWkfaqCgEmXWLe2SH+kJRaGjunBCKBHxzmBUuOT4HqoA
 GhpyD5VgYelYdOaNGRjM3P4w8UyNnMGeNePUUNGw8lI4L59i+5eskWGOPrigjf21tqkz
 tGgr3RNsmuT5JK1woaEp46lIyPnyCGbi5HGZ52bnlwbofyF/X/doqeCA0wNfrEvxHAof
 JXJHwSRrvv3u4Uesne2HIYtSEOhQhRfigviWDRjbx1jntDN52TleN+32DKEK2EbEF4wz
 9UxmR16hwxUgTK6tNQMddtXkLT9Gq2+qFEzmJGweaoBDneFHkPXRug44XTsWEtKg+eMU
 FyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684877162; x=1687469162;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1PgxNHZj4UwDTS6F97+9NYcBDmjYn8Q7KCM1kPowz7w=;
 b=HDRqz3szMChKz0cesAVpHG3fjhdZTNZgu3ybI3Z56KrnlW8U52sqztyccHdCLhST9x
 EmQn4OY9OHbhHryT/hddXL27z6IpOog6egtHsny0gwECMd62YnL/i+L847y32NbR4VVR
 llpUJLBCpJz+/0zoeN2LE1z6+RUOctvpxfLeh89e7boozofdOlQuY+iVP+y8uhy3myJ0
 0I5sqq4NpMavwbuyNTsSkYbWP0zEiuubO6c50FIDtpopQJKNITbGaZtXIv+9Pf7YzZEP
 kmxdxcZtZCp2CMVcI3zUxkTT0OTJ3yaE4KMmJjzKHyMMYfitaDqhpM2AkZGng+UYxpB1
 ALsA==
X-Gm-Message-State: AC+VfDyyi0mRiPyFWxMB1DKa0a1itAWePZ2a7N66KvJFGsFbGqiYKfDs
 2S2LhaPFvI7SnLM6fOPPND4=
X-Google-Smtp-Source: ACHHUZ65tHm0pxgScIUa0KaMsUX6v1DGtLyGO2CEmEvCmIHRx9ohEEp+ai4aBgw9Rti2j00nkuO3Zw==
X-Received: by 2002:aa7:c614:0:b0:510:d889:88c8 with SMTP id
 h20-20020aa7c614000000b00510d88988c8mr255307edq.38.1684877161960; 
 Tue, 23 May 2023 14:26:01 -0700 (PDT)
Received: from [192.168.50.244] (83.11.222.198.ipv4.supernova.orange.pl.
 [83.11.222.198]) by smtp.gmail.com with ESMTPSA id
 u17-20020aa7d891000000b0050bd19ec39bsm4364090edq.83.2023.05.23.14.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 14:26:01 -0700 (PDT)
Message-ID: <0c08fd7b-435c-67e9-f2a2-543a72cb3140@gmail.com>
Date: Tue, 23 May 2023 23:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5 2/3] drm/panel: Add Samsung S6D7AA0 panel controller
 driver
To: Nathan Chancellor <nathan@kernel.org>
References: <20230519170354.29610-1-aweber.kernel@gmail.com>
 <20230519170354.29610-3-aweber.kernel@gmail.com>
 <20230523180212.GA1401867@dev-arch.thelio-3990X>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20230523180212.GA1401867@dev-arch.thelio-3990X>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nikita Travkin <nikita@trvn.ru>, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 23/05/2023 20:02, Nathan Chancellor wrote:
> Hi Artur,
> 
> On Fri, May 19, 2023 at 07:03:53PM +0200, Artur Weber wrote:
>> Initial driver for S6D7AA0-controlled panels. Currently, the following
>> panels are supported:
>>
>>  - S6D7AA0-LSL080AL02 (Samsung Galaxy Tab 3 8.0)
>>  - S6D7AA0-LSL080AL03 (Samsung Galaxy Tab A 8.0 2015)
>>  - S6D7AA0-LTL101AT01 (Samsung Galaxy Tab A 9.7 2015)
>>
>> It should be possible to extend this driver to work with other panels
>> using this IC.
>>
>> Tested-by: Nikita Travkin <nikita@trvn.ru> #ltl101at01
>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> 
> <snip>
> 
> This change as commit 6810bb390282 ("drm/panel: Add Samsung S6D7AA0
> panel controller driver") in -next causes the following build errors
> with clang and GCC older than 8.x (the kernel supports back to GCC 5.1).
> 
> With clang:
> 
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:312:14: error: initializer element is not a compile-time constant
>           .drm_mode = s6d7aa0_lsl080al02_mode,
>                       ^~~~~~~~~~~~~~~~~~~~~~~
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:415:14: error: initializer element is not a compile-time constant
>           .drm_mode = s6d7aa0_lsl080al03_mode,
>                       ^~~~~~~~~~~~~~~~~~~~~~~
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:443:14: error: initializer element is not a compile-time constant
>           .drm_mode = s6d7aa0_ltl101at01_mode,
>                       ^~~~~~~~~~~~~~~~~~~~~~~
>   3 errors generated.
> 
> With GCC:
> 
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:312:14: error: initializer element is not constant
>     .drm_mode = s6d7aa0_lsl080al02_mode,
>                 ^~~~~~~~~~~~~~~~~~~~~~~
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:312:14: note: (near initialization for 's6d7aa0_lsl080al02_desc.drm_mode')
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:415:14: error: initializer element is not constant
>     .drm_mode = s6d7aa0_lsl080al03_mode,
>                 ^~~~~~~~~~~~~~~~~~~~~~~
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:415:14: note: (near initialization for 's6d7aa0_lsl080al03_desc.drm_mode')
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:443:14: error: initializer element is not constant
>     .drm_mode = s6d7aa0_ltl101at01_mode,
>                 ^~~~~~~~~~~~~~~~~~~~~~~
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:443:14: note: (near initialization for 's6d7aa0_ltl101at01_desc.drm_mode')
> 

I've submitted a patch, "drm/panel: samsung-s6d7aa0: use pointer for
drm_mode in panel desc struct"[1], which should fix this. I tested it
with GCC 13.1.1, GCC 6.4.0 and Clang 16.0.3, but I'd appreciate any
further testing and feedback.

Apologies for the error.

Best regards
Artur

[1] https://lore.kernel.org/all/20230523212050.9970-1-aweber.kernel@gmail.com/T/

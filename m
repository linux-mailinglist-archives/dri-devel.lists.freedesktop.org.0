Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9768C707BC0
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 10:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C0C10E084;
	Thu, 18 May 2023 08:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A2C10E107
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 08:29:33 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ac770a99e2so3773141fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 01:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684312171; x=1686904171;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=78En7bFX4DNtv99F1zZg+12j6HtDjxQe1ib/JrAoDvA=;
 b=XRWVX2p7cTvMHloNSe+15Ataagn9cyJxaJbHcp1PHe5lusUhd++9+4KqN18L63WreI
 LsKUM7V3TLcdcw1FFvPLFBso/oCe/gPHN7csTTO00yZwUSnF7OX7jFFtpG4oHZjgJeRC
 PDenRervF0VNz/jig6R5/JNNjOZftfHDMdWqTMvl9KIXXwpE9BPhvStHYSGftav/Ig+B
 eXMiE+IVmo6DAqWWdPsslhzMOK61hvsU3CU48ckIwE6DtkF0eGXewN23j7HoTa4HYJwN
 G4ysNzjk0nclpG5rFafu8gnwwGGIRcNDhcbWuFnXV/s+10G7kAcE6zcMAtwE6I8bJFbA
 Vumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684312171; x=1686904171;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=78En7bFX4DNtv99F1zZg+12j6HtDjxQe1ib/JrAoDvA=;
 b=Wvs+XQtp0irf+I0ROT4ejRVfvYl6ojHBIXrtPedLdScp0eN9cxDW/EtjffZnGCjmLV
 jbMo9XC6ZOtMsycSVapC7cHIWM1/7Cx7W7YSgtTd5qP5lkAE4CJtGXPUre2b25Uz5z5T
 hoYF2Y9Nj9yinneo27UyZipO/wLT0sowYUEQL+MQLIOPAOPRi6ZO1ddHKBf8SpdPlpSB
 I1CfqR/gARX5R6SKop+CeJi2rWA2BQo7SQ/WPJ3a/dQRwzgwafTznxC1+JMN/5V+/oXQ
 8y18Rk2kjnMy51GL0UOVkWucxfQXgl/lTz9Q/1pYi5NIyitAVt8iFqNfnUTu/9J/x7vQ
 hT8g==
X-Gm-Message-State: AC+VfDx1HbmqeWzvrafvJWkWn0UrmVNREFBZ/e9Slusd3vO4Hsd5wtEY
 /ifdcb+cnIy+nwBOkTbDeMs=
X-Google-Smtp-Source: ACHHUZ5oddWxcGwgp3BKJp1Lcs/+h6rsNvb+TshwjSOR4jrSPWEUTaWM1im/mPATuGuxQIyzaCF7Lg==
X-Received: by 2002:a2e:8244:0:b0:2ad:814c:6ad5 with SMTP id
 j4-20020a2e8244000000b002ad814c6ad5mr8045673ljh.46.1684312170872; 
 Wed, 17 May 2023 01:29:30 -0700 (PDT)
Received: from [10.8.28.198] ([89.201.166.50])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a2e9ec4000000b002a8c32fd2f3sm4515688ljk.89.2023.05.17.01.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 01:29:30 -0700 (PDT)
Message-ID: <356bfe96-75e6-1c6d-0049-d664e719a266@gmail.com>
Date: Wed, 17 May 2023 10:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] dt-bindings: display: panel: add panel-mipi-dsi-bringup
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com>
 <023f6cf9-0f08-f27e-d203-5ff78faf110f@linaro.org>
 <CAO9szn1EsbuPSRrOW8CLqhp+QUcL=9NE93FAwsg2n3htd_aJTw@mail.gmail.com>
 <97124cb1-4f45-22d5-418f-568f8a68deec@linaro.org>
From: Paulo Pavacic <pavacic.p@gmail.com>
In-Reply-To: <97124cb1-4f45-22d5-418f-568f8a68deec@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 18 May 2023 08:20:23 +0000
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

If I understood you correctly you'd prefer it to be named 
fannal,c3004.yaml? My logic is that if more panels were to be added that 
means that each one would have yaml files that would look exactly the 
same with the same user.

Best regards,

Paulo

On 5/17/23 09:03, Krzysztof Kozlowski wrote:
> On 17/05/2023 00:13, Paulo Pavacic wrote:
>> Hello, thank you for your time to review this patch and sorry for not
>> addressing all of the concerns, it was done unintentionally. This is
>> my first contribution to the Linux kernel and it is quite a process.
>> I have run those two scripts and haven't received any errors I have
>> latest master cloned so I will check what I did wrong.
>>
>> The thing I would like to get approval on before I try anything else
>> is the name 'panel-mipi-dsi-bringup':
>>
>>> Still wrong filename. You did not respond to my previous comments, so I
>> don't really understand what's this.
>>> Judging by compatible, this should be fannal,c3004.yaml
>>>
>>> If not, explain please.
>>>
>>> Missing user of the bindings - driver or DTS. Please sent patches together as patchset.
>>
>> I wasn't sure how to name it and this name seemed fit. I'm not sure
>> how to be concise about this, but here is the full story as to why I
>> have done that:
>>
>> I got a task to enable panel for which working driver wasn't
>> available. I have started testing raydium driver and modifying parts
>> of it until I got it working.
>> Driver was modified quite a lot, new functions, macros and structures
>> were added which resulted in a new driver.
>> Therefore I have made a simple driver which I have submitted for a
>> review which will probably be rejected now due tomany reasons I have
>> noticed after sending it:
>> https://lore.kernel.org/lkml/CAO9szn03msW6pu37Zws5EaFGL10rjp9ugPdCuDvOPuQRU72gVQ@mail.gmail.com/T/
>>
>> While talking with manufacturers of the panel I have figured out that
>> they aren't that familiar with the Linux kernel.
>> They had previously only enabled  it on bare metal (PLA?) and provided
>> me with the initialization sequences. Initialization sequences are hex
>> values sent over MIPI DSI to initialize panel controller.
>> Initialization sequences sometimes also require delays after certain
>> commands and for different panels it can be very different.
>> I believe I have simplified it so that someone can follow comments
>> inside of the driver and try to enable mipi dsi panel by copy pasting
>> initialization code from bare metal system and doing minor
>> modifications.
>> Since I have targeted this at people who need to enable their panels
>> for the first time name seemed okay. I thought that since there is
>> panel-simple.yml that panel-mipi-dsi-bringup.yml would be acceptable
>> name.
> Bindings are for hardware, not driver, so they describe the hardware panel.
>
> Best regards,
> Krzysztof
>

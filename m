Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D715573ADE9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 02:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97AA10E5CB;
	Fri, 23 Jun 2023 00:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA4A10E5CB
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 00:41:50 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f8689fbf59so1563289e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 17:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687480908; x=1690072908;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FnBlHYwMZ9lJep8bxCghDkQQW2uToj06bE3oV1fX/ZA=;
 b=EC5a6JU+v7Zbpm70kJjSs2tawiTV4zC1FWSIGTv0q4pPIyNEF4J46LsGErGMoe4k//
 eq9t2hdhkWWSR0jUXfxoOYQ7ca3VtFktY0RV9IUgzpF5eNIg0R0UsClKV5TcNu3gj7/p
 MGMs+8i2SmhYCo9qbK7Fgj4pMR2Pq1z/Cx/oCcftj95rtSttLAyPZhtmko7ez/TWCyMI
 kHY6+0AjnOsjDpyJDvfLxa9ISRJwlgUPHFi30u3WtEIrx+2W2gyHkIVkqAtoVELTeh6D
 siylrR8sLVRB0ZkXlGxY8XGLqfK//rhHEoCrKBv1xZr49+f/uGFAYxwhhfwUi2jU9/Z7
 i6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687480908; x=1690072908;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FnBlHYwMZ9lJep8bxCghDkQQW2uToj06bE3oV1fX/ZA=;
 b=VIysndr/hn+nS8HhtxgXE8ktDnpYYazy+NwdKSH7zMvPoyaBRJCT5zVGj++NUWPPjf
 tueIFynmty29W3/w1FtVR4WqaCNq441a8lsLWzSMRJ3V9cWMKYE4KMthVW0g3hIJf8wq
 a6XDEFBY6x35+WiQhgkNECHrMxFrSi8GcwNRsHpaZzskk7PGp5Xg4tMjTZ87N5FPadOU
 xyIHyxXNgSM5/TOmmeaAoFh5r/8nHCjrFjplobOKyy2BJvWsxUBzme3zY7WyWtmF006u
 2SjpOLKT2k392+VPTiUTncbj29b6Ml41l6g4ohj7I50FW/1RvcM2BG+81BnELrXEYyfY
 hPlg==
X-Gm-Message-State: AC+VfDyg29WLpZVNXhCAvndY31n4eybMqEGSBS0zuOGhsk7vLQQn7kZw
 EyF1NUyIJ+mKuTPviACjwInajl5ISu3bLuJ17fw=
X-Google-Smtp-Source: ACHHUZ6YvyXVM4V18WeBDx3J5dkaKy+DyzMZeq7Hohys+X32z96d0MrmRQwCYRYslyfv0Cfubs2Klg==
X-Received: by 2002:a05:6512:1590:b0:4f8:70d2:672c with SMTP id
 bp16-20020a056512159000b004f870d2672cmr4529327lfb.17.1687480907934; 
 Thu, 22 Jun 2023 17:41:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 eo15-20020a056512480f00b004f875356ab8sm1278005lfb.153.2023.06.22.17.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 17:41:47 -0700 (PDT)
Message-ID: <81866240-260b-0891-36ea-34676674c9b3@linaro.org>
Date: Fri, 23 Jun 2023 03:41:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dsi: Enable DATABUS_WIDEN for DSI
 command mode
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-3-c7069f2efca1@quicinc.com>
 <ky7sgsaohak2pcdf6pbhedfyrwk4ea7y3ekfqlw7rn6cpk4rhe@rjuhb23n37oz>
 <cf968ab4-e4c4-dcad-f7d1-4edff6f08147@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <cf968ab4-e4c4-dcad-f7d1-4edff6f08147@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2023 03:01, Abhinav Kumar wrote:
> 
> 
> On 6/14/2023 2:56 AM, Marijn Suijten wrote:
>> On 2023-06-13 18:57:13, Jessica Zhang wrote:
>>> DSI 6G v2.5.x+ supports a data-bus widen mode that allows DSI to send
>>> 48 bits of compressed data per pclk instead of 24.
>>>
>>> For all chipsets that support this mode, enable it whenever DSC is
>>> enabled as recommend by the hardware programming guide.
>>>
>>> Only enable this for command mode as we are currently unable to validate
>>> it for video mode.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>
>>> Note: The dsi.xml.h changes were generated using the headergen2 
>>> script in
>>> envytools [1], but the changes to the copyright and rules-ng-ng 
>>> source file
>>> paths were dropped.
>>>
>>> [1] https://github.com/freedreno/envytools/
>>
>> More interesting would be a link to the Mesa MR upstreaming this
>> bitfield to dsi.xml [2] (which I have not found on my own yet).
>>
>> [2]: 
>> https://gitlab.freedesktop.org/mesa/mesa/-/blame/main/src/freedreno/registers/dsi/dsi.xml
>>
> 
> Thats because we havent submitted a MR yet for this on mesa.
> 
> Generally, our team does not have legal permissions yet for mesa MRs 
> other than mesa drm because we got permissions for the modetest.
> 
> Rob/Dmitry, can one of you pls help with the corresponding mesa MR for 
> this?
> 
> The xml file change was autogenerated so this patch can go in.

Ack, I'll handle it.


-- 
With best wishes
Dmitry


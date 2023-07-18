Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2077587DC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 00:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C516810E3BE;
	Tue, 18 Jul 2023 22:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA9B10E3BE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 22:00:19 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fbbfaacfc1so10224922e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689717617; x=1690322417;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nGhTE283vqSMbHE6NrAjPBOLH8wxgNh+ZZrxUXaoOpA=;
 b=ptwRQKkVwDdm7SgUSdqf5CGN3sboG/MAmMkkl8n6rXlRERI/19F7r0DmslJIxUZegm
 rjG5fC03XibcUo7oTKTvN96fEyYL3qgzz5iVCgXR1yoDk8a01ZC2F4GRIYgn5I/azdBB
 3zc15HqhLpqUx6XyH8Y704XRM6SxQObwURYueJP5DYM3FJkX/fqoKHy9FsqsEavtBxSl
 yVkZkWA6MgAMkT9RY7Ea/zE8svFgtm3dIOKFp9FOA5IqOCyf1Y8Dhq5s1iHvDkbxsPe1
 FZAnI/bN8h6RZ5iyI5gH8G2nAvgkiRwBiCIVpWH+bsyiCJ1fbi8vKo3HEf93cuP4koO3
 fP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689717617; x=1690322417;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nGhTE283vqSMbHE6NrAjPBOLH8wxgNh+ZZrxUXaoOpA=;
 b=YbXxdKmakDUlME3qfQt/S+p1joe3oA69S6gJsvnfDxyqM9itdSYVNNmIAV9TsxLOXP
 FF5Yjeod1TR5z2NTQ5t2qY9rcnRFJLDw0WZrPDKr9HxDzfMvTgEq5kNiiuhcP2deJhN9
 DHVSTD3iD4jdg6WY1hL1Ouh3K2FMTLB0eCFdjluPuKmu7/Ms7l9jdmOTsu88ohTce5se
 pTVAI3NaGO3h1mPK7XUWh+7fZ3MERKm4H3vIAZLRtXZdUIiXwTNoZwV1Hq2TcBKP1IX9
 QX/eZXMiYXUELTWD/NQop9mHMqax1slJIffqGfyt+U7g9E1XEunhhfiQ4y6Gcl+gHqXq
 GrgQ==
X-Gm-Message-State: ABy/qLbZcVDealsu/uq28BKzsx+nTXK7xW1bAvoMwzv7444XzSRFeMXM
 CWf7FxTvo7B1KxP5IYUke9ZW7A==
X-Google-Smtp-Source: APBJJlEiOlxqInpn4QDlGr4ndEv7whiX69SmWBBj7JvBf6THmHQRPk5bwDDcnQpA0AuCyVER4jwGUA==
X-Received: by 2002:a05:6512:234a:b0:4fb:8b2a:5e09 with SMTP id
 p10-20020a056512234a00b004fb8b2a5e09mr12140549lfu.43.1689717617303; 
 Tue, 18 Jul 2023 15:00:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b14-20020ac25e8e000000b004fb745fd232sm633614lfq.30.2023.07.18.15.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 15:00:16 -0700 (PDT)
Message-ID: <ca9cf8b1-7a2d-dee5-5ce4-2ac338b2ecb5@linaro.org>
Date: Wed, 19 Jul 2023 01:00:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/msm/dsi: Enable DATABUS_WIDEN for DSI command mode
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230713-add-widebus-support-v2-1-ad0added17b6@quicinc.com>
 <91bc6348-2030-85dd-1492-1609b392793f@linaro.org>
 <05996344-0e43-7f37-c99a-42c04f91dc83@quicinc.com>
 <CAA8EJppFDcrVdegskSD0TJPOdSzVw_50+Bq+u8LKn26jdKE=tw@mail.gmail.com>
 <19ff3766-a73e-761d-8965-015817fa9c0c@quicinc.com>
 <637e4979-cadc-2167-a14f-25363c9da990@linaro.org>
 <2804b7c7-0ed2-6490-3316-7a38eb1262f8@quicinc.com>
 <d7b93f39-e866-899b-578f-17f7bdd5bdd5@linaro.org>
 <b2b044f7-9ddd-1d68-4eae-d5670e70cc8c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b2b044f7-9ddd-1d68-4eae-d5670e70cc8c@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/07/2023 23:44, Jessica Zhang wrote:
> 
> 
> On 7/17/2023 11:04 PM, Dmitry Baryshkov wrote:
>> On 18/07/2023 03:30, Jessica Zhang wrote:
>>>
>>>
>>> In addition, *_is_widebus_enabled() would only work under the 
>>> assumption that DSC (if supported) will always be enabled during 
>>> bootup for DSI. If there ends up being support for a panel that 
>>> allows for DSC to be enabled on the fly after bootup, the proposed 
>>> *_is_widebus_enabled() check would break since the assumption that 
>>> DSC is always enabled on bootup would not be true anymore.
>>
>> Why is that going to break?
> 
> 
> Currently, the msm_host->dsc is initialized in attach() [1] and we do 
> widebus setup during power_on() [2]. So we can assume that if the panel 
> supports DSC, msm_host->dsc will be not NULL during power_on() and the 
> widebus setup will work as expected.
> 
> However, if a panel supports enabling DSC after bootup, then 
> msm_host->dsc will be set later within the commit enable() path meaning 
> the necessary widebus setup during power_on() would *not* happen (as 
> *_is_widebus_enabled() would return false on account of msm_host->dsc == 
> NULL during power_on()).


Minor corrections:
- power_on() happens during pre_enable() stage,
- the dynamic msm_host->dsc can also be set during pre_enable() stage.

Note: there still exists dsi_mgr_bridge_mode_set(), which can also be 
used to set msm_host->dsc (however I would prefer to drop mode_set() 
completely and set the mode from atomic_enable().

I'd say, this is the minor issue. The dsi_timing_setup() is plagued with 
if (dsc) checks, so if we make DSC dynamic, it will have to be audited 
anyway.

> 
> Thanks,
> 
> Jessica Zhang
> 
> [1] 
> https://elixir.bootlin.com/linux/v6.5-rc2/source/drivers/gpu/drm/msm/dsi/dsi_host.c#L1587
> 
> [2] 
> https://elixir.bootlin.com/linux/v6.5-rc2/source/drivers/gpu/drm/msm/dsi/dsi_host.c#L2359
> 
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry


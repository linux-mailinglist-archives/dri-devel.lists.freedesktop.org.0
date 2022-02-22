Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD854BF6E1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 12:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A9E10E91F;
	Tue, 22 Feb 2022 11:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A1F10E91D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 11:02:12 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b11so23940969lfb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 03:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FEr1dmlBfqy5sXD3HLj/KlzbzoUju1Ng5vIhD2tYoCk=;
 b=hnSpJ/7MqXwGc38P5+/jVdY1t3pGZ2iHpclQ2/+v/rF/L2k4WCOAfMLf8/cccWVb1C
 s1vLWucOsp+uZ0Bzd4TlXCRx9udMGJ08XL8FouAPYYkxmfIlHGSP1KWHcCfcEWxkNBuy
 Q3YoOinDU0DsmWtZQ48CEp8uj3Lr+ooVWavekiL43/3ULiDOnJ19mI2kqxEmNn+CcmVh
 /3gZzTSQUW/NUOqiXMTWEIPQVdx5V95gysF/bdIyuvwZ6SVJWVJsY0dHBCQE7A1BvRJI
 9ZHPKHCa2oi+73iL8iBqRZ1O/1juwfISS3bKQe4uqFwKWpqi+PRj19RntWVziCX4T/oy
 D4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FEr1dmlBfqy5sXD3HLj/KlzbzoUju1Ng5vIhD2tYoCk=;
 b=alQ418tmTbuwspCtyYZ0v6cFoR69zOA9daJI13U56oIfDgwtPkG3kd8F0PzNFRETxf
 Ve/S9BpyrkXgZt06UImm05LuxudolmPaaTck7xs8IegM8H1f9AmnGBQPiCA4MvisTDRz
 BEOrpGhHFFqUwVaKGb+t5zxlW7VwnGjBrIkw0+HuMuoafVJBpP/W/5lTu+hpfuiLu7HO
 gMxl0Jl/i6i2G8OtBgV2xS8TrFzf0257lLiRNtn3bGd5MxFdeRssVZrfn7tLyq2/bq9/
 LBmA4HXmxA45pueG5is1o6K84q+Q3wPPTdWFTWeAXE1V3AS1uIt9OBDnxNksmseWU7Ze
 gryQ==
X-Gm-Message-State: AOAM531yVUH0H6hAQxyng0c7PnWY4qSVFxrmlARxpqe5wRjJa/3rwfDt
 qL5WwB4J3IDg/o/ZYAWy4W8=
X-Google-Smtp-Source: ABdhPJynaoI+/XmYPUSX1yz2BgAVDgkX9V5kPsQkAvgnbnw1gWNWYK5gRqWCmMUOwD33fRqB/rj21A==
X-Received: by 2002:a05:6512:3748:b0:443:c3f0:6691 with SMTP id
 a8-20020a056512374800b00443c3f06691mr12238118lfs.603.1645527730316; 
 Tue, 22 Feb 2022 03:02:10 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id t1sm1360167lfr.8.2022.02.22.03.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 03:02:09 -0800 (PST)
Message-ID: <3b0b8b41-ddf0-3b83-5edd-8768393ad201@gmail.com>
Date: Tue, 22 Feb 2022 14:02:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 8/9] drm/tegra: vic: Implement get_streamid_offset
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 joro@8bytes.org, will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-9-mperttunen@nvidia.com>
 <b1df816b-6838-c435-1a23-5029144e4cfe@gmail.com>
 <7f4e4c47-59f1-1def-36bf-a2ded912f76d@gmail.com>
 <5d1b6e82-2c9d-8388-697f-0d7305a1206f@kapsi.fi>
 <ee648994-b296-2ac4-a676-ddcac463a428@gmail.com>
 <30033f5b-3fd1-22c7-896b-af034a4041df@kapsi.fi>
 <4352fda7-ecb6-4a5e-7d6c-a50537d8eaff@gmail.com>
 <b947e0b2-a78d-bacf-0d78-b5d57e821e6e@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <b947e0b2-a78d-bacf-0d78-b5d57e821e6e@kapsi.fi>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

22.02.2022 13:54, Mikko Perttunen пишет:
> On 2/22/22 12:46, Dmitry Osipenko wrote:
>> 22.02.2022 11:27, Mikko Perttunen пишет:
>>> On 2/21/22 22:10, Dmitry Osipenko wrote:
>>>> 21.02.2022 14:44, Mikko Perttunen пишет:
>>>>> On 2/19/22 20:54, Dmitry Osipenko wrote:
>>>>>> 19.02.2022 21:49, Dmitry Osipenko пишет:
>>>>>>> 18.02.2022 14:39, Mikko Perttunen пишет:
>>>>>>>> +static int vic_get_streamid_offset(struct tegra_drm_client
>>>>>>>> *client)
>>>>>>>> +{
>>>>>>>> +    struct vic *vic = to_vic(client);
>>>>>>>> +    int err;
>>>>>>>> +
>>>>>>>> +    err = vic_load_firmware(vic);
>>>>>>>
>>>>>>> You can't invoke vic_load_firmware() while RPM is suspended. Either
>>>>>>> replace this with RPM get/put or do something else.
>>>>>
>>>>> Why not, I'm not seeing any HW accesses in vic_load_firmware? Although
>>>>> it looks like it might race with the vic_load_firmware call in
>>>>> vic_runtime_resume which probably needs to be fixed.
>>>>
>>>> It was not clear from the function's name that h/w is untouched, I read
>>>> "load" as "upload" and then looked at vic_runtime_resume(). I'd rename
>>>> vic_load_firmware() to vic_prepare_firmware_image().
>>>>
>>>> And yes, technically lock is needed.
>>>
>>> Yep, I'll consider renaming it.
>>
>> Looking at this all again, I'd suggest to change:
>>
>> int get_streamid_offset(client)
>>
>> to:
>>
>> int get_streamid_offset(client, *offset)
>>
>> and bail out if get_streamid_offset() returns error. It's never okay to
>> ignore errors.
> 
> Sure, seems reasonable. We'll still need some error code to indicate
> that context isolation isn't available for the engine and continue on in
> that case but that's better than just ignoring all of them.

Yes, check for -EOPNOTSUPP and skip it.


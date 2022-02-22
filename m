Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618AB4BF667
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 11:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A6D10E5D3;
	Tue, 22 Feb 2022 10:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E98C10E5D3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 10:46:32 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id r20so18845204ljj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 02:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iabqwLRHm/0Z6nOkM33Y0js7aZKJwfXcVsR9drxTBpI=;
 b=Wvvk4dYJGf5Y8/8AlZicv/dhMGLGNFdMJpU3wenpSJZw/ybyjG3nx9inX0NopTAr9b
 hki9SqFotR4DokiJbsxi3yGsFbnL/zXxiDg/fRjfzRxiszEbWkFKpYheubiSHqOaxP34
 rjOvLBDn9kWi79ogs4Zh8W6upcZAtRRWT4N5DEvXeccq1jr0fRCdDH4AhV3jc6YMVzYY
 6IEqUC1xQpeJJXazlibsxRAUbsunJcLJ+Q8OZRSlkEt2s3SOTVvGTqVfVXppSIfJi21t
 hGpypFfvt3zGUuu9KQLV5peGeZ7tki5MqV+SxDeCYQ79bdLGMFynXY4YZv5rFu2cevD6
 iV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iabqwLRHm/0Z6nOkM33Y0js7aZKJwfXcVsR9drxTBpI=;
 b=NzPt/tzGtYaE3qvT2MM/OP9HzjuwUaZF2oNz7qKB6+gXVFG+wQTPT8hE6RkOr5SB+L
 ys2zLf7ztbRO30Vv6WRa8fuGGQrHGr1206Gp9xlRzdWqV8GADcLwAuls/V8I4TAtNrvw
 vmKFZKcRgCukT70l476RYJ9vZ9iZgQcGDaKKRw2ozTrw0r6sZLB9JpgkJsM0zj9OeB7r
 95UfX+LHOKAC8b9FRExvv8aMZ+HMag6pn44CX/vxRM+lDgJSl4H7VbC6ot3LVqFWCkDp
 rBUGyMUSjSlNZqB785ptVveEn4DAE4w0D6uP5wZ5dd/fsy/WMCdxb83j3jqDLWPXWzfY
 JGpw==
X-Gm-Message-State: AOAM532UMiTbpJIZapCeNF9eldH5Tz2pGKETPZkSfGoU7B/vpjVqxVjI
 kWRKwGYnFEDxFpMXr2R064c=
X-Google-Smtp-Source: ABdhPJwZ1McSWpt8xE8JSzJ7PFSX/UI6DWDglB8xl7blNXCItqUCMFWL3e68OUp80Bgn508refVPUw==
X-Received: by 2002:a2e:980f:0:b0:246:3fb6:816b with SMTP id
 a15-20020a2e980f000000b002463fb6816bmr6085199ljj.242.1645526790359; 
 Tue, 22 Feb 2022 02:46:30 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id w10sm1599556ljd.101.2022.02.22.02.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 02:46:29 -0800 (PST)
Message-ID: <4352fda7-ecb6-4a5e-7d6c-a50537d8eaff@gmail.com>
Date: Tue, 22 Feb 2022 13:46:29 +0300
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
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <30033f5b-3fd1-22c7-896b-af034a4041df@kapsi.fi>
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

22.02.2022 11:27, Mikko Perttunen пишет:
> On 2/21/22 22:10, Dmitry Osipenko wrote:
>> 21.02.2022 14:44, Mikko Perttunen пишет:
>>> On 2/19/22 20:54, Dmitry Osipenko wrote:
>>>> 19.02.2022 21:49, Dmitry Osipenko пишет:
>>>>> 18.02.2022 14:39, Mikko Perttunen пишет:
>>>>>> +static int vic_get_streamid_offset(struct tegra_drm_client *client)
>>>>>> +{
>>>>>> +    struct vic *vic = to_vic(client);
>>>>>> +    int err;
>>>>>> +
>>>>>> +    err = vic_load_firmware(vic);
>>>>>
>>>>> You can't invoke vic_load_firmware() while RPM is suspended. Either
>>>>> replace this with RPM get/put or do something else.
>>>
>>> Why not, I'm not seeing any HW accesses in vic_load_firmware? Although
>>> it looks like it might race with the vic_load_firmware call in
>>> vic_runtime_resume which probably needs to be fixed.
>>
>> It was not clear from the function's name that h/w is untouched, I read
>> "load" as "upload" and then looked at vic_runtime_resume(). I'd rename
>> vic_load_firmware() to vic_prepare_firmware_image().
>>
>> And yes, technically lock is needed.
> 
> Yep, I'll consider renaming it.

Looking at this all again, I'd suggest to change:

int get_streamid_offset(client)

to:

int get_streamid_offset(client, *offset)

and bail out if get_streamid_offset() returns error. It's never okay to
ignore errors.

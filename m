Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0673A45CB08
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 18:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29B96E8EF;
	Wed, 24 Nov 2021 17:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD536E8EF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 17:29:20 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id u22so6996483lju.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 09:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ydUydaywLW87b6G3VEUPeR5PFEYyoQL/BmcPvqzWAYE=;
 b=CyZhQDspBWd+9xlvoI5RVBF+09UDksRX0c03lZTTtQ/7SilD8KdMDQ1DZ6hrVRsZiN
 t5TvcoXmsHKHYC/JfKthFjYHWPYsQ/OMcKcorVPvFI56Ixyxi4EHeeN9XC2OAqThTn1Y
 BZYL/5rzIqHLBqJJvNVsAg9l8SHRJr4C92FiFHueGuN0c1b9wVcUf4SEmShRwu2IFJrF
 +cuzJDzIeEQguNTtO4g5XNPNQhbpLGJDADTNg/Ueg0q3pddl+TdM8mT+gOK9VY6n05JH
 ySR9yR9+/228BIGVgHT/9r6ERxG+jbMRR5lASbNaab1UyapCu3GIu51cPhA9DVC1evnD
 biUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ydUydaywLW87b6G3VEUPeR5PFEYyoQL/BmcPvqzWAYE=;
 b=1B9KPxKMVR+s1oYYE9McyWZW3C0zd+P5bm8JAp3PXtf2fOVTjytAIEymoe5vD/pUdV
 aZS9KaK30wtWvKpEVCwnTDloFb+FkEd+8ChFHplmsLkKfZMHME/peh7U7owpBRYhn6JE
 HVN4/pIgu82XOuxrwNk4QXI7Z9KuI4UaofSrU+Y1hlajXAjNd3Y3DJ6AiqLxITVM8N2P
 ltIpx1ocFTHlGYib1pAQjPN4pYcJCzu9GGMIytK1y+ju6m4wk3A0dPfeGxL/ZbyDQh17
 KDQRWP7W/zHKKiKP2nPu50X1GmuEId9PFr/epjY/ednBqMhHXUDkt1laG/YCpLKJ4M1i
 /6SQ==
X-Gm-Message-State: AOAM532z/pjn5SjHygPAUtyFlArOF8cviEjIkfD/zAxaOC32zRNNEnMX
 ohDxLsdrLk9lLnXZwotx2ag=
X-Google-Smtp-Source: ABdhPJxPXUgL5sbmJ8QgM/1O4cZrC1JEdGxYpsxf6RgyOm2YXACjxbTj8io/Abcqz4xAMIM9ZZpS1w==
X-Received: by 2002:a2e:9806:: with SMTP id a6mr17728616ljj.185.1637774958306; 
 Wed, 24 Nov 2021 09:29:18 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id e17sm40549lfq.102.2021.11.24.09.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 09:29:18 -0800 (PST)
Subject: Re: [PATCH v2] i2c: tegra: Add ACPI support
To: Akhil R <akhilrajeev@nvidia.com>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>
References: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
 <1637651753-5067-1-git-send-email-akhilrajeev@nvidia.com>
 <eebf20ea-6a7f-1120-5ad8-b6dc1f9935e6@gmail.com>
 <BN9PR12MB5273A7628D80076F4EF2CC69C0619@BN9PR12MB5273.namprd12.prod.outlook.com>
 <b06a5072-f0f4-c9f9-f9a2-8d76b4432415@gmail.com>
 <BN9PR12MB5273CA3AA78636EB0500897AC0619@BN9PR12MB5273.namprd12.prod.outlook.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4af00198-82b8-6611-544e-4bba51354278@gmail.com>
Date: Wed, 24 Nov 2021 20:29:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <BN9PR12MB5273CA3AA78636EB0500897AC0619@BN9PR12MB5273.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Shardar Mohammed <smohammed@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

24.11.2021 19:40, Akhil R пишет:
>> 24.11.2021 10:18, Akhil R пишет:
>>>> *i2c_dev)
>>>>>               i2c_dev->is_vi = true;  }
>>>> How are you going to differentiate the VI I2C from a non-VI? This
>>>> doesn't look right.
>>> This patch adds the ACPI support to only non-VI I2C. The device_ids in
>>> match table are added accordingly. I suppose, of_device_is_compatible
>>> always returns false as there is no device tree.
>>> Agree with the other comments.
>>
>> Will the VI I2C have a different ACPI ID or how it's going to work?
> As there is a different compatible for VI I2C in device tree, I suppose the ACPI
> would have a different ID as well. I think the logic would also need an update 
> if to have VI I2C using the ACPI. But that wasn't actually considered in this patch.

Thanks, you could reflected it in the commit message.

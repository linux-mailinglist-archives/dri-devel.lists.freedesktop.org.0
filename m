Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0720B6375EA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 11:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8546710E6C9;
	Thu, 24 Nov 2022 10:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A41210E6C8;
 Thu, 24 Nov 2022 10:06:24 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id ho10so3093602ejc.1;
 Thu, 24 Nov 2022 02:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=grg1WkorBBI5i++s0cNc3EAJO6tnj2pMI+gCkQrn5+o=;
 b=DAglP0Q1TxZviwF+1OIbZJpTWrwiHeIvDNcWQUii2/BXS+2rEi52nLomWwJCXe0zir
 4nmTpj+MJAlfPGtYlFfuIKHZwRiL/pv5ZLTbFAE8tPDRzefOjb9JRBI6A7WEKfuMq4Yy
 kSNsC2KizrKAUtUQF6vpsmhrv9mxAPVIkLZQGviqEWCI6yV8ttF0zb65beekBjZnchcR
 ZJdanQJgaiGDIlUQlsVhZ/GXmGnfumRCtZkSwu5lNVBigd2nMhE1w59sLtYt1cmt2Hwp
 85z3gMzbUB1UGGUxXHYglJW30b5FHdw2JOY8hswgGNP0fSAel3iNahS/TqRBnleYQG8U
 JzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=grg1WkorBBI5i++s0cNc3EAJO6tnj2pMI+gCkQrn5+o=;
 b=PWJsFrWta6hCLdrJzAhGIwj1+MQ+nuZZRyk+Js6mrNFX8XsDO5ZnrBWVqpVku57MKc
 znnUA9+o7drH5c12bt9vWy1rqc3hhU8+V7mOVzK2E3y/Z9k6XUXavXHz6PsqkfqNaokM
 C+dIpr93+e6ZMbD4uiYwMFwYermGStGXLVY/ldCBMKn87achC2Hkbe4QJJbRdZPhOlpP
 m/la36wWdwwUTQqJm0Qcfsg2e28VzOvTqsiZukQyL/6oKgFd+ARTdCa15ZQlQ6WXc4ao
 UAmC8mg+PD+abYaYj/QFmcd5h3toDHDW3SEr5dqhjNJrgWtFdR5OcIdYctJ6d4PzPPyX
 6Spg==
X-Gm-Message-State: ANoB5pkc/NITX+fdExJ4tBLnc7UyVnl+zNaXoOdvIJtToq0LOb6lwBai
 Zk3FbipER4Og3Zu9GQAH9iQ=
X-Google-Smtp-Source: AA0mqf6lavqU4v6hJFt7dj6yuv7s9X/kGRPWan21pna2MxmvAuzqwTP1dmkLcFoifxUnLOHO3Ofz7A==
X-Received: by 2002:a17:907:11cb:b0:7a6:598f:1fb1 with SMTP id
 va11-20020a17090711cb00b007a6598f1fb1mr27280535ejb.606.1669284382937; 
 Thu, 24 Nov 2022 02:06:22 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 k26-20020a17090632da00b0073022b796a7sm258321ejk.93.2022.11.24.02.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 02:06:22 -0800 (PST)
Message-ID: <df96d87d-bc39-abaf-f567-f5b94e0905fe@gmail.com>
Date: Thu, 24 Nov 2022 11:06:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/amdgpu: add mb for si
Content-Language: en-US
To: "Quan, Evan" <Evan.Quan@amd.com>, =?UTF-8?B?5p2O55yf6IO9?=
 <lizhenneng@kylinos.cn>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel.daenzer@mailbox.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20221118074810.380368-1-lizhenneng@kylinos.cn>
 <ecd9d251-8941-b2db-71b2-e4ac06f860a3@amd.com>
 <800a1207-8ff6-4cfa-60f3-6ff456874890@mailbox.org>
 <4adc40d1-e775-c480-bb35-23fe9c63e05e@kylinos.cn>
 <DM6PR12MB26196C35AC2F28FD50ECCAF0E40F9@DM6PR12MB2619.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <DM6PR12MB26196C35AC2F28FD50ECCAF0E40F9@DM6PR12MB2619.namprd12.prod.outlook.com>
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That's not a patch but some binary file?

Christian.

Am 24.11.22 um 11:04 schrieb Quan, Evan:
> [AMD Official Use Only - General]
>
> Could the attached patch help?
>
> Evan
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of ???
>> Sent: Friday, November 18, 2022 5:25 PM
>> To: Michel Dänzer <michel.daenzer@mailbox.org>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Deucher, Alexander
>> <Alexander.Deucher@amd.com>
>> Cc: amd-gfx@lists.freedesktop.org; Pan, Xinhui <Xinhui.Pan@amd.com>;
>> linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org
>> Subject: Re: [PATCH] drm/amdgpu: add mb for si
>>
>>
>> 在 2022/11/18 17:18, Michel Dänzer 写道:
>>> On 11/18/22 09:01, Christian König wrote:
>>>> Am 18.11.22 um 08:48 schrieb Zhenneng Li:
>>>>> During reboot test on arm64 platform, it may failure on boot, so add
>>>>> this mb in smc.
>>>>>
>>>>> The error message are as follows:
>>>>> [    6.996395][ 7] [  T295] [drm:amdgpu_device_ip_late_init
>>>>> [amdgpu]] *ERROR*
>>>>>                   late_init of IP block <si_dpm> failed -22 [
>>>>> 7.006919][ 7] [  T295] amdgpu 0000:04:00.0:
>>>>> amdgpu_device_ip_late_init failed [    7.014224][ 7] [  T295] amdgpu
>>>>> 0000:04:00.0: Fatal error during GPU init
>>>> Memory barries are not supposed to be sprinkled around like this, you
>> need to give a detailed explanation why this is necessary.
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
>>>>> ---
>>>>>     drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c | 2 ++
>>>>>     1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>> b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>> index 8f994ffa9cd1..c7656f22278d 100644
>>>>> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>> @@ -155,6 +155,8 @@ bool amdgpu_si_is_smc_running(struct
>>>>> amdgpu_device *adev)
>>>>>         u32 rst = RREG32_SMC(SMC_SYSCON_RESET_CNTL);
>>>>>         u32 clk = RREG32_SMC(SMC_SYSCON_CLOCK_CNTL_0);
>>>>>     +    mb();
>>>>> +
>>>>>         if (!(rst & RST_REG) && !(clk & CK_DISABLE))
>>>>>             return true;
>>> In particular, it makes no sense in this specific place, since it cannot directly
>> affect the values of rst & clk.
>>
>> I thinks so too.
>>
>> But when I do reboot test using nine desktop machines,  there maybe report
>> this error on one or two machines after Hundreds of times or Thousands of
>> times reboot test, at the beginning, I use msleep() instead of mb(), these
>> two methods are all works, but I don't know what is the root case.
>>
>> I use this method on other verdor's oland card, this error message are
>> reported again.
>>
>> What could be the root reason?
>>
>> test environmen:
>>
>> graphics card: OLAND 0x1002:0x6611 0x1642:0x1869 0x87
>>
>> driver: amdgpu
>>
>> os: ubuntu 2004
>>
>> platform: arm64
>>
>> kernel: 5.4.18
>>


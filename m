Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C06898C5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 13:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF35810E051;
	Fri,  3 Feb 2023 12:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D81610E051
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 12:32:02 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id fi26so5018398edb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 04:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8ON3Sl99UT8ureqEDmbSEHsRNx7R9SA+QtKFoE+i2Oo=;
 b=lBVk3W/UyO+p9pLq07rPsBt3xO3mjw0/Q6FYYGvYul/Bl75Etx/NWDZziXRICISYS+
 OTpgs7RnubJ7HlWJC0ura+8mz9FMYhyJtqNMzTCWO2JnyWqdi1MN2f7Z1V894VlNIO9j
 p6xP5SK4SW/m915LCK+EHPwQmRVusS2IFDT0IeXhMnZtNgCAnMw8tmhPWIEyYIdUv45K
 MfEhOVerky/dQnDV5WkSyqaYpPz0oIOOZe/tvR90qdmUjlkcpH0RC+oQ0RS7bj+hAfwi
 09UGK7Kxldpb7n2Vkg8yK53NSa//2Amlqbdrp1X7BKt+6m7Qh9UtlZluuXWXIdj2S1eR
 xJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8ON3Sl99UT8ureqEDmbSEHsRNx7R9SA+QtKFoE+i2Oo=;
 b=Y3fLS5C7//uRMipszcfWsB3cn3c3fhJkrUJx+wPqK250tmPjZFWgoXMlxAOqffwB2I
 al98AkCno1aev50KTpvvoR3svkITHiHU7UIng9yJvHvbTRUyGRbBCIUDssdsYxd2LFE3
 tQoKoiivD5wxjK2ZQO3ksob/5ANLRlh6Ux9Ll1dcZ606uES7O4t9fjr2HwbWyu3ygDoC
 cnLdKtZEKyHbXVxHup0BIsdz9nOs+FjpomjWPk5dnQOrP07Ux+JWD2NlzbCTHfOmo3Nw
 6aNcM6T/tKd7ScBCyyK82JJzMkpsjkhlN6IZH5haiDuo3U8BPW//jkfs4ntPmNbJkifa
 cyWQ==
X-Gm-Message-State: AO0yUKW/zDhHvcmhyxQ29vKqb/Rn5dyiF6/6ogvcVhxpQ4UgACQDNGMV
 Y9n296W6MppXdlfo3IryMAjbxQ==
X-Google-Smtp-Source: AK7set+mvfj95zLeSWmU5e5UDpt5MMre8u+osBvx7sTSxXMPwrd90oXq/vv0Ttley1PZsEGT2E4jxg==
X-Received: by 2002:a05:6402:298c:b0:4a8:452:55a4 with SMTP id
 eq12-20020a056402298c00b004a8045255a4mr5214933edb.17.1675427520772; 
 Fri, 03 Feb 2023 04:32:00 -0800 (PST)
Received: from [10.7.1.2] ([82.180.148.111]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05640251d100b0046c7c3755a7sm1068634edd.17.2023.02.03.04.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 04:32:00 -0800 (PST)
Message-ID: <f3ccd7ad-0bbb-be39-c989-765552e2c6af@linaro.org>
Date: Fri, 3 Feb 2023 13:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm
 from a dmabuf file descriptor
To: Etienne Carriere <etienne.carriere@linaro.org>,
 Olivier Masse <olivier.masse@nxp.com>
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <20220812143055.12938-2-olivier.masse@nxp.com>
 <30534fadb8172088eddef46ae71d87c167cbf32e.camel@nxp.com>
 <CAFA6WYOMCswgHHxsgc9Hgi7rmTPaZDqce=BixvYoFTfL0bTFDQ@mail.gmail.com>
 <PA4PR04MB75204E8D2B959893A04D55F388D69@PA4PR04MB7520.eurprd04.prod.outlook.com>
 <CAFA6WYPGT8xZnB1idcxcHT1bvM=0kwFssBQbn063-qg=czM-ZQ@mail.gmail.com>
 <CAN5uoS8XgvAKVwKHx-uOe3hAa4Jrd5FJt6xNOG5s-simkRND9w@mail.gmail.com>
 <c86d1a46af6e076038b3f0c2dd68213ff1e8b254.camel@nxp.com>
 <CAN5uoS-A8EovbnxvcXqiYHcy95d-PTYUZvnNr3=kf84AGkG8Kw@mail.gmail.com>
Content-Language: en-US
From: Jerome Forissier <jerome.forissier@linaro.org>
In-Reply-To: <CAN5uoS-A8EovbnxvcXqiYHcy95d-PTYUZvnNr3=kf84AGkG8Kw@mail.gmail.com>
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
Cc: "sumit.garg@linaro.org" <sumit.garg@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Cl=c3=a9ment_Faure?= <clement.faure@nxp.com>,
 "fredgc@google.com" <fredgc@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 Cyrille Fleury <cyrille.fleury@nxp.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/3/23 12:37, Etienne Carriere wrote:
> Hell all,
> 
> +jerome f.
> 
> On Fri, 3 Feb 2023 at 12:01, Olivier Masse <olivier.masse@nxp.com> wrote:
>>
>> On jeu., 2023-02-02 at 10:58 +0100, Etienne Carriere wrote:
>>> Caution: EXT Email
>>>
>>> On Thu, 2 Feb 2023 at 09:35, Sumit Garg <sumit.garg@linaro.org>
>>> wrote:
>>>> Hi Cyrille,
>>>>
>>>> Please don't top post as it makes it harder to follow-up.
>>>>
>>>> On Thu, 2 Feb 2023 at 13:26, Cyrille Fleury <cyrille.fleury@nxp.com
>>>>> wrote:
>>>>> Hi Sumit, all
>>>>>
>>>>> Upstream OP-TEE should support registering a dmabuf since a
>>>>> while, given how widely dmabuf is used in Linux for passing
>>>>> buffers around between devices.
>>>>>
>>>>> Purpose of the new register_tee_shm ioctl is to allow OPTEE to
>>>>> use memory allocated from the exiting linux dma buffer. We don't
>>>>> need to have secure dma-heap up streamed.
>>>>>
>>>>> You mentioned secure dma-buffer, but secure dma-buffer is a dma-
>>>>> buffer, so the work to be done for secure or "regular" dma
>>>>> buffers by the register_tee_shm ioctl is 100% the same.
>>>>>
>>>>> The scope of this ioctl is limited to what existing upstream dma-
>>>>> buffers are:
>>>>>         -> sharing buffers for hardware (DMA) access across
>>>>> multiple device drivers and subsystems, and for synchronizing
>>>>> asynchronous hardware access.
>>>>>        -> It means continuous memory only.
>>>>>
>>>>> So if we reduce the scope of register tee_shm to exiting dma-
>>>>> buffer area, the current patch does the job.
>>>>
>>>> Do you have a corresponding real world use-case supported by
>>>> upstream
>>>> OP-TEE? AFAIK, the Secure Data Path (SDP) use-case is the one
>>>> supported in OP-TEE upstream but without secure dmabuf heap [1]
>>>> available, the new ioctl can't be exercised.
>>>>
>>>> [1] https://github.com/OP-TEE/optee_test/blob/master/host/xtest/sdp_basic.h#L15
>>>
>>> OP-TEE has some SDP test taht can exercice SDP: 'xtest
>>> regression_1014'.
>>> https://github.com/OP-TEE/optee_test/blob/3.20.0/host/xtest/regression_1000.c#L1256
>>>
>>> The test relies on old staged ION + local secure dmabuf heaps no more
>>> maintained, so this test is currently not functional.
>>> If we upgrade the test to mainline dmabuf alloc means, and apply the
>>> change discussed here, we should be able to regularly test SDP in
>>> OP-TEE project CI.
>>> The part to update is the userland allocation of the dmabuf:
>>> https://github.com/OP-TEE/optee_test/blob/3.20.0/host/xtest/sdp_basic.c#L91
>>>
>>>
>>
>> the test was already updated to support secure dma heap with Kernel
>> version 5.11 and higher. the userland allocation could be find here:
>> https://github.com/OP-TEE/optee_test/blob/3.20.0/host/xtest/sdp_basic.c#L153
>>
> 
> Oh, right. So fine, optee_test is ready for the new flavor of secure
> buffer fd's.
> 
> 
>> This upgrade need a Linux dma-buf patch:
>> https://lore.kernel.org/all/20220805154139.2qkqxwklufjpsfdx@000377403353/T/
> 
> @Jens, @Jerome, do we want to pick the 2 necessary Linux patches in
> our Linux kernel fork (github.com/linaro-swg/linux.git) to exercise
> SDP in our CI and be ready if dma-buf secure heaps (ref right above)
> is accepted and merged in mainline kernel?.

How would that help? I mean, when the kernel patches are merged and if
things break we can make the necessary adjustments in the optee_test app
or whatever, but in the meantime I don't see much point. I suppose the
people who are actively developing the patches do make sure it works with
OP-TEE ;-)

Regards,
-- 
Jerome

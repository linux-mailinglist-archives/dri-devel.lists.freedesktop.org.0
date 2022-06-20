Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45881551396
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 11:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF8C10EF8E;
	Mon, 20 Jun 2022 09:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909C210EFE2;
 Mon, 20 Jun 2022 09:01:44 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id u12so19726079eja.8;
 Mon, 20 Jun 2022 02:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=l4g7hgXGp9fk9Vsp0jocY6AG6WmJOc+3JNJ2BanuciM=;
 b=TWD9JAgTO9vfwROFUV3B4LYddaWoV/Z5c3wFsFnSAhqmusfzkzmcViB8t7DmOYdfhq
 9/uReKZSqmL+YrLMloThOdgVoCXHleSAd3RF7Y/4uWJbK9URFtXJMF2BZzjRmZKLjYkR
 3DmU79hcyBE/DtkqjrFb6t8hE8jfa9DniIDkVJ90iR7dAIpyBPFnqOjsDwyjYRVas3Zr
 CrzbTuwLKWE7P77//sr9OV6g0zKGJPaPWPoyts7Yxe60TIKpy9eql8vFxGZoqB4aMfVa
 YNB/Cvkg3u2zeVH/7aa82z2WLHC3mCJFY6VnRcWYa4SKyMnedqJo63LLReruRy3RjPRZ
 uRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l4g7hgXGp9fk9Vsp0jocY6AG6WmJOc+3JNJ2BanuciM=;
 b=60UOwZKw8qVAoET1kmkjqZBFlFz20ihaWh2fwQF6Vi9L6mtzZIcnFF8IVZiLYChH8c
 7bdhjUReF/1vjtzB7hyUWxLu5/ZVrGO1u4wFkXVOaGtcoYwZNyqGrIxcTfOKBaG/ZvFP
 gkSRHkvIhknJ7423lOpqPp87B/IcB9pcjwQiPEVbnwxzJ74tMi3XCLXG2iadtYLI+5Pq
 W41Lm/pWuMIwZvZpnewe8g0Dnx1c3f/b/x3eaejG5SOJPYi9feJBPTF+VMDjIO6fNQMF
 T4U/INJZ4U7o/uZAaMaMYPjHFfAckPw0Kc0HkulnrKZJ1qtDtrYQTa6dXcs+cSeu7V15
 9bZA==
X-Gm-Message-State: AJIora+JLCGRK9GpP1a4vTGUuxOFeQPOv2VkiISCWYMZ158adB1ohDNw
 w29NsjW6I5luuuWuonok8ts=
X-Google-Smtp-Source: AGRyM1shucDB2dwuk7Pk6iMYOyKMB1vSt7YLmRsI8/v/gETlfPx8uGLjzcyMK4ntehvhSlOn4OVtXQ==
X-Received: by 2002:a17:906:7007:b0:6ff:8028:42e with SMTP id
 n7-20020a170906700700b006ff8028042emr19051012ejj.278.1655715703001; 
 Mon, 20 Jun 2022 02:01:43 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:e5a1:82b6:1eac:d3ba?
 ([2a02:908:1256:79a0:e5a1:82b6:1eac:d3ba])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a17090614cb00b00712057b037fsm5500958ejc.167.2022.06.20.02.01.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 02:01:41 -0700 (PDT)
Message-ID: <ef1d00d4-c3de-398a-9eac-7cb7a19cc360@gmail.com>
Date: Mon, 20 Jun 2022 11:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: radeon driver warning
Content-Language: en-US
To: John Garry <john.garry@huawei.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <2850bbb9-a191-d723-f878-96482e7583cb@huawei.com>
 <afd3cf7b-7afd-1d86-0c24-b4b7101e4bd5@amd.com>
 <60a97869-fe1d-08cb-3241-91377d62b739@huawei.com>
 <7adf78ae-8f2d-e6bf-2054-fe61dfd4b21e@amd.com>
 <b481ffa8-451d-0a9c-e708-44047e0a8bc9@huawei.com>
 <7986913b-66a7-85b6-c563-392049e057fd@amd.com>
 <a7384d7d-fb33-6753-550e-d5b773d1aefe@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <a7384d7d-fb33-6753-550e-d5b773d1aefe@huawei.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.06.22 um 16:22 schrieb John Garry:
> Hi Christian,
>
>> Am 17.06.22 um 14:01 schrieb John Garry:
>>> On 17/06/2022 12:57, Christian König wrote:
>>>>>
>>>>> And/Or compile out the warning when "warnings = errors"?
>>>>
>>>> That should be doable I think.
>>>
>>> ok, if something can be done then I would appreciate it. I do much 
>>> randconfig builds as part of my upstream process and anything 
>>> breaking is a bit of a pain.
>>
>> I've just double checked the code and we have already wrapped the 
>> warning into "#ifndef CONFIG_COMPILE_TEST".
>
> Yes
>
>>
>> So the question is why does your random config not set 
>> CONFIG_COMPILE_TEST?
>
> My randconfig does not have CONFIG_COMPILE_TEST set - see attached. 
> AFAIK randconfig does not always set CONFIG_COMPILE_TEST.

Mhm, we could probably change the ifdef. But a random configuration 
which doesn't sets CONFIG_COMPILE_TEST sounds like a bug to me as well.

Going to provide a patch for changing the ifdef, but not sure when I 
will have time for that.

Regards,
Christian.

>
> Thanks,
> John


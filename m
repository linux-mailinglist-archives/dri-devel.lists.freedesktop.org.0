Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9B86F652D
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 08:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF7210E3A0;
	Thu,  4 May 2023 06:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFC710E3A4;
 Thu,  4 May 2023 06:43:45 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bdd7b229cso117807a12.0; 
 Wed, 03 May 2023 23:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683182623; x=1685774623;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L+HveaSZ8pmwoAQVLbFBbIPHXURnLfpovswLFaD49cM=;
 b=Yc1utEmmtVjKxRztgUq8TCrqbbROc/mWgRM3m733c//+EhoGPCJukqByvu+IsuYjXz
 9fekby6lVOIh2YlJV/Pwk4KwyIOcLqk8AjfPvYHGFdPY34ZF9JcPF9Ki5Ier/UY4O5LC
 ++Kjly+BcoE03+TJesuBL2Pg9QhuWVcaQQU5nPUT8EBPrONzuK5Ex9y3ExzxbZG4A+q0
 3RaTYaMmYm55t+c4AXLG+jKta0VAxf9t2XOIGq15QxVBU/YRqQVyoRA/wnHJ/QqK5LbG
 WtGE8MFTa4t8bOpBBWz5DY11Rt0KlFtM2yQ8rj8hHg4KtVLs5MUlAyqVFqEqBbMQOoWJ
 UZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683182623; x=1685774623;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L+HveaSZ8pmwoAQVLbFBbIPHXURnLfpovswLFaD49cM=;
 b=NHAEmPzEptDTfDiyNXxtOXIHyRLsjk5xt8Z9IURSn+mc4w7EE/xo2iEV+KBprFPhp7
 pOhuini+FJlmsNoRfvTx+4v9iCVOAR8EhMWhWO2abWcSVbPIV/CXZBNU4nEO5L4iNeS9
 ahEgqfn9j4iNSESRT0MQEWU+fDtnYRsq8ZNEviE5tX0Edsw/sHxiNEVyscZUN4LW2O9+
 Lb9psUbyPvUcVCCLay0oBgaUb26rV0MFhx6OpQJ0Xk+HmXurmhG5VAGViPBrJGmXNfnh
 E9J8bBrJ0tK5+jPw3M+pPWP4KZafygnWq1UpCLhIN0gJSasXPAPucb4W+u7O+AP9k6qi
 VQFA==
X-Gm-Message-State: AC+VfDxsE9cXZd8L7bTkkOLqQ3XceQcYRef7OHPzGQseNg42jtwcmo0c
 YO95jrAMe7BDvIs/jcV3jzdwVXEn1Ro=
X-Google-Smtp-Source: ACHHUZ6uvKUY4TfE5NW9KHFncs7MFdr3b9I0I/pMbi5ojrgYPfu3ZEqrW8pvVrcM5xsnTl/cei+hRw==
X-Received: by 2002:a17:907:31c7:b0:95e:d448:477 with SMTP id
 xf7-20020a17090731c700b0095ed4480477mr5524506ejb.33.1683182622810; 
 Wed, 03 May 2023 23:43:42 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:df61:3d16:42f9:8c09?
 ([2a02:908:1256:79a0:df61:3d16:42f9:8c09])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a170906970900b009534211cc97sm18405177ejx.159.2023.05.03.23.43.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 23:43:41 -0700 (PDT)
Message-ID: <718e7aa5-0e08-fc88-b612-ae82ab9736cd@gmail.com>
Date: Thu, 4 May 2023 08:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
 <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
 <cb3d2590-a1f8-fe7e-0bba-638ee80719af@amd.com>
 <CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com>
 <fcca2934-a556-797c-535d-a66fc67bbe30@amd.com>
 <85c538b01efb6f3fa6ff05ed1a0bc3ff87df7a61.camel@gmail.com>
 <CADnq5_NHtFbwT=x8u7GYc4ESL_HVFzjgtOd3AnVFBYMrjZq55w@mail.gmail.com>
 <c54414482b685af0991a6b095cbfb7534d998afc.camel@gmail.com>
 <CADnq5_MSY=j9AobDk7ACevur4Hwvw_ub7g16Mfm7ymMJqwVNfQ@mail.gmail.com>
 <57fa0ee4-de4f-3797-f817-d05f72541d0e@gmail.com>
 <2bf162d0-6112-8370-8828-0e0b21ac22ba@amd.com>
 <967a044bc2723cc24ab914506c0164db08923c59.camel@gmail.com>
 <59774c28-a0ef-d4f2-e920-503857bce1cf@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <59774c28-a0ef-d4f2-e920-503857bce1cf@igalia.com>
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
Cc: "Pelloux-Prayer, Pierre-Eric" <pierre-eric.pelloux-prayer@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.05.23 um 21:14 schrieb André Almeida:
> Em 03/05/2023 14:43, Timur Kristóf escreveu:
>> Hi Felix,
>>
>> On Wed, 2023-05-03 at 11:08 -0400, Felix Kuehling wrote:
>>> That's the worst-case scenario where you're debugging HW or FW
>>> issues.
>>> Those should be pretty rare post-bringup. But are there hangs caused
>>> by
>>> user mode driver or application bugs that are easier to debug and
>>> probably don't even require a GPU reset?
>>
>> There are many GPU hangs that gamers experience while playing. We have
>> dozens of open bug reports against RADV about GPU hangs on various GPU
>> generations. These usually fall into two categories:
>>
>> 1. When the hang always happens at the same point in a game. These are
>> painful to debug but manageable.
>> 2. "Random" hangs that happen to users over the course of playing a
>> game for several hours. It is absolute hell to try to even reproduce
>> let alone diagnose these issues, and this is what we would like to
>> improve.
>>
>> For these hard-to-diagnose problems, it is already a challenge to
>> determine whether the problem is the kernel (eg. setting wrong voltages
>> / frequencies) or userspace (eg. missing some synchronization), can be
>> even a game bug that we need to work around.
>>
>>> For example most VM faults can
>>> be handled without hanging the GPU. Similarly, a shader in an endless
>>> loop should not require a full GPU reset.
>>
>> This is actually not the case, AFAIK André's test case was an app that
>> had an infinite loop in a shader.
>>
>
> This is the test app if anyone want to try out: 
> https://github.com/andrealmeid/vulkan-triangle-v1. Just compile and run.
>
> The kernel calls amdgpu_ring_soft_recovery() when I run my example, 
> but I'm not sure what a soft recovery means here and if it's a full 
> GPU reset or not.

That's just "soft" recovery. In other words we send the SQ a command to 
kill a shader.

That usually works for shaders which contain an endless loop (which is 
the most common application bug), but unfortunately not for any other 
problem.

>
> But if we can at least trust the CP registers to dump information for 
> soft resets, it would be some improvement from the current state I think

Especially for endless loops the CP registers are completely useless. 
The CP just prepares the draw commands and all the state which is then 
send to the SQ for execution.

As Marek wrote we know which submission has timed out in the kernel, but 
we can't figure out where inside this submission we are.

>
>>>
>>> It's more complicated for graphics because of the more complex
>>> pipeline
>>> and the lack of CWSR. But it should still be possible to do some
>>> debugging without JTAG if the problem is in SW and not HW or FW. It's
>>> probably worth improving that debugability without getting hung-up on
>>> the worst case.
>>
>> I agree, and we welcome any constructive suggestion to improve the
>> situation. It seems like our idea doesn't work if the kernel can't give
>> us the information we need.
>>
>> How do we move forward?

As I said the best approach to figure out which draw command hangs is to 
sprinkle WRITE_DATA commands into your command stream.

That's not so much overhead and at least Bas things that this is doable 
in RADV with some changes.

For the kernel we can certainly implement devcoredump and allow writing 
out register values and other state when a problem happens.

Regards,
Christian.

>>
>> Best regards,
>> Timur
>>


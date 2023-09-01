Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A82A78F84E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 08:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22CC10E346;
	Fri,  1 Sep 2023 06:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E09010E120;
 Fri,  1 Sep 2023 06:02:31 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99bf8e5ab39so191909666b.2; 
 Thu, 31 Aug 2023 23:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693548150; x=1694152950; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=szgK28PtaN+FU2kNtru/isvknJO6EUq+kNUlT5T4kY4=;
 b=qruHm1iw2mWhBSx4f2bueYOZllgqz4DGXbBvg54e6C/xR8TIZ1aC9dfzTD21Kp1LQv
 PgF5QinHTm/LfzxJKaL9g0zr6m1WdAun2JOLqSF2K9QJk6zmdiNHvLwTZf09GbboCA8b
 6inWDOvHFF1VtHVTDmnk/PmO0NskdfzTCLq5nzLIe+YWvbb6/2mcdlX3urbgtNfmtIMf
 VXlEe47n1L+vty3WQt7eHIC3FvAgWhlDf5WHrYZKKiER8uee6LqXcDRjhcMNxF2ej/qR
 9n2KPnwNHp+9VqA9txVlQ+kXqpvY7UFH1jw3AriRnd7Y1RF0lfPv9AaJ8DdBhpdrUTJD
 uBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693548150; x=1694152950;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=szgK28PtaN+FU2kNtru/isvknJO6EUq+kNUlT5T4kY4=;
 b=XG7+O65zuBQyX2+w0GPw01mw/ifvZdBF5udOL4Rfl7egfpniodKk1ZhbSNYI3m3fJZ
 DIovZ/SRPQQFJxSXs3DB0r2knuSkipFOIruFM1gt5rK79avV4S54LVdl2Z/8MsOkCQNf
 9o/JZo2l+n85IRwJjiLeo1isgAx3oPrcgqssJw8Zcxya53+9z+KVakvw0tS+Dxzuhph+
 V0bNcVEaJu5CP38R3E9HDl1WwdU77IXQllvc6tFGuIZuX0ET2eXQpJjCQVTtvOp7190u
 O/hFYGxZfUd5EdAHp03vfnEqAVMlgq3yOFbMdVFdpKTU397YjSpO2Xl8DERactOYEWmB
 TORg==
X-Gm-Message-State: AOJu0YyVLR/sef5bBBn6JBsBkwhoDyb+EOziAXKPy3utSlS2krLN9pqF
 dPVgqAdJ62c7nIjjywpUOKs=
X-Google-Smtp-Source: AGHT+IHEUGe0z8VierR0iSKfteFbT/T7ZDzjLe13f9z2w3FINUU5xeaDGfrxriHiwmLpr9zPAqvGAA==
X-Received: by 2002:a17:907:b609:b0:9a5:d2c6:c578 with SMTP id
 vl9-20020a170907b60900b009a5d2c6c578mr898754ejc.11.1693548149577; 
 Thu, 31 Aug 2023 23:02:29 -0700 (PDT)
Received: from [192.168.178.25] ([185.254.126.42])
 by smtp.gmail.com with ESMTPSA id
 rk17-20020a170907215100b00985ed2f1584sm1560268ejb.187.2023.08.31.23.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 23:02:25 -0700 (PDT)
Message-ID: <44fd45f9-8e2c-f9a2-fe89-97329734e13c@gmail.com>
Date: Fri, 1 Sep 2023 08:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH AUTOSEL 5.10 13/22] drm/amdgpu: install stub fence into
 potential unused fence pointers
Content-Language: en-US
To: Chia-I Wu <olvaffe@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
References: <20230724012419.2317649-1-sashal@kernel.org>
 <20230724012419.2317649-13-sashal@kernel.org>
 <CAPaKu7RTgAMBLHbwtp4zgiBSDrTFtAj07k5qMzkuLQy2Zr+sZA@mail.gmail.com>
 <55fc4a28-1e17-44df-2069-a688828080e6@gmail.com>
 <2023083145-scoured-celery-2511@gregkh>
 <c657653e-24d8-5790-a91c-4c13bb9eaeb0@gmail.com>
 <2023083144-railroad-daybreak-7f41@gregkh>
 <CAPaKu7Q2vq5m6Av6L2LthnFy5w2XtjKUYF8Z2__0hVp0vj2L1A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAPaKu7Q2vq5m6Av6L2LthnFy5w2XtjKUYF8Z2__0hVp0vj2L1A@mail.gmail.com>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 stable@vger.kernel.org, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.08.23 um 20:55 schrieb Chia-I Wu:
> On Thu, Aug 31, 2023 at 7:01 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>> On Thu, Aug 31, 2023 at 03:26:28PM +0200, Christian König wrote:
>>> Am 31.08.23 um 12:56 schrieb Greg KH:
>>>> On Thu, Aug 31, 2023 at 12:27:27PM +0200, Christian König wrote:
>>>>> Am 30.08.23 um 20:53 schrieb Chia-I Wu:
>>>>>> On Sun, Jul 23, 2023 at 6:24 PM Sasha Levin <sashal@kernel.org> wrote:
>>>>>>> From: Lang Yu <Lang.Yu@amd.com>
>>>>>>>
>>>>>>> [ Upstream commit 187916e6ed9d0c3b3abc27429f7a5f8c936bd1f0 ]
>>>>>>>
>>>>>>> When using cpu to update page tables, vm update fences are unused.
>>>>>>> Install stub fence into these fence pointers instead of NULL
>>>>>>> to avoid NULL dereference when calling dma_fence_wait() on them.
>>>>>>>
>>>>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>>>>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 6 ++++--
>>>>>>>     1 file changed, 4 insertions(+), 2 deletions(-)
>>>>>> We start getting this warning spew on chromeos
>>>>> Yeah because the older kernels still kept track of the last VM fence in the
>>>>> syncobj.
>>>>>
>>>>> This patch here should probably not have been back ported.
>>>>>
>>>>> Why was that done anyway? The upstream commit doesn't have a CC stable and
>>>>> this is only a bug fix for a new feature not present on older kernels.
>>>> It is part of the AUTOSEL process.
>>> Could we prevent patches from being backported by adding a Fixes: tag?
>> Yes, that will show exactly where the patch should be backported to.
> This is also AUTOSEL'ed to 5.15.  That might need a revert as well,
> depending on when the amdgpu feature landed.

Both the feature and the bug fix landed in 6.5.

The bug fix should have never been backported to any older kernel at all 
as far as I can see.

Regards,
Christian.

>
>
>> thanks,
>>
>> greg k-h


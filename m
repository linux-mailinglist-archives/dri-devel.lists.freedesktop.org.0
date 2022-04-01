Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AEB4EE904
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 09:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD2510FE22;
	Fri,  1 Apr 2022 07:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.meizu.com (edge07.meizu.com [112.91.151.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B8CC10F9ED;
 Fri,  1 Apr 2022 06:31:33 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail11.meizu.com
 (172.16.1.15) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 1 Apr 2022
 14:31:33 +0800
Received: from [172.16.137.70] (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 1 Apr
 2022 14:31:31 +0800
Message-ID: <fd790dd5-7759-fefa-465c-f4317a8f6e52@meizu.com>
Date: Fri, 1 Apr 2022 14:31:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amdgpu/vcn: remove Unneeded semicolon
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <1648706190-4596-1-git-send-email-baihaowen@meizu.com>
 <2a2b1f76-7e9b-9561-e190-16d808eb5399@molgen.mpg.de>
From: baihaowen <baihaowen@meizu.com>
In-Reply-To: <2a2b1f76-7e9b-9561-e190-16d808eb5399@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-124.meizu.com (172.16.1.124) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-Mailman-Approved-At: Fri, 01 Apr 2022 07:23:24 +0000
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

在 4/1/22 1:54 PM, Paul Menzel 写道:
> Dear Haowen,
>
>
> Thank you for your patch.
>
> Am 31.03.22 um 07:56 schrieb Haowen Bai:
>
> In the commit message summary, please use:
>
> Remove unneeded semicolon
>
>> report by coccicheck:
>> drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:1951:2-3: Unneeded semicolon
>>
>> fixed c543dcb ("drm/amdgpu/vcn: Add VCN ras error query support")
>
> Please use
>
> Fixes: …
>
> and a commit hash length of 12 characters. (`scripts/checkpatch.pl …` should tell you about this.)
>
>
> Kind regards,
>
> Paul
>
>
>> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>> index 3e1de8c..17d44be 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>> @@ -1948,7 +1948,7 @@ static uint32_t vcn_v2_6_query_poison_by_instance(struct amdgpu_device *adev,
>>           break;
>>       default:
>>           break;
>> -    };
>> +    }
>>         if (poison_stat)
>>           dev_info(adev->dev, "Poison detected in VCN%d, sub_block%d\n",
hi, Paul Menzel
Thank you for your detail point which I have first known.

-- 
Haowen Bai


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 277524AD7E3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 12:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7752610E285;
	Tue,  8 Feb 2022 11:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1970 seconds by postgrey-1.36 at gabe;
 Tue, 08 Feb 2022 08:36:23 UTC
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0854610E42F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 08:36:22 +0000 (UTC)
X-QQ-mid: bizesmtp53t1644309377twzmj7hg
Received: from [10.4.23.96] (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 08 Feb 2022 16:36:16 +0800 (CST)
X-QQ-SSF: 01400000002000B0H000C00A0000000
X-QQ-FEAT: Mzskoac49OgEg3/QRT8jkL9iL1E+H3wCXxqak0Vk3xsHKX5JXabqmVNC7kIPm
 5BFodfLEFqyxWQIxakM3f50Ph5W0QljEntuSVK97nskxs8E+l7FgjlR6u5H50i9ZyvKJ7xY
 4xPPXP4XOeVlcjdbN+AnoIoL7p2GeXrXctx6IRumVVln2LNyLelW800SOJRC/HDwluYC0r9
 kQl7yCUhK+kD6S5CdpJ07RKLcoSjShOn4N9F2gjtjKfHLOLYdQVvdGT++aLJDvaa2CsRvzN
 JUhhZtf3bqq37cayKzHWgE5ywqnvzsqmRFHSoYLoewyZwzAdaSzvj6qpb6BctYRTvBwxmTk
 QMkxbbSz82p929juM5reI1depWLuxQvsNqsbok7
X-QQ-GoodBg: 2
Message-ID: <831df010-fa76-70e3-ec87-248006c0354c@uniontech.com>+6E0160DF22ACE559
Date: Tue, 8 Feb 2022 16:36:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v4 2/2] drm/radeon/uvd: Fix forgotten unmap buffer objects
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220208081443.28210-1-zhanglianjie@uniontech.com>
 <108cc1b0-8630-7f41-5ef9-73df69d250e9@amd.com>
 <400b7279-b738-5614-dff7-0e2f6f395a0e@uniontech.com>
 <00c5b899-ed35-44a0-6b22-bc3e882e49d4@amd.com>
From: zhanglianjie <zhanglianjie@uniontech.com>
In-Reply-To: <00c5b899-ed35-44a0-6b22-bc3e882e49d4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Tue, 08 Feb 2022 11:52:19 +0000
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
Cc: David Airlie <airlied@linux.ie>, PanXinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you very much for your review.

> I think so, Alex will probably pick that up.
> 
> Thanks,
> Christian.
> 
> Am 08.02.22 um 09:28 schrieb zhanglianjie:
>> I am very sorry that I submitted many times due to the character 
>> coding problem. Can PATCH V4 be used?
>>
>>> I'm scratching my head what you are doing here?
>>>
>>> That's the fives time you send out the same patch, so something is 
>>> going wrong here :)
>>>
>>> Please double check why that lands in your outbox over and over again.
>>>
>>> Regards,
>>> Christian.
>>>
>>> Am 08.02.22 um 09:14 schrieb zhanglianjie:
>>>> after the buffer object is successfully mapped, call 
>>>> radeon_bo_kunmap before the function returns.
>>>>
>>>> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>
>>>> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c 
>>>> b/drivers/gpu/drm/radeon/radeon_uvd.c
>>>> index 377f9cdb5b53..0558d928d98d 100644
>>>> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
>>>> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
>>>> @@ -497,6 +497,7 @@ static int radeon_uvd_cs_msg(struct 
>>>> radeon_cs_parser *p, struct radeon_bo *bo,
>>>>       handle = msg[2];
>>>>
>>>>       if (handle == 0) {
>>>> +        radeon_bo_kunmap(bo);
>>>>           DRM_ERROR("Invalid UVD handle!\n");
>>>>           return -EINVAL;
>>>>       }
>>>> @@ -559,12 +560,10 @@ static int radeon_uvd_cs_msg(struct 
>>>> radeon_cs_parser *p, struct radeon_bo *bo,
>>>>           return 0;
>>>>
>>>>       default:
>>>> -
>>>>           DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
>>>> -        return -EINVAL;
>>>>       }
>>>>
>>>> -    BUG();
>>>> +    radeon_bo_kunmap(bo);
>>>>       return -EINVAL;
>>>>   }
>>>>
>>>> -- 
>>>> 2.20.1
>>>>
>>>>
>>>>
>>>
>>>
>>
>>
>>
> 
> 


.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC344DAFCF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 13:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067E410E2C8;
	Wed, 16 Mar 2022 12:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF69010E292;
 Wed, 16 Mar 2022 12:32:50 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id a8so3825697ejc.8;
 Wed, 16 Mar 2022 05:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+mnNi+8VN3wwN+N0x/CPKqIa01Gv04w6AP408wKNzUY=;
 b=K8KBWA1+EDiEoGZ7fvH0zxo4tTSYIWn6lMc+ci8xGkMkxK2SsVRcCn22XRP2X5cbQy
 KTNgdYYLVP0swl1UNwEv18WkpENKEToaMOLXFzMDa4u9z2tu5idpOC+OAPU1kRVwmsX0
 B/OVrQHq4nh5ay4saHdjlLrGwpQiJSKHDVwPz0WZvH0+wk4Xfj6GhgTj1IcNhWtE0iLL
 6P9Uu638WCHmpOajuBeD9RMSfeZH+h9V+UCqM0s1cnH1Oxn5O0rlTH3Px4dA429gHdSG
 ZOtSB+X2/WiwFF8dR2ds/YhDAJnobZXjqatFqbiaQKkl/ctFP/oJCtDBupT14vobyl9l
 1dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+mnNi+8VN3wwN+N0x/CPKqIa01Gv04w6AP408wKNzUY=;
 b=QrgaqAiTi0O9J+DBCh2Pobudc0DVESaqfqOVwVzgMz5UdfBFy+06tiZe/MJHsWf6qP
 z04ezcdHeenhtC4Jd9LuZGT3+zmztzQNN6uT7s49cXF6xj5bwAnmnmdhIhjxh2j+6ReP
 znc9CBcXjZJuJKpzn6w3lPuKAdoMKT74BMJF2DJMmivM81B+KI6uyJ7HrqLPSMMc4woQ
 JjS3Eo6dddV3cNgOMcBfCzrx//mM7ayFgy4VHIqi/pC38YnXU0RiktgH1F6Ir/RawHCa
 FP/WiAgP6i0WFd2/HOoTgpDg24sLVkz9iceeqnG7Tt/SMquE/VbbXUha5TAWa/SOFfv7
 DSrQ==
X-Gm-Message-State: AOAM532EYYw9xVlzc31LZfFJanlE41gsuThHFj3lmwfbQoAICMDE+/lL
 nMRE8hUWhVYVMblZXnaq9/A=
X-Google-Smtp-Source: ABdhPJwm6d7xJQznpSpleunOvDrbRR91Cf4xDma0giVyfLLTJvpBMH4oFIpW4kH5pekKEFqYI1Xxrw==
X-Received: by 2002:a17:907:1c98:b0:6db:b42:7f81 with SMTP id
 nb24-20020a1709071c9800b006db0b427f81mr26532556ejc.258.1647433969274; 
 Wed, 16 Mar 2022 05:32:49 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:2583:b31f:3e22:ea64?
 ([2a02:908:1252:fb60:2583:b31f:3e22:ea64])
 by smtp.gmail.com with ESMTPSA id
 fy1-20020a1709069f0100b006d229ed7f30sm850183ejc.39.2022.03.16.05.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 05:32:48 -0700 (PDT)
Message-ID: <6a7a0038-0de9-ada8-aefe-2725d8f0b309@gmail.com>
Date: Wed, 16 Mar 2022 13:32:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] drm: Fix a infinite loop condition when order becomes 0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220316063416.3051-1-Arunpravin.PaneerSelvam@amd.com>
 <7545037d-a60e-7935-67c7-f25a1b00b501@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <7545037d-a60e-7935-67c7-f25a1b00b501@intel.com>
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
Cc: alexander.deucher@amd.com, pmenzel@molgen.mpg.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.03.22 um 12:31 schrieb Matthew Auld:
> On 16/03/2022 06:34, Arunpravin Paneer Selvam wrote:
>> handle a situation in the condition order-- == min_order,
>> when order = 0 and min_order = 0, leading to order = -1,
>> it now won't exit the loop. To avoid this problem,
>> added a order check in the same condition, (i.e)
>> when order is 0, we return -ENOSPC
>>
>> v2: use full name in email program and in Signed-off tag
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 72f52f293249..5ab66aaf2bbd 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -685,7 +685,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>               if (!IS_ERR(block))
>>                   break;
>>   -            if (order-- == min_order) {
>> +            if (!order || order-- == min_order) {
>
> It shouldn't be possible to enter an infinite loop here, without first 
> tripping up the BUG_ON(order < min_order) further up, and for that, as 
> we discussed here[1], it sounded like the conclusion was to rather add 
> a simple check somewhere in drm_buddy_alloc_blocks() to reject any 
> size not aligned to the min_page_size?

Sounds good to me as well.

And just to make it clear: I don't review the functionality here, that's 
up to you guys.

Just giving my Ack on things like style and pushing the end result 
upstream as necessary.

So let me know when you have settled on a solution.

Regards,
Christian.

>
> [1] https://patchwork.freedesktop.org/patch/477414/?series=101108&rev=1
>
>>                   err = -ENOSPC;
>>                   goto err_free;
>>               }
>>
>> base-commit: 3bd60c0259406c5ca3ce5cdc958fb910ad4b8175


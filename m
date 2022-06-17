Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432D254F845
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 15:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C9411AFD1;
	Fri, 17 Jun 2022 13:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFAF11AD78;
 Fri, 17 Jun 2022 11:52:35 +0000 (UTC)
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LPckm0RPDz6889Z;
 Fri, 17 Jun 2022 19:48:48 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Fri, 17 Jun 2022 13:52:32 +0200
Received: from [10.126.175.22] (10.126.175.22) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 17 Jun 2022 12:52:32 +0100
Message-ID: <60a97869-fe1d-08cb-3241-91377d62b739@huawei.com>
Date: Fri, 17 Jun 2022 12:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: radeon driver warning
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <Xinhui.Pan@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <2850bbb9-a191-d723-f878-96482e7583cb@huawei.com>
 <afd3cf7b-7afd-1d86-0c24-b4b7101e4bd5@amd.com>
From: John Garry <john.garry@huawei.com>
In-Reply-To: <afd3cf7b-7afd-1d86-0c24-b4b7101e4bd5@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.175.22]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 17 Jun 2022 13:17:59 +0000
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

Hi Christian,

> 
> well, this warning is intentional.
> 
> The key point is that your random config results in a very suboptimal 
> situation where the graphics driver only barely work.

ok

> 
> And radeon is pointing that out with this warning. That is totally 
> expected behavior.

Sure, but I don't think that it should break the build.

Can you add a boot-time warning message instead?

And/Or compile out the warning when "warnings = errors"?

All the best,
John

> 
> Regards,
> Christian.
> 
> Am 17.06.22 um 12:57 schrieb John Garry:
>> Hi guys,
>>
>> This warning in the radeon driver breaks my randconfig build on 
>> v5.19-rc2:
>>
>> drivers/gpu/drm/radeon/radeon_object.c:186:2: error: #warning Please 
>> enable CONFIG_MTRR and CONFIG_X86_PAT for better performance thanks to 
>> write-combining 
>> [;;https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgcc.gnu.org%2Fonl&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C430e22f895ec4822fe5e08da50503030%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637910602602101203%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=vT%2BWgL83xuAOqv44oVU3J4ypTDzC9f%2FNslYXtbIl56Y%3D&amp;reserved=0 
>>
>> inedocs/gcc/Warning-Options.html#index-Wcpp-Werror=cpp;;]
>>
>> Is anything being done to fix it? I don't see anything in -next or on 
>> dridevel list recently which it could be.
>>
>> thanks,
>> John
> 
> .


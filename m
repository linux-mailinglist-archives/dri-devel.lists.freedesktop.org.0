Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EDD39DCA2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 14:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54838855B;
	Mon,  7 Jun 2021 12:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508B46E8A5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 12:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 9E32A3F2D5;
 Mon,  7 Jun 2021 14:38:18 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="qU5iigEE";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.689
X-Spam-Level: 
X-Spam-Status: No, score=-2.689 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sGkiFwhQOntB; Mon,  7 Jun 2021 14:38:15 +0200 (CEST)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 1E1A13F29E;
 Mon,  7 Jun 2021 14:38:14 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.55.55.41])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 1F2B33601A1;
 Mon,  7 Jun 2021 14:38:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1623069494; bh=ElZfboEf6fzsFBE1/LW2j9100w8SISjeqUOuuSfqf/0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qU5iigEEbKf4MLerbYS8KgcpMieH6Ph6HVxaccg9wAtrZCVf2rH47dnFiBG94LeoV
 Xg+2EgRa1CuRW7xcuc9DLXKLgrj/8ma1eLQqRQy9460G+go/HzgIPf4yoagUHKDGAl
 WlypJUvh5xk/keAr0tQjD2hVB1IFCFCzHQ5ZguVs=
Subject: Re: [PATCH 1/4] drm/ttm: add TTM_PL_FLAG_TEMPORARY flag v3
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Lang.Yu@amd.com
References: <20210601122528.1643-1-christian.koenig@amd.com>
 <0051cab9-8d65-d28f-956e-3a60718bf000@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <0fc2844d-b954-2386-17e3-e2c4232fc247@shipmail.org>
Date: Mon, 7 Jun 2021 14:38:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0051cab9-8d65-d28f-956e-3a60718bf000@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sure. LGTM,

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


On 6/7/21 2:36 PM, Christian König wrote:
> Thomas any comments on this?
>
> Is the purpose of this now clear enough?
>
> Thanks,
> Christian.
>
> Am 01.06.21 um 14:25 schrieb Christian König:
>> From: Lang Yu <Lang.Yu@amd.com>
>>
>> Sometimes drivers need to use bounce buffers to evict BOs. While 
>> those reside
>> in some domain they are not necessarily suitable for CS.
>>
>> Add a flag so that drivers can note that a bounce buffers needs to be
>> reallocated during validation.
>>
>> v2: add detailed comments
>> v3 (chk): merge commits and rework commit message
>>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c    | 3 +++
>>   include/drm/ttm/ttm_placement.h | 7 +++++--
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 51a94fd63bd7..6b393502198e 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -929,6 +929,9 @@ static bool ttm_bo_places_compat(const struct 
>> ttm_place *places,
>>   {
>>       unsigned i;
>>   +    if (mem->placement & TTM_PL_FLAG_TEMPORARY)
>> +        return false;
>> +
>>       for (i = 0; i < num_placement; i++) {
>>           const struct ttm_place *heap = &places[i];
>>   diff --git a/include/drm/ttm/ttm_placement.h 
>> b/include/drm/ttm/ttm_placement.h
>> index aa6ba4d0cf78..8995c9e4ec1b 100644
>> --- a/include/drm/ttm/ttm_placement.h
>> +++ b/include/drm/ttm/ttm_placement.h
>> @@ -47,8 +47,11 @@
>>    * top of the memory area, instead of the bottom.
>>    */
>>   -#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
>> -#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
>> +#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
>> +#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
>> +
>> +/* For multihop handling */
>> +#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>>     /**
>>    * struct ttm_place

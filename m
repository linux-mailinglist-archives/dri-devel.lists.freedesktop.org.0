Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E531C7432AD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 04:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B2510E15F;
	Fri, 30 Jun 2023 02:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5AD10E15F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 02:20:09 +0000 (UTC)
X-UUID: 190f60f2e69a4b23b1f50b9cd8b6b5e0-20230630
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27, REQID:665a12d9-ccb0-4a46-a3d5-30687c7ab01a, IP:10,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:-5
X-CID-INFO: VERSION:1.1.27, REQID:665a12d9-ccb0-4a46-a3d5-30687c7ab01a, IP:10,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:01c9525, CLOUDID:fdf7650d-26a8-467f-b838-f99719a9c083,
 B
 ulkID:230629143756S0BHX8LB,BulkQuantity:3,Recheck:0,SF:38|24|17|19|44|102,
 TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD, TF_CID_SPAM_FSI, TF_CID_SPAM_ULS,
 TF_CID_SPAM_SNR, TF_CID_SPAM_FAS
X-UUID: 190f60f2e69a4b23b1f50b9cd8b6b5e0-20230630
X-User: jiangfeng@kylinos.cn
Received: from [192.168.12.178] [(116.128.244.171)] by mailgw
 (envelope-from <jiangfeng@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
 with ESMTP id 552225035; Fri, 30 Jun 2023 10:19:55 +0800
Message-ID: <d014c2af-2b03-0e65-0251-ba0a33b60a0a@kylinos.cn>
Date: Fri, 30 Jun 2023 10:19:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ttm: Remove duplicate assignments to ttm->caching
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 ray.huang@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 michael.j.ruhl@intel.com
References: <20230625024528.13668-1-jiangfeng@kylinos.cn>
 <1688091259850883.47.seg@mailgw>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <1688091259850883.47.seg@mailgw>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/6/29 14:37, Christian König wrote:
> This has already been fixed with:
> 
> commit 2ce977df10c179138e2723b25c2d2c055a3e3cc6
> Author: Ma Jun <Jun.Ma2@amd.com>
> Date:   Wed May 31 13:30:51 2023 +0800
> 
>     drm/ttm: Remove redundant code in ttm_tt_init_fields
> 
>     Remove redundant assignment code for ttm->caching as it's overwritten
>     just a few lines later.
> 
>     v2:
>      - Update the commit message.
> 
>     Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>     Reviewed-by: Guchun Chen <guchun.chen@amd.com>
>     Reviewed-by: Christian König <christian.koenig@amd.com>
>     Signed-off-by: Christian König <christian.koenig@amd.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20230531053051.3453509-1-Jun.Ma2@amd.com
> 
> 
> Regards,
> Christian.
> 
> Am 25.06.23 um 04:45 schrieb Feng Jiang:
>> The parameter 'caching' has already been assigned to
>> 'ttm->caching', so 'ttm_cached' is redundant.
>>
>> Fixes: 1b4ea4c5980f ("drm/ttm: set the tt caching state at creation time")
>> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
>> ---
>>   drivers/gpu/drm/ttm/ttm_tt.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>> index ab725d9d14a6..1ce4b36ab33b 100644
>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>> @@ -137,7 +137,6 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>>                      unsigned long extra_pages)
>>   {
>>       ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra_pages;
>> -    ttm->caching = ttm_cached;
>>       ttm->page_flags = page_flags;
>>       ttm->dma_address = NULL;
>>       ttm->swap_storage = NULL;
> 
Sorry, I will check before sending next time, thanks!
-- 
Best regards,
Feng


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A106E0B20
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 12:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C9610EAB3;
	Thu, 13 Apr 2023 10:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CF110EA93;
 Thu, 13 Apr 2023 09:07:59 +0000 (UTC)
X-UUID: ac554be449504740905c05f58801cb84-20230413
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:6d0106df-019e-4719-b4d6-b8cfbc9b1b9b, IP:5,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-3
X-CID-INFO: VERSION:1.1.22, REQID:6d0106df-019e-4719-b4d6-b8cfbc9b1b9b, IP:5,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-3
X-CID-META: VersionHash:120426c, CLOUDID:5ccdef83-cd9c-45f5-8134-710979e3df0e,
 B
 ulkID:230413141019L665JQNP,BulkQuantity:11,Recheck:0,SF:43|24|17|19|102,TC
 :nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: ac554be449504740905c05f58801cb84-20230413
X-User: liucong2@kylinos.cn
Received: from [172.20.119.219] [(116.128.244.169)] by mailgw
 (envelope-from <liucong2@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
 with ESMTP id 1121509071; Thu, 13 Apr 2023 17:07:50 +0800
Message-ID: <0ff4dfcd-ee87-ddef-df47-4c11edb6ac94@kylinos.cn>
Date: Thu, 13 Apr 2023 17:07:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/i915: Fix memory leaks in i915 selftests
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <874jpkckxw.fsf@intel.com>
 <20230413075526.221068-1-liucong2@kylinos.cn>
 <ZDfBAs/RKfAljk4o@ashyti-mobl2.lan>
From: Cong Liu <liucong2@kylinos.cn>
In-Reply-To: <ZDfBAs/RKfAljk4o@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 13 Apr 2023 10:10:28 +0000
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@linux.intel.com, mchehab@kernel.org,
 andrzej.hajda@intel.com, intel-gfx@lists.freedesktop.org,
 jonathan.cavitt@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 nirmoy.das@intel.com, rodrigo.vivi@intel.com, gwan-gyeong.mun@intel.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

thank you for your reminder, next time I will pay attention to my 
format, and when someone has already
reviewed, add the Reviewed-by field

Regards.

On 2023/4/13 16:44, Andi Shyti wrote:
> On Thu, Apr 13, 2023 at 03:55:26PM +0800, Cong Liu wrote:
>> This patch fixes memory leaks on error escapes in function fake_get_pages
>>
>> Fixes: c3bfba9a2225 ("drm/i915: Check for integer truncation on scatterlist creation")
>> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
> OK, while I was proposing the adjustments suggested by Jani you
> already replied to the e-mail. I will keep your version.
>
> Anyway, next time, please, do not forget to add the r-b's, in
> this case it was Andrzej's.
>
> Andi
>
>> ---
>>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>> index 5361ce70d3f2..154801f1c468 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>> @@ -69,8 +69,10 @@ static int fake_get_pages(struct drm_i915_gem_object *obj)
>>   
>>   	rem = round_up(obj->base.size, BIT(31)) >> 31;
>>   	/* restricted by sg_alloc_table */
>> -	if (overflows_type(rem, unsigned int))
>> +	if (overflows_type(rem, unsigned int)) {
>> +		kfree(pages);
>>   		return -E2BIG;
>> +	}
>>   
>>   	if (sg_alloc_table(pages, rem, GFP)) {
>>   		kfree(pages);
>> -- 
>> 2.34.1
>>
>>
>> No virus found
>> 		Checked by Hillstone Network AntiVirus

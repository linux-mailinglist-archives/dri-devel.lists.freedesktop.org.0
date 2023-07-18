Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9620758136
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 17:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5074110E372;
	Tue, 18 Jul 2023 15:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1250310E372
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:44:48 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cx5_Fus7ZkN9YGAA--.17836S3;
 Tue, 18 Jul 2023 23:44:46 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Ax3c5ds7ZkhnYzAA--.11134S3; 
 Tue, 18 Jul 2023 23:44:46 +0800 (CST)
Message-ID: <674cc4b7-6cb1-5329-d06d-c981ac8ad240@loongson.cn>
Date: Tue, 18 Jul 2023 23:44:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm: loongson: Add a check for lsdc_bo_create() errors
To: Dan Carpenter <dan.carpenter@linaro.org>, conduct@kernel.org
References: <0da6859b-40cc-4b3e-b8b6-fed157517083@moroto.mountain>
 <c9ac14ee-7cfc-c10b-4a55-37049bbb4338@loongson.cn>
 <bbaa11a9-9984-40c1-bd63-adc8698d0185@kadam.mountain>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <bbaa11a9-9984-40c1-bd63-adc8698d0185@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Ax3c5ds7ZkhnYzAA--.11134S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxur4fCw4xur45tF4fAF45CFX_yoW5ZryrpF
 47J3WYkF4DJr1Iyas2qay0k3WFva4FqFyUWayrJw1YkwsxX3WIkryj9F1Y9Fy5uFW8u3y2
 vrWDWay3uF1avagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
 Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
 14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
 1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F
 4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
 zcTmUUUUU
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/7/18 21:27, Dan Carpenter wrote:
> Basically everything in this email was wrong to a kind of shocking
> degree.  For example, ignoring kmalloc() failure is a bug so the fixes
> tag is definitely warranted.  But then you called me "bare brained"
> which seems like a personal attack

Sorry, that's a misunderstanding

Sorry for my broken English.

by "bare brain",  I means that by using the brains(pure code review) only,

I conjure up this adjective from the word "bare metal".

When I reply you email, I lack a word to describe this.

I believe that many experts have this sort of ability,

they could create a patch by simply give a glimpse of the code.

because they know how does the code run at the very low level.


> so I'm going to report this as a code
> of conduct violation.

Sorry Dan,  you are welcomed.

Please withdraw this report.

I don't know why are you angry.

Because our hardware is rare,

Originally, by using the words "bare brain", I means by "pure brain",

I means that you probably without a hardware platform to do verification.

I want to know that if you have tested your patch on the board.

Or, I want to probe that if you have our hardware.

I will consider to send you one if you are long time contributor and if 
you are really interested.

I have a lot of boards, now I'm feel a little bit tired by developing 
drivers for all of them.


Please withdraw that report,  personal attack tend to continues(across) 
to multiple thread.

Sorry for my broken English. I will improve my written skill in the long 
term.

Thanks for you contribution.


> regards,
> dan carpenter
>
> On Tue, Jul 18, 2023 at 08:32:02PM +0800, suijingfeng wrote:
>> Hi,
>>
>>
>> Thanks for the patch.
>>
>>
>> The commit title generally should be 'drm/looongson: Add a check for
>> lsdc_bo_create() errors'
>>
>> not 'drm: loongson: xxxx'
>>
>>
>> On 2023/7/18 15:01, Dan Carpenter wrote:
>>> The lsdc_bo_create() function can fail so add a check for that.
>>>
>>> Fixes: f39db26c5428 ("drm: Add kms driver for loongson display controller")
>> Please drop this Fixes tag,  because you patch just add a error handling.
>>
>> Yes,  the lsdc_bo_create() function can fail, but this is generally not
>> happen.
>>
>> Even if the fail happened,  your patch is not fixing the root problem.
>>
>>
>> I know that you create this patch with the bare brain,
>>
>> I would like hear more practical usage or bugs of this driver.
>>
>> And mention more in the commit message is preferred.
>>
>>
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> ---
>>>    drivers/gpu/drm/loongson/lsdc_ttm.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
>>> index bb0c8fd43a75..bf79dc55afa4 100644
>>> --- a/drivers/gpu/drm/loongson/lsdc_ttm.c
>>> +++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
>>> @@ -496,6 +496,8 @@ struct lsdc_bo *lsdc_bo_create_kernel_pinned(struct drm_device *ddev,
>>>    	int ret;
>>>    	lbo = lsdc_bo_create(ddev, domain, size, true, NULL, NULL);
>>> +	if (IS_ERR(lbo))
>>> +		return ERR_CAST(lbo);
>>>    	ret = lsdc_bo_reserve(lbo);
>>>    	if (unlikely(ret)) {


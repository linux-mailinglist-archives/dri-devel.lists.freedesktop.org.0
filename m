Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EE57C62AE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 04:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFD210E3D6;
	Thu, 12 Oct 2023 02:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4879510E3D6;
 Thu, 12 Oct 2023 02:20:58 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxXOoHWCdlEzwxAA--.2134S3;
 Thu, 12 Oct 2023 10:20:56 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxfNz+Vydlwj4hAA--.4675S3; 
 Thu, 12 Oct 2023 10:20:55 +0800 (CST)
Message-ID: <8532764a-ac25-ff66-07cb-60a0eb011a01@loongson.cn>
Date: Thu, 12 Oct 2023 10:20:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 0/5] drm/etnaviv: Various cleanup
To: Lucas Stach <l.stach@pengutronix.de>
References: <20231002111207.513297-1-suijingfeng@loongson.cn>
 <8201caf4102cbb81ea15e87713a165590b11a684.camel@pengutronix.de>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <8201caf4102cbb81ea15e87713a165590b11a684.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxfNz+Vydlwj4hAA--.4675S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtw18GrW7CFykZrWkAF1DJwc_yoW3Cwc_uF
 W8Zr97Xr4fJF1vqFy7A3s5AFW0kF4rXrsFq3Wjq39FgrZIqFnxZr1kG3yUW34UXFW7KFnr
 XF93JryfAFy7WosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
 s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
 cSsGvfJTRUUUbfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
 vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
 w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
 Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
 JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 CYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
 6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
 0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
 v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
 xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8TqcUUUUUU==
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Lucas


Thanks a lot!


On 2023/10/12 01:04, Lucas Stach wrote:
> Am Montag, dem 02.10.2023 um 19:12 +0800 schrieb Sui Jingfeng:
>> v2:
>> 	* refine on v1 and update
>>
> Thanks, series applied to my etnaviv/next branch.
>
> Regards,
> Lucas
>
>> Sui Jingfeng (5):
>>    drm/etnaviv: Drop the second argument of the etnaviv_gem_new_impl()
>>    drm/etnaviv: Fix coding style
>>    drm/etnaviv: Add helper functions to create and destroy platform
>>      device
>>    drm/etnaviv: Add a helper to get the first available GPU device node
>>    drm/etnaviv: Using 'dev' instead of 'etnaviv_obj->base.dev'
>>
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 93 ++++++++++++++++++---------
>>   drivers/gpu/drm/etnaviv/etnaviv_gem.c | 12 ++--
>>   2 files changed, 67 insertions(+), 38 deletions(-)
>>


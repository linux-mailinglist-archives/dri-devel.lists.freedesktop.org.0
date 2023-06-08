Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22142727BB0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 11:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8511210E0A8;
	Thu,  8 Jun 2023 09:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 78EA810E0A8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 09:43:35 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxTuvFooFkTnsAAA--.1898S3;
 Thu, 08 Jun 2023 17:43:33 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx+OTEooFkYS0HAA--.23186S3; 
 Thu, 08 Jun 2023 17:43:33 +0800 (CST)
Message-ID: <6d5b5538-6ef3-a409-4a8f-bb9b54eb478c@loongson.cn>
Date: Thu, 8 Jun 2023 17:43:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/logicvc: Kconfig: select REGMAP and REGMAP_MMIO
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230608024207.581401-1-suijingfeng@loongson.cn>
 <ZIGAEZTJvq1GqFVD@aptenodytes>
 <aff664c7-b692-4fcf-ad61-8030cc648501@loongson.cn>
 <ZIGf6mKwX9RIm5a5@ashyti-mobl2.lan>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <ZIGf6mKwX9RIm5a5@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx+OTEooFkYS0HAA--.23186S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Xr13KFyrtw1DXF47GFy5KFX_yoW8JrWrpF
 W8Ka4qyFs2vrWYkrn2yr12qFyYqr1rKrWaqr1q9rnrAFn0vr1Dtrs7ZrWUWr13WwnrKr4Y
 vanrKay3Ga17C3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
 1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jn
 UUUUUUUU=
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,  thanks for your reply and help.

On 2023/6/8 17:31, Andi Shyti wrote:
> Hi Jingfeng,
>
> On Thu, Jun 08, 2023 at 03:24:54PM +0800, Sui Jingfeng wrote:
>> Hi,
>>
>> thanks a lot
>>
>> On 2023/6/8 15:15, Paul Kocialkowski wrote:
>>> Hi,
>>>
>>> On Thu 08 Jun 23, 10:42, Sui Jingfeng wrote:
>>>> drm/logicvc driver is depend on REGMAP and REGMAP_MMIO, should select this
>>>> two kconfig option, otherwise the driver failed to compile on platform
>>>> without REGMAP_MMIO selected:
>>>>
>>>> ERROR: modpost: "__devm_regmap_init_mmio_clk" [drivers/gpu/drm/logicvc/logicvc-drm.ko] undefined!
>>>> make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
>>>> make: *** [Makefile:1978: modpost] Error 2
>>>>
>>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>> Thanks for the fix, looks good to me!
>>>
>>> Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>> After received this Acked-by, do a need append this tag to the patch, and
>> resend this again?
>>
>> I don't know about this.
>>
>> I don't need to do anythings ales, you will push it to your repository,
>> right?
> no need... someone will pick it up and add the needed tags.
Thanks a lot. Happy coding! :-)
> Andi

-- 
Jingfeng


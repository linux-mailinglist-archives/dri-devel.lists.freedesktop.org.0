Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A8B736264
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 05:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA9210E16A;
	Tue, 20 Jun 2023 03:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3AD0210E16A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 03:56:45 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxY+h7I5FkbgoHAA--.421S3;
 Tue, 20 Jun 2023 11:56:44 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxauV7I5FkciwhAA--.27771S3; 
 Tue, 20 Jun 2023 11:56:43 +0800 (CST)
Message-ID: <50fbc003-fd3c-c7c4-9c6b-76d14a0babfc@loongson.cn>
Date: Tue, 20 Jun 2023 11:56:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/logicvc: Kconfig: select REGMAP and REGMAP_MMIO
Content-Language: en-US
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
References: <20230608024207.581401-1-suijingfeng@loongson.cn>
 <ZIGAEZTJvq1GqFVD@aptenodytes>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <ZIGAEZTJvq1GqFVD@aptenodytes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8AxauV7I5FkciwhAA--.27771S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF1kZryDZr18GF1xur13Jrc_yoW8Xr43pF
 W8ta4jyF4IvFWakF1IyF1aqFy5X3Z5GrWa9Fy2k3Z8u3s8CF1DZr93ZrWYgFy5XrZrAF4x
 t3Z3Ka45GF47CacCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
 Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
 14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2uc_DUUUU
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/8 15:15, Paul Kocialkowski wrote:
> Hi,
>
> On Thu 08 Jun 23, 10:42, Sui Jingfeng wrote:
>> drm/logicvc driver is depend on REGMAP and REGMAP_MMIO, should select this
>> two kconfig option, otherwise the driver failed to compile on platform
>> without REGMAP_MMIO selected:
>>
>> ERROR: modpost: "__devm_regmap_init_mmio_clk" [drivers/gpu/drm/logicvc/logicvc-drm.ko] undefined!
>> make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
>> make: *** [Makefile:1978: modpost] Error 2
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Thanks for the fix, looks good to me!
>
> Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>


Thanks a lot,


Please don't forget to push this to drm-misc or drm-tip if you has the time,

as (even though trivial) it's precious for me.


> Cheers,
>
> Paul
>
>> ---
>>   drivers/gpu/drm/logicvc/Kconfig | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/logicvc/Kconfig b/drivers/gpu/drm/logicvc/Kconfig
>> index fa7a88368809..1df22a852a23 100644
>> --- a/drivers/gpu/drm/logicvc/Kconfig
>> +++ b/drivers/gpu/drm/logicvc/Kconfig
>> @@ -5,5 +5,7 @@ config DRM_LOGICVC
>>   	select DRM_KMS_HELPER
>>   	select DRM_KMS_DMA_HELPER
>>   	select DRM_GEM_DMA_HELPER
>> +	select REGMAP
>> +	select REGMAP_MMIO
>>   	help
>>   	  DRM display driver for the logiCVC programmable logic block from Xylon
>> -- 
>> 2.25.1
>>
-- 
Jingfeng


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A63C725B91
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 12:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D92210E4A9;
	Wed,  7 Jun 2023 10:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id C406E10E4A9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 10:25:35 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Dxi+oeW4Bk2RoAAA--.386S3;
 Wed, 07 Jun 2023 18:25:34 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxbMoeW4Bk9VUEAA--.7057S3; 
 Wed, 07 Jun 2023 18:25:34 +0800 (CST)
Message-ID: <26b1f0a2-7bb0-b5eb-fa1f-2d646cff3f1f@loongson.cn>
Date: Wed, 7 Jun 2023 18:25:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/ingenic: Kconfig: select REGMAP and REGMAP_MMIO
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230607072253.440613-1-suijingfeng@loongson.cn>
 <845a483ed09728c712ad57b1fe9bc5c930a72d98.camel@crapouillou.net>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <845a483ed09728c712ad57b1fe9bc5c930a72d98.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxbMoeW4Bk9VUEAA--.7057S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJry8tFy5tr1DJF18Zr13GFX_yoW8Aryfpr
 s5ta4UuFWxuF4vkr12yF17WFy5Xw15Ja4rArykta4q9ryDAr1jqrZrZFZ09FyDAr4xJr4U
 X3s7GFy7ZF17XrbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
 wI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
 AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr
 0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU
 FyCJUUUUU
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
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ok, thanks

On 2023/6/7 17:46, Paul Cercueil wrote:
> Hi Sui,
>
> Le mercredi 07 juin 2023 à 15:22 +0800, Sui Jingfeng a écrit :
>> Otherwise its failed to pass basic compile test on platform without
>> REGMAP_MMIO selected by defconfig
>>
>> make -j$(nproc) ARCH=mips CROSS_COMPILE=mips64el-linux-gnuabi64-
>>
>>    SYNC    include/config/auto.conf.cmd
>>    Checking missing-syscalls for N32
>>    CALL    scripts/checksyscalls.sh
>>    Checking missing-syscalls for O32
>>    CALL    scripts/checksyscalls.sh
>>    CALL    scripts/checksyscalls.sh
>>    MODPOST Module.symvers
>> ERROR: modpost: "__devm_regmap_init_mmio_clk"
>> [drivers/gpu/drm/ingenic/ingenic-drm.ko] undefined!
>> make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
>> make: *** [Makefile:1978: modpost] Error 2
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/ingenic/Kconfig | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ingenic/Kconfig
>> b/drivers/gpu/drm/ingenic/Kconfig
>> index a53f475d33df..7457c0b65034 100644
>> --- a/drivers/gpu/drm/ingenic/Kconfig
>> +++ b/drivers/gpu/drm/ingenic/Kconfig
>> @@ -5,6 +5,8 @@ config DRM_INGENIC
>>          depends on CMA
>>          depends on OF
>>          depends on COMMON_CLK
>> +       select REGMAP
>> +       select REGMAP_MMIO
> nit: order alphabetically (move them after the DRM_* ones).
>
> Cheers,
> -Paul
>
>>          select DRM_BRIDGE
>>          select DRM_PANEL_BRIDGE
>>          select DRM_KMS_HELPER

-- 
Jingfeng


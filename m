Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381E974CD1C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 08:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B5810E1A8;
	Mon, 10 Jul 2023 06:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B2BC10E1A8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 06:35:00 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Dxg_CSpqtkffkCAA--.8560S3;
 Mon, 10 Jul 2023 14:34:58 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxF8x7pqtkJNomAA--.4871S3; 
 Mon, 10 Jul 2023 14:34:56 +0800 (CST)
Message-ID: <f5006633-889b-9371-f5d9-8d5d6bb9ed4e@loongson.cn>
Date: Mon, 10 Jul 2023 14:34:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/hyperv: Fix a compilation issue because of not
 including screen_info.h
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 Deepak Rawat <drawat.floss@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, Arnd Bergmann <arnd@arndb.de>
References: <20230709100514.703759-1-suijingfeng@loongson.cn>
 <BYAPR21MB16887E35CE80D293DE2243E0D730A@BYAPR21MB1688.namprd21.prod.outlook.com>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <BYAPR21MB16887E35CE80D293DE2243E0D730A@BYAPR21MB1688.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxF8x7pqtkJNomAA--.4871S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw15Wr4UKF4DZF17GryfuFX_yoW8urW5pF
 48AFy3ArW0yr43K39xAF1fAF1Ygws8Ja48uF9Fywn0934jya4UJFZrWr9FkrW5Jw1akF1F
 qryDJay5u3W7CabCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
 wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
 CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
 67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
 WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcVc_
 UUUUU
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

OK, thanks a lot,

done!

On 2023/7/10 13:20, Michael Kelley (LINUX) wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn> Sent: Sunday, July 9, 2023 3:05 AM
>>     drivers/video/fbdev/hyperv_fb.c: In function 'hvfb_getmem':
>>>> drivers/video/fbdev/hyperv_fb.c:1033:24: error: 'screen_info' undeclared (first use
>> in this function)
>>      1033 |                 base = screen_info.lfb_base;
>>           |                        ^~~~~~~~~~~
>>     drivers/video/fbdev/hyperv_fb.c:1033:24: note: each undeclared identifier is reported
>> only once for each function it appears in
>> --
>>     drivers/gpu/drm/hyperv/hyperv_drm_drv.c: In function 'hyperv_setup_vram':
>>>> drivers/gpu/drm/hyperv/hyperv_drm_drv.c:75:54: error: 'screen_info' undeclared
>> (first use in this function)
>>        75 |         drm_aperture_remove_conflicting_framebuffers(screen_info.lfb_base,
>>           |                                                      ^~~~~~~~~~~
>>     drivers/gpu/drm/hyperv/hyperv_drm_drv.c:75:54: note: each undeclared identifier is
>> reported only once for each function it appears in
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202307090823.nxnT8Kk5-lkp@intel.com/
>> Fixes: 81d2393485f0 ("fbdev/hyperv-fb: Do not set struct fb_info.apertures")
>> Fixes: 8b0d13545b09 ("efi: Do not include <linux/screen_info.h> from EFI header")
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> index a7d2c92d6c6a..8026118c6e03 100644
>> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/hyperv.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>> +#include <linux/screen_info.h>
>>
>>   #include <drm/drm_aperture.h>
>>   #include <drm/drm_atomic_helper.h>
>> --
>> 2.25.1
> Reviewed-by: Michael Kelley <mikelley@microsoft.com>


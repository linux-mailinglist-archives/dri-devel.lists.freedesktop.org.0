Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E0A747B28
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 03:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3543E10E0C5;
	Wed,  5 Jul 2023 01:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id E47F310E0C5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 01:41:53 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Ax1fBgyqRkty4AAA--.934S3;
 Wed, 05 Jul 2023 09:41:52 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx_c5fyqRkm80bAA--.19525S3; 
 Wed, 05 Jul 2023 09:41:51 +0800 (CST)
Message-ID: <6fc51f26-6844-6fa0-23be-81aa5ac50fd6@loongson.cn>
Date: Wed, 5 Jul 2023 09:41:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [03/12] sysfb: Do not include <linux/screen_info.h> from sysfb
 header
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
References: <20230629121952.10559-4-tzimmermann@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230629121952.10559-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Cx_c5fyqRkm80bAA--.19525S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jry7XFWDKF4fZw13Aw1xCrX_yoWDWFc_C3
 97CF1xGa1UXr4fZa4SyFn7Zr1Ygw48Ar1fZ3Z3trsrX3WDJanxG393Gas3tayxWr97CrZx
 Aas5Cr97Cry7uosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
 s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
 cSsGvfJTRUUUbhxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
 vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
 w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
 6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
 6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF
 7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8q0PDUUUUU==
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
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/6/29 19:45, Thomas Zimmermann wrote:
> The header file <linux/sysfb.h> does not need anything from
> <linux/screen_info.h>. Declare struct screen_info and remove
> the include statements.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>


Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>


> ---
>   include/linux/sysfb.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index c1ef5fc60a3cb..19cb803dd5ecd 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -9,7 +9,8 @@
>   
>   #include <linux/kernel.h>
>   #include <linux/platform_data/simplefb.h>
> -#include <linux/screen_info.h>
> +
> +struct screen_info;
>   
>   enum {
>   	M_I17,		/* 17-Inch iMac */


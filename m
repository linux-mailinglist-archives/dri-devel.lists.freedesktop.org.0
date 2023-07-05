Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3CA747B35
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 03:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E9D10E0C9;
	Wed,  5 Jul 2023 01:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 995EC10E0C9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 01:43:11 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Ax1fCuyqRk4S4AAA--.939S3;
 Wed, 05 Jul 2023 09:43:10 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxJ82tyqRkCM4bAA--.17672S3; 
 Wed, 05 Jul 2023 09:43:09 +0800 (CST)
Message-ID: <dc239a28-4314-1661-f556-670946a0982b@loongson.cn>
Date: Wed, 5 Jul 2023 09:43:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [11/12] fbdev/core: Protect edid_info with
 CONFIG_ARCH_HAS_EDID_INFO
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
References: <20230629121952.10559-12-tzimmermann@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230629121952.10559-12-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxJ82tyqRkCM4bAA--.17672S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF4rtF4rKw1kKFWkJF1fAFc_yoW8Gr1Upr
 W0qa98trW8tr47W3y8Kws2vFW5X34rGFy29rZ7G3W5Kryqv3y5WFyUJrn0kr93ur4xAr4I
 yryvqw13CFnruagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBlb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
 wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
 xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
 Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcV
 AKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
 z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv
 6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8q0PDUUUUU==
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
 loongarch@lists.linux.dev, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-fbdev@vger.kernel.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/6/29 19:45, Thomas Zimmermann wrote:
> Guard usage of edid_info with CONFIG_ARCH_HAS_EDID_INFO instead
> of CONFIG_X86. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>


> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> ---
>   drivers/video/fbdev/core/fbmon.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
> index 35be4431f649a..9ae063021e431 100644
> --- a/drivers/video/fbdev/core/fbmon.c
> +++ b/drivers/video/fbdev/core/fbmon.c
> @@ -1480,17 +1480,19 @@ int fb_validate_mode(const struct fb_var_screeninfo *var, struct fb_info *info)
>   		-EINVAL : 0;
>   }
>   
> -#if defined(CONFIG_FIRMWARE_EDID) && defined(CONFIG_X86)
> +#if defined(CONFIG_FIRMWARE_EDID)
>   const unsigned char *fb_firmware_edid(struct fb_info *info)
>   {
>   	unsigned char *edid = NULL;
>   
> +#if defined(CONFIG_ARCH_HAS_EDID_INFO)
>   	/*
>   	 * We need to ensure that the EDID block is only
>   	 * returned for the primary graphics adapter.
>   	 */
>   	if (fb_is_primary_device(info))
>   		edid = edid_info.dummy;
> +#endif
>   
>   	return edid;
>   }


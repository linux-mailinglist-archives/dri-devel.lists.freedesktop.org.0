Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2601A72DAF9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4108810E340;
	Tue, 13 Jun 2023 07:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8712410E340
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:32:04 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxNulwG4hkW4AEAA--.7545S3;
 Tue, 13 Jun 2023 15:32:00 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxGOVuG4hkSaMYAA--.5221S3; 
 Tue, 13 Jun 2023 15:31:58 +0800 (CST)
Message-ID: <19745770-0a63-dfeb-741f-5bfe2ed11b1c@loongson.cn>
Date: Tue, 13 Jun 2023 15:31:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v2] drm/ingenic: Kconfig: select REGMAP and REGMAP_MMIO
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230607110650.569522-1-suijingfeng@loongson.cn>
Content-Language: en-US
Organization: Loongson
In-Reply-To: <20230607110650.569522-1-suijingfeng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxGOVuG4hkSaMYAA--.5221S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFy3Kw45XryfKF4xZr4rXrc_yoW8Gw1xpr
 s8twn5uFZ7ZFWYyrW2yF1xKFy3X3WrXFWFkr9xtwn09r98AFyjkrZayFZxGF9rAr17urW7
 Xas3KFy7JF17AacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
 67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
 xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
 x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r
 1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
 7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
 WxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x
 07Uimi_UUUUU=
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

Hi,


Humble ping ?


On 2023/6/7 19:06, Sui Jingfeng wrote:
> Otherwise its failed to pass basic compile test on platform without
> REGMAP_MMIO selected by defconfig
>
> make -j$(nproc) ARCH=mips CROSS_COMPILE=mips64el-linux-gnuabi64-
>
>    SYNC    include/config/auto.conf.cmd
>    Checking missing-syscalls for N32
>    CALL    scripts/checksyscalls.sh
>    Checking missing-syscalls for O32
>    CALL    scripts/checksyscalls.sh
>    CALL    scripts/checksyscalls.sh
>    MODPOST Module.symvers
> ERROR: modpost: "__devm_regmap_init_mmio_clk" [drivers/gpu/drm/ingenic/ingenic-drm.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
> make: *** [Makefile:1978: modpost] Error 2
>
> V2: Order alphabetically
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>   drivers/gpu/drm/ingenic/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
> index a53f475d33df..b440e0cdc057 100644
> --- a/drivers/gpu/drm/ingenic/Kconfig
> +++ b/drivers/gpu/drm/ingenic/Kconfig
> @@ -9,6 +9,8 @@ config DRM_INGENIC
>   	select DRM_PANEL_BRIDGE
>   	select DRM_KMS_HELPER
>   	select DRM_GEM_DMA_HELPER
> +	select REGMAP
> +	select REGMAP_MMIO
>   	select VT_HW_CONSOLE_BINDING if FRAMEBUFFER_CONSOLE
>   	help
>   	  Choose this option for DRM support for the Ingenic SoCs.

-- 
Jingfeng


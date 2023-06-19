Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8827349D2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 03:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6C110E00E;
	Mon, 19 Jun 2023 01:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id AEF9910E00E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 01:57:38 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Ax0OgPto9k+bAGAA--.11877S3;
 Mon, 19 Jun 2023 09:57:36 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxFOQNto9kUacfAA--.23409S3; 
 Mon, 19 Jun 2023 09:57:34 +0800 (CST)
Message-ID: <aa7fc787-2b30-ae1d-ea05-47fc41bb3831@loongson.cn>
Date: Mon, 19 Jun 2023 09:57:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [08/14] drm/ast: Set up release action right after enabling MMIO
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230616140739.32042-9-tzimmermann@suse.de>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230616140739.32042-9-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxFOQNto9kUacfAA--.23409S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZFWUJF13GFW5tr1xKFWrCrX_yoW5WrW5pF
 s7GayFyrW5Jr1IgrsxZrWDAFyS93WIq3WrCrnrGw4S93s2y34ktF95tr1UZr9IyrZ7AFy2
 qFZrKFy8C3WDuwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8SdgUUU
 UU=
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


Tested with ast2400


On 2023/6/16 21:52, Thomas Zimmermann wrote:
> Ast sets up a managed release of the MMIO access flags. Move this
> code next to the MMIO access code, so that it runs if other errors
> occur during the device initialization.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

> ---
>   drivers/gpu/drm/ast/ast_main.c | 38 +++++++++++++++++-----------------
>   1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 3295876c09b35..6ff4b837e64d7 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -71,11 +71,25 @@ static void ast_enable_vga(struct drm_device *dev)
>   	ast_io_write8(ast, AST_IO_MISC_PORT_WRITE, 0x01);
>   }
>   
> -static void ast_enable_mmio(struct drm_device *dev)
> +/*
> + * Run this function as part of the HW device cleanup; not
> + * when the DRM device gets released.
> + */


> +static void ast_enable_mmio_release(void *data)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
> +	struct ast_device *ast = data;
> +
> +	/* enable standard VGA decode */
> +	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
> +}
> +
> +static int ast_enable_mmio(struct ast_device *ast)
> +{
> +	struct drm_device *dev = &ast->base;
>   
>   	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x06);
> +
> +	return devm_add_action_or_reset(dev->dev, ast_enable_mmio_release, ast);
>   }
>   
>   static void ast_open_key(struct ast_device *ast)
> @@ -392,18 +406,6 @@ static int ast_get_dram_info(struct drm_device *dev)
>   	return 0;
>   }
>   
> -/*
> - * Run this function as part of the HW device cleanup; not
> - * when the DRM device gets released.
> - */
> -static void ast_device_release(void *data)
> -{
> -	struct ast_device *ast = data;
> -
> -	/* enable standard VGA decode */
> -	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
> -}
> -
>   struct ast_device *ast_device_create(const struct drm_driver *drv,
>   				     struct pci_dev *pdev,
>   				     unsigned long flags)
> @@ -465,7 +467,9 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   
>   	/* Enable extended register access */
>   	ast_open_key(ast);
> -	ast_enable_mmio(dev);
> +	ret = ast_enable_mmio(ast);
> +	if (ret)
> +		return ERR_PTR(ret);
>   
>   	/* Find out whether P2A works or whether to use device-tree */
>   	ast_detect_config_mode(dev, &scu_rev);
> @@ -498,9 +502,5 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> -	ret = devm_add_action_or_reset(dev->dev, ast_device_release, ast);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
>   	return ast;
>   }

-- 
Jingfeng


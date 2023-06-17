Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5BD733EE7
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 08:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B3510E02F;
	Sat, 17 Jun 2023 06:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2196510E02F
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 06:54:31 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxLuujWI1kbjwGAA--.13428S3;
 Sat, 17 Jun 2023 14:54:28 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxTMqjWI1kIgUeAA--.10469S3; 
 Sat, 17 Jun 2023 14:54:27 +0800 (CST)
Message-ID: <60af0f6e-3cbe-fb49-bc9b-9a0d5fbb2cb5@loongson.cn>
Date: Sat, 17 Jun 2023 14:54:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [03/14] drm/ast: Implement register helpers in ast_drv.h
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230616140739.32042-4-tzimmermann@suse.de>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230616140739.32042-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8BxTMqjWI1kIgUeAA--.10469S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuF48ZrW5tw4DKFWrXw45CFX_yoW5try7p3
 9xJa9a9rWUJF129rZxZFyDAFyfG3Z7Ka4FkrWDW3yv939xZr1ktryqvw43A345GrWxZFyU
 JFsrGry8A3W5JagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
 Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
 JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 CYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
 6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
 0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
 v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/6/16 21:52, Thomas Zimmermann wrote:
> There are already a number of register I/O functions in ast_drv.h.
> For consistency, move the remaining functions there as well. No
> functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  | 34 ++++++++++++++++++++++++----------
>   drivers/gpu/drm/ast/ast_main.c | 28 ----------------------------
>   2 files changed, 24 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index fc4760a67596f..0141705beaee9 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -257,22 +257,36 @@ static inline void ast_io_write8(struct ast_device *ast, u32 reg, u8 val)
>   	iowrite8(val, ast->ioregs + reg);
>   }
>   
> -static inline void ast_set_index_reg(struct ast_device *ast,
> -				     uint32_t base, uint8_t index,
> -				     uint8_t val)
> +static inline u8 ast_get_index_reg(struct ast_device *ast, u32 base, u8 index)
> +{
> +	ast_io_write8(ast, base, index);
> +	++base;
> +	return ast_io_read8(ast, base);
> +}
> +
> +static inline u8 ast_get_index_reg_mask(struct ast_device *ast, u32 base, u8 index,
> +					u8 preserve_mask)
> +{
> +	u8 val = ast_get_index_reg(ast, base, index);
> +
> +	return val & preserve_mask;
> +}
> +
> +static inline void ast_set_index_reg(struct ast_device *ast, u32 base, u8 index, u8 val)
>   {
>   	ast_io_write8(ast, base, index);
>   	++base;
>   	ast_io_write8(ast, base, val);
>   }
>   
> -void ast_set_index_reg_mask(struct ast_device *ast,
> -			    uint32_t base, uint8_t index,
> -			    uint8_t mask, uint8_t val);
> -uint8_t ast_get_index_reg(struct ast_device *ast,
> -			  uint32_t base, uint8_t index);
> -uint8_t ast_get_index_reg_mask(struct ast_device *ast,
> -			       uint32_t base, uint8_t index, uint8_t mask);
> +static inline void ast_set_index_reg_mask(struct ast_device *ast, u32 base, u8 index,
> +					  u8 preserve_mask, u8 val)
> +{
> +	u8 tmp = ast_get_index_reg_mask(ast, base, index, preserve_mask);
> +
> +	tmp |= val;
> +	ast_set_index_reg(ast, base, index, tmp);
> +}
>   
>   static inline void ast_open_key(struct ast_device *ast)
>   {
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index da33cfc6366ec..862fdf02f6100 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -35,34 +35,6 @@
>   
>   #include "ast_drv.h"
>   
> -void ast_set_index_reg_mask(struct ast_device *ast,
> -			    uint32_t base, uint8_t index,
> -			    uint8_t mask, uint8_t val)
> -{
> -	u8 tmp;
> -	ast_io_write8(ast, base, index);
> -	tmp = (ast_io_read8(ast, base + 1) & mask) | val;
> -	ast_set_index_reg(ast, base, index, tmp);
> -}
> -
> -uint8_t ast_get_index_reg(struct ast_device *ast,
> -			  uint32_t base, uint8_t index)
> -{
> -	uint8_t ret;
> -	ast_io_write8(ast, base, index);
> -	ret = ast_io_read8(ast, base + 1);
> -	return ret;
> -}
> -
> -uint8_t ast_get_index_reg_mask(struct ast_device *ast,
> -			       uint32_t base, uint8_t index, uint8_t mask)
> -{
> -	uint8_t ret;
> -	ast_io_write8(ast, base, index);
> -	ret = ast_io_read8(ast, base + 1) & mask;
> -	return ret;
> -}
> -
>   static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
>   {
>   	struct device_node *np = dev->dev->of_node;

-- 
Jingfeng


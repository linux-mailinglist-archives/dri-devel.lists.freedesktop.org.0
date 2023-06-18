Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5CC7345B9
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 11:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD9110E027;
	Sun, 18 Jun 2023 09:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3507910E027
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 09:35:46 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxV+nxz45knn4GAA--.11527S3;
 Sun, 18 Jun 2023 17:35:45 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx+OTwz45kEOMeAA--.21418S3; 
 Sun, 18 Jun 2023 17:35:44 +0800 (CST)
Message-ID: <2d6969f7-3a33-5900-1594-7c0c090fed4a@loongson.cn>
Date: Sun, 18 Jun 2023 17:35:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [13/14] drm/ast: Move widescreen- and tx-chip detection into
 separate helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230616140739.32042-14-tzimmermann@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230616140739.32042-14-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Bx+OTwz45kEOMeAA--.21418S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw48uF45JrWftFy3Wr4ftFc_yoW8KF15pa
 ykJFZIqrW5tF12gr43C3WDZF9xt3WxtayUurn3J34akw4DKasY9rn8Xw45ua4DZFZ5ZFyU
 AF47GFyxJFWUCagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
 67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
 1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8cz
 VUUUUUU==
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


"widescreen-" -> "widescreen"


On 2023/6/16 21:52, Thomas Zimmermann wrote:
> Split ast_detect_chip() into three functions and call them one by
> one. The new functions detect the transmitter chip and widescreen
> support. This will allow for further refactoring.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 7f8fb9a613604..f028b5b47c56e 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -157,7 +157,6 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
>   {
>   	struct ast_device *ast = to_ast_device(dev);
>   	struct pci_dev *pdev = to_pci_dev(dev->dev);
> -	uint32_t jreg;
>   
>   	/* Identify chipset */
>   	if (pdev->revision >= 0x50) {
> @@ -218,6 +217,13 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
>   		drm_info(dev, "AST 2000 detected\n");
>   	}
>   
> +	return 0;
> +}
> +
> +static void ast_detect_widescreen(struct ast_device *ast)
> +{
> +	u8 jreg;
> +
>   	/* Check if we support wide screen */
>   	switch (AST_GEN(ast)) {
>   	case 1:
> @@ -242,6 +248,12 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
>   		}
>   		break;
>   	}
> +}
> +
> +static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
> +{
> +	struct drm_device *dev = &ast->base;
> +	u8 jreg;
>   
>   	/* Check 3rd Tx option (digital output afaik) */
>   	ast->tx_chip_types |= AST_TX_NONE_BIT;
> @@ -301,8 +313,6 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
>   		drm_info(dev, "Using DP501 DisplayPort transmitter\n");
>   	if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
>   		drm_info(dev, "Using ASPEED DisplayPort transmitter\n");
> -
> -	return 0;
>   }
>   
>   static int ast_get_dram_info(struct drm_device *dev)
> @@ -494,6 +504,8 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   	ast_detect_config_mode(dev, &scu_rev);
>   
>   	ast_detect_chip(dev, need_post, scu_rev);
> +	ast_detect_widescreen(ast);
> +	ast_detect_tx_chip(ast, need_post);
>   
>   	ret = ast_get_dram_info(dev);
>   	if (ret)

-- 
Jingfeng


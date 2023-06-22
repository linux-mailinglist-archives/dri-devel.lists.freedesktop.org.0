Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5D973A4B1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 17:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5309210E588;
	Thu, 22 Jun 2023 15:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0706E10E588
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 15:21:53 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxvscPZ5RkeXgAAA--.788S3;
 Thu, 22 Jun 2023 23:21:52 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxzM4PZ5Rk6DoCAA--.12421S3; 
 Thu, 22 Jun 2023 23:21:51 +0800 (CST)
Message-ID: <48c4fd57-6810-ae84-6321-f79362bf717b@loongson.cn>
Date: Thu, 22 Jun 2023 23:21:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v2,14/14] drm/ast: Merge config and chip detection
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230621130032.3568-15-tzimmermann@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230621130032.3568-15-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxzM4PZ5Rk6DoCAA--.12421S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3WrykWw1rZw43Xw4DJryDCFX_yoW7Zr1fpF
 ZxGFy3trWUGr1kKrs3ZaykAFyrGws7ta1F9w13J34agr429asYvr1vqF4rZ3s5AFWDAFya
 qFy7KFWkArWq9wcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPlb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 tVWrXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64
 vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
 wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4U
 JVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07
 j8-B_UUUUU=
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

On 2023/6/21 20:53, Thomas Zimmermann wrote:
> Detection of the configuration mode and the chipset model are
> linked to each other. One uses values from the other; namely the
> PCI device revision and the SCU revision. Merge this code into
> a single function.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> Tested-by: Jocelyn Falempe <jfalempe@redhat.com> # AST2600

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

> ---
>   drivers/gpu/drm/ast/ast_main.c | 108 +++++++++++++++++----------------
>   1 file changed, 57 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 7ade96f1f37f9..8bfbdfd86d77d 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -96,68 +96,75 @@ static void ast_open_key(struct ast_device *ast)
>   	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0x80, 0xA8);
>   }
>   
> -static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
> +static int ast_device_config_init(struct ast_device *ast)
>   {
> -	struct device_node *np = dev->dev->of_node;
> -	struct ast_device *ast = to_ast_device(dev);
> +	struct drm_device *dev = &ast->base;
>   	struct pci_dev *pdev = to_pci_dev(dev->dev);
> -	uint32_t data, jregd0, jregd1;
> +	struct device_node *np = dev->dev->of_node;
> +	uint32_t scu_rev = 0xffffffff;
> +	u32 data;
> +	u8 jregd0, jregd1;
> +
> +	/*
> +	 * Find configuration mode and read SCU revision
> +	 */
>   
> -	/* Defaults */
>   	ast->config_mode = ast_use_defaults;
>   
>   	/* Check if we have device-tree properties */
> -	if (np && !of_property_read_u32(np, "aspeed,scu-revision-id",
> -					scu_rev)) {
> +	if (np && !of_property_read_u32(np, "aspeed,scu-revision-id", &data)) {
>   		/* We do, disable P2A access */
>   		ast->config_mode = ast_use_dt;
> -		drm_info(dev, "Using device-tree for configuration\n");
> -		return;
> -	}
> +		scu_rev = data;
> +	} else if (pdev->device == PCI_CHIP_AST2000) { // Not all families have a P2A bridge
> +		/*
> +		 * The BMC will set SCU 0x40 D[12] to 1 if the P2 bridge
> +		 * is disabled. We force using P2A if VGA only mode bit
> +		 * is set D[7]
> +		 */
> +		jregd0 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
> +		jregd1 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff);
> +		if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
> +
> +			/*
> +			 * We have a P2A bridge and it is enabled.
> +			 */
> +
> +			/* Patch AST2500/AST2510 */
> +			if ((pdev->revision & 0xf0) == 0x40) {
> +				if (!(jregd0 & AST_VRAM_INIT_STATUS_MASK))
> +					ast_patch_ahb_2500(ast);
> +			}
>   
> -	/* Not all families have a P2A bridge */
> -	if (pdev->device != PCI_CHIP_AST2000)
> -		return;
> +			/* Double check that it's actually working */
> +			data = ast_read32(ast, 0xf004);
> +			if ((data != 0xffffffff) && (data != 0x00)) {
> +				ast->config_mode = ast_use_p2a;
>   
> -	/*
> -	 * The BMC will set SCU 0x40 D[12] to 1 if the P2 bridge
> -	 * is disabled. We force using P2A if VGA only mode bit
> -	 * is set D[7]
> -	 */
> -	jregd0 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
> -	jregd1 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff);
> -	if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
> -		/* Patch GEN6 */
> -		if (((pdev->revision & 0xF0) == 0x40)
> -			&& ((jregd0 & AST_VRAM_INIT_STATUS_MASK) == 0))
> -			ast_patch_ahb_2500(ast);
> -
> -		/* Double check it's actually working */
> -		data = ast_read32(ast, 0xf004);
> -		if ((data != 0xFFFFFFFF) && (data != 0x00)) {
> -			/* P2A works, grab silicon revision */
> -			ast->config_mode = ast_use_p2a;
> -
> -			drm_info(dev, "Using P2A bridge for configuration\n");
> -
> -			/* Read SCU7c (silicon revision register) */
> -			ast_write32(ast, 0xf004, 0x1e6e0000);
> -			ast_write32(ast, 0xf000, 0x1);
> -			*scu_rev = ast_read32(ast, 0x1207c);
> -			return;
> +				/* Read SCU7c (silicon revision register) */
> +				ast_write32(ast, 0xf004, 0x1e6e0000);
> +				ast_write32(ast, 0xf000, 0x1);
> +				scu_rev = ast_read32(ast, 0x1207c);
> +			}
>   		}
>   	}
>   
> -	/* We have a P2A bridge but it's disabled */
> -	drm_info(dev, "P2A bridge disabled, using default configuration\n");
> -}
> +	switch (ast->config_mode) {
> +	case ast_use_defaults:
> +		drm_info(dev, "Using default configuration\n");
> +		break;
> +	case ast_use_dt:
> +		drm_info(dev, "Using device-tree for configuration\n");
> +		break;
> +	case ast_use_p2a:
> +		drm_info(dev, "Using P2A bridge for configuration\n");
> +		break;
> +	}
>   
> -static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
> -{
> -	struct ast_device *ast = to_ast_device(dev);
> -	struct pci_dev *pdev = to_pci_dev(dev->dev);
> +	/*
> +	 * Identify chipset
> +	 */
>   
> -	/* Identify chipset */
>   	if (pdev->revision >= 0x50) {
>   		ast->chip = AST2600;
>   		drm_info(dev, "AST 2600 detected\n");
> @@ -442,7 +449,6 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   	struct ast_device *ast;
>   	bool need_post = false;
>   	int ret = 0;
> -	u32 scu_rev = 0xffffffff;
>   
>   	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
>   	if (IS_ERR(ast))
> @@ -499,10 +505,10 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> -	/* Find out whether P2A works or whether to use device-tree */
> -	ast_detect_config_mode(dev, &scu_rev);
> +	ret = ast_device_config_init(ast);
> +	if (ret)
> +		return ERR_PTR(ret);
>   
> -	ast_detect_chip(dev, need_post, scu_rev);
>   	ast_detect_widescreen(ast);
>   	ast_detect_tx_chip(ast, need_post);
>   

-- 
Jingfeng


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB60734A85
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 05:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC93310E16B;
	Mon, 19 Jun 2023 03:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 31E9410E16B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 03:15:19 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxTutGyI9kg7kGAA--.13807S3;
 Mon, 19 Jun 2023 11:15:18 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxluRGyI9kPr4fAA--.23648S3; 
 Mon, 19 Jun 2023 11:15:18 +0800 (CST)
Message-ID: <63ad7baa-5189-2ee1-8bad-1c04f7065733@loongson.cn>
Date: Mon, 19 Jun 2023 11:15:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [14/14] drm/ast: Merge config and chip detection
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230616140739.32042-15-tzimmermann@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230616140739.32042-15-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxluRGyI9kPr4fAA--.23648S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3XrW5Gr45GFWkGF1kJrW7Jrc_yoWxGF1UpF
 ZxGFy3JrWUGr1kKrs3A3ykAryrGws7ta1F9w13J34Y9w4q934vvr1qqr4rZas5AFWDZFya
 qa47KFWkArWq9wcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
 1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jn
 UUUUUUUU=
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

On 2023/6/16 21:52, Thomas Zimmermann wrote:
> Detection of the configuration mode and the chipset model are
> linked to each other.

They don't  has a strong relationship,  chipset model detection should 
the first function to be run(should be run early).

chipset model detection should only rely on the information come with 
PCI device itself.

Then  ast_detect_config_mode() follows, ast_detect_config_mode() should 
depend on ast_detect_chip()

>   One uses values from the other; namely the
> PCI device revision and the SCU revision. Merge this code into
> a single function.

In last patch, you split one into three, then in this patch, you merge 
the two into one.

Then you finally got one more patch function only(+2 - 1 = 1).

This is fine, but I noticed that the ast_detect_widescreen() function is 
also depend on the chip identify.

Then, why the ast_detect_widescreen() function is not get merged to 
ast_device_config_init() ?

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 108 +++++++++++++++++----------------
>   1 file changed, 57 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index f028b5b47c56e..5fcddd0dac5e8 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -97,68 +97,75 @@ static void ast_open_key(struct ast_device *ast)
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

The OF itself deserve a separated function, as its only available when 
DT is available.

The no need twist so much local variables together.

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
> @@ -443,7 +450,6 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   	struct ast_device *ast;
>   	bool need_post = false;
>   	int ret = 0;
> -	u32 scu_rev = 0xffffffff;
>   
>   	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
>   	if (IS_ERR(ast))
> @@ -500,10 +506,10 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
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


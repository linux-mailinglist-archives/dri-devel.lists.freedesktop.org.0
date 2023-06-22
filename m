Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B475973A45F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 17:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB02610E57E;
	Thu, 22 Jun 2023 15:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id D493110E57E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 15:10:26 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxycVgZJRkdHcAAA--.815S3;
 Thu, 22 Jun 2023 23:10:24 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxDc9dZJRkSjgCAA--.12298S3; 
 Thu, 22 Jun 2023 23:10:21 +0800 (CST)
Message-ID: <f28ac33e-b95c-9250-1cac-5e45f8949bab@loongson.cn>
Date: Thu, 22 Jun 2023 23:10:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v2,09/14] drm/ast: Distinguish among chip generations
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230621130032.3568-10-tzimmermann@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230621130032.3568-10-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxDc9dZJRkSjgCAA--.12298S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9fXoWfGrykJFWftrWUZr17Zr48Zrc_yoW8XFW7Ko
 WxGr1Sqa4fXr43Aws2gFn7t343ZrWDurs5WFsFkw4Du3yrW3yqgFWaqayxWr45KF1rJF45
 Aw4fuw45Ww1UKw1kl-sFpf9Il3svdjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf
 9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
 UjIYCTnIWjp_UUUY-7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
 8IcIk0rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
 Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
 wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
 0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280
 aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
 AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
 6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF
 0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
 c7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
 v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZF
 pf9x07j1rWrUUUUU=
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
> ASpeed distinguishes among various generations of the AST graphics
> chipset with various models. [1] The most-recent model AST 2600 is
> of the 7th generation, the AST 2500 is of the 6th generation, and so
> on.
>
> The ast driver simply picks one of the models as representative for
> the whole generation. In several places, individual models of the
> same generation need to be handled differently, which then requires
> additional code for detecting the model.
>
> Introduce different generations of the Aspeed chipset. In the source
> code, refer to the generation instead of the representation model where
> possible. The few places that require per-model handling are now clearly
> marked.
>
> In the enum ast_chip, we arrange each model's value such that it
> encodes the generation. This allows for an easy test. The actual values
> are ordered, but not of interest to the driver.
>
> v2:
> 	* use __ast_gen_is_eq() (Jingfeng)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://web.archive.org/web/20141007093258/http://www.aspeedtech.com/products.php?fPath=20 # 1
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

> Tested-by: Jocelyn Falempe <jfalempe@redhat.com> # AST2600
> ---
>   drivers/gpu/drm/ast/ast_dp501.c |  6 ++--
>   drivers/gpu/drm/ast/ast_drv.h   | 56 +++++++++++++++++++++++++++------
>   drivers/gpu/drm/ast/ast_main.c  | 22 ++++++-------
>   drivers/gpu/drm/ast/ast_mode.c  | 35 ++++++++++-----------
>   drivers/gpu/drm/ast/ast_post.c  | 27 +++++++---------
>   5 files changed, 89 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index 1bc35a992369d..a5d285850ffb1 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -350,7 +350,7 @@ static bool ast_init_dvo(struct drm_device *dev)
>   		data |= 0x00000500;
>   		ast_write32(ast, 0x12008, data);
>   
> -		if (ast->chip == AST2300) {
> +		if (IS_AST_GEN4(ast)) {
>   			data = ast_read32(ast, 0x12084);
>   			/* multi-pins for DVO single-edge */
>   			data |= 0xfffe0000;
> @@ -366,7 +366,7 @@ static bool ast_init_dvo(struct drm_device *dev)
>   			data &= 0xffffffcf;
>   			data |= 0x00000020;
>   			ast_write32(ast, 0x12090, data);
> -		} else { /* AST2400 */
> +		} else { /* AST GEN5+ */
>   			data = ast_read32(ast, 0x12088);
>   			/* multi-pins for DVO single-edge */
>   			data |= 0x30000000;
> @@ -437,7 +437,7 @@ void ast_init_3rdtx(struct drm_device *dev)
>   	struct ast_device *ast = to_ast_device(dev);
>   	u8 jreg;
>   
> -	if (ast->chip == AST2300 || ast->chip == AST2400) {
> +	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast)) {
>   		jreg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff);
>   		switch (jreg & 0x0e) {
>   		case 0x04:
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 31fead32b19cc..803d72a60506c 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -52,18 +52,38 @@
>   #define PCI_CHIP_AST2000 0x2000
>   #define PCI_CHIP_AST2100 0x2010
>   
> +#define __AST_CHIP(__gen, __index)	((__gen) << 16 | (__index))
> +
>   enum ast_chip {
> -	AST2000,
> -	AST2100,
> -	AST1100,
> -	AST2200,
> -	AST2150,
> -	AST2300,
> -	AST2400,
> -	AST2500,
> -	AST2600,
> +	/* 1st gen */
> +	AST1000 = __AST_CHIP(1, 0), // unused
> +	AST2000 = __AST_CHIP(1, 1),
> +	/* 2nd gen */
> +	AST1100 = __AST_CHIP(2, 0),
> +	AST2100 = __AST_CHIP(2, 1),
> +	AST2050 = __AST_CHIP(2, 2), // unused
> +	/* 3rd gen */
> +	AST2200 = __AST_CHIP(3, 0),
> +	AST2150 = __AST_CHIP(3, 1),
> +	/* 4th gen */
> +	AST2300 = __AST_CHIP(4, 0),
> +	AST1300 = __AST_CHIP(4, 1), // unused
> +	AST1050 = __AST_CHIP(4, 2), // unused
> +	/* 5th gen */
> +	AST2400 = __AST_CHIP(5, 0),
> +	AST1400 = __AST_CHIP(5, 1), // unused
> +	AST1250 = __AST_CHIP(5, 2), // unused
> +	/* 6th gen */
> +	AST2500 = __AST_CHIP(6, 0),
> +	AST2510 = __AST_CHIP(6, 1), // unused
> +	AST2520 = __AST_CHIP(6, 2), // unused
> +	/* 7th gen */
> +	AST2600 = __AST_CHIP(7, 0),
> +	AST2620 = __AST_CHIP(7, 1), // unused
>   };
>   
> +#define __AST_CHIP_GEN(__chip)	(((unsigned long)(__chip)) >> 16)
> +
>   enum ast_tx_chip {
>   	AST_TX_NONE,
>   	AST_TX_SIL164,
> @@ -217,6 +237,24 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   				     struct pci_dev *pdev,
>   				     unsigned long flags);
>   
> +static inline unsigned long __ast_gen(struct ast_device *ast)
> +{
> +	return __AST_CHIP_GEN(ast->chip);
> +}
> +#define AST_GEN(__ast)	__ast_gen(__ast)
> +
> +static inline bool __ast_gen_is_eq(struct ast_device *ast, unsigned long gen)
> +{
> +	return __ast_gen(ast) == gen;
> +}
> +#define IS_AST_GEN1(__ast)	__ast_gen_is_eq(__ast, 1)
> +#define IS_AST_GEN2(__ast)	__ast_gen_is_eq(__ast, 2)
> +#define IS_AST_GEN3(__ast)	__ast_gen_is_eq(__ast, 3)
> +#define IS_AST_GEN4(__ast)	__ast_gen_is_eq(__ast, 4)
> +#define IS_AST_GEN5(__ast)	__ast_gen_is_eq(__ast, 5)
> +#define IS_AST_GEN6(__ast)	__ast_gen_is_eq(__ast, 6)
> +#define IS_AST_GEN7(__ast)	__ast_gen_is_eq(__ast, 7)
> +
>   #define AST_IO_AR_PORT_WRITE		(0x40)
>   #define AST_IO_MISC_PORT_WRITE		(0x42)
>   #define AST_IO_VGA_ENABLE_PORT		(0x43)
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index d2f8396ec0a02..8fc412fe296c2 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -127,7 +127,7 @@ static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
>   	jregd0 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
>   	jregd1 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff);
>   	if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
> -		/* Patch AST2500 */
> +		/* Patch GEN6 */
>   		if (((pdev->revision & 0xF0) == 0x40)
>   			&& ((jregd0 & AST_VRAM_INIT_STATUS_MASK) == 0))
>   			ast_patch_ahb_2500(ast);
> @@ -196,8 +196,8 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
>   	}
>   
>   	/* Check if we support wide screen */
> -	switch (ast->chip) {
> -	case AST2000:
> +	switch (AST_GEN(ast)) {
> +	case 1:
>   		ast->support_wide_screen = false;
>   		break;
>   	default:
> @@ -217,7 +217,7 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
>   			if (ast->chip == AST2500 &&
>   			    scu_rev == 0x100)           /* ast2510 */
>   				ast->support_wide_screen = true;
> -			if (ast->chip == AST2600)		/* ast2600 */
> +			if (IS_AST_GEN7(ast))
>   				ast->support_wide_screen = true;
>   		}
>   		break;
> @@ -240,9 +240,9 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
>   			ast->tx_chip_types = AST_TX_SIL164_BIT;
>   	}
>   
> -	if ((ast->chip == AST2300) || (ast->chip == AST2400) || (ast->chip == AST2500)) {
> +	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast)) {
>   		/*
> -		 * On AST2300 and 2400, look the configuration set by the SoC in
> +		 * On AST GEN4+, look the configuration set by the SoC in
>   		 * the SOC scratch register #1 bits 11:8 (interestingly marked
>   		 * as "reserved" in the spec)
>   		 */
> @@ -264,7 +264,7 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
>   		case 0x0c:
>   			ast->tx_chip_types = AST_TX_DP501_BIT;
>   		}
> -	} else if (ast->chip == AST2600) {
> +	} else if (IS_AST_GEN7(ast)) {
>   		if (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, TX_TYPE_MASK) ==
>   		    ASTDP_DPMCU_TX) {
>   			ast->tx_chip_types = AST_TX_ASTDP_BIT;
> @@ -296,7 +296,7 @@ static int ast_get_dram_info(struct drm_device *dev)
>   	case ast_use_dt:
>   		/*
>   		 * If some properties are missing, use reasonable
> -		 * defaults for AST2400
> +		 * defaults for GEN5
>   		 */
>   		if (of_property_read_u32(np, "aspeed,mcr-configuration",
>   					 &mcr_cfg))
> @@ -319,7 +319,7 @@ static int ast_get_dram_info(struct drm_device *dev)
>   	default:
>   		ast->dram_bus_width = 16;
>   		ast->dram_type = AST_DRAM_1Gx16;
> -		if (ast->chip == AST2500)
> +		if (IS_AST_GEN6(ast))
>   			ast->mclk = 800;
>   		else
>   			ast->mclk = 396;
> @@ -331,7 +331,7 @@ static int ast_get_dram_info(struct drm_device *dev)
>   	else
>   		ast->dram_bus_width = 32;
>   
> -	if (ast->chip == AST2500) {
> +	if (IS_AST_GEN6(ast)) {
>   		switch (mcr_cfg & 0x03) {
>   		case 0:
>   			ast->dram_type = AST_DRAM_1Gx16;
> @@ -347,7 +347,7 @@ static int ast_get_dram_info(struct drm_device *dev)
>   			ast->dram_type = AST_DRAM_8Gx16;
>   			break;
>   		}
> -	} else if (ast->chip == AST2300 || ast->chip == AST2400) {
> +	} else if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast)) {
>   		switch (mcr_cfg & 0x03) {
>   		case 0:
>   			ast->dram_type = AST_DRAM_512Mx16;
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index b3c670af6ef2b..f711d592da52b 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -342,7 +342,7 @@ static void ast_set_crtc_reg(struct ast_device *ast,
>   	u8 jreg05 = 0, jreg07 = 0, jreg09 = 0, jregAC = 0, jregAD = 0, jregAE = 0;
>   	u16 temp, precache = 0;
>   
> -	if ((ast->chip == AST2500 || ast->chip == AST2600) &&
> +	if ((IS_AST_GEN6(ast) || IS_AST_GEN7(ast)) &&
>   	    (vbios_mode->enh_table->flags & AST2500PreCatchCRT))
>   		precache = 40;
>   
> @@ -384,7 +384,7 @@ static void ast_set_crtc_reg(struct ast_device *ast,
>   	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xAD, 0x00, jregAD);
>   
>   	// Workaround for HSync Time non octave pixels (1920x1080@60Hz HSync 44 pixels);
> -	if ((ast->chip == AST2600) && (mode->crtc_vdisplay == 1080))
> +	if (IS_AST_GEN7(ast) && (mode->crtc_vdisplay == 1080))
>   		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xFC, 0xFD, 0x02);
>   	else
>   		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xFC, 0xFD, 0x00);
> @@ -466,7 +466,7 @@ static void ast_set_dclk_reg(struct ast_device *ast,
>   {
>   	const struct ast_vbios_dclk_info *clk_info;
>   
> -	if ((ast->chip == AST2500) || (ast->chip == AST2600))
> +	if (IS_AST_GEN6(ast) || IS_AST_GEN7(ast))
>   		clk_info = &dclk_table_ast2500[vbios_mode->enh_table->dclk_index];
>   	else
>   		clk_info = &dclk_table[vbios_mode->enh_table->dclk_index];
> @@ -510,17 +510,13 @@ static void ast_set_color_reg(struct ast_device *ast,
>   static void ast_set_crtthd_reg(struct ast_device *ast)
>   {
>   	/* Set Threshold */
> -	if (ast->chip == AST2600) {
> +	if (IS_AST_GEN7(ast)) {
>   		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa7, 0xe0);
>   		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa6, 0xa0);
> -	} else if (ast->chip == AST2300 || ast->chip == AST2400 ||
> -	    ast->chip == AST2500) {
> +	} else if (IS_AST_GEN6(ast) || IS_AST_GEN5(ast) || IS_AST_GEN4(ast)) {
>   		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa7, 0x78);
>   		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa6, 0x60);
> -	} else if (ast->chip == AST2100 ||
> -		   ast->chip == AST1100 ||
> -		   ast->chip == AST2200 ||
> -		   ast->chip == AST2150) {
> +	} else if (IS_AST_GEN3(ast) || IS_AST_GEN2(ast)) {
>   		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa7, 0x3f);
>   		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa6, 0x2f);
>   	} else {
> @@ -1082,9 +1078,10 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
>   		if ((mode->hdisplay == 1152) && (mode->vdisplay == 864))
>   			return MODE_OK;
>   
> -		if ((ast->chip == AST2100) || (ast->chip == AST2200) ||
> -		    (ast->chip == AST2300) || (ast->chip == AST2400) ||
> -		    (ast->chip == AST2500) || (ast->chip == AST2600)) {
> +		if ((ast->chip == AST2100) || // GEN2, but not AST1100 (?)
> +		    (ast->chip == AST2200) || // GEN3, but not AST2150 (?)
> +		    IS_AST_GEN4(ast) || IS_AST_GEN5(ast) ||
> +		    IS_AST_GEN6(ast) || IS_AST_GEN7(ast)) {
>   			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080))
>   				return MODE_OK;
>   
> @@ -1800,12 +1797,12 @@ int ast_mode_config_init(struct ast_device *ast)
>   	dev->mode_config.min_height = 0;
>   	dev->mode_config.preferred_depth = 24;
>   
> -	if (ast->chip == AST2100 ||
> -	    ast->chip == AST2200 ||
> -	    ast->chip == AST2300 ||
> -	    ast->chip == AST2400 ||
> -	    ast->chip == AST2500 ||
> -	    ast->chip == AST2600) {
> +	if (ast->chip == AST2100 || // GEN2, but not AST1100 (?)
> +	    ast->chip == AST2200 || // GEN3, but not AST2150 (?)
> +	    IS_AST_GEN7(ast) ||
> +	    IS_AST_GEN6(ast) ||
> +	    IS_AST_GEN5(ast) ||
> +	    IS_AST_GEN4(ast)) {
>   		dev->mode_config.max_width = 1920;
>   		dev->mode_config.max_height = 2048;
>   	} else {
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index b765eeb55e5f1..13e15173f2c5b 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -51,7 +51,7 @@ ast_set_def_ext_reg(struct drm_device *dev)
>   	for (i = 0x81; i <= 0x9f; i++)
>   		ast_set_index_reg(ast, AST_IO_CRTC_PORT, i, 0x00);
>   
> -	if (ast->chip == AST2300 || ast->chip == AST2400 || ast->chip == AST2500)
> +	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast))
>   		ext_reg_info = extreginfo_ast2300;
>   	else
>   		ext_reg_info = extreginfo;
> @@ -72,8 +72,7 @@ ast_set_def_ext_reg(struct drm_device *dev)
>   
>   	/* Enable RAMDAC for A1 */
>   	reg = 0x04;
> -	if (ast->chip == AST2300 || ast->chip == AST2400 ||
> -	    ast->chip == AST2500)
> +	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast))
>   		reg |= 0x20;
>   	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xff, reg);
>   }
> @@ -249,7 +248,7 @@ static void ast_init_dram_reg(struct drm_device *dev)
>   	j = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
>   
>   	if ((j & 0x80) == 0) { /* VGA only */
> -		if (ast->chip == AST2000) {
> +		if (IS_AST_GEN1(ast)) {
>   			dram_reg_info = ast2000_dram_table_data;
>   			ast_write32(ast, 0xf004, 0x1e6e0000);
>   			ast_write32(ast, 0xf000, 0x1);
> @@ -258,7 +257,7 @@ static void ast_init_dram_reg(struct drm_device *dev)
>   			do {
>   				;
>   			} while (ast_read32(ast, 0x10100) != 0xa8);
> -		} else {/* AST2100/1100 */
> +		} else { /* GEN2/GEN3 */
>   			if (ast->chip == AST2100 || ast->chip == AST2200)
>   				dram_reg_info = ast2100_dram_table_data;
>   			else
> @@ -281,7 +280,7 @@ static void ast_init_dram_reg(struct drm_device *dev)
>   			if (dram_reg_info->index == 0xff00) {/* delay fn */
>   				for (i = 0; i < 15; i++)
>   					udelay(dram_reg_info->data);
> -			} else if (dram_reg_info->index == 0x4 && ast->chip != AST2000) {
> +			} else if (dram_reg_info->index == 0x4 && !IS_AST_GEN1(ast)) {
>   				data = dram_reg_info->data;
>   				if (ast->dram_type == AST_DRAM_1Gx16)
>   					data = 0x00000d89;
> @@ -307,15 +306,13 @@ static void ast_init_dram_reg(struct drm_device *dev)
>   				cbrdlli_ast2150(ast, 32); /* 32 bits */
>   		}
>   
> -		switch (ast->chip) {
> -		case AST2000:
> +		switch (AST_GEN(ast)) {
> +		case 1:
>   			temp = ast_read32(ast, 0x10140);
>   			ast_write32(ast, 0x10140, temp | 0x40);
>   			break;
> -		case AST1100:
> -		case AST2100:
> -		case AST2200:
> -		case AST2150:
> +		case 2:
> +		case 3:
>   			temp = ast_read32(ast, 0x1200c);
>   			ast_write32(ast, 0x1200c, temp & 0xfffffffd);
>   			temp = ast_read32(ast, 0x12040);
> @@ -338,13 +335,13 @@ void ast_post_gpu(struct drm_device *dev)
>   
>   	ast_set_def_ext_reg(dev);
>   
> -	if (ast->chip == AST2600) {
> +	if (IS_AST_GEN7(ast)) {
>   		if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
>   			ast_dp_launch(dev);
>   	} else if (ast->config_mode == ast_use_p2a) {
> -		if (ast->chip == AST2500)
> +		if (IS_AST_GEN6(ast))
>   			ast_post_chip_2500(dev);
> -		else if (ast->chip == AST2300 || ast->chip == AST2400)
> +		else if (IS_AST_GEN5(ast) || IS_AST_GEN4(ast))
>   			ast_post_chip_2300(dev);
>   		else
>   			ast_init_dram_reg(dev);

-- 
Jingfeng


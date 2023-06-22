Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6957073A53A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 17:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A57610E589;
	Thu, 22 Jun 2023 15:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id A11C610E589
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 15:42:28 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxPMfha5RkY3kAAA--.825S3;
 Thu, 22 Jun 2023 23:42:26 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx_c7ha5RkB0ACAA--.12420S3; 
 Thu, 22 Jun 2023 23:42:25 +0800 (CST)
Message-ID: <ac2955ec-0a09-1c44-23a7-e29b952f463d@loongson.cn>
Date: Thu, 22 Jun 2023 23:42:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 06/14] drm/ast: Set PCI config before accessing I/O
 registers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230621130032.3568-1-tzimmermann@suse.de>
 <20230621130032.3568-7-tzimmermann@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230621130032.3568-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx_c7ha5RkB0ACAA--.12420S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJw1UJF4xJFy5Gw4DGF45urX_yoW5KF4xpa
 yDJFySyrW5JF47KF47Z3WDZFy3Ja1xJayFgr98G3sI9ws0yryvkF95C3y5C34DJrZ7AFya
 qFs7KFy8W3yjywcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 XVWUAwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64
 vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
 bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aVCY
 1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07j0LvtUUUUU=
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


I know something about this patch:


On 2023/6/21 20:53, Thomas Zimmermann wrote:
> Access to I/O registers is required to detect and set up the
> device. Enable the rsp PCI config bits before. While at it,
> convert the magic number to macro constants.
>
> Enabling the PCI config bits was done after trying to detect
> the device. It was probably too late at this point.
>
> v2:
> 	* use standard 16-bit PCI r/w access (Jingfeng)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> Tested-by: Jocelyn Falempe <jfalempe@redhat.com> # AST2600
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  1 -
>   drivers/gpu/drm/ast/ast_main.c | 21 +++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_post.c |  6 ------
>   3 files changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 0141705beaee9..630105feec18a 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -52,7 +52,6 @@
>   #define PCI_CHIP_AST2000 0x2000
>   #define PCI_CHIP_AST2100 0x2010
>   
> -
>   enum ast_chip {
>   	AST2000,
>   	AST2100,
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index c6987e0446618..01f938c2da28f 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -35,6 +35,23 @@
>   
>   #include "ast_drv.h"
>   
> +static int ast_init_pci_config(struct pci_dev *pdev)
> +{
> +	int err;
> +	u16 pcis04;
> +
> +	err = pci_read_config_word(pdev, PCI_COMMAND, &pcis04);
> +	if (err)
> +		goto out;
> +
> +	pcis04 |= PCI_COMMAND_MEMORY | PCI_COMMAND_IO;
> +
> +	err = pci_write_config_word(pdev, PCI_COMMAND, pcis04);
> +
> +out:
> +	return pcibios_err_to_errno(err);
> +}
> +


This function itself is good enough.


>   static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
>   {
>   	struct device_node *np = dev->dev->of_node;
> @@ -399,6 +416,10 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   			return ERR_PTR(-EIO);
>   	}
>   
> +	ret = ast_init_pci_config(pdev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +


Is the calling to ast_init_pci_config() absolute necessary ?

I'm asking this question because

I think this function is needed to be run only when the chip need POST.

On normal case, when you call pcim_enable_device() function,

the pci_enable_device() function will do such thing for you.


```

int pci_enable_device(struct pci_dev *dev)
{
     return pci_enable_device_flags(dev, IORESOURCE_MEM | IORESOURCE_IO);
}

```

>   	if (!ast_is_vga_enabled(dev)) {
>   		drm_info(dev, "VGA not enabled on entry, requesting chip POST\n");
>   		need_post = true;
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index aa3f2cb00f82c..2da5bdb4bac45 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -361,12 +361,6 @@ static void ast_init_dram_reg(struct drm_device *dev)
>   void ast_post_gpu(struct drm_device *dev)
>   {
>   	struct ast_device *ast = to_ast_device(dev);
> -	struct pci_dev *pdev = to_pci_dev(dev->dev);
> -	u32 reg;
> -
> -	pci_read_config_dword(pdev, 0x04, &reg);
> -	reg |= 0x3;
> -	pci_write_config_dword(pdev, 0x04, reg);

You have changed the semantics after this patch is applied .

Yes, it still works.

But would you like to explain something about this?

We want to learn more knowledge from your patch.

>   
>   	ast_enable_vga(dev);
>   	ast_open_key(ast);

-- 
Jingfeng


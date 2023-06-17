Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18148733F5A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 10:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DBE10E045;
	Sat, 17 Jun 2023 08:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id B2EB310E045
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 08:01:33 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxGupcaI1kTkEGAA--.13361S3;
 Sat, 17 Jun 2023 16:01:32 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxKeVbaI1k+RIeAA--.18856S3; 
 Sat, 17 Jun 2023 16:01:31 +0800 (CST)
Message-ID: <0eec8603-bdd3-a060-b9cf-f44dfd449581@loongson.cn>
Date: Sat, 17 Jun 2023 16:01:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [06/14] drm/ast: Set PCI config before accessing I/O registers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230616140739.32042-7-tzimmermann@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230616140739.32042-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxKeVbaI1k+RIeAA--.18856S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuF4UZFW7CryUJw1xWFWfJFc_yoW5Zr47pa
 n8Ja4SvrW5JF4fKF47Z3WDZFyfJ3WIqa4Fgr9rJ3sI9w40yw1kuF98A3y5J348JrZ7AFyS
 qFn3KFyUWrZrAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
 wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
 CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAF
 wI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
 AF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1l
 IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
 CI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
 WIevJa73UjIFyTuYvjxUcsjjDUUUU
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
> Access to I/O registers is required to detect and set up the
> device. Enable the rsp PCI config bits before. While at it,
> convert the magic number to macro constants.
>
> Enabling the PCI config bits was done after trying to detect
> the device. It was probably too late at this point.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  2 ++
>   drivers/gpu/drm/ast/ast_main.c | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_post.c |  6 ------
>   3 files changed, 24 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 0141705beaee9..555a0850957f3 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -52,6 +52,8 @@
>   #define PCI_CHIP_AST2000 0x2000
>   #define PCI_CHIP_AST2100 0x2010
>   
> +#define AST_PCI_OPTION_MEM_ACCESS_ENABLE	BIT(1)
> +#define AST_PCI_OPTION_IO_ACCESS_ENABLE		BIT(0)
>   
>   enum ast_chip {
>   	AST2000,
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index c6987e0446618..fe054739b494a 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -35,6 +35,24 @@
>   
>   #include "ast_drv.h"
>   
> +static int ast_init_pci_config(struct pci_dev *pdev)
> +{
> +	int err;
> +	u32 pcis04;
> +
> +	err = pci_read_config_dword(pdev, 0x04, &pcis04);

The third argument of pci_read_config_dword() function should be 'u16 *' 
type;


> +	if (err)
> +		goto out;
> +
> +	pcis04 |= AST_PCI_OPTION_MEM_ACCESS_ENABLE |
> +		  AST_PCI_OPTION_IO_ACCESS_ENABLE;
> +
> +	err = pci_write_config_dword(pdev, 0x04, pcis04);
> +
> +out:
> +	return pcibios_err_to_errno(err);
> +}


static void ast_enable_mem_io(struct pci_dev *pdev)
{
     u16 cmd;

     pci_read_config_word(pdev, PCI_COMMAND, &cmd);

     cmd |= PCI_COMMAND_MEMORY | PCI_COMMAND_IO;

     pci_write_config_word(pdev, PCI_COMMAND, &cmd);
}

>   static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
>   {
>   	struct device_node *np = dev->dev->of_node;
> @@ -399,6 +417,10 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   			return ERR_PTR(-EIO);
>   	}
>   
> +	ret = ast_init_pci_config(pdev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
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
>   
>   	ast_enable_vga(dev);
>   	ast_open_key(ast);

-- 
Jingfeng


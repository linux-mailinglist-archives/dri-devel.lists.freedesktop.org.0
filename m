Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDD8757347
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 07:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6AF10E09B;
	Tue, 18 Jul 2023 05:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id F2E2410E09B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 05:40:22 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cx5_HFJbZky3YGAA--.17056S3;
 Tue, 18 Jul 2023 13:40:21 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxrM7FJbZkrbUyAA--.8970S3; 
 Tue, 18 Jul 2023 13:40:21 +0800 (CST)
Message-ID: <5d51f17e-138c-fbc1-c1f7-b0d3f09bcf7a@loongson.cn>
Date: Tue, 18 Jul 2023 13:40:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: drm/ast: Do not enable PCI resources multiple times
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 airlied@gmail.com, airlied@redhat.com, daniel@ffwll.ch
References: <20230712130826.3318-1-tzimmermann@suse.de>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230712130826.3318-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxrM7FJbZkrbUyAA--.8970S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tFy8ZryUGw4DGF1rJF13GFX_yoW8Aw1Dp3
 9xJF92yrZ8tF4fKF17uryqvFy5Ja47ta40grn5Ww1S9wsFvw1qyF95A3yfXryDZrZ7CFyI
 qFs7KFyrJ34UJabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
 67AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
 8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
 CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
 1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
 daVFxhVjvjDU0xZFpf9x07jnUUUUUUUU=
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


Actually,  I'm only a little bit worry about the ast_pm_thaw() code path.

|- ast_pm_thaw()

|-- ast_drm_thaw()

|--- ast_post_gpu()


Except this, all other code path have pci_enable_device() or 
pcim_enable_device() called.

So, this patch seems OK.


On 2023/7/12 21:08, Thomas Zimmermann wrote:
> Remove ast_init_pci_config() as the ast driver already enables the PCI
> resources by calling pcim_enable_device().
>
> Suggested-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 21 ---------------------
>   1 file changed, 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 8bfbdfd86d77..dae365ed3969 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -35,23 +35,6 @@
>   
>   #include "ast_drv.h"
>   
> -static int ast_init_pci_config(struct pci_dev *pdev)
> -{
> -	int err;
> -	u16 pcis04;
> -
> -	err = pci_read_config_word(pdev, PCI_COMMAND, &pcis04);
> -	if (err)
> -		goto out;
> -
> -	pcis04 |= PCI_COMMAND_MEMORY | PCI_COMMAND_IO;
> -
> -	err = pci_write_config_word(pdev, PCI_COMMAND, pcis04);
> -
> -out:
> -	return pcibios_err_to_errno(err);
> -}
> -
>   static bool ast_is_vga_enabled(struct drm_device *dev)
>   {
>   	struct ast_device *ast = to_ast_device(dev);
> @@ -483,10 +466,6 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   			return ERR_PTR(-EIO);
>   	}
>   
> -	ret = ast_init_pci_config(pdev);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
>   	if (!ast_is_vga_enabled(dev)) {
>   		drm_info(dev, "VGA not enabled on entry, requesting chip POST\n");
>   		need_post = true;


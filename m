Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6502D7572ED
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 06:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC51810E064;
	Tue, 18 Jul 2023 04:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0588B10E064
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 04:49:01 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxDOu4GbZkwnMGAA--.11466S3;
 Tue, 18 Jul 2023 12:48:56 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Ax98yrGbZk4aYyAA--.54518S3; 
 Tue, 18 Jul 2023 12:48:56 +0800 (CST)
Message-ID: <29a16dd2-88dc-eac9-9492-28e2f9136721@loongson.cn>
Date: Tue, 18 Jul 2023 12:48:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: drm/ast: Do not enable PCI resources multiple times
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 airlied@gmail.com, airlied@redhat.com, daniel@ffwll.ch
References: <20230712130826.3318-1-tzimmermann@suse.de>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230712130826.3318-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Ax98yrGbZk4aYyAA--.54518S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWrykArWkZrW5ZrWUWrW7Awc_yoW5XF17pa
 nxJa9YyFZ8JF48Kr17Z34qvFy5Aa9rZa48Wrn8uw1F9w4qyr1qvrnYyrWfJ347ZrWxAayI
 vF4xKF15G3WUA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
 1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jO
 F4_UUUUU=
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


I have tested this patch on my x86-64(i3-8100, H110 D4L board) + ast2400 
discrete BMC card just now,

drm/ast still works on normal case.


But  originally this function is called in ast_post_gpu() function.

ast_post_gpu() doesn't happen on my test case.


I know something about the POST (Power On Self Test),

In the past, my mips and loongarch have difficulty to run x86 VBIOS code.

So part of my radeon and amdgpu gpu card will just hang(stall) at the 
bios/vbios boot stage.

When we debugging, we hasty solve this problem by disabling (comment out)

the VBIOS part initialization code of the BIOS.

The results is that the screen will not light-up during the boot stage.

We relay the kernel-space drivers (drm/radeon and drm/amdgpu) to 
initialize the GPU.

In this case, (drm/radeon and drm/amdgpu) driver log(dmesg) will print : 
"need POST ...".


So, from my past experience, I think the "need POST" will only happens

when there no firmware support for a specific machine + BMC combination.

But this is not a normal case.


So, I think we probably could try this, if there no objections from 
experienced reviewers.


On 2023/7/12 21:08, Thomas Zimmermann wrote:
> Remove ast_init_pci_config() as the ast driver already enables the PCI
> resources by calling pcim_enable_device().
>
> Suggested-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>


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


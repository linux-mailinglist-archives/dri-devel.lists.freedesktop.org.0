Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFF2738270
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 13:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8359E10E444;
	Wed, 21 Jun 2023 11:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id B519110E444
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 11:53:44 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxU8TF5JJknB4AAA--.219S3;
 Wed, 21 Jun 2023 19:53:41 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxJ83F5JJkS5EAAA--.1300S3; 
 Wed, 21 Jun 2023 19:53:41 +0800 (CST)
Message-ID: <6e27679d-1a3c-a01b-33fe-f04af058730e@loongson.cn>
Date: Wed, 21 Jun 2023 19:53:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [08/14] drm/ast: Set up release action right after enabling MMIO
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230616140739.32042-9-tzimmermann@suse.de>
 <aa7fc787-2b30-ae1d-ea05-47fc41bb3831@loongson.cn>
 <9099ae09-9b32-804b-c676-3538cb2a6358@suse.de>
 <d070ea6c-908d-a35a-ca85-6011b2395fd2@suse.de>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <d070ea6c-908d-a35a-ca85-6011b2395fd2@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxJ83F5JJkS5EAAA--.1300S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZFWxCFyDtF43Aw1DKrWDJrc_yoWrXr4Dpr
 4kJFWjyrW5Grn3Gr1Yq34DJF9Ivr1xt3W8Wr1DJ3WIqrsFyF1vgFyUXr1j9rykJrW8AFyU
 Zr17GryfuF15ZrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
 67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
 xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
 x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r
 1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
 7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
 WxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
 U1NBMJUUUUU==
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

On 2023/6/21 19:48, Thomas Zimmermann wrote:
>
>
> Am 19.06.23 um 10:22 schrieb Thomas Zimmermann:
>>
>>
>> Am 19.06.23 um 03:57 schrieb Sui Jingfeng:
>>> Hi,
>>>
>>>
>>> Tested with ast2400
>>>
>>>
>>> On 2023/6/16 21:52, Thomas Zimmermann wrote:
>>>> Ast sets up a managed release of the MMIO access flags. Move this
>>>> code next to the MMIO access code, so that it runs if other errors
>>>> occur during the device initialization.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>
>>> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> Which model do you test on?
>
> Oh, you mentioned the AST2400.


Yes, I didn't answer this question, because I don't know what you are 
really asking back to that time.


>
>>
>>>
>>> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>>
>>>> ---
>>>>   drivers/gpu/drm/ast/ast_main.c | 38 
>>>> +++++++++++++++++-----------------
>>>>   1 file changed, 19 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ast/ast_main.c 
>>>> b/drivers/gpu/drm/ast/ast_main.c
>>>> index 3295876c09b35..6ff4b837e64d7 100644
>>>> --- a/drivers/gpu/drm/ast/ast_main.c
>>>> +++ b/drivers/gpu/drm/ast/ast_main.c
>>>> @@ -71,11 +71,25 @@ static void ast_enable_vga(struct drm_device *dev)
>>>>       ast_io_write8(ast, AST_IO_MISC_PORT_WRITE, 0x01);
>>>>   }
>>>> -static void ast_enable_mmio(struct drm_device *dev)
>>>> +/*
>>>> + * Run this function as part of the HW device cleanup; not
>>>> + * when the DRM device gets released.
>>>> + */
>>>
>>>
>>>> +static void ast_enable_mmio_release(void *data)
>>>>   {
>>>> -    struct ast_device *ast = to_ast_device(dev);
>>>> +    struct ast_device *ast = data;
>>>> +
>>>> +    /* enable standard VGA decode */
>>>> +    ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
>>>> +}
>>>> +
>>>> +static int ast_enable_mmio(struct ast_device *ast)
>>>> +{
>>>> +    struct drm_device *dev = &ast->base;
>>>>       ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x06);
>>>> +
>>>> +    return devm_add_action_or_reset(dev->dev, 
>>>> ast_enable_mmio_release, ast);
>>>>   }
>>>>   static void ast_open_key(struct ast_device *ast)
>>>> @@ -392,18 +406,6 @@ static int ast_get_dram_info(struct drm_device 
>>>> *dev)
>>>>       return 0;
>>>>   }
>>>> -/*
>>>> - * Run this function as part of the HW device cleanup; not
>>>> - * when the DRM device gets released.
>>>> - */
>>>> -static void ast_device_release(void *data)
>>>> -{
>>>> -    struct ast_device *ast = data;
>>>> -
>>>> -    /* enable standard VGA decode */
>>>> -    ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
>>>> -}
>>>> -
>>>>   struct ast_device *ast_device_create(const struct drm_driver *drv,
>>>>                        struct pci_dev *pdev,
>>>>                        unsigned long flags)
>>>> @@ -465,7 +467,9 @@ struct ast_device *ast_device_create(const 
>>>> struct drm_driver *drv,
>>>>       /* Enable extended register access */
>>>>       ast_open_key(ast);
>>>> -    ast_enable_mmio(dev);
>>>> +    ret = ast_enable_mmio(ast);
>>>> +    if (ret)
>>>> +        return ERR_PTR(ret);
>>>>       /* Find out whether P2A works or whether to use device-tree */
>>>>       ast_detect_config_mode(dev, &scu_rev);
>>>> @@ -498,9 +502,5 @@ struct ast_device *ast_device_create(const 
>>>> struct drm_driver *drv,
>>>>       if (ret)
>>>>           return ERR_PTR(ret);
>>>> -    ret = devm_add_action_or_reset(dev->dev, ast_device_release, 
>>>> ast);
>>>> -    if (ret)
>>>> -        return ERR_PTR(ret);
>>>> -
>>>>       return ast;
>>>>   }
>>>
>>
>
-- 
Jingfeng


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35B377799F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 15:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD5410E18F;
	Thu, 10 Aug 2023 13:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C61010E18F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 13:30:16 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxRvFm5tRkpbgUAA--.44583S3;
 Thu, 10 Aug 2023 21:30:14 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxDc9m5tRk6jtTAA--.11317S3; 
 Thu, 10 Aug 2023 21:30:14 +0800 (CST)
Message-ID: <44e4e8a8-b714-1cfd-c20c-d8151e73cdac@loongson.cn>
Date: Thu, 10 Aug 2023 21:30:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH next] drm/loongson: Fix error handling in
 lsdc_pixel_pll_setup()
Content-Language: en-US
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230720123950.543082-1-harshit.m.mogalapalli@oracle.com>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230720123950.543082-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxDc9m5tRk6jtTAA--.11317S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7trWrAFW7WrW5ZrWruF17Arc_yoW8XFW8pw
 s8Ca4jvrZFyFy2gwnrA3W8WFyrZ3W3KFyfuay7uwsI9r1DAryUWFWFvFyUJrZxXa48Aa1a
 qrn7GryY9FyDt3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jO
 uc_UUUUU=
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
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
 dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/7/20 20:39, Harshit Mogalapalli wrote:
> There are two problems in lsdc_pixel_pll_setup()
> 1. If kzalloc() fails then call iounmap() to release the resources.
> 2. Both kzalloc and ioremap doesnot return error pointers on failure, so
>     using IS_ERR_OR_NULL() checks is a bit confusing and not very right,
>     fix this by changing those to NULL checks instead.
>
> Fixes: f39db26c5428 ("drm: Add kms driver for loongson display controller")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>


Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>


> ---
> This is found with static analysis with smacth and only compile tested.
> ---
>   drivers/gpu/drm/loongson/lsdc_pixpll.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_pixpll.c b/drivers/gpu/drm/loongson/lsdc_pixpll.c
> index 04c15b4697e2..2609a2256da4 100644
> --- a/drivers/gpu/drm/loongson/lsdc_pixpll.c
> +++ b/drivers/gpu/drm/loongson/lsdc_pixpll.c
> @@ -120,12 +120,14 @@ static int lsdc_pixel_pll_setup(struct lsdc_pixpll * const this)
>   	struct lsdc_pixpll_parms *pparms;
>   
>   	this->mmio = ioremap(this->reg_base, this->reg_size);
> -	if (IS_ERR_OR_NULL(this->mmio))
> +	if (!this->mmio)
>   		return -ENOMEM;
>   
>   	pparms = kzalloc(sizeof(*pparms), GFP_KERNEL);
> -	if (IS_ERR_OR_NULL(pparms))
> +	if (!pparms) {
> +		iounmap(this->mmio);
>   		return -ENOMEM;
> +	}
>   
>   	pparms->ref_clock = LSDC_PLL_REF_CLK_KHZ;
>   


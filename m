Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E8A73339B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3282010E643;
	Fri, 16 Jun 2023 14:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F17F10E643
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:32:38 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxtOiFcoxkzAEGAA--.2480S3;
 Fri, 16 Jun 2023 22:32:37 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxZuSEcoxkJV8dAA--.17807S3; 
 Fri, 16 Jun 2023 22:32:37 +0800 (CST)
Message-ID: <a6f539ba-4f93-7136-36af-dad40d13c03c@loongson.cn>
Date: Fri, 16 Jun 2023 22:32:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [01/14] drm/ast: Fix DRAM init on AST2200
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230616140739.32042-2-tzimmermann@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230616140739.32042-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8AxZuSEcoxkJV8dAA--.17807S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJr4fKFyrJryUtF4fuF18tFc_yoW8Gr1xpr
 43Jr9YvrZ5Jw1Yyay7ua1DWFy3Zan5Ja4I9F1kAwna9r90gwn0gF90kw4rGry3ZrWxAryU
 tFnIqry7GF1vy3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
 Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
 14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
 AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
 0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8l3
 8UUUUUU==
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/6/16 21:52, Thomas Zimmermann wrote:
> Fix the test for the AST2200 in the DRAM initialization. The value
> in ast->chip has to be compared against an enum constant instead of
> a numerical value.
>
> This bug got introduced when the driver was first imported into the
> kernel.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>


> Fixes: 312fec1405dd ("drm: Initial KMS driver for AST (ASpeed Technologies) 2000 series (v2)")
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v3.5+
> ---
>   drivers/gpu/drm/ast/ast_post.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index a005aec18a020..0262aaafdb1c5 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -291,7 +291,7 @@ static void ast_init_dram_reg(struct drm_device *dev)
>   				;
>   			} while (ast_read32(ast, 0x10100) != 0xa8);
>   		} else {/* AST2100/1100 */
> -			if (ast->chip == AST2100 || ast->chip == 2200)
> +			if (ast->chip == AST2100 || ast->chip == AST2200)
>   				dram_reg_info = ast2100_dram_table_data;
>   			else
>   				dram_reg_info = ast1100_dram_table_data;

-- 
Jingfeng


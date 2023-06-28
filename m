Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E67407CA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 03:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7981610E343;
	Wed, 28 Jun 2023 01:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 29F7510E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 01:50:09 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Bx1cTQkZtkEVADAA--.5464S3;
 Wed, 28 Jun 2023 09:50:08 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxF8zPkZtkUVgNAA--.11202S3; 
 Wed, 28 Jun 2023 09:50:07 +0800 (CST)
Message-ID: <ebc3c30f-1ea5-5404-dbe0-1a153c580931@loongson.cn>
Date: Wed, 28 Jun 2023 09:50:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [13/39] drm: renesas: shmobile: Rename input clocks
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Magnus Damm <magnus.damm@gmail.com>
References: <3f92b2c9dafbfeb8534d4e81b6899ef3249731f0.1687423204.git.geert+renesas@glider.be>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <3f92b2c9dafbfeb8534d4e81b6899ef3249731f0.1687423204.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxF8zPkZtkUVgNAA--.11202S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr1UXw1rKw1xXr1xGryrZrc_yoW8WrWxpF
 4xCFyYqr4Yqanrtryak3Z7ur95Aa47Ja4S9rWUKa1rCr4jqwnxJ39xuF13XFyDJF4xuF40
 vF15Cw48A3WUurXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
 xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOdb8U
 UUUU=
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/22 17:21, Geert Uytterhoeven wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Prepare for DT bindings by using more appropriate names for the input
> clocks.
>
> Note that all LDDCKR_ICKSEL_* definitions but the one for the bus clock
> are valid only for SH7724, so the clock selection code needs to be
> updated when extending clock support to other SoCs.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> [geert: Add note]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>   drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index d272e6273c782178..007ba97cc7733c82 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -74,15 +74,15 @@ static int shmob_drm_setup_clocks(struct shmob_drm_device *sdev,
>   
>   	switch (clksrc) {
>   	case SHMOB_DRM_CLK_BUS:
> -		clkname = "bus_clk";
> +		clkname = "fck";
>   		sdev->lddckr = LDDCKR_ICKSEL_BUS;
>   		break;
>   	case SHMOB_DRM_CLK_PERIPHERAL:
> -		clkname = "peripheral_clk";
> +		clkname = "media";
>   		sdev->lddckr = LDDCKR_ICKSEL_MIPI;
>   		break;
>   	case SHMOB_DRM_CLK_EXTERNAL:
> -		clkname = NULL;
> +		clkname = "lclk";
>   		sdev->lddckr = LDDCKR_ICKSEL_HDMI;
>   		break;
>   	default:

-- 
Jingfeng


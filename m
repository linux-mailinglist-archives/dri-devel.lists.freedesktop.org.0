Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C9815CB37
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 20:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62BC6F63A;
	Thu, 13 Feb 2020 19:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5247F6F63A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 19:35:47 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c84so8080334wme.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 11:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jPKJYu3DgQU+kE/T2Ez7h1vTBNnV8iVzy5strPoawhY=;
 b=s/PgKohb0ewa1y2ZDClzH01Er9K1ksIXMUUlMg9sWkPB4eU3UKM1QCXm/XoUtgF4tU
 MMffXhcURT87v5xR43sfrpx+SEwcp7Kc2N98XiF/ite7UmMWh/Ig6HMRc15OEoS4zFDM
 wiwQdoVjx6ixKYyWJqfU3fh9ZqDh2e4rkA82t+0fgA6+pj+HTGVFaF8VM+vd3LycuODN
 DOcGXtfhmh/FEBrbiqZODokNmc+XucgibC08EYO8mVoDiMHkv64fG8fKtsAWe2XXVQ8U
 udocHHTK/QDezp+29O/jCT7TZp4nou8ldDYrrBCmA0wbu4UAZjy8PlL2X5oQ3pWcIGPl
 Xppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jPKJYu3DgQU+kE/T2Ez7h1vTBNnV8iVzy5strPoawhY=;
 b=pbCrmyvlHr6cDZ0x+aiETCQGtY5Ug31vhCgSNOLm9anUEwJn9VR3AeUwJtvUlfIfs2
 /bcRvlctuXO616htlq5mBU7bWYQ9jgLEIYiL2SrWDil+8tikZyxvkMVl9NpDYFp1ioBK
 CIrDzg2Tyo2p4afCmzvqxfVb5ffpbR9UBsClG72L1TdRXuBxqYvf2eK5mvjKXsWDHQEZ
 1gyQ7xVXhjXs0wySxmao0s5gr6Pwabjw8zDp/9s3xrlSHuAtSdVKFzP+gebVAtl16G1f
 lC5ZPD25Rr7v4vYU4Raz3M8TD9vY9FTOGuZEl5tnJk6TcJfwbC9I3vUNGQfTKk547MkK
 sBrg==
X-Gm-Message-State: APjAAAXDpfxKh/SH3Vdsd2/aXCAEcwyM3Zpj9yarTABZbiYq2aY0zCDb
 U2rZO00R7WgJABDnXXym8qFWeeWh
X-Google-Smtp-Source: APXvYqzXe8JoYG+adaKlX4POlnxKw2SUItyWkIlIFFdDdaIDzxMTkeerHzbNa6eYwI9FHaBjLa7+LQ==
X-Received: by 2002:a1c:5445:: with SMTP id p5mr7292167wmi.75.1581622545884;
 Thu, 13 Feb 2020 11:35:45 -0800 (PST)
Received: from ziggy.stardust ([37.223.145.31])
 by smtp.gmail.com with ESMTPSA id w1sm4256729wro.72.2020.02.13.11.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 11:35:45 -0800 (PST)
Subject: Re: [resend PATCH v6 10/12] clk: mediatek: mt8183: switch mmsys to
 platform device probing
To: CK Hu <ck.hu@mediatek.com>, matthias.bgg@kernel.org
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-11-matthias.bgg@kernel.org>
 <1575881471.14479.2.camel@mtksdaap41>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c46b1845-de26-d6f9-512a-e329a762cca7@gmail.com>
Date: Thu, 13 Feb 2020 20:35:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1575881471.14479.2.camel@mtksdaap41>
Content-Language: en-US
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
Cc: mark.rutland@arm.com, rdunlap@infradead.org, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com,
 linux-clk@vger.kernel.org, drinkcat@chromium.org, wens@csie.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, sean.wang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, mbrugger@suse.com, sboyd@kernel.org,
 sean.wang@kernel.org, linux-kernel@vger.kernel.org,
 enric.balletbo@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/12/2019 09:51, CK Hu wrote:
> Hi, Matthias:
> 
> On Sat, 2019-12-07 at 23:47 +0100, matthias.bgg@kernel.org wrote:
>> From: Matthias Brugger <mbrugger@suse.com>
>>
>> Switch probing for the MMSYS to support invocation to a
>> plain paltform device. The driver will be probed by the DRM subsystem.
>>
>> Singed-off-by: Matthias Brugger <mbrugger@suse.com>
>> ---
>>  drivers/clk/mediatek/clk-mt8183-mm.c | 39 +++++++++++++++++++---------
>>  1 file changed, 27 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-mt8183-mm.c b/drivers/clk/mediatek/clk-mt8183-mm.c
>> index 720c696b506d..e6dcad18d81a 100644
>> --- a/drivers/clk/mediatek/clk-mt8183-mm.c
>> +++ b/drivers/clk/mediatek/clk-mt8183-mm.c
>> @@ -3,14 +3,20 @@
>>  // Copyright (c) 2018 MediaTek Inc.
>>  // Author: Weiyi Lu <weiyi.lu@mediatek.com>
>>  
>> +#include <linux/module.h>
>>  #include <linux/clk-provider.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/slab.h>
>>  
>>  #include "clk-mtk.h"
>>  #include "clk-gate.h"
>>  
>>  #include <dt-bindings/clock/mt8183-clk.h>
>>  
>> +struct clk_mt8183_mm_priv {
>> +	struct clk_onecell_data *clk_data;
>> +};
>> +
>>  static const struct mtk_gate_regs mm0_cg_regs = {
>>  	.set_ofs = 0x104,
>>  	.clr_ofs = 0x108,
>> @@ -84,28 +90,37 @@ static const struct mtk_gate mm_clks[] = {
>>  
>>  static int clk_mt8183_mm_probe(struct platform_device *pdev)
>>  {
>> -	struct clk_onecell_data *clk_data;
>> -	struct device_node *node = pdev->dev.of_node;
>> +	struct clk_mt8183_mm_priv *private;
>> +	struct device_node *node = pdev->dev.parent->of_node;
>> +
>> +	private = devm_kzalloc(&pdev->dev, sizeof(*private), GFP_KERNEL);
>> +	if (!private)
>> +		return -ENOMEM;
>>  
>> -	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
>> +	private->clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
>> +	platform_set_drvdata(pdev, private);
> 
> There is a more simple modification that you need not to define struct
> clk_mt8183_mm_priv,
> 
> clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> platform_set_drvdata(pdev, clk_data);
> 

Yes you are right, I'll fix that for all the drivers.

Thanks,
Matthias

> Regards,
> CK
> 
>>  
>>  	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
>> -			clk_data);
>> +			private->clk_data);
>>  
>> -	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>> +	return of_clk_add_provider(node, of_clk_src_onecell_get,
>> +			private->clk_data);
>>  }
>>  
>> -static const struct of_device_id of_match_clk_mt8183_mm[] = {
>> -	{ .compatible = "mediatek,mt8183-mmsys", },
>> -	{}
>> -};
>> +static int clk_mt8183_mm_remove(struct platform_device *pdev)
>> +{
>> +	struct clk_mt8183_mm_priv *private = platform_get_drvdata(pdev);
>> +
>> +	kfree(private->clk_data);
>> +
>> +	return 0;
>> +}
>>  
>>  static struct platform_driver clk_mt8183_mm_drv = {
>>  	.probe = clk_mt8183_mm_probe,
>> +	.remove = clk_mt8183_mm_remove,
>>  	.driver = {
>>  		.name = "clk-mt8183-mm",
>> -		.of_match_table = of_match_clk_mt8183_mm,
>>  	},
>>  };
>> -
>> -builtin_platform_driver(clk_mt8183_mm_drv);
>> +module_platform_driver(clk_mt8183_mm_drv);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

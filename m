Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A29A632173
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 12:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FB310E2B3;
	Mon, 21 Nov 2022 11:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA5810E2B0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 11:57:58 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id me22so11366895ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 03:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MBbsIuonafwREhzlZL+FNmZyLBn3gGtNW8dW5Tq4ubo=;
 b=rMXy/vvwEhXKozlAX1RwrPPT42CNokrusCoQoaRmpnG1Qk15lltVbnd3j2iAUlPdCs
 ti02LF5TBqoq6YtuHwOVTeMM8V3j9A/NyTYlxdqupHWMVJXHr1OdUGXBc1PgZ4MAwDHo
 jBrJsSHfGHJvwDXnWS7nntzTuJE+2sCrNmMBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MBbsIuonafwREhzlZL+FNmZyLBn3gGtNW8dW5Tq4ubo=;
 b=wYRUk5UA3LN+dciFsLanM51pDtOxlvdkAm1vNhMlRdobucfuwRt8Ljb8z1NuoyWkry
 Yr258SVQmNjlxYw4DC8LLT1b3cIeVcyygF0A7OyH0CJ+ML2qppTa+eOEzX94AM4zQ4kt
 lAgQl535FmN3vlv/dsAwwP42Whik07g+C2g6bIqnzaHWrKIsF5krHlUSWvGKOXhTuQTc
 DmjtcHWAXH0oG0kI6Sq/gRz0WuPsSGBzMdS/NTgtBfXi2TLJlzYRYQI2CH4ZqwLF06mn
 YMx2GjQQWq4Dt3p7+3IijKVFWsTxghWUuo3cmRgP7vqqpv2UbkTHD5i4gEAO4Tiwt9gb
 sBwQ==
X-Gm-Message-State: ANoB5pmMoKVBmWU8hfoQrOx5msFd6Ipupcl1KueAmcZWsUmCc0FntzMC
 gLXp8uAwFnf+AO66RpZaLN2HmQ==
X-Google-Smtp-Source: AA0mqf4GqPNprIWVxYHjPd6mEdI7a0BfxK3crJG0H7ykmiHCidUbmzKoQBMNZ5VBRsnmPvjpZMda8Q==
X-Received: by 2002:a17:906:2342:b0:78d:9e77:1f8c with SMTP id
 m2-20020a170906234200b0078d9e771f8cmr6710101eja.236.1669031876837; 
 Mon, 21 Nov 2022 03:57:56 -0800 (PST)
Received: from tom-ThinkPad-T14s-Gen-2i
 (net-188-217-55-94.cust.vodafonedsl.it. [188.217.55.94])
 by smtp.gmail.com with ESMTPSA id
 k19-20020aa7c053000000b00456c6b4b777sm5037181edo.69.2022.11.21.03.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 03:57:56 -0800 (PST)
Date: Mon, 21 Nov 2022 12:57:54 +0100
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Wang Yufen <wangyufen@huawei.com>
Subject: Re: [PATCH] i2c: qcom-geni: fix error return code in geni_i2c_gpi_xfer
Message-ID: <20221121115754.GA39395@tom-ThinkPad-T14s-Gen-2i>
References: <1669025872-44226-1-git-send-email-wangyufen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1669025872-44226-1-git-send-email-wangyufen@huawei.com>
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
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, vkoul@kernel.org, agross@kernel.org,
 linux-i2c@vger.kernel.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wang,

On Mon, Nov 21, 2022 at 06:17:52PM +0800, Wang Yufen wrote:
> Fix to return a negative error code from the gi2c->err instead of
> 0.
> 
> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 84a7751..8fce98b 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -626,7 +626,6 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  			dev_err(gi2c->se.dev, "I2C timeout gpi flags:%d addr:0x%x\n",
>  				gi2c->cur->flags, gi2c->cur->addr);
>  			gi2c->err = -ETIMEDOUT;
> -			goto err;


Looks good to me.
Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasoluitons.com>

Regards,
Tommaso

>  		}
>  
>  		if (gi2c->err) {
> -- 
> 1.8.3.1
> 

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com

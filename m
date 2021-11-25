Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9280E45D75B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 10:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECFD6E471;
	Thu, 25 Nov 2021 09:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACA26E471
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 09:38:34 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id t26so14752381lfk.9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 01:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aQfEF2jOyB6rG0WgJqxX+s72gSlGzMx+nQDP2V3jnUo=;
 b=XP1s+2vl2wLKjYg8HW8m0tBRvF1KXYoTcuBdkaaqufBoeAAUNFbRtKZwsWlR9Qx9o7
 sQfne5msWVBOQ2sExqYlvGUSXCf/nzLL4eBoQjyPJrPkU6vh/e6Ski5TOJZXOR2ORSrI
 Bm+8i6X5FK/MPGj3rkm64ToQQgAAmHyN5TFzSlZBYu4WZP+L8sCHlNHUXxG5j1exzQDg
 TmzWk7pSIK/QvGZQw6J2q7td0fvZRwYoAPn0lK7WdP7iZemoSkWzW9UGjFqC6zGVMxLa
 llEiF9wHAVSX6MuEkqlXH6/AFGI+yHioqITD0XWU1zM8ylc0lOHJqsVFbzYAxOWc4mlA
 QxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aQfEF2jOyB6rG0WgJqxX+s72gSlGzMx+nQDP2V3jnUo=;
 b=SZmNf9wswDhevc2WjoyxgVqLWc+mMpEBo5C6P6HXATSs7vypilMBr9wg146Av8z+7/
 sN592kUI6UOesl3BOynUHxWjcigBP5n6nVOj/wmnT9fH+8SAcWcESofwD78cu1oxulcm
 +Wcq1uS+y+RNTSw+XIIxU11N7TKu+KrMq60XOHaU7h1bNG/GoVBSk2tjCD1S7rSwigkV
 cPMhxl2hs3hlykV7uecdiMGtCvIJc8lvZWXklKYKRItFqikYvrBdj3/HBUNw/O7RKAi8
 6vSa1WYNjw4alryJ4zty2wQdQkuS8CqvTW2Psl7jez+E63hMY2U5v6tylNKBNO3P9ysc
 zCYg==
X-Gm-Message-State: AOAM531VcyWfd8v+1vTMN+XCfKpxvlR9VkyRDNsBrrsdKuA6siwognIU
 3IwyCKrjMW+yfczeSejn00k=
X-Google-Smtp-Source: ABdhPJzWc+bPvWIJYmGhydRiz7YOTBnPcF7QeIDgBqlVGZLg7GMaZCawciOk/gkfmc3Yo0+Xvj4ncw==
X-Received: by 2002:a05:6512:3213:: with SMTP id
 d19mr22334711lfe.519.1637833113104; 
 Thu, 25 Nov 2021 01:38:33 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id n9sm203122lji.131.2021.11.25.01.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 01:38:32 -0800 (PST)
Subject: Re: [PATCH v3] i2c: tegra: Add the ACPI support
To: Akhil R <akhilrajeev@nvidia.com>
References: <1637831237-30652-1-git-send-email-akhilrajeev@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2a005ca8-e46a-59d0-c219-dfc94a3b810f@gmail.com>
Date: Thu, 25 Nov 2021 12:38:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637831237-30652-1-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, linaro-mm-sig@lists.linaro.org,
 andy.shevchenko@gmail.com, ldewangan@nvidia.com, thierry.reding@gmail.com,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

25.11.2021 12:07, Akhil R пишет:
> Add support for the ACPI based device registration so that the driver
> can be also enabled through ACPI table.
> 
> This does not include the ACPI support for Tegra VI and DVC I2C.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 52 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 40 insertions(+), 12 deletions(-)
> 
> v3 changes
>   * removed acpi_has_method check.
>   * moved dev_err_probe to init_reset function to make it consistent with
> 	init_clocks.
>   * Updates in commit message as suggested.
> 
> v2 - https://lkml.org/lkml/2021/11/23/82
> v1 - https://lkml.org/lkml/2021/11/19/393

Akhil, the patch looks almost good, thank you. Please see one minor
question below.

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index c883044..b889eb3 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -6,6 +6,7 @@
>   * Author: Colin Cross <ccross@android.com>
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> @@ -608,6 +609,7 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
>  static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>  {
>  	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
> +	acpi_handle handle = ACPI_HANDLE(i2c_dev->dev);

...
> +static int tegra_i2c_init_reset(struct tegra_i2c_dev *i2c_dev)
> +{
> +	if (has_acpi_companion(i2c_dev->dev))
> +		return 0;

Can we use ACPI_HANDLE() everywhere instead of has_acpi_companion()? For
consistency. I guess that's what Andy was asking about in v1?

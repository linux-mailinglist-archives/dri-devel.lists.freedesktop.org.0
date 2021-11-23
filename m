Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C5645A577
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129D66EADE;
	Tue, 23 Nov 2021 14:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC826EADE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:22:48 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id t26so91163223lfk.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZMeCrLa15OccbLKstH+rkvmxcTzmqdGm6G4k7JN2u+g=;
 b=cEA/8Yj3ZxwMyab/D+fVwK4RTjrmX0j2GCb4Ssn+y+V7q/YU0rEjTXnDzuzFi7aGjz
 ekpnz5cGZQGxa1KleqE8XEKEhsyGaaluJ6taCNpiBlBMGrUVXvCF22jiOzJJ2+BOrv5D
 Do+tRFepLNOKwqqiCPVRmGiGlDFdYlh6oZg7fcOj+76JxN9WXF3XbUBsGNQLQ1dJFAy6
 lXbi9+siENQKlhnoEJCsUeiUJQTg0mNKpQQ++7CPGn+i1v3kMyXQ2mFf8QMSL4g6HA6w
 mkkrpfN6Ja+mC6e8DXi/MoR01glt/rrPyMNgXCwObvjGTTi5haF48feknRjPjYJOl/iF
 TEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZMeCrLa15OccbLKstH+rkvmxcTzmqdGm6G4k7JN2u+g=;
 b=A14B29FpSm7+UxHrVE7UPDptMgQy6M/Yw/3I2fQRTvtQGdQpOA8pf3Ik08lMBWeNgN
 WjoLiUEQOFqctdFN9BrYefqDRhoVrxP3kSpoX0sQjXDtZMvR/9MNLzgjX+lYhjT+pf2h
 Vk+4q7Mk6fzewYA90vEbjoPG55D9KpKUDG71pphk1Lr34s8+9vVEYi3H7n4ORbrPPvVo
 WJiAMuNs5ToMtRrJPqcP7tKIQqX5chgOlP7FEIpe/VcJtJlCBMORBfNZBxrH7qyS3grG
 ManKjR3qoYl9mcDJM1UZuNh0CyoU31PmUERPADQMbj5m0dkVPcryy0m0Xqn1njq8g8OT
 xE1Q==
X-Gm-Message-State: AOAM5330LthtpIrkBJRfrAgccZo0FiEpQi1/ZykgmO812JaCjJG8q/vZ
 Pr+AE7QrDh6zXaIqNnbx88E=
X-Google-Smtp-Source: ABdhPJy0vZYWPE8GVIFIH55E4+lUDNDWf9juiW+Ga+3y1umlsbNJgY0+I6R8hvXP1yOqqlPwoIyrTQ==
X-Received: by 2002:a05:6512:519:: with SMTP id
 o25mr5136057lfb.422.1637677366940; 
 Tue, 23 Nov 2021 06:22:46 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id v198sm1304911lfa.89.2021.11.23.06.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 06:22:46 -0800 (PST)
Subject: Re: [PATCH v2] i2c: tegra: Add ACPI support
To: Akhil R <akhilrajeev@nvidia.com>, andy.shevchenko@gmail.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, ldewangan@nvidia.com, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 p.zabel@pengutronix.de, sumit.semwal@linaro.org, thierry.reding@gmail.com
References: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
 <1637651753-5067-1-git-send-email-akhilrajeev@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <eebf20ea-6a7f-1120-5ad8-b6dc1f9935e6@gmail.com>
Date: Tue, 23 Nov 2021 17:22:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637651753-5067-1-git-send-email-akhilrajeev@nvidia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

23.11.2021 10:15, Akhil R пишет:
> Add support for ACPI based device registration so that the driver
> can be also enabled through ACPI table.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 52 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 40 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index c883044..8e47889 100644
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
>  	int err;
>  
>  	/*
> @@ -618,7 +620,11 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>  	 * emit a noisy warning on error, which won't stay unnoticed and
>  	 * won't hose machine entirely.
>  	 */
> -	err = reset_control_reset(i2c_dev->rst);
> +	if (handle && acpi_has_method(handle, "_RST"))

Which SoC version doesn't have "_RST" method? If neither, then please
remove this check.

> +		err = (acpi_evaluate_object(handle, "_RST", NULL, NULL));

Please remove parens around acpi_evaluate_object(). Why you added them?

> +	else
> +		err = reset_control_reset(i2c_dev->rst);
> +
>  	WARN_ON_ONCE(err);
>  
>  	if (i2c_dev->is_dvc)
> @@ -1627,12 +1633,12 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
>  	bool multi_mode;
>  	int err;
>  
> -	err = of_property_read_u32(np, "clock-frequency",
> -				   &i2c_dev->bus_clk_rate);
> +	err = device_property_read_u32(i2c_dev->dev, "clock-frequency",
> +				       &i2c_dev->bus_clk_rate);
>  	if (err)
>  		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
>  
> -	multi_mode = of_property_read_bool(np, "multi-master");
> +	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
>  	i2c_dev->multimaster_mode = multi_mode;
>  
>  	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
> @@ -1642,10 +1648,25 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
>  		i2c_dev->is_vi = true;
>  }
How are you going to differentiate the VI I2C from a non-VI? This
doesn't look right.


>  
> +static int tegra_i2c_init_reset(struct tegra_i2c_dev *i2c_dev)
> +{
> +	if (has_acpi_companion(i2c_dev->dev))
> +		return 0;
> +
> +	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
> +	if (IS_ERR(i2c_dev->rst))
> +		return PTR_ERR(i2c_dev->rst);
> +
> +	return 0;
> +}
> +
>  static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
>  {
>  	int err;
>  
> +	if (has_acpi_companion(i2c_dev->dev))
> +		return 0;
> +
>  	i2c_dev->clocks[i2c_dev->nclocks++].id = "div-clk";
>  
>  	if (i2c_dev->hw == &tegra20_i2c_hw || i2c_dev->hw == &tegra30_i2c_hw)
> @@ -1720,7 +1741,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  	init_completion(&i2c_dev->msg_complete);
>  	init_completion(&i2c_dev->dma_complete);
>  
> -	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
> +	i2c_dev->hw = device_get_match_data(&pdev->dev);
>  	i2c_dev->cont_id = pdev->id;
>  	i2c_dev->dev = &pdev->dev;
>  
> @@ -1746,15 +1767,13 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> -	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
> -	if (IS_ERR(i2c_dev->rst)) {
> -		dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
> -			      "failed to get reset control\n");
> -		return PTR_ERR(i2c_dev->rst);
> -	}
> -
>  	tegra_i2c_parse_dt(i2c_dev);
>  
> +	err = tegra_i2c_init_reset(i2c_dev);
> +	if (err)
> +		return dev_err_probe(i2c_dev->dev, err,
> +				      "failed to get reset control\n");

This is inconsistent with tegra_i2c_init_clocks() which returns err
directly and prints error message within the function. Please move the
dev_err_probe() into tegra_i2c_init_reset() to make it consistent, like
I suggested before.

Please don't reply with a new version of the patch to the old thread,
always send a new version separately. Otherwise it's more difficult to
follow patches.

Lastly, each new version of a patch must contain changelog. I don't see
changelog here, please add it to v3 after the " ---" separator of the
commit message. Thanks!

Example:

 Commit message.

 Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
 ---
  drivers/i2c/busses/i2c-tegra.c | 52
++++++++++++++++++++++++++++++++----------
  1 file changed, 40 insertions(+), 12 deletions(-)

Changelog:

v3: bla-bla-bla

v2: bla-bla-bla

diff ...

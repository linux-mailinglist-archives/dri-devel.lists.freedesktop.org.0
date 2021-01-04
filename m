Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F482E920C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F26189E1B;
	Mon,  4 Jan 2021 08:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA262895CA
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 07:19:13 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id w1so4868124pjc.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jan 2021 23:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vXX8xe2A/FeRiUPzOKt0JcPzE3KP7HXla4w8NsLDWnc=;
 b=YuGFCAwzc6s0ZWTmT9gJ9dm8xm/iUjFtuUFJRPZZY/029s2KACTxdL3ZqUZrKeogJd
 Ck/BTqRIjMB5kEpsoEnDNSlIu8hBVdh25KA2kWlSOtZFYtONWP6o3CVkb5qpfF4QvDQs
 2KANTHMNVLyC/f2JaJ5cZrDJAWRoXsbRxpH9aBuvbWlZ29OSySy90D7abge4FuootsRW
 WO3nv55h3wwq+1JvIQSL/NTB6Pq5v++NLIQBDpBwCAxWyT9uh0p0tan5aq359RYmBvW9
 H4ZJZnDoyu8st82avvR/1WjDPqeisur7dfMRBYvklu+jNS3TNFshPHX/wRWrZGdhzEtL
 hdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vXX8xe2A/FeRiUPzOKt0JcPzE3KP7HXla4w8NsLDWnc=;
 b=Fbx0+S+iWHfZVoLQ8cNtVTQ8tvkgeRbI58UT7AnO4DzXtNXGF/5kKHl/8bB4LV8/9s
 1CNXh67gVuTGUFWcG4lprDXbabjhyzepYoMs3e5AvqGdVsexrq18wnZPan0SqPC65lg0
 OoUwRcTXqSMFw+IDEnsy88G+UDj9uE+ls6Jvq6JMfThyv/1AzRZQYUa4EOJZstXgIIod
 zeW3+g6EGKsS7xJCYUEipx7Eh8X/bt2hPCDsbEk9P5OOxEdvEakfew17a+WC6twNLYow
 I3akeyR1Q9hWLuclZWTjO0wVJ3/zuGC2KVG8LyRlvhdoIjosnOAi1aaLvM60YrUVYrji
 MZWw==
X-Gm-Message-State: AOAM532EirbdmbbSLvT6CcQXpSWRK3MH3SqNTV0CwqvxSS8rd6DPtF7w
 rHNn2EoVkk/pLNLMqkXgdlhnPA==
X-Google-Smtp-Source: ABdhPJwvlRfdZmhb4sgIhlIMCp7GSIzc4CGLSDAZCiWizmME24cJXa5sePE9JLIPSO8GE4a2CzO61w==
X-Received: by 2002:a17:902:9f88:b029:dc:292d:37c5 with SMTP id
 g8-20020a1709029f88b02900dc292d37c5mr46034848plq.26.1609744753253; 
 Sun, 03 Jan 2021 23:19:13 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id h12sm45986820pgk.70.2021.01.03.23.19.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Jan 2021 23:19:12 -0800 (PST)
Date: Mon, 4 Jan 2021 12:49:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 07/31] serial: qcom_geni_serial: convert to use
 devm_pm_opp_* API
Message-ID: <20210104071910.2a2otwxyniu7c22z@vireshk-i7>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-8-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210101165507.19486-8-tiny.windzz@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: nm@ti.com, ulf.hansson@linaro.org, gustavoars@kernel.org,
 jirislaby@kernel.org, airlied@linux.ie, linux-mmc@vger.kernel.org,
 stanimir.varbanov@linaro.org, tanmay@codeaurora.org,
 bjorn.andersson@linaro.org, natechancellor@gmail.com, thierry.reding@gmail.com,
 tongtiangen@huawei.com, groeck@chromium.org, marijn.suijten@somainline.org,
 digetx@gmail.com, steven.price@arm.com, mka@chromium.org,
 chandanu@codeaurora.org, emil.velikov@collabora.com,
 linux-samsung-soc@vger.kernel.org, jonathan@marek.ca, harigovi@codeaurora.org,
 adrian.hunter@intel.com, vireshk@kernel.org, linux-pm@vger.kernel.org,
 kyungmin.park@samsung.com, krzk@kernel.org, jonathanh@nvidia.com,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 alyssa.rosenzweig@collabora.com, linux-serial@vger.kernel.org,
 airlied@redhat.com, smasetty@codeaurora.org, linux-imx@nxp.com,
 freedreno@lists.freedesktop.org, kernel@pengutronix.de, tzimmermann@suse.de,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org,
 abhinavk@codeaurora.org, akhilpo@codeaurora.org, khsieh@codeaurora.org,
 lima@lists.freedesktop.org, broonie@kernel.org, rikard.falkeborn@gmail.com,
 kalyan_t@codeaurora.org, linux-tegra@vger.kernel.org, varar@codeaurora.org,
 mchehab@kernel.org, sean@poorly.run, linux-arm-kernel@lists.infradead.org,
 dianders@chromium.org, akashast@codeaurora.org, rnayak@codeaurora.org,
 parashar@codeaurora.org, tomeu.vizoso@collabora.com, sboyd@kernel.org,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, rjw@rjwysocki.net,
 agross@kernel.org, linux-kernel@vger.kernel.org, miaoqinglang@huawei.com,
 hoegsberg@google.com, yuq825@gmail.com, ddavenport@chromium.org,
 masneyb@onstation.org, shawnguo@kernel.org, georgi.djakov@linaro.org,
 lukasz.luba@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01-01-21, 16:54, Yangtao Li wrote:
> Use devm_pm_opp_* API to simplify code, and we don't need
> to make opp_table glabal.
> 
> Let's remove opp_table from geni_se later.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 5aada7ebae35..36a92df8ec11 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1352,6 +1352,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	int irq;
>  	bool console = false;
>  	struct uart_driver *drv;
> +	struct opp_table *opp_table;
>  
>  	if (of_device_is_compatible(pdev->dev.of_node, "qcom,geni-debug-uart"))
>  		console = true;
> @@ -1433,13 +1434,13 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	if (of_property_read_bool(pdev->dev.of_node, "cts-rts-swap"))
>  		port->cts_rts_swap = true;
>  
> -	port->se.opp_table = dev_pm_opp_set_clkname(&pdev->dev, "se");
> -	if (IS_ERR(port->se.opp_table))
> -		return PTR_ERR(port->se.opp_table);
> +	opp_table = devm_pm_opp_set_clkname(&pdev->dev, "se");
> +	if (IS_ERR(opp_table))
> +		return PTR_ERR(opp_table);
>  	/* OPP table is optional */
> -	ret = dev_pm_opp_of_add_table(&pdev->dev);
> +	ret = devm_pm_opp_of_add_table(&pdev->dev);
>  	if (ret) {
> -		dev_pm_opp_put_clkname(port->se.opp_table);
> +		devm_pm_opp_put_clkname(&pdev->dev, opp_table);

We shouldn't be doing this here, i.e. put_clkname. Even when the OPP
table isn't present, this driver calls dev_pm_opp_set_rate() which
behaves like clk_set_rate() in this case and so the clk name is still
required by the OPP core.

>  		if (ret != -ENODEV) {
>  			dev_err(&pdev->dev, "invalid OPP table in device tree\n");
>  			return ret;
> @@ -1453,7 +1454,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  
>  	ret = uart_add_one_port(drv, uport);
>  	if (ret)
> -		goto err;
> +		return ret;
>  
>  	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
>  	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
> @@ -1461,7 +1462,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	if (ret) {
>  		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
>  		uart_remove_one_port(drv, uport);
> -		goto err;
> +		return ret;
>  	}
>  
>  	/*
> @@ -1478,15 +1479,11 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  		if (ret) {
>  			device_init_wakeup(&pdev->dev, false);
>  			uart_remove_one_port(drv, uport);
> -			goto err;
> +			return ret;
>  		}
>  	}
>  
>  	return 0;
> -err:
> -	dev_pm_opp_of_remove_table(&pdev->dev);
> -	dev_pm_opp_put_clkname(port->se.opp_table);
> -	return ret;
>  }
>  
>  static int qcom_geni_serial_remove(struct platform_device *pdev)
> @@ -1494,8 +1491,6 @@ static int qcom_geni_serial_remove(struct platform_device *pdev)
>  	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
>  	struct uart_driver *drv = port->private_data.drv;
>  
> -	dev_pm_opp_of_remove_table(&pdev->dev);
> -	dev_pm_opp_put_clkname(port->se.opp_table);
>  	dev_pm_clear_wake_irq(&pdev->dev);
>  	device_init_wakeup(&pdev->dev, false);
>  	uart_remove_one_port(drv, &port->uport);
> -- 
> 2.25.1

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

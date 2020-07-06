Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B47C1215B8A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 18:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFF689FCE;
	Mon,  6 Jul 2020 16:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FB989FCA
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 16:11:00 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id p3so18595494pgh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 09:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Kxpgn+GnVhnInuZTEY3U3K5Tk71jPK8wC7nu0ga4/fw=;
 b=nbQzoPKjqjnIrUMrKu30HI3Eg6a1eMk6dbCMfw3HJK42SAQc8CthBadwHpAxjtlmGk
 8d5mSe0Ao+f2/bee7mjRqi80i6P9/+hXYCVq54kbbEYcdoK5ErXfsACQPK+XAXCtZuod
 JCZZbAF6fmr+o2n6HILhJNTP1XA+2Uf7BFvy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Kxpgn+GnVhnInuZTEY3U3K5Tk71jPK8wC7nu0ga4/fw=;
 b=dW5ZkVsEVebP2/C6ds4dyQK7A/7JXEG5aAFpnfXqmxT13htdQ3w5/XjmKWP2UBDCVf
 S0FSN/A9HrOG8LtndvwC24UjCnbPK27tTBlTZKPGfR2a9/GSwOLpi1guYBcwXnx2tAF4
 Q2VJ7IrW9UU3IGnYTrLtKwb6t6u9vIgj7Xw7az08Ic78dQBiErWFWGLNrHOejkBOiK5p
 OSavQREhjG/vMdYPC86XAdo4v+G7ksaLL92ML4wxJPNpZUBUWRUVSW9wt+oNKsTpmxqv
 5edMhp2dqjziDRXKDTRV+8k4+d637bCBx5+DcXRKlH3CXviYI1KFZ+ag9Elvj3u87fzu
 8+aw==
X-Gm-Message-State: AOAM531EsAFd9K2Nv1x1csGhwJn1ahHCnqQRGVd0CJXsEcWPczTmKXMB
 JOTW7tHecHhm7Dkr+reF0nro0Q==
X-Google-Smtp-Source: ABdhPJyVjLtzWbo0ncj4kmd2UIN+BR2sv4gkUn6dDJQBKy2XGcmw+t0N4jFQ6LQD+nxLoORhXh6e8Q==
X-Received: by 2002:a62:8688:: with SMTP id
 x130mr45549675pfd.280.1594051859580; 
 Mon, 06 Jul 2020 09:10:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id o42sm20120289pje.10.2020.07.06.09.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2020 09:10:58 -0700 (PDT)
Date: Mon, 6 Jul 2020 09:10:57 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v2 2/4] drm/msm: dsi: Use OPP API to set clk/perf state
Message-ID: <20200706161057.GG3191083@google.com>
References: <1593688151-22616-1-git-send-email-rnayak@codeaurora.org>
 <1593688151-22616-3-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593688151-22616-3-git-send-email-rnayak@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, agross@kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 02, 2020 at 04:39:09PM +0530, Rajendra Nayak wrote:
> On SDM845 and SC7180 DSI needs to express a performance state
> requirement on a power domain depending on the clock rates.
> Use OPP table from DT to register with OPP framework and use
> dev_pm_opp_set_rate() to set the clk/perf state.
> 
> dev_pm_opp_set_rate() is designed to be equivalent to clk_set_rate()
> for devices without an OPP table, hence the change works fine
> on devices/platforms which only need to set a clock rate.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 11ae5b8..09e16b8 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -14,6 +14,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/of_irq.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/pm_opp.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spinlock.h>
> @@ -111,6 +112,9 @@ struct msm_dsi_host {
>  	struct clk *pixel_clk_src;
>  	struct clk *byte_intf_clk;
>  
> +	struct opp_table *opp_table;
> +	bool has_opp_table;
> +
>  	u32 byte_clk_rate;
>  	u32 pixel_clk_rate;
>  	u32 esc_clk_rate;
> @@ -512,9 +516,10 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>  	DBG("Set clk rates: pclk=%d, byteclk=%d",
>  		msm_host->mode->clock, msm_host->byte_clk_rate);
>  
> -	ret = clk_set_rate(msm_host->byte_clk, msm_host->byte_clk_rate);
> +	ret = dev_pm_opp_set_rate(&msm_host->pdev->dev,
> +				  msm_host->byte_clk_rate);
>  	if (ret) {
> -		pr_err("%s: Failed to set rate byte clk, %d\n", __func__, ret);
> +		pr_err("%s: dev_pm_opp_set_rate failed %d\n", __func__, ret);
>  		return ret;
>  	}
>  
> @@ -658,6 +663,8 @@ int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host)
>  
>  void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host)
>  {
> +	/* Drop the performance state vote */
> +	dev_pm_opp_set_rate(&msm_host->pdev->dev, 0);
>  	clk_disable_unprepare(msm_host->esc_clk);
>  	clk_disable_unprepare(msm_host->pixel_clk);
>  	if (msm_host->byte_intf_clk)
> @@ -1879,6 +1886,18 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>  		goto fail;
>  	}
>  
> +	msm_host->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "byte");
> +	if (IS_ERR(msm_host->opp_table))
> +		return PTR_ERR(msm_host->opp_table);
> +	/* OPP table is optional */
> +	ret = dev_pm_opp_of_add_table(&pdev->dev);
> +	if (!ret) {
> +		msm_host->has_opp_table = true;
> +	} else if (ret != -ENODEV) {
> +		dev_err(&pdev->dev, "invalid OPP table in device tree\n");

  		dev_pm_opp_put_clkname(msm_host->opp_table);

> +		return ret;
> +	}

With the missing _put_clkname() fixed:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13400344AE9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A48C6E516;
	Mon, 22 Mar 2021 16:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5510F6E516
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 16:18:14 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id r12so22254190ejr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 09:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5fPU70P+apIZaZ90738281RBQVtiFO6xyPzB24/nFj0=;
 b=PPVMKoO2LmrxB/EqF6MdsVCuOvCwzdnYIGu2CT53plAQh+yZIwJP+JPbBQG8Mez/X4
 dL+oIx21/VF4Hq39I/bVUmtrzWJmFH7xgszYCiT6J/He6X7upD15585k4QOPFADu+/eD
 QGre1T0qcLb0GWCg+tAd2MOaQpSFdYMLRvJ9ocygy2vTtaMWSScKS0tdYl6wOAWqz4wo
 LuanlAHsC/rGWiQE/jkEUFFhBiiHpYDaYCa8eUN8gX7TC4Pna+GrsqForZ85Nrxp3sbW
 U9FgvTr2gCIpDVhOQvLw9b1r+gGjYEy2RnlbmW5LH+1/GPpC1dGpGaafVjfP69uGspZ+
 3Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5fPU70P+apIZaZ90738281RBQVtiFO6xyPzB24/nFj0=;
 b=asPmHStz/ajA7q1z55eJMvBWrDBETJRQvmqhZ6NEoNS201+2wHOSWQYoSBuZinhauQ
 XCyY/I8ghpT9I4YFkpEXj8u70T1zzRrJapuqBm1SjSVyp9TmK9FyqbfR8ZVLOUTQVzQP
 3eDBbmgtR5TyCCgmTFRN4MnSrrEItGi/ju9wRWpVji42wCrR7vBJTBveoA/XQGAvPTWe
 XWCFL+TUMxEgOCeVfcT1daQ8Ox/r4R67klrhAdxNHliimQkQKYL7SF7+ojzYpJjjDWPH
 eikDTxvJx7uoAbv1D+5N9MhwdwFLu/1NgVmABfZsri+L9GJ4zmfeHYPiif6wEr8zUcG0
 XyHg==
X-Gm-Message-State: AOAM5327dOJUeq6njDitF7wEzMWbIzbPMZJ9KysilnQzQOEG4AdzD0ky
 BMRzs6D74fbUQ64a0nXZnMEGFbKU35PX5S6C
X-Google-Smtp-Source: ABdhPJxWxOTWcNLPwlbFuHUTnCQvbb7chDavRLIX6ffZBF7loKDa89ZLnniTNDnUEtQqJ6ccAuewSw==
X-Received: by 2002:a17:906:b316:: with SMTP id
 n22mr539237ejz.249.1616429892990; 
 Mon, 22 Mar 2021 09:18:12 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id q12sm9950268ejy.91.2021.03.22.09.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 09:18:12 -0700 (PDT)
Date: Mon, 22 Mar 2021 16:18:10 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
Message-ID: <20210322161810.biagj2qro66rv4gt@maple.lan>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
 <20210228124106.135812-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210228124106.135812-2-konrad.dybcio@somainline.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Kiran Gunda <kgunda@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 Pavel Machek <pavel@ucw.cz>, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 28, 2021 at 01:41:05PM +0100, Konrad Dybcio wrote:
> Add a compatible for PMI8994 WLED. It uses the V4 of WLED IP.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  drivers/video/backlight/qcom-wled.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 3bc7800eb0a9..497b9035a908 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1704,6 +1704,7 @@ static int wled_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id wled_match_table[] = {
>  	{ .compatible = "qcom,pm8941-wled", .data = (void *)3 },
> +	{ .compatible = "qcom,pmi8994-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pm660l-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pm8150l-wled", .data = (void *)5 },
> -- 
> 2.30.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDDC824318
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 14:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD2C10E43F;
	Thu,  4 Jan 2024 13:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696DE10E400
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 13:51:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 404AXOvq022627; Thu, 4 Jan 2024 14:51:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=au43nqK7nHZ8BJAhVEW3trO9826zxXlgdNutC4+DT1Y=; b=vP
 krYsx+7jfA0/FQ9Acpp/VHNZUmXIRAhIVuHq3tDml8QxhOrG8l9OIBMYLgB2PJdE
 4fzmztnfFVG17nwDJD0vmW7tm+LiegstY1zbKLffvs/v3b1gI952+7KM7fk2+JIa
 MMp/PbftaUayc1uYuVwFxWlXGbTV9xvUFyluEmzLy5l13FOG2o6UAlqi9ynqneOv
 J0UbYJtSrLp6GHBuQHCPcYsHq21/TGiGIVEfzIuav9t/cS/pnw83ngikvj2J/smZ
 6yJA2NkH5UKLQuAMcRzR0DFAvQ4Wp0U2h5kTKfpQEoOBatPAP2T6xY32fmEo945+
 vQvZDBNcgAuLCO829vDQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vdjtu2nrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jan 2024 14:51:11 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E4DB10002A;
 Thu,  4 Jan 2024 14:51:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D61322FA44;
 Thu,  4 Jan 2024 14:51:10 +0100 (CET)
Received: from [10.252.5.254] (10.252.5.254) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 14:51:08 +0100
Message-ID: <29b3092f-4d4d-4b6d-9667-aa04eddd2956@foss.st.com>
Date: Thu, 4 Jan 2024 14:51:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/stm: dsi: expose DSI PHY internal clock
To: Simon Horman <horms@kernel.org>
References: <20231204101113.276368-1-raphael.gallais-pou@foss.st.com>
 <20231204101113.276368-4-raphael.gallais-pou@foss.st.com>
 <20231208165855.GA8459@kernel.org>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20231208165855.GA8459@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.5.254]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-04_07,2024-01-03_01,2023-05-22_02
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/8/23 17:58, Simon Horman wrote:
> On Mon, Dec 04, 2023 at 11:11:12AM +0100, Raphael Gallais-Pou wrote:
>
> ...
>
>> @@ -514,18 +675,40 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>>  		dsi->lane_max_kbps *= 2;
>>  	}
>>  
>> -	dw_mipi_dsi_stm_plat_data.base = dsi->base;
>> -	dw_mipi_dsi_stm_plat_data.priv_data = dsi;
>> +	dsi->pdata = *pdata;
>> +	dsi->pdata.base = dsi->base;
>> +	dsi->pdata.priv_data = dsi;
>> +
>> +	dsi->pdata.max_data_lanes = 2;
>> +	dsi->pdata.phy_ops = &dw_mipi_dsi_stm_phy_ops;
>>  
>>  	platform_set_drvdata(pdev, dsi);
>>  
>> -	dsi->dsi = dw_mipi_dsi_probe(pdev, &dw_mipi_dsi_stm_plat_data);
>> +	dsi->dsi = dw_mipi_dsi_probe(pdev, &dsi->pdata);
>>  	if (IS_ERR(dsi->dsi)) {
>>  		ret = PTR_ERR(dsi->dsi);
>>  		dev_err_probe(dev, ret, "Failed to initialize mipi dsi host\n");
>>  		goto err_dsi_probe;
>>  	}
>>  
>> +	/*
>> +	 * We need to wait for the generic bridge to probe before enabling and
>> +	 * register the internal pixel clock.
>> +	 */
>> +	ret = clk_prepare_enable(dsi->pclk);
>> +	if (ret) {
>> +		DRM_ERROR("%s: Failed to enable peripheral clk\n", __func__);
>> +		goto err_dsi_probe;
>> +	}
>> +
>> +	ret = dw_mipi_dsi_clk_register(dsi, dev);
>> +	if (ret) {
>> +		DRM_ERROR("Failed to register DSI pixel clock: %d\n", ret);
> Hi Raphael,

Hi Simon,

You are right,  dsi->clk needs to be disabled in case the clock register fails
before exiting the probe.

I've sent a v3, which normally fixes it.


Regards,

Raphaël

>
> Does clk_disable_unprepare(dsi->pclk) need to be added to this unwind
> chain?
>
> Flagged by Smatch.
>
>> +		goto err_dsi_probe;
>> +	}
>> +
>> +	clk_disable_unprepare(dsi->pclk);
>> +
>>  	return 0;
>>  
>>  err_dsi_probe:
> ...

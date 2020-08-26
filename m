Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8269F253E51
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222B66EB2A;
	Thu, 27 Aug 2020 06:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8588C6E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 11:57:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598443039; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=bvU5EuTDMO10h1QPRBMsNtvtAB/4x7+7OgYclbMQP6E=;
 b=Hvtcoi1yhLS4K2VRlZ/cWr6dUDcBIlMGH1doMBKBFwzN+pGotAqr+iTbXX9OuBQzaEKoL6IX
 1mmwQ4WldqZk/1lUuThDiX9hNq84BWqc7Er3j7VguKJKxg2oa2XP7j2ksZs4HjErnzxigX2U
 NWVCc1gpolmpZJHmyRlGKr5zOGQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f464e07e64cc21df8712995 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 26 Aug 2020 11:56:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 46964C433C6; Wed, 26 Aug 2020 11:56:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
 SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [47.8.163.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akashast)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1428AC433CB;
 Wed, 26 Aug 2020 11:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1428AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 2/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
To: Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
References: <20200820103522.26242-1-rojay@codeaurora.org>
 <20200820103522.26242-3-rojay@codeaurora.org>
From: Akash Asthana <akashast@codeaurora.org>
Message-ID: <ba1935d2-9fec-cf82-ed19-bc005befcb40@codeaurora.org>
Date: Wed, 26 Aug 2020 17:26:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820103522.26242-3-rojay@codeaurora.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:37 +0000
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
Cc: saiprakash.ranjan@codeaurora.org, rnayak@codeaurora.org,
 linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 linaro-mm-sig@lists.linaro.org, mka@chromium.org, agross@kernel.org,
 msavaliy@qti.qualcomm.com, bjorn.andersson@linaro.org, skakit@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Roja,

On 8/20/2020 4:05 PM, Roja Rani Yarubandi wrote:
> If the hardware is still accessing memory after SMMU translation
> is disabled (as part of smmu shutdown callback), then the
> IOVAs (I/O virtual address) which it was using will go on the bus
> as the physical addresses which will result in unknown crashes
> like NoC/interconnect errors.
>
> So, implement shutdown callback to i2c driver to unmap DMA mappings
> during system "reboot" or "shutdown".
>
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
> Changes in V2:
>   - As per Stephen's comments added seperate function for stop transfer,
>     fixed minor nitpicks.
>
>   drivers/i2c/busses/i2c-qcom-geni.c | 43 ++++++++++++++++++++++++++++++
>   include/linux/qcom-geni-se.h       |  5 ++++
>   2 files changed, 48 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 1fda5c7c2cfc..d07f2f33bb75 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -486,6 +486,28 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>   	return ret;
>   }
>   
> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
> +{
> +	u32 val;
> +	struct geni_se *se = &gi2c->se;
> +
> +	val = readl_relaxed(gi2c->se.base + SE_DMA_DEBUG_REG0);
> +	if (val & DMA_TX_ACTIVE) {
> +		geni_i2c_abort_xfer(gi2c);
> +		gi2c->cur_wr = 0;
> +		if (gi2c->err)
> +			geni_i2c_tx_fsm_rst(gi2c);
> +		geni_se_tx_dma_unprep(se, gi2c->tx_dma, gi2c->xfer_len);
> +	}
should be 'else if', because TX and RX can't happen parallel.
> +	if (val & DMA_RX_ACTIVE) {
> +		geni_i2c_abort_xfer(gi2c);
> +		gi2c->cur_rd = 0;
> +		if (gi2c->err)
> +			geni_i2c_rx_fsm_rst(gi2c);
> +		geni_se_rx_dma_unprep(se, gi2c->rx_dma, gi2c->xfer_len);
> +	}
> +}
> +
>   static u32 geni_i2c_func(struct i2c_adapter *adap)
>   {
>   	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> @@ -617,6 +639,26 @@ static int geni_i2c_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static void geni_i2c_shutdown(struct platform_device *pdev)
> +{
> +	int ret;
> +	u32 dma;
> +	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
> +	struct geni_se *se = &gi2c->se;
> +
> +	ret = pm_runtime_get_sync(gi2c->se.dev);
> +	if (ret < 0) {
> +		dev_err(gi2c->se.dev, "Failed to resume device: %d\n", ret);
> +		return;
> +	}
> +
> +	dma = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);

Wrt to current issue context it may be suffice to stop just DMA mode 
transfers but why not stop all mode of active transfer during shutdown 
in a generic way.

Regards,

Akash

> +	if (dma)
> +		geni_i2c_stop_xfer(gi2c);
> +
> +	pm_runtime_put_sync_suspend(gi2c->se.dev);
> +}
> +
>   static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>   {
>   	int ret;
> @@ -677,6 +719,7 @@ MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
>   static struct platform_driver geni_i2c_driver = {
>   	.probe  = geni_i2c_probe,
>   	.remove = geni_i2c_remove,
> +	.shutdown = geni_i2c_shutdown,
>   	.driver = {
>   		.name = "geni_i2c",
>   		.pm = &geni_i2c_pm_ops,
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index dd464943f717..c3c016496d98 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -77,6 +77,7 @@ struct geni_se {
>   #define SE_DMA_RX_FSM_RST		0xd58
>   #define SE_HW_PARAM_0			0xe24
>   #define SE_HW_PARAM_1			0xe28
> +#define SE_DMA_DEBUG_REG0		0xe40
>   
>   /* GENI_FORCE_DEFAULT_REG fields */
>   #define FORCE_DEFAULT	BIT(0)
> @@ -207,6 +208,10 @@ struct geni_se {
>   #define RX_GENI_CANCEL_IRQ		BIT(11)
>   #define RX_GENI_GP_IRQ_EXT		GENMASK(13, 12)
>   
> +/* SE_DMA_DEBUG_REG0 Register fields */
> +#define DMA_TX_ACTIVE			BIT(0)
> +#define DMA_RX_ACTIVE			BIT(1)
> +
>   /* SE_HW_PARAM_0 fields */
>   #define TX_FIFO_WIDTH_MSK		GENMASK(29, 24)
>   #define TX_FIFO_WIDTH_SHFT		24

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

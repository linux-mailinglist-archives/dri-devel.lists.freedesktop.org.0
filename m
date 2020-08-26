Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E1C253E6C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3ABD6EB39;
	Thu, 27 Aug 2020 06:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E029289F0A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 11:56:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598442970; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Bwhuv2Mg8XX7hTVE0N5W+Eqr1RkfhHeyhdfuGEzNN3U=;
 b=vM77LN92nPOETkIq0BJjsO2c1zlLty04l/z643PIT1RkPv7sxwmnE5suT/Lmx+2w9UmG2C7D
 3bNu2H+LOYmuk88aw+rQohpEqwgvkyEnaPOBQ02uP6ZDfBSEPeIiUM/GnzLVGuCit9vLKlin
 a8Jzx4dn1tDBFWXLDtKPsjqrngo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f464dd7222038607afe126d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 26 Aug 2020 11:56:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 89E51C433A0; Wed, 26 Aug 2020 11:56:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
 SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [47.8.163.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akashast)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4DC6EC433C6;
 Wed, 26 Aug 2020 11:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4DC6EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 1/2] i2c: i2c-qcom-geni: Store DMA mapping data in
 geni_i2c_dev struct
To: Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
References: <20200820103522.26242-1-rojay@codeaurora.org>
 <20200820103522.26242-2-rojay@codeaurora.org>
From: Akash Asthana <akashast@codeaurora.org>
Message-ID: <c09a6bb3-6a7d-bcf8-42ad-cc8dc971c705@codeaurora.org>
Date: Wed, 26 Aug 2020 17:25:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820103522.26242-2-rojay@codeaurora.org>
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
> Store DMA mapping data in geni_i2c_dev struct to enhance DMA mapping
> data scope. For example during shutdown callback to unmap DMA mapping,
> this stored DMA mapping data can be used to call geni_se_tx_dma_unprep
> and geni_se_rx_dma_unprep functions.
>
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
> Changes in V2:
>   - As per Stephen's comments, changed commit text, fixed minor nitpicks.
>
>   drivers/i2c/busses/i2c-qcom-geni.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 7f130829bf01..1fda5c7c2cfc 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -86,6 +86,9 @@ struct geni_i2c_dev {
>   	u32 clk_freq_out;
>   	const struct geni_i2c_clk_fld *clk_fld;
>   	int suspended;
> +	dma_addr_t tx_dma;
> +	dma_addr_t rx_dma;
> +	size_t xfer_len;
>   };
>   
>   struct geni_i2c_err_log {
> @@ -358,6 +361,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   	struct geni_se *se = &gi2c->se;
>   	size_t len = msg->len;
>   
> +	gi2c->xfer_len = msg->len;

nit: gi2c->xfer = len, for tx_one_msg as well.

Regards,

Akash

>   	if (!of_machine_is_compatible("lenovo,yoga-c630"))
>   		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>   
> @@ -384,6 +388,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   	if (dma_buf) {
>   		if (gi2c->err)
>   			geni_i2c_rx_fsm_rst(gi2c);
> +		gi2c->rx_dma = rx_dma;
>   		geni_se_rx_dma_unprep(se, rx_dma, len);
>   		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>   	}
> @@ -400,6 +405,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   	struct geni_se *se = &gi2c->se;
>   	size_t len = msg->len;
>   
> +	gi2c->xfer_len = msg->len;
>   	if (!of_machine_is_compatible("lenovo,yoga-c630"))
>   		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>   
> @@ -429,6 +435,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   	if (dma_buf) {
>   		if (gi2c->err)
>   			geni_i2c_tx_fsm_rst(gi2c);
> +		gi2c->tx_dma = tx_dma;
>   		geni_se_tx_dma_unprep(se, tx_dma, len);
>   		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>   	}

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

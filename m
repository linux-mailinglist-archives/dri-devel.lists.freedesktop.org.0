Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D3225FC0E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 16:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCE16E471;
	Mon,  7 Sep 2020 14:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Mon, 07 Sep 2020 12:56:09 UTC
Received: from a27-55.smtp-out.us-west-2.amazonses.com
 (a27-55.smtp-out.us-west-2.amazonses.com [54.240.27.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F170D89DD2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 12:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599483064;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 bh=ui1fKpiCptH0S6+EMGetZQ1ytRLWPuhfc4/2yA0rrYU=;
 b=A+8P+OKMmZFuiYvLDot5HncpSnUKwNlTaxbo4AyabIA8BVXuJcCfkVEJ7bYoGBcH
 aYqxykens8Rf2jUgcCxZsxK042WQ7n9a1mwwRi+9Z5gCi29iReVt2p4vfnatQyfInur
 Wi7tO8IlW9QkptHPykKM+bdO1gTlY6W4GvvA+Iqw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599483064;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
 bh=ui1fKpiCptH0S6+EMGetZQ1ytRLWPuhfc4/2yA0rrYU=;
 b=QWImFzFDCXk8Pjgk+yvmWW4ebwkEfCCK+6p/L+XDg7jJd/1HvOe5kiwbFoSVqw20
 rm/CH59ClbAy7t9rAOBXh/OHKW/5m/+fm9vhajvuemwURDyoiz/hglQFe79tciscr9U
 Wjy5IZcPlv+Ol6DEwzgMPz9fBXUuA0Qx0K6Y6+II=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Date: Mon, 7 Sep 2020 12:51:04 +0000
From: rojay@codeaurora.org
To: Akash Asthana <akashast@codeaurora.org>
Subject: Re: [PATCH V2 1/2] i2c: i2c-qcom-geni: Store DMA mapping data in
 geni_i2c_dev struct
In-Reply-To: <c09a6bb3-6a7d-bcf8-42ad-cc8dc971c705@codeaurora.org>
References: <20200820103522.26242-1-rojay@codeaurora.org>
 <20200820103522.26242-2-rojay@codeaurora.org>
 <c09a6bb3-6a7d-bcf8-42ad-cc8dc971c705@codeaurora.org>
Message-ID: <01010174689eaed3-e2a567ee-f3a4-4ddc-9a4b-681c4f016589-000000@us-west-2.amazonses.com>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.07-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Approved-At: Mon, 07 Sep 2020 14:29:05 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, saiprakash.ranjan@codeaurora.org,
 rnayak@codeaurora.org, linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, wsa@kernel.org,
 mka@chromium.org, agross@kernel.org, msavaliy@qti.qualcomm.com,
 bjorn.andersson@linaro.org, skakit@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-26 17:25, Akash Asthana wrote:
> Hi Roja,
> 
> On 8/20/2020 4:05 PM, Roja Rani Yarubandi wrote:
>> Store DMA mapping data in geni_i2c_dev struct to enhance DMA mapping
>> data scope. For example during shutdown callback to unmap DMA mapping,
>> this stored DMA mapping data can be used to call geni_se_tx_dma_unprep
>> and geni_se_rx_dma_unprep functions.
>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> ---
>> Changes in V2:
>>   - As per Stephen's comments, changed commit text, fixed minor 
>> nitpicks.
>> 
>>   drivers/i2c/busses/i2c-qcom-geni.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>> 
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 7f130829bf01..1fda5c7c2cfc 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -86,6 +86,9 @@ struct geni_i2c_dev {
>>   	u32 clk_freq_out;
>>   	const struct geni_i2c_clk_fld *clk_fld;
>>   	int suspended;
>> +	dma_addr_t tx_dma;
>> +	dma_addr_t rx_dma;
>> +	size_t xfer_len;
>>   };
>>     struct geni_i2c_err_log {
>> @@ -358,6 +361,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>   	struct geni_se *se = &gi2c->se;
>>   	size_t len = msg->len;
>>   +	gi2c->xfer_len = msg->len;
> 
> nit: gi2c->xfer = len, for tx_one_msg as well.
> 
> Regards,
> 
> Akash
> 

Okay

>>   	if (!of_machine_is_compatible("lenovo,yoga-c630"))
>>   		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>>   @@ -384,6 +388,7 @@ static int geni_i2c_rx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   	if (dma_buf) {
>>   		if (gi2c->err)
>>   			geni_i2c_rx_fsm_rst(gi2c);
>> +		gi2c->rx_dma = rx_dma;
>>   		geni_se_rx_dma_unprep(se, rx_dma, len);
>>   		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>>   	}
>> @@ -400,6 +405,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>   	struct geni_se *se = &gi2c->se;
>>   	size_t len = msg->len;
>>   +	gi2c->xfer_len = msg->len;
>>   	if (!of_machine_is_compatible("lenovo,yoga-c630"))
>>   		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>>   @@ -429,6 +435,7 @@ static int geni_i2c_tx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   	if (dma_buf) {
>>   		if (gi2c->err)
>>   			geni_i2c_tx_fsm_rst(gi2c);
>> +		gi2c->tx_dma = tx_dma;
>>   		geni_se_tx_dma_unprep(se, tx_dma, len);
>>   		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>>   	}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

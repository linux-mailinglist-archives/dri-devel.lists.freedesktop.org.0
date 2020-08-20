Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9813024CEAB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E246EAA3;
	Fri, 21 Aug 2020 07:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6458A6E931
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 10:30:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597919408; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=km9nW3C7eCummePhEdybTk2b7eYw/T0nXcPSw02yQc8=;
 b=CYYTgQHtn0zDTtp/s3lkPm4kggu6CiEXjXjynTlMStVguG8/dngr4lhwAW2zxyJ+oKRm1xhh
 c6aDMhr8LMFIuEFoQFGc+9a/frdP8BuuogfcMtS+aLSxcHkVQ7sGKrR9Ld3/s/rdhdIOoqP0
 6pIithjnpU46TlduVp+aCGSmX2A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f3e50a4f729de10780a785c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 Aug 2020 10:29:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 32768C433A1; Thu, 20 Aug 2020 10:29:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rojay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 099F2C433CA;
 Thu, 20 Aug 2020 10:29:55 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 20 Aug 2020 15:59:54 +0530
From: rojay@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] i2c: i2c-qcom-geni: Add tx_dma, rx_dma and xfer_len
 to geni_i2c_dev struct
In-Reply-To: <159780835380.334488.10270114810481187992@swboyd.mtv.corp.google.com>
References: <20200814095540.32115-1-rojay@codeaurora.org>
 <20200814095540.32115-2-rojay@codeaurora.org>
 <159780835380.334488.10270114810481187992@swboyd.mtv.corp.google.com>
Message-ID: <872641764c4a03b92c8f2dafe6f2764a@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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
Cc: akashast@codeaurora.org, saiprakash.ranjan@codeaurora.org,
 rnayak@codeaurora.org, gregkh@linuxfoundation.org,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, wsa@kernel.org,
 linaro-mm-sig@lists.linaro.org, mka@chromium.org, agross@kernel.org,
 msavaliy@qti.qualcomm.com, linux-media@vger.kernel.org, skakit@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

Thanks for reviewing the patches.

On 2020-08-19 09:09, Stephen Boyd wrote:
> Quoting Roja Rani Yarubandi (2020-08-14 02:55:39)
>> Adding tx_dma, rx_dma and xfer length in geni_i2c_dev struct to
>> store DMA mapping data to enhance its scope. For example during
>> shutdown callback to unmap DMA mapping, these new struct members
>> can be used as part of geni_se_tx_dma_unprep and
>> geni_se_rx_dma_unprep calls.
> 
> Please read about how to write commit text from kernel docs[1]. Hint,
> use imperative mood.
> 

Ok, will update the commit text.

>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> ---
>>  drivers/i2c/busses/i2c-qcom-geni.c | 23 +++++++++++++----------
>>  1 file changed, 13 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 7f130829bf01..53ca41f76080 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -86,6 +86,9 @@ struct geni_i2c_dev {
>>         u32 clk_freq_out;
>>         const struct geni_i2c_clk_fld *clk_fld;
>>         int suspended;
>> +       dma_addr_t tx_dma;
>> +       dma_addr_t rx_dma;
>> +       u32 xfer_len;
> 
> Why not size_t?
> 

Will change it to size_t.

>>  };
>> 
>>  struct geni_i2c_err_log {
>> @@ -352,12 +355,11 @@ static void geni_i2c_tx_fsm_rst(struct 
>> geni_i2c_dev *gi2c)
>>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct 
>> i2c_msg *msg,
>>                                 u32 m_param)
>>  {
>> -       dma_addr_t rx_dma;
>>         unsigned long time_left;
>>         void *dma_buf = NULL;
>>         struct geni_se *se = &gi2c->se;
>> -       size_t len = msg->len;
>> 
>> +       gi2c->xfer_len = msg->len;
> 
> I'd prefer to keep the local variable and then have
> 
> 	len = gi2c->xfer_len = msg->len;
> 

Ok, will keep the local variable.

>>         if (!of_machine_is_compatible("lenovo,yoga-c630"))
>>                 dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>> 
>> @@ -366,9 +368,10 @@ static int geni_i2c_rx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>         else
>>                 geni_se_select_mode(se, GENI_SE_FIFO);
>> 
>> -       writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
>> +       writel_relaxed(gi2c->xfer_len, se->base + 
>> SE_I2C_RX_TRANS_LEN);
> 
> So that all this doesn't have to change.
> 
>> 
>> -       if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) 
>> {
>> +       if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, 
>> gi2c->xfer_len,
>> +                                          &gi2c->rx_dma)) {
>>                 geni_se_select_mode(se, GENI_SE_FIFO);
>>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>>                 dma_buf = NULL;
>> @@ -384,7 +387,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>         if (dma_buf) {
>>                 if (gi2c->err)
>>                         geni_i2c_rx_fsm_rst(gi2c);
>> -               geni_se_rx_dma_unprep(se, rx_dma, len);
>> +               geni_se_rx_dma_unprep(se, gi2c->rx_dma, 
>> gi2c->xfer_len);
>>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>>         }
>> 
>> @@ -394,12 +397,11 @@ static int geni_i2c_rx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>  static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct 
>> i2c_msg *msg,
>>                                 u32 m_param)
>>  {
>> -       dma_addr_t tx_dma;
>>         unsigned long time_left;
>>         void *dma_buf = NULL;
>>         struct geni_se *se = &gi2c->se;
>> -       size_t len = msg->len;
>> 
>> +       gi2c->xfer_len = msg->len;
> 
> Same comment.
> 

Ok.

>>         if (!of_machine_is_compatible("lenovo,yoga-c630"))
>>                 dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>> 
> 
> [1]
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

Thanks,
Roja
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

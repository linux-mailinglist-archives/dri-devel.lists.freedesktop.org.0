Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF025664E
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CDD6EBFF;
	Sat, 29 Aug 2020 09:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A496E49D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 11:47:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598615255; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=UyfPYUcMV9tytg1lsOazXlR2oJ0XqslTZInHmF+wz2o=;
 b=ogkiry6pJPSJWBn52pfWhOQ0d/Sl83RIpEaazGqqK6DthuioQxEPWQ43F8ECv52x+IxEdo7m
 0kRdOvHCE1n0/R+woFCew2v/4SORWcyrEQ1Ppgb+McdQB0nfzQof070jo6N704/bRhO6A7YW
 NmGdY+oqurnK/bVJBRG4ka2sjI0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f48ee8091574590bfa61803 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 Aug 2020 11:46:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C9E10C43391; Fri, 28 Aug 2020 11:46:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rojay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 47EAAC43387;
 Fri, 28 Aug 2020 11:46:08 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 28 Aug 2020 17:16:08 +0530
From: rojay@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH V2 2/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
In-Reply-To: <159796935923.334488.7479152222902825306@swboyd.mtv.corp.google.com>
References: <20200820103522.26242-1-rojay@codeaurora.org>
 <20200820103522.26242-3-rojay@codeaurora.org>
 <159796935923.334488.7479152222902825306@swboyd.mtv.corp.google.com>
Message-ID: <a5060091729429366465b205592aad2d@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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

On 2020-08-21 05:52, Stephen Boyd wrote:
> Quoting Roja Rani Yarubandi (2020-08-20 03:35:22)
>> If the hardware is still accessing memory after SMMU translation
>> is disabled (as part of smmu shutdown callback), then the
>> IOVAs (I/O virtual address) which it was using will go on the bus
>> as the physical addresses which will result in unknown crashes
>> like NoC/interconnect errors.
>> 
>> So, implement shutdown callback to i2c driver to unmap DMA mappings
>> during system "reboot" or "shutdown".
>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> ---
> 
> I'd still put a Fixes tag because it's fixing the driver when someone
> runs shutdown.
> 

Okay, will add fixes tag.

>> Changes in V2:
>>  - As per Stephen's comments added seperate function for stop 
>> transfer,
>>    fixed minor nitpicks.
>> 
>>  drivers/i2c/busses/i2c-qcom-geni.c | 43 
>> ++++++++++++++++++++++++++++++
>>  include/linux/qcom-geni-se.h       |  5 ++++
>>  2 files changed, 48 insertions(+)
>> 
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 1fda5c7c2cfc..d07f2f33bb75 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -486,6 +486,28 @@ static int geni_i2c_xfer(struct i2c_adapter 
>> *adap,
>>         return ret;
>>  }
>> 
>> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
>> +{
>> +       u32 val;
>> +       struct geni_se *se = &gi2c->se;
>> +
>> +       val = readl_relaxed(gi2c->se.base + SE_DMA_DEBUG_REG0);
>> +       if (val & DMA_TX_ACTIVE) {
>> +               geni_i2c_abort_xfer(gi2c);
>> +               gi2c->cur_wr = 0;
>> +               if (gi2c->err)
>> +                       geni_i2c_tx_fsm_rst(gi2c);
>> +               geni_se_tx_dma_unprep(se, gi2c->tx_dma, 
>> gi2c->xfer_len);
>> +       }
>> +       if (val & DMA_RX_ACTIVE) {
>> +               geni_i2c_abort_xfer(gi2c);
>> +               gi2c->cur_rd = 0;
>> +               if (gi2c->err)
>> +                       geni_i2c_rx_fsm_rst(gi2c);
>> +               geni_se_rx_dma_unprep(se, gi2c->rx_dma, 
>> gi2c->xfer_len);
>> +       }
>> +}
>> +
>>  static u32 geni_i2c_func(struct i2c_adapter *adap)
>>  {
>>         return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & 
>> ~I2C_FUNC_SMBUS_QUICK);
>> @@ -617,6 +639,26 @@ static int geni_i2c_remove(struct platform_device 
>> *pdev)
>>         return 0;
>>  }
>> 
>> +static void geni_i2c_shutdown(struct platform_device *pdev)
>> +{
>> +       int ret;
>> +       u32 dma;
>> +       struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
>> +       struct geni_se *se = &gi2c->se;
>> +
>> +       ret = pm_runtime_get_sync(gi2c->se.dev);
>> +       if (ret < 0) {
>> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n", 
>> ret);
>> +               return;
>> +       }
>> +
>> +       dma = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
>> +       if (dma)
>> +               geni_i2c_stop_xfer(gi2c);
> 
> Any reason the if (dma) check isn't inside geni_i2c_stop_xfer()?
> Checking for dma and then bailing out early should work and keep the
> logic in one function. Then the pm_runtime_sync() call could go in 
> there
> too and if (!dma) goto out. This assumes that we're going to call
> geni_i2c_stop_xfer() from somewhere else, like if a transfer times out
> or something?
> 

Okay, will do the changes.

>> +
>> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
>> +}
>> +
>>  static int __maybe_unused geni_i2c_runtime_suspend(struct device 
>> *dev)
>>  {
>>         int ret;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

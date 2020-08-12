Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B47242630
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 09:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E2F6E8C3;
	Wed, 12 Aug 2020 07:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2766E8C3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 07:39:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597218001; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=2L3L1433xPSIuFOwgxbwV9jFqwSQQyfGabN9mWsVC/c=;
 b=uw7DSzzw+JqBwVnHUSKorAceZ07Nl0o8DR8zAgm1EgzqaKPgrFouHQ9LZEBsz4GiF0DrUPYu
 c3UxX7KTjNxTuepqh/12iQhpbvtVCruFaJskBQ2bOp5TyOSGIOi+QbNvVvsqS9aXpzV3a3U8
 3y41pjq25Ceh39AMmOYYTgqHNFI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5f339cca2f4952907d925b07 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Aug 2020 07:39:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E78E5C433C9; Wed, 12 Aug 2020 07:39:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
 SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.15] (unknown [61.1.229.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rnayak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DD3D9C433CA;
 Wed, 12 Aug 2020 07:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DD3D9C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [RFC v2 03/11] tty: serial: qcom_geni_serial: Use OPP API to set
 clk/perf state
To: Amit Pundir <amit.pundir@linaro.org>
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-4-rnayak@codeaurora.org>
 <CALAqxLV2TBk9ScUM6MeJMCkL8kJnCihjQ7ac5fLzcqOg1rREVQ@mail.gmail.com>
 <CALAqxLWg3jJKJFLnnne-mrQEnH=m7R_9azCGaGnEmFYR4EMh=A@mail.gmail.com>
 <ec5eeb21-48e4-5dcc-583a-ac9419659e44@codeaurora.org>
 <CAMi1Hd1O+3bjQN6c9WQr+t0YXGBAukfFzJWtkgXDp1Zcir-0-w@mail.gmail.com>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <aab760b8-2a06-ae96-584a-301d5326fc0d@codeaurora.org>
Date: Wed, 12 Aug 2020 13:09:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAMi1Hd1O+3bjQN6c9WQr+t0YXGBAukfFzJWtkgXDp1Zcir-0-w@mail.gmail.com>
Content-Language: en-US
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-scsi@vger.kernel.org,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, linux-serial@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-spi@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/12/2020 1:05 PM, Amit Pundir wrote:
> Hi Rajendra,
> 
> On Wed, 12 Aug 2020 at 11:18, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>>
>> On 8/12/2020 7:03 AM, John Stultz wrote:
>>> On Tue, Aug 11, 2020 at 4:11 PM John Stultz <john.stultz@linaro.org> wrote:
>>>>
>>>> On Wed, Mar 20, 2019 at 2:49 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>>>>
>>>>> geni serial needs to express a perforamnce state requirement on CX
>>>>> depending on the frequency of the clock rates. Use OPP table from
>>>>> DT to register with OPP framework and use dev_pm_opp_set_rate() to
>>>>> set the clk/perf state.
>>>>>
>>>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>>>> ---
>>>>>    drivers/tty/serial/qcom_geni_serial.c | 15 +++++++++++++--
>>>>>    1 file changed, 13 insertions(+), 2 deletions(-)
>>>>>
>>>>
>>>> Hey,
>>>>     I just wanted to follow up on this patch, as I've bisected it
>>>> (a5819b548af0) down as having broken qca bluetooth on the Dragonboard
>>>> 845c.
>>>>
>>>> I haven't yet had time to debug it yet, but wanted to raise the issue
>>>> in case anyone else has seen similar trouble.
>>>
>>> So I dug in a bit further, and this chunk seems to be causing the issue:
>>>> @@ -961,7 +963,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>>>>                   goto out_restart_rx;
>>>>
>>>>           uport->uartclk = clk_rate;
>>>> -       clk_set_rate(port->se.clk, clk_rate);
>>>> +       dev_pm_opp_set_rate(port->dev, clk_rate);
>>>>           ser_clk_cfg = SER_CLK_EN;
>>>>           ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>>>>
>>>
>>>
>>> With that applied, I see the following errors in dmesg and bluetooth
>>> fails to function:
>>> [    4.763467] qcom_geni_serial 898000.serial: dev_pm_opp_set_rate:
>>> failed to find OPP for freq 102400000 (-34)
>>> [    4.773493] qcom_geni_serial 898000.serial: dev_pm_opp_set_rate:
>>> failed to find OPP for freq 102400000 (-34)
>>>
>>> With just that chunk reverted on linus/HEAD, bluetooth seems to work ok.
>>
>> This seems like the same issue that was also reported on venus [1] because the
>> clock frequency tables apparently don;t exactly match the achievable clock
>> frequencies (which we also used to construct the OPP tables)
>>
>> Can you try updating the OPP table for QUP to have 102400000 instead of the
>> current 100000000 and see if that fixes it?
> 
> That worked. Thanks.
> 
> Should this change be common to base sdm845.dtsi or platform specific dts?
> For what it's worth, we see this BT breakage on PocoF1 phone too.

Thanks for confirming, it will have to be part of the SoC dtsi, and I am
guessing a similar change is perhaps also needed on sc7180.
I will send a patch out to fix the OPP tables for both.

> 
> Regards,
> Amit Pundir
> 
> 
>>
>> [1] https://lkml.org/lkml/2020/7/27/507
>>
>>>
>>> thanks
>>> -john
>>>
>>
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

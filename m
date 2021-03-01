Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D51103279A2
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 09:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059316E516;
	Mon,  1 Mar 2021 08:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EA86E513
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 08:45:31 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614588333; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Cey4WVl7LtaCP6MJNq4HJn9FVmHktZGEEAE5nLQ/M8A=;
 b=vNmiO5t364z3sZ+/TXVl/UROFXqsFgKMwQaROu4rx+AI75/TeQ4WnrXrUBQw4SC9cxE1QeJA
 le5P7V6x/ypsvsp+LRHirIAirkRL9+rXoqPt91LcLELoWJso4/AbnugOqPVqygIEMU6jBNvY
 54yKp48IJjHEwnaQxwOwhrP8U3A=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 603ca99a16ba7452019ff3df (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 08:45:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B2EA7C433CA; Mon,  1 Mar 2021 08:45:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EA03EC43462;
 Mon,  1 Mar 2021 08:45:12 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 01 Mar 2021 14:15:12 +0530
From: kgunda@codeaurora.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH V2 2/2] backlight: qcom-wled: Correct the sync_toggle
 sequence
In-Reply-To: <20210226172601.aknj2d4hghkkqjol@maple.lan>
References: <1614341544-5306-1-git-send-email-kgunda@codeaurora.org>
 <1614341544-5306-3-git-send-email-kgunda@codeaurora.org>
 <20210226172601.aknj2d4hghkkqjol@maple.lan>
Message-ID: <0cca377c2a7648c5f1606e38ba1b7d4d@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 lee.jones@linaro.org, linux-leds@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-02-26 22:56, Daniel Thompson wrote:
> On Fri, Feb 26, 2021 at 05:42:24PM +0530, Kiran Gunda wrote:
>> As per the current implementation, after FSC (Full Scale Current)
>> and brightness update the sync bits are transitioned from 1 to 0.
> 
> This still seems to incorrectly describe the current behaviour.
> 
> Surely in most cases (i.e. every time except the first) the value of 
> the
> sync bit is 0 when the function is called and we get both a 0 to 1
> and then a 1 to 0 transition.
> 
> That is why I recommended set-then-clear terminology to describe the
> current behaviour. It is concise and correct.
> 
> 
> Daniel.
> 
> 
> 
Okay. Actually I have mentioned the "clear-and-set" in explaining the 
fix.
Let me modify the same terminology in explaining the problem case also.

>> But, the FSC and brightness sync takes place during a 0 to 1
>> transition of the sync bits. So the hardware team recommends a
>> clear-then-set approach in order to guarantee such a transition
>> regardless of the previous register state.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> ---
>>  drivers/video/backlight/qcom-wled.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/video/backlight/qcom-wled.c 
>> b/drivers/video/backlight/qcom-wled.c
>> index aef52b9..19f83ac 100644
>> --- a/drivers/video/backlight/qcom-wled.c
>> +++ b/drivers/video/backlight/qcom-wled.c
>> @@ -337,13 +337,13 @@ static int wled3_sync_toggle(struct wled *wled)
>> 
>>  	rc = regmap_update_bits(wled->regmap,
>>  				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
>> -				mask, mask);
>> +				mask, WLED3_SINK_REG_SYNC_CLEAR);
>>  	if (rc < 0)
>>  		return rc;
>> 
>>  	rc = regmap_update_bits(wled->regmap,
>>  				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
>> -				mask, WLED3_SINK_REG_SYNC_CLEAR);
>> +				mask, mask);
>> 
>>  	return rc;
>>  }
>> @@ -353,17 +353,17 @@ static int wled5_mod_sync_toggle(struct wled 
>> *wled)
>>  	int rc;
>>  	u8 val;
>> 
>> -	val = (wled->cfg.mod_sel == MOD_A) ? WLED5_SINK_REG_SYNC_MOD_A_BIT :
>> -					     WLED5_SINK_REG_SYNC_MOD_B_BIT;
>>  	rc = regmap_update_bits(wled->regmap,
>>  				wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
>> -				WLED5_SINK_REG_SYNC_MASK, val);
>> +				WLED5_SINK_REG_SYNC_MASK, 0);
>>  	if (rc < 0)
>>  		return rc;
>> 
>> +	val = (wled->cfg.mod_sel == MOD_A) ? WLED5_SINK_REG_SYNC_MOD_A_BIT :
>> +					     WLED5_SINK_REG_SYNC_MOD_B_BIT;
>>  	return regmap_update_bits(wled->regmap,
>>  				  wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
>> -				  WLED5_SINK_REG_SYNC_MASK, 0);
>> +				  WLED5_SINK_REG_SYNC_MASK, val);
>>  }
>> 
>>  static int wled_ovp_fault_status(struct wled *wled, bool *fault_set)
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>>  a Linux Foundation Collaborative Project
>> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

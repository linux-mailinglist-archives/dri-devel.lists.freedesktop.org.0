Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E04325D9E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 07:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2FA6E8F4;
	Fri, 26 Feb 2021 06:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0442B6E8F4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 06:40:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614321659; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=QGZVSyhl+UTYEZKQcx1TjnWHZZiS7iYEtl3Q3+3S5z8=;
 b=mVg7EWm4iYiwerDYlsfCfPJ/gk5boZzRFqv3i2xmvXmMMPYq+20CWvu2VS6r/hRhL75AANh3
 LuZXIkavPsiRcE/RbqHtyUwIBiPyV8POVypoK0j75ZQVlax0F8EwNtuf3vPiYvv/RY4ANyLB
 9VACNCNn9d1L0tCmj7WEJ8lMqgs=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 603897f6cc1f7d7e952e8a52 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 06:40:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0B250C43461; Fri, 26 Feb 2021 06:40:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0F68FC433CA;
 Fri, 26 Feb 2021 06:40:52 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 26 Feb 2021 12:10:52 +0530
From: kgunda@codeaurora.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH V1 2/2] backlight: qcom-wled: Correct the sync_toggle
 sequence
In-Reply-To: <20210224112632.lgm2yj6ekayuqg2p@maple.lan>
References: <1614138648-2963-1-git-send-email-kgunda@codeaurora.org>
 <1614138648-2963-3-git-send-email-kgunda@codeaurora.org>
 <20210224112632.lgm2yj6ekayuqg2p@maple.lan>
Message-ID: <427d82a0baa7ec1c3232469e81daa9a0@codeaurora.org>
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

On 2021-02-24 16:56, Daniel Thompson wrote:
> On Wed, Feb 24, 2021 at 09:20:48AM +0530, Kiran Gunda wrote:
>> Currently the FSC SYNC_BIT and MOD_SYNC_BIT are toggled
>> from 1 to 0 to update the FSC and brightenss settings.
>> Change this sequence form 0 to 1 as per the hardware team
>> recommendation to update the FSC and brightness correctly.
> 
> Again... this patch description feels somewhat rushed. A patch
> description is there to support code reviewer and to go on the version
> history to assist with future maintainance. They matter!
> 
> Anyhow I don't recognise the "from 1 to 0" in the code since both 
> before
> an after the change it goes "from 0 to 1" and "from 1 to 0" but in a
> different order. Doesn't the code actually currently implement "set 
> then
> clear"? If so then, likewise the new code is adopting "clear then set".
> 
I would have used "set" and "clear" instead of "0" and "1".
Yes. The current code implementation is "set" all SYN bits and then 
"clear"
all SYNC bits. The new code is modified to change the sequence from 
"clear"
first and then "set" to ensure both FSC and brightness are updated.

> As with patch 1, the sync bits modified by wled3_sync_toggle singular
> or plural?
It is plural. We have to "clear" and "set" all sync bits.
> 
> Finally a description that is more sympathetic to the reviewer would be
> welcome.  For example the following (if my guess is right and it is
> true) makes things much easier for the reviewer:
> Sure. I will update the documentation and patch description clearly.
>   "The sync takes place during a 0 to 1 transition of the sync
>   bits so the hardware team recommends a clear-then-set approach in
>   order to guarantee such a transition regardless of the previous
>   register state".
> 
> 
> Daniel.
> 
> 
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

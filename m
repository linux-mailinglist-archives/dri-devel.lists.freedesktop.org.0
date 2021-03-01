Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30E3328494
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 17:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502196E81B;
	Mon,  1 Mar 2021 16:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-2.mailgun.net (m42-2.mailgun.net [69.72.42.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6985B6E81B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 16:42:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614616947; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WRPpZ9qj4Um6MCvFHhN5ctHaT2j5wddCNIfkDkOakl8=;
 b=hXwL9VrE7JxkEdsy5WEYwKgTmtHhqBcjGx5cbBEAFHosAqwLInHpVqDPUiVY/UWj0gC3hDFT
 I7VYXE2Blwp3W5fTkN7PECgAkrKOQKOdKCUpc8XL1ZYYwaN1Rn0ph5SqtrCWdYbPsWtqLtMD
 UDP8MjgtfuSpLynPt7J5/5Xdt84=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 603d196f12935cdcee423f33 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 16:42:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DBB41C43463; Mon,  1 Mar 2021 16:42:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E6927C433C6;
 Mon,  1 Mar 2021 16:42:21 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 01 Mar 2021 22:12:21 +0530
From: kgunda@codeaurora.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH V3 2/2] backlight: qcom-wled: Correct the sync_toggle
 sequence
In-Reply-To: <20210301100239.orbt7km6lgjwvzii@maple.lan>
References: <1614590916-27070-1-git-send-email-kgunda@codeaurora.org>
 <1614590916-27070-3-git-send-email-kgunda@codeaurora.org>
 <20210301100239.orbt7km6lgjwvzii@maple.lan>
Message-ID: <f25a2c8b1bf0eae63a2fe9a31c824f1e@codeaurora.org>
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

On 2021-03-01 15:32, Daniel Thompson wrote:
> On Mon, Mar 01, 2021 at 02:58:36PM +0530, Kiran Gunda wrote:
>> As per the current implementation, after FSC (Full Scale Current)
>> and brightness update the sync bits are transitioned from 
>> set-then-clear.
> 
> This does not makes sense since there are too many verbs. Set and clear
> are both verbs so in this context: "the code will set the bit and then
> the code will clear the bit".
> 
> Either:
> 
> s/transitioned from set-then-clear/set-then-cleared/.
> 
> Or:
> 
> s/transitioned from set-then-clear/using a set-then-clear approach/.
> 
>> But, the FSC and brightness sync takes place during a clear-then-set
>> transition of the sync bits.
> 
> Likewise this no longer makes sense and had also become misleading.
> Two changes of state, clear and then set, do not usually result in a
> single transition.
> 
> Either:
> 
> s/clear-then-set/0 to 1/
> 
> Alternatively, if you want to stick exclusively to the set/clear
> terminology then replace the whole quoted section with:
> 
>   But, the FSC and brightness sync takes place when the sync bits are
>   set (e.g. on a rising edge).
> 
> 
>> So the hardware team recommends a
>> clear-then-set approach in order to guarantee such a transition
>> regardless of the previous register state.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> 
> With one of each of the changes proposed above:
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> 
> Daniel.
> 
Apologies for the mistake. I have corrected and submitted the
V4 series with the "reviewed-by" tag.
> 
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

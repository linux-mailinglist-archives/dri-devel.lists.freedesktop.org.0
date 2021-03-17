Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A592433E834
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 05:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D2C89B0B;
	Wed, 17 Mar 2021 04:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-10.mailgun.net (m42-10.mailgun.net [69.72.42.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05C989B0B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 04:00:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615953645; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JzDLSu+qwz6G/WNOU91LdfXeIczEE/TTUZtA6eKrw7E=;
 b=hgmIOG/xLBq9tQsNtt2YM9CIspI/IyXlwupwFF74Hxe6c7XFstSQjkY8bQgN/hV34m56wBcl
 IUz4rhw7m8A1UrbHj5n5d4kuQKburgNuZPJuJ4cJYtd3G7K+u2AWnkBlCkGuCYHARkb48doF
 u7vShOiiu4PGljCkgGbgqVZFB+g=
X-Mailgun-Sending-Ip: 69.72.42.10
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60517ee05d70193f88bb7c17 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Mar 2021 04:00:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C2602C43467; Wed, 17 Mar 2021 04:00:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 77AE5C433CA;
 Wed, 17 Mar 2021 04:00:28 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 17 Mar 2021 09:30:28 +0530
From: kgunda@codeaurora.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] backlight: qcom-wled: Use sink_addr for sync toggle
In-Reply-To: <20210315122158.ptqi6xvngf6ihjum@maple.lan>
References: <20210314101110.48024-1-marijn.suijten@somainline.org>
 <20210315122158.ptqi6xvngf6ihjum@maple.lan>
Message-ID: <347b2f4efa08e051ed764b22e5dc98a2@codeaurora.org>
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
Cc: linux-fbdev@vger.kernel.org, Obeida Shamoun <oshmoun100@googlemail.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-03-15 17:51, Daniel Thompson wrote:
> On Sun, Mar 14, 2021 at 11:11:10AM +0100, Marijn Suijten wrote:
>> From: Obeida Shamoun <oshmoun100@googlemail.com>
>> 
>> WLED3_SINK_REG_SYNC is, as the name implies, a sink register offset.
>> Therefore, use the sink address as base instead of the ctrl address.
>> 
>> This fixes the sync toggle on wled4, which can be observed by the fact
>> that adjusting brightness now works.
>> 
>> It has no effect on wled3 because sink and ctrl base addresses are the
>> same.  This allows adjusting the brightness without having to disable
>> then reenable the module.
>> 
>> Signed-off-by: Obeida Shamoun <oshmoun100@googlemail.com>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> LGTM, although an acked-by from Kiran would be nice to have:
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> 
> Daniel.
> 
> 
Acked-by: Kiran Gunda <kgunda@codeaurora.org>

>> ---
>>  drivers/video/backlight/qcom-wled.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/video/backlight/qcom-wled.c 
>> b/drivers/video/backlight/qcom-wled.c
>> index 091f07e7c145..fc8b443d10fd 100644
>> --- a/drivers/video/backlight/qcom-wled.c
>> +++ b/drivers/video/backlight/qcom-wled.c
>> @@ -336,13 +336,13 @@ static int wled3_sync_toggle(struct wled *wled)
>>  	unsigned int mask = GENMASK(wled->max_string_count - 1, 0);
>> 
>>  	rc = regmap_update_bits(wled->regmap,
>> -				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
>> +				wled->sink_addr + WLED3_SINK_REG_SYNC,
>>  				mask, mask);
>>  	if (rc < 0)
>>  		return rc;
>> 
>>  	rc = regmap_update_bits(wled->regmap,
>> -				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
>> +				wled->sink_addr + WLED3_SINK_REG_SYNC,
>>  				mask, WLED3_SINK_REG_SYNC_CLEAR);
>> 
>>  	return rc;
>> --
>> 2.30.2
>> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1843C1B4E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 00:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D336E90C;
	Thu,  8 Jul 2021 22:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0CB6E90C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 22:00:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625781611; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=foQZWcxZgegObXgHqgBDEXunbwEGNs+mS0D1mjRzN8g=;
 b=Wgn8SmMf5+HCadXNYkuBx5r9xMGq/UGCkiP/XFxZvfl7rA8Cefw7PrjZOgLeiMW6B7Vp1Aui
 nHxnhpiZHrgqkE309efsPPHw3Wr5dzN2QuFI/g4rpka/w5nQAtpiAjkFTfOYU27kDGeV1LYZ
 OLGAWG7/DIv6H2M59zU38k1TZio=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60e7755b5e3e57240b89cc97 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Jul 2021 21:59:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2BC10C43144; Thu,  8 Jul 2021 21:59:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 44FB3C433D3;
 Thu,  8 Jul 2021 21:59:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 08 Jul 2021 14:59:53 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 3/7] drm/msm/dp: reset aux controller after
 dp_aux_cmd_fifo_tx() failed.
In-Reply-To: <CAE-0n53JxLuQZBUMLOuH_Bm7zQ7Vite2OhjTB_xO=s_KAGarXw@mail.gmail.com>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-4-git-send-email-khsieh@codeaurora.org>
 <CAE-0n53JxLuQZBUMLOuH_Bm7zQ7Vite2OhjTB_xO=s_KAGarXw@mail.gmail.com>
Message-ID: <a5bb5f6bf7defa9c9bbf7d1fde87ca49@codeaurora.org>
X-Sender: khsieh@codeaurora.org
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, bjorn.andersson@linaro.org,
 dri-devel@lists.freedesktop.org, aravindh@codeaurora.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-08 00:34, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-07-06 10:20:16)
>> Aux hardware calibration sequence requires resetting the aux 
>> controller
>> in order for the new setting to take effect. However resetting the AUX
>> controller will also clear HPD interrupt status which may accidentally
>> cause pending unplug interrupt to get lost. Therefore reset aux
>> controller only when link is in connection state when 
>> dp_aux_cmd_fifo_tx()
>> fail. This fixes Link Layer CTS cases 4.2.1.1 and 4.2.1.2.
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_aux.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c 
>> b/drivers/gpu/drm/msm/dp/dp_aux.c
>> index 4a3293b..eb40d84 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
>> @@ -353,6 +353,9 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
>> *dp_aux,
>>                         if (!(aux->retry_cnt % MAX_AUX_RETRIES))
>>                                 
>> dp_catalog_aux_update_cfg(aux->catalog);
>>                 }
>> +               /* reset aux if link is in connected state */
>> +               if (dp_catalog_link_is_connected(aux->catalog))
> 
> How do we avoid resetting aux when hpd is unplugged and then plugged
> back in during an aux transfer?
i am not sure this is possible.
it should get unplug interrupt followed by plugin interrupt.
In this case, aux will be re set and initialized
> 
>> +                       dp_catalog_aux_reset(aux->catalog);
>>         } else {
>>                 aux->retry_cnt = 0;
>>                 switch (aux->aux_error_num) {
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369931FD4C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 17:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5D06EB73;
	Fri, 19 Feb 2021 16:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B24A6E060
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 16:39:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613752790; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=bGYuBowdCAf1ux6PDCOPxHG/ip7+T+wrGkBIdOPIiaM=;
 b=FsiE3pfYXy94eKqDV2covxdXyzvcLXRwxniJjMOmDB8jTsJBN3W7e+tagkMahZClXV7hG8/f
 XQpvHMQbsiHCGa+RGEOLnDJo4aZO4QzrFnjBSxGBWU4wwlaG+Fzl9QLrtBUJhy9Zmi7oblBo
 SwyRK301ITNa2LSS5D9gCeYP/W8=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 602fe9cb7237f827dce4a275 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Feb 2021 16:39:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 39DAFC43463; Fri, 19 Feb 2021 16:39:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 89D79C433CA;
 Fri, 19 Feb 2021 16:39:38 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 19 Feb 2021 08:39:38 -0800
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/msm/dp: add supported max link rate specified
 from dtsi
In-Reply-To: <161368935031.1254594.14384765673800900954@swboyd.mtv.corp.google.com>
References: <1613681704-12539-1-git-send-email-khsieh@codeaurora.org>
 <161368935031.1254594.14384765673800900954@swboyd.mtv.corp.google.com>
Message-ID: <7af07dcacd5b68087cc61e467e9c57ea@codeaurora.org>
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-02-18 15:02, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-02-18 12:55:04)
>> Allow supported link rate to be limited to the value specified at
>> dtsi. If it is not specified, then link rate is derived from dpcd
>> directly. Below are examples,
>> link-rate = <162000> for max link rate limited at 1.62G
>> link-rate = <270000> for max link rate limited at 2.7G
>> link-rate = <540000> for max link rate limited at 5.4G
>> link-rate = <810000> for max link rate limited at 8.1G
>> 
>> Changes in V2:
>> -- allow supported max link rate specified from dtsi
> 
> Please don't roll this into the patch that removes the limit. The
> previous version of this patch was fine. The part that lowers the limit
> back down should be another patch.
> 
> We rejected link-rate in DT before and we should reject it upstream
> again. As far as I can tell, the maximum link rate should be determined
> based on the panel or the type-c port on the board. The dp controller
> can always achieve HBR3, so limiting it at the dp controller is
> incorrect. The driver should query the endpoints to figure out if they
> want to limit the link rate. Is that done automatically sometimes by
> intercepting the DPCD?

ok, i will roll back to original patch and add the second patch for max 
link rate limited purpose.
panel dpcd specified max link rate it supported.
At driver, link rate is derived from dpcd directly since driver will try 
to use the maximum supported link rate and less lane to save power.
Therefore it is not possible that limit link rate base on dpcd.
AS i understand we are going to do max link rate limitation is due to 
old redriver chip can not support HBR3.
How can I acquire which type-c port on the board so that I can trigger 
max link rate limitation?


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

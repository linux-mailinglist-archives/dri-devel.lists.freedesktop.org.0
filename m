Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A1B3C1B0C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 23:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD62A6E94B;
	Thu,  8 Jul 2021 21:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3C389CC9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 21:34:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625780048; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xpgLql9IbuvMj4f8z+D1UneOTXpQth+qs7ZN6prUSAk=;
 b=qEfjCL2uwpx7RKUNv2Vnf54ZREA0Zbt/8GTP2mlWJdyjt0exqmUThfHcmDTWVc2vTHzrwHiI
 nt6AROywzpABQlH6yRSNe+hcUO57iZL5AhklRJE513U9fxwGLMxSYqckIGN3on1xv1YMQ8Zk
 jZ1PkBfesPwQYY5Hv7bJzkwj5fg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60e76f40ec0b18a745fd89fc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Jul 2021 21:33:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3A0D4C4338A; Thu,  8 Jul 2021 21:33:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E930C433D3;
 Thu,  8 Jul 2021 21:33:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 08 Jul 2021 14:33:51 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/7] drm/msm/dp: use dp_ctrl_off_link_stream during PHY
 compliance test run
In-Reply-To: <CAE-0n52SxJx8kOwQddWF096PsPy-0f8bDq_ss=u6i-hisD54Hg@mail.gmail.com>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-2-git-send-email-khsieh@codeaurora.org>
 <CAE-0n52SxJx8kOwQddWF096PsPy-0f8bDq_ss=u6i-hisD54Hg@mail.gmail.com>
Message-ID: <3492b578fdf4e59fe594fb9207782aa1@codeaurora.org>
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

On 2021-07-08 00:03, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-07-06 10:20:14)
>> DP cable should always connect to DPU during the entire PHY compliance
>> testing run. Since DP PHY compliance test is executed at irq_hpd event
>> context, dp_ctrl_off_link_stream() should be used instead of 
>> dp_ctrl_off().
>> dp_ctrl_off() is used for unplug event which is triggered when DP 
>> cable is
>> dis connected.
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
> 
> Is this
> 
> Fixes: f21c8a276c2d ("drm/msm/dp: handle irq_hpd with sink_count = 0 
> correctly")
> 
> or
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")

should be fixes at f21c8a276c2d ("drm/msm/dp: handle irq_hpd with 
sink_count = 0 correctly")

> 
> ? It's not clear how dp_ctrl_off() was working for compliance tests
> before commit f21c8a276c2d.
both dp_ctrl_off() and dp_ctrl_off_link_strea() are work for 
dp_ctrl_process_phy_test_request()
The problem is after dp_ctrl_off(), aux channel is down, hence next phy 
test will failed due to dpcd read failed.
So that cable unplugged and replug back to required to run next test 
case.
dp_ctrl_off_link_stream() will keep aux channel up and other phy test 
case can be continued.



>>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index caf71fa..27fb0f0 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1530,7 +1530,7 @@ static int 
>> dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>>          * running. Add the global reset just before disabling the
>>          * link clocks and core clocks.
>>          */
>> -       ret = dp_ctrl_off(&ctrl->dp_ctrl);
>> +       ret = dp_ctrl_off_link_stream(&ctrl->dp_ctrl);
>>         if (ret) {
>>                 DRM_ERROR("failed to disable DP controller\n");
>>                 return ret;

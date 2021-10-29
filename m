Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36C3440125
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 19:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED356EA7E;
	Fri, 29 Oct 2021 17:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2726EA7E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 17:20:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635528047; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4HPL9sczbdymRv+oWzyjAE0VxVTQXhBhxNzHHsXiKw0=;
 b=ENSGrqybMkvsg0nCujbtCJJ33xIwg5b8xEwffkDt0puir9cfUfUFw5C5HxPOA6SnBU2vmSFj
 FX3vckMQovLu6b8BFSfKTnOhdXjZ7QaMF2vK4tfs1qrr5u2WakpvL1ez+jp7GvZsqrQKKC10
 z5IFbqjfOQAoKBjuy4uaTyhmyIA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 617c2d5e900d71ea1ee802ed (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Oct 2021 17:20:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4FB04C43617; Fri, 29 Oct 2021 17:20:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8BE25C4338F;
 Fri, 29 Oct 2021 17:20:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 29 Oct 2021 10:20:28 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, seanpaul@chromium.org, kalyan_t@codeaurora.org,
 abhinavk@codeaurora.org, dianders@chromium.org, mkrishn@codeaurora.org,
 sbillaka@codeaurora.org
Subject: Re: [PATCH v3 6/6] drm/msm/dp: Remove the hpd init delay for eDP
In-Reply-To: <CAE-0n50YcX6sCoTR0bUy_GrZM7=UdHPAGYNwE3Nvj6GL4iTmMg@mail.gmail.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
 <1635386088-18089-7-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n50YcX6sCoTR0bUy_GrZM7=UdHPAGYNwE3Nvj6GL4iTmMg@mail.gmail.com>
Message-ID: <d04f4082266e599cbba458d5e39e75e9@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-10-27 23:38, Stephen Boyd wrote:
> Quoting Sankeerth Billakanti (2021-10-27 18:54:48)
>> DP driver needs a 10 second delay before phy_init so that
>> the usb combo phy initializes and sets up the necessary
>> clocks for usb devices such as keyboard and mouse.
>> 
>> eDP controller uses a standalone phy and need not wait for
>> phy initialization from any other component. This change
>> will remove the delay for eDP controller.
>> 
>> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 61385d6..de6a1fd 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1438,7 +1439,15 @@ void msm_dp_irq_postinstall(struct msm_dp 
>> *dp_display)
>> 
>>         dp_hpd_event_setup(dp);
>> 
>> -       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>> +       if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP) {
>> +               /* eDP does not need any delay before phy init */
>> +               delay = 0;
>> +       } else {
>> +               /* DP needs 10 second delay to let usb combo phy 
>> initialize */
> 
> This seems to be a different approach to the patch Kuogee sent a week 
> or
> two ago. Can we figure out what's wrong with the DP phy starting before
> the USB phy? I suppose this patch is OK as a temporary hack to keep
> moving with eDP, but we really need to figure out what's wrong with DP
> so this delay can be removed entirely. Has any progress been made on
> that?
> 
Sankeerth,
Can you drop this patch for now.
Let's discuss more.

>> +               delay = 100;
>> +       }
>> +
>> +       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, delay);

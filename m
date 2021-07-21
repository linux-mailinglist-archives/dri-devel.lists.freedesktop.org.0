Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A37AB3D1988
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 00:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56276E914;
	Wed, 21 Jul 2021 22:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9847E6E914
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 22:01:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626904902; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7vRGE34N61OuHbeVIFZohOnu8Yd2PzAcJNw5QsqFPog=;
 b=LVbiHxLtGoegnAJhdUkYI+Y+UHKVbMlFeFw05+W6PXrL2wJ3bpPBOgHRPxOSJA/b1rXdaF6w
 PdW47W84izw1clP+5U7LcK588+r3U1voVP3qOA/P6W4aEuZSileiuT3P1oz1UshuhZcW+PH9
 sBNZoW1MBv+3Mj4jflq7ktEX59U=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60f8991e38fa9bfe9c45eb1a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 22:01:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BF3D1C4323A; Wed, 21 Jul 2021 22:01:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: maitreye)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 15032C4338A;
 Wed, 21 Jul 2021 22:01:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 21 Jul 2021 15:01:00 -0700
From: maitreye@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3] drm/msm/dp: add logs across DP driver for ease of
 debugging
In-Reply-To: <CAE-0n52+E0eTgK_4x3OVnqv+U_12tMqxZYtcu3t+FiCJeaq2_g@mail.gmail.com>
References: <1626820770-28158-1-git-send-email-maitreye@codeaurora.org>
 <CAE-0n52+E0eTgK_4x3OVnqv+U_12tMqxZYtcu3t+FiCJeaq2_g@mail.gmail.com>
Message-ID: <d4daea9cdacc8a5544cefde5b64fdb78@codeaurora.org>
X-Sender: maitreye@codeaurora.org
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
Cc: linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Stephen,
Thanks again for the review comments



On 2021-07-20 22:31, Stephen Boyd wrote:
> Quoting maitreye (2021-07-20 15:39:30)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c 
>> b/drivers/gpu/drm/msm/dp/dp_link.c
>> index be986da..316e8e6 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>> @@ -1036,43 +1036,46 @@ int dp_link_process_request(struct dp_link 
>> *dp_link)
>> 
>>         if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
>>                 dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
>> -               return ret;
>> +               goto out;
>>         }
>> 
>>         ret = dp_link_process_ds_port_status_change(link);
>>         if (!ret) {
>>                 dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
>> -               return ret;
>> +               goto out;
>>         }
>> 
>>         ret = dp_link_process_link_training_request(link);
>>         if (!ret) {
>>                 dp_link->sink_request |= DP_TEST_LINK_TRAINING;
>> -               return ret;
>> +               goto out;
>>         }
>> 
>>         ret = dp_link_process_phy_test_pattern_request(link);
>>         if (!ret) {
>>                 dp_link->sink_request |= 
>> DP_TEST_LINK_PHY_TEST_PATTERN;
>> -               return ret;
>> +               goto out;
>>         }
>> 
>>         ret = dp_link_process_link_status_update(link);
> 
> if ret == 0 we go into the if below and goto out.
> 
>>         if (!ret) {
>>                 dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
>> -               return ret;
>> +               goto out;
>>         }
> 
> At this point ret != 0 due to the goto above.
> 
>> 
>>         if (dp_link_is_video_pattern_requested(link)) {
>> -               ret = 0;
> 
> And now we've removed the ret = 0 assignment from here.
> 
>>                 dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
>> +               goto out;
> 
> And then we goto out. Isn't this a behavior change? Still feels like we
> should be using if/else-if logic here instead of this goto maze.
> 
>>         }
>> 
>>         if (dp_link_is_audio_pattern_requested(link)) {
>>                 dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
>> -               return -EINVAL;
>> +               ret = -EINVAL;
>> +               goto out;
>>         }
>> 
>> +out:
>> +       DRM_DEBUG_DP("sink request=%#x", dp_link->sink_request);
>>         return ret;
>>  }
>> 

Thank you. I see what you are saying, and yes it makes sense, I'll 
change it to if else-if logic.

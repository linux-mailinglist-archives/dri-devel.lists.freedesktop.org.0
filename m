Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9E02A206A
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458696EB20;
	Sun,  1 Nov 2020 17:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C287C6E064
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 22:06:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604095596; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lGkiIC6aCmxVlnP+kS5/v1V4Xiy5BR0zSGoVebzuAD4=;
 b=E9guYytSgnxz+YfFRC4FZjFKfdVJlcOjC8LR5JWa5UuOByoIzCdTTfTHPmblsP3cFlxheByw
 r88fkmC8HN/a1VEza1O/Dejstv/5JlaXHnqDg78hg5W7NSwOCvKrL16Pb7BWyy/P0ORgX0xb
 IMqCOsIf2fmJkyaSpYzyI3O2aLM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f9c8e6b0875fb8daad516dd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 22:06:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D73BBC43385; Fri, 30 Oct 2020 22:06:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F1979C433C8;
 Fri, 30 Oct 2020 22:06:33 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 30 Oct 2020 15:06:33 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm/msm/dp: skip checking LINK_STATUS_UPDATED bit
In-Reply-To: <160323215566.884498.14018580767640192186@swboyd.mtv.corp.google.com>
References: <20201020165959.7441-1-khsieh@codeaurora.org>
 <160323215566.884498.14018580767640192186@swboyd.mtv.corp.google.com>
Message-ID: <546018237be3f05b4eb33c916ed1d939@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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

On 2020-10-20 15:15, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2020-10-20 09:59:59)
>> No need to check LINK_STATuS_UPDATED bit before
> 
> LINK_STATUS_UPDATED?
> 
>> return 6 bytes of link status during link training.
> 
> Why?
> 
>> This patch also fix phy compliance test link rate
>> conversion error.
> 
> How?
> 
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
> 
> Any Fixes: tag?
> 
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 20 ++++++--------------
>>  drivers/gpu/drm/msm/dp/dp_link.c | 24 +++++++++++-------------
>>  2 files changed, 17 insertions(+), 27 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 6bdaec778c4c..76e891c91c6e 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1061,23 +1061,15 @@ static bool dp_ctrl_train_pattern_set(struct 
>> dp_ctrl_private *ctrl,
>>  static int dp_ctrl_read_link_status(struct dp_ctrl_private *ctrl,
>>                                     u8 *link_status)
>>  {
>> -       int len = 0;
>> -       u32 const offset = DP_LANE_ALIGN_STATUS_UPDATED - 
>> DP_LANE0_1_STATUS;
>> -       u32 link_status_read_max_retries = 100;
>> -
>> -       while (--link_status_read_max_retries) {
>> -               len = drm_dp_dpcd_read_link_status(ctrl->aux,
>> -                       link_status);
>> -               if (len != DP_LINK_STATUS_SIZE) {
>> -                       DRM_ERROR("DP link status read failed, err: 
>> %d\n", len);
>> -                       return len;
>> -               }
>> +       int ret = 0, len;
>> 
>> -               if (!(link_status[offset] & DP_LINK_STATUS_UPDATED))
>> -                       return 0;
>> +       len = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
>> +       if (len != DP_LINK_STATUS_SIZE) {
>> +               DRM_ERROR("DP link status read failed, err: %d\n", 
>> len);
>> +               ret = len;
> 
> Could this be positive if the len is greater than 0 but not
> DP_LINK_STATUS_SIZE? Maybe the check should be len < 0? We certainly
> don't want to return some smaller size from this function, right?
> 

no, it should be exactly the byte number requested to read.
otherwise, it should be failed and will re read at next run.

>>         }
>> 
>> -       return -ETIMEDOUT;
>> +       return ret;
>>  }
>> 
>>  static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c 
>> b/drivers/gpu/drm/msm/dp/dp_link.c
>> index c811da515fb3..58d65daae3b3 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>> @@ -773,7 +773,8 @@ static int 
>> dp_link_process_link_training_request(struct dp_link_private *link)
>>                         link->request.test_lane_count);
>> 
>>         link->dp_link.link_params.num_lanes = 
>> link->request.test_lane_count;
>> -       link->dp_link.link_params.rate = link->request.test_link_rate;
>> +       link->dp_link.link_params.rate =
>> +               
>> drm_dp_bw_code_to_link_rate(link->request.test_link_rate);
> 
> Why are we storing bw_code in test_link_rate? This looks very 
> confusing.

Test_link_rate contains link rate from dpcd read. it need to be convert 
to real
rate by timing 2.7Mb before start phy compliance test.

> 
>> 
>>         return 0;
>>  }
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

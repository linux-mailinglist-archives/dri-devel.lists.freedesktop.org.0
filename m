Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5837B3C28EA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 20:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAF06EA1B;
	Fri,  9 Jul 2021 18:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADE56EA1B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 18:16:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625854604; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=G5ORNORu2m0miZo+ihbud4cOAt24qx77FdLGRMOLW/k=;
 b=njxcKdx345dwCu7moR6M3bO5tP4P54/T0+16ug5VAFBUyLseWi0QDjeJoVcFOBXyuuHV61uJ
 LjueHsqUAtPi10/GA0UHbfaJNFUSjSfkHzTZAyZBuWVgEfgHYIASDC+Fb+mN7SUEAqAlTxyf
 lUDQcovZ3+ay2sFewNdW84tb5JM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60e8927e5e3e57240b9a2d5b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Jul 2021 18:16:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 094DEC4360C; Fri,  9 Jul 2021 18:16:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0559AC433D3;
 Fri,  9 Jul 2021 18:16:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 09 Jul 2021 11:16:28 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 5/7] drm/msm/dp: return correct edid checksum after
 corrupted edid checksum read
In-Reply-To: <CAE-0n53BnbjD3QaZ5vynJxw44ANatvvRW3rqytyG4jvjKs7L_g@mail.gmail.com>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-6-git-send-email-khsieh@codeaurora.org>
 <CAE-0n53BnbjD3QaZ5vynJxw44ANatvvRW3rqytyG4jvjKs7L_g@mail.gmail.com>
Message-ID: <2b2a191738738993e3bc5796fe676511@codeaurora.org>
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

On 2021-07-08 00:14, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-07-06 10:20:18)
>> Response with correct edid checksum saved at connector after corrupted 
>> edid
>> checksum read. This fixes Link Layer CTS cases 4.2.2.3, 4.2.2.6.
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_panel.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c 
>> b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 88196f7..0fdb551 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -271,7 +271,7 @@ static u8 dp_panel_get_edid_checksum(struct edid 
>> *edid)
>>  {
>>         struct edid *last_block;
>>         u8 *raw_edid;
>> -       bool is_edid_corrupt;
>> +       bool is_edid_corrupt = false;
>> 
>>         if (!edid) {
>>                 DRM_ERROR("invalid edid input\n");
>> @@ -303,7 +303,12 @@ void dp_panel_handle_sink_request(struct dp_panel 
>> *dp_panel)
>>         panel = container_of(dp_panel, struct dp_panel_private, 
>> dp_panel);
>> 
>>         if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
>> -               u8 checksum = 
>> dp_panel_get_edid_checksum(dp_panel->edid);
>> +               u8 checksum;
>> +
>> +               if (dp_panel->edid)
>> +                       checksum = 
>> dp_panel_get_edid_checksum(dp_panel->edid);
>> +               else
>> +                       checksum = 
>> dp_panel->connector->real_edid_checksum;
>> 
>>                 dp_link_send_edid_checksum(panel->link, checksum);
> 
> It looks like this can be drm_dp_send_real_edid_checksum()? Then we
> don't have to look at the connector internals sometimes and can drop
> dp_panel_get_edid_checksum() entirely?
you still need to pass read edid checksum into 
drm_dp_send_real_edid_checksum().
> 
>>                 dp_link_send_test_response(panel->link);

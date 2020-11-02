Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6BE2A36F3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 00:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54926E58A;
	Mon,  2 Nov 2020 23:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083A56E58A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 23:11:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604358713; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=En/Cnk9Ng/CJjRYhctsLDRpGraxUvj7QK4a1BqVJxzE=;
 b=gwGd1kIJq+QMfYNPIZ+c/es3/7/HCwmZtzLKGHjKOGxG06IaxsJyVtyzk3XQfra3IXkjUVWz
 tnyH26AFgqWDws4nEmmbY4ssY9ah7ioYnZG6pZ9H3JMYS5AR+kmhKoaJNk6UheUB5YjkEHLz
 MrkC1uc8qn4PFHcj/I7tqo3mGsw=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fa0923075bebe827aa2cfe1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Nov 2020 23:11:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7EC43C433CB; Mon,  2 Nov 2020 23:11:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9FC23C433C6;
 Mon,  2 Nov 2020 23:11:42 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 02 Nov 2020 15:11:42 -0800
From: abhinavk@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: do not notify audio subsystem if
 sink doesn't support audio
In-Reply-To: <160435838669.884498.2757039786150233129@swboyd.mtv.corp.google.com>
References: <20201029205509.13192-1-abhinavk@codeaurora.org>
 <160435199458.884498.6173218904854698184@swboyd.mtv.corp.google.com>
 <99476b913b8b6ed28fc7af8e80c6db52@codeaurora.org>
 <160435838669.884498.2757039786150233129@swboyd.mtv.corp.google.com>
Message-ID: <3810d7c00f038cd7a6330144bb496cbc@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 cychiang@chromium.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen

On 2020-11-02 15:06, Stephen Boyd wrote:
> Quoting abhinavk@codeaurora.org (2020-11-02 14:43:33)
>> Hi Stephen
>> 
>> Thanks for the review.
>> 
>> On 2020-11-02 13:19, Stephen Boyd wrote:
>> > Quoting Abhinav Kumar (2020-10-29 13:55:09)
>> >> For sinks that do not support audio, there is no need to notify
>> >> audio subsystem of the connection event.
>> >>
>> >> This will make sure that audio routes only to the primary display
>> >> when connected to such sinks.
>> >>
>> >
>> > Does this need a Fixes tag? Or it's just an optimization patch?
>> This is an unhandled corner case ( VGA dongle ) for DP audio and will
>> make
>> sure we do not switch audio output from primary to external when
>> connected to
>> a sink which does not support audio.
>> I thought of adding a fixes tag pointing to
>> https://patchwork.freedesktop.org/patch/390236/.
>> But at the same time, thought this can go in as a standlone patch as
>> well.
>> If you think its required, I will add the fixes tag pointing to the 
>> base
>> audio patch.
> 
> Yeah Fixes is nice so we know what is fixed.
Ok sure, will include it.
> 
>> >
>> >> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> >> ---
>> >>  drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++--
>> >>  1 file changed, 10 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
>> >> b/drivers/gpu/drm/msm/dp/dp_display.c
>> >> index 4a5735564be2..d970980b0ca5 100644
>> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> >> @@ -555,8 +555,16 @@ static int dp_connect_pending_timeout(struct
>> >> dp_display_private *dp, u32 data)
>> >>  static void dp_display_handle_plugged_change(struct msm_dp
>> >> *dp_display,
>> >>                 bool plugged)
>> >>  {
>> >> -       if (dp_display->plugged_cb && dp_display->codec_dev)
>> >> -               dp_display->plugged_cb(dp_display->codec_dev,
>> >> plugged);
>> >> +       struct dp_display_private *dp;
>> >> +
>> >> +       dp = container_of(g_dp_display,
>> >
>> > What is g_dp_display? I guess this doesn't compile?
>> g_dp_display is the global dp_display pointer in the dp_display.c 
>> file.
>> It does compile.
> 
> Oh gross. Can we not use it if dp_display points to it?
Ok sure, will get it from dp_display
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C7C398F3D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 17:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427346E428;
	Wed,  2 Jun 2021 15:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9946E428
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 15:49:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622648976; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=D6KV1f5m9jscGI6uK2w6Uu53Fa6z/VEXVtS077NjpBc=;
 b=d8MIACT51E4harm6FeYE0jZ3ZarS7dHIrC3JjtdJzfKxrapV3Sr1bGESwced0UQ2VtFhl1yQ
 Gm+m7lzYZeKX81cRGWjdrvd4XFOxQIGdbEXWYLBCYjl1SUzDBLABk1P2cRpCz3ljDFdtFbZz
 1iU1zCyY4Ozhlr774S0wZG2P6l0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60b7a888e27c0cc77fc526f7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Jun 2021 15:49:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 33101C43460; Wed,  2 Jun 2021 15:49:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B1BCC433D3;
 Wed,  2 Jun 2021 15:49:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 02 Jun 2021 08:49:23 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3] drm/msm/dp: power off DP phy at suspend
In-Reply-To: <CAE-0n52wAmQ1ZZ0pfGfXwsM23D+R5FFVBrpzr1a8YGDdWNb_gw@mail.gmail.com>
References: <1622591408-5465-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n52wAmQ1ZZ0pfGfXwsM23D+R5FFVBrpzr1a8YGDdWNb_gw@mail.gmail.com>
Message-ID: <783a2b546bfdd08c265f7b160bca2a44@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, vkoul@kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, agross@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, aravindh@codeaurora.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-01 19:00, Stephen Boyd wrote:
> Please add dri-devel@lists.freedesktop.org next time
> 
> Quoting Kuogee Hsieh (2021-06-01 16:50:08)
>> Normal DP suspend operation contains two steps, display off followed
>> by dp suspend, to complete system wide suspending cycle if display is
>> up at that time. In this case, DP phy will be powered off at display
>> off. However there is an exception case that depending on the timing
>> of dongle plug in during system wide suspending, sometimes display off
>> procedure may be skipped and dp suspend was called directly. In this
>> case, dp phy is stay at powered on (phy->power_count = 1) so that at
>> next resume dp driver crash at main link clock enable due to phy is
>> not physically powered on. This patch will call 
>> dp_ctrl_off_link_stream()
>> to tear down main link and power off phy at dp_pm_suspend() if main 
>> link
>> had been brought up.
>> 
>> Changes in V2:
>> -- stashed changes into dp_ctrl.c
>> -- add is_phy_on to monitor phy state
>> 
>> Changes in V3:
>> -- delete is_phy_on
>> -- call dp_ctrl_off_link_stream() from dp_pm_suspend()
>> 
>> Fixes: 0114f31a2903 ("drm/msm/dp: handle irq_hpd with sink_count = 0 
>> correctly)
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 +++++++++-
>>  drivers/gpu/drm/msm/dp/dp_display.c |  4 +++-
>>  drivers/gpu/drm/msm/dp/dp_power.c   | 15 +++++++++++++++
>>  3 files changed, 27 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index dbd8943..8324a453 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1414,6 +1414,7 @@ void dp_ctrl_host_deinit(struct dp_ctrl 
>> *dp_ctrl)
>>         phy = dp_io->phy;
>> 
>>         dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
>> +
>>         phy_exit(phy);
>> 
>>         DRM_DEBUG_DP("Host deinitialized successfully\n");
>> @@ -1457,6 +1458,7 @@ static int dp_ctrl_reinitialize_mainlink(struct 
>> dp_ctrl_private *ctrl)
>>                 return ret;
>>         }
>>         phy_power_off(phy);
>> +
>>         /* hw recommended delay before re-enabling clocks */
>>         msleep(20);
>> 
>> @@ -1488,6 +1490,7 @@ static int dp_ctrl_deinitialize_mainlink(struct 
>> dp_ctrl_private *ctrl)
>>         }
>> 
>>         phy_power_off(phy);
>> +
>>         phy_exit(phy);
>> 
>>         return 0;
> 
> None of these hunks are useful. Can we drop them?
> 
>> @@ -1816,12 +1819,16 @@ int dp_ctrl_off_link_stream(struct dp_ctrl 
>> *dp_ctrl)
>>         struct dp_ctrl_private *ctrl;
>>         struct dp_io *dp_io;
>>         struct phy *phy;
>> -       int ret;
>> +       int ret = 0;
> 
> Drop this.
> 
>> 
>>         ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>>         dp_io = &ctrl->parser->io;
>>         phy = dp_io->phy;
>> 
>> +       /* main link is off */
>> +       if (!dp_power_clk_status(ctrl->power, DP_CTRL_PM))
>> +               return ret;
> 
> and then return 0?
> 
>> +
>>         /* set dongle to D3 (power off) mode */
>>         dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
>> 
>> @@ -1894,6 +1901,7 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>>         }
>> 
>>         phy_power_off(phy);
>> +
>>         phy_exit(phy);
>> 
>>         DRM_DEBUG_DP("DP off done\n");
> 
> Drop?
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index cdec0a3..5abd769 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1327,8 +1327,10 @@ static int dp_pm_suspend(struct device *dev)
>> 
>>         mutex_lock(&dp->event_mutex);
>> 
>> -       if (dp->core_initialized == true)
>> +       if (dp->core_initialized == true) {
>> +               dp_ctrl_off_link_stream(dp->ctrl);
> 
> Why not just check here for dp_power_clk_status()?
> 
>>                 dp_display_host_deinit(dp);
>> +       }
>> 
>>         dp->hpd_state = ST_SUSPENDED;
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c 
>> b/drivers/gpu/drm/msm/dp/dp_power.c
>> index 9c4ea00..980924a9 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_power.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
>> @@ -262,6 +262,21 @@ int dp_power_clk_enable(struct dp_power 
>> *dp_power,
>>                         }
>>                         dp_power->core_clks_on = true;
>>                 }
>> +       } else {
>> +               if (pm_type == DP_CORE_PM && !dp_power->core_clks_on) 
>> {
>> +                       DRM_DEBUG_DP("core clks already disabled\n");
>> +                       return 0;
>> +               }
>> +
>> +               if (pm_type == DP_CTRL_PM && !dp_power->link_clks_on) 
>> {
>> +                       DRM_DEBUG_DP("links clks already disabled\n");
>> +                       return 0;
>> +               }
>> +
>> +               if (pm_type == DP_STREAM_PM && 
>> !dp_power->stream_clks_on) {
>> +                       DRM_DEBUG_DP("pixel clks already disabled\n");
>> +                       return 0;
>> +               }
>>         }
> 
> If this happens isn't something wrong? Like we've somehow lost track of
> the proper state and no we're trying to disable clks when we don't need
> to. And given that clks already manage their own refcount that would be
> pretty obvious if it went wrong
yes,
The problem is at suspend the link training has been done (link clk had 
been enabled)
but  has no user space frame work response to response display up uevent 
so that stream clock is not enabled.
I will drop this but create a dedicated dp_ctrl_off_link() for suspend 
purpose.
> 
>> 
>>         rc = dp_power_clk_set_rate(power, pm_type, enable);

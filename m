Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 327093948BE
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 00:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EF26EB11;
	Fri, 28 May 2021 22:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD2E6EAD3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 22:38:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622241481; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jSJ6ouw7sBSntMFtGhcr7YAwQxKznNopiE0ruE/1CnU=;
 b=PMkcSNTA2xCybuTmSLD0r4iUoX5uqhOxvB6+Iya8pmW2fZfNs8TldUlqwLTqM8s0i4c4sPzA
 lRzZLrPGUpu9sDn8plEUIOvnD9ZPEz7LzMpUpp13PuU4ZoliAt2uv9Zwz1+QX+qrHjt6KxRo
 BkgTegpY2rhvg09iju+eTRH5pcU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60b170c85e7926f57b2b2794 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 May 2021 22:38:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8F960C433D3; Fri, 28 May 2021 22:37:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 93241C433F1;
 Fri, 28 May 2021 22:37:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 28 May 2021 15:37:57 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Freedreno] [PATCH 0/4] drm/msm/dp: Add support for SC8180x eDP
 controller
In-Reply-To: <20210519145149.GX2484@yoga>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
 <40f6aefd3fa341e2bec2060106389be7@codeaurora.org>
 <20210519145149.GX2484@yoga>
Message-ID: <d10c43ffbbf90ea7e00c7f0c61602924@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tanmay Shah <tanmay@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, sbillaka@codeaurora.org,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bjorn

On 2021-05-19 07:51, Bjorn Andersson wrote:
> On Tue 18 May 22:41 CDT 2021, abhinavk@codeaurora.org wrote:
> 
>> Hi Bjorn
>> 
>> I had a quick glance on the series and before getting to other things 
>> wanted
>> to know how you are initializing two different connectors for
>> DP & EDP resp.
>> 
>> The connector type for DP should be DRM_MODE_CONNECTOR_DisplayPort and 
>> eDP
>> should be DRM_MODE_CONNECTOR_eDP.
> 
> As far as I've been able to conclude there is no eDP support in the
> upstream DPU driver; an encoder of type DRM_MODE_ENCODER_TMDS will only
> attach to INTF_DP.
> 
>> We need both to be created so that both EDP and DP can be supported
>> concurrently.
>> 
> 
> Further more the DP controller driver has a global variable to track
> state and the INTF-picker will always pick the interface of index 0 
> when
> setting up the DP controller.
> 
>> Will these changes work for concurrent eDP and DP case?
>> 
> 
> The proposed changes are all that I need to get eDP working on my
> sc8180x laptop. But the DPU code does not currently support more than a
> single DP interface - and that has to be on the first INTF_DP that the
> DPU driver knows about.
> 
> But this is a limitation we should fix, rather than claiming that you
> can only have one of each. Further more, afaict the sc7280 DP 
> controller
> can do both DP and eDP, so it would make sense not to distinguish the
> interfaces as eDP or DP - just because the product in mind will use 
> eDP.
> 
> 
> PS. I've currently disabled the eDP interface on my laptop and am
> working on trying to get Type-C DP working. Once that's in place I'd
> need a better INTF/encoder picker - because the current model of just
> picking INTF_DP 0 (or in a sequential fashion) won't work.
> 
> Regards,
> Bjorn

Yes, we should be able to support eDP + DP concurrently on both sc7280
and sc8180x. Some of the changes we will be posting in the coming weeks
should add support for it. Till then, as we spoke on IRC, since your 
changes
dont break existing DP functionality, will continue reviewing rest of 
the changes.

> 
>> Thanks
>> 
>> Abhinav
>> 
>> On 2021-05-10 21:20, Bjorn Andersson wrote:
>> > The first patch in the series is somewhat unrelated to the support, but
>> > simplifies reasoning and debugging of timing related issues.
>> >
>> > The second patch introduces support for dealing with different register
>> > block
>> > layouts, which is used in the forth patch to describe the hardware
>> > blocks found
>> > in the SC8180x eDP block.
>> >
>> > The third patch configures the INTF_CONFIG register, which carries the
>> > configuration for widebus handling. As with the DPU the bootloader
>> > enables
>> > widebus and we need to disable it, or implement support for adjusting
>> > the
>> > timing.
>> >
>> > Bjorn Andersson (4):
>> >   drm/msm/dp: Simplify the mvid/nvid calculation
>> >   drm/msm/dp: Store each subblock in the io region
>> >   drm/msm/dp: Initialize the INTF_CONFIG register
>> >   drm/msm/dp: Add support for SC8180x eDP
>> >
>> >  drivers/gpu/drm/msm/dp/dp_catalog.c | 99 +++++++----------------------
>> >  drivers/gpu/drm/msm/dp/dp_display.c |  1 +
>> >  drivers/gpu/drm/msm/dp/dp_parser.c  | 22 +++++++
>> >  drivers/gpu/drm/msm/dp/dp_parser.h  |  8 +++
>> >  4 files changed, 53 insertions(+), 77 deletions(-)

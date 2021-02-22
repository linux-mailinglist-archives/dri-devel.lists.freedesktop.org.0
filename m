Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C80B321E23
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 18:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CC389F61;
	Mon, 22 Feb 2021 17:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-2.mailgun.net (m42-2.mailgun.net [69.72.42.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504FA89F61
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 17:32:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614015153; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wMRx10zuS5ThMWxA6VKc8X0C9+uthh229JNG1OCt8TE=;
 b=EmOPoF7OFO686v/mBLPGYqkwiXOlf0P45JxVzWPaTsqp2qwSGR+FLSJe1JtbtLnYh/yO0f4L
 sE5rNkQt1b1oIvXswvEMX76N6uuDLV5QnnVGFqCUHMJJWsgzPw3ZogsUbUIjEV6lp+xAZ1+e
 pw7Wy1VTVOXKWGGRSDlkElW4fSQ=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6033eab03bd0a42cc929751d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Feb 2021 17:32:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B4AC1C43465; Mon, 22 Feb 2021 17:32:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 56169C433C6;
 Mon, 22 Feb 2021 17:32:30 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 22 Feb 2021 09:32:30 -0800
From: khsieh@codeaurora.org
To: Sean Paul <seanpaul@chromium.org>
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/dp: add supported max link
 rate specified from dtsi
In-Reply-To: <CAOw6vbLkET7UvsUhWDeeMz8V5i5c_hBSR-Q4-B6_Y5apoTzEng@mail.gmail.com>
References: <1613681704-12539-1-git-send-email-khsieh@codeaurora.org>
 <161368935031.1254594.14384765673800900954@swboyd.mtv.corp.google.com>
 <7af07dcacd5b68087cc61e467e9c57ea@codeaurora.org>
 <161377480166.1254594.16557636343276220817@swboyd.mtv.corp.google.com>
 <1782d03506bebe7751d33ae12a38d21c@codeaurora.org>
 <CAOw6vbLkET7UvsUhWDeeMz8V5i5c_hBSR-Q4-B6_Y5apoTzEng@mail.gmail.com>
Message-ID: <6815d6545347278b252886a721bc7fc9@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>, Tanmay Shah <tanmay@codeaurora.org>,
 Dave Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-02-22 08:55, Sean Paul wrote:
> On Mon, Feb 22, 2021 at 11:31 AM <khsieh@codeaurora.org> wrote:
>> 
>> On 2021-02-19 14:46, Stephen Boyd wrote:
>> > Quoting khsieh@codeaurora.org (2021-02-19 08:39:38)
>> >> On 2021-02-18 15:02, Stephen Boyd wrote:
>> >> > Quoting Kuogee Hsieh (2021-02-18 12:55:04)
>> >> >> Allow supported link rate to be limited to the value specified at
>> >> >> dtsi. If it is not specified, then link rate is derived from dpcd
>> >> >> directly. Below are examples,
>> >> >> link-rate = <162000> for max link rate limited at 1.62G
>> >> >> link-rate = <270000> for max link rate limited at 2.7G
>> >> >> link-rate = <540000> for max link rate limited at 5.4G
>> >> >> link-rate = <810000> for max link rate limited at 8.1G
>> >> >>
>> >> >> Changes in V2:
>> >> >> -- allow supported max link rate specified from dtsi
>> >> >
>> >> > Please don't roll this into the patch that removes the limit. The
>> >> > previous version of this patch was fine. The part that lowers the limit
>> >> > back down should be another patch.
>> >> >
>> >> > We rejected link-rate in DT before and we should reject it upstream
>> >> > again. As far as I can tell, the maximum link rate should be determined
>> >> > based on the panel or the type-c port on the board. The dp controller
>> >> > can always achieve HBR3, so limiting it at the dp controller is
>> >> > incorrect. The driver should query the endpoints to figure out if they
>> >> > want to limit the link rate. Is that done automatically sometimes by
>> >> > intercepting the DPCD?
>> >>
>> >> ok, i will roll back to original patch and add the second patch for
>> >> max
>> >> link rate limited purpose.
>> >> panel dpcd specified max link rate it supported.
>> >> At driver, link rate is derived from dpcd directly since driver will
>> >> try
>> >> to use the maximum supported link rate and less lane to save power.
>> >> Therefore it is not possible that limit link rate base on dpcd.
>> >> AS i understand we are going to do max link rate limitation is due to
>> >> old redriver chip can not support HBR3.
>> >> How can I acquire which type-c port on the board so that I can trigger
>> >> max link rate limitation?
>> >>
>> >>
>> >
>> > The driver already seems to support lowering the link rate during link
>> > training. Can't we try to train at the highest rate and then downgrade
>> > the link speed until it trains properly? I sort of fail to see why we
>> > need to introduce a bunch of complexity around limiting the link rate
>> > on
>> > certain boards if the driver can figure out that link training doesn't
>> > work at HBR3 so it should try to train at HBR2 instead.
>> 
>> yes, dp driver did support down grade link rate during link training
>> procedure.
>> But link training is kind of setting up agreement between host and 
>> panel
>> with assumption that there are no other limitations in between.
>> The problem we are discussing here is the limitation of usb re driver
>> link rate support.
>> Since we do not know how usb re driver behavior, I am not sure link
>> training will work appropriately for this case.
>> It may end up link status keep toggling up and down.
>> 
> 
> IMO we should just fail link training if the redriver doesn't support
> a link count/rate and fallback to the next count/rate. This should be
> handled the same as if there were a cable incapable of achieving a
> link rate. Adding the link rate to the device tree (at least on the dp
> block) seems suspicious.
> 
> If you really wanted to model the redriver's limitations in software,
> you'd probably want to introduce a bridge driver/connector which
> rejects modes that cannot be achieved by the redriver. This should
> prevent the dp driver from trying to train at the unsupported rates.
> 
> Sean
> 
I am not familiar with drm arch that well.
Can you elaborate more how bridge can work in this case?
When dp driver received plug-in interrupt, it read panel capability dpcd 
and start link training with link rate specified at dpcd.
How bridge can propagate link rate (limited by redriver) before link 
training happen?



> 
>> Both link-lane and link-rate specified at dtsi are for the limitation 
>> of
>> Trogdor hardware platform.
>> Both link-lane and link-rate specified at dtsi are NOT for panel since
>> panel have specified its capability at its DPCD.
>> 
>> 
>> 
>> 
>> 
>> 
>> 
>> 
>> _______________________________________________
>> Freedreno mailing list
>> Freedreno@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

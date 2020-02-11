Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B356A158A59
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 08:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2026EDBD;
	Tue, 11 Feb 2020 07:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7216EDB3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 05:58:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1581400698; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=90LwSLciKSX0tDR6UyVjm6zI/ZPE7pQez+xZZMUCPQw=;
 b=Phsl4ZEz0dXv8d53Cvs1v7fCUnqL/PM9b0gs1SuY+8Iblm/ZrliQNVZ4pycf5BuZw6b0SelT
 mlpIfm9GrOLNaX6mkbUiG6ncLujS4h6UoGl+1hsdaAHDqwP20tDcvOnvam9OyT+DL/WmWfoG
 hMmv2IBa1GIii+Bca5xmi2G/xNU=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e424274.7ff3c8d0cca8-smtp-out-n03;
 Tue, 11 Feb 2020 05:58:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CD2E6C4479D; Tue, 11 Feb 2020 05:58:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: harigovi)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 29BE2C43383;
 Tue, 11 Feb 2020 05:58:12 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 11 Feb 2020 11:28:12 +0530
From: harigovi@codeaurora.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dsi/pll: call vco set rate explicitly
In-Reply-To: <CAOCk7NoCH9p9gOd7as=ty-EMeerAAhQtKZa8f2wZrDeV2LtGrw@mail.gmail.com>
References: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
 <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com>
 <2f5abc857910f70faa119fea5bda81d7@codeaurora.org>
 <CAOCk7NoCH9p9gOd7as=ty-EMeerAAhQtKZa8f2wZrDeV2LtGrw@mail.gmail.com>
Message-ID: <1d201377996e16ce25acb640867e1214@codeaurora.org>
X-Sender: harigovi@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Tue, 11 Feb 2020 07:26:04 +0000
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
Cc: DTML <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-02-07 19:40, Jeffrey Hugo wrote:
> On Fri, Feb 7, 2020 at 5:38 AM <harigovi@codeaurora.org> wrote:
>> 
>> On 2020-02-06 20:29, Jeffrey Hugo wrote:
>> > On Thu, Feb 6, 2020 at 2:13 AM Harigovindan P <harigovi@codeaurora.org>
>> > wrote:
>> >>
>> >> For a given byte clock, if VCO recalc value is exactly same as
>> >> vco set rate value, vco_set_rate does not get called assuming
>> >> VCO is already set to required value. But Due to GDSC toggle,
>> >> VCO values are erased in the HW. To make sure VCO is programmed
>> >> correctly, we forcefully call set_rate from vco_prepare.
>> >
>> > Is this specific to certain SoCs? I don't think I've observed this.
>> 
>> As far as Qualcomm SOCs are concerned, since pll is analog and the 
>> value
>> is directly read from hardware if we get recalc value same as set rate
>> value, the vco_set_rate will not be invoked. We checked in our idp
>> device which has the same SOC but it works there since the rates are
>> different.
> 
> This doesn't seem to be an answer to my question.  What Qualcomm SoCs
> does this issue apply to?  Everything implementing the 10nm pll?  One
> specific SoC?  I don't believe I've seen this on MSM8998, nor SDM845,
> so I'm interested to know what is the actual impact here.  I don't see
> an "IDP" SoC in the IP catalog, so I really have no idea what you are
> referring to.


This is not 10nm specific. It is applicable for other nms also.
Its specific to the frequency being set. If vco_recalc returns the same 
value as being set by vco_set_rate,
vco_set_rate will not be invoked second time onwards.

For example: Lets take below devices:

Cheza is based on SDM845 which is 10nm only.
Clk frequency:206016
dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1236096000
dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1236095947

Trogdor is based on sc7180 which is also 10nm.
Clk frequency:69300
dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663200000
dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663200000

In same trogdor device, we slightly changed the clock frequency and the 
values actually differ which will not cause any issue.
Clk frequency:69310
dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663440000
dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663439941
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

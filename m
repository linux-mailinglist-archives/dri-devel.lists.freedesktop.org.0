Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95466425CA5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357006E5AB;
	Thu,  7 Oct 2021 19:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3426E5AB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 19:52:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633636332; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=y8koyWINUfzb802j4etgpILh+JOtc9mzcLwfHf8t16w=;
 b=Qthyq6c2gs/n1YHOxx0f9I30HGuTZWq2enBd4nYuD4GStse9j/PclrQXanjs+SY8iv23uAmL
 iLE7bxCyjtcxtTutxJk3m4iqL/uvhqmGlvICs061rCgu4Kw2NpxlFgSCdsuatGg1gLh/ZxGx
 FPrvskykF5y/lqmvXiCsMtGxAtI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 615f4fd6de4c4ed3854caa11 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 19:51:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B3AC1C43616; Thu,  7 Oct 2021 19:51:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7920EC4338F;
 Thu,  7 Oct 2021 19:51:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 07 Oct 2021 12:51:48 -0700
From: khsieh@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar
 <abhinavk@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@linux.ie>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Sankeerth
 Billakanti <sbillaka@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: Shorten SETUP timeout
In-Reply-To: <YV3dddt/GOidTmlN@ripper>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
 <YVzGVmJXEDH0HfIL@ripper>
 <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
 <a4a4980e586a70e3b7de989bc61a3e33@codeaurora.org> <YV0FlTyMEzlyNsN9@ripper>
 <3dbe0fe48da88af9dee396a85b940e76@codeaurora.org> <YV3dddt/GOidTmlN@ripper>
Message-ID: <9dc50145fb3e9b189fd38857b20f326a@codeaurora.org>
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

On 2021-10-06 10:31, Bjorn Andersson wrote:
> On Wed 06 Oct 08:37 PDT 2021, khsieh@codeaurora.org wrote:
> 
>> On 2021-10-05 19:10, Bjorn Andersson wrote:
>> > On Tue 05 Oct 16:04 PDT 2021, khsieh@codeaurora.org wrote:
>> >
>> > > On 2021-10-05 15:36, Stephen Boyd wrote:
>> > > > Quoting Bjorn Andersson (2021-10-05 14:40:38)
>> > > > > On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
>> > > > >
>> > > > > > Quoting Bjorn Andersson (2021-10-04 19:37:50)
>> > > > > > > Found in the middle of a patch from Sankeerth was the reduction of the
>> > > > > > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
>> > > > > > > is initalized and HPD interrupt start to be serviced, so in the case of
>> > > > > > > eDP this reduction improves the user experience dramatically - i.e.
>> > > > > > > removes 9.9s of bland screen time at boot.
>> > > > > > >
>> > > > > > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
>> > > > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> > > > > > > ---
>> > > > > >
>> > > > > > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
>> > > > > > re-read the code a couple times to understand that it's waiting 100ms
>> > > > > > times the 'delay' number. Whaaaaat?
>> > > > > >
>> > > > >
>> > > > > I assume you're happy with the current 10s delay on the current
>> > > > > devices, so I don't think we should push for this to be backported.
>> > > > > I have no need for it to be backported on my side at least.
>> > > > >
>> > > >
>> > > > Sure. Fixes tag != backported to stable trees but it is close.
>> > > >
>> > > > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> > > > >
>> > >   dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1); <== to 100ms
>> > >
>> > > This patch will prevent usb3 from working due to dp driver
>> > > initialize phy
>> > > earlier than usb3 which cause timeout error at power up usb3 phy
>> > > when both
>> > > edp and dp are enabled.
>> >
>> > Can you please help me understand what you mean here, I use this on my
>> > sc8180x with both eDP and USB-C/DP right now. What is it that doesn't
>> > work? Or am I just lucky in some race condition?
>> >
>> > Thanks,
>> > Bjorn
>> >
>> The problem is seen at sc7280.
>> Apple dongle have both  hdmi and usb port.
>> plug Apple dongle into type-c, then plug DP into apple's hdmi port and 
>> usb
>> mouse into apple's usb port.
>> If edp enabled at this time, then usb mouse will not work due to 
>> timeout at
>> phy power up.
>> 
> 
> Okay, so you're saying that if the DP driver invokes phy_power_on()
> before the USB driver does, USB initialization fails (or at least USB
> doesn't work)?

if dp driver call qcom_qmp_phy_init() before usb3 call 
qcom_qmp_phy_init(),
usb3 driver will timeout at readl_poll_timeout(status, val, (val & mask) 
== ready, 10, PHY_INIT_COMPLETE_TIMEOUT) of qcom_qmp_phy_power_on().
> 
> Sounds like something we need to work out in the QMP phy driver. Do you
> have any more details about what's going wrong.
> 
> 
> Also, I've seen various references to said "Apple dongle", do you have 
> a
> link to the exact one you're testing with so I can pick one up for
> testing purposes as well?

Apple A2119 hdmi+usb dongle.
https://www.amazon.com/Apple-USB-C-Digital-Multiport-Adapter/dp/B07WF96FY5/ref=sr_1_2?dchild=1&keywords=apple+a2119&qid=1633636227&sr=8-2

> 
> Regards,
> Bjorn
> 
>> > > I had prepared a patch (drm/msm/dp: do not initialize combo phy
>> > > until plugin
>> > > interrupt) to fix this problem.
>> > > Unfortunately, my patch is depend on Bjorn's patch (PATCH v3 3/5]
>> > > drm/msm/dp: Support up to 3 DP controllers).
>> > > I will submit my patch for review once Bjorn's patches merged in.
>> > > Therefore I would think this patch should go after both Bjorn's
>> > > patches and
>> > > my patch.
>> > >
>> > >
>> > >

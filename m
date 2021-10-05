Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A692423411
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 01:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574286E471;
	Tue,  5 Oct 2021 23:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F646E471
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 23:04:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633475096; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uG0DDsxj9ZrKdIW3DNhGgroyzNQbGUiq4kmEFJgIQnA=;
 b=ZHW9sMDmBO5WzsLLmLVRx0m3f8VV5OK21IK4m9E2docClsc883APBjwUVziPgNT2yoRHERY+
 3tqUTj4HGw10ga7o+E4Kr8Pjf9SyipYMyN8VozZhPEWv+uVv0GJh31aN/JOWk3n1l6hu7nU/
 6ToFeXxz16Nqn24Ek82AiRu3CCM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 615cda099ebaf35aaa7a3f1e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 23:04:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 42482C4360C; Tue,  5 Oct 2021 23:04:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5212FC4338F;
 Tue,  5 Oct 2021 23:04:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 05 Oct 2021 16:04:40 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Abhinav Kumar
 <abhinavk@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@linux.ie>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Sankeerth
 Billakanti <sbillaka@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: Shorten SETUP timeout
In-Reply-To: <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
 <YVzGVmJXEDH0HfIL@ripper>
 <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
Message-ID: <a4a4980e586a70e3b7de989bc61a3e33@codeaurora.org>
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

On 2021-10-05 15:36, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2021-10-05 14:40:38)
>> On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
>> 
>> > Quoting Bjorn Andersson (2021-10-04 19:37:50)
>> > > Found in the middle of a patch from Sankeerth was the reduction of the
>> > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
>> > > is initalized and HPD interrupt start to be serviced, so in the case of
>> > > eDP this reduction improves the user experience dramatically - i.e.
>> > > removes 9.9s of bland screen time at boot.
>> > >
>> > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
>> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> > > ---
>> >
>> > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
>> > re-read the code a couple times to understand that it's waiting 100ms
>> > times the 'delay' number. Whaaaaat?
>> >
>> 
>> I assume you're happy with the current 10s delay on the current
>> devices, so I don't think we should push for this to be backported.
>> I have no need for it to be backported on my side at least.
>> 
> 
> Sure. Fixes tag != backported to stable trees but it is close.
> 
>> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> 
   dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1); <== to 100ms

This patch will prevent usb3 from working due to dp driver initialize 
phy earlier than usb3 which cause timeout error at power up usb3 phy 
when both edp and dp are enabled.
I had prepared a patch (drm/msm/dp: do not initialize combo phy until 
plugin interrupt) to fix this problem.
Unfortunately, my patch is depend on Bjorn's patch (PATCH v3 3/5] 
drm/msm/dp: Support up to 3 DP controllers).
I will submit my patch for review once Bjorn's patches merged in.
Therefore I would think this patch should go after both Bjorn's patches 
and my patch.




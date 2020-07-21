Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676B7229182
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41A56E445;
	Wed, 22 Jul 2020 07:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2376E45C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 21:16:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595366171; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=QIFHHn9Bz6CS1awEQLVI1+5x4m0PpVAHkNs3N45sppE=;
 b=I41a6pT0UokDexNnt6TDXaehUhULAvBgxJv5BxbN1F8bdgKHGQNSlwUFd1Mvb514slBRRVzB
 93JzUNz6yhJkgmke/5/EnYM8rylXbGrk7FHJe0qXIbLwalX3ClK4LJFMXlobKYKVNvO5teQS
 nzqElbYjLawAhlJUMdT5XCdzdHQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5f175af98423214e13d2f2b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Jul 2020 21:15:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EBA42C433C9; Tue, 21 Jul 2020 21:15:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9FDE8C433C6;
 Tue, 21 Jul 2020 21:15:35 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 21 Jul 2020 14:15:35 -0700
From: khsieh@codeaurora.org
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets
In-Reply-To: <CAF6AEGs0+=tpOWtY0kUc=Vt7EdEEwQjEffMXxFtDo142gRYRhQ@mail.gmail.com>
References: <20200707184125.15114-1-khsieh@codeaurora.org>
 <159527632812.1987609.6364896740387949838@swboyd.mtv.corp.google.com>
 <91a8eef836c1939cb57942c6fdcf2772@codeaurora.org>
 <159528794676.3847286.1584696687662833591@swboyd.mtv.corp.google.com>
 <CAF6AEGs0+=tpOWtY0kUc=Vt7EdEEwQjEffMXxFtDo142gRYRhQ@mail.gmail.com>
Message-ID: <9fa6328419fa5ddcca856d3c505394f8@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Wed, 22 Jul 2020 07:02:50 +0000
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, aravindh@codeaurora.org,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-07-20 19:57, Rob Clark wrote:
> On Mon, Jul 20, 2020 at 4:32 PM Stephen Boyd <swboyd@chromium.org> 
> wrote:
>> 
>> Quoting khsieh@codeaurora.org (2020-07-20 15:48:13)
>> > On 2020-07-20 13:18, Stephen Boyd wrote:
>> > > Quoting Kuogee Hsieh (2020-07-07 11:41:25)
>> > >>  drivers/gpu/drm/msm/dp/dp_power.c           |  32 +-
>> > >>  drivers/gpu/drm/msm/dp/dp_power.h           |   1 +
>> > >>  drivers/gpu/drm/msm/dp/dp_reg.h             |   1 +
>> > >>  17 files changed, 861 insertions(+), 424 deletions(-)
>> > >
>> > > It seems to spread various changes throughout the DP bits and only has
>> > > a
>> > > short description about what's changing. Given that the series above
>> > > isn't merged it would be better to get rid of this change and make the
>> > > changes in the patches that introduce these files.
>> > >
>> >
>> > Yes, the base DP driver is not yet merged as its still in reviews and
>> > has been for a while.
>> > While it is being reviewed, different developers are working on
>> > different aspects of DP such as base DP driver, DP compliance, audio etc
>> > to keep things going in parallel.
>> > To maintain the authorship of the different developers, we prefer having
>> > them as separate changes and not merge them.
>> > We can make all these changes as part of the same series if that shall
>> > help to keep things together but would prefer the changes themselves to
>> > be separate.
>> > Please consider this and let us know if that works.
>> >
>> 
>> I'm not the maintainer here so it's not really up to me, but this is 
>> why
>> we have the Co-developed-by tag, to show that multiple people worked 
>> on
>> some patch. The patch is supposed to logically stand on its own
>> regardless of how many people worked on it. Authorship is a single
>> person but the Co-developed-by tag helps express that more than one
>> person is the actual author of the patch. Can you use that tag instead
>> and then squash this into the other DP patches?
> 
> The dpu mega-patches are hard enough to review already.. I'd really
> appreciated it if the dpu dev's sort out some way to squash later
> fixups into earlier patches
> 
> BR,
> -R
as per discussion on IRC, I have separated the parts of this change 
which are
unrelated to compliance and we have merged it to the base DP driver and 
added
the Co-developed-by tag there. Since this change adds supports for DP 
compliance
on MSM chipsets which is a new feature and not fixes to the base driver, 
we will
prefer to have this as a separate change as it will make it easier for 
you to
review it instead of continuing to expand the base DP driver
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

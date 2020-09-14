Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D0D26941B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 19:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20326E528;
	Mon, 14 Sep 2020 17:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34B26E530
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 17:51:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600105879; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=9QmHcWXvGdFKIBQeux89IG8cd2AqI9c4ill+N7aDvAU=;
 b=gHSPqRdh+mKx706NhFocZ+lG1lRqvEI/AWGH5vDTccW5O5f+0yUglW3eoMhWV8VEGOC2apAh
 /XrzdDen7xuSpJrRnE8MM7pUEiPnD8L2LpQkF6dfDZpmdUn/tovgUL7YB06Sl4/lht+rbEJF
 ltokD3OQngbZP8frt8usc0K01hg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f5fad909bdf68cc03e9d64b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 17:51:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C8666C43385; Mon, 14 Sep 2020 17:51:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 53261C433C8;
 Mon, 14 Sep 2020 17:51:10 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 14 Sep 2020 10:51:10 -0700
From: Tanmay Shah <tanmay@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v12 0/5] Add support for DisplayPort driver on SnapDragon
In-Reply-To: <CAF6AEGttutrtxntAeRDtb3Hf_0i4z+9+rWMuShTrPVwTUHKTdg@mail.gmail.com>
References: <20200827211658.27479-1-tanmay@codeaurora.org>
 <CAF6AEGttutrtxntAeRDtb3Hf_0i4z+9+rWMuShTrPVwTUHKTdg@mail.gmail.com>
Message-ID: <9dba5799c9569d0b7abb460cc983f559@codeaurora.org>
X-Sender: tanmay@codeaurora.org
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
Cc: David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, khsieh@codeaurora.org,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 aravindh@codeaurora.org, freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-12 11:25, Rob Clark wrote:
> Fyi, I've pushed this series and the dp-compliance bits to 
> msm-next-dp[1]
> 
> I didn't include the dp audio series yet, which seems to need some
> minor rebasing.  (And a small request, when resending, cc
> freedreno@lists.freedesktop.org, so it shows up in the patchwork
> instance[2] I use)
> 
> You might want to double check that I got the correct versions of the
> series, etc.  And that nothing else (other than audio) is missing.
> 

Thanks Rob for pulling changes in msm-next-dp branch.
I confirm that changes you pointed above are latest
changes and nothing else is missing in driver.
Sure, we will make sure to send changes in freedreno list as well.

Thanks.

> BR,
> -R
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/commits/msm-next-dp
> [2] https://patchwork.freedesktop.org/project/freedreno
> 
> On Thu, Aug 27, 2020 at 2:17 PM Tanmay Shah <tanmay@codeaurora.org> 
> wrote:
>> 
>> These patches add Display-Port driver on SnapDragon/msm hardware.
>> This series also contains device-tree bindings for msm DP driver.
>> It also contains Makefile and Kconfig changes to compile msm DP 
>> driver.
>> 
>> The block diagram of DP driver is shown below:
>> 
>> 
>>                  +-------------+
>>                  |DRM FRAMEWORK|
>>                  +------+------+
>>                         |
>>                    +----v----+
>>                    | DP DRM  |
>>                    +----+----+
>>                         |
>>                    +----v----+
>>      +------------+|   DP    +----------++------+
>>      +        +---+| DISPLAY |+---+      |      |
>>      |        +    +-+-----+-+    |      |      |
>>      |        |      |     |      |      |      |
>>      |        |      |     |      |      |      |
>>      |        |      |     |      |      |      |
>>      v        v      v     v      v      v      v
>>  +------+ +------+ +---+ +----+ +----+ +---+ +-----+
>>  |  DP  | |  DP  | |DP | | DP | | DP | |DP | | DP  |
>>  |PARSER| | HPD  | |AUX| |LINK| |CTRL| |PHY| |POWER|
>>  +--+---+ +---+--+ +---+ +----+ +--+-+ +-+-+ +-----+
>>     |                              |     |
>>  +--v---+                         +v-----v+
>>  |DEVICE|                         |  DP   |
>>  | TREE |                         |CATALOG|
>>  +------+                         +---+---+
>>                                       |
>>                                   +---v----+
>>                                   |CTRL/PHY|
>>                                   |   HW   |
>>                                   +--------+
>> 
>> Changes in v12:
>> 
>> -- Add support of pm ops in display port driver
>> -- Clear bpp depth bits before writing to MISC register
>> -- Fix edid read
>> 
>> Previous change log:
>> https://lkml.kernel.org/lkml/20200818051137.21478-1-tanmay@codeaurora.org/
>> 
>> Chandan Uddaraju (4):
>>   dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
>>   drm: add constant N value in helper file
>>   drm/msm/dp: add displayPort driver support
>>   drm/msm/dp: add support for DP PLL driver
>> 
>> Jeykumar Sankaran (1):
>>   drm/msm/dpu: add display port support in DPU
>> 
>> Tanmay Shah (1):
>>   drm/msm/dp: Add Display Port HPD feature
>> 
>>  drivers/gpu/drm/i915/display/intel_display.c  |    2 +-
>>  drivers/gpu/drm/msm/Kconfig                   |    9 +
>>  drivers/gpu/drm/msm/Makefile                  |   14 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   27 +-
>>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |    8 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   83 +-
>>  drivers/gpu/drm/msm/dp/dp_aux.c               |  535 ++++++
>>  drivers/gpu/drm/msm/dp/dp_aux.h               |   30 +
>>  drivers/gpu/drm/msm/dp/dp_catalog.c           | 1045 ++++++++++
>>  drivers/gpu/drm/msm/dp/dp_catalog.h           |  105 +
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c              | 1693 
>> +++++++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_ctrl.h              |   35 +
>>  drivers/gpu/drm/msm/dp/dp_display.c           | 1046 ++++++++++
>>  drivers/gpu/drm/msm/dp/dp_display.h           |   31 +
>>  drivers/gpu/drm/msm/dp/dp_drm.c               |  168 ++
>>  drivers/gpu/drm/msm/dp/dp_drm.h               |   18 +
>>  drivers/gpu/drm/msm/dp/dp_hpd.c               |   69 +
>>  drivers/gpu/drm/msm/dp/dp_hpd.h               |   79 +
>>  drivers/gpu/drm/msm/dp/dp_link.c              | 1214 ++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_link.h              |  132 ++
>>  drivers/gpu/drm/msm/dp/dp_panel.c             |  486 +++++
>>  drivers/gpu/drm/msm/dp/dp_panel.h             |   95 +
>>  drivers/gpu/drm/msm/dp/dp_parser.c            |  267 +++
>>  drivers/gpu/drm/msm/dp/dp_parser.h            |  138 ++
>>  drivers/gpu/drm/msm/dp/dp_pll.c               |   99 +
>>  drivers/gpu/drm/msm/dp/dp_pll.h               |   61 +
>>  drivers/gpu/drm/msm/dp/dp_pll_10nm.c          |  930 +++++++++
>>  drivers/gpu/drm/msm/dp/dp_pll_private.h       |   89 +
>>  drivers/gpu/drm/msm/dp/dp_power.c             |  373 ++++
>>  drivers/gpu/drm/msm/dp/dp_power.h             |  103 +
>>  drivers/gpu/drm/msm/dp/dp_reg.h               |  518 +++++
>>  drivers/gpu/drm/msm/msm_drv.c                 |    2 +
>>  drivers/gpu/drm/msm/msm_drv.h                 |   59 +-
>>  include/drm/drm_dp_helper.h                   |    1 +
>>  34 files changed, 9545 insertions(+), 19 deletions(-)
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_display.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_display.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_pll.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_pll.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_pll_10nm.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_pll_private.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_reg.h
>> 
>> 
>> base-commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

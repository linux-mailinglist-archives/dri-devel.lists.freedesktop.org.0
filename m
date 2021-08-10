Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1193E83BB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 21:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E441A6E05A;
	Tue, 10 Aug 2021 19:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6271B6E05A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 19:30:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628623828; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yEtLPU+7rsrGp6+MiBeIiNEocUtKpTm9TPGhXhGZqwg=;
 b=dtCuVDG1Q2V+ICREc5ubhUfTrTvQR/u9a9bcD1WG26R24Da4HxcCzaSqio2AfLWI3KW5kPn3
 z8cCX5s+Hj+eL7X78iV2baEXAY3vNV3v+Tvs/U4veISeoKjJ+J6xTCitBk2Ws7dqDqxIjoa8
 NykEbac1Nf0C+SIDmEGbpU+Yt24=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6112d3c8b14e7e2ecb0ee5e4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 19:30:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6ED40C4338A; Tue, 10 Aug 2021 19:30:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A88D1C433D3;
 Tue, 10 Aug 2021 19:30:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 10 Aug 2021 12:30:12 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
 sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: add drm debug logs to dp_pm_resume/suspend
In-Reply-To: <CAE-0n51NsjfT62anGiQ7FaBgs=bThVq89j3UMp4rNj9raGkwOw@mail.gmail.com>
References: <1628609362-2109-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n52a8i-2oNxtqKaS+XGBE0+wcp0Jx05VgL2KnHoQLW-vDQ@mail.gmail.com>
 <abd00c9d395473875c31379ca0288116@codeaurora.org>
 <CAE-0n51NsjfT62anGiQ7FaBgs=bThVq89j3UMp4rNj9raGkwOw@mail.gmail.com>
Message-ID: <fb5fb363e91fd70236674de8b6f3cf88@codeaurora.org>
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

On 2021-08-10 12:23, Stephen Boyd wrote:
> Quoting khsieh@codeaurora.org (2021-08-10 12:18:02)
>> On 2021-08-10 11:33, Stephen Boyd wrote:
>> > Quoting Kuogee Hsieh (2021-08-10 08:29:22)
>> >> Changes in V2:
>> >> -- correct Fixes text
>> >> -- drop commit text
>> >>
>> >> Fixes: 601f0479c583 ("drm/msm/dp: add logs across DP driver for ease
>> >> of debugging")
>> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> >> ---
>> >>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++++++
>> >>  1 file changed, 13 insertions(+)
>> >
>> > BTW, this conflicts with commit
>> > e8a767e04dbc7b201cb17ab99dca723a3488b6d4
>> > in msm-next. The resolution is trivial but just wanted to mention it.
>> 
>> I Just fetched msm-next and cherry-pick this patch over, no conflict
>> seen.
>> Is this conflict need to be fixed?
>> 
> 
> Oh sorry, I mean commit afc9b8b6bab8 ("drm/msm/dp: signal audio plugged
> change at dp_pm_resume") which doesn't seem to be in msm-next. Maybe 
> Rob
> will resolve the conflict directly.
Yes, I just found that  commit afc9b8b6bab8 ("drm/msm/dp: signal audio 
plugged
> change at dp_pm_resume") is not merged in msm-next.

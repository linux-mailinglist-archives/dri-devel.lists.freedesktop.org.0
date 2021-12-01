Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB2E465763
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 21:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250EA6E14D;
	Wed,  1 Dec 2021 20:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28D56E14D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 20:48:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638391690; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jO7cVrwya6wNaphwskO5dhPvuOsaBbOE/EeWdg/kFsc=;
 b=Q5kUF6bl8WgvDvU3Jqc0x7wJ7MeQV2xnV1TwzAA8RrXR5hglqWjVyoTVe6FX+WJlxQ/Mc/7g
 CO4pmu7yCBzhoHYzLZJD0DKMmtKk/ZSmarfkoAH8Y8ePcoTXq83cetqRfgMMBvExwyI2cRGy
 1SZr1u7GnXUudgQJuPbat+vyHcw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 61a7df89135a8a9d0ec7d115 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 01 Dec 2021 20:48:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 54AA5C43638; Wed,  1 Dec 2021 20:48:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3EDAEC4338F;
 Wed,  1 Dec 2021 20:48:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 01 Dec 2021 12:48:07 -0800
From: khsieh@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 4/4] drm/msm/dp: dp_link_parse_sink_count() return
 immediately if aux read failed
In-Reply-To: <ff384e41-cc86-8028-fc81-b0b41140dcd2@linaro.org>
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
 <1619048258-8717-5-git-send-email-khsieh@codeaurora.org>
 <CAE-0n519sFBeLsNF8=Ci1y_xfY4dRuPRNHnJ++ZXHgj6Z6LhQA@mail.gmail.com>
 <ff384e41-cc86-8028-fc81-b0b41140dcd2@linaro.org>
Message-ID: <c01b4d952b7df2daae276aef4cf3ae13@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org, aravindh@codeaurora.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-24 23:32, Dmitry Baryshkov wrote:
> On 04/05/2021 07:35, Stephen Boyd wrote:
>> Quoting Kuogee Hsieh (2021-04-21 16:37:38)
>>> Add checking aux read/write status at both dp_link_parse_sink_count()
>>> and dp_link_parse_sink_status_filed() to avoid long timeout delay if
>> 
>> s/filed/field/
>> 
>>> dp aux read/write failed at timeout due to cable unplugged.
>>> 
>>> Changes in V4:
>>> -- split this patch as stand alone patch
>>> 
>>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> 
>> Can this patch come before the one previously? And then some fixes tag
>> be added? Otherwise looks good to me.
>> 
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> Tested-by: Stephen Boyd <swboyd@chromium.org>
> 
> Is this something that we still need to pursue/merge?
> 
> There were changes requested for this and for the previous patch, but
> no new versions were posted.

It is my fault to miss this one.
The first two patches of this serial are merged.
I will rebase and re submit this one to V5.10.



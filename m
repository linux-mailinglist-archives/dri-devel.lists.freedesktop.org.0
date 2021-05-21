Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEBD38D1F8
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 01:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400376E8B5;
	Fri, 21 May 2021 23:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8FC6E8B5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 23:26:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621639591; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MQjZZTznmIzLxACeImlgWQKlmNBvEGN7+1JvqdoN7cc=;
 b=vVggZEJWoWYL1cL+P4jy6S9fmg0LHW8ZwvdUsB4eYr/wQXOVspxNJxlOORubdVH28Qu2KFsh
 DsNHVfjv73vJvGEB+U2OdPBbF7L3l6aNZF/2hjnRcBq9q1UKjuaV1nE9tjS/zSKT0w2AlVfU
 aBDfKXLQuptzSUbT9VeuXdUv30Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60a84194c229adfeffffa7b8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 21 May 2021 23:26:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E3AE4C43460; Fri, 21 May 2021 23:26:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 25451C4338A;
 Fri, 21 May 2021 23:26:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 21 May 2021 16:26:11 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 0/3] drm/msm/dp: Simplify aux code
In-Reply-To: <CAE-0n53jA7xPctEU9TkBf=eot4SGs85gpGMjUiDn_ZiMvVLvKw@mail.gmail.com>
References: <20210507212505.1224111-1-swboyd@chromium.org>
 <CAE-0n53jA7xPctEU9TkBf=eot4SGs85gpGMjUiDn_ZiMvVLvKw@mail.gmail.com>
Message-ID: <be37b36782a747f350ea512f69393c57@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-21 14:57, Stephen Boyd wrote:
> Quoting Stephen Boyd (2021-05-07 14:25:02)
>> Here's a few patches that simplify the aux handling code and bubble up
>> timeouts and nacks to the upper DRM layers. The goal is to get DRM to
>> know that the other side isn't there or that there's been a timeout,
>> instead of saying that everything is fine and putting some error 
>> message
>> into the logs.
>> 
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
>> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
>> Cc: aravindh@codeaurora.org
>> Cc: Sean Paul <sean@poorly.run>
>> 
> 
> Kuogee, have you had a change to review this series?
> 
Sorry  missed this one.
Will review it now.
>> Stephen Boyd (3):
>>   drm/msm/dp: Simplify aux irq handling code
>>   drm/msm/dp: Shrink locking area of dp_aux_transfer()
>>   drm/msm/dp: Handle aux timeouts, nacks, defers
>> 
>>  drivers/gpu/drm/msm/dp/dp_aux.c     | 181 
>> ++++++++++++----------------
>>  drivers/gpu/drm/msm/dp/dp_aux.h     |   8 --
>>  drivers/gpu/drm/msm/dp/dp_catalog.c |   2 +-
>>  drivers/gpu/drm/msm/dp/dp_catalog.h |   2 +-
>>  4 files changed, 80 insertions(+), 113 deletions(-)
>> 
>> 
>> base-commit: 51595e3b4943b0079638b2657f603cf5c8ea3a66
>> --
>> https://chromeos.dev
>> 

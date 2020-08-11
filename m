Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7629524208D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 21:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EFD6E7D2;
	Tue, 11 Aug 2020 19:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA66C6E7D0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 19:49:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597175357; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JjTim0gb+1hEs7u9Q27jb9eJJjx9k1/9OYuzAM5+4TM=;
 b=T/901ttw2aqeqrdbkPziZGh2lhbwT8bSYZlWxlJByLUE/n+QISXbF2nDmyomh1/BYe1Fmsj6
 7twmwUFOl3kCGZ1wwX9Z+yyRwRajbgA5oQeJz4ku8CoftoKutPMX5kDuqUkQIc1sFnMR/s4d
 MlMF4VIjUDZNtujPHQZqKNMzSR0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f32f62eba4c2cd3678bed1d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 Aug 2020 19:49:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D4C01C4339C; Tue, 11 Aug 2020 19:49:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8F82BC433C9;
 Tue, 11 Aug 2020 19:49:00 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 11 Aug 2020 12:49:00 -0700
From: tanmay@codeaurora.org
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v9 3/5] drm/msm/dp: add support for DP PLL driver
In-Reply-To: <75acac5a-b4a5-9c5a-4404-fb936d738e46@infradead.org>
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-4-tanmay@codeaurora.org>
 <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
 <CAF6AEGv5Yf1x7aCEauP7XtzTjpUCxJt6_GzxFhFXyf_DX_Gi+g@mail.gmail.com>
 <159683184187.1360974.15575847254880429529@swboyd.mtv.corp.google.com>
 <75acac5a-b4a5-9c5a-4404-fb936d738e46@infradead.org>
Message-ID: <639438051c1b2fe1d9bec5f6343a6dec@codeaurora.org>
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
 Vara Reddy <varar@codeaurora.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-07 13:28, Randy Dunlap wrote:
> On 8/7/20 1:24 PM, Stephen Boyd wrote:
>> Quoting Rob Clark (2020-08-07 08:51:48)
>>> On Fri, Aug 7, 2020 at 8:27 AM Randy Dunlap <rdunlap@infradead.org>
>>> wrote:
>>>> 
>>>> On 8/7/20 12:17 AM, Tanmay Shah wrote:
>>>>> diff --git a/drivers/gpu/drm/msm/Kconfig 
>>>>> b/drivers/gpu/drm/msm/Kconfig
>>>>> index ea3c4d094d09..cc1392b29022 100644
>>>>> --- a/drivers/gpu/drm/msm/Kconfig
>>>>> +++ b/drivers/gpu/drm/msm/Kconfig
>>>>> @@ -60,6 +60,7 @@ config DRM_MSM_HDMI_HDCP
>>>>>  config DRM_MSM_DP
>>>>>       bool "Enable DP support in MSM DRM driver"
>>>>>       depends on DRM_MSM
>>>>> +     default y
>>>>>       help
>>>>>         Compile in support for DP driver in msm drm driver. DP 
>>>>> external
>>>>>         display support is enabled through this config option. It 
>>>>> can
>>>> 
>>>> Hi,
>>>> 
>>>> You need a very strong justification to make an optional part of a
>>>> driver
>>>> to be "default y".
>>> 
>>> My opinion is that if the driver is built, everything should be 
>>> built.
>>> This is what makes sense for distro's.  It is only the embedded case
>>> where you want to trim down unneeded features where you might want to
>>> disable some parts.  So 'default y' makes sense to me.
> 
> We don't set defaults for distro convenience.
> 
>> 
>> Maybe use 'default DRM_MSM' so that it doesn't trigger the 'default y'
>> filters people have?
> 
> Most people can figure that one out.  ;)
> I don't have any automated filters.

After after further reviews, I agree with Rob. Display Port is required 
module as of now so it makes sense to keep 'default y'.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

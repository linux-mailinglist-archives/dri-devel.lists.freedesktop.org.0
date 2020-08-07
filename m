Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCDA23F03E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 17:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C4A6EA0C;
	Fri,  7 Aug 2020 15:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65B46EA16
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 15:54:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596815696; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mSYxkLsaVq5dfOiTl3Q4gvm7lK+FCJ9JjXvC8E52WmU=;
 b=NdqCzNTK9k03o5Ofpt5bRLf8HXSbwfub/AzxlQNMmyWTP/pbTdgA5gyQ+QoeDMCKvH0pYLLf
 QX3C0mRgexsT9La4M7wB6jrHn1MVP/CjDCHUqHF0TQHzEYS0myhr/x97/0JztnpnOS9Hvy3+
 ZxwQob51UFlcWSSgu+xgnTSi89Y=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-east-1.postgun.com with SMTP id
 5f2d794f2b87d660492e356e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 07 Aug 2020 15:54:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 10FCDC433A1; Fri,  7 Aug 2020 15:54:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6100FC433C9;
 Fri,  7 Aug 2020 15:54:54 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 07 Aug 2020 08:54:54 -0700
From: tanmay@codeaurora.org
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v9 3/5] drm/msm/dp: add support for DP PLL driver
In-Reply-To: <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-4-tanmay@codeaurora.org>
 <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
Message-ID: <29b8d7f281aa69df491bedd1e6b6fac6@codeaurora.org>
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 abhinavk@codeaurora.org, Vara Reddy <varar@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-07 08:27, Randy Dunlap wrote:
> On 8/7/20 12:17 AM, Tanmay Shah wrote:
>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>> index ea3c4d094d09..cc1392b29022 100644
>> --- a/drivers/gpu/drm/msm/Kconfig
>> +++ b/drivers/gpu/drm/msm/Kconfig
>> @@ -60,6 +60,7 @@ config DRM_MSM_HDMI_HDCP
>>  config DRM_MSM_DP
>>  	bool "Enable DP support in MSM DRM driver"
>>  	depends on DRM_MSM
>> +	default y
>>  	help
>>  	  Compile in support for DP driver in msm drm driver. DP external
>>  	  display support is enabled through this config option. It can
> 
> Hi,
> 
> You need a very strong justification to make an optional part of a 
> driver
> to be "default y".
> 
> so why?
> 
Thanks Randy for reviews.
"default y" doesn't belong there. Thanks for pointing that.
It will be fixed in next patch.

> thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

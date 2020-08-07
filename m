Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E292402B3
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A94C89CE0;
	Mon, 10 Aug 2020 07:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FFD6E081;
 Fri,  7 Aug 2020 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=A6reZ+I6qgExQ6tk0eR0RqsI3FRby5QZjmXbBTCsRpE=; b=jhJYAsDBx5mQARq8HFgz3mMQYG
 O06mJ2jVj1/Hooz3lLXQr3jSnaOu4YRK8d/7qmpzc6NX7AVBLznUBuD5XdkIqUcgtR8mBMm44blh2
 RukKKZhq9Amh33DyJNVkpsm/cQmbBmKwh8Hq1i3RycjB76fmHb3ivkvVRvixoVY0TiTCrhVx09P3T
 3z8MLOn55T6FNEdAp8y15TyGg9s+0UWSq46F/aoeJbALEsNQEOFVYnmrDNJ/lZerK8GNlwnInbPvN
 OeNlt7yMznGN8++j5wm1rj5Dqqe+H/1UF5RhDKH9ldPAAnnUKCtlUR0yyfbmc1bFN7ZFnR02WbYch
 VWm/pMEw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k44HT-0000Cp-6H; Fri, 07 Aug 2020 15:27:39 +0000
Subject: Re: [PATCH v9 3/5] drm/msm/dp: add support for DP PLL driver
To: Tanmay Shah <tanmay@codeaurora.org>, swboyd@chromium.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-4-tanmay@codeaurora.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
Date: Fri, 7 Aug 2020 08:27:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807071718.17937-4-tanmay@codeaurora.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:59 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 khsieh@codeaurora.org, seanpaul@chromium.org,
 Vara Reddy <varar@codeaurora.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/7/20 12:17 AM, Tanmay Shah wrote:
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index ea3c4d094d09..cc1392b29022 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -60,6 +60,7 @@ config DRM_MSM_HDMI_HDCP
>  config DRM_MSM_DP
>  	bool "Enable DP support in MSM DRM driver"
>  	depends on DRM_MSM
> +	default y
>  	help
>  	  Compile in support for DP driver in msm drm driver. DP external
>  	  display support is enabled through this config option. It can

Hi,

You need a very strong justification to make an optional part of a driver
to be "default y".

so why?

thanks.
-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173226C4E12
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9171E10E976;
	Wed, 22 Mar 2023 14:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3305B10E97F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679496137; x=1711032137;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4dNwE5FJr+nWoKSv7RD6J1C8VOtw+7FZ0Yaooy1wXCU=;
 b=Lj8V2d4Ldp8auhXeHLX+V1UEAVMjc283scQMbTT6jFCySplDIvaR/UCL
 E6otq21B0OT+PAxgwDxHyYhTlGsWolbxi8TwAtcsV3OksTo5s6FPYWZFj
 ojiyrGl51JcdHPUjcWSX3OTf7HG9cCthmLT4dcOuFCT69Z16sxqGtN5p5
 KEtXqMQjXVrMYBtczBHgFnrjYd7fEOst2ZenxIyOen0We0KcwelFCR/pR
 L1vJsX/0ePKkp4Lwfu/VDaQ/kGEXVDrFiiY8PfnYqSGwxcZULs03Z/thg
 ynlnVKmSJuhuTvCqXo2O10/UBWJV0psPBTvmj6xEEiIgB1Q3FjeKIe/SS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="318875108"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="318875108"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 07:42:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="825424479"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="825424479"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.22.233])
 ([10.213.22.233])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 07:42:13 -0700
Message-ID: <4211eac2-5310-e343-2d3a-ccea908e9262@intel.com>
Date: Wed, 22 Mar 2023 15:42:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH v2] drm/bridge: lt8912b: return EPROBE_DEFER if bridge is
 not found
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20230322143821.109744-1-francesco@dolcini.it>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230322143821.109744-1-francesco@dolcini.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 Matheus Castello <matheus.castello@toradex.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22.03.2023 15:38, Francesco Dolcini wrote:
> From: Matheus Castello <matheus.castello@toradex.com>
>
> Returns EPROBE_DEFER when of_drm_find_bridge() fails, this is consistent
> with what all the other DRM bridge drivers are doing and this is
> required since the bridge might not be there when the driver is probed
> and this should not be a fatal failure.
>
> Cc: <stable@vger.kernel.org>
> Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
> Signed-off-by: Matheus Castello <matheus.castello@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
> v2: use dev_err_probe() instead of dev_dbg() (Laurent)
> ---
>   drivers/gpu/drm/bridge/lontium-lt8912b.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> index 2019a8167d69..b40baced1331 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -676,8 +676,8 @@ static int lt8912_parse_dt(struct lt8912 *lt)
>   
>   	lt->hdmi_port = of_drm_find_bridge(port_node);
>   	if (!lt->hdmi_port) {
> -		dev_err(lt->dev, "%s: Failed to get hdmi port\n", __func__);
> -		ret = -ENODEV;
> +		ret = -EPROBE_DEFER;
> +		dev_err_probe(lt->dev, ret, "%s: Failed to get hdmi port\n", __func__);
>   		goto err_free_host_node;
>   	}
>   


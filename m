Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CF544123D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 03:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB51E899D5;
	Mon,  1 Nov 2021 02:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A69A899D5;
 Mon,  1 Nov 2021 02:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635735405; x=1667271405;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=TooinVCTF+GskGPPeCwj9QnDt7nLipC4yPQ/dTu7GqY=;
 b=x27Fn6xzk6vxor5oCeHOvWUt3StQpqTIGCtxMaH88EZ2Fq5MWoq+fCW2
 Uke6L4jInHefpP5YScVcaD1NDhH6SHAc5AH5p63YWrhQ36Sp4W19JeD3k
 hUp1pn8qPxbDUvZZQrbbC6wr1o+/Id70bNFZAPDltAk6OAyWgUhqSjVGp E=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 31 Oct 2021 19:56:45 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2021 19:56:43 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Sun, 31 Oct 2021 19:56:43 -0700
Received: from [10.111.175.173] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Sun, 31 Oct 2021
 19:56:39 -0700
Content-Type: multipart/alternative;
 boundary="------------zpKu8wO0xpwjgPBhni7PbGCC"
Message-ID: <cfaded34-0626-891d-f056-1d9c6584c253@quicinc.com>
Date: Sun, 31 Oct 2021 19:56:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/msm/dsi: set default num_data_lanes
Content-Language: en-US
To: Philip Chen <philipchen@chromium.org>, LKML <linux-kernel@vger.kernel.org>
CC: <dianders@chromium.org>, <swboyd@chromium.org>, <robdclark@chromium.org>, 
 Abhinav Kumar <abhinavk@codeaurora.org>, Bernard Zhao <bernard@vivo.com>, 
 "Dan Carpenter" <dan.carpenter@oracle.com>, Daniel Vetter <daniel@ffwll.ch>,
 "David Airlie" <airlied@linux.ie>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Jonathan Marek <jonathan@marek.ca>, Nicolas
 Boichat <drinkcat@chromium.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li
 <tiny.windzz@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
References: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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

--------------zpKu8wO0xpwjgPBhni7PbGCC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 10/30/2021 10:08 AM, Philip Chen wrote:
> If "data_lanes" property of the dsi output endpoint is missing in
> the DT, num_data_lanes would be 0 by default, which could cause
> dsi_host_attach() to fail if dsi->lanes is set to a non-zero value
> by the bridge driver.
>
> According to the binding document of msm dsi controller, the
> input/output endpoint of the controller is expected to have 4 lanes.
> So let's set num_data_lanes to 4 by default.
>
> Signed-off-by: Philip Chen<philipchen@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index c86b5090fae6..a32eb33dfc14 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1696,6 +1696,8 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
>   	if (!prop) {
>   		DRM_DEV_DEBUG(dev,
>   			"failed to find data lane mapping, using default\n");
> +		/* Set the number of date lanes to 4 by default. */
> +		msm_host->num_data_lanes = 4;
>   		return 0;
>   	}
>   
--------------zpKu8wO0xpwjgPBhni7PbGCC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/30/2021 10:08 AM, Philip Chen
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid">
      <pre class="moz-quote-pre" wrap="">If "data_lanes" property of the dsi output endpoint is missing in
the DT, num_data_lanes would be 0 by default, which could cause
dsi_host_attach() to fail if dsi-&gt;lanes is set to a non-zero value
by the bridge driver.

According to the binding document of msm dsi controller, the
input/output endpoint of the controller is expected to have 4 lanes.
So let's set num_data_lanes to 4 by default.

Signed-off-by: Philip Chen <a class="moz-txt-link-rfc2396E" href="mailto:philipchen@chromium.org">&lt;philipchen@chromium.org&gt;</a></pre>
    </blockquote>
    <span style="white-space:nowrap">Reviewed-by: Abhinav Kumar &lt;<a class="moz-txt-link-abbreviated" href="mailto:quic_abhinavk@quicinc.com">quic_abhinavk@quicinc.com</a></span><span
      style="white-space:nowrap">&gt;</span>
    <blockquote type="cite"
cite="mid:20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid">
      <pre class="moz-quote-pre" wrap="">
---

 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index c86b5090fae6..a32eb33dfc14 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1696,6 +1696,8 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
 	if (!prop) {
 		DRM_DEV_DEBUG(dev,
 			"failed to find data lane mapping, using default\n");
+		/* Set the number of date lanes to 4 by default. */
+		msm_host-&gt;num_data_lanes = 4;
 		return 0;
 	}
 
</pre>
    </blockquote>
  </body>
</html>
--------------zpKu8wO0xpwjgPBhni7PbGCC--

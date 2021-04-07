Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A53573AC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 19:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD536E94C;
	Wed,  7 Apr 2021 17:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06AF6E113
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 17:55:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617818115; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=tI/8Hmd6Dxb4qLn1cn9+aqrM3D4sJNA0qcGkesXc4u8=;
 b=mgQ42jN5iTohCwLQh3/qdj2LKO2/8XafHgb7HkrQV8vfO7DmKgZVkw23AEhQ2RzYTxLkBoYj
 NT+cDJryrxG+o+VKcdHLjillzYiJHocOOuR9iRAmqzPROGr9I2DlJ5Eolrt2tcoUyRfh8gHM
 sEIUxvHUF35mSR1oi7MeI06A1no=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 606df203f34440a9d45c0810 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 17:55:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2904AC433ED; Wed,  7 Apr 2021 17:55:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 25369C433CA;
 Wed,  7 Apr 2021 17:55:14 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 07 Apr 2021 10:55:14 -0700
From: abhinavk@codeaurora.org
To: Bernard Zhao <bernard@vivo.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: remove unneeded variable ret
In-Reply-To: <20210407130654.3387-1-bernard@vivo.com>
References: <20210407130654.3387-1-bernard@vivo.com>
Message-ID: <5b49ba66511153f1ec092906c85b32a5@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tanmay Shah <tanmay@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-04-07 06:06, Bernard Zhao wrote:
> This patch fix coccicheck warning:
> drivers/gpu/drm/msm/dp/dp_link.c:848:5-8: Unneeded variable: "ret".
> Return "0" on line 880
> Also remove unneeded function return value check.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c 
> b/drivers/gpu/drm/msm/dp/dp_link.c
> index be986da78c4a..3395b08155a6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -843,10 +843,8 @@ bool dp_link_send_edid_checksum(struct dp_link
> *dp_link, u8 checksum)
>  	return ret == 1;
>  }
> 
> -static int dp_link_parse_vx_px(struct dp_link_private *link)
> +static void dp_link_parse_vx_px(struct dp_link_private *link)
>  {
> -	int ret = 0;
> -
>  	DRM_DEBUG_DP("vx: 0=%d, 1=%d, 2=%d, 3=%d\n",
>  		drm_dp_get_adjust_request_voltage(link->link_status, 0),
>  		drm_dp_get_adjust_request_voltage(link->link_status, 1),
> @@ -876,8 +874,6 @@ static int dp_link_parse_vx_px(struct 
> dp_link_private *link)
>  	DRM_DEBUG_DP("Requested: v_level = 0x%x, p_level = 0x%x\n",
>  			link->dp_link.phy_params.v_level,
>  			link->dp_link.phy_params.p_level);
> -
> -	return ret;
>  }
> 
>  /**
> @@ -891,8 +887,6 @@ static int dp_link_parse_vx_px(struct 
> dp_link_private *link)
>  static int dp_link_process_phy_test_pattern_request(
>  		struct dp_link_private *link)
>  {
> -	int ret = 0;
> -
>  	if (!(link->request.test_requested & DP_TEST_LINK_PHY_TEST_PATTERN)) 
> {
>  		DRM_DEBUG_DP("no phy test\n");
>  		return -EINVAL;
> @@ -918,12 +912,9 @@ static int 
> dp_link_process_phy_test_pattern_request(
>  	link->dp_link.link_params.rate =
>  		drm_dp_bw_code_to_link_rate(link->request.test_link_rate);
> 
> -	ret = dp_link_parse_vx_px(link);
> -
> -	if (ret)
> -		DRM_ERROR("parse_vx_px failed. ret=%d\n", ret);
> +	dp_link_parse_vx_px(link);
> 
> -	return ret;
> +	return 0;
>  }
> 
>  static u8 get_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], 
> int r)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
